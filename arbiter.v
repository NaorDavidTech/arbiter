module arbiter
(
	input clk,
	input reset,
	input req_0,
	input req_1, 
	input req_2,
	input req_3,
	output reg gnt_0,
	output reg gnt_1,
	output reg gnt_2,
	output reg gnt_3
);

	parameter[2:0]
	IDLE = 3'b000,
	GNT0 = 3'b001,
	GNT1 = 3'b010,
	GNT2 = 3'b011,
	GNT3 = 3'b100;

	reg[2:0] present_state, next_state;

always @(posedge clk) begin
	if (reset) begin 
		 present_state <= IDLE;
	end
	else begin
		 present_state <= next_state;
	end
end

always @(*) begin
	case (present_state) 
		IDLE: begin
				if (req_0) begin
					 next_state = GNT0;
				end
				else if (req_1) begin
					 next_state = GNT1;
				end
				else if (req_2) begin
					 next_state = GNT2;
				end
				else if (req_3) begin
					 next_state = GNT3;
				end
				else begin
					 next_state = IDLE;
			   end
		end
		GNT0: begin
				if (req_0) begin
					 next_state = GNT0;
				end
				else begin
					 next_state = IDLE;
			   end
		end
		GNT1: begin
				if (req_1) begin
					 next_state = GNT1;
				end
				else begin
					 next_state = IDLE;
				end
		end
		GNT2: begin
				if (req_2) begin
					 next_state = GNT2;
				end
				else begin
					 next_state = IDLE;
				end
		end
		GNT3: begin
				if (req_3) begin
					 next_state = GNT3;
				end
				else begin
					 next_state = IDLE;
				end
		end
		default: next_state = IDLE;
	endcase
end


always @(*) begin
	case (present_state)
	      IDLE: begin 
			gnt_0 = 0;
			gnt_1 = 0;
			gnt_2 = 0;
			gnt_3 = 0;
			end
			GNT0: begin 
			gnt_0 = 1;
			gnt_1 = 0;
			gnt_2 = 0;
			gnt_3 = 0;
			end
			GNT1: begin 
			gnt_0 = 0;
			gnt_1 = 1;
			gnt_2 = 0;
			gnt_3 = 0;
			end
			GNT2: begin 
			gnt_0 = 0;
			gnt_1 = 0;
			gnt_2 = 1;
			gnt_3 = 0;
			end
			GNT3: begin 
			gnt_0 = 0;
			gnt_1 = 0;
			gnt_2 = 0;
			gnt_3 = 1;
			end
			default: begin
			gnt_0 = 0;
			gnt_1 = 0;
			gnt_2 = 0;
			gnt_3 = 0;
			end
	endcase
end
endmodule
