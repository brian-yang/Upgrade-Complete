class Sprite {
  double x, y;
  
  Sprite(double x, double y) {
    this.x = x;
    this.y = y;
  }
  
  void show() {
     fill(10,70,100);
     rect((float) x, (float) y, 100, 100);
  }

  void setX(double x) {
    this.x = x;
  }

  void setY(double y) {
    this.y = y;
  }
  
  double getX() { return x; }
  double getY() { return y; }
}