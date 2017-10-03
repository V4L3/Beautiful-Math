int [][] array;
State state;
int startColor = 1;
void setup() {
  size(400, 400);
  background(255);
  array = new int[400][400];
  for (int i = 0; i < array.length; i++)
  {
    for (int j = 0; j < array[0].length; j++)
    {
      array[i][j] = 0;
    }
  }

  //Spawn 3 tribes
  for (int f = 0; f < 3; f++)
  {
    int intx = (int) random(200);
    int inty = (int) random(200);

    for (int a = 0; a < 5000; a++) {
      int incrementx = (int) random(-80, 80);
      int incrementy = (int) random(-80, 80);
      array[intx+incrementx+80][inty + incrementy+80] = startColor;
    }
    startColor++;
  }
}

void draw() {

  if (keyCode == UP) {
    state = state.RPENTOMINO;
  } else if (keyCode == DOWN) {
    state = state.GLIDERGUN;
  } else if (keyCode == LEFT) {
    state = state.RANDOM;
  }

  if (mousePressed == true) {
    if (state == state.RPENTOMINO) {
      rPentomino(mouseX, mouseY);
    } else if (state == state.GLIDERGUN) {
      gliderGun(mouseX, mouseY);
    } else {
      int intx = mouseX;
      int inty = mouseY;
      for (int a = 0; a < 500; a++) {
        int incrementx = (int) random(-30, 30);
        int incrementy = (int) random(-30, 30);
        array[intx+incrementx][inty+incrementy] = (int) random(3.9);
      }
    }
  }

  int[][] tempArray = new int[400][400]; 

  for (int i = 1; i < array[0].length-1; i++)
  {
    for (int j = 1; j < array[0].length-1; j++)
    {
      if (array[i][j] > 0)
      {
        pushStyle();  // Start a new style

        //draw alive cell with different colours
        if (array[i][j] == 1) {
          stroke(255, 0, 0);
        } else if (array[i][j] == 2) {
          stroke(0, 255, 0);
        } else if (array[i][j] == 3) {
          stroke(0, 0, 255);
        };

        strokeWeight(1);
        point(i, j);
        popStyle();  // Restore original style
      } else
      {
        pushStyle();  // Start a new style
        stroke(255);
        strokeWeight(1);
        point(i, j);
        popStyle();
      }

      tempArray[i][j] = stateChange(
        array[i][j], 
        array[i][j+1], 
        array[i][j-1], 
        array[i+1][j], 
        array[i+1][j+1], 
        array[i+1][j-1], 
        array[i-1][j], 
        array[i-1][j+1], 
        array[i-1][j-1]
        );
    }
  }

  array = tempArray;
}


int stateChange(int self, int before, int after, int top, int bottom, int topLeft, int topRight, int bottomLeft, int bottomRight) 
{

  //Calculate how many cells are alive in the neighbourhood
  int sum = 0;
  if (before > 0) {
    sum += 1;
  }
  if (after > 0) {
    sum += 1;
  }
  if (top > 0) {
    sum += 1;
  }
  if (bottom > 0) {
    sum += 1;
  }
  if (topLeft > 0) {
    sum += 1;
  }
  if (topRight > 0) {
    sum += 1;
  }
  if (bottomLeft > 0) {
    sum += 1;
  }
  if (bottomRight > 0) {
    sum += 1;
  }

  int farbe = 0;
  int red = 0;
  int blue = 0;
  int green = 0;

  //Calculate which colour has the most active neigbours
  if (before == 1) {
    red += 1;
  } else if (before == 2) {
    blue += 1;
  } else if (before == 3) {
    green += 1;
  }

  if (after == 1) {
    red += 1;
  } else if (after == 2) {
    blue += 1;
  } else if (after == 3) {
    green += 1;
  }

  if (top == 1) {
    red += 1;
  } else if (top == 2) {
    blue += 1;
  } else if (top == 3) {
    green += 1;
  }

  if (bottom == 1) {
    red += 1;
  } else if (bottom == 2) {
    blue += 1;
  } else if (bottom == 3) {
    green += 1;
  }

  if (topLeft == 1) {
    red += 1;
  } else if (topLeft == 2) {
    blue += 1;
  } else if (topLeft == 3) {
    green += 1;
  }

  if (topRight == 1) {
    red += 1;
  } else if (topRight == 2) {
    blue += 1;
  } else if (topRight == 3) {
    green += 1;
  }

  if (bottomLeft == 1) {
    red += 1;
  } else if (bottomLeft == 2) {
    blue += 1;
  } else {
    green += 1;
  }

  if (bottomRight == 1) {
    red += 1;
  } else if (bottomRight == 2) {
    blue += 1;
  } else if (bottomRight == 3) {
    green += 1;
  }

  if (red > blue && red > green) {
    farbe = 1;
  } else if (blue > red && blue > green) {
    farbe = 2;
  } else if (green > red && green > blue) {
    farbe = 3;
  } else {
    farbe = (int) random(3.9);
  }


  if (self == 0)                   //Cell is dead
  {
    if (sum == 3)                  //Determine if cell becomes alive
    {
      return farbe;
    } else
    {
      return 0;                     //Cell stays dead
    }
  } else                            //Cell is alive
  {
    if (sum == 3)                   //Cell stays alive
    {
      return self;
    } else if (sum == 2) {            //Cell stays alive
      return self;
    } else
    {
      return 0;                      //Cell dies
    }
  }
}

void gliderGun(int offsetx, int offsety) {

  int farbe = (int) random(3.9);

  int[][] matrix = new int[][]{
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0 }, 
    { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
  };

  for (int i = 0; i <  38; i++) {

    for (int j = 0; j < 11; j++) {

      if (matrix[j][i] == 1) {
        array[offsetx + i][offsety + j] = farbe;
      }
    }
  };
}

void rPentomino(int offsetx, int offsety) {

  int farbe = (int) random(3.9);

  int[][] matrix = new int[][]{
    { 0, 0, 0, 0, 0 }, 
    { 0, 0, 1, 1, 0 }, 
    { 0, 1, 1, 0, 0 }, 
    { 0, 0, 1, 0, 0 }, 
    { 0, 0, 0, 0, 0 }, 
  };

  for (int i = 0; i <  5; i++) {

    for (int j = 0; j < 5; j++) {

      if (matrix[j][i] == 1) {
        array[offsetx + i][offsety + j] = farbe;
      }
    }
  };
}

enum State {
  RPENTOMINO, 
    GLIDERGUN, 
    RANDOM,
};