source $ad_hdl_dir/library/jesd204/scripts/jesd204.tcl

# adc peripherals

ad_ip_instance axi_adxcvr axi_ad9680_xcvr                                       ;# call axi_adxcvr for setup
ad_ip_parameter axi_ad9680_xcvr CONFIG.NUM_OF_LANES 4                           ;# number of rx lanes
ad_ip_parameter axi_ad9680_xcvr CONFIG.QPLL_ENABLE 0                            ;# 0 to disable, 1 to enable
ad_ip_parameter axi_ad9680_xcvr CONFIG.TX_OR_RX_N 0                             ;# 0 for RX, 1 for TX

adi_axi_jesd204_rx_create axi_ad9680_jesd 4                                     ;# number of rx lanes

ad_ip_instance axi_ad9680 axi_ad9680_core                                       ;# add ad9680 IP core

ad_ip_instance util_cpack axi_ad9680_cpack                                      ;# add cpack IP 
ad_ip_parameter axi_ad9680_cpack CONFIG.CHANNEL_DATA_WIDTH 64                   ;# cpack channel data width
ad_ip_parameter axi_ad9680_cpack CONFIG.NUM_OF_CHANNELS 2                       ;# number of channels (1 ADC = 2 possible channels)

ad_ip_instance axi_dmac axi_ad9680_dma                                          ;# add axi dma IP         
ad_ip_parameter axi_ad9680_dma CONFIG.DMA_TYPE_SRC 1                            ;# 
ad_ip_parameter axi_ad9680_dma CONFIG.DMA_TYPE_DEST 0                           ;#
ad_ip_parameter axi_ad9680_dma CONFIG.ID 0                                      ;#
ad_ip_parameter axi_ad9680_dma CONFIG.AXI_SLICE_SRC 0                           ;#
ad_ip_parameter axi_ad9680_dma CONFIG.AXI_SLICE_DEST 0                          ;#
ad_ip_parameter axi_ad9680_dma CONFIG.SYNC_TRANSFER_START 1                     ;#
ad_ip_parameter axi_ad9680_dma CONFIG.DMA_LENGTH_WIDTH 24                       ;#
ad_ip_parameter axi_ad9680_dma CONFIG.DMA_2D_TRANSFER 0                         ;#
ad_ip_parameter axi_ad9680_dma CONFIG.CYCLIC 0                                  ;#
ad_ip_parameter axi_ad9680_dma CONFIG.DMA_DATA_WIDTH_SRC 64                     ;#
ad_ip_parameter axi_ad9680_dma CONFIG.DMA_DATA_WIDTH_DEST 64                    ;#

# shared transceiver core

ad_ip_instance util_adxcvr util_daq2_xcvr                                       ;# add util_adxcvr IP core
ad_ip_parameter util_daq2_xcvr CONFIG.RX_NUM_OF_LANES 4                         ;# number of RX lanes (4 per ADC)
ad_ip_parameter util_daq2_xcvr CONFIG.TX_NUM_OF_LANES 0                         ;# number of TX lanes


ad_connect  sys_cpu_resetn util_daq2_xcvr/up_rstn
ad_connect  sys_cpu_clk util_daq2_xcvr/up_clk

# reference clocks & resets
create_bd_port -dir I rx_ref_clk_0                                              ;# create clock port
# The QPLL was used for TX only
ad_xcvrpll  rx_ref_clk_0 util_daq2_xcvr/cpll_ref_clk_*                          ;# connect rx_ref_clk_0 >> cpll_ref_clk_*
ad_xcvrpll  axi_ad9680_xcvr/up_pll_rst util_daq2_xcvr/up_cpll_rst_*             ;# connect (axi_ad9680_xcvr) up_pll_rst >> up_cpll_rst_* (util_daq2_xcvr)

# connections (adc)

