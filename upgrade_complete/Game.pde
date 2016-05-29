final int NUM_ENEMIES = 5;
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
    // Player
    player = new Player(width / 2, height - 100);
    // Enemies
    enemies = new ArrayList<Enemy>();
    activeEnemies = new ArrayList<Enemy>();
    removedEnemies = new ArrayList<Enemy>();
    passEnemies = new ArrayList<Enemy>();
    shooter = new Shooter(5);
    for (int i = 0; i < NUM_ENEMIES; i++) {
      enemies.add(new Enemy((int) (Math.random()* (width-100)), 0));
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
    passingEnemies();
    shooter.show();
    shooter.update();
    println("Player angle: " + player.getAngle());
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
    return false;
    //return (removedEnemies.size() + passEnemies.size() == numEnemies) && activeEnemies.isEmpty();
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
    for (int i = 0; i < activeEnemies.size(); i++) {
      if (activeEnemies.get(i).isHovering()) {
        removedEnemies.add(activeEnemies.remove(i));
        
      }
    }
  }

  void passingEnemies(){
    for (int i = 0; i < activeEnemies.size(); i++) {
      if (activeEnemies.get(i).getY() >= SCREEN_HEIGHT){
        println("passed");
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
  
  void laser() {
    // Laser
    pushStyle();
    stroke(255, 0, 0);
    strokeWeight(5);
    line(player.getX(), player.getY(), mouseX, mouseY);
    popStyle();
    // Destroy Enemies
    destroyEnemies();
  }
}