void fileParse(Map<String, Integer> dict, String file) {
  Scanner f = new Scanner(file);
  String line;
  while (f.hasNextLine()) {
    line = f.nextLine();
    try {
      dict.put(line.split(":")[0], 
            Integer.parseInt(line.split(":")[1].trim()));
    } catch (IndexOutOfBoundsException e) {
      System.out.println(e.getMessage());
    }
  }
  f.close();
}