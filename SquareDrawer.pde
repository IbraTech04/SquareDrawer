//RectDrawer V1.0 //<>//
//By Ibrahim Chehab
//07/19/21

int gridSize = 5;
int squareSize = 100;
Rect[] rects;

void settings(){
    size (gridSize*squareSize, gridSize*squareSize);  
}

void setup() {
  surface.setTitle("IbraTech Sqaure Drawing Machine");
  rects = new Rect[gridSize*gridSize];
  background(255);
  for (int i = 0; i < gridSize; i++) { //<>//
    for (int j = 0; j < gridSize; j++) {
      rects[j+(i*gridSize)] = new Rect(i*squareSize, j*squareSize);
    }
  }
 
}

void draw() {
  stroke(255);
  fill(0);
  for (int i = 0; i < gridSize*gridSize; i++) {
    rects[i].drawRect();
  }
}

class Rect {
  int rectx, recty;
  int fill = 0;
  int stroke = 255;
  public Rect(int x, int y) {
    rectx = x;
    recty = y;
  }

  public void drawRect() {
    stroke(stroke);
    fill(fill);
    rect(rectx, recty, squareSize, squareSize);
  }

  public boolean isPressed() {
    if (mousePressed && mouseX >= rectx && mouseX <= rectx + squareSize && mouseY >= recty && mouseY <= recty + squareSize) {
      return true;
    }
    return false;
  }
}

void mousePressed() {
  for (int i = 0; i < gridSize*gridSize; i++) {
    if (rects[i].isPressed()) {
      if (rects[i].fill == 0) {
        rects[i].fill = 255;
        rects[i].stroke = 0;
      } else {
        rects[i].fill = 0;
        rects[i].stroke = 255;
      }
    }
  }
}
