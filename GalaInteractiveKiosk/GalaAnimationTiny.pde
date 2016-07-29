class GalaAnimationTiny extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;
  private float objSize = 50;
  private float objSpace = 50;

  int vizObjectLocX[]={0, 0, 0, 0, 0};
  int vizObjectLocY[]={0, 0, 0, 0, 0};
  int vizObjectC[]={100, 130, 180, 200, 240};
  float grad[]={20, 50, 70, 90, 100};
  float gradReset[]={20, 50, 70, 90, 100};
  float shape[]={0, 0, 0, 0, 0};



  GalaAnimationTiny(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    x=0;
    y=height-40;
    strokeWeight(8);
    stroke(0, 30);
    for (int i=0; i<5; i++) {
      x+=(width/5);
      line(x, 0, x, height);
    }
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    x=-240;

    for (int i=0; i<5; i++) 
    {
      x+=(width/5);

      if (imgOrVec == 0) {                 //visualize vector graphic
        stroke(vizObjectC[i]-80, 20, 150, 255);
        strokeWeight(4);
        pushMatrix();
        fill(vizObjectC[i], 50+grad[i], 190, 255);
        popMatrix();
        rectMode(CENTER);  
        ellipseMode(CENTER);
        if (shape[i]==0) {
          rect(x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
        } else {
          ellipse(x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
        }
      }
      if (imgOrVec == 1) {                 //visualize with png
        imageMode(CENTER);
        image(image, x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
      }
    }
    fill(0);
    text(question, width/2, qEdgeDist);
  }

  public void keyPressed(int key) {
    switch(key) {
    case '1': 
      shape[0] = (int)random(3);
      vizObjectLocX[0]+=objSize;
      if (vizObjectLocX[0]>(objSize*4)) {
        vizObjectLocX[0]=0;
        vizObjectLocY[0]-=objSpace;
        grad[0]+=10;
      }
      break;
    case '2':
      shape[1] = (int)random(3);
      vizObjectLocX[1]+=objSize;
      if (vizObjectLocX[1]>(objSize*4)) {
        vizObjectLocX[1]=0;
        vizObjectLocY[1]-=objSpace;
        grad[1]+=10;
      }
      break;
    case '3':
      shape[2] = (int)random(3);
      vizObjectLocX[2]+=objSize;
      if (vizObjectLocX[2]>(objSize*4)) {
        vizObjectLocX[2]=0;
        vizObjectLocY[2]-=objSpace;
        grad[2]+=10;
      }
      break;
    case '4': 
      shape[3] = (int)random(3);
      vizObjectLocX[3]+=objSize;
      if (vizObjectLocX[3]>(objSize*4)) {
        vizObjectLocX[3]=0;
        vizObjectLocY[3]-=objSpace;
        grad[3]+=10;
      }
      break;
    case '5': 
      shape[4] = (int)random(3);
      vizObjectLocX[4]+=objSize;
      if (vizObjectLocX[4]>(objSize*4)) {
        vizObjectLocX[4]=0;
        vizObjectLocY[4]-=objSpace;
        grad[4]+=10;
      }
      break;
    case '0':
      x=-50;
      y=height-40;
      for (int i=0; i<5; i++) {
        vizObjectLocX[i]=0;
        vizObjectLocY[i]=0;
        grad[i]=gradReset[i];
      }
      background(255);
      fill(0);
      textSize(txtSize);
      text("hello friends", width/2, qEdgeDist);
      imgOrVec = (int)random(2);
      break;
    }
  }
}