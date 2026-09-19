module tb;

  // Inputs and outputs
  reg  [3:0] t_a, t_b;
  reg        t_op;
  wire [3:0] t_result;

  // Instantiate DUT
  alu DUT (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
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
    // Addition tests
    t_a = 4; t_b = 3; t_op = 0;
    #5 t_a = 7; t_b = 2; t_op = 0;
    #5 t_a = 9; t_b = 6; t_op = 0;

    // Subtraction tests
    #5 t_a = 7; t_b = 3; t_op = 1;
    #5 t_a = 9; t_b = 4; t_op = 1;
    #5 t_a = 5; t_b = 8; t_op = 1;

    #5 $finish;
  end

  initial
    $monitor($time, " a=%d b=%d op=%b | result=%d",
             t_a, t_b, t_op, t_result);

endmodule