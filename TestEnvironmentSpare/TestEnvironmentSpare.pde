GameManager gameManager;


void setup()
{
  size(1024, 576);
  frameRate(30);
  gameManager = new GameManager();
}

void draw()
{
  gameManager.ManageWorld();
}

void keyPressed()
{
  gameManager.PressedPlayerInput();
}

void keyReleased() 
{
  gameManager.ReleasedPlayerInput();
}

void mousePressed()
{
  gameManager.MousePressPlayerInput();
}

void mouseReleased()
{
  gameManager.MouseReleasePlayerInput();
}
