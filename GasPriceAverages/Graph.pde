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
    int nPoints = 6;
    GPointsArray points = new GPointsArray(nPoints);
    gasPriceTable = new Table("gaspricesbystate.tsv");
    rowCount = gasPriceTable.getRowCount();
    for(int row = 0; row < rowCount; row++) {
      if(name.strip().equals(gasPriceTable.getString(row, 0).strip()))
      {
        if(gasPriceTable.getColumnCount(row) >= 3)
          points.add(gasPriceTable.getFloat(row, 1), gasPriceTable.getFloat(row, 2));
        if(gasPriceTable.getColumnCount(row) >= 5)
          points.add(gasPriceTable.getFloat(row, 3), gasPriceTable.getFloat(row, 4));
        if(gasPriceTable.getColumnCount(row) >= 7)
          points.add(gasPriceTable.getFloat(row, 5), gasPriceTable.getFloat(row, 6));
        if(gasPriceTable.getColumnCount(row) >= 9)
          points.add(gasPriceTable.getFloat(row, 7), gasPriceTable.getFloat(row, 8));
        if(gasPriceTable.getColumnCount(row) >= 11)
          points.add(gasPriceTable.getFloat(row, 9), gasPriceTable.getFloat(row, 10));
        if(gasPriceTable.getColumnCount(row) >= 13)
          points.add(gasPriceTable.getFloat(row, 11), gasPriceTable.getFloat(row, 12));
      }    
    }
   
    GPlot plot = new GPlot(this);
    plot.setPos(25, 25);
    plot.setTitleText("Gas Prices for " + name);
    plot.getXAxis().setAxisLabelText("Year");
    plot.getYAxis().setAxisLabelText("Price ($)");
    plot.setPoints(points);
    plot.defaultDraw();
  }
  
  void exit(){
    dispose();
  }
}
