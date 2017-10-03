int [][] array;
State state;
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
}

void draw() {

  //Change ENUM state
  if (keyCode == UP) {
    state = state.RPENTOMINO;
  } else if (keyCode == DOWN) {
    state = state.GLIDERGUN;
  } else if (keyCode == LEFT) {
    state = state.SMALL;
  } else {
    state = state.BIG;
  }

  //Spawn pattern at mouse location
  if (mousePressed == true) {
    if (state == state.RPENTOMINO) {
      rPentomino(mouseX, mouseY);
    } else if (state == state.GLIDERGUN) {
      gliderGun(mouseX, mouseY);
    } else if (state == state.SMALL) {
      infiniteSmall(mouseX, mouseY);
    } else if (state == state.BIG) {
      infiniteBig(mouseX, mouseY);
    }
  }

  //Temparray for State Change
  int[][] tempArray = new int[400][400]; 

  //Go through array and draw alive Cells
  for (int i = 1; i < array[0].length-1; i++)
  {
    for (int j = 1; j < array[0].length-1; j++)
    {
      if (array[i][j] == 1)
      {
        pushStyle();  // Start a new style
        stroke(0);
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
  int sum = before + after + top + bottom + topLeft + topRight + bottomLeft + bottomRight;

  if (self == 0) 
  {
    if (sum == 3)
    {
      return 1;
    } else
    {
      return 0;
    }
  } else
  {
    if (sum == 3)
    {
      return 1;
    } else if (sum == 2) {
      return 1;
    } else
    {
      return 0;
    }
  }
}

void gliderGun(int offsetx, int offsety) {

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
        array[offsetx + i][offsety + j] = 1;
      }
    }
  };
}

void rPentomino(int offsetx, int offsety) {

  int[][] matrix = new int[][]{
    { 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0 }, 
    { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0 }, 
    { 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 }, 
    { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0 }, 
    { 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0 }, 
    { 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
    { 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 
  };

  for (int i = 0; i <  16; i++) {

    for (int j = 0; j < 11; j++) {

      if (matrix[j][i] == 1) {
        array[offsetx + i][offsety + j] = 1;
      }
    }
  };
}

void infiniteSmall(int offsetx, int offsety) {

  int[][] matrix = new int[][]{
    { 1, 1, 1, 0, 1 }, 
    { 1, 0, 0, 0, 0 }, 
    { 0, 0, 0, 1, 1 }, 
    { 0, 1, 1, 0, 1 }, 
    { 1, 0, 1, 0, 1 }, 
  };

  for (int i = 0; i <  5; i++) {

    for (int j = 0; j < 5; j++) {

      if (matrix[j][i] == 1) {
        array[offsetx + i][offsety + j] = 1;
      }
    }
  };
}

void infiniteBig(int offsetx, int offsety) {

  int[][] matrix = new int[][]{
    { 0, 0, 0, 0, 0, 0, 1, 0, }, 
    { 0, 0, 0, 0, 1, 0, 1, 1, }, 
    { 0, 0, 0, 0, 1, 0, 1, 0, }, 
    { 0, 0, 0, 0, 1, 0, 0, 0, }, 
    { 0, 0, 1, 0, 0, 0, 0, 0, }, 
    { 1, 0, 1, 0, 0, 0, 0, 0, }, 
  };

  for (int i = 0; i <  8; i++) {

    for (int j = 0; j < 6; j++) {

      if (matrix[j][i] == 1) {
        array[offsetx + i][offsety + j] = 1;
      }
    }
  };
}

enum State {
  RPENTOMINO, 
    GLIDERGUN, 
    SMALL, 
    BIG
};