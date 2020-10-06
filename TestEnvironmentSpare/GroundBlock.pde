class GroundBlock
{
  public float positionX;
  public float positionY;
  public float groundBlockW;
  public float groundBlockH;

  public GroundBlock(float posX, float posY, float gBlockW, float gBlockH)
  { 
    positionX = posX;
    positionY = posY;
    groundBlockW = gBlockW;
    groundBlockH = gBlockH;
  }

  public void drawGroundBlock()
  {
    fill(255,100,100);
    rect(positionX,positionY,groundBlockW,groundBlockH);
  }
}
