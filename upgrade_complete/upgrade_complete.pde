import controlP5.*;
import java.util.Arrays;

ControlP5 controlP5;
HashMap<String, Screen> screens;
String curScreen;
int gameMode;
Game game;
// ======================================================
/* SETUP & DRAW */
// ======================================================

void setup() {
  size(900, 1000);
  smooth();
  
  controlP5 = new ControlP5(this);
  
  initializeScreens(); // initializes all screens
  
  // implemented in setupButtons tab
  screenButtons();
  upgradeButtons();

  curScreen = "Welcome";
  screens.get(curScreen).display(); // display Welcome screen
}

void draw() {
   background(255);
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
  if (event.getController().getId() == 0) {
    // System.out.println(event.getController().getName());
    setScreen("Store");
  } else if (event.getController().getId() == 1) {
    // System.out.println(event.getController().getName());
    setScreen(event.getController().getName());
  }
}

void mousePressed() {
  if (gameMode > 0) {
    game.destroyEnemies();
  }
}

// ======================================================
/* MANAGE SCREENS */
// ======================================================

// initializes screens
void initializeScreens() {
    screens = new HashMap < String, Screen > ();
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