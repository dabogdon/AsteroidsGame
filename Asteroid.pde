class Asteroid extends Floater {
  private double rotSpeed;
  private int asteroidConstant;
  public Asteroid() {
    rotSpeed=(Math.random()*5)-3;
    asteroidConstant=(int)(Math.random()*15)+5;
    myCenterX=myCenterY=(Math.random()*721)-360;
    myPointDirection=Math.random()*360;

    myColor=255;
    if (Math.random() < 0.5) {
      corners = 10;
      int[] xPoint = {5, 9, 15, 19, 8, 3, -8, -15, -18, -9};
      int[] yPoint = {15, 9, 8, -1, -17, -20, -19, -16, 4, 18};
      xCorners = xPoint;
      yCorners = yPoint;
    } else {
      corners = 18;
      int[] xPoint = {6, 14, 16, 11, 8, -2, -5, -3, -5, -7, -15, -17, -18, -17, -11, -9, -5, -4};
      int[] yPoint = {15, 8, 0, -2, -17, -18, -15, -11, -9, -12, -11, -3, 6, 13, 14, 15, 17, 16};
      xCorners = xPoint;
      yCorners = yPoint;
    }
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    myPointDirection+=rotSpeed;
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }
  public void setPos(int x, int y) {
    myCenterX=x;
    myCenterY=y;
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
}
