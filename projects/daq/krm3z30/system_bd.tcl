
set adc_fifo_name axi_ad9680_fifo
set adc_fifo_address_width 16
set adc_data_width 128
set adc_dma_data_width 64

source $ad_hdl_dir/projects/common/krm3z30/krm3z30_system_bd.tcl
source $ad_hdl_dir/projects/common/krm3z30/krm3z30_plddr3_adcfifo_bd.tcl
source ../common/krm3z30_bd.tcl

