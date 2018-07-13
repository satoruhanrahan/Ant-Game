int x; // player x
int y; // player y
boolean[] keys;
boolean antLookingRight = true;
int legMovement;

boolean gameStopped = false;

int backX; // background x
int backY;

Grasshopper g1;
Grasshopper g2;
Grasshopper g3;
Grasshopper g4;
Grasshopper g5;

Grasshopper[] hoppers;

Aphid aphid1;

void setup() {
  fullScreen();
  x = width/2;
  y = height/2 + height/4;
  keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  
  backX = -14000;
  backY = (height/2 + height/4)+(width/60);
  
  
  g1 = new Grasshopper(8410);
  g2 = new Grasshopper(15480);
  g3 = new Grasshopper(2450);
  g4 = new Grasshopper(15430, true);
  g5 = new Grasshopper(5420, true);
  hoppers = new Grasshopper[5];
  hoppers[0] = g1;
  hoppers[1] = g2;
  hoppers[2] = g3;
  hoppers[3] = g4;
  hoppers[4] = g5;
  
  //aphid1 = new Aphid(14500, false);
}

void draw() {
  theGame();
  if(gameStopped){
    gameOver();
  }
  
  
}

void gameOver(){
  fill(255, 229, 193);
  rect(width/4, height/4, width/2, height/1.75);
  textSize(50);
  fill(0);
  text("Game Over", width/2.5, height/2);
  textSize(25);
  fill(0);
  text("You were killed by a grasshopper!", width/2.8, height/1.5);
}

void theGame(){
  background(135,206,235);
  drawBackground();
  g1.drawGrasshopper();
  g2.drawGrasshopper();
  g3.drawGrasshopper();
  g4.drawGrasshopper();
  g5.drawGrasshopper();
  
  //aphid1.drawAphid();
  
  drawAnthill();
  if(antLookingRight){
    drawAntRight();
  }  
  else
    drawAntLeft();
  if (!gameStopped){
    moveAnt();
  }  
}

void keyPressed(){
  if(keyCode == RIGHT){
    if(!gameStopped){
      antLookingRight = true;
    }  
    keys[0] = true;
  }
  if(keyCode == LEFT){
    if(!gameStopped){
      antLookingRight = false;
    }
    keys[1] = true;
  }
  if(keyCode == UP){
    keys[2] = true;
  }
  if(keyCode == DOWN){
    keys[3] = true;
  }
}  
  
void keyReleased(){
  if(keyCode == RIGHT){
    keys[0] = false;
  }
  if(keyCode == LEFT){
    keys[1] = false;
  }
  if(keyCode == UP){
    keys[2] = false;
  }
  if(keyCode == DOWN){
    keys[3] = false;
  }
}  

void drawAntRight(){
  stroke(0);
  if(x > (backX+15010) && x <= (backX+15500)){
    pushMatrix();
    rotate(-0.3);
    translate(-200, 180);
  }
  if(x > (backX+15500) && backY > -230){
    pushMatrix();
    rotate(1.5);
    translate(00, -1240);
  }  
  strokeWeight(1);
  fill(0);
  ellipse(x, y, width/30, height/25); //body
  ellipse(x+(width/50), y-height/140, width/40, height/25); //head
  pushMatrix();
  translate(x-(width/40), y+height/200);
  rotate(-0.2);
  ellipse(0, 0, width/25, height/25); //butt
  popMatrix();
  fill(200);
  ellipse(x+(width/38), y-height/80, width/180, height/100); //eye
  fill(0);
  strokeWeight(2);
  line(x+(width/40), y-height/38, x+(width/30), y-height/25); //antennas
  line( x+(width/30), y-height/25, x+(width/20), y-height/43);
  line(x+(width/43), y-height/38, x+(width/33), y-height/25);
  line( x+(width/33), y-height/25, x+(width/23), y-height/43);
  strokeWeight(5);
  strokeWeight(4);
  strokeWeight(3);
  line(x, y+(width/100), x - legMovement + (width/200), y+(width/40)); //middle leg
  line(x+(width/100), y+(width/100), x+(width/80) + legMovement, y+(width/40)); //front leg
  line(x-(width/100), y+(width/100), x-(width/80) + legMovement - (width/100), y+(width/40));// back leg
  line(x+(width/260), y+(width/160), x+(width/200) - legMovement + (width/200), y+(width/50)); //other side middle leg
  line(x+(width/100), y+(width/160), x+(width/65) + legMovement, y+(width/50)); //other side front leg
  line(x-(width/100), y+(width/160), x-(width/100) + legMovement - (width/100), y+(width/50));//other side back leg
  if(x > (backX+15010) && backY > -230){
    popMatrix();
  }  
}  

void drawAntLeft(){
  stroke(0);
  if(x > (backX+15010) && x < (backX+15500)){
    pushMatrix();
    rotate(-0.3);
    translate(-200, 180);
  }  
  if(x > (backX+15500) && backY > -230){
    pushMatrix();
    rotate(1.5);
    translate(00, -1240);
  }  
  strokeWeight(1);
  fill(0);
  ellipse(x, y, width/30, height/25); //body
  ellipse(x-(width/50), y-height/140, width/40, height/25); //head
  pushMatrix();
  translate(x+(width/40), y+height/200);
  rotate(+0.2);
  ellipse(0, 0, width/25, height/25); //butt
  popMatrix();
  fill(200);
  ellipse(x-(width/38), y-height/80, width/180, height/100); //eye
  fill(0);
  strokeWeight(2);
  line(x-(width/40), y-height/38, x-(width/30), y-height/25); //antennas
  line( x-(width/30), y-height/25, x-(width/20), y-height/43);
  line(x-(width/43), y-height/38, x-(width/33), y-height/25);
  line( x-(width/33), y-height/25, x-(width/23), y-height/43);
  strokeWeight(3);
  line(x, y+(width/100), x + legMovement - (width/200), y+(width/40)); //middle leg
  line(x-(width/100), y+(width/100), x-(width/80) - legMovement, y+(width/40)); //front leg
  line(x+(width/100), y+(width/100), x+(width/80) - legMovement + (width/100), y+(width/40));// back leg
  line(x-(width/260), y+(width/160), x-(width/200) + legMovement - (width/200), y+(width/50)); //other side middle leg
  line(x-(width/100), y+(width/160), x-(width/65) - legMovement, y+(width/50)); //other side front leg
  line(x+(width/100), y+(width/160), x+(width/100) - legMovement + (width/100), y+(width/50));//other side back leg
  if(x > (backX+15010) && backY > -230){
    popMatrix();
  }  
} 

void moveLegs(){
  legMovement+=3;
  if(legMovement > (width/100)){
    legMovement -= (width/100);
  } 
}

void moveAnt(){
  if(keys[0]){ // move right
    moveLegs();
    if(x <= (backX+15000) || backY < -230){
      backX -= 12;
    }
    if(x > (backX+15000) && x < (backX+15500)){
      backX -= 12;
      backY += 8;
      for(int i = 0; i < hoppers.length; i++){
        hoppers[i].grassHopperY += 8/0.7;
      }  
    } 
    if(x >= (backX+15500) && backY >= -230){
      backY -= 8;
      for(int i = 0; i < hoppers.length; i++){
        hoppers[i].grassHopperY += 8/0.7;
      }
    }
  }
  if(keys[1]){ // move left
    moveLegs();
    if(x <= (backX+15000) || backY < -230){
      backX += 12;
    }
    if(x > (backX+15000) && x < (backX+15500) &&  backY >= -230 || backY > 920){
      backX += 12;
      if(backY >= 600){
        backY -= 8;
      }  
      for(int i = 0; i < hoppers.length; i++){
        hoppers[i].grassHopperY -= 8/0.7;
      }  
    } 
    if(x >= (backX+15500) && backY >= -230 || backX > -14840 && backY < -230){
      backY += 8;
      for(int i = 0; i < hoppers.length; i++){
        hoppers[i].grassHopperY -= 8/0.7;
      }  
    }
  }
    /*if(keys[2]){
    }
    if(keys[3]){
    }*/
} 

void drawBackground(){
  noFill();
  stroke(34,139,34);
  strokeWeight(10);
  for(int i = 10000; i < 30000; i+=205){
    arc(backX+i, backY+(width/50)-22, 250, 800, PI, PI/0.70); // tall grass
  }  
  for(int i = 10000; i < 30000; i+=450){
    arc(backX+i, backY+(width/50)-22, 250, 800, PI, PI/0.70); // tall grass
  }  
  strokeWeight(4);
  for(int i = 10000; i < 30000; i+=138){
    arc(backX+i, backY+(width/50)-22, 150, 500, PI, PI/0.70); // short grass
  }  
  for(int i = 10000; i < 30000; i+=246){
    arc(backX+i, backY+(width/50)-22, 150, 500, PI, PI/0.70); // short grass
  }  
  strokeWeight(8);
  for(int i = 10000; i < 30000; i+=168){
    arc(backX+i, backY+(width/50)-22, 200, 700, PI/0.70, PI/0.5); // medium grass
  }  
  for(int i = 10000; i < 30000; i+=349){
    arc(backX+i, backY+(width/50)-22, 200, 700, PI/0.70, PI/0.5); // medium grass
  }
  fill(135);
  noStroke();
  for(int i = 10000; i < 30000; i+=2649){
    ellipse(backX+i, backY+(width/50)-22, 200, 100);//grey rock
  }
  for(int i = 10000; i < 30000; i+=1743){
    ellipse(backX+i, backY+(width/50-22), 200, 100);//grey rock
  }
  fill(102);
  for(int i = 9500; i < 30000; i+=3649){
    ellipse(backX+i, backY+(width/50)-22, 220, 150);//brown rock
  }
  for(int i = 7000; i < 30000; i+=4443){
    ellipse(backX+i, backY+(width/50)-22, 220, 150);//brown rock
  }
  fill(139,69,19);
  rect(backX, backY+(width/50)-22, 20000, height+1000); //ground
  fill(128,128,0);
  rect(backX, backY+(width/60)-22, 20000, height/30); //ground top
}  
  
void drawAnthill(){
  fill(146, 93, 21);
  triangle(backX+15000, backY+25, backX+15500, backY+25, backX+15500, backY-300);//anthill left
  triangle(backX+15600, backY+25, backX+15600, backY-300, backX+16100, backY+25);//anthill right
  fill(41, 27, 7);
  rect(backX+15500, backY-300, 100, 1000);// anthill hole
  rect(backX+15500, backY+700, 1000, 150);// ant chamber
}  
  
  