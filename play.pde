//This function draws the PLAY screen

void play() {
  handleButtonClicks();
  drawMap();
  animateThings();
  drawPlayInterface();
}

void drawMap() {
  //path

  if (map == 1) {

    background(aqua);


    stroke(brown);
    strokeWeight(42);
    line(200, 0, 200, 350);
    line(200, 350, 350, 350);
    line(350, 350, 350, 250);
    line(350, 250, 825, 250);
    line(825, 250, 825, 125);
    line(825, 125, 600, 125);
    line(600, 125, 600, 600);
    line(600, 600, 300, 600);
    line(300, 600, 300, 500);
    line(300, 500, 1000, 500);
  }

  if (map == 2) {
    background(white);
    stroke(brown);
    strokeWeight(42);
    line(50, 450, 400, 450);
    line(400, 450, 400, 200);
    line(400, 200, 600, 200);
    line(600, 200, 600, 350);
    line(600, 350, 1000, 350);
  }

  //temp node drawing space
  for (int i = 0; i < 0; i++) {
    map2nodes[i].show();
  }
}

void animateThings() {
  invincibility++;
  for (int i = 0; i < mobs.size(); i++) {
    Mob myMob = mobs.get(i);
    myMob.show();
    myMob.act();


    if (myMob.x > 1050 && invincibility > 100) {
      lives--;
      invincibility = 0;
      mobs.remove(i);
    }

    if (myMob.hp <= 0) {
      mobs.remove(i);
      money += myMob.value;
      i--;
    }
  }

  for (int i = 0; i < towers.size(); i++) {
    Tower myTower = towers.get(i);

    myTower.show();
    if (mobs.size() != 0) {
      myTower.act();
    }
  }
  for (int i = 0; i < bullets.size(); i++) {
    Bullet myBullet = bullets.get(i);
    myBullet.show();
    myBullet.act();
    if (myBullet.hp <=0) {
      bullets.remove(i);
    }
  }

  //losing
  if (lives <= 0) {
    mode = GAMEOVER;
  }
}





void drawPlayInterface() {
  strokeWeight(7);
  stroke(white);
  fill(black);
  rect(75, height/2, 200, height);
  fill(white);
  textSize(25);
  text("Next wave: " + (wave+1), 85, 35);


  fill(white);
  textSize(20);

  nextWave.show();

  //build
  buildButton.show();


  //lives
  fill(black);
  textSize(30);
  text("Lives: " + lives, 900, 50);
  text("Money: $" + money, 900, 80);
}

void handleButtonClicks() {


  if (mobs.size() == 0 && nextWave.clicked) {
    wave++;
    addWave();
  }

  if (mobs.size() == 0) {
    if (buildButton.clicked) {
      mode = BUILD;
    }
  }
}

void addWave() {
  int i = 0;
  float x = begin.x;
  float y = begin.y;
  while (i < wave) {
    mobs.add(new Mob(x, y, begin.dx, begin.dy));
    if (map == 1) {
      y -= 80;
    } else if (map == 2) {
      x -=80;
    }
    i++;
  }

  if (wave % 3 == 0) {
    i = 0;
    x = begin.x;
    y = begin.y;
    while (i < wave/3) {
      mobs.add(new ChonkyMob(x, y, begin.dx, begin.dy));
      if (map == 1) {
        y -= 120;
      } else if (map == 2) {
        x -=120;
      }
      i++;
    }
  }

  if (wave % 2 == 0) {
    i = 0;
    x = begin.x;
    y = begin.y;
    while (i < wave/4) {
      mobs.add(new SpeedyMob(x, y, begin.dx, begin.dy));
      if (map == 1) {
        y -= 80;
      } else if (map == 2) {
        x -=80;
      }
      i++;
    }
  }
}
