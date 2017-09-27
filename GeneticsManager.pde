class GeneticsManager {
  GliderManager _gm;
  
  int update_counter;
  int dna_size;
  
  int generations;
  
  PVector finish;
  
  GeneticsManager(int glider_amount, int dna_size) {
    finish = new PVector(width, height/2);
    _gm = new GliderManager(dna_size, glider_amount, new Terrain(), finish);
    update_counter = 1;
    this.dna_size = dna_size;
    generations = 1;
  }
  
  void update() {
    boolean all_dead = _gm.update(); 
    if (/*update_counter++%dna_size==0 || */all_dead) {
      _gm.generation_step();
      update_counter = 1;
      generations++;
    }
  }
  
  void show() {
     _gm.show();
    fill(255);
    textSize(30);
    text("Generation "+generations, 0,0, width, height);
  }

}