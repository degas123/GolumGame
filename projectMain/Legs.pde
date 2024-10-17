class Legs extends Pieces {

  Legs(float componentX, float componentY) {
    super(componentX, componentY);
    img = loadImage("Legs.png");
    this.componentX= width/2+150;
    this.componentY=height-50;
  }

  void moveP()
  {
    if ( dist(mouseX, mouseY, this.componentX, this.componentY) < 20)
    { //mouse is inside the
      if (mousePressed) //mouse is inside the component and clicked
      {

        componentX = mouseX;
        componentY = mouseY;
      }
    } else {
      componentX= width/2+150;
      componentY=height-50;
    }
  }
  void position()
  {
    this.componentX= width/2+150;
    this.componentY=height-50;
    makeP();
  }
}
