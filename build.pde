//This function draws the BUILD screen

void build() {

  drawMap();

  buildText();
  drawBuildInterface();
  animateThings();
  handleBuildClicks();
}


void buildText() {
  //build mode text

  textSize(85);
  fill(black);
  text("BUILD MODE", width/2+50, 180);
}

void drawBuildInterface() {

  stroke(white);
  strokeWeight(7);
  fill(black);
  rect(75, height/2, 200, height);


  //lives
  fill(black);
  textSize(30);
  text("Lives: " + lives, 900, 50);
  text("Money: $" + money, 900, 80);

  //resume
  play.show();


  //gun button
  gunButton.show();
  aoeButton.show();
  sniperButton.show();
}

void handleBuildClicks() {
  if (play.clicked && towers.size() == 0) {
    mode = PLAY;
  } else if (play.clicked && (towers.get(towers.size()-1).towerMode == 1)) {
    mode = PLAY;
  }


  if (gunButton.clicked && money >= 5) {
    towers.add(new Tower(GUN));
    money -= 5;
  }

  if (aoeButton.clicked && money >= 10) {
    towers.add(new Tower(AOE));
    money -= 10;
  }

  if (sniperButton.clicked && money >= 10) {
    towers.add(new Tower(SNIPER));
    money -= 10;
  }
}
