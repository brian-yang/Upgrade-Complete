class Player extends Sprite {
  float angle;
  
  Player(float x, float y) {
    super(x, y);
    angle = 0;
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    rotate(-radians(angle));
    pushStyle();
    rectMode(CENTER);
    rect(0, 0, spriteWidth, spriteHeight);
    popStyle();
    popMatrix();
  }
  
  void rotateLeft() {
    angle += 1;
  }
  
  void rotateRight() {
    angle -= 1;
  }
  
  void showHitBox() {
    pushStyle();
    rectMode(CENTER);
    rect(x, y, spriteWidth, spriteHeight);
    popStyle();
  }
}