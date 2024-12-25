# 期末作業
### Authors: 112321061 112321015

#### Input/Output unit:<br>
* 8x8 LED 矩陣，用來顯示勝負與是否猜對方向。下圖為左側勝利。<br>
<img src="https://github.com/sennriyomu/final/blob/main/%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202024-12-25%20214302.png" width="300"/><br>
* 七段顯示器，用來顯示比分,圖中是0:7。<br>
<img src="https://github.com/kamiry/FPGA-project-1/blob/master/images/IO2.jpg" width="300"/><br>
* LED 陣列，用來顯示階段,圖中是第一階段。<br>
<img src="https://github.com/kamiry/FPGA-project-1/blob/master/images/IO3.jpg" width="300"/><br>

#### 功能說明:<br>
左方與右方玩家對戰，先得七分者獲勝。<br>

#### 程式模組說明:<br>
module slide_game(output reg[3:0]S //控制亮燈排數,output reg [7:0]Red //紅色燈,output reg [7:0]Green //綠色燈,
output reg [7:0]Blue //藍色燈,output reg [4:0]A_count,B_count //計分,output [6:0]O //倒計時,output reg beep //叫聲,input [1:0]button //玩家一左右,input [1:0]button2 //玩家二左右,input CLk,Clear); <br><br>
*** 請說明各 I/O 變數接到哪個 FPGA I/O 裝置，例如: button, button2 -> 接到 4-bit SW <br>
*** 請加強說明程式邏輯 <br>

#### Demo video: (請將影片放到雲端空間)

<a href="https://drive.google.com/file/d/1dsUKFF945moWpXyD0L86eseNf1l3repO/view?usp=sharing" title="Demo Video"><img src="https://github.com/kamiry/FPGA-project-1/blob/master/images/IO4.jpg" alt="Demo Video" width="500"/></a>
