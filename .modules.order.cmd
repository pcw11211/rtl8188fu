cmd_/root/rtl8188fu-arm/modules.order := {   echo /root/rtl8188fu-arm/rtl8188fu.ko; :; } | awk '!x[$$0]++' - > /root/rtl8188fu-arm/modules.order
