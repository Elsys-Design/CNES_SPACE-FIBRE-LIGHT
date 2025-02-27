
module extended_phy_layer_clk_wizard_0_0_clocking_Synchronizer3 
  (
    output logic q,
    input logic d, si, se, ck, rn
  );

  timeunit 1ns;
  timeprecision 1ps;


 // RTL model used only for external company  use
    reg [2:0] sync_reg;
    logic  din;
// scan mux logic
     assign din = se ? si : d;

    always @(posedge ck or negedge rn) begin
      if (!rn) begin
        sync_reg <=  3'h0;
      end else begin
        sync_reg <=  {sync_reg[1],sync_reg[0], din};
      end
    end
 
  assign q = sync_reg[2];
endmodule
