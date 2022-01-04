PImage mapImage;
Table locationTable;
int rowCount;

void setup()
{
  size(640, 400);
  mapImage = loadImage("map.png");
  locationTable = new Table("locations.tsv");
  rowCount = locationTable.getRowCount();
}

void draw()
{
  background(255);
  image(mapImage, 0, 0);
  
  smooth();
  fill(192, 0, 0);
  noStroke();
  
  for(int row = 0; row < rowCount; row++)
  {
    float x = locationTable.getFloat(row, 1);
    float y = locationTable.getFloat(row, 2);
    ellipse(x, y, 9, 9);
    
    if(dist(x, y, mouseX, mouseY) <= 9)
    {
      ellipse(x, y, 18, 18);
      text(locationTable.getString(row, 0), x+10, y-10);
    }
  }
}
