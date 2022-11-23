//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring {
  boolean circle;
  float x, y;
  int d;
  int i;

  AoE_Ring(float _x, float _y, int _d) {
    x = _x;
    y = _y;
    d = _d;
    i = 0;
    circle = false;
  }

  void show() {
    stroke(white);
    fill(gray, 20);
    circle(x, y, d);
  }

  void act() {
  }
}
