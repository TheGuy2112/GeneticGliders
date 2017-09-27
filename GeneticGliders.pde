GeneticsManager gm;
boolean show = true;

void setup() {
  size(1000,1000); 
  //fullScreen();
  gm = new GeneticsManager(100, 300);
  frameRate(120);
}

void draw() {
  gm.update();
  if (show) gm.show();
  if (keyPressed && key==' ') show = !show;
}