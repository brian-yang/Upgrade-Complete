import controlP5.*;
import java.util.*;
import java.io.*;

ControlP5 controlP5;
HashMap<String, Screen> screens;
String curScreen;
int gameMode;
int money;
int timeElapsed;
boolean introPassed;
boolean[] keys;
Game game;
PImage bg;
PImage player;
PImage enemyImage;
PImage gameBG;
// ======================================================
/* SETUP & DRAW */
// ======================================================

void setup() {
  size(1024,768);
  smooth();
  
  controlP5 = new ControlP5(this);
  
  initializeScreens(); // initializes all screens
  
  // implemented in setupButtons tab
  screenButtons();
  upgradeButtons();

  curScreen = "Welcome";
  screens.get(curScreen).display(); // display Welcome screen
  money += 500;
  
  //load variables
  bg = loadImage("pictures/space.jpg");
  player = loadImage("pictures/spaceship.png");
  enemyImage = loadImage("pictures/enemy.png");
  gameBG = loadImage("pictures/gameBG.png");
  keys = new boolean[255];
  introPassed = false;
}

void draw() {
   timeElapsed = millis();
   backgroundGen();
   // FOR TESTING SCREEN CHANGES
   fill(30,100,200);
   textSize(100);
   text(curScreen, 50, 100);
   // ==========================
   screens.get(curScreen).display(); // display current screen
}

// ======================================================
/* EVENTS */
// ======================================================

// similar to keyPressed but specifically for controlP5 elements

void controlEvent(ControlEvent event) {
  Controller c = event.getController();
  if (c.getId() == 0) {
    // System.out.println(event.getController().getName());
    if (c.getName().equals("Intro")) {
      introPassed = true;
    } else {
      setScreen("Store");
    }
  } 
  else if (c.getId() == 1) {
    // System.out.println(event.getController().getName());
    setScreen(c.getName());
   
  } 
  else if (c.getId() == 2) {
    buyUpgrade(c);
  }
}

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}

void mousePressed() {
 if (gameMode > 0) {
   game.shootLaser();
 }
}

void mouseDragged() {
  if (gameMode > 0) {
    game.shootLaser();
  }
}

void buyUpgrade(Controller c) {
    if (money - 10 >= 0) {
      // 1. Get current level of the upgrade
      int curValue = Integer.parseInt((c.getStringValue()));
      // 2. Increment the level by one
      c.setStringValue(Integer.toString(curValue + 1));
      // 3. Set the label of the button to the new level
      c.setLabel(c.getName() + "\n\nLevel: " + c.getStringValue());
      // 4. Change the level in the upgrades dictionary
      upgrades.put(c.getName(), Integer.parseInt(c.getStringValue()));
      // 5. Decrease the amount of money the player has
      money -= 10;
    }
}

// ======================================================
/* MANAGE SCREENS */
// ======================================================

// initializes screens
void initializeScreens() {
    screens = new HashMap <String, Screen> ();
    screens.put("Welcome", new Screen("Welcome"));
    screens.put("Store", new Screen("Store"));
    screens.put("Menu", new Screen("Menu"));
    screens.put("Play", new Screen("Play"));
}

// sets the current screen
void setScreen(String name) {
    curScreen = name;
    for (Button b : activeButtons) {
      b.hide();
    }
    activeButtons.clear();
    if (name.equals("Play")) {
      game = new Game();
      gameMode = 1;
    }
}