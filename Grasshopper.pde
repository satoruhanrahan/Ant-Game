class Grasshopper{
  int grassHopperX;
  int grassHopperY;
  int ySpeed;
  int distance;
  int timer;
  boolean left;
  
  Grasshopper(int distance){
    this.distance = distance;
    grassHopperX  = backX + distance;
    grassHopperY = backY + 228;
    ySpeed = 0;
    timer = 1000;
  }
  
  Grasshopper(int distance, boolean left){
    this.distance = distance;
    this.left = left;
    grassHopperX  = backX + distance;
    grassHopperY = backY + 228;
    ySpeed = 0;
    timer = 1000;
  }
  
  void move(){
    if(timer < 100){
      timer++;
      grassHopperX  = backX + distance; 
    }
    else{
      if(left){
        distance-=20;
      }
      else{
        distance+=20;
      }  
      grassHopperX  = backX + distance; 
      if(grassHopperY < (backY-898)){
        ySpeed = +15;
      } 
      if(grassHopperY > (backY+222)){
        timer = 0;
        ySpeed = -15;
      }  
      
      grassHopperY += ySpeed;
    }
    if(left){
      if(distance < -1000){
        distance = 20000;
      }
    }  
    else if(distance > 20000){
      distance = -1000;
    }  
  }  
  
  void drawGrasshopper(){
    if(grassHopperY > 810){
      if(left){
        drawStandingLeft();
      }
      else{
        drawStanding();
      }  
    }
    else{
      if(left){
        drawJumpingLeft();
      }
      else{
        drawJumping();
      }  
    }
    if(!gameStopped){
      move();
    }
    if(x < (grassHopperX + 100) && x > (grassHopperX - 100) && y < (grassHopperY - 225) && y > (grassHopperY - 245)){
      gameStopped = true;
    }
  }
  
  void drawStanding(){
    pushMatrix();
    scale(0.7);
    if(!gameStopped){
      grassHopperX *= (1/0.7);
    }  
    stroke(60,80,10);
    fill(70,90,20);
    
    //back side legs
    pushMatrix();
    translate(grassHopperX-35, grassHopperY-45);
    rotate(PI/2.95);
    ellipse(0, 0, 185, 28); //back leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX-90, grassHopperY-35);
    rotate(PI/1.8);
    ellipse(0, 0, 185, 15); //back leg bottom
    popMatrix();
    ellipse(grassHopperX-95, grassHopperY+43, 55, 10);//back foot
    ellipse(grassHopperX+5, grassHopperY+25, 10, 60);// middle leg
    ellipse(grassHopperX+15, grassHopperY+52, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX+55, grassHopperY+25);
    rotate(PI/1.2);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX+83, grassHopperY+52, 30, 5);//front foot
    
    ellipse(grassHopperX, grassHopperY, 200, 80); // body
    ellipse(grassHopperX + 100, grassHopperY-10, 80, 80); //head
    
    //front side legs
    pushMatrix();
    translate(grassHopperX-60, grassHopperY-50);
    rotate(PI/2.95);
    ellipse(0, 0, 185, 28); //leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX-115, grassHopperY-40);
    rotate(PI/1.8);
    ellipse(0, 0, 185, 15); //leg bottom
    popMatrix();
    ellipse(grassHopperX-110, grassHopperY+48, 55, 10);//back foot
    ellipse(grassHopperX, grassHopperY+30, 10, 60);// middle leg
    ellipse(grassHopperX+10, grassHopperY+57, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX+50, grassHopperY+30);
    rotate(PI/1.2);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX+78, grassHopperY+57, 30, 5);//front foot
    
    strokeWeight(5);
    line(grassHopperX + 130, grassHopperY-40, grassHopperX + 170, grassHopperY-160);
    line(grassHopperX + 130, grassHopperY-40, grassHopperX + 190, grassHopperY-160);
    
    //eye
    pushMatrix();
    translate(grassHopperX + 120, grassHopperY-15);
    rotate(PI/1.2);
    fill(0);
    noStroke();
    ellipse(0, 0, 15, 20);
    popMatrix();
    popMatrix();
  } 
  
  void drawStandingLeft(){
    pushMatrix();
    scale(0.7);
    if(!gameStopped){
      grassHopperX *= (1/0.7);
    }  
    stroke(60,80,10);
    fill(70,90,20);
    
    //back side legs
    pushMatrix();
    translate(grassHopperX+35, grassHopperY-45);
    rotate(PI/1.5);
    ellipse(0, 0, 185, 28); //back leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX+90, grassHopperY-35);
    rotate(PI/2.3);
    ellipse(0, 0, 185, 15); //back leg bottom
    popMatrix();
    ellipse(grassHopperX+95, grassHopperY+43, 55, 10);//back foot
    ellipse(grassHopperX-5, grassHopperY+25, 10, 60);// middle leg
    ellipse(grassHopperX-15, grassHopperY+52, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX-55, grassHopperY+25);
    rotate(PI/5);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX-83, grassHopperY+52, 30, 5);//front foot
    
    ellipse(grassHopperX, grassHopperY, 200, 80); // body
    ellipse(grassHopperX - 100, grassHopperY-10, 80, 80); //head
    
    //front side legs
    pushMatrix();
    translate(grassHopperX+60, grassHopperY-50);
    rotate(PI/1.5);
    ellipse(0, 0, 185, 28); //leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX+115, grassHopperY-40);
    rotate(PI/2.3);
    ellipse(0, 0, 185, 15); //leg bottom
    popMatrix();
    ellipse(grassHopperX+110, grassHopperY+48, 55, 10);//back foot
    ellipse(grassHopperX, grassHopperY+30, 10, 60);// middle leg
    ellipse(grassHopperX-10, grassHopperY+57, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX-50, grassHopperY+30);
    rotate(PI/5);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX-78, grassHopperY+57, 30, 5);//front foot
    
    strokeWeight(5);
    line(grassHopperX - 130, grassHopperY-40, grassHopperX - 170, grassHopperY-160);
    line(grassHopperX - 130, grassHopperY-40, grassHopperX - 190, grassHopperY-160);
    
    //eye
    pushMatrix();
    translate(grassHopperX - 120, grassHopperY-15);
    rotate(PI/1.2);
    fill(0);
    noStroke();
    ellipse(0, 0, 20, 15);
    popMatrix();
    popMatrix();
  } 
  
  void drawJumping(){
    pushMatrix();
    scale(0.7);
    if(!gameStopped){
      grassHopperX *= (1/0.7);
    }  
    stroke(60,80,10);
    fill(70,90,20);
    
    //back side legs
    pushMatrix();
    translate(grassHopperX-75, grassHopperY-15);
    rotate(PI/8.5);
    ellipse(0, 0, 185, 28); //back leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX-230, grassHopperY);
    rotate(PI/1.2);
    ellipse(0, 0, 185, 15); //back leg bottom
    popMatrix();
    ellipse(grassHopperX-280, grassHopperY+43, 55, 10);//back foot
    ellipse(grassHopperX+5, grassHopperY+25, 10, 60);// middle leg
    ellipse(grassHopperX+15, grassHopperY+52, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX+55, grassHopperY+25);
    rotate(PI/1.2);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX+83, grassHopperY+52, 30, 5);//front foot
    
    ellipse(grassHopperX, grassHopperY, 200, 80); // body
    ellipse(grassHopperX + 100, grassHopperY-10, 80, 80); //head
    
    //front side legs
    pushMatrix();
    translate(grassHopperX-90, grassHopperY-10);
    rotate(PI/8.5);
    ellipse(0, 0, 185, 28); //back leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX-240, grassHopperY+10);
    rotate(PI/1.2);
    ellipse(0, 0, 185, 15); //back leg bottom
    popMatrix();
    ellipse(grassHopperX-300, grassHopperY+58, 55, 10);//back foot
    ellipse(grassHopperX, grassHopperY+30, 10, 60);// middle leg
    ellipse(grassHopperX+10, grassHopperY+57, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX+50, grassHopperY+30);
    rotate(PI/1.2);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX+78, grassHopperY+57, 30, 5);//front foot
    
    strokeWeight(5);
    line(grassHopperX + 130, grassHopperY-40, grassHopperX + 170, grassHopperY-160);
    line(grassHopperX + 130, grassHopperY-40, grassHopperX + 190, grassHopperY-160);
    
    //eye
    pushMatrix();
    translate(grassHopperX + 120, grassHopperY-15);
    rotate(PI/1.2);
    fill(0);
    noStroke();
    ellipse(0, 0, 15, 20);
    popMatrix();
    popMatrix();
  }
  void drawJumpingLeft(){
    pushMatrix();
    scale(0.7);
    if(!gameStopped){
      grassHopperX *= (1/0.7);
    }  
    stroke(60,80,10);
    fill(70,90,20);
    
    //back side legs
    pushMatrix();
    translate(grassHopperX+75, grassHopperY-15);
    rotate(PI/1.15);
    ellipse(0, 0, 185, 28); //back leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX+230, grassHopperY);
    rotate(PI/0.85);
    ellipse(0, 0, 185, 15); //back leg bottom
    popMatrix();
    ellipse(grassHopperX+280, grassHopperY+43, 55, 10);//back foot
    ellipse(grassHopperX-5, grassHopperY+25, 10, 60);// middle leg
    ellipse(grassHopperX-15, grassHopperY+52, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX-55, grassHopperY+25);
    rotate(PI/0.85);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX-83, grassHopperY+52, 30, 5);//front foot
    
    ellipse(grassHopperX, grassHopperY, 200, 80); // body
    ellipse(grassHopperX - 100, grassHopperY-10, 80, 80); //head
    
    //front side legs
    pushMatrix();
    translate(grassHopperX+90, grassHopperY-10);
    rotate(PI/1.15);
    ellipse(0, 0, 185, 28); //back leg top
    popMatrix();
    pushMatrix();
    translate(grassHopperX+240, grassHopperY+10);
    rotate(PI/0.85);
    ellipse(0, 0, 185, 15); //back leg bottom
    popMatrix();
    ellipse(grassHopperX+300, grassHopperY+58, 55, 10);//back foot
    ellipse(grassHopperX, grassHopperY+30, 10, 60);// middle leg
    ellipse(grassHopperX-10, grassHopperY+57, 30, 5);//middle foot
    pushMatrix();
    translate(grassHopperX-50, grassHopperY+30);
    rotate(PI/0.85);
    ellipse(0, 0, 10, 60);// front leg
    popMatrix();
    ellipse(grassHopperX-78, grassHopperY+57, 30, 5);//front foot
    
    strokeWeight(5);
    line(grassHopperX - 130, grassHopperY-40, grassHopperX - 170, grassHopperY-160);
    line(grassHopperX - 130, grassHopperY-40, grassHopperX - 190, grassHopperY-160);
    
    //eye
    pushMatrix();
    translate(grassHopperX - 120, grassHopperY-15);
    rotate(PI/1.2);
    fill(0);
    noStroke();
    ellipse(0, 0, 20, 15);
    popMatrix();
    popMatrix();
  }
}  