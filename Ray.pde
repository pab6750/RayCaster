class Ray {
  private Point origin;
  private PVector direction;
  
  public Ray(Point p, PVector direction) {
    this.origin = p;
    this.direction = direction;
  }
  
  public Point calculateRayObstacleIntersection(Obstacle o) {
    float x1 = o.getP1().getX();
    float y1 = o.getP1().getY();
    float x2 = o.getP2().getX();
    float y2 = o.getP2().getY();
    
    float x3 = this.origin.getX();
    float y3 = this.origin.getY();
    float x4 = this.origin.getX() + this.direction.x;
    float y4 = this.origin.getY() + this.direction.y;
    
    float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    
    if(den == 0) {
      return null;
    }
    
    float t = (float)((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
    float u = (float)-((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
    
    if( t > 0 && t < 1 && u > 0) {
      //an intersection exists
      float intersectionX = x1 + (t * (x2 - x1));
      float intersectionY = y1 + (t * (y2 - y1));
      
      return new Point(intersectionX, intersectionY);
    } else {
      return null;
    }
   }
   
   public void render(Obstacle[] obs) {
     Point hit = null;
     
     for(int i = 0; i < obs.length; i++) {
       Point currentInt = this.calculateRayObstacleIntersection(obs[i]);
       
       if(currentInt != null) {
         if(hit == null) {
           hit = currentInt;
         } else {
           if(this.origin.distance(currentInt) < this.origin.distance(hit)) {
             hit = currentInt;
           }
         }
       }
     }
     
     stroke(255);
     
     if(hit != null) {
       line(this.origin.getX(), this.origin.getY(), hit.getX(), hit.getY());
     } else {
       Obstacle b0 = new Obstacle(0, 0, N, 0);
       Obstacle b1 = new Obstacle(N, 0, N, N);
       Obstacle b2 = new Obstacle(N, N, 0, N);
       Obstacle b3 = new Obstacle(0, N, 0, 0);
       
       Point intB0 = this.calculateRayObstacleIntersection(b0);
       Point intB1 = this.calculateRayObstacleIntersection(b1);
       Point intB2 = this.calculateRayObstacleIntersection(b2);
       Point intB3 = this.calculateRayObstacleIntersection(b3);
       
       if(intB0 != null) {
         line(this.origin.getX(), this.origin.getY(), intB0.getX(), intB0.getY());
       }
       
       if(intB1 != null) {
         line(this.origin.getX(), this.origin.getY(), intB1.getX(), intB1.getY());
       }
       
       if(intB2 != null) {
         line(this.origin.getX(), this.origin.getY(), intB2.getX(), intB2.getY());
       }
       
       if(intB3 != null) {
         line(this.origin.getX(), this.origin.getY(), intB3.getX(), intB3.getY());
       }
     }
     
   }
}
