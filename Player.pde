class Player {
  float x = width / 2;
  float y = height - 10;
  int hp = 10;
  float dx, dy;
  
  void update() {
    dx = dy = 0;
    if(KeyState.getState(RIGHT)) dx += 5;
    if(KeyState.getState(LEFT)) dx -= 5;
    if(KeyState.getState(UP)) dy -= 5;
    if(KeyState.getState(DOWN)) dy += 5;
    if(dx != 0 && dy != 0){
      dx = (dx >= 0 ? 3.6 : -3.6);
      dy = (dy >= 0 ? 3.6 : -3.6);
    }
    if(KeyState.getState(SHIFT)){
      dx /= 3;
      dy /= 3;
    }
    
    x += dx;
    y += dy;
    if (x-10 < 0)      x = 10;
    if (x+10 > width)  x = width-10;
    if (y-10 < 0)      y = 10;
    if (y+10 > height) y = height-10;
  }
  
  void draw() {
    fill(255, 0, 0);
    triangle(x, y-15, x-15, y+10, x+15, y+10);
    fill(255, 255, 255);
    circle(x, y, 10);
  }
}

void keyPressed(){
  KeyState.putState(keyCode, true);
}

void keyReleased(){
  KeyState.putState(keyCode, false);
}
