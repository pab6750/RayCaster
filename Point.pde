class Point {
  private float x;
  private float y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  //getters
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  public float distance(Point p) {
    float distX = p.getX() - this.x;
    float distY = p.getY() - this.y;
    
    return sqrt(pow(distX, 2) + pow(distY, 2));
  }
}
