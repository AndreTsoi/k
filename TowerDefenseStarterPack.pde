//Tower Defense Game
//Andre Tsoi
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int MAPSELECT = 1;
final int PLAY     = 2;
final int BUILD    = 3;
final int GAMEOVER = 4;
int map;
int mode;

//Tower types
final int GUN = 0;
final int AOE = 1;
final int SNIPER = 2;
//Tower costs
final int[] price = {5, 15, 20};

//Pallette
color white = #FFFFFF;
color gray = #F5F5F5;
color black = #000000;
color pink = #FF59FE;
color orange = #FFCA3A;
color green = #8AC926;
color blue = #1982C4;
color purple = #6A4C93;
color aqua = #93E7FB;
color brown = #C4A484;
color red = #FF0000;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button buildButton;
Button nextWave;
Button play;
Button gunButton;
Button aoeButton;
Button sniperButton;
Button map1Button;
Button map2Button;
//Collections of objects
Node[] nodes;
Node[] map1nodes;
Node[] map2nodes;
Node begin;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> rings;

int lives = 3;
int money = 10;
int invincibility = 0;
int aoeInvincible = 0;

//Images and Gifs
PImage resume;
PImage map1Icon;
PImage map2Icon;
Gif introAnimation;


int wave = 0;
//int y = 0;
//Fonts

PFont zombie;


// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  map1Icon = loadImage("map1.png");
  map2Icon = loadImage("map2.png");


  //introAnimation = new Gif("Gifferbiffer/frame_0", "_delay-0.03s.gif",110, 1, width/2, height/2);
  resume = loadImage("resume.png");



  //Load Fonts
  zombie = createFont("ZombieMonster.ttf", 128);
  textFont(zombie);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  rings = new ArrayList<AoE_Ring>();
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 180, white, black);

  //maps

  map1Button = new Button(" ", 300, 400, 280, 280, black, red);
  map2Button = new Button(" ", 690, 400, 280, 280, black, red);

  //PLAY - Next Wave, To Build Mode
  nextWave =  new Button(resume, 86, 100, 140, 100, red, white);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  buildButton = new Button("Build", 86, 220, 140, 100, green, white);
  play = new Button("Play", 86, 100, 140, 100, green, white);
  gunButton = new Button("Gun", 86, 220, 140, 100, blue, white);
  aoeButton = new Button("AOE", 86, 340, 140, 100, red, white);
  sniperButton = new Button("Sniper", 86, 460, 140, 100, pink, white);


  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map

  map1nodes = new Node[9];

  map1nodes[0] = new Node(200, 350, 1, 0);
  map1nodes[1] = new Node(350, 350, 0, -1);
  map1nodes[2] = new Node(350, 250, 1, 0);
  map1nodes[3] = new Node(825, 250, 0, -1);
  map1nodes[4] = new Node(825, 125, -1, 0);
  map1nodes[5] = new Node(600, 125, 0, 1);
  map1nodes[6] = new Node(600, 600, -1, 0);
  map1nodes[7] = new Node(300, 600, 0, -1);
  map1nodes[8] = new Node(300, 500, 1, 0);


  map2nodes = new Node[4];

  map2nodes[0] = new Node(400, 450, 0, -1);
  map2nodes[1] = new Node(400, 200, 1, 0);
  map2nodes[2] = new Node(600, 200, 0, 1);
  map2nodes[3] = new Node(600, 350, 1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    mapSelect();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
