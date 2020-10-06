class PlayerMonkey
{
  float positionX;
  float positionY;
  float monkeyW;
  float monkeyH;
  

  float velX;
  float velY;
  float jumpHeight;;

  color monkeyColor;
  color monkeyColorStroke;

  GameManager gameManager;

  public PlayerMonkey(float posX, float posY, float monkW, float monkH)
  {   
    positionX = posX;
    positionY = posY;
    monkeyH = monkH;
    monkeyW = monkW;

    jumpHeight = -60.0f;

    velX = 5;
    velY = 1;

    monkeyColor = color(158, 133, 11);
  }

  public void DrawMonkey()
  {
    stroke(monkeyColorStroke);
    fill(monkeyColor);
    rect(positionX, positionY, monkeyW, monkeyH);
  }

  public void MoveMonkey()
  {
    if (gameManager.keys['a']) 
    {
      positionX += velX * -1;
    }

    if (gameManager.keys['d']) 
    {
      positionX += velX * 1;
    }

    if (gameManager.keys['w'])
    {
      if (gameManager.canJump)
      {
        positionY += velY * jumpHeight;
        gameManager.canJump = false;
      }
    }
  }
}
