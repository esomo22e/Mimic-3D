class Particle{
  PVector loc, vel, accel;
  int lifeSpan, pastLife;
  boolean end;
  float alpha, weight, wRange, decay, xOffset, yOffset;
  color c;
  
  Particle(float x, float y, float xOffset, float yOffset)
  {
    loc = new PVector(x, y);
    
    float ranDeg = random(360);
    vel = new PVector(cos(degrees(ranDeg)), sin(radians(ranDeg)));
    println(ranDeg + "radians is" + vel);
    vel.div(random(10));
    
    accel = new PVector(0,0);
    lifeSpan = int(random(20, 50));
    println("the end is near " + lifeSpan);
    
    decay = random(0.4, 0.9);
    c = color(random(255), random(255), 255);
    wRange = random(10, 70);
    
    this.xOffset = xOffset;
    this.yOffset = yOffset;
    
    
  }
  
  void update(){
    if(pastLife >= lifeSpan){
      end = true;
    }
    else{
      pastLife++;
    }
    
    weight = float(lifeSpan-pastLife)/lifeSpan * wRange;
    
    accel.set(0,0);
    
      float randDeg = random(-360, 360);
    PVector randV = new PVector(cos(radians(randDeg)), sin(radians(randDeg)));
    randV.mult(3);
    accel.add(randV);
     
    vel.add(accel);
    vel.mult(decay);
    vel.limit(8);
    loc.add(vel);
    
  }
  
 void display(){
   
   

  strokeWeight(weight+2.0);
    color col2 = color(random(127), 0,0);//, 126, 255, 102);
    stroke(col2);
   point(loc.x+1, loc.y+1.25);

    strokeWeight(weight);
   stroke(c);
   point(loc.x, loc.y);
 //ellipse(xOffset,yOffset, loc.x, loc.y);
  }
}


