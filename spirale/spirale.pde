void setup() {
  size(500, 500);
  background(0);
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
int radius = 300;
int middlePointx = 250;
int middlePointy = 250;
float x1= middlePointx + cos(0)* radius;
float y1 = middlePointy + sin(0)*radius;
float i = 0;
int reachedmiddle = 0;
void draw(){
  //background(0);
  float rand = random(255);
  //if(i <= 1080){ 
    if(radius >= 0 && reachedmiddle == 0){
    background(0);
    stroke(rand, 255, 255);
    strokeWeight(3);
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    radius = radius - 1;
    i = i+ 1.2;
    if(radius == 0){reachedmiddle = 1;  }  
  }
  if(radius < 300 && reachedmiddle == 1){ 
    //background(0);
    stroke(255, rand, 255);
    strokeWeight(3);
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    radius = radius + 1;
    i = i+ 1.4;
    if(radius == 300){reachedmiddle = 2;}
  }
  if(radius >= 0 && reachedmiddle == 2){ 
    background(0);
    stroke(255, 255, rand);
    strokeWeight(3);
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    radius = radius - 1;
    i = i+ 0.1;
    if(radius == 0){reachedmiddle = 4;  }
  }
    if(radius < 300 && reachedmiddle == 4){ 
    //background(0);
    stroke(rand, 255, 255);
    strokeWeight(3);
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    radius = radius + 1;
    i = i+ 1.8;
    if(radius == 300){reachedmiddle = 0;}
  }
  //}
  //i = i+ 1.2;
  }