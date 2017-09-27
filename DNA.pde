class DNA {
  private float[] _dna;
  
  private float _mutation_rate;
  
  public DNA(int length, float mutation_rate) {
    _dna = new float[length]; 
    _mutation_rate = mutation_rate;
  }
  
  private DNA(float[] dna, float mutation_rate) {
    _dna = dna;
    _mutation_rate = mutation_rate;
  }
  
  public DNA cross(DNA parent) {
    if (parent._dna.length == _dna.length) {
      float new_mutation_rate = random(1)>0.5?_mutation_rate:parent._mutation_rate;
      float[] new_dna = new float[_dna.length];

      for (int i=0;i<_dna.length;i++) {
        new_dna[i] = ((parent._dna[i]+(random(1)<=_mutation_rate?(random(0.2)-0.1):0))+(parent._dna[i]+(random(1)<=parent._mutation_rate?(random(0.2)-0.1):0)))/2;
      }
      return new DNA(new_dna, new_mutation_rate);
    }
    return null;
  }
  
  public float[] get_dna() {
    float[] dna = new float[_dna.length];
    for (int i=0;i<dna.length;i++) {
      dna[i] = _dna[i];
    }
    return dna;
  }
  
  public int length() {
    return _dna.length; 
  }
}