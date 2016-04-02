int R,G,B,A;
PImage ourImage;
PImage tria=createImage(500, 500, ARGB);
int x1,x2,x3,y1,y2,y3,z1,z2,z3;
float dist1,dist2,dist3,dist12,dist13,dist23;
float p12,p23,p13,pall;
float area12,area13,area23,areaall,area123;
int R1,G1,B1,A1;
float t1,t2,t3;
float x,y;
int set;

void setup(){
  size(500,500);
  frameRate(120);
  ourImage= loadImage("http://dreamatico.com/data_images/flowers/flowers-4.jpg");
  ourImage.resize (width, height);
  ourImage.loadPixels();
  tria.loadPixels();
  x1 = floor(random(1,500));
  x2 = floor(random(1,500));
  x3 = floor(random(1,500));
  y1 = floor(random(1,500));
  y2 = floor(random(1,500));
  y3 = floor(random(1,500));
  //dist12 = dist(x1,y1,x2,y2);
  //dist23 = dist(x2,y2,x3,y3);
  //dist13 = dist(x1,y1,x3,y3);
  //pall = (dist12+dist23+dist13)/2;
  //areaall = sqrt(pall*(pall-dist12)*(pall-dist13)*(pall-dist23));
  //z1 = floor(random(20,100));
  //z2 = floor(random(20,100));
  //z3 = floor(random(20,100));
}

void draw(){
  //image(ourImage, 0, 0);
  background(255);
  loadPixels();
    //x1 = floor(random(1,500));
    //x2 = floor(random(1,500));
    //x3 = floor(random(1,500));
    //y1 = floor(random(1,500));
    //y2 = floor(random(1,500));
    //y3 = floor(random(1,500));
  //println(frameRate);
  for(int x=0; x<width;x++){
    for(int y=0; y<height;y++){
       PxPGetPixel(x, y, ourImage.pixels, width);
       dist1 = dist(x,y,x1,y1);
       dist2 = dist(x,y,x2,y2);
       dist3 = dist(x,y,x3,y3);
       t1 = ((x-x1)*(y-y2)) - ((y-y1)*(x-x2));
       t2 = ((x-x2)*(y-y3)) - ((y-y2)*(x-x3));
       t3 = ((x-x3)*(y-y1)) - ((y-y3)*(x-x1));
       if( (t1>0 && t2>0 && t3>0) || (t1<0 && t2<0 && t3<=0)){
         R1 = R;
         G1 = G;
         B1 = B;
         A = 255;
         A1=0;
       }else{
         A = 0;
         A1 =255;
       }
       //p12 = (dist1+dist2+dist12)/2;
       //p23 = (dist2+dist3+dist23)/2;
       //p13 = (dist1+dist3+dist13)/2;
       //area12 = sqrt(p12*(p12-dist1)*(p12-dist2)*(p12-dist12));
       //area23 = sqrt(p23*(p23-dist3)*(p23-dist2)*(p23-dist23));
       //area13 = sqrt(p13*(p13-dist1)*(p13-dist3)*(p13-dist13));
       //area123 = area12+area13+area23;
       //if(areaall == area123){
       //  R1 = R;
       //  G1 = G;
       //  B1 = B;
       //  A = 255;
       //}else{
       //  A=0;
       //}
       PxPSetPixel(x, y, R, G, B, A1, pixels, width);
       PxPSetPixel(x, y, R1, G1, B1, A, tria.pixels, width);
    }
  }
  updatePixels();  
  image(tria,x,y);
  if(mousePressed==true){
  y++;
  }
  if(y>=500){
    set=1;
  }
  //beginShape();
  ////noStroke();
  //texture(tria);
  //vertex(x1,y1);
  //vertex(x2,y2);
  //vertex(x3,y3);
  //vertex(x1,y1);
  //endShape();
}





void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel=pixelArray[x+y*pixelsWidth];     // getting the colors as an int from the pixels[]
  A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
  R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
  G = (thisPixel >> 8) & 0xFF;   
  B = thisPixel & 0xFF;
}


//our function for setting color components RGB into the pixels[] , we need to efine the XY of where
// to set the pixel, the RGB values we want and the pixels[] array we want to use and it's width

void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
  a =(a << 24);                       
  r = r << 16;                       // We are packing all 4 composents into one int
  g = g << 8;                        // so we need to shift them to their places
  color argb = a | r | g | b;        // binary "or" operation adds them all into one int
  pixelArray[x+y*pixelsWidth]= argb;    // finaly we set the int with te colors into the pixels[]
}