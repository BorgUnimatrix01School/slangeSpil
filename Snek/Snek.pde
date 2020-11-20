int[] snake= new int[2];
String retning ="right";
int boxSize=10;

void setup(){
size(300,300);
initGame();
frameRate(8);
}

void draw(){
  background(180);
  drawGrid();
  drawSnake();
  moveSnake();
    if (gameOver()){
      GmeOver();
    }

}
void GmeOver(){
  frameRate(0);
  fill(255,255,255);
  rect(0,(height/2)-(boxSize*2),width,boxSize*4);
  fill(255,192,203);
  textSize(20);
  text("slut prut, du stinker",(width/2)-85,(height/2)+5);
}
void keyPressed(){
  if(key=='w'&&retning!="ned") retning="op";
  if(key=='a'&&retning!="right") retning="left";
  if(key=='s'&&retning!="op") retning="ned";
  if(key=='d'&&retning!="left") retning="right";
}
void moveSnake(){
  if(retning=="op")
    snake[1]=snake[1]-boxSize;
  if(retning=="left")
    snake[0]=snake[0]-boxSize;
  if(retning=="ned")
    snake[1]=snake[1]+boxSize;
  if(retning=="right")
    snake[0]=snake[0]+boxSize;
}

void initGame(){
  
  snake[0]=width/2;
  snake[1]=height/2;
  
}  

void drawGrid(){
  for(int i=0;i<width;i=i+boxSize){
    line(i,0,i,height);
  }
  for(int i =0;i<height;i=i+boxSize){
    line(0,i,width,i);
  }
}


void drawSnake(){
  fill(random(0,256),random(0,256),random(0,256));
  rect(snake[0],snake[1],boxSize,boxSize);
  fill(0,0,0);
}
boolean gameOver(){
  boolean result=false;
  if (snake[0]<0 || snake[0]>width-boxSize || snake[1]<0 || snake[1]>height-boxSize)
  {
   result = true;
  }
  return result;
}
