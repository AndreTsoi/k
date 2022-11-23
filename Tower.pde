//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING = 0;
  final int PLACED = 1;


  float x, y;
  int cooldown, threshold;
  int towerMode;
  int towerType;
  int cost;
  boolean circle;

  Tower(int type) {
    //float _x, float _y, int _c, int _th
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    circle = false;
    towerMode = PLACING;
    towerType = type;
    if (towerType== GUN) threshold = 30;
    if (towerType == AOE) threshold = 50;
    if (towerType == SNIPER) threshold = 120;
  }

  void show() {
    if (towerMode == PLACING) {
      x = mouseX;
      y = mouseY;
      if (mousePressed && mouseX > 175) {
        towerMode = PLACED;
      }
    }




    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAOETower();
    if (towerType == SNIPER) showSniperTower();
  }

  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    square(x, y, 40);
  }

  void showAOETower() {
    stroke(black);
    fill(red);
    strokeWeight(3);
    circle(x, y, 45);
  }

  void showSniperTower() {
    stroke(white);
    fill(black);
    strokeWeight(3);
    triangle(x, y, x +40, y + 40, x, y + 80);
    stroke(white);
    strokeWeight(12);
    line(x+40, y+40, x + 100, y + 40);
  }



  void act() {

    if (towerType == GUN) gunTowerAct();
    if (towerType == AOE) aoeTowerAct();
    if (towerType == SNIPER) sniperTowerAct();
  }

  void gunTowerAct() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); //UP
      bullets.add(new Bullet(x, y, 0, 10)); //DOWN
      bullets.add(new Bullet(x, y, -10, 0)); //LEFT
      bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
    }
  }

  void aoeTowerAct() {
    cooldown++;
  }
}





void sniperTowerAct() {
  println(cooldown);
  cooldown++;
  if (cooldown >= threshold) {




    for (int i = 0; i < mobs.size(); i++) {
      Mob myMob = mobs.get(i);


      myMob.hp-=3;
      cooldown = 0;
    }
  }
}
}
