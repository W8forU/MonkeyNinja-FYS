class Grid
{
  private int xGrid;
  private int yGrid;
  private int tileSize;

  private int hasHoveredIndexX;
  private int hasHoveredIndexY;
  private int prevHoveredIndexX;
  private int prevHoveredIndexY;

  private boolean[] hoverDetectX;
  private boolean[] hoverDetectY;
  public boolean pressedMouse = false;


  private boolean[][] testArray;

  private IntList positionX;
  private IntList positionY;

  color tileColor;
  color tileStrokeColor;

  boolean canPlace = false;

  public Grid()
  {
    tileSize = 32;
    xGrid = width / tileSize;
    yGrid = height / tileSize;

    positionX = new IntList();
    positionY = new IntList();

    hoverDetectX = new boolean[xGrid];
    hoverDetectY = new boolean[yGrid];

    testArray = new boolean[xGrid][yGrid];

    tileColor = color(255);
    tileStrokeColor = color(0);
  }

  public void drawGrid()
  { 
    for (int i = 0; i < xGrid; i++)
    {
      for (int j = 0; j < yGrid; j++)
      {
        if (testArray[i][j] && canPlace) 
        {
          println(gameManager.listIndex);
          if (gameManager.mouseIsPressed) 
          {         
            gameManager.groundBlock.add(gameManager.listIndex, new GroundBlock(i * tileSize, j * tileSize, tileSize, tileSize)); 
            if (!gameManager.hasPlaced) {
              gameManager.listIndex++;
              gameManager.hasPlaced = true;
            }
          }
        }

        fill(255);
        stroke(tileStrokeColor);
        rect(i * tileSize, j* tileSize, tileSize, tileSize);

        positionX.append(i);
        positionX.set(i, i * tileSize);

        positionY.append(j);
        positionY.set(j, j  * tileSize);
      }
    }

    hoverOverGrid();
  }


  public void hoverOverGrid()
  {
    boolean[][] checkArray = new boolean[xGrid][yGrid];
    for (int i = 0; i < xGrid; i++)
    {
      // Check when the mouse is in a certain position in the array for the X-axis. 
      // Set the boolean in the array true so you can get the column the mouse is in.
      if (mouseX >= positionX.get(i) && mouseX <= positionX.get(i + 1))
      {
        hoverDetectX[i] = true;
      } else hoverDetectX[i] = false;

      if (i == xGrid - 1)
      {
        if (mouseX >= positionX.get(i) && mouseX <= width)
        {
          hoverDetectX[xGrid - 1] = true;
        }
      }
    }

    for (int j = 0; j < yGrid; j++)
    {
      // Check when the mouse is in a certain position in the array for the Y-axis. 
      // Set the boolean in the array true so you can get the row the mouse is in.   
      if (mouseY >= positionY.get(j) && mouseY <= positionY.get(j + 1))
      {
        hoverDetectY[j] = true;
      } else hoverDetectY[j] = false;

      if (j == yGrid - 1)
      {
        if (mouseY >= positionY.get(j) && mouseY <= height)
        {
          hoverDetectY[yGrid - 1] = true;
        }
      }
    }

    for (int i = 0; i < xGrid; i++) 
    {
      for (int j = 0; j < yGrid; j++) 
      {
        if (hoverDetectX[i] && hoverDetectY[j])
        {
          tileColor = color(0, 0, 255);
          fill(tileColor);
          stroke(tileStrokeColor);
          rect(i * tileSize, j* tileSize, tileSize, tileSize);

          prevHoveredIndexX = i;
          prevHoveredIndexY = j;
          checkArray[i][j] = true;

          if (gameManager.mouseIsPressed && !pressedMouse) 
          {
            pressedMouse = true;

            if (i == prevHoveredIndexX && j == prevHoveredIndexY)
            {
              if (checkArray[i][j] && !testArray[i][j]) 
              {
                testArray[i][j] = true;
                canPlace = true;
              } else canPlace = false;
            }
          }
        }
      }
    }
  }
}
