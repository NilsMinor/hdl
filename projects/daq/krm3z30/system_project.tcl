


source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project_xilinx daq_krm3z30
adi_project_files daq_krm3z30 [list \
  "../common/krm3z30_spi.v" \
  "system_top.v" \
  "system_constr.xdc"\
  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v" \
  "$ad_hdl_dir/projects/common/krm3z30/krm3z30_plddr3_constr.xdc" \
  "$ad_hdl_dir/projects/common/krm3z30/krm3z30_system_constr.xdc" ]

adi_project_run daq_krm3z30


