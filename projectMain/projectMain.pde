ArrayList<Objects> ObjectList = new ArrayList<>(); //<>// //<>//
ArrayList<Pieces> PiecesList= new ArrayList<>();
//ArrayList<GolumFin> FinObjectList = new ArrayList<>();
ArrayList<Fire> FireBallList = new ArrayList<>();
PImage [] images=new PImage[23];
PImage [] fireball=new PImage[5];
PImage backGround;
Fire fire;
GameSettings select;
Games games;
GolumFin golumf;
int x=width, y, speed=1, highScore;
float PieceWidth= width-50;
float PieceHeight= height-50;
final int mode =0 ;
final int easy =1;
final int normal =3;
final int hard =5;// sets the number of objest that will be made in the game,
final int exit=10;
boolean  fin;
boolean mouseclicked=false;
int gamemode = mode ;
int imgCounter=0, bgX=0 ;
int pos=50;

void setup()
{

  size (1000, 500);
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage( "images/convayor/"+(i+1) + ".png" );
    images[i].resize(width+350, 500 );
  }
  for (int i = 0; i < fireball.length; i++) {
    fireball[i] = loadImage( "images/keyframes/"+(i+1)+ ".png" );
    fireball[i].resize(50, 75);
  }

  imageMode(CENTER);
  games = new Games(highScore);
  select = new GameSettings();
  PiecesList.add(new Head(PieceWidth, PieceHeight));
  PiecesList.add(new Legs(PieceWidth-50, PieceHeight ));
  PiecesList.add(new Arms(PieceWidth-100, PieceHeight ));// creates the components that needs assembling
  PiecesList.add(new RedArms(PieceWidth, PieceHeight ));
  PiecesList.add(new RedHead(PieceWidth, PieceHeight));
}


void draw()
{
  drawBackGround();

  if (gamemode==mode) {
    background(0);
    select.gameSelect();// runs the main menue
  } else if (gamemode == easy) {
    games.game(highScore);
  } else if (gamemode == normal) {
    games.game(highScore);
  } else if (gamemode== hard ) {
    games.game(highScore);
  } else if (gamemode == exit) {
    System.exit(0);
  }
}


void keyPressed ()// used for the activation of the mouse to tell the program to look for inputs form the user.
{
}


void drawBackGround()
{
  background(0);
  image(images[imgCounter/12 % images.length], width/2, height-175);
  imgCounter++;
}


void highScoreCard(int score)
{
  String [] lines= loadStrings("ScoreCard.txt");
  int [] numbers = convertArrayStrToInt(lines);
  int [] num=insertNumberToArray(numbers, score);
  lines = convertArrayIntToStr(num);
  saveStrings("ScoreCard.txt", lines);
}


void gethighScore() {
  String [] lines= loadStrings("ScoreCard.txt");// loads the score file where high score is saved
  int [] numbers = convertArrayStrToInt(lines);
  highScore= numbers[0];
}

int [] insertNumberToArray(int [] numbers, int score )
{
  if (numbers[0]< score) {
    int [] newHighScore = new int[numbers.length]; // checks if the score is higher than the highscore that is saved in the file
    newHighScore[0] = score;
    return newHighScore;// returns the new high score
  } else
  {
    return numbers;// returns the original high score if the current score is smaller
  }
}


String [] convertArrayIntToStr(int [] arrayInt)
{
  String [] output = new String[arrayInt.length];
  for (int i=0; i<arrayInt.length; i++)
    output[i] =   Integer.toString(arrayInt[i]);// converts int to strings
  return output;
}


int [] convertArrayStrToInt(String [] stringArray )
{
  int [] intArray = new int[stringArray.length]; //create array of ints, same size as string array
  for (int i=0; i< stringArray.length; i++) //loop through array - convert each element in turn and place in int Array
  {
    intArray[i] = Integer.parseInt(stringArray[i]);
  }
  return intArray;//return array of ints
}
