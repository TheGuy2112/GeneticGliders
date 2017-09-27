class Glider implements Comparable<Glider>{
  DNA dna;
  PVector pos;
  int dna_pointer;
  
  PVector dir;
  
  boolean alive;
  
  PVector _finish;
  
  String name;
  
  final String[] names = "abcdefghjklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
  
  Glider(int dna_size, PVector start, PVector finish, int name_pointer) {
    dna = new DNA(dna_size, random(0.02)+0.01);
    pos = start;
    dna_pointer = 0;
    dir = (new PVector(1,0)).normalize();
    alive = true;
    _finish = finish;
    name = names[name_pointer%names.length];
  }
  
  void update() {
    if (alive) {
      dir.normalize().rotate(dna.get_dna()[dna_pointer]);
      pos.add(dir.mult(5));
      dna_pointer = (dna_pointer+1)%dna._dna.length;
    }
  }
  
  void show() {
    fill(255);
    stroke(255);
    strokeWeight(1);
    PVector p = new PVector(pos.x-dir.x*5,pos.y-dir.y*5);
    line(pos.x,pos.y,p.x,p.y);
    fill(255,0,0);
    stroke(255,0,0);
    strokeWeight(3);
    point(pos.x, pos.y);
  }
  
  void kill() {
    alive = false; 
  }
  
  int compareTo(Glider g) {
    float sq = sqrt(width*width+height*height);
    //int val = (int)((((pos.dist(_finish)/sq)+((500-dna_pointer)/500.0))-((g.pos.dist(_finish)/sq)+((500-g.dna_pointer)/500.0))));
    int val = (int)(pos.dist(_finish)-g.pos.dist(_finish));
    if (val == 0) {
      val = g.dna_pointer-dna_pointer; 
    }
    if (val != 0) val/=abs(val);
    //println(val);
    return val;
  }
}