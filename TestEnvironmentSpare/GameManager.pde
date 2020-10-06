class GameManager
{
  Collision collision;
  PlayerMonkey playerMonkey;
  Grid grid;

  private float gravity;
  private int listIndex;
  public boolean [] keys = new boolean[128];
  public boolean mouseIsPressed = false;
  private boolean hasPlaced = true;
  private boolean canJump;
  ArrayList<GroundBlock> groundBlock;

  public GameManager()
  {
    collision = new Collision();
    groundBlock = new ArrayList<GroundBlock>();
    grid = new Grid();

    gravity = 0.98;
    listIndex = 0;

    playerMonkey = new PlayerMonkey(400, 50, 32, 64);
  }

  public void ManageWorld()
  {
    playerMonkey.gameManager = gameManager;
    grid.drawGrid();
    playerMonkey.positionY += gravity;


    canJump = false;

    for (GroundBlock g : groundBlock) {
      if (collision.detectRectCollision(playerMonkey.positionX, playerMonkey.positionY, playerMonkey.monkeyW, playerMonkey.monkeyH, 
        g.positionX, g.positionY, g.groundBlockW, g.groundBlockH))
      {
        canJump = true;
      }
    }

    for (GroundBlock g : groundBlock) {
      g.drawGroundBlock();
    }

    if (!canJump)
    {
      gravity = 0.98;
    } else gravity = 0;

    playerMonkey.MoveMonkey();
    playerMonkey.DrawMonkey();
  }

  public void PressedPlayerInput()
  {
    keys[key] = true;
  }

  public void ReleasedPlayerInput()
  {
    keys[key] = false;
  }

  public void MousePressPlayerInput()
  {
    mouseIsPressed = true;
  }

  public void MouseReleasePlayerInput()
  {
    mouseIsPressed = false;
    hasPlaced = false;
    grid.pressedMouse = false;
  }
}
