class Player extends Sprite {
  
  Player(float x, float y) {
    super(x, y);
  }
  
  void show() {
    pushStyle();
    ellipseMode(CENTER);
    ellipse(x, y, spriteWidth, spriteHeight);
    popStyle();
  }
  
  void showHitBox() {
    pushStyle();
    rectMode(CENTER);
    rect(x, y, spriteWidth, spriteHeight);
    popStyle();
  }
}