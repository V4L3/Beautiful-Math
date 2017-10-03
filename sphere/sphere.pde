void setup() {
  size(800, 800, P3D);
  background(255,255,255);
  rotateX(180);
  //drawCircle(100,250,250); 
}
void drawCircle(int radius, int middlePointx, int middlePointy){
  int r = 50;
  int c = 400;
  int d = 400;
  int e = 400;
  float a = 0;
  for(float i = 0; i<= 720; i = i+ 0.5){
    point(c + r * cos(i) * cos (a), d + r * cos(i) * sin(a), e + r *sin(i));
    a = a + 0.0043;
  }
}
  
  
  float i = 0;
  int r = 200;
  int c = 400;
  int d = 400;
  int e = 400;
  float a = 0;
    float increment = 0.1;
  float max = 360 / increment;
  int rotation = 0;
void draw(){
//  stroke(255);
  rotateX(180);
  for(int j = 0; j <= 4; j++){
  if(i <= max){
  point(c + r * cos(i) * cos (a), d + r * cos(i) * sin(a), e + r *sin(i));
  a = a + 0.0043;
  i = i + increment; } 
}
}
  