



/**
Simple Demo to show how to use the FPSCamera wrapper.
It's a simple class to move in the 3D space in a no-clip (from first person shooters game) fashion.
It allows to use WASD (and SPACE / c) like in a videogame
By Davide Sito
https://linktr.ee/stickyb1t
**/

//change these to alter the speed of the movement
public float CAM_YVELOCITY = 10;
public float CAM_PLANEVELOCITY = 10; 
FPSCamera fpsCam;
  

public void setup()
{
  //processing boilerplate
  
  textSize(100);
  size(800, 800, P3D); 
  //
  fpsCam = new FPSCamera(new PVector(0, 0, 0)); 
}

public void draw()
{ 

  background(255);
  fpsCam.keyBuffering();
  fpsCam.startApply(); //this has to be called before drawing anything
  
  //this is just a box with description 
  noFill();
  stroke(0,100);
  box(600,600,600);
  fill(0,200);
  textSize(100);
  text("PRESS the mouse to look around",-500,-200);
  text("WASD to move ",-500,0);
  text("SPACEBAR/c to go up/down",-500,200);

  
  
  fpsCam.endApply(); //this has to be called at the end of the drawing
  
}


//keys interaction are proxied by a buffer to allow continous pressing
void keyPressed()
{
   fpsCam.keyEvents.put(key+"", true);
}


void keyReleased()
{
   fpsCam.keyEvents.remove(key+"");
}

//change the values
void mouseDragged()
{
  //camera angle 
  if (mouseX > pmouseX)
  {
    fpsCam.angleY += 0.05;
  }
  if (mouseX < pmouseX)
  {
    fpsCam.angleY -= 0.05;
  }
  if (mouseY > pmouseY)
  {
    fpsCam.angleX -= 0.05;
  }
  if (mouseY < pmouseY)
  {
    fpsCam.angleX += 0.05;
  }
}
