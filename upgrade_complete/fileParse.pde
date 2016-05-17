void fileParse(HashMap<String, String> dict, String file) {
  Scanner f = new Scanner(file);
  String line;
  while (f.hasNextLine()) {
    line = f.nextLine();
    dict.put(line.split(":")[0], line.split(":")[1]);
  }
  
}