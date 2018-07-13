class Aphid{
  int aphidX;
  int aphidY;
  int distance;
  boolean left;
  
  Aphid(int distance, boolean left){
    this.distance = distance;
    aphidX = backX + distance;
    aphidY = backY+5;
    this.left = left;
  }  
  void drawAphid(){
    System.out.println(aphidY);
    System.out.println(y+21);
    noStroke();
    fill(105, 179, 5);
    arc(aphidX, aphidY, 40, 35, PI, PI*2); //body
    stroke(105, 179, 5);
    line(aphidX, aphidY, aphidX, aphidY+5); //middle leg
    line(aphidX+10, aphidY, aphidX+12, aphidY+5); //front leg
    line(aphidX-10, aphidY, aphidX-12, aphidY+5); //back leg
    line(aphidX+2, aphidY-2, aphidX+2, aphidY+3); //middle leg
    line(aphidX+12, aphidY-2, aphidX+14, aphidY+3); //front leg
    line(aphidX-8, aphidY-2, aphidX-10, aphidY+3); //back leg
    fill(0);
    noStroke();
    ellipse(aphidX+14, aphidY-9, 4, 4); //eye
  }
}  