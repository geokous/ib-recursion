public class Coordinates {
      public float x;
      public float y;
}

boolean showEndpoints = true;

void setup() {
  fullScreen();
  background(255);
  noLoop();
}

void draw() {
    Coordinates centre = new Coordinates();
    centre.x = width/2;
    centre.y = height/2;
    drawRecursive(centre,250,4);
}

void drawRecursive(Coordinates centre, int size, int generation){
  if (generation == 1) drawH(centre, size);
  else{
    Coordinates[] endpoints = new Coordinates[4];
    endpoints = drawH(centre,size);
    drawRecursive(endpoints[0],size/2,generation-1);
    drawRecursive(endpoints[1],size/2,generation-1);
    drawRecursive(endpoints[2],size/2,generation-1);
    drawRecursive(endpoints[3],size/2,generation-1);
    
  }
}

Coordinates[] drawH(Coordinates centre, int size){
  Coordinates[] endpoints = new Coordinates[4];
  
  line(centre.x-(size/2), centre.y-(size), centre.x-(size/2), centre.y+(size));
  line(centre.x+(size/2), centre.y-(size), centre.x+(size/2), centre.y+(size));
  line(centre.x-(size/2), centre.y, centre.x+(size/2), centre.y);
  
  endpoints[0]= new Coordinates();
  endpoints[1]= new Coordinates();
  endpoints[2]= new Coordinates();
  endpoints[3]= new Coordinates();
  
  endpoints[0].x=centre.x-(size/2);
  endpoints[0].y=centre.y-size;
  if (showEndpoints) ellipse(endpoints[0].x, endpoints[0].y, 3, 3);
  
  endpoints[1].x=centre.x+(size/2);
  endpoints[1].y=centre.y-size;
  if (showEndpoints) ellipse(endpoints[1].x, endpoints[1].y, 3, 3);
  
  endpoints[2].x=centre.x-(size/2);
  endpoints[2].y=centre.y+size;
  if (showEndpoints) ellipse(endpoints[2].x, endpoints[2].y, 3, 3);
  
  endpoints[3].x=centre.x+(size/2);
  endpoints[3].y=centre.y+size;
  if (showEndpoints) ellipse(endpoints[3].x, endpoints[3].y, 3, 3);
  
  return endpoints;
}