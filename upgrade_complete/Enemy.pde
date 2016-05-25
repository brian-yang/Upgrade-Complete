class Enemy extends Sprite {

  Enemy(float x, float y) {
    super(x, y);
  }

  boolean isHovering() {
    return mouseX > (x - spriteWidth / 2) && 
           mouseX < (x + spriteWidth / 2) && 
           mouseY > (y - spriteWidth / 2) && 
           mouseY < (y + spriteHeight / 2);
  }
  
  void showHitBox() {
    pushStyle();
    rectMode(CENTER);
    rect(x, y, spriteWidth, spriteHeight);
    popStyle();
  }
}