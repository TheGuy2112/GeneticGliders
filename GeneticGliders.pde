GeneticsManager gm;
boolean show = true;
Button pause;
boolean down = false;

void setup() {
  size(1000,1000); 
  //fullScreen();
  gm = new GeneticsManager(50, 50);
  frameRate(200);
  pause = new Button("Pause", color(0,255,0) , width-100,0,100,30);
  down = false;
}

void draw() {
  gm.update();
  if (show) gm.show();
  pause.show();
  if (mousePressed && !down) {
    if (pause.isPressed(mouseX, mouseY)) {
      down = true;
      show = !show;
      if (show) frameRate(120);
      else frameRate(100000);
    }
  } else if (!mousePressed && down) down = false;
}