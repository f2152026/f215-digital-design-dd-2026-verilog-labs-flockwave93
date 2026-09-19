module tb;

  // Inputs and outputs
  reg  [1:0] t_A, t_B;
  wire       t_GT, t_LT, t_EQ;

  // Instantiate DUT
  comp2 DUT (
    .A(t_A),
    .B(t_B),
    .GT(t_GT),
    .LT(t_LT),
    .EQ(t_EQ)
  );

  // Waveform dump configuration
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // Test all 16 combinations

    t_A = 0; t_B = 0;
    #5 t_A = 0; t_B = 1;
    #5 t_A = 0; t_B = 2;
    #5 t_A = 0; t_B = 3;

    #5 t_A = 1; t_B = 0;
    #5 t_A = 1; t_B = 1;
    #5 t_A = 1; t_B = 2;
    #5 t_A = 1; t_B = 3;

    #5 t_A = 2; t_B = 0;
    #5 t_A = 2; t_B = 1;
    #5 t_A = 2; t_B = 2;
    #5 t_A = 2; t_B = 3;

    #5 t_A = 3; t_B = 0;
    #5 t_A = 3; t_B = 1;
    #5 t_A = 3; t_B = 2;
    #5 t_A = 3; t_B = 3;

    #5 $finish;
  end

  initial
    $monitor($time, " A=%b B=%b | GT=%b LT=%b EQ=%b",
             t_A, t_B, t_GT, t_LT, t_EQ);

endmodule