import java.io.*;

class Terrain {
  ArrayList<Wall> walls;
  
  Terrain() {
    walls = new ArrayList<Wall>();
  }
  
  void add(int x, int y, int w, int h) {
    walls.add(new Wall(x,y,w,h));
  }
  
  boolean collides(PVector p) {
    if (p.x<0 || p.x>width || p.y<0 || p.y>height) return true;
    for (Wall w:walls) {
      if (w.collides(p)) return true; 
    }
    return false;
  }
  
  void show() {
    for (Wall w:walls) w.show(); 
  }
  
  void save_to_file(){
    try {
       File f = new File("terrain.txt");
       FileWriter fw = new FileWriter(f);
       for (Wall w:walls) {
         fw.write(w.x+","+w.y+","+w.w+","+w.l+"\n"); 
       }
       fw.close();
    } catch (Exception e) {}
  }
  
  void read_from_file(){   
    try {
      walls = new ArrayList<Wall>();
      Scanner sc = new Scanner(new File("terrain.txt"));
      while (sc.hasNextLine()) {
        String line = sc.nextLine();
       String[] split = line.split(",");
       add(int(split[0]), int(split[1]), int(split[2]), int(split[3]));
      }
      sc.close();
    } catch (Exception e) {}
  }
  
  @Override
  String toString() {
    String to = "";
    for (Wall w : walls) {
      to += w.toString()+"\n"; 
    }
    return to;
  }
}