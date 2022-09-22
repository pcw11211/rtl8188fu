cmd_/root/rtl8188fu-arm/Module.symvers := sed 's/\.ko$$/\.o/' /root/rtl8188fu-arm/modules.order | scripts/mod/modpost -m -a  -o /root/rtl8188fu-arm/Module.symvers -e -i Module.symvers   -T -
