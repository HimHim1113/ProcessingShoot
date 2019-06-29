class Enemy{
  int flag, hp;
  float x, y, vx, vy;
  float spd, ang;
  PImage img;
  
  Enemy(){
    flag = 1;
    hp = 1000;
    x = width / 2;
    y = 100;
    vx = vy = spd = 0;
    img = loadImage("redbul.png");
  }
  
  void update(){
    x += cos(ang) * spd + vx;
    y += sin(ang) * spd + vy;
  }
  
  void draw(){
    image(img, x - 50, y - 50);
  }
  
  void move(){
    
  }
}
