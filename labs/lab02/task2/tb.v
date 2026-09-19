module tb;

  // Inputs and outputs
  reg  [1:0] t_sel;
  wire [7:0] t_dout;

  // Instantiate DUT
  lut DUT (
    .sel(t_sel),
    .dout(t_dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // Test all four LUT addresses
    t_sel = 0;
    #5 t_sel = 1;
    #5 t_sel = 2;
    #5 t_sel = 3;
    #5 $finish;
  end

  initial
    $monitor($time, " sel=%b | dout=%b (%d)", t_sel, t_dout, t_dout);

endmodule