final int N = 512;

Obstacle[] obs = {new Obstacle(random(N), random(N), random(N), random(N)),
                  new Obstacle(random(N), random(N), random(N), random(N)),
                  new Obstacle(random(N), random(N), random(N), random(N)),
                  new Obstacle(random(N), random(N), random(N), random(N)),
                  new Obstacle(random(N), random(N), random(N), random(N)),};

void settings() {
  size(N, N);
}

void setup() {
  background(0);
}

void draw() {
  background(0);
  stroke(255);
  
  for(int i = 0; i < obs.length; i++) {
    obs[i].render();
  }
  
  Point origin = new Point(mouseX, mouseY);
  
  int step = 5;
  int count = 0;
  
  Ray[] rays = new Ray[360 / step];
  
  for(int i = 0; i < 360; i += step) {
    rays[count] = new Ray(origin, PVector.fromAngle(radians(i)));
    count++;
  }
  
  for(int i = 0; i < rays.length; i++) {
    rays[i].render(obs);
  }
}
