class Player extends Sprite {
  float angle;
  float xVelocity;
  float yVelocity;
  float xAcceleration;
  float yAcceleration;
  
  Player(float x, float y) {
    super(x, y);
    angle = 0;
    xVelocity = 1;
    yVelocity = 1;
    xAcceleration = 0.05;
    yAcceleration = 0.05;
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
  
  void goLeft() {
    if (withinBounds(-xVelocity, 0)) {
      game.player.setX(game.player.getX() - xVelocity);
    }
    if (Math.abs(xVelocity + xAcceleration) <= 5) {
      xVelocity += xAcceleration;
    }
  }
  void goRight() {
    if (withinBounds(xVelocity, 0)) {
      game.player.setX(game.player.getX() + xVelocity);
    }
    if (Math.abs(xVelocity + xAcceleration) <= 5) {
      xVelocity += xAcceleration;
    }
  }
  
  void goUp() {
    if (withinBounds(0, -yVelocity)) {
      game.player.setY(game.player.getY() - yVelocity);
    }
    if (Math.abs(yVelocity + yAcceleration) <= 5) {
      yVelocity += yAcceleration;
    }
  }
  void goDown() {
    if (withinBounds(0, yVelocity)) {
      game.player.setY(game.player.getY() + yVelocity);
    }
    if (Math.abs(yVelocity + yAcceleration) <= 5) {
      yVelocity += yAcceleration;
    }
  }
  
  boolean withinBounds(float dx, float dy) {
    return location.x + dx >= 0 && location.x + dx <= width &&
           location.y + dy >= 0 && location.y + dy <= height;
  }
  
  void rotateLeft() {
    angle += 1.5;
    angle = angle % 360;
  }
  
  void rotateRight() {
    angle -= 1.5;
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