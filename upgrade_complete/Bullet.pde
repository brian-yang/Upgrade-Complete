class Bullet {
  PVector location;
  PVector velocity;
  
  Bullet(float x, float y, float angle) {
    location = new PVector(x, y);
    PVector target = new PVector(x + 20 * cos(radians(-angle + 270)), y + 20 * sin(radians(-angle + 270)));
    velocity = PVector.sub(target, location);
    velocity.normalize();
    velocity.mult(2);
  }
  
  void show() {
    pushStyle();
    ellipseMode(CENTER);
    ellipse(location.x, location.y, 50, 50);
    popStyle();
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
}