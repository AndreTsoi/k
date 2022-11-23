//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d;
  float hp, maxhp;
  int value;
  color fillColor, strokeColor;
  float speed;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    value = 1;
    maxhp = 3;
    hp = maxhp;
    fillColor = purple;
    strokeColor = pink;
    speed = 1;
  }




  void show() {
    stroke(strokeColor);
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }


  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+5)-2, 54, 14);//background
    fill(pink);
    rect(x-25, y-(d+5), 50, 10);
    fill(green);
    rect(x-25, y-(d+5), hp*50/maxhp, 10);
    rectMode(CENTER);
  }
  void act() {
    x = x + vx*speed;
    y = y + vy*speed;
    aoeInvincible++;

    for (int i = 0; i < nodes.length; i++) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
    }


    for (int i = 0; i < bullets.size(); i++) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp--;
        myBullet.hp--;
      }
    }
  }
}
