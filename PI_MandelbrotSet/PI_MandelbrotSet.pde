import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;

int digits = 8;
MathContext mc = new MathContext(digits * digits + 1);
BigDecimal c = new BigDecimal("0.25");
BigDecimal hundred = new BigDecimal(100);
BigDecimal e = BigDecimal.ONE.divide(hundred.pow(digits-1, mc), mc);
BigDecimal z = BigDecimal.ZERO;
BigDecimal two = new BigDecimal(2);
BigInteger iterations = BigInteger.ZERO;

void setup() {
  size(600, 400);
  
  c = c.add(e);
}

void draw() {
  for (int i = 0; i < 15000; i++) {
    if (z.compareTo(new BigDecimal(2)) == -1) {
      z = z.multiply(z, mc);
      z = z.add(c, mc);
      iterations = iterations.add(BigInteger.ONE);
    } else {
      noLoop();
      break;
    }
  }
  
  background(0);
  fill(255);
  textSize(64);
  textAlign(CENTER);
  String s = iterations.toString();
  int diff = digits - s.length();
  for (int i = 0; i < diff; i++) {
    s = '0' + s;
  }

  s = s.substring(0, 1) + '.' + s.substring(1, s.length());
  text(s, width/2, height/2);
}
