class Enemy extends Sprite {

  Enemy(float x, float y, float health) {
    super(x, y, health);
  }
  
  boolean hasCollided(float x, float y) {
    return x >= (this.location.x - spriteWidth / 2) && 
           x <= (this.location.x + spriteWidth / 2) && 
           y >= (this.location.y - spriteWidth / 2) && 
           y <= (this.location.y + spriteHeight / 2);
  }

  boolean laserShot() {
    return mousePressed && hasCollided(mouseX, mouseY);
  }
  
  void showHitBox() {
    pushStyle();
    ellipseMode(CENTER);
    ellipse(location.x, location.y, spriteWidth, spriteHeight);
    popStyle();
  }
}