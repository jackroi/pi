let pi = 1;
let iterations = 0;
let div;

let history = [];

function setup() {
  createCanvas(600, 400);
  div = createDiv(pi).style('font-size', '64pt');
}

function draw() {
  background(0);

  let den = iterations * 2 + 3;
  if (iterations % 2 == 0) {
    pi -= 1 / den;
  } else {
    pi += 1 / den;
  }
  history.push(pi * 4);
  
  let piY = map(PI, 2, 4, height, 0);
  line(0, piY, width, piY);
  
  let spacing = width / history.length;
  stroke(255);
  noFill();

  beginShape();
  for (let i = 0; i < history.length; i++) {
    let x = i * spacing;
    let y = map(history[i], 2, 4, height, 0);

    vertex(x, y);
  }
  endShape();

  div.html(pi * 4);

  iterations++;
}

//3.14159265358979323846264338