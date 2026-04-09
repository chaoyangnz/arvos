proc unmatched_apply_debug_tweaks {} {
    if {[info exists ::ADAPTER_KHZ] && $::ADAPTER_KHZ ne ""} {
        adapter speed $::ADAPTER_KHZ
        echo "adapter speed: $::ADAPTER_KHZ kHz"
    }

    if {[info exists ::TDO_SAMPLE_EDGE] && $::TDO_SAMPLE_EDGE eq "falling"} {
        ftdi tdo_sample_edge falling
        echo "ftdi samples TDO on falling edge of TCK"
    }
}

proc jtag_init {} {
    unmatched_apply_debug_tweaks
    jtag arp_init
}

proc init_reset {mode} {
    echo "unmatched init_reset mode=$mode"
    unmatched_apply_debug_tweaks
    jtag arp_init
}

proc unmatched_probe {} {
    scan_chain
    targets
}

proc unmatched_reset_halt {} {
    reset halt
    targets
    echo "Target halted after reset"
}

proc unmatched_reset_run {} {
    echo "Attempting experimental resume"
    catch {halt}
    sleep 50
    resume
}
