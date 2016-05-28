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
    rectMode(CENTER);
    rect(x + 10 * cos(radians(-angle + 270)), y + 10 * sin(radians(-angle + 270)), 10, 10);
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
    rectMode(CENTER);
    rect(x, y, spriteWidth, spriteHeight);
    popStyle();
  }
}