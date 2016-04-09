ArrayList<Particle> pts;
boolean didPress, backtoBack;

void setup(){
  size(displayWidth, displayHeight, P2D);
  //size(800, 1000);
  frameRate(30);
   colorMode(HSB);
  
  pts = new ArrayList<Particle>();
  
  background(255);
}

void mousePressed(){
  didPress = true;
  if(backtoBack){
     background(255);
     backtoBack = false;
  
  }
  

}

void mouseReleased(){
  didPress = false;
}

boolean sketchFullScreen(){
  return true;
}

void draw(){
  if(didPress){
    for(int i = 0; i < 10; i++){
      Particle addPart = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
      pts.add(addPart);
      
    }
         // fill(255,255,255,20);
 // rect(0,0,width,height);
  }
  
  for (int i=0; i<pts.size(); i++) {
    Particle p = pts.get(i);
    p.update();
    p.display();
  }
  
    for (int i=pts.size()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.end) {
      pts.remove(i);
    }
  }
  
     
 
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    for (int i=pts.size()-1; i>-1; i--) {
      Particle p = pts.get(i);
      pts.remove(i);
    }
    
    
    background(255);
  }
  else if( key == 's' || key == 'S'){
     saveFrame( "growth-##.png");
  }
}
