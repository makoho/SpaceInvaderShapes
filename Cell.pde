class Cell
{
  PVector location;
  color   cellColor;
  int     cellShape;
  float   size;

  boolean straightLine;
  PVector leftMiddle;
  PVector topMiddle;
  PVector rightMiddle;
  PVector bottomMiddle;

  public Cell(PVector location_, float size_, int shape, boolean _straight)
  {    
    InitValues(location_, size_, shape, _straight);
  }

  public Cell(PVector location_, float size_)
  {
    InitValues(location_, size_, floor(random(0, 17)), (random(0, 1) < 0.4));
  }

  int HorizontalMirrorShape()
  {
    if (cellShape == 0) return 0;
    if (cellShape == 1) return 5;
    if (cellShape == 2) return 14;
    if (cellShape == 3) return 3;
    if (cellShape == 4) return 4;
    if (cellShape == 5) return 1;
    if (cellShape == 6) return 10;
    if (cellShape == 7) return 15;
    if (cellShape == 8) return 16;
    if (cellShape == 9) return 13;
    if (cellShape == 10) return 6;
    if (cellShape == 11) return 11;
    if (cellShape == 12) return 12;
    if (cellShape == 13) return 9;
    if (cellShape == 14) return 2;
    if (cellShape == 15) return 7;
    if (cellShape == 16) return 8;

    return 0;
  }

  int VerticalMirrorShape()
  {
    if (cellShape == 0) return 0;
    if (cellShape == 1) return 13;
    if (cellShape == 2) return 6;
    if (cellShape == 3) return 11;
    if (cellShape == 4) return 12;
    if (cellShape == 5) return 9;
    if (cellShape == 6) return 2;
    if (cellShape == 7) return 7;
    if (cellShape == 8) return 8;
    if (cellShape == 9) return 5;
    if (cellShape == 10) return 14;
    if (cellShape == 11) return 3;
    if (cellShape == 12) return 4;
    if (cellShape == 13) return 1;
    if (cellShape == 14) return 10;
    if (cellShape == 15) return 15;
    if (cellShape == 16) return 16;

    return 0;
  }
  void InitValues(PVector _location, float _size, int _cellShape, boolean _straight)
  {
    location = _location;
    size = _size;
    cellShape = _cellShape;

    leftMiddle = new PVector(location.x, location.y + (size/2));
    topMiddle = new PVector(location.x + (size/2), location.y);
    rightMiddle = new PVector(location.x + size, location.y + (size/2));
    bottomMiddle = new PVector(location.x + (size/2), location.y + size);
    straightLine = _straight;
  }

  void display()
  {
    noFill();
    if (cellShape > 0 && cellShape < 5) drawFromLeft();
    if (cellShape > 4 && cellShape < 9) drawFromTop();
    if (cellShape > 8 && cellShape < 13) drawFromRight();
    if (cellShape > 12) drawFromBottom();
  }

  void drawLeftTop()
  {
    if (!straightLine)
      arc(location.x, location.y, size, size, 0, HALF_PI);
    else
      line(leftMiddle.x, leftMiddle.y, topMiddle.x, topMiddle.y);
  }

  void drawLeftBottom()
  {
    if (!straightLine)
      arc(location.x, location.y  + size, size, size, PI + HALF_PI, TWO_PI);
    else
      line(leftMiddle.x, leftMiddle.y, bottomMiddle.x, bottomMiddle.y);
  }

  void drawBottomRight()
  {
    if (!straightLine)
      arc(location.x + size, location.y + size, size, size, PI, PI + HALF_PI);
    else
      line(bottomMiddle.x, bottomMiddle.y, rightMiddle.x, rightMiddle.y);
  }

  void drawRightTop()
  {
    if (!straightLine)
      arc(location.x + size, location.y, size, size, HALF_PI, PI);
    else
      line(rightMiddle.x, rightMiddle.y, topMiddle.x, topMiddle.y);
  }

  void drawLeftRight()
  {
    line(leftMiddle.x, leftMiddle.y, rightMiddle.x, rightMiddle.y);
  }

  void drawTopBottom()
  {
    line(topMiddle.x, topMiddle.y, bottomMiddle.x, bottomMiddle.y);
  }

  void drawFromBottom()
  {
    if (cellShape==13 || cellShape==15 || cellShape==16)
      drawBottomRight();

    if (cellShape==14 || cellShape==15 || cellShape==16)
      drawLeftBottom();

    if (cellShape==16)
      drawTopBottom();
  }

  void drawFromRight()
  {
    if (cellShape==9 || cellShape==11 || cellShape==12)
      drawRightTop();

    if (cellShape==10 || cellShape==11 || cellShape==12)
      drawBottomRight();

    if (cellShape==12)
      drawLeftRight();
  }

  void drawFromTop()
  {
    if (cellShape==5 || cellShape==7 || cellShape==8)
      drawLeftTop();

    if (cellShape==6 || cellShape==7 || cellShape==8)
      drawRightTop();

    if (cellShape==8)
      drawTopBottom();
  }

  void drawFromLeft()
  {
    if (cellShape==1 || cellShape==3 || cellShape==4)
      drawLeftBottom();

    if (cellShape==2 || cellShape==3 || cellShape==4)
      drawLeftTop();

    if (cellShape==4)
      drawLeftRight();
  }
}