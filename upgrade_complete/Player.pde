class Player extends Sprite {
  
  Player(float x, float y) {
    super(x, y);
  }
  
  void show() {
    ellipse(x, y, 100, 100);
  }
}