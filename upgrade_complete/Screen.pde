class Screen {
    String name;
    
    Screen(String screenName) {
      name = screenName;
    }
    
    void display() {
        if (name.equals("Welcome")) {
          if (timeElapsed > 3000 && timeElapsed< 3100){
            System.out.println("asd");
          welcome();
        }} else if (name.equals("Store")) {
          store();
        } else if (name.equals("Menu")) {
          menu();
        } else {
          play();
        }
    }
    
}