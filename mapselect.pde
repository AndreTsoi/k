//evaluate button clicks

void mapSelect() {
  background(orange);
  fill(black);
  text("Map 2", 690, 580);
  text("Map 1", 300, 580);

  map1Button.show();

  map2Button.show();
  image(map1Icon, 300, 400, 255, 255);
  image(map2Icon, 690, 400, 255, 255);

  if (map1Button.clicked) {
    map = 1;
    nodes = map1nodes;
    mode = PLAY;
    begin = new Node(200, 0, 0, 1);
  }


  if (map2Button.clicked) {

    map = 2;
    nodes = map2nodes;
    mode = PLAY;
    begin = new Node(50, 450, 1, 0);
  }
}
