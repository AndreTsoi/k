//This function draws the INTRO screen.

void intro() {
  //introAnimation.show();
  start.show();
  if (start.clicked) {
    mode = MAPSELECT;
  }
}
