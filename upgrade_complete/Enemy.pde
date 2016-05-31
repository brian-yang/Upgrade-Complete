class Enemy extends Sprite {
  Enemy(float x, float y) {
    super(x, y);
  }
  
  int getHealth(){
    return health;}
  
  boolean hasCollided(float x, float y) {
    return x >= (this.x - spriteWidth / 2) && 
           x <= (this.x + spriteWidth / 2) && 
           y >= (this.y - spriteWidth / 2) && 
           y <= (this.y + spriteHeight / 2);
  }

  boolean laserShot() {
    return hasCollided(mouseX, mouseY);
  }
  
  void showHitBox() {
    pushStyle();
    ellipseMode(CENTER);
    ellipse(x, y, spriteWidth, spriteHeight);
    popStyle();
  }
}