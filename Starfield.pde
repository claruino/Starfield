Particle[] aBunch;

public void setup()
{
  size(500, 500);
  
  aBunch = new Particle[1000];
  for(int i = 0; i < aBunch.length; i++)
  {
    aBunch[0] = new OddBallParticle(200, 200);
    aBunch[i] = new NormalParticle();
    aBunch[1] = new JumboParticle();
  }
}

void draw()
{
  background(255);
  for(int i = 0; i < aBunch.length; i++)
  {
    aBunch[i].show();
    aBunch[i].move();
  }
}

interface Particle
{
  public void show();
  public void move();
}

class NormalParticle implements Particle
{
   double myX, myY, myColor, myAngle, mySpeed;
   NormalParticle( )
   {
     myX = 200;
     myY = 200;
     mySpeed = Math.random()*10;
     myAngle = Math.PI*2*Math.random();
     myColor = color((int)(Math.random()*300), (int)(Math.random()*300), (int)(Math.random()*300));
   }
   
   public void move()
   {
     myX = myX + Math.cos(myAngle)*mySpeed;
     myY = myY + Math.sin(myAngle)*mySpeed;
   }
   
   public void show()
   {
     noStroke();
     fill((float)myColor);
     ellipse((float)myX, (float)myY, 10, 10);
   }
}

class OddBallParticle implements Particle
{
  double myX, myY, myColor, myAngle, mySpeed;
   OddBallParticle( int x, int y)
   {
     myX = x;
     myY = y;
     mySpeed = Math.random()*10;
     myAngle = Math.PI*2*Math.random();
     myColor = color((int)(Math.random()*250), 250, (int)(Math.random()*250));
   }
  public void move()
  {
     myX = myX + Math.cos(myAngle)*mySpeed;
     myY = myY + Math.sin(myAngle)*mySpeed;
  }
  public void show()
  {
     fill((float)myColor, (float)myColor, (float)myColor);
     ellipse((float)myX, (float)myY, 50, 50);
  }
  
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(250, (int)(Math.random()*240), 200);
    ellipse((float)myX, (float)myY, 33, 33);
  }
}

void mousePressed()
{
  redraw();
}
