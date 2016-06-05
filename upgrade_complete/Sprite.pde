class Sprite {
  PVector location;
  float spriteWidth;
  float spriteHeight;
  float health;

  Sprite(float x, float y) {
    location = new PVector(x, y);
    spriteWidth = 100;
    spriteHeight = 100;
  }
  Sprite(float x, float y, float health){
    this(x, y);
    this.health = health;
    spriteWidth = 100;
    spriteHeight = 100;
    health = 3;
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
     rect(location.x, location.y, spriteWidth, spriteHeight);
     popStyle();
  }

  // Getters and setters
  void setX(float x) { this.location.x = x; }
  void setY(float y) { this.location.y = y; }
  float getX() { return location.x; }
  float getY() { return location.y; }
  float getSpriteWidth() { return spriteWidth; }
  float getSpriteHeight() { return spriteHeight; }
  float getHealth(){ return health;}
}