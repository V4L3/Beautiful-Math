void setup() {
  size(800, 800);
  background(255, 255, 255);
  pixelDensity(1);
}
float i = 0;
float x = 0;
float y = 0;
float r1 = 15;
float k = 7.2;
float r2 = r1 * k;
float increment = 0.05;
float max = 360 / increment;
void draw() {
  float rand = random(128);
  float rand2 = random(255);
  float rand3 = random(255);
  if (i < max) {
    x = 400 + (r2 + r1) * cos(i) - r1 * cos(((r2 + r1) / r1) * i);
    y = 400 + (r2 + r1) * sin(i) - r1 * sin(((r2 + r1) / r1) * i);
    stroke(255, rand, 255);
    strokeWeight(4);
    point(x, y);
    //r2 = r2 + 0.3;
    //r1 = r1 + 0.02;
    i = i + increment;
  }
}