class Shape
{
  PVector         location;
  ArrayList<Cell> cells;
  int             shapeSize;
  color           shapeColor;
  int             strokeSize;
  
  public Shape(PVector location_, int size_)
  {
    location = location_;
    shapeSize = size_;

    if (shapeSize > 50)
      strokeSize = 4;
    else
    {
      if (shapeSize > 28)
        strokeSize = 2;
      else
        strokeSize = 1;
    }
    SetShapeColor();
    InitCells2();
  }

  void SetShapeColor()
  {
    if (shapeColorMode==ShapeColorModes.AllColors)
      shapeColor = color(random(0, 255), 255, 255);

    if (shapeColorMode==ShapeColorModes.Black)
    {
      if (backColor==255)
        shapeColor = color(0, 0, 0);
      else
        shapeColor = color(0, 0, 255);
    }

    if (shapeColorMode==ShapeColorModes.White)
    {
      if (backColor==255)
        shapeColor = color(0, 0, 0);
      else
        shapeColor = color(0, 0, 255);
    }

    if (shapeColorMode==ShapeColorModes.DarkColors)
      shapeColor = color(random(0, 255), random(50, 150), random(50, 150));

    if (shapeColorMode==ShapeColorModes.LightColors)
      shapeColor = color(random(0, 255), 126, 255);

    if (shapeColorMode==ShapeColorModes.OneColorGradients)
      shapeColor = color(setColorForGradients, random(200, 255), random(150, 255));
  }

  void display()
  {
    stroke(shapeColor);
    strokeWeight(strokeSize);

    for (Cell c : cells)
      c.display();
  }

  // Create a grid of 16 cells which is a mirrored pattern both vertically and horizontally
  private void InitCells2()
  {
    float cellSize = shapeSize/4;
    cells = new ArrayList<Cell>();

    // Create the top-left 4 cells at random
    Cell c1 = new Cell(new PVector(location.x + cellSize * 0, location.y + cellSize * 0), cellSize);
    Cell c2 = new Cell(new PVector(location.x + cellSize * 1, location.y + cellSize * 0), cellSize);
    Cell c3 = new Cell(new PVector(location.x + cellSize * 0, location.y + cellSize * 1), cellSize);
    Cell c4 = new Cell(new PVector(location.x + cellSize * 1, location.y + cellSize * 1), cellSize);

    // Create the top-right 4 cells based on the previous 4
    Cell c5 = new Cell(new PVector(location.x + cellSize * 2, location.y + cellSize * 0), cellSize, c2.VerticalMirrorShape(), c2.straightLine);
    Cell c6 = new Cell(new PVector(location.x + cellSize * 3, location.y + cellSize * 0), cellSize, c1.VerticalMirrorShape(), c1.straightLine);
    Cell c7 = new Cell(new PVector(location.x + cellSize * 2, location.y + cellSize * 1), cellSize, c4.VerticalMirrorShape(), c4.straightLine);
    Cell c8 = new Cell(new PVector(location.x + cellSize * 3, location.y + cellSize * 1), cellSize, c3.VerticalMirrorShape(), c3.straightLine);

    // Create the bottom-left 4 cells based on the top-left 4
    Cell c9 = new Cell(new PVector(location.x + cellSize * 0, location.y + cellSize * 2), cellSize, c3.HorizontalMirrorShape(), c3.straightLine);
    Cell c10 = new Cell(new PVector(location.x + cellSize * 1, location.y + cellSize * 2), cellSize, c4.HorizontalMirrorShape(), c4.straightLine);
    Cell c11 = new Cell(new PVector(location.x + cellSize * 0, location.y + cellSize * 3), cellSize, c1.HorizontalMirrorShape(), c1.straightLine);
    Cell c12 = new Cell(new PVector(location.x + cellSize * 1, location.y + cellSize * 3), cellSize, c2.HorizontalMirrorShape(), c2.straightLine);

    // Create the bottom-right 4 cells based on the top-right 4
    Cell c13 = new Cell(new PVector(location.x + cellSize * 2, location.y + cellSize * 2), cellSize, c7.HorizontalMirrorShape(), c7.straightLine);
    Cell c14 = new Cell(new PVector(location.x + cellSize * 3, location.y + cellSize * 2), cellSize, c8.HorizontalMirrorShape(), c8.straightLine);
    Cell c15 = new Cell(new PVector(location.x + cellSize * 2, location.y + cellSize * 3), cellSize, c5.HorizontalMirrorShape(), c5.straightLine);
    Cell c16 = new Cell(new PVector(location.x + cellSize * 3, location.y + cellSize * 3), cellSize, c6.HorizontalMirrorShape(), c6.straightLine);

    // Add the cells to the collection
    cells.add(c1);
    cells.add(c2);
    cells.add(c3);
    cells.add(c4);
    cells.add(c5);
    cells.add(c6);
    cells.add(c7);
    cells.add(c8);
    cells.add(c9);
    cells.add(c10);
    cells.add(c11);
    cells.add(c12);
    cells.add(c13);
    cells.add(c14);
    cells.add(c15);
    cells.add(c16);
  }

  // Create a grid of 16 cells, each with a random shape
  private void InitCells1()
  {
    float cellSize = shapeSize/4;
    cells = new ArrayList<Cell>();

    for (int y=0; y<4; y++)
    {
      for (int x=0; x<4; x++)
        cells.add(new Cell(new PVector(location.x + cellSize * x, location.y + cellSize * y), cellSize));
    }
  }
}