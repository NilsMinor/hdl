# create board design
# default ports

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr
create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 fixed_io

# SPI
create_bd_port -dir O spi0_csn_1_o
create_bd_port -dir O spi0_csn_0_o
create_bd_port -dir I spi0_csn_i
create_bd_port -dir I spi0_clk_i
create_bd_port -dir O spi0_clk_o
create_bd_port -dir I spi0_sdo_i
create_bd_port -dir O spi0_sdo_o
create_bd_port -dir I spi0_sdi_i

# interrupts
#create_bd_port -dir I -type intr ps_intr_11     ;# axi_ad9680_jesd/irq
#create_bd_port -dir I -type intr ps_intr_13     ;# axi_ad9680_dma/irq

create_bd_port -dir I -from 63 -to 0 gpio_i
create_bd_port -dir O -from 63 -to 0 gpio_o
create_bd_port -dir O -from 63 -to 0 gpio_t

# instance: sys_ps7
ad_ip_instance processing_system7 sys_ps7
ad_ip_parameter sys_ps7 CONFIG.PCW_TTC0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK2_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST2_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0       ;# 100
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ 200.0       ;# 50
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ 200.0       ;# 50
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_FABRIC_INTERRUPT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_INTR 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_IO 64
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_DMA0 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_MODE REVERSE
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_SPI0_IO EMIO

ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_ENABLE {1}
ad_ip_parameter sys_ps7 CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL}
ad_ip_parameter sys_ps7 CONFIG.PCW_DDR_RAM_BASEADDR {0x00100000}
ad_ip_parameter sys_ps7 CONFIG.PCW_DDR_RAM_HIGHADDR {0x3FFFFFFF}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.075}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.076}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.082}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.100}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.005}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {-0.004}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.008}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.058}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_AL {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BL {8}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.537}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.442}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.464}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.521}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {470.0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {470.0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {470.0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {470.0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {504}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {495}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {520}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {835}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.271}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.133}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.089}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.248}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {465}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {480}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {550}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {780}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333333}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {0}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1}
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_DDR_BYPASS {0}


ad_ip_instance xlconcat sys_concat_intc
ad_ip_parameter sys_concat_intc CONFIG.NUM_PORTS 16

ad_ip_instance proc_sys_reset sys_rstgen
ad_ip_parameter sys_rstgen CONFIG.C_EXT_RST_WIDTH 1


# system reset/clock definitions
ad_connect  sys_cpu_clk sys_ps7/FCLK_CLK0
ad_connect  sys_200m_clk sys_ps7/FCLK_CLK1
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N
# Stimmt das so????
#ad_connect  sys_cpu_clk sys_ps7/M_AXI_GP0_ACLK
ad_connect  sys_cpu_clk sys_ps7/DMA0_ACLK

# interface connections
ad_connect  ddr sys_ps7/DDR
ad_connect  gpio_i sys_ps7/GPIO_I
ad_connect  gpio_o sys_ps7/GPIO_O
ad_connect  gpio_t sys_ps7/GPIO_T
ad_connect  fixed_io sys_ps7/FIXED_IO

# spi connections
#ad_connect  spi0_csn_2_o sys_ps7/SPI0_SS2_O
ad_connect  spi0_csn_1_o sys_ps7/SPI0_SS1_O
ad_connect  spi0_csn_0_o sys_ps7/SPI0_SS_O
ad_connect  spi0_csn_i sys_ps7/SPI0_SS_I
ad_connect  spi0_clk_i sys_ps7/SPI0_SCLK_I
ad_connect  spi0_clk_o sys_ps7/SPI0_SCLK_O
ad_connect  spi0_sdo_i sys_ps7/SPI0_MOSI_I
ad_connect  spi0_sdo_o sys_ps7/SPI0_MOSI_O
ad_connect  spi0_sdi_i sys_ps7/SPI0_MISO_I

# custom connections
#create_bd_port -dir O -from 2 -to 0 rgb_led_0 

# interrupts
ad_connect  sys_concat_intc/dout sys_ps7/IRQ_F2P
ad_connect  sys_concat_intc/In15 GND
ad_connect  sys_concat_intc/In14 GND
ad_connect  sys_concat_intc/In13 GND
ad_connect  sys_concat_intc/In11 GND
ad_connect  sys_concat_intc/In12 GND
ad_connect  sys_concat_intc/In10 GND
ad_connect  sys_concat_intc/In9 GND
ad_connect  sys_concat_intc/In8 GND
ad_connect  sys_concat_intc/In7 GND
ad_connect  sys_concat_intc/In6 GND
ad_connect  sys_concat_intc/In5 GND
ad_connect  sys_concat_intc/In4 GND
ad_connect  sys_concat_intc/In3 GND
ad_connect  sys_concat_intc/In2 GND
ad_connect  sys_concat_intc/In1 GND
ad_connect  sys_concat_intc/In0 GND







