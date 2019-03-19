int radius = 400;
String pi;
int[] digits;

int index = 0;

color getColor(int x, int y) {
  int diff = x - y;
  int sum = x + y;
  float red = map(diff, -9, 9, 0, 255);
  float green = map(sum, 0, 18, 0, 255);
  float blue = map(random(diff, sum), -9.0, 18.0, 0.0, 255.0);
  return color(red, green, blue);
}

color getColorHSB(int x, int y) {
  int diff = x - y;
  //int sum = x + y;
  float hue = map(diff, -9, 9, 0, 100);
  //float green = map(sum, 0, 18, 0, 255);
  //float blue = map(random(diff, sum), -9.0, 18.0, 0.0, 255.0);
  return color(hue, 100, 100);
}

void setup() {
  size(820, 820);      //size(radius * 2 + 20, radius * 2 + 20);
  pi = loadStrings("data/pi-1million.txt")[0];
  
  String[] sdigits = pi.split("");
  //println(sdigits.length);
  digits = int(sdigits);
  //printArray(digits);
  
  
  background(0);
  noFill();
  stroke(255);
  translate(width /2, height / 2);
  ellipse(0, 0, radius * 2, radius * 2);
  colorMode(HSB, 100);
}

void draw() {
  translate(width /2, height / 2);
  
  int digit = digits[index];
  int nextDigit = digits[index + 1];    // BUG: OUT OF BOUND
  index++;
  
  //color c = getColor(digit, nextDigit);
  color c = getColorHSB(digit, nextDigit);
  
  float offset = TWO_PI / 10;
  
  float angle1 = map(digit, 0, 10, 0, TWO_PI) + random(-offset, offset);
  float angle2 = map(nextDigit, 0, 10, 0, TWO_PI) + random(-offset, offset);
  
  float x1 = radius * cos(angle1);
  float y1 = radius * sin(angle1);

  float x2 = radius * cos(angle2);
  float y2 = radius * sin(angle2);
  
  stroke(c, 50);
  line(x1, y1, x2, y2);

  if (index >= digits.length - 2) {
    noLoop();
  }
}




/*

// example 1

String pi;
int[] digits;
int[] counts = new int[10];
int index = 0;

void setup() {
  size(400, 400);
  pi = loadStrings("data/pi-1million.txt")[0];
  //println(pi.length());
  
  String[] sdigits = pi.split("");
  //println(sdigits.length);
  digits = int(sdigits);
  //printArray(digits);
}

void draw() {
  background(0);
  translate(width /2, height / 2);
  
  int currentDigit = digits[index];
  index++;
  counts[currentDigit]++;
  
  float w = width / counts.length;
  
  for (int i = 0; i < counts.length; i++) {
     //float x = i * w + w / 2;
     //float y = height / 2;
     float angle = map(i, 0, counts.length, 0, TWO_PI);
     float x = 200 * cos(angle);
     float y = 200 * sin(angle);
     
     
     float d = counts[i];
     
     ellipse(x, y, d, d);
  }
}

*/
