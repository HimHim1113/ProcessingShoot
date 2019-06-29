class Bullet{
  int fl, range;
  int r, g, b;
  float x, y, vx, vy;
  float spd, ang, vang;
  boolean grz;
  
  Bullet(){
    fl = 0;
  }
  
  void update(){
    if(fl > 0){
      ang += vang;
      x += cos(ang) * spd + vx;
      y += sin(ang) * spd + vy;
      if(x < -50 || x > width + 50 || y < -50 || y > height + 50) fl = 0;
    }
  }
  
  void draw(){
    if(fl > 0){
      fill(r, g, b);
      ellipse(x, y, range, range);
    }
  }
  
  void setter(int fl, float x, float y, float vx, float vy, float spd, float ang, float vang, int range, int r, int g, int b){
    this.fl = fl;
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.spd = spd;
    this.ang = ang;
    this.vang = vang;
    this.range = range;
    this.r = r;
    this.g = g;
    this.b = b;
    this.grz = true;
  }
}
