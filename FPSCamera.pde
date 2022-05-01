

class FPSCamera
{
  
  HashMap<String, Boolean> keyEvents = new HashMap<String, Boolean> (); 
  PVector worldPosition;
  float angleX, angleY, angleZ;
  PVector movementVel = new PVector(CAM_PLANEVELOCITY, CAM_PLANEVELOCITY);
  public FPSCamera(PVector pos)
  {
    this.worldPosition = pos;
  }

  public void startApply()
  {
    pushMatrix();
    translate(width * .5, height * .5, -200);

     
    rotateX(this.angleX);
    rotateY(this.angleY);
    translate(-this.worldPosition.x, this.worldPosition.y, -this.worldPosition.z);
  }

  public void endApply()
  {
     
    popMatrix();
  }

  public void move(char DIR)
  {


    switch(DIR)
    {
    case 'w': 
      this.worldPosition.add(new PVector(+this.movementVel.mag() * cos(HALF_PI - angleY), /*this.movementVel.mag() * cos(HALF_PI - angleX)*/ 0, -this.movementVel.mag() * cos(angleY)));
      break;
    case 's': 
      this.worldPosition.add(new PVector(-this.movementVel.mag() * cos(HALF_PI - angleY), /*-this.movementVel.mag() * cos(HALF_PI - angleX)*/ 0, +this.movementVel.mag() * cos(angleY)));
      break;
    case 'a': 
      this.worldPosition.add(new PVector(-this.movementVel.mag() * cos(angleY), 0, -this.movementVel.mag() * cos(angleY-HALF_PI  )));
      break;
    case 'd': 
      this.worldPosition.add(new PVector(+this.movementVel.mag() * cos(angleY), 0, +this.movementVel.mag() * cos(angleY-HALF_PI  )));
      break;
    case ' ':
      this.worldPosition.add(0, +CAM_YVELOCITY, 0);
      break;
    case 'c': 
      this.worldPosition.add(0, -CAM_YVELOCITY, 0);
      break;
    }
  }

  void keyBuffering()
  {

    for (String tKeyStr : keyEvents.keySet() )
    {    
      char tKey = tKeyStr.charAt(0); 
      this.move(tKey);
    }
  }
}
