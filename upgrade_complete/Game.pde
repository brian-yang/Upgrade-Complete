int NUM_ENEMIES = 3;
int level = 1;

final int SCREEN_WIDTH = 1024;
final int SCREEN_HEIGHT = 768;

class Game {
  // PImage player;
  Player player;
  ArrayList<Enemy> enemies;
  ArrayList<Enemy> activeEnemies;
  ArrayList<Enemy> removedEnemies;
  ArrayList<Enemy> passEnemies;
  int timer;
  int enemyTimer;
  Shooter shooter;
  // ======================================================
  /* SETUP GAME */
  // ======================================================


  Game() {
    song1.loop();
    song1.play();
    NUM_ENEMIES += (level / 2);
    
    // Player
    player = new Player(width / 2, height - 100);
    // Enemies
    enemies = new ArrayList<Enemy>();
    activeEnemies = new ArrayList<Enemy>();
    removedEnemies = new ArrayList<Enemy>();
    passEnemies = new ArrayList<Enemy>();
    shooter = new Shooter(100);
    for (int i = 0; i < NUM_ENEMIES; i++) {
      enemies.add(new Enemy((int) (Math.random()* (width-100)), 0, level));
    }
    // Timer
    timer = 0;
  }
  // ======================================================
  /* RUN GAME */
  // ======================================================

  void run() {
    gameBackground();
    drawPlayer();
    playerFlex();
    drawEnemies();
    shooter.show();
    shooter.update();
    destroyEnemies();
    passingEnemies();
    //println("Player angle: " + player.getAngle());
    /*  We created our own timer
     *  because the built-in timing functions
     *  were buggy.
     */
    timer++;
  }

  // ======================================================
  /* WINNING CONDITION */
  // ======================================================

  boolean isFinished() {
    return (removedEnemies.size() + passEnemies.size() == NUM_ENEMIES);
  }

  // ======================================================
  /* DRAW HELPER METHODS */
  // ======================================================

  void drawPlayer() {
    showPlayer();
  }

  void drawEnemies() {
    enemyTimer = timer / 100;
    //System.out.println(enemyTimer); // test timer

    if (enemyTimer < NUM_ENEMIES &&
      !activeEnemies.contains(enemies.get(enemyTimer)) &&
      !removedEnemies.contains(enemies.get(enemyTimer))) {
      activeEnemies.add(enemies.get(enemyTimer));
    }

    for (Enemy enemy : activeEnemies) {
      showEnemy(enemy, enemy.getX(), enemy.getY());
    }

    for (Enemy enemy : activeEnemies) {
      enemy.setY(enemy.getY() + 1);
      //System.out.println(enemy.getY()); // test y coordinate of current enemy
    }
    //System.out.println(activeEnemies); // test how many enemies are being created
  }

  void destroyEnemies() {
    boolean removed = false;
    for (int i = 0; i < activeEnemies.size(); i++) {
      removed = shootDestroy(activeEnemies.get(i));
      if (!removed) {
        removed = laserDestroy(activeEnemies.get(i));
      }
      if (removed) {
        removedEnemies.add(activeEnemies.remove(i));
        i--;
        boom.rewind();
        boom.play();
        removed = false;
      }
    }
  }

  
  void passingEnemies() {
    for (int i = 0; i < activeEnemies.size(); i++) {
      if (activeEnemies.get(i).getY() >= SCREEN_HEIGHT) {
        System.out.println("passed");
        passEnemies.add(activeEnemies.get(i));
        activeEnemies.remove(activeEnemies.get(i));
      }
    }
  }
  // ======================================================
  /* WEAPONS */
  // ======================================================  
  void shoot() {
    shooter.shoot(player.getX(), player.getY(), player.getAngle());
  }

  boolean shootDestroy(Enemy enemy) {
    println(shooter.bullets.size());
    for (int j = 0; j < shooter.bullets.size(); j++) {
      if (enemy.hasCollided(shooter.bullets.get(j).getX(), shooter.bullets.get(j).getY())&&enemy.health <= 1){
        shooter.bullets.remove(j);
        return true;}
      else {if (enemy.hasCollided(shooter.bullets.get(j).getX(), shooter.bullets.get(j).getY())){
        enemy.health -= 1;
        shooter.bullets.remove(j);
      }
      }   
    }
    return false;
  }

  void laser() {
    // Laser
    pushStyle();
    stroke(255, 0, 0);
    strokeWeight(5);
    line(player.getX(), player.getY(), mouseX, mouseY);
    popStyle();
    laser.rewind();
    laser.play();
  }

  boolean laserDestroy(Enemy enemy) {
    return enemy.laserShot();
  }
}