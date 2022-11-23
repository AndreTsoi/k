class SpeedyMob extends Mob {


  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 40;
    maxhp = 5 + wave;
    hp = maxhp;
    value = 3;
    fillColor = black;
    strokeColor = white;
    speed = 2.5;
  }
}
