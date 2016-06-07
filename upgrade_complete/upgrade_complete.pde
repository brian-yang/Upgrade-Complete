import controlP5.*;
import java.util.*;
import java.io.*;
import ddf.minim.*;

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
AudioPlayer bullet;
AudioPlayer electricity;
AudioPlayer laser;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer boom;
Minim minim;
PFont betterFont;
ControlFont controlBetterFont;
// ======================================================
/* SETUP & DRAW */
// ======================================================

void setup() {
  size(1024, 768);
  smooth();
  minim = new Minim(this);
  bullet = minim.loadFile("sound/bullet.wav");
  electricity = minim.loadFile("sound/electricity.wav");
  laser = minim.loadFile("sound/laser.wav");
  song1 = minim.loadFile("sound/song1.mp3");
  song2 = minim.loadFile("sound/song2.mp3");
  boom = minim.loadFile("sound/boom.wav");
  controlP5 = new ControlP5(this);
  controlP5.setFont(new ControlFont(createFont("Comic Sans MS", 10)));
  //printArray(PFont.list());

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
  player.resize(150, 0);
  enemyImage = loadImage("pictures/enemy.png");
  gameBG = loadImage("pictures/gameBG.png");
  keys = new boolean[255];
  introPassed = false;
  betterFont = loadFont("DroidSansMonoForPowerline-8.vlw");
  controlBetterFont = new ControlFont(betterFont);
}

void draw() {
  timeElapsed = millis();
  backgroundGen();
  // FOR TESTING SCREEN CHANGES
  fill(30, 100, 200);
  textSize(100);
  text(curScreen, 50, 100);
  // ==========================
  screens.get(curScreen).display(); // display current screen
  // ==========================
  if (curUpgradeLevels.get("Weapons") >= 3 && mousePressed && gameMode > 0) {
    game.laser();
    game.laserDestroy();
  }
}

// ======================================================
/* EVENTS */
// ======================================================

// similar to keyPressed but specifically for controlP5 elements

void controlEvent(ControlEvent event) {
  controlP5.Controller c = event.getController();
  if (c.getId() == 0) {
    // System.out.println(event.getController().getName());
    if (c.getName().equals("Intro")) {
      introPassed = true;
    } else {
      setScreen("Store");
    }
  } else if (c.getId() == 1) {
    // System.out.println(event.getController().getName());
    setScreen(c.getName());
  } else if (c.getId() == 2) {
    buyUpgrade(c);
  }
}

void keyPressed() {
  keys[keyCode] = true;
  if (keys[' ']) {
    if (gameMode > 0) {
      bullet.rewind();
      bullet.play();
      game.shoot();
    }
  }
}


void keyReleased() {
  keys[keyCode] = false;
}

void buyUpgrade(controlP5.Controller c) {
  if (money - 10 >= 0) {
    // 1. Get the label of the button
    String label = c.getLabel();
    
    // 2. Get current level of the upgrade
    int curValue = Integer.parseInt(label.substring(label.length() - 1));

    if (curValue <= Integer.parseInt(c.getStringValue()) - 1) {
        // 3. Increment the level on the label by one
        c.setLabel(label.substring(0, label.length() - 1) + Integer.toString(curValue + 1));
        
        // 4. Increment the level in curUpgradeLevels
        curUpgradeLevels.put(c.getName(), curValue + 1);
    
        // 5. Decrease the amount of money the player has
        money -= 10 * curValue;
        
        // 6. Change button background color if max level is reached
        if (curValue + 1 == Integer.parseInt(c.getStringValue())) {
          c.setColorBackground(color(0, 153, 0));
        }
        
        // Edge Case: Text Upgrade
        if (c.getName().equals("Text")) {
          textUpgrade(); // found in upgrades tab
        }
    }
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
    gameover = false;
  }
}