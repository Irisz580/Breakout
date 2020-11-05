import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//font and image
PFont A;
PFont B;
PImage sky;


//gif
PImage [] gif;
int numberOfFrames;
int f;

//Arrays 
int[]x;
int[]y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;

//palette of colors
color C =#202CA7;
color D=#2045A7; 
color E=#0D84B9 ;
color F=#3AB1D3;
color G=#96FAFC;

//entity variables
float px, py, pd;//paddle
float bx, by, bd;//ball
float vx, vy;//speed
boolean akey, dkey;//paddles

//score
int score, lives;


//sound variables
Minim minim;
AudioPlayer win, wall, beep, boop, failure, intro;

int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;

void setup() {
  //background
  sky= loadImage("sky.jpg");

  //font
  A=createFont("Starry Fayez.otf", 50);
  B=createFont("KR Starry Night.ttf", 70);

  //gif
  numberOfFrames= 39;
  gif= new PImage[numberOfFrames];
  int a=0;
  while (a<numberOfFrames) {
    gif[a]=loadImage("frame_" +a+ "_delay-0.03s.gif");
    a++;
  }

  //brick
  brickd=50;
  n=40;
  x=new int [n];
  y=new int [n];
  alive=new boolean [n];
  tempx=120;
  tempy=100;
  int i=0;
  while (i<n) {
    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+80;
    if (tempx> 680) {
      tempx=120;
      tempy=tempy+100;
    }
    i=i+1;
  }

  // general
  size(800, 800);
  mode= INTRO;

  //initialize paddles
  px=width/2;
  py=800;
  pd=200;


  //initialize ball
  bx=width/2;
  by=650;
  bd=20;
  vy= 1;

  //initialize keyboard vars
  akey=dkey=false;

  //initialize lives
  lives=3;

  //minim
  minim=new Minim(this);
  win= minim.loadFile("win.wav");
  wall= minim.loadFile("wall copy.wav");
  beep= minim.loadFile("beep.wav");
  boop= minim.loadFile("boop.wav");
  failure= minim.loadFile("failure.wav");
  intro= minim.loadFile("intro.mp3");
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode== GAME) {
    game();
  } else if (mode== PAUSE) {
    pause();
  } else if (mode== GAMEOVER) {
    gameover();
  } else {
    println("Mode error"+ mode);
  }
}
