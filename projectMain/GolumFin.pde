class GolumFin {
  int x;
  int y;
  PImage Golum = loadImage("Golum.PNG");

  GolumFin(int x, int y) {
    this.x=x;
    this.y=y; 
  }
  
  void make() {
    image(Golum, x, y);
  }

}

 
