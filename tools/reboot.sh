#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OPENOCD_BIN="${OPENOCD_BIN:-$ROOT/xpacks/.bin/openocd}"
OPENOCD_ROOT="$(cd "$ROOT/xpacks/@xpack-dev-tools/openocd/.content" && pwd)"
OPENOCD_SCRIPTS="${OPENOCD_SCRIPTS:-$OPENOCD_ROOT/openocd/scripts}"
OPENOCD_CFG="${OPENOCD_CFG:-$ROOT/tools/openocd/unmatched-onboard-ftdi.cfg}"
OPENOCD_RESET_SCRIPT="${OPENOCD_RESET_SCRIPT:-$ROOT/tools/openocd/unmatched-reset.tcl}"
OPENOCD_SUDO="${OPENOCD_SUDO:-sudo}"
FTDI_CHANNEL="${FTDI_CHANNEL:-0}"
ADAPTER_KHZ="${ADAPTER_KHZ:-500}"
TDO_SAMPLE_EDGE="${TDO_SAMPLE_EDGE:-falling}"

usage() {
  cat <<EOF
Usage: ./tools/reboot.sh [run|halt|probe]

Commands:
  run    Attempt a target reset and resume
  halt   Reset and halt the target
  probe  Probe the target only

Environment overrides:
  OPENOCD_BIN
  OPENOCD_CFG
  OPENOCD_RESET_SCRIPT
  OPENOCD_SCRIPTS
  OPENOCD_SUDO
  FTDI_CHANNEL
  ADAPTER_KHZ
  TDO_SAMPLE_EDGE
EOF
}

cmd="${1:-run}"

common_args=(
  "$OPENOCD_BIN"
  -s "$OPENOCD_SCRIPTS"
  -f "$OPENOCD_CFG"
  -c "set FTDI_CHANNEL $FTDI_CHANNEL"
  -c "set ADAPTER_KHZ $ADAPTER_KHZ"
  -c "set TDO_SAMPLE_EDGE $TDO_SAMPLE_EDGE"
  -c "source $OPENOCD_RESET_SCRIPT"
)

case "$cmd" in
  run)
    exec "$OPENOCD_SUDO" "${common_args[@]}" \
      -c "init" \
      -c "unmatched_reset_run" \
      -c "shutdown"
    ;;
  halt)
    exec "$OPENOCD_SUDO" "${common_args[@]}" \
      -c "init" \
      -c "unmatched_reset_halt" \
      -c "shutdown"
    ;;
  probe)
    exec "$OPENOCD_SUDO" "${common_args[@]}" \
      -c "init" \
      -c "unmatched_probe" \
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
