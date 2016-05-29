void backgroundGen() {
  int bgLevel = upgrades.get("Background");
  if (bgLevel == 2) {
    background(32, 75, 100);
  } else if (bgLevel == 3) {
    background(bg);
  } else {
    background(255);
  }
}

void showPlayer() {
  int playerLevel = upgrades.get("Enemy & Player");
  if (playerLevel == 2) {
    pushMatrix();
    translate(game.player.getX(), game.player.getY());
    rotate(-radians(game.player.angle));
    imageMode(CENTER);
    image(player, 0, 0);
    popMatrix();
  } else {
    game.player.show();
  }
}

void showEnemy(Enemy enemy, float x, float y) {
  int enemyLevel = upgrades.get("Enemy & Player");
  if (enemyLevel == 2) {
    enemyImage.resize(200,200);
    imageMode(CENTER);
    image(enemyImage, x, y);
  } else {
    enemy.show();
  }
}

void gameBackground() {
  int gameBGLevel = upgrades.get("Enemy & Player");
  if (gameBGLevel == 2) {
    background(gameBG);
  } else {
    background(0, 102, 204);
  }
}

void playerFlex() {
  int flex = upgrades.get("Player Flexibility");
  if (keys['Q']) {
    game.player.rotateLeft();
  }
  if (keys['E']) {
    game.player.rotateRight();
  }
  if (flex >= 2) {
    if (keys['A']) {
      game.player.setX(game.player.getX() - 1);
    }
    if (keys['D']) {
      game.player.setX(game.player.getX() + 1);
    }
    if (flex >= 3) {
      if (keys['W']) {
        game.player.setY(game.player.getY() - 1);
      }
      if (keys['S']) {
        game.player.setY(game.player.getY() + 1);
      }
    }
  }
  // add acceleration
}

void weapons() {
  int weaponLevel = upgrades.get("Weapons");
  if (weaponLevel == 2) {
    //game.strike();
  }
  if (weaponLevel == 3) {
    game.laser();
  }
}