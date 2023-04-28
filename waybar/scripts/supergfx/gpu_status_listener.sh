#!/usr/bin/dash
# script by vlk

_get_icon () {
    case "$1" in
        0) echo '{"text":"Active","class":"active"}'
        ;; 1) echo '{"text":"Suspended","class":"suspended"}'
        ;; 2) echo '{"text":"Off","class":"off"}'
        ;; 3) echo '{"text":"dGPU Disabled","class":"disabled"}'
        ;; 4) echo '{"text":"Discrete MUX","class":"mux"}'
        ;;
    esac
}

case "$(supergfxctl -S)" in
    active) _get_icon 0
    ;; suspended) _get_icon 1
    ;; off) _get_icon 2
    ;; dgpu_disabled) _get_icon 3
    ;; asus_mux_discreet) _get_icon 4
    ;;
esac

sudo dbus-monitor --system "type='signal',interface='org.supergfxctl.Daemon',member='NotifyGfxStatus'" | while read -r line; do
    _get_icon "${line##* }"
done
