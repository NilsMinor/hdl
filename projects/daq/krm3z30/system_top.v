// *********************************************************************************
// *********************************************************************************
// Rewritten system_top.v file by Nils Minor for project >DAQ< as part of my      //
// masterthesis (01.06.2018 - 01.12.2018).                                        //
//                                                                                //
// Includes informations of the daq2 project of ADI and the KRM-project template  //
// ....
// *********************************************************************************
// *********************************************************************************

`timescale 1ns/100ps

module system_top (

  // PS-DDR connections 1 GB 
  inout       [14:0]      ddr_addr,
  inout       [ 2:0]      ddr_ba,
  inout                   ddr_cas_n,
  inout                   ddr_ck_n,
  inout                   ddr_ck_p,
  inout                   ddr_cke,
  inout                   ddr_cs_n,
  inout       [ 3:0]      ddr_dm,
  inout       [31:0]      ddr_dq,
  inout       [ 3:0]      ddr_dqs_n,
  inout       [ 3:0]      ddr_dqs_p,
  inout                   ddr_odt,
  inout                   ddr_ras_n,
  inout                   ddr_reset_n,
  inout                   ddr_we_n,

  // PS fixed connections
  inout                   fixed_io_ddr_vrn,
  inout                   fixed_io_ddr_vrp,
  inout       [53:0]      fixed_io_mio,
  inout                   fixed_io_ps_clk,
  inout                   fixed_io_ps_porb,
  inout                   fixed_io_ps_srstb,
  
  //inout       [14:0]      gpio_bd,            // is used for LEDs, switches etc.

  input                   sys_rst,
  input                   sys_clk_p,
  input                   sys_clk_n,


  // PL-DDR connections 16 Bit 256 MB, only 128 bit write instructions
  output      [13:0]      ddr3_addr,            // DDR3_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
  output      [ 2:0]      ddr3_ba,              // DDR3_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
  output                  ddr3_cas_n,           // DDR3_cas_n : out STD_LOGIC;
  output      [ 0:0]      ddr3_ck_n,            // DDR3_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
  output      [ 0:0]      ddr3_ck_p,            // DDR3_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
  output      [ 0:0]      ddr3_cke,             // DDR3_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
  //output      [ 0:0]      ddr3_cs_n,            // not supported on KRM moduele
  //output      [ 7:0]      ddr3_dm,              // not supported on KRM moduele
  inout       [15:0]      ddr3_dq,              // DDR3_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );    | before [63:0]
  inout       [ 1:0]      ddr3_dqs_n,           // DDR3_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );  | before [7:0]
  inout       [ 1:0]      ddr3_dqs_p,           // DDR3_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );  | before [7:0]
  output      [ 0:0]      ddr3_odt,             // DDR3_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
  output                  ddr3_ras_n,           // DDR3_ras_n : out STD_LOGIC;
  output                  ddr3_reset_n,         // DDR3_reset_n : out STD_LOGIC;
  output                  ddr3_we_n,            // DDR3_we_n : out STD_LOGIC;  
  
  output                  ddr3_pl_init_calib,
  output                  ddr3_pl_error,         

  input                   rx_ref_clk_p,         // FPGA reference clock (syncronisation) 7.8125 MHz
  input                   rx_ref_clk_n,         //
  input                   rx_sysref_p,          // FPGA system clock (250 MHz or 500 MHz ??)
  input                   rx_sysref_n,          //
  output                  rx_sync_p,            // ADC sync signal
  output                  rx_sync_n,            // 
  input       [ 3:0]      rx_data_p,            // SERDES data lanes
  input       [ 3:0]      rx_data_n,            //

  // input                   trig_p,               // externer trigger eingänge
  // input                   trig_n,               // 

  inout                   adc_fdb,              // ADC fast-detection chanel b
  inout                   adc_fda,              // ADC fast-detection chanel a
  inout                   adc_pd,               // ADC Power Down

  output                  spi_csn_adc,          // SPI chip select adc
  output                  spi_csn_clk,          // SPI chip select clock
  output                  spi_clk,              // SPI sclk
  inout                   spi_sdio,             // SPI data
  
  output      [2:0]       rgb_led_0,
  output      [1:0]       rgb_led_1,
  output      [1:0]       rgb_led_2, 
  output      [3:0]       module_led
  );            

  // internal signals
  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;
  wire    [ 1:0]  spi0_csn;
  wire            spi0_clk;
  wire            spi0_mosi;
  wire            spi0_miso;
  wire            trig;
  wire            rx_ref_clk;
  wire            rx_sysref;
  wire            rx_sync;
  wire    [ 1:0]  ddr3_dm_unused; 
  
  
  // ====================================================
  /*
  always @ (posedge FCLK_CLK1) begin
    MMCM_LOCKED_d0 <= MMCM_LOCKED;
        if (reset_armed == 1'b1 && MMCM_LOCKED_d0 == 1'b0 && MMCM_LOCKED == 1'b1 ) begin
            sys_rst_counter <= 9181;
            sys_rst_w <= 1'b0;
        end 
  end
  
  assign sys_rst = sys_rst_w;
  */
  // ====================================================
  
    
 
  assign ddr3_dm_unused = 2'd0;
  assign rgb_led_0 = 3'b101;
   
  // spi
  assign spi_clk = spi0_clk; 
  assign spi_csn_clk = spi0_csn[0]; 
  assign spi_csn_adc = spi0_csn[1];
  
  // instantiations
  IBUFDS_GTE2 i_ibufds_rx_ref_clk (
    .CEB (1'd0),
    .I (rx_ref_clk_p),
    .IB (rx_ref_clk_n),
    .O (rx_ref_clk),
    .ODIV2 ());

  IBUFDS i_ibufds_rx_sysref (
    .I (rx_sysref_p),
    .IB (rx_sysref_n),
    .O (rx_sysref));

  OBUFDS i_obufds_rx_sync (
    .I (rx_sync),
    .O (rx_sync_p),
    .OB (rx_sync_n));

  krm3z30_spi i_spi (
    .spi_csn (spi0_csn),
    .spi_clk (spi_clk),
    .spi_mosi (spi0_mosi),
    .spi_miso (spi0_miso),
    .spi_sdio (spi_sdio));
    
  //IBUFDS i_ibufds_trig (
  //  .I (trig_p),
  //  .IB (trig_n),
  //  .O (trig));
  //assign gpio_i[43] = trig;
  
  ad_iobuf #(.DATA_WIDTH(3)) i_iobuf (
    .dio_t ({gpio_t[42], gpio_t[36], gpio_t[35]}),
    .dio_i ({gpio_o[42], gpio_o[36], gpio_o[35]}),
    .dio_o ({gpio_i[42], gpio_i[36], gpio_i[35]}),
    .dio_p ({ adc_pd,           // 42
              adc_fdb,          // 36
              adc_fda}));       // 35
              
  //ad_iobuf #(.DATA_WIDTH(15)) i_iobuf_bd (
  //  .dio_t (gpio_t[14:0]),
  //  .dio_i (gpio_o[14:0]),
  //  .dio_o (gpio_i[14:0]),
  //  .dio_p (gpio_bd));

  system_wrapper i_system_wrapper (
    .ddr3_addr (ddr3_addr),
    .ddr3_ba (ddr3_ba),
    .ddr3_cas_n (ddr3_cas_n),
    .ddr3_ck_n (ddr3_ck_n),
    .ddr3_ck_p (ddr3_ck_p),
    .ddr3_cke (ddr3_cke),
    .ddr3_dq (ddr3_dq),
    .ddr3_dqs_n (ddr3_dqs_n),
    .ddr3_dqs_p (ddr3_dqs_p),
    .ddr3_odt (ddr3_odt),
    .ddr3_ras_n (ddr3_ras_n),
    .ddr3_reset_n (ddr3_reset_n),
    .ddr3_we_n (ddr3_we_n),
    .ddr3_dm (ddr3_dm_unused),
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_cas_n (ddr_cas_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
    .ddr_cs_n (ddr_cs_n),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_dq (ddr_dq),
    .ddr_dm (ddr_dm),
    .ddr_odt (ddr_odt),
    .ddr_ras_n (ddr_ras_n),
    .ddr_reset_n (ddr_reset_n),
    .ddr_we_n (ddr_we_n),
    .fixed_io_ddr_vrn (fixed_io_ddr_vrn),
    .fixed_io_ddr_vrp (fixed_io_ddr_vrp),
    .fixed_io_mio (fixed_io_mio),
    .fixed_io_ps_clk (fixed_io_ps_clk),
    .fixed_io_ps_porb (fixed_io_ps_porb),
    .fixed_io_ps_srstb (fixed_io_ps_srstb),
    .rx_data_0_n (rx_data_n[0]),
    .rx_data_0_p (rx_data_p[0]),
    .rx_data_1_n (rx_data_n[1]),
    .rx_data_1_p (rx_data_p[1]),
    .rx_data_2_n (rx_data_n[2]),
    .rx_data_2_p (rx_data_p[2]),
    .rx_data_3_n (rx_data_n[3]),
    .rx_data_3_p (rx_data_p[3]),
    .rx_ref_clk_0 (rx_ref_clk),
    .rx_sync_0 (rx_sync),
    .rx_sysref_0 (rx_sysref),
    .spi0_clk_i (spi0_clk),
    .spi0_clk_o (spi0_clk),
    .spi0_csn_0_o (spi0_csn[0]),
    .spi0_csn_1_o (spi0_csn[1]),
    .spi0_csn_i (1'b1),
    .spi0_sdi_i (spi0_miso),
    .spi0_sdo_i (spi0_mosi),
    .spi0_sdo_o (spi0_mosi),
    .sys_rst (sys_rst));

endmodule

// ***************************************************************************



// ***************************************************************************
