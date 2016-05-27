class Player extends Sprite {
  float angle;
  
  Player(float x, float y) {
    super(x, y);
    angle = 0;
  }
  
  void show() {
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(angle));
    pushStyle();
    rectMode(CENTER);
    rect(x, y, spriteWidth, spriteHeight);
    popStyle();
    rotate(-radians(angle));
    translate(-width/2, -height/2);
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