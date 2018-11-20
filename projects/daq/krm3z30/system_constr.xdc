
# DAQ test-constraints for KRM Evaluation board + ad9234ce04b FMC board

# synthesis 26.07.18                    
# critical warnings : 124       
# warnings          : 685
#
# implementation
# errors            : 3
# warnings          : 27




# rx_ref_clk und rx_data polarity have to be swapped !
# JESD204 signals                                                                                       # FMC pin   Direction   IO-bank     vcco
set_property  -dict {PACKAGE_PIN  R6 } [get_ports rx_ref_clk_p]                                         ;# D5       mgt         112
set_property  -dict {PACKAGE_PIN  R5 } [get_ports rx_ref_clk_n]                                         ;# D4       mgt         112
set_property  -dict {PACKAGE_PIN  Y4 } [get_ports rx_data_p[0]]                                         ;# A11      mgt         112
set_property  -dict {PACKAGE_PIN  Y3 } [get_ports rx_data_n[0]]                                         ;# A10      mgt         112
set_property  -dict {PACKAGE_PIN  V4 } [get_ports rx_data_p[1]]                                         ;# A7       mgt         112
set_property  -dict {PACKAGE_PIN  V3 } [get_ports rx_data_n[1]]                                         ;# A6       mgt         112
set_property  -dict {PACKAGE_PIN  AB4} [get_ports rx_data_p[2]]                                         ;# C7       mgt         112
set_property  -dict {PACKAGE_PIN  AB3} [get_ports rx_data_n[2]]                                         ;# C6       mgt         112
set_property  -dict {PACKAGE_PIN  T4 } [get_ports rx_data_p[3]]                                         ;# A3       mgt         112
set_property  -dict {PACKAGE_PIN  T3 } [get_ports rx_data_n[3]]                                         ;# A2       mgt         112

set_property  -dict {PACKAGE_PIN  AE10  IOSTANDARD LVDS_25} [get_ports rx_sync_p]                       ;# H10      output      12 (HR)    VIO_X1_2     VADJ
set_property  -dict {PACKAGE_PIN  AD10  IOSTANDARD LVDS_25} [get_ports rx_sync_n]                       ;# H11      output      12 (HR)    VIO_X1_2     VADJ            
set_property  -dict {PACKAGE_PIN  AC13  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_sysref_p]      ;# H4       input       12 (HR)    VIO_X1_2     VADJ
set_property  -dict {PACKAGE_PIN  AD13  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_sysref_n]      ;# H5       input       12 (HR)    VIO_X1_2     VADJ
  
set_property  -dict {PACKAGE_PIN  Y13   IOSTANDARD LVCMOS25} [get_ports spi_csn_clk]                    ;# C11      output      12 (HR)    VIO_X1_2     VADJ                       
set_property  -dict {PACKAGE_PIN  W13   IOSTANDARD LVCMOS25} [get_ports spi_csn_adc]                    ;# C10      output      12 (HR)    VIO_X1_2     VADJ              
set_property  -dict {PACKAGE_PIN  AE13  IOSTANDARD LVCMOS25} [get_ports spi_clk]                        ;# D8       output      12 (HR)    VIO_X1_2     VADJ   
set_property  -dict {PACKAGE_PIN  AF13  IOSTANDARD LVCMOS25} [get_ports spi_sdio]                       ;# D9        inout      12 (HR)    VIO_X1_2     VADJ
set_property  -dict {PACKAGE_PIN  AF10  IOSTANDARD LVCMOS25} [get_ports adc_pd]                         ;# H8       output      12 (HR)    VIO_X1_2     VADJ
set_property  -dict {PACKAGE_PIN  AE12  IOSTANDARD LVCMOS25} [get_ports adc_fda]                        ;# G9       input       12 (HR)    VIO_X1_2     VADJ
set_property  -dict {PACKAGE_PIN  AF12  IOSTANDARD LVCMOS25} [get_ports adc_fdb]                        ;# G10      input       12 (HR)    VIO_X1_2     VADJ
#set_property  -dict {PACKAGE_PIN  AA22  IOSTANDARD LVCMOS25} [get_ports sys_rst]                        ;# --       input       13 (HR)    VIO_X1_1     VADJ 

# clocks
create_clock -name rx_ref_clk   -period  4.00 [get_ports rx_ref_clk_p]                                  ;# 250 MHz 
create_clock -name rx_div_clk   -period  8.00 [get_pins i_system_wrapper/system_i/util_daq2_xcvr/inst/i_xch_0/i_gtxe2_channel/RXOUTCLK] ;## Linerate / 40 = 5GHz/40 = 125 MHz



# note (*) ###############################################################################################################################################
# On ad9234 eval, sdi and sdo are splitted (SPI) but daq2 uses (SD) means only sdio line
# Connect sdi and sdo together on hardware or assign pins in vhdl ?
#
# Achtung: bei der Nutzung von -dict muss darauf geachtet werden das die Klammern wie folgt aussehen:
# Korrekt : set_property  -dict {PACKAGE_PIN  XX } [get_ports xx_xxxx_x]   
# Falsch  : set_property  -dict {PACKAGE_PIN  XX }[get_ports xx_xxxx_x]    -->  Fehler }[
#
##########################################################################################################################################################
