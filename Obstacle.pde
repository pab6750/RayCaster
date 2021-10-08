class Obstacle {
  
  private Point p1;
  private Point p2;
  
  public Obstacle(float x0, float y0, float x1, float y1) {
    this.p1 = new Point(x0, y0);
    this.p2 = new Point(x1, y1);
  }
  
  public void render() {
    stroke(255);
    line(this.p1.getX(), this.p1.getY(), this.p2.getX(), this.p2.getY());
  }
  
  public Point getP1() {
    return this.p1;
  }
  
  public Point getP2() {
    return this.p2;
  }
}
