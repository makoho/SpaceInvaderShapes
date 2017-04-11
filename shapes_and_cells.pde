ArrayList<Shape> shapes;
ShapeManager manager = new ShapeManager();

int horizontalCount = 7;
int verticalCount = 5;
int cellSize = 48;
int cellInterval = 52;
int backColor = 255;
int shapeColorMode = 0;
int setColorForGradients = 0;

void setup() {
  size(900, 600);    
  colorMode(HSB);
  manager.CreateShapes();
  frameRate(5);
}

void keyPressed()
{
  manager.SaveShape();
  manager.CreateShapes();
}

void draw()
{
  manager.display();
}