//RectDrawer V1.0 //<>//
//By Ibrahim Chehab
//07/19/21

Rect[] rects = new Rect[9];

void setup() {
  size (600, 600); 
  background(255);
  rects[0] = new Rect(0, 0, 1);
  rects[1] = new Rect(0, 200, 2);
  rects[2] = new Rect(0, 400, 3);

  rects[3] = new Rect(200, 0, 1);
  rects[4] = new Rect(200, 200, 2);
  rects[5] = new Rect(200, 400, 3);

  rects[6] = new Rect(400, 0, 1);
  rects[7] = new Rect(400, 200, 2);
  rects[8] = new Rect(400, 400, 3);
}

void draw() {
  stroke(255);
  fill(0);
  for (int i = 0; i < 9; i++) {
    rects[i].drawRect();
  }
}

class Rect {
  int rectx, recty, index;
  int fill = 0;
  int stroke = 255;
  public Rect(int x, int y, int num) {
    rectx = x;
    recty = y;
    index = num;
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
  for (int i = 0; i < 9; i++) {
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
