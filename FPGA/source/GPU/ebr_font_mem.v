/******************************************************************************
Copyright 2017 Gnarly Grey LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
******************************************************************************/

module ebr_font_mem (
  input           clk,
  input  [10:0]   addr,
  output [7:0]    data
  );

  reg    [7:0]    data_reg;
  wire   [7:0]    data_int[2:0];
  wire   [2:0]    read_en = {(addr[10:9] == 2'b10), (addr[10:9] == 2'b01), (addr[10:9] == 2'b00)};  
  assign          data = data_reg;
  
  
  always @ (*)
    begin
      case (addr[10:9])
        5'd0    : data_reg <= data_int[0] ;
        5'd1    : data_reg <= data_int[1] ;
        5'd2    : data_reg <= data_int[2] ;
        default : data_reg <= data_int[0] ;      
      endcase
    end    
  
  SB_RAM512x8 font0 (
    .RDATA (data_int[0]),
    .RADDR (addr[8:0]),
    .RCLK  (clk),
    .RCLKE (read_en[0]),
    .RE    (read_en[0]),
    .WADDR (9'h000),
    .WCLK  (1'b0),
    .WCLKE (1'b0),
    .WDATA (8'h00),
    .WE    (1'b0)
  );  
  defparam font0.INIT_0 = 256'h5E1C1C577D571C183C7E3C181C3E7C3E1C3E6B4F6B3E3E5B4F5B3E0000000000;
  defparam font0.INIT_1 = 256'h297929260E063A4830FFE7DBE7FF0018241800FFE7C3E7FF00183C18001C5E7F;
  defparam font0.INIT_2 = 256'h5F14227F22147F3E1C1C08081C1C3E7F5A3CE73C5A3F25057F400705057F4026;
  defparam font0.INIT_3 = 256'h7E201008047E040894A2FFA29460606060606A958966007F017F09065F5F005F;
  defparam font0.INIT_4 = 256'h060E3E0E0630383E38300C1E0C1E0C101010101E08082A1C08081C2A08081020;
  defparam font0.INIT_5 = 256'h49366264081323122A7F2A24147F147F14000700070000005F00000000000000;
  defparam font0.INIT_6 = 256'h3070800008083E08082A1C7F1C2A001C2241000041221C000003070800502056;
  defparam font0.INIT_7 = 256'h21464949497200407F42003E4549513E02040810200060600000080808080800;
  defparam font0.INIT_8 = 256'h494946364949493607091121413149494A3C3945454527107F121418334D4941;
  defparam font0.INIT_9 = 256'h0609590102081422410014141414144122140800000034400000001400001E29;
  defparam font0.INIT_A = 256'h097F414949497F3E4141417F224141413E364949497F7C1211127C4E595D413E;
  defparam font0.INIT_B = 256'h4040407F412214087F013F41402000417F41007F0808087F735141413E010909;
  defparam font0.INIT_C = 256'h26462919097F5E2151413E060909097F3E4141413E7F1008047F7F021C027F40;
  defparam font0.INIT_D = 256'h78040363140814633F4038403F1F2040201F3F4040403F03017F010332494949;
  defparam font0.INIT_E = 256'h404040404004020102047F4141410020100804024141417F00434D4959610304;
  defparam font0.INIT_F = 256'h080018545454387F284444382844444438384444287F40785454200008070300; 

  SB_RAM512x8 font1 (
    .RDATA (data_int[1]),
    .RADDR (addr[8:0]),
    .RCLK  (clk),
    .RCLKE (read_en[1]),
    .RE    (read_en[1]),
    .WADDR (9'h000),
    .WCLK  (1'b0),
    .WCLKE (1'b0),
    .WDATA (8'h00),
    .WE    (1'b0)
  );  
  defparam font1.INIT_0 = 256'h407F4100004428107F003D40402000407D4400780404087F789CA4A41802097E;
  defparam font1.INIT_1 = 256'h48080404087CFC1824241818242418FC3844444438780404087C780478047C00;
  defparam font1.INIT_2 = 256'h90904C44281028443C4030403C1C2040201C7C2040403C24443F040424545454;
  defparam font1.INIT_3 = 256'h3C2623263C0204020102000836410000007700000041360800444C5464447C90;
  defparam font1.INIT_4 = 256'h542040785455214278545422417955552159555454387A2040403A1261A1A11E;
  defparam font1.INIT_5 = 256'h7D450200417C4500005854545539595454543959555555391272521E0C407955;
  defparam font1.INIT_6 = 256'h32497F090A7C547C545420004555547CF0282528F07D1211127D407C45010042;
  defparam font1.INIT_7 = 256'h42423D7DA0A09D00782040423A7A2141413A3048484A323A4444443A32494949;
  defparam font1.INIT_8 = 256'h03097E88C020F62909FF2B2FFC2F2B6643497E482424FF243C3D4040403D3D42;
  defparam font1.INIT_9 = 256'h29267D31190D7D720A0A7A007A22404038324A484830417D4400004179545420;
  defparam font1.INIT_A = 256'h3428102FBAACC8102F3808080808080808083820404D48302629292926282F29;
  defparam font1.INIT_B = 256'h00FF55FF55FFAA55AA55AA550055005508142A142222142A140800007B0000FA;
  defparam font1.INIT_C = 256'hF7141400FC141414F010F01010FF00FF101000FF14141400FF10101000FF0000;
  defparam font1.INIT_D = 256'h00F0101010001F1414141F101F10101F10171414FC04F41414FF00FF0000FF00;
  defparam font1.INIT_E = 256'h000010FF101010101010101010FF00000010F0101010101F101010101F000000;
  defparam font1.INIT_F = 256'h00FF0000F404F414141710171414F404FC000017101F0000FF00FF000014FF00; 

  SB_RAM512x8 font2 (
    .RDATA (data_int[2]),
    .RADDR (addr[8:0]),
    .RCLK  (clk),
    .RCLKE (read_en[2]),
    .RE    (read_en[2]),
    .WADDR (9'h000),
    .WCLK  (1'b0),
    .WCLKE (1'b0),
    .WDATA (8'h00),
    .WE    (1'b0)
  );  
  defparam font2.INIT_0 = 256'h00F010F0101014F41414141F101F10101417141414F700F714141414141414F7;
  defparam font2.INIT_1 = 256'h10101014FF141414FF10FF1010F010F0000014FC000000141F0000001F101F00;
  defparam font2.INIT_2 = 256'h0F0F0F0F0FFFFF0000000000FFFFFFF0F0F0F0F0FFFFFFFFFF10F0000000001F;
  defparam font2.INIT_3 = 256'h7E40043C4444386341495563027E027E02060602027E344A4A4AFC4438444438;
  defparam font2.INIT_4 = 256'h48784830304D4D4A304C7201724C1C2A492A1C99A5E7A59902027E0206201E20;
  defparam font2.INIT_5 = 256'h4040444A514044445F44442A2A2A2A2A7E0101017E004949493E3D465A62BC30;
  defparam font2.INIT_6 = 256'h180000060F090F063624361236086B6B08080000FF80E00301FF000040514A44;
  defparam font2.INIT_7 = 256'h00000000003C3C3C3C0012171D19001E01011F000101FF403000101000000018;
  defparam font2.INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam font2.INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  
endmodule  