class Bullet {
  PVector location;
  PVector velocity;
  
  Bullet(float x, float y, float angle) {
    location = new PVector(x, y);
    PVector target = new PVector(x + 20 * cos(radians(-angle + 270)), y + 20 * sin(radians(-angle + 270)));
    velocity = PVector.sub(target, location);
    velocity.normalize();
    velocity.mult(5);
  }
  
  
  void show() {
    int bulletLevel = curUpgradeLevels.get("Minigame Graphics");
    if (bulletLevel == 1){
    pushStyle();
    ellipseMode(CENTER);
    ellipse(location.x, location.y, 20, 20);
    popStyle();
    } else if (bulletLevel == 2){
      pushStyle();
    image(bullet1,location.x, location.y);
    popStyle();
  }
  }
  void update() {
    location.add(velocity);
  }
  
  void checkEdges() {
  
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  
  }
  
  float getX() {
    return location.x;
  } 
  
  float getY() {
    return location.y;
  }
}