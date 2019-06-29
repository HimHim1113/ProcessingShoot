class Laser extends Bullet {
  int fl;
  float x, y;
  float ang, spd;
  boolean hit = false;
  float w, h;
  
  Laser () {
   fl = 0;
  }
  
  void update(){
    if(fl > 0){
      x += cos(ang) * spd;
      y += sin(ang) * spd;
      if(x < -50 || x > width + 50 || y < -50 || y > height + 50) fl = 0;
    }
  }
  
  void draw() {
    if(fl > 0) rect(x-w/2, y-h/2, w, h);
  }
  void setter(float x, float y, float ang, float w, float h){
    fl = 1;
    this.x = x; 
    this.y = y;
    this.ang = ang;
    this.spd = 20;
    this.w = w;
    this.h = h;
  }
}
