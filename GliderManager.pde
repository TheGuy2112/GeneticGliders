import java.util.*;

class GliderManager {
  ArrayList<Glider> gliders;
  int DNA_SIZE; 
  PVector _finish;
  ArrayList<Float> fitness;
  
  Terrain t;
  
  int kill_count;
  
  int glider_amount;
  
  Tree<Glider> family_tree;
  
  //because wtf processing
  int glider_name_pointer;
  
  public GliderManager(int dna_size, int amount, Terrain t, PVector finish) {
    glider_name_pointer = 0;
    glider_amount = amount;
     DNA_SIZE = dna_size;
     _finish = finish;     
     
     family_tree = new Tree<Glider>();
     family_tree.add_anchor("", null);
     
     gliders = new ArrayList<Glider>();
     
     for (int i=0;i<amount;i++) { //<>//
       Glider new_glider = create_random_glider();
       gliders.add(new_glider);
       family_tree.add_child_to("", null, new_glider.name);
     }
     
     this.t = t;
     this.t.read_from_file();
     kill_count = 0;
  } //<>//
  
  boolean update() {
    for (int i=0;i<gliders.size();i++) {
       Glider g = gliders.get(i);
       g.update();
       if (t.collides(g.pos) && g.alive) {
         g.kill();
         kill_count++;
       }
    }
    return kill_count >= gliders.size();
  }
  
  Glider create_random_glider() {
    Glider new_glider = new Glider(DNA_SIZE, new PVector(5,height/2), _finish, glider_name_pointer);
    for (int i=0;i<DNA_SIZE;i++) {
      new_glider.dna._dna[i] = random(-PI/8,PI/8);
    }
    glider_name_pointer++;
    return new_glider;
  }
  
  void sort_after_fitness() {
    try {
      Collections.sort(gliders);
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(-1);
    }
  }
  
  void eliminate() {
    ArrayList<Glider> new_gliders = new ArrayList<Glider>();
    for (int i=0;i<gliders.size()/2;i++) {
      if (i==0) {
        for (int j=0;j<gliders.size()/5-1;j++)
          new_gliders.add(gliders.get(i));
      } else if (i==1) {
        for (int j=0;j<gliders.size()*16/100;j++)
          new_gliders.add(gliders.get(i));
      } else if (i==2) {
        for (int j=0;j<gliders.size()*14/100;j++)
          new_gliders.add(gliders.get(i));
      } else new_gliders.add(gliders.get(i));
    }
    gliders = new_gliders;
  }
  
  void populate() {
    ArrayList<Glider> children = new ArrayList<Glider>();
    ArrayList<Glider> parents = gliders;
    
    for (int i=0;i<glider_amount/5;i++) {
      for (int j=0;j<9;j++) parents.add(gliders.get(i)); 
    }
    
    for (int i=0;i<glider_amount;i++) {
      Glider parent1 = parents.get((int)random(gliders.size()));
      Glider parent2 = parents.get((int)random(gliders.size()));
      Glider child = new Glider(parent1.dna.length(), new PVector(5,height/2), _finish, glider_name_pointer);
      child.dna = parent1.dna.cross(parent2.dna);
      children.add(child);
      glider_name_pointer++;
      
       family_tree.add_child_to(parent1.name, null, child.name);
    }
    gliders = children;
  }
  
  void generation_step() {
    sort_after_fitness();
    eliminate();
    populate();
    kill_count = 0;
    //family_tree.print_tree();
  }
  
  void show() {
    background(0);
    t.show();
    fill(255,0,0);
    stroke(0);
    for (Glider g:gliders) g.show();
    fill(0,255,0);
    stroke(0,255,0);
    strokeWeight(10);
    point(_finish.x,_finish.y);
  }
}