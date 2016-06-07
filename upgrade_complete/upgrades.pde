void backgroundGen() {
  int bgLevel = curUpgradeLevels.get("Background");
  if (bgLevel == 2) {
    background(32, 75, 100);
  } else if (bgLevel == 3) {
    background(bg);
  } else {
    background(255);
  }
}

void showPlayer() {
  int playerLevel = curUpgradeLevels.get("Minigame Graphics");
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
  int enemyLevel = curUpgradeLevels.get("Minigame Graphics");
  if (enemyLevel == 2) {
    enemyImage.resize(200,200);
    imageMode(CENTER);
    image(enemyImage, x, y);
  } else {
    enemy.show();
  }
}

void gameBackground() {
  int gameBGLevel = curUpgradeLevels.get("Minigame Graphics");
  if (gameBGLevel == 2) {
    background(gameBG);
  } else {
    background(0, 102, 204);
  }
}

void playerFlex() {
  int flex = curUpgradeLevels.get("Player Movement");
  if (keys['Q']) {
    game.player.rotateLeft();
  }
  if (keys['E']) {
    game.player.rotateRight();
  }
  if (flex >= 2) {
    if (keys['A']) {
      game.player.goLeft();
    }
    if (keys['D']) {
      game.player.goRight();
    }
    if (flex >= 3) {
      if (keys['W']) {
        game.player.goUp();
      }
      if (keys['S']) {
        game.player.goDown();
      }
    }
  }
  if (flex >= 4) {
    if (keys['A'] && keys['D']) {
      game.player.xVelocity = 1;
    }
    if (keys['W'] && keys['S']) {
      game.player.yVelocity = 1;
    }
    if (!keys['A'] && !keys['D']) {
      game.player.xVelocity = 1;
    }
    if (!keys['W'] && !keys['S']) {
      game.player.yVelocity = 1;
    }
  }
}

void weapons() {
  int weaponLevel = curUpgradeLevels.get("Weapons");
  if (weaponLevel >= 2) {
    game.lightning();
  }
}

void textUpgrade() {
  controlP5.setFont(controlBetterFont);
}