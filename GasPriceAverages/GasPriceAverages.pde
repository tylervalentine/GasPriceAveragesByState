PImage mapImage;
Table locationTable, currentPriceTable;
int rowCount;

void setup()
{
  size(640, 400);
  mapImage = loadImage("map.png");
  locationTable = new Table("locations.tsv");
  currentPriceTable = new Table("stategaspricesaverage.tsv");
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
      fill(0, 0, 0);
      textSize(30);
      text(currentPriceTable.getString(row, 0) + ": $" + currentPriceTable.getString(row, 1), 250, 30);
    }
    fill(192, 0, 0);
  }
}
