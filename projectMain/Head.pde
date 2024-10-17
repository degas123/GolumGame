class Head extends Pieces {
int headCount;
  Head(float componentX, float componentY) {
    super(componentX, componentY);
    img = loadImage("golum head.png");
    this.componentX= width/2+300;  
    this.componentY=height-50;
    this.headCount=0;
  }

  void moveP()
  {
    if ( dist(mouseX, mouseY, this.componentX, this.componentY) < 20)
    { //mouse is inside the component
      if (mousePressed) //mouse is inside the component and clicked
      {
        componentX = mouseX;
        componentY = mouseY;
      }
    } else {
      componentX= width/2+300;
      componentY= height-50;
    }
  }
  void position()
  {
    this.componentX= width/2+300;
    this.componentY=height-50;
    makeP();
  }
}
