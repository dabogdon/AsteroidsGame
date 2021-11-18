Star[] bob = new Star[200];
Spaceship astro = new Spaceship();
boolean accelerating = false;
boolean left = false;
boolean right = false;
boolean hyperspace = false;
int countDown = 0;
public void setup() {
  size(720, 720);
  background(0);
  for (int i=0; i<bob.length; i++) {
    bob[i]=new Star();
  }
}

public void draw() {
  background(0);
  if (hyperspace==true&&countDown<180) {
    countDown+=1;
  }
  for (int i=0; i<bob.length; i++) {
    bob[i].show();
  }
  astro.show();
  astro.move();
  if (accelerating == true)
    astro.accelerate(.1);
  if (left == true)
    astro.turn(-5);
  if (right == true)
    astro.turn(5);

  if (hyperspace==true&&countDown==180) {
    for (int i=0; i<bob.length; i++) {
      bob[i]=new Star();
    }
    astro.setX((int)(Math.random()*700));
    astro.setY((int)(Math.random()*700));
    astro.setXSpeed(0);
    astro.setYSpeed(0);
    astro.setDirection(Math.random()*360);
    hyperspace=false;
    countDown=0;
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
