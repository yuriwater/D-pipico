/*
Dピピコをいつでもどこでも、どんなサイズでも表せる様にメゾットで描きました。
 pipico(X座標, Y座標, サイズ);でいつでも好きな場所に好きなサイズで呼び出せます！
 サイズを自由に変えられる様に、全ての要素を変数 s（サイズ）に紐付けるのが大変でした。
 ストロベリーチョコのコーティング部分の表現にこだわりました。
 ストロベリー部分は線をcos(radians(i))（i+=0.5)ずつ右にずらして面にしています。
 線の始まりのY座標をsin(radians(i))ずつ、上にずらすことで胴体の上部分の弧に沿うことができます。
 線の終わりをsin関数を用いて波波にしています。
 */
void setup() {
  size(1000, 700);
  pixelDensity(displayDensity());
}

void draw() {
  background(130, 170, 130);
  pipico(200+x, 350, 200);
  x+=5;
}
int x  = 0;


int X;//中心のX 座標
int Y;//中心のY座標
int s;//表示するd-ピピコのサイズ

void pipico(int X, int Y, int s) {
  int d = s*2/3;//胴の直径
  int r = d/2;
  int str = s/100 +1;//輪郭線の太さ

  float sw = r/30+1;//ストロベリーの波を描いてる線の太さ。細いと途切れ途切れになり、太いとはみ出す
  float sww = sw+str*2;//波波の輪郭のために黒くて少し太い線で下に波波を描く、その線の太さ
  int hw =r/10;//波波を中心より少し下げる

  int Floor = Y + s/2;
  int Lup = Y + s/4;//脚の付け根の高さ
  int RL = X+s/20;
  int RF = X+s/7;
  int LL = X -s/20;
  int LF = X -s/7;
  int lw = r/10;
  int fs = s/5;
  int fh = s/15;
  int Hh = Y-r-s/9;//顔の中心の高さ

  strokeWeight(str);
  stroke(90, 60, 50); //線の色

  //脚
  fill(250, 190, 90);//足とクチバシの色
  quad(RL, Floor, RL+lw, Floor, RL+lw, Lup, RL, Lup);//右脚
  quad(LL, Floor, LL-lw, Floor, LL-lw, Lup, LL, Lup);//左脚
  ellipse(RF, Floor, fs, fh);
  ellipse(LF, Floor, fs, fh);
  noStroke();
  quad(RL+str/2, Floor, RL+lw-str/2, Floor, RL+lw-str/2, Lup, RL+str/2, Lup);//右脚
  quad(LL-str/2, Floor, LL-lw+str/2, Floor, LL-lw+str/2, Lup, LL-str/2, Lup);//左脚

  //胴体
  strokeWeight(str);
  stroke(90, 60, 50); //線の色
  fill(240, 180, 90);//胴の色
  ellipse(X, Y, d, d);


  strokeWeight(sww);
  stroke(90, 60, 50);//線の色
  for (float i =0; i < 180; i += 0.5) {
    line(X+cos(radians(i))*r, Y-sin(radians(i))*r, X+cos(radians(i))*r, Y+sin(radians(i*12))*hw+r/5);
  }
  strokeWeight(sw);
  stroke(255, 90, 150);//ストロベリーの色
  for (float i =0; i < 180; i += 0.5) {
    line(X+cos(radians(i))*r, Y-sin(radians(i))*r, X+cos(radians(i))*r, Y+sin(radians(i*12))*hw+r/5);
  }
  //顔
  strokeWeight(str);
  stroke(90, 60, 50); //線の色
  fill(250, 210, 110);//顔の色

  ellipse(X, Hh, d-s/10, s/3);
  fill(250, 190, 90);//足とクチバシの色
  ellipse(X, Hh+s/12, r*3/4, r/2);
  noStroke();
  fill(0, 0, 0);//目の色＝線の色
  ellipse(X+s/8, Hh, r/5, r/5);
  ellipse(X-s/8, Hh, r/5, r/5);
}
