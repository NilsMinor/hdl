####################################################################################
####################################################################################
## Rewritten by Nils Minor for the DAQ project (11.07.2018). 					 ##
####################################################################################
####################################################################################

PROJECT_NAME := daq_krm3z30

M_DEPS += ../common/krm3z30_spi.v
M_DEPS += ../common/krm3z30_bd.tcl
M_DEPS += ../../common/krm3z30/krm3z30_system_constr.xdc
M_DEPS += ../../common/krm3z30/krm3z30_system_bd.tcl
M_DEPS += ../../common/krm3z30/krm3z30_plddr3_constr.xdc
M_DEPS += ../../common/krm3z30/krm3z30_plddr3_adcfifo_bd.tcl
M_DEPS += ../../../library/xilinx/common/ad_iobuf.v
M_DEPS += ../../../library/jesd204/scripts/jesd204.tcl

LIB_DEPS += axi_ad9680
LIB_DEPS += axi_clkgen
LIB_DEPS += axi_dmac
LIB_DEPS += jesd204/axi_jesd204_rx
LIB_DEPS += jesd204/jesd204_rx
LIB_DEPS += util_cpack
LIB_DEPS += xilinx/axi_adcfifo
LIB_DEPS += xilinx/axi_adxcvr
LIB_DEPS += xilinx/util_adxcvr

include ../../scripts/project-xilinx.mk
