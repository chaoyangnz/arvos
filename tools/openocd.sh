#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OPENOCD_BIN="${OPENOCD_BIN:-$ROOT/xpacks/.bin/openocd}"
OPENOCD_ROOT="$(cd "$ROOT/xpacks/@xpack-dev-tools/openocd/.content" && pwd)"
OPENOCD_SCRIPTS="${OPENOCD_SCRIPTS:-$OPENOCD_ROOT/openocd/scripts}"
OPENOCD_CFG="${OPENOCD_CFG:-$ROOT/tools/openocd/unmatched-onboard-ftdi.cfg}"
OPENOCD_GDB_PORT="${OPENOCD_GDB_PORT:-3333}"
OPENOCD_TCL_PORT="${OPENOCD_TCL_PORT:-6666}"
OPENOCD_TELNET_PORT="${OPENOCD_TELNET_PORT:-4444}"

FTDI_CHANNEL="${FTDI_CHANNEL:-0}"
ADAPTER_KHZ="${ADAPTER_KHZ:-1000}"
EXPECTED_ID="${EXPECTED_ID:-}"
TDO_SAMPLE_EDGE="${TDO_SAMPLE_EDGE:-}"

usage() {
  cat <<EOF
Usage: ./tools/openocd.sh [serve|probe|reset-run|reset-halt]

Environment overrides:
  OPENOCD_BIN        OpenOCD executable path
  OPENOCD_CFG        OpenOCD config file
  OPENOCD_SCRIPTS    OpenOCD scripts directory
  OPENOCD_GDB_PORT   GDB server port (default: 3333)
  OPENOCD_TCL_PORT   TCL port (default: 6666)
  OPENOCD_TELNET_PORT Telnet port (default: 4444)
  FTDI_CHANNEL       FTDI channel to use (default: 0)
  ADAPTER_KHZ        JTAG clock in kHz (default: 1000)
  EXPECTED_ID        Optional JTAG expected-id override
  TDO_SAMPLE_EDGE    Optional FTDI TDO sample edge override (e.g. falling)

Examples:
  ./tools/openocd.sh probe
  FTDI_CHANNEL=1 ./tools/openocd.sh probe
  ./tools/openocd.sh serve
  ./tools/openocd.sh reset-run
EOF
}

common_args=(
  -s "$OPENOCD_SCRIPTS"
  -f "$OPENOCD_CFG"
  -c "set FTDI_CHANNEL $FTDI_CHANNEL"
  -c "set ADAPTER_KHZ $ADAPTER_KHZ"
  -c "if {\"$EXPECTED_ID\" ne \"\"} { set EXPECTED_ID $EXPECTED_ID }"
  -c "if {\"$TDO_SAMPLE_EDGE\" eq \"falling\"} { ftdi tdo_sample_edge falling }"
  -c "gdb port $OPENOCD_GDB_PORT"
  -c "tcl port $OPENOCD_TCL_PORT"
  -c "telnet_port $OPENOCD_TELNET_PORT"
)

cmd="${1:-serve}"

case "$cmd" in
  serve)
    exec "$OPENOCD_BIN" \
      "${common_args[@]}" \
      -c "init" \
      -c "adapter speed $ADAPTER_KHZ" \
      -c "halt" \
      -c "echo Ready for GDB on port $OPENOCD_GDB_PORT"
    ;;
  probe)
    exec "$OPENOCD_BIN" \
      "${common_args[@]}" \
      -c "init" \
      -c "adapter speed $ADAPTER_KHZ" \
      -c "scan_chain" \
      -c "targets" \
      -c "shutdown"
    ;;
  reset-run)
    exec "$OPENOCD_BIN" \
      "${common_args[@]}" \
      -c "init" \
      -c "adapter speed $ADAPTER_KHZ" \
      -c "reset run" \
      -c "shutdown"
    ;;
  reset-halt)
    exec "$OPENOCD_BIN" \
      "${common_args[@]}" \
      -c "init" \
      -c "adapter speed $ADAPTER_KHZ" \
      -c "reset halt" \
      -c "targets" \
      -c "echo Target halted after reset" \
      -c "shutdown"
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    echo "Unknown command: $cmd" >&2
    usage >&2
    exit 1
    ;;
esac
