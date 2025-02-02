`timescale 1ns/1ps  
module arbiter_tb;
	reg clk;
	reg reset;
	reg req_0, req_1, req_2, req_3;
	wire gnt_0, gnt_1, gnt_2, gnt_3;

    
	reg [3:0] test_vectors[0:9];  // Array to store test vectors 
	integer i;                    // Loop variable
	integer file_handle;          // File handler
	integer scan_file;            // File read status check

	arbiter uut 
	(
	  .clk(clk),
	  .reset(reset),
	  .req_0(req_0),
	  .req_1(req_1),
	  .req_2(req_2),
	  .req_3(req_3),
	  .gnt_0(gnt_0),
	  .gnt_1(gnt_1),
	  .gnt_2(gnt_2),
	  .gnt_3(gnt_3)
	);

	initial begin
	  clk = 1;
	  forever #5 clk = ~clk;
	end

	// Read from file and run tests
	initial begin
	
	// Read values from file into array
	file_handle = $fopen("test_vectors.txt", "r");
	if (file_handle == 0) begin
		$display("Error: Could not open file");
		$finish;
	end
  
	// Read 10 values into array
	for(i = 0; i < 10; i = i + 1) begin
		scan_file = $fscanf(file_handle, "%b\n", test_vectors[i]); 
		if (scan_file != 1) begin
			 $display("Error reading vector %0d", i);
			 $finish;
		end
	end
	$fclose(file_handle);

	// System initialization
	reset = 1;
	{req_3, req_2, req_1, req_0} = 4'b0000;
	#10;

	reset = 0;// Release reset
	#10;

	// Use for loop to input values from array
	for(i = 0; i < 10; i = i + 1) begin
		{req_3, req_2, req_1, req_0} = test_vectors[i];
		#20; 
	end
	
	#10;
	$finish;
	end
endmodule