import processing.pdf.*;

String pi;

void setup() {
  size(1000, 1000, PDF, "bookofpi.pdf");
  PGraphicsPDF pdf = (PGraphicsPDF) g;    // Get the render
  pi = loadStrings("data/pi-1million.txt")[0];

  int cols = 100;
  int rows = 100;

  colorMode(HSB, 1.0);
  float w = float(width) / cols;
  float h = float(height) / rows;
  int index = 0;

  int totalPages = pi.length() / (cols * rows);
  for (int i = 0; i < totalPages; i++) {

    for (float y = 0; y < height; y += h) {
      for (float x = 0; x < width; x += w) {
        String s = "" + pi.charAt(index);
        int digit = int(s);
        //float bright = map(digit, 0, 9, 0, 255);
        float hue = digit / 10.0;
        fill(hue, 1, 1);
        noStroke();
        rect(x, y, w, h);
        index++;
      }
    }

    println("Page " + i + " complete!");
    pdf.nextPage();
  }
  exit();
}

void draw() {
}
