import g4p_controls.*; //<>//

GButton btnMakeWindow;
GWindow window;
SecondApplet s;
PImage mapImage;
Table locationTable, currentPriceTable;
int rowCount;

void setup()
{
  surface.setTitle("Gas Prices By State");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  size(640, 400);
  mapImage = loadImage("map.png");
  locationTable = new Table("locations.tsv");
  currentPriceTable = new Table("stategaspricesaverage.tsv");
  rowCount = locationTable.getRowCount();
  for(int row = 0; row < rowCount; row++)
  {
    String name = locationTable.getString(row, 0);
    float x = locationTable.getFloat(row, 1);
    float y = locationTable.getFloat(row, 2);
    btnMakeWindow = new GButton(this, x, y, 30, 15, name);
  }
}

void draw()
{
  background(255);
  image(mapImage, 0, 0);
  
  smooth();
  fill(192, 0, 0);
  noStroke();
}

void handleButtonEvents(GButton button, GEvent event) {
  if (button == btnMakeWindow && event == GEvent.CLICKED) {
    s = new SecondApplet();
    btnMakeWindow.setEnabled(false);
  }// if
}
