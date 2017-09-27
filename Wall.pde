class Wall {
  int x, y, w, l;
  
  Wall(int x, int y, int w, int l) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.l = l;
  }
  
  boolean collides(PVector p) {
    return p.x>=x&&p.x<=x+w&&p.y>=y&&p.y<=y+l; 
  }
  
  void show() {
    noStroke();
    fill(80);
    rect(x,y,w,l);
  }
  
  @Override
  String toString() {
    return "x: "+x+" y: "+y+" w: "+w+" l: "+l;
  }
}