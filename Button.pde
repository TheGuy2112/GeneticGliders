class Button {
  String text;
  color back;
  int x,y,w,h;
  
  Button(String text, color c, int x, int y, int w, int h) {
    this.text=text;
    back = c;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean isPressed(int mx, int my) {
    return mx>=x&&mx<=x+w&&my>=y&&my<=y+h;
  }
  
  void show() {
    fill(back);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text(text, x, y, w, h);
  }
}