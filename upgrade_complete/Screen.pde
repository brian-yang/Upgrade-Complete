class Screen {
    String name;
    Screen(String screenName) {
      name = screenName;
    }
    
    void display() {
      if (name.equals("Welcome")) {
         if (timeElapsed > 2000 ){
            fill(0);
            String welcome = "The aim of the game is to upgrade... EVERYTHING! You have to upgrade everything to truly win.";
            textSize(12);
            text(welcome, 200, 100, 300, 300);  // Text wraps within text box 
            if (timeElapsed > 4000){             
              String store = "Are you ready to start?";
              textSize(16);
              text(store,200, 150, 300, 300);
              first();
           }  // Text wraps within text box
            if (introPassed){ 
              String buyMenu = "Ok, here is $500. Have fun!";
              text(buyMenu, 200, 200, 300, 300);
              welcome();
            }
            //  if (timeElapsed > 3000 && timeElapsed <= 3050{   ****after first button resets millis to 0
           //   welcome();}
              // controlP5.addButton("Yes1")
             //   .setPosition(200, 250)
              //  .setSize(64, 32);
            }
         //       //if (mousePressed()){
         //     //    System.out.println("uh" print next dialog);}
         //     //wait more next dialog. yes button gives shop. they buy preloader , loading bar, goes loaded play! goes to menu screen with only shop there, unlock menu = play game, credits , shop gets go to menu screen
         
          //if (timeElapsed > 6000) {
         //    welcome();
      //     }
          
         
         } else if (name.equals("Store")) {
          store();
        } else if (name.equals("Menu")) {
          menu();
        } else {
          play();
        }
        
        for (Button b : activeButtons) {
          b.show();
        }
    }
}