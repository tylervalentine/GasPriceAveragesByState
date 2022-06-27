import grafica.*;
public class Graph extends PApplet {
  
  String name;
  Table gasPriceTable;
  
  Graph(String name) {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    this.name = name;
  }
  
  void settings() {
    size(500, 350);
  }
  
  void setup() {
    // Prepare the points for the plot
    int nPoints = 100;
    GPointsArray points = new GPointsArray(nPoints);
    gasPriceTable = new Table("gaspricesbystate.tsv");
    rowCount = gasPriceTable.getRowCount();
    for(int row = 0; row < rowCount; row++) {
      if(name.equals(gasPriceTable.getString(row, 0)))
      {
        points.add(gasPriceTable.getFloat(row, 1), gasPriceTable.getFloat(row, 2));
        points.add(gasPriceTable.getFloat(row, 3), gasPriceTable.getFloat(row, 4));
        points.add(gasPriceTable.getFloat(row, 5), gasPriceTable.getFloat(row, 6));
        points.add(gasPriceTable.getFloat(row, 7), gasPriceTable.getFloat(row, 8));
        points.add(gasPriceTable.getFloat(row, 9), gasPriceTable.getFloat(row, 10));
        points.add(gasPriceTable.getFloat(row, 11), gasPriceTable.getFloat(row, 12));
      }    
    }
    
    // Create a new plot and set its position on the screen
    GPlot plot = new GPlot(this);
    plot.setPos(25, 25);
    // or all in one go
    // GPlot plot = new GPlot(this, 25, 25);
  
    // Set the plot title and the axis labels
    plot.setTitleText("Gas Prices for " + name);
    plot.getXAxis().setAxisLabelText("Year");
    plot.getYAxis().setAxisLabelText("Price");
  
    // Add the points
    plot.setPoints(points);
  
    // Draw it!
    plot.defaultDraw();
  }
  
  void exit(){
    dispose();
  }
}
