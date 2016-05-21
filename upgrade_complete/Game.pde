class Game {
  // PImage player;
  Player player;
  ArrayList<Enemy> enemies;
  ArrayList<Enemy> activeEnemies;
  ArrayList<Enemy> removedEnemies;
  int numEnemies;
  int timer;
  int enemyTimer;
// ======================================================
/* SETUP GAME */
// ======================================================


  Game() {
    // Player
    player = new Player(width / 2, height / 2);
    // Enemies
    enemies = new ArrayList<Enemy>();
    activeEnemies = new ArrayList<Enemy>();
    removedEnemies = new ArrayList<Enemy>();
    numEnemies = 5;
    for (int i = 0; i < numEnemies; i++) {
      enemies.add(new Enemy((int) (Math.random() * width), 0));
    }
    // Timer
    timer = 0;
  }

// ======================================================
/* RUN GAME */
// ======================================================

  void run() {
    drawPlayer();
    drawEnemies();
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
    return enemyTimer >= numEnemies && activeEnemies.isEmpty();
  }

// ======================================================
/* DRAW HELPER METHODS */
// ======================================================

  void drawPlayer() {
    player.show();
  }

  void drawEnemies() {
    enemyTimer = timer / 100;
    //System.out.println(enemyTimer); // test timer
    if (enemyTimer < numEnemies &&
        !activeEnemies.contains(enemies.get(enemyTimer)) &&
        !removedEnemies.contains(enemies.get(enemyTimer))) {
      activeEnemies.add(enemies.get(enemyTimer));
    }
    for (Enemy enemy : activeEnemies) {
      enemy.show();
    }
    for (Enemy enemy : activeEnemies) {
      enemy.setY(enemy.getY() + 1);
      //System.out.println(enemy.getY()); // test y coordinate of current enemy
    }
    //System.out.println(activeEnemies); // test how many enemies are being created
  }
  
  void destroyEnemies() {
    for (int i = 0; i < activeEnemies.size(); i++) {
      if (activeEnemies.get(i).isHovering()) {
        removedEnemies.add(activeEnemies.remove(i));
      }
    }
  }
}