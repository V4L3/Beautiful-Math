float theta = PI/2;
int branchCount = 1;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);

  translate(width/2, height);
  stroke(0);
  branch(branchCount);
  if (branchCount < 300) {
    branchCount++;
  }
  theta -= PI/100;
}

void branch() {
  line(0, 0, 0, -100);
  translate(0, -100);

  pushMatrix();
  rotate(PI/6);
  branch();
  popMatrix();

  pushMatrix();
  rotate(-PI/6);
  branch();
  popMatrix();
}

void branch(float len) {

  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.66;

  if (len > 2) {
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}