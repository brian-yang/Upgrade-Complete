class Game {
  // PImage player;
  Sprite player;
  ArrayList<Sprite> enemies;
  ArrayList<Sprite> activeEnemies;
  int numEnemies;
  int timer;
  
  Game() {
    // Player
    player = new Sprite(width / 2, height / 2);
    // Enemies
    enemies = new ArrayList<Sprite>();
    activeEnemies = new ArrayList<Sprite>();
    numEnemies = 20;
    for (int i = 0; i < numEnemies; i++) {
      enemies.add(new Sprite((int) (Math.random() * width), 0));
    }
    // Timer
    timer = 0;
  }
  
  boolean isFinished() {
   return false; 
  }
  
  void run() {
    drawPlayer();
    drawEnemies();
   /*  We created our own timer
    *  because the built-in timing functions
    *  were buggy.
    */
    timer++;
  }
  
  void drawPlayer() {
    player.show();
  }
  
  void drawEnemies() {
    int enemyTimer = timer / 100;
    //System.out.println(enemyTimer);
    if (enemyTimer < numEnemies) {
      activeEnemies.add(enemies.get(enemyTimer));
    }
    for (Sprite enemy : activeEnemies) {
      enemy.show();
    }
    for (Sprite enemy: activeEnemies) {
      enemy.setY(enemy.getY() + 0.01);
      //System.out.println(enemy.getY());
    }
  }
}