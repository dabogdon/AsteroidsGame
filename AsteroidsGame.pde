Star[] bob = new Star[200];
Spaceship[] astro = new Spaceship[5];

boolean accelerating = false;
boolean left = false;
boolean right = false;
boolean hyperspace = false;
boolean jumping = false;
int countDown = 0;

public void setup() {
  size(720, 720);
  background(0);
  for (int i=0; i<bob.length; i++) {
    bob[i]=new Star();
  }
  for (int i=0; i<astro.length; i++) {
    astro[i]=new Spaceship();
  }
  astro[0].centerFleet();
}

public void draw() {
  background(0);
  if (hyperspace==true&&countDown<180) {
    countDown+=1;
  }
  for (int i=0; i<bob.length; i++) {
    bob[i].show();
  }
  astro[0].show(1);
  astro[0].move();
  for (int i=1; i<astro.length; i++) {
    astro[i].show();
    astro[i].move();
  }
  for (int i=0; i<astro.length; i++) {
    if (jumping==false) {
      if (accelerating == true)
        astro[i].accelerate(.1);
      if (left == true)
        astro[i].turn(-5);
      if (right == true)
        astro[i].turn(5);
    }
    if (hyperspace==true&&countDown==180) {
      astro[i].accelerate(5);
      jumping = true;
      if (astro[0].getX()>=width||astro[0].getX()<=0||astro[0].getY()>=height||astro[0].getY()<=0) {
        jumping = false;
        for (int j=0; i<bob.length; i++) {
          bob[j]=new Star();
        }
        double direction=Math.random()*360;
        for (int z=0; z<astro.length; z++) {
          astro[z].setXSpeed(0);
          astro[z].setYSpeed(0);
          astro[0].setPos(Math.random()*720,Math.random()*720);
          astro[0].centerFleet();
          astro[z].setDirection(direction);
        }
        hyperspace=false;
        countDown=0;
      }
    }
  }
}

public void keyPressed() {
  if (keyCode == 87) 
    accelerating = true;
  if (keyCode == 65) 
    left = true;
  if (keyCode == 68) 
    right = true;
  if (keyCode == 32) {
    hyperspace=true;
  }
}
public void keyReleased()
{
  if (keyCode == 87) accelerating = false;
  if (keyCode == 65) left = false;
  if (keyCode == 68) right = false;
}
