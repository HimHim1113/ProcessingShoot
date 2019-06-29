float pi = 3.14159;
int cnt = 0;
int stopcnt = -1;
int graze = 0;
int BUL_MAX = 10000;
int LAS_MAX = 200;


Enemy en;
Player pl;
Bullet[] bul = new Bullet[BUL_MAX];
Laser[] las = new Laser[LAS_MAX];


void mouseClicked(){
  setup();
}

void setup(){
  size(960, 720);
  noStroke();
  
  KeyState.initialize();
  
  en = new Enemy();
  pl = new Player();
  for(int i = 0; i < BUL_MAX; i++){
    bul[i] = new Bullet();
  }
  for(int i = 0; i < LAS_MAX; i++){
    las[i] = new Laser();
  }
}

void draw(){
  background(0);
  en.update();
  en.draw();
  pl.update();
  pl.draw();
  
  update();
  
  textSize(20);
  text("Player:" + nf(pl.hp, 3) , 20, 20);
  text("Enemy:" + nf(en.hp, 4)  , 20, 40); 
  text("Graze:" + nf(graze, 3)  , 20, 60); 
  
  for(int i = 0; i < BUL_MAX; i++){
    bul[i].update();
    bul[i].draw();
  }
  for(int i = 0; i < LAS_MAX; i++){
    las[i].update();
    las[i].draw();
  }
  
  if(stopcnt == 0) finalize();
}

void update(){
  int a;
  if(cnt % 5 == 1){
    if((a = search_las()) != -1){
      las[a].setter(pl.x - 10, pl.y, -pi / 2, 20, 20);
    }
    if((a = search_las()) != -1){
      las[a].setter(pl.x + 10, pl.y, -pi / 2, 20, 20);
    }
    if((a = search_las()) != -1){
      las[a].setter(pl.x - 10, pl.y, -pi / 2 - 0.1, 20, 20);
    }
    if((a = search_las()) != -1){
      las[a].setter(pl.x + 10, pl.y, -pi / 2 + 0.1, 20, 20);
    }
  }
  if(cnt % 30 == 0){
    for(int i = 0; i < 32; i++){
      if((a = search_bul()) != -1){
        bul[a].setter(1, en.x, en.y, 0, 0, 3.0, 2 * pi / 32 * i, 0.005, 20, 100, 150, 255);
      }
      if((a = search_bul()) != -1){
        bul[a].setter(1, en.x, en.y, 0, 0, 3.0, 2 * pi / 32 * i, -0.005, 20, 100, 150, 255);
      }
    }
  }
  en.hp -= checkDamage();
  checkHit();
  if((pl.hp <= 0 || en.hp <= 0) && stopcnt < 0) stopcnt = 60;
  cnt++;
  stopcnt--;
}

void finalize(){
  fill(255, 255, 255);
  textSize(80);
  textAlign(CENTER, CENTER);
  text("Game Over", width / 2, height / 2);
  noLoop();
}

void checkHit(){
  for(int i = 0; i < BUL_MAX; i++){
    if(bul[i].fl > 0){
      float dx = pl.x - bul[i].x, dy = pl.y - bul[i].y;
      if(dx * dx + dy * dy < bul[i].range * bul[i].range * 0.3){
        pl.hp--;
        for(int j = 0; j < BUL_MAX; j++) bul[j].fl = 0;
        break;
      }
      else if(dx * dx + dy * dy < bul[i].range * bul[i].range && bul[i].grz) {
        graze++;
        bul[i].grz = false;
      }
    }
  }
}

int checkDamage(){
  int damage = 0;
  for(int i = 0; i < LAS_MAX; i++){
    if(las[i].fl > 0){
      float dx = en.x - las[i].x, dy = en.y - las[i].y;
      if(dx * dx + dy * dy < 2500){
        las[i].fl = 0;
        damage++;
      }
    }
  }
  return damage;
}

int search_bul(){
  for(int i = 0; i < BUL_MAX; i++){
    if(bul[i].fl == 0) return i;
  }
  return -1;
}

int search_las(){
  for(int i = 0; i < LAS_MAX; i++){
    if(las[i].fl == 0) return i;
  }
  return -1;
}
