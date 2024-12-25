# 期末作業
### Authors: 112321061 112321015

#### Input/Output unit:<br>
* 8x8 LED 矩陣，用來顯示勝負與是否猜對方向。下圖為左側勝利。<br>
<img src="https://github.com/sennriyomu/final/blob/main/%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202024-12-25%20214302.png" width="300"/><br>
* 七段顯示器，用來顯示比分,圖中是0:7。<br>
<img src="https://github.com/sennriyomu/final/blob/main/%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202024-12-25%20214430.png" width="300"/><br>
* LED 陣列，用來顯示階段,圖中是第一階段。<br>
<img src="https://github.com/sennriyomu/final/blob/main/%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202024-12-25%20214748.png" width="300"/><br>

#### 功能說明:<br>
左方與右方玩家對戰，先得七分者獲勝。<br>

#### 程式模組說明:<br>
module demo (output reg [7:0] DATA_R, DATA_G, DATA_B,output reg [3:0] COMM,rnd,
output reg [2:0]flag,step,Left_score,Right_score,
output reg [1:0]COM,mora_result,output reg [6:0] seg,input CLK,
input [2:0] Left_mora,Right_mora,input [3:0] Left_direct,Right_direct); <br>

#### Demo video: (請將影片放到雲端空間)

<a href="https://drive.google.com/file/d/1ktaLv8kZ-mkOttH3KR1Fg1P0_Nn6OIwl/view?pli=1" title="Demo Video"><img src="https://github.com/sennriyomu/final/blob/main/%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202024-12-25%20220215.png" alt="Demo Video" width="500"/></a>
