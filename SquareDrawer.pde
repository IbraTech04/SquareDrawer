//RectDrawer V1.0 //<>//
//By Ibrahim Chehab
//07/19/21

int gridSize = 4;
Rect[] rects;

void settings(){
    size (gridSize*200, gridSize*200);  
}

void setup() {
  rects = new Rect[gridSize*gridSize];
  background(255);
  for (int i = 0; i < gridSize; i++) { //<>//
    for (int j = 0; j < gridSize; j++) {
      rects[j+(i*gridSize)] = new Rect(i*200, j*200);
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
    rect(rectx, recty, 200, 200);
  }

  public boolean isPressed() {
    if (mousePressed && mouseX >= rectx && mouseX <= rectx + 200 && mouseY >= recty && mouseY <= recty + 200) {
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
