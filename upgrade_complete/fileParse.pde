void fileParse(Map<String, Integer> dict, String file) {
  Scanner s = new Scanner(createReader(file));
  String line;
  while (s.hasNextLine() && !(line = s.nextLine()).isEmpty()) {
   println(Arrays.toString(line.split(":")));
       try {
         String[] data = line.split(":");
         dict.put(data[0], Integer.parseInt(data[1].trim()));
       } catch (IndexOutOfBoundsException e) {
         System.out.println("ERROR: File parsing failed.");
       }
  }
  s.close();
}