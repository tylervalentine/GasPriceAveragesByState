import processing.serial.*; //<>//
import g4p_controls.*;

GButton btnMakeWindow;
Graph window;
PImage mapImage;
Table locationTable, currentPriceTable;
int rowCount;
HashMap<GButton, String> buttons = new HashMap<>();

void setup()
{
  surface.setTitle("Gas Prices By State");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  surface.setSize(640, 400);
  mapImage = loadImage("map.png");
  locationTable = new Table("locations.tsv");
  currentPriceTable = new Table("stategaspricesaverage.tsv");
  rowCount = locationTable.getRowCount();
  for(int row = 0; row < rowCount; row++)
  {
    String name = locationTable.getString(row, 0);
    String full_name = currentPriceTable.getString(row, 0);
    float x = locationTable.getFloat(row, 1);
    float y = locationTable.getFloat(row, 2);
    btnMakeWindow = new GButton(this, x, y, 30, 15, name);
    buttons.put(btnMakeWindow, full_name);
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
  if (buttons.keySet().contains(button) && event == GEvent.CLICKED) {
    window = new Graph(buttons.get(button));
  }// if
}
