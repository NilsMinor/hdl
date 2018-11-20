# Nils Minor 01.08.2018

set_property -dict {PACKAGE_PIN  AA14   IOSTANDARD LVCMOS25} [get_ports ddr3_pl_init_calib]      ;# X1:100  X1_2_307 (4)  output   34  VIO_X1_2     VADJ                       
set_property -dict {PACKAGE_PIN  AA15   IOSTANDARD LVCMOS25} [get_ports ddr3_pl_error]           ;# X1:98   X1_2_306 (3)  output   34  VIO_X1_2     VADJ                       
set_property -dict {PACKAGE_PIN  M7     IOSTANDARD LVCMOS15} [get_ports ddr3_reset_n]            ;# bank 33
set_property -dict {PACKAGE_PIN  C9     IOSTANDARD LVCMOS15} [get_ports sys_rst]                 ;# X2:115 active low 