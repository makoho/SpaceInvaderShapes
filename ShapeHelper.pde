public class ShapeManager
{
  public void display()
  {
    background(backColor);

    for (Shape s : shapes)
      s.display();     
  }

  public  void CreateShapes()
  {  
    shapes = new ArrayList<Shape>();

    InitColorValues();

    int hUnit = cellSize + cellInterval;
    int totalWidth = horizontalCount * hUnit;
    totalWidth -= cellInterval;  
    int horizontalMargin = (width - totalWidth) / 2; //( width - (horizontalCount * (cellSize + cellInterval)) - cellInterval)/2;

    int totalHeight = verticalCount * hUnit;
    totalHeight -= cellInterval;
    int verticalMargin = (height - totalHeight) / 2;// (verticalCount * (cellSize + cellInterval)) - cellInterval) / 2;

    for (int x=0; x<horizontalCount; x++)
    {
      for (int y=0; y<verticalCount; y++)
      {
        int cellX = horizontalMargin + (x * (cellSize + cellInterval));
        int cellY = verticalMargin + (y * (cellSize + cellInterval));
        Shape s = new Shape(new PVector(cellX, cellY), cellSize);
        shapes.add(s);
      }
    }
  }

  public  void InitColorValues()
  {
    if (random(0, 1) < 0.5) 
      backColor = 0;
    else
      backColor = 255;

    shapeColorMode = floor(random(0, 5));
    if (shapeColorMode==ShapeColorModes.OneColorGradients)
      setColorForGradients = floor(random(0, 255));
  }

  public void SaveShape()
  {
    String namePrefix = "";

    if (shapeColorMode==ShapeColorModes.AllColors)
      namePrefix = "All colors ";
    if (shapeColorMode==ShapeColorModes.Black)
      namePrefix = "Black ";
    if (shapeColorMode==ShapeColorModes.DarkColors)
      namePrefix = "Dark colors ";
    if (shapeColorMode==ShapeColorModes.LightColors)
      namePrefix = "Light colors ";
    if (shapeColorMode==ShapeColorModes.OneColorGradients)
      namePrefix = "One color gradients ";
    if (shapeColorMode==ShapeColorModes.White)
      namePrefix = "White ";

    save(namePrefix + nf(year(), 2) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ".png");
  }
}