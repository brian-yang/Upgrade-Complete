class Player extends Sprite {
  float angle;
  
  Player(float x, float y) {
    super(x, y);
    angle = 0;
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(-radians(angle));
    pushStyle();
    rectMode(CENTER);
    rect(0, 0, spriteWidth, spriteHeight);
    popStyle();
    popMatrix();
  }
  
  void rotateLeft() {
    angle += 1;
    angle = angle % 360;
  }
  
  void rotateRight() {
    angle -= 1;
    angle = angle % 360;
  }
  
  float getAngle() {
    return angle;
  }
  
  void showHitBox() {
    pushStyle();
    ellipseMode(CENTER);
    ellipse(location.x, location.y, spriteWidth, spriteHeight);
    popStyle();
  }
  
  void showShooterPointer() {
    rectMode(CENTER);
    rect(location.x + 10 * cos(radians(-angle + 270)), location.y + 10 * sin(radians(-angle + 270)), 10, 10);
  }
}