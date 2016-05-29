class Shooter {
  ArrayList<Bullet> bullets;
  int limit;
  int bulletsShot;
  
  Shooter(int limit) {
    bullets = new ArrayList<Bullet>();
    this.limit = limit;
    bulletsShot = 0;
  }
  
  void shoot(float x, float y, float angle) {
    if (bulletsShot < limit) {
        bullets.add(new Bullet(x, y, angle));
    }
    bulletsShot = bullets.size();
  }
  
  void show() {
    for (Bullet b : bullets) {
      b.show();
    }
  }
  
  void update() {
    for (Bullet b : bullets) {
      b.update();
    }
  }
}
  
  
  
  