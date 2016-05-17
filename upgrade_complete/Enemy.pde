class Enemy extends Sprite {

  Enemy(float x, float y) {
    super(x, y);
  }

  boolean isHovering() {
    return mouseX > x && 
           mouseX < (x + spriteWidth) && 
           mouseY > y && 
           mouseY < (y + spriteHeight);
  }
}