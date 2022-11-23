class ChonkyMob extends Mob {


  ChonkyMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    maxhp = 20 + wave;
    hp = maxhp;
    value = 5;
    fillColor = orange;
    strokeColor = red;
    speed = 0.5;
  }
}
