void setup() {
  size(800, 800);
  background(255,255,255);
  int middlex = 50;
  int middley = 50;
  int r = 50;
  int x = 100;
  //drawCircle(100,250,250);    
}
void drawCircle(int radius, int middlePointx, int middlePointy){
  float x1= middlePointx + cos(0)* radius;;
  float y1 = middlePointy + sin(0)*radius;;
  for(float i = 0; i<= 360; i = i+ 2.1){
    if(radius >= 0){
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    radius = radius - 1;}
  }
}
float radius = 1;
int middlePointx = 400;
int middlePointy = 400;
float x1= middlePointx + cos(0)* radius;
float y1 = middlePointy + sin(0)*radius;
float x2= middlePointx + cos(0)* radius;
float y2 = middlePointy + sin(0)*radius;
float i = 0;
float e = (float) Math.E;
void draw(){
  if(i <= 100){ 
    if(radius <= 1000){
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    radius = 50 * pow(i,0.5) ;
    line(x2,y2,middlePointx + cos(i)* radius * -1,middlePointy + sin(i)*radius *-1);
    x2 = middlePointx + cos(i)* radius *-1;
    y2 = middlePointy + sin(i)*radius *-1;  
}
  }
  i = i + 0.1;
  }