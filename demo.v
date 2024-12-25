module demo (output reg [7:0] DATA_R, DATA_G, DATA_B,output reg [3:0] COMM,rnd,
output reg [2:0]flag,step,Left_score,Right_score,
output reg [1:0]COM,mora_result,output reg [6:0] seg,input CLK,
input [2:0] Left_mora,Right_mora,input [3:0] Left_direct,Right_direct);
  parameter logic [7:0] Left_Char [7:0]=
  '{8'b11101111,
  8'b11011111,
  8'b10111111,
  8'b00000000,
  8'b10111111,
  8'b11011111,
  8'b11101111,
  8'b00000000};
  parameter logic [7:0] Right_Char [7:0]=
  '{8'b11110111,
  8'b11111011,
  8'b11111101,
  8'b00000000,
  8'b11111101,
  8'b11111011, 
  8'b11110111,
  8'b11101111};
  parameter logic [7:0] Up_Char [7:0]=
  '{8'b11101111,
  8'b11000111,
  8'b10101011,
  8'b01101101,
  8'b11101111,
  8'b11101111,
  8'b11101111,
  8'b11101111};
  parameter logic [7:0] Down_Char [7:0]=
  '{8'b11101111,
  8'b11101111,
  8'b11101111,
  8'b11101111,
  8'b01101101,
  8'b10101011,
  8'b11000111,
  8'b11101111};
  parameter logic [7:0] L_Char [7:0]=
  '{8'b01111111,
  8'b01111111,
  8'b01111111,
  8'b01111111,
  8'b01111111,
  8'b01111111,
  8'b01111111,
  8'b00000000};
  parameter logic [7:0] V_Char [7:0]=
  '{8'b11111111,
    8'b11111111,
    8'b11111111,
    8'b01111110,
    8'b00111100,
    8'b10011001,
    8'b11000011,
    8'b11100111};
  parameter logic [7:0] No_Char [7:0]=
  '{8'b11111111,
  8'b11111111,
  8'b11111111,
  8'b11111111,
  8'b11111111,
  8'b11111111,
  8'b11111111,
  8'b11111111};
  
  bit [2:0] cnt;  // Changed 'bit' to 'reg' for compatibility
  divfreq FO (CLK, CLK_div);
  divfreq1 F1 (CLK,CLK_1HZ);
  
  initial begin
    seg = 7'b1000000;
    cnt = 3'b000; // Ensure cnt is properly initialized
    DATA_R = 8'b11111111;
    DATA_G = 8'b11111111; 
    DATA_B = 8'b11111111;
    COMM = 4'b1000;
    flag = 3'b000;
    step = 3'b100;
    mora_result = 2'b00;
    COM = 2'b00; 
	 rnd = 4'b0001;
  end

  always @(posedge CLK_1HZ) begin
    if (step == 3'b100) begin 
      if ((Left_mora == 3'b100 && Right_mora == 3'b010) ||
          (Left_mora == 3'b010 && Right_mora == 3'b001) ||
          (Left_mora == 3'b001 && Right_mora == 3'b100)) begin
        step <= 3'b010;
        mora_result <= 2'b10;
      end else if ((Right_mora == 3'b100 && Left_mora == 3'b010) ||
                   (Right_mora == 3'b010 && Left_mora == 3'b001) ||
                   (Right_mora == 3'b001 && Left_mora == 3'b100)) begin
        step <= 3'b010;
        mora_result <= 2'b01;
      end else begin
        mora_result <= 2'b00;
      end
    end
    else if (step == 3'b010) begin
      if (Left_direct == 4'b1000 && rnd==4'b1000 || Right_direct == 4'b1000 && rnd==4'b1000 ) begin
        if (mora_result == 2'b10) begin
          Left_score <= Left_score + 1;
          step <= 3'b100;
          flag <= 3'b100;
        end else if (mora_result == 2'b01) begin
          Right_score <= Right_score + 1;
          step <= 3'b100;
          flag <= 3'b100;
        end
      end else if (Left_direct == 4'b0100 && rnd==4'b0100 || Right_direct == 4'b0100 && rnd==4'b0100) begin
        if (mora_result == 2'b10) begin
          Left_score <= Left_score + 1;
          step <= 3'b100;
          flag <= 3'b101;
        end else if (mora_result == 2'b01) begin
          Right_score <= Right_score + 1;
          step <= 3'b100;
          flag <= 3'b101;
        end
      end else if (Left_direct == 4'b0010 && rnd==4'b0010 || Right_direct == 4'b0010 && rnd==4'b0010) begin
        if (mora_result == 2'b10) begin
          Left_score <= Left_score + 1;
          step <= 3'b100;
          flag <= 3'b110;
        end else if (mora_result == 2'b01) begin
          Right_score <= Right_score + 1;
          step <= 3'b100;
          flag <= 3'b110;
        end
      end else if (Left_direct == 4'b0001 && rnd==4'b0001 || Right_direct == 4'b0001 && rnd==4'b0001) begin
        if (mora_result == 2'b10) begin
          Left_score <= Left_score + 1;
          step <= 3'b100;
          flag <= 3'b111;
        end else if (mora_result == 2'b01) begin
          Right_score <= Right_score + 1;
          step <= 3'b100;
          flag <= 3'b111;
        end
      end else begin
        step <= 3'b100;
        flag <= 3'b000;
      end
    end
	 if (Left_score == 3'b111 || Right_score == 3'b111) begin
      step <= 3'b001;
      flag <= (Left_score == 3'b111) ? 3'b010 : 3'b001;
    end
  end

  always @(posedge CLK_div) begin
    case (COM)
      2'b01: case (Left_score)
               3'b000: seg <= 7'b1000000;
               3'b001: seg <= 7'b1111001; 
               3'b010: seg <= 7'b0100100;
               3'b011: seg <= 7'b0110000;
               3'b100: seg <= 7'b0011001;
               3'b101: seg <= 7'b0010010;
               3'b110: seg <= 7'b0000010;
               3'b111: seg <= 7'b1111000;
             endcase
      2'b10: case (Right_score)
               3'b000: seg <= 7'b1000000;
               3'b001: seg <= 7'b1111001; 
               3'b010: seg <= 7'b0100100;
               3'b011: seg <= 7'b0110000;
               3'b100: seg <= 7'b0011001;
               3'b101: seg <= 7'b0010010;
               3'b110: seg <= 7'b0000010;
               3'b111: seg <= 7'b1111000;
             endcase
    endcase
    COM <= COM + 1;
  end

  always @(posedge CLK_div) begin
    if (cnt >= 7)
      cnt <= 0;
    else
      cnt <= cnt + 1;

    COMM <= {1'b1, cnt};
	 case(rnd)
		4'b0001:rnd<=4'b0010;
		4'b0010:rnd<=4'b0100;
		4'b0100:rnd<=4'b1000;
		4'b1000:rnd<=4'b0001;
	 endcase
    case (flag)
      3'b100: DATA_G <= Up_Char[cnt];
      3'b101: DATA_G <= Down_Char[cnt];
      3'b110: DATA_G <= Left_Char[cnt];
      3'b111: DATA_G <= Right_Char[cnt];
      3'b010: DATA_G <= V_Char[cnt];
      3'b001: DATA_G <= L_Char[cnt];
      default: DATA_G <= No_Char[cnt];
    endcase
  end
endmodule

module divfreq(input CLK, output reg CLK_div);
  reg [24:0] Count;
  always @(posedge CLK) begin

    if (Count > 25000) begin
      Count <= 0;
      CLK_div <= ~CLK_div;
    end else
      Count <= Count + 1;
  end
endmodule

module divfreq1(input CLK, output reg CLK_1HZ);
  reg [24:0] Count;
  always @(posedge CLK) begin
    if (Count > 25000000) begin
      Count <= 0;
      CLK_1HZ <= ~CLK_1HZ;
    end else
      Count <= Count + 1;
  end
endmodule
