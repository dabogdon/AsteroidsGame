class Star {  //note that this class does NOT extend Floater
  private int myX, myY, myColor, mySize;
  Star() {
    myX=(int)(Math.random()*720);
    myY=(int)(Math.random()*720);
    myColor=color((int)(Math.random()*80)+185,(int)(Math.random()*80)+185,(int)(Math.random()*80)+185);
    mySize=(int)(Math.random()*6)+2;
  }
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX,myY,mySize,mySize);
  }
}
