int[] snake = new int[2];
String retning = "right";
String sidsteRetning = "ingenting"; // Denne variabel gemmer sidste retning.
int boxSize = 10;

byte gameSpeed = 6; // Denne variabel definerer hvor mange frames der skal gå, før den opdaterer slangens placering. Desto lavere, desto hurtigere bevæger slangen sig.

void setup(){
size(300, 300);
initGame();
frameRate(60); // frameRate skaber input lag ved lavere frames - derfor sættes den til 60, og variablen gameSpeed definerer hvor mange gange slangen opdaterer placering i 1 sekund.
}

void draw(){
  background(180);
  drawGrid();
  drawSnake();
  // Denne if-statement tjekker, om det antal frames programmet har talt op, kan divideres helt med gameSpeed, altså der er ingen restværdi. Hvis det er tilfældet, opdaterer slangens placering sig.
  if(frameCount % gameSpeed == 0){
    moveSnake();
  }
  if (gameOver()){
    GmeOver();
  }

}
void GmeOver(){
  frameRate(0);
  fill(255, 255, 255);
  rect(0, (height/2) - (boxSize * 2), width, boxSize * 4);
  fill(255, 192, 203);
  textSize(20);
  textAlign(CENTER, CENTER); // Dette sætter teksten op i midten af skærmen, når slangen dør.
  text("slut prut, du stinker", width/2, height/2);
}
void keyPressed(){
  if(key == 'w' && sidsteRetning != "ned") retning="op";
  if(key == 'a' && sidsteRetning != "right") retning="left";
  if(key == 's' && sidsteRetning != "op") retning="ned";
  if(key == 'd' && sidsteRetning != "left") retning="right";
}
void moveSnake(){
  sidsteRetning = retning; // Dette gemmer den nuværende retning til sidsteRetning, inden retningen bliver ændret.
  if(retning == "op")
    snake[1] = snake[1] - boxSize;
  if(retning == "left")
    snake[0] = snake[0] - boxSize;
  if(retning == "ned")
    snake[1] = snake[1] + boxSize;
  if(retning == "right")
    snake[0] = snake[0] + boxSize;
}

void initGame(){
  snake[0] = width/2;
  snake[1] = height/2;
}  

void drawGrid(){
  for(int i = 0; i < width; i = i + boxSize){
    line(i, 0, i, height);
  }
  for(int i = 0; i < height; i = i + boxSize){
    line(0, i, width, i);
  }
}


void drawSnake(){
  fill(random(0, 256),random(0, 256),random(0, 256));
  rect(snake[0], snake[1], boxSize, boxSize);
  fill(0, 0, 0);
}
boolean gameOver(){
  boolean result = false;
  if (snake[0] < 0 || snake[0] > width - boxSize || snake[1] < 0 || snake[1] > height - boxSize)
  {
   result = true;
  }
  return result;
}
