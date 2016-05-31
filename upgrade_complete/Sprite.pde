class Sprite {
  float x, y;
  float spriteWidth;
  float spriteHeight;
  int health;

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
    spriteWidth = 100;
    spriteHeight = 100;
  }
  Sprite(float x, float y, int health){
    this(x, y);
    this.health = health;
    spriteWidth = 100;
    spriteHeight = 100;
  }
  
  Sprite(float x, float y, float w, float h) {
    this(x, y);
    spriteWidth = w;
    spriteHeight = h;
  }
  
  void show() {
     pushStyle();
     fill(10, 70, 100);
     rectMode(CENTER);
     rect(x, y, spriteWidth, spriteHeight);
     popStyle();
  }

  // Getters and setters
  void setX(float x) { this.x = x; }
  void setY(float y) { this.y = y; }
  float getX() { return x; }
  float getY() { return y; }
  float getSpriteWidth() { return spriteWidth; }
  float getSpriteHeight() { return spriteHeight; }
}