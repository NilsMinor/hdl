

set_property  -dict {PACKAGE_PIN C4  IOSTANDARD LVCMOS15} [get_ports rgb_led_0[0]]          ;# red     bank 34 X2_2_3[0]
set_property  -dict {PACKAGE_PIN C3  IOSTANDARD LVCMOS15} [get_ports rgb_led_0[1]]          ;# green   bank 34 X2_2_3[1]
set_property  -dict {PACKAGE_PIN B5  IOSTANDARD LVCMOS15} [get_ports rgb_led_0[2]]          ;# blue    bank 34 X2_2_3[2]
set_property  -dict {PACKAGE_PIN B4  IOSTANDARD LVCMOS15} [get_ports rgb_led_1[0]]          ;# green   bank 34 X2_2_3[3]
set_property  -dict {PACKAGE_PIN B6  IOSTANDARD LVCMOS15} [get_ports rgb_led_1[1]]          ;# blue    bank 34 X2_2_3[4]
set_property  -dict {PACKAGE_PIN A5  IOSTANDARD LVCMOS15} [get_ports rgb_led_2[0]]          ;# green   bank 34 X2_2_3[5]
set_property  -dict {PACKAGE_PIN A4  IOSTANDARD LVCMOS15} [get_ports rgb_led_2[1]]          ;# blue    bank 34 X2_2_3[6]

#set_property  -dict {PACKAGE_PIN C9  IOSTANDARD LVCMOS18} [get_ports PS_reset_in]]            ;# reset FX10 > FPGA  X2_2_2[4]

set_property  -dict {PACKAGE_PIN K12 IOSTANDARD LVCMOS15} [get_ports {module_led[0]}]       ;# USR_LED_1 only on module, not on FX available
set_property  -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS15} [get_ports {module_led[1]}]       ;# USR_LED_2 only on module, not on FX available
set_property  -dict {PACKAGE_PIN K10 IOSTANDARD LVCMOS15} [get_ports {module_led[2]}]       ;# USR_LED_3 only on module, not on FX available
set_property  -dict {PACKAGE_PIN K11 IOSTANDARD LVCMOS15} [get_ports {module_led[3]}]       ;# USR_LED_4 only on module, not on FX available
#set_property  -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS15} [get_ports {cfg_okn}]            ;# X2:116 