ad_xcvrcon  util_daq2_xcvr axi_ad9680_xcvr axi_ad9680_jesd                      ;# connect ?
ad_connect  util_daq2_xcvr/rx_out_clk_0 axi_ad9680_core/rx_clk                  ;# connect (util_daq2_xcvr) rx_out_clk_0 >> rx_clk (axi_ad9680_core)
ad_connect  util_daq2_xcvr/rx_out_clk_0 axi_ad9680_fifo/adc_clk                 ;# connect (util_daq2_xcvr) rx_out_clk_0 >> adc_clk (axi_ad9680_fifo)
ad_connect  util_daq2_xcvr/rx_out_clk_0 axi_ad9680_cpack/adc_clk                ;# connect (util_daq2_xcvr) rx_out_clk_0 >> adc_clk (axi_ad9680_cpack)

ad_connect  axi_ad9680_jesd/rx_sof axi_ad9680_core/rx_sof       
ad_connect  axi_ad9680_jesd/rx_data_tdata axi_ad9680_core/rx_data
ad_connect  axi_ad9680_jesd_rstgen/peripheral_reset axi_ad9680_cpack/adc_rst
ad_connect  axi_ad9680_core/adc_enable_0 axi_ad9680_cpack/adc_enable_0
ad_connect  axi_ad9680_core/adc_valid_0 axi_ad9680_cpack/adc_valid_0
ad_connect  axi_ad9680_core/adc_data_0 axi_ad9680_cpack/adc_data_0
ad_connect  axi_ad9680_core/adc_enable_1 axi_ad9680_cpack/adc_enable_1
ad_connect  axi_ad9680_core/adc_valid_1 axi_ad9680_cpack/adc_valid_1
ad_connect  axi_ad9680_core/adc_data_1 axi_ad9680_cpack/adc_data_1
ad_connect  axi_ad9680_jesd_rstgen/peripheral_reset axi_ad9680_fifo/adc_rst
ad_connect  axi_ad9680_cpack/adc_valid axi_ad9680_fifo/adc_wr
ad_connect  axi_ad9680_cpack/adc_data axi_ad9680_fifo/adc_wdata
ad_connect  sys_cpu_clk axi_ad9680_fifo/dma_clk
ad_connect  sys_cpu_clk axi_ad9680_dma/s_axis_aclk
ad_connect  sys_cpu_resetn axi_ad9680_dma/m_dest_axi_aresetn
ad_connect  axi_ad9680_fifo/dma_wr axi_ad9680_dma/s_axis_valid
ad_connect  axi_ad9680_fifo/dma_wdata axi_ad9680_dma/s_axis_data
ad_connect  axi_ad9680_fifo/dma_wready axi_ad9680_dma/s_axis_ready
ad_connect  axi_ad9680_fifo/dma_xfer_req axi_ad9680_dma/s_axis_xfer_req
ad_connect  axi_ad9680_core/adc_dovf axi_ad9680_fifo/adc_wovf

# interconnect (cpu)

ad_cpu_interconnect 0x44A50000 axi_ad9680_xcvr
ad_cpu_interconnect 0x44A10000 axi_ad9680_core
ad_cpu_interconnect 0x44AA0000 axi_ad9680_jesd
ad_cpu_interconnect 0x7c400000 axi_ad9680_dma

# gt uses hp3, and 100MHz clock for both DRP and AXI4

ad_mem_hp3_interconnect sys_cpu_clk sys_ps7/S_AXI_HP3
ad_mem_hp3_interconnect sys_cpu_clk axi_ad9680_xcvr/m_axi

# interconnect (mem/dac)

#ad_mem_hp1_interconnect sys_cpu_clk sys_ps7/S_AXI_HP1
ad_mem_hp2_interconnect sys_cpu_clk sys_ps7/S_AXI_HP2
ad_mem_hp2_interconnect sys_cpu_clk axi_ad9680_dma/m_dest_axi

# interrupts

ad_cpu_interrupt ps-11 mb-14 axi_ad9680_jesd/irq
ad_cpu_interrupt ps-13 mb-12 axi_ad9680_dma/irq

