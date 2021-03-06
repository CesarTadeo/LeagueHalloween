public class Pumpkin {
  int x;
  int y;
  int xSpeed = 0;
  int bounceSpeed = 0;
  int gravity = 1;
  int pumpkinColor;
  int pmpkinSizePixels = 150;
  int glowingEyesColor = color(240 + random(15), 240 + random(15), random(255));
  int greenStemColor = #2EA22C;

  public Pumpkin( int x, int pumpkinColor ) {
    this.x = x;
    this.y = height - 300;
    this.pumpkinColor = pumpkinColor;
  }

  public void setPumpkinStartHeight( int newHeightInPixels ){
    this.y = newHeightInPixels;
  }
  
  public void moveRight( int speed ){
    this.xSpeed = speed;
  }
  
  public void moveLeft( int speed ){
    this.xSpeed = -speed;
  }

  void draw(boolean bounce) {
    push(); 

    bounceSpeed += gravity;
    y += bounceSpeed ;

    if (y > height - 100) {
      y = height - 100;

      if ( bounce ) {
        bounceSpeed = -bounceSpeed;
      }
    }

    this.x += xSpeed;
    
    if( this.x > width + this.pmpkinSizePixels ){
      this.x = 0 - this.pmpkinSizePixels;
    }
    if( this.x < 0 - this.pmpkinSizePixels ){
      this.x = width;
    }

    ellipseMode(CENTER);

    // Black outline
    stroke(0);
    strokeWeight(2);

    // Draw top stem
    fill(greenStemColor);
    rect(x - 10, y - 90, 15, 20);

    // Draw body
    fill(pumpkinColor);
    ellipse(x, y, this.pmpkinSizePixels, this.pmpkinSizePixels);

    // Set glowing eyes
    fill(glowingEyesColor, random(200) + 50 );  

    // Draw eyes
    triangle(x-30, y-20, x-20, y, x-40, y);
    triangle(x+30, y-20, x+20, y, x+40, y);
    triangle(x, y, x+10, y+20, x-10, y+20);

    // Draw shadow
    ellipse(x, height - 15, (150 * y) / height, (10 * y) / height);

    // Draw mouth
    arc(x, y + 30, 80, 80, 0, PI, 0);
    line(x - 40, y + 30, x + 40, y + 30);

    // Draw tooth  
    fill(this.pumpkinColor);
    rect(x + 10, y + 30, 10, 15);

    // Clear the top outline of the tooth
    strokeWeight(3);
    stroke(this.pumpkinColor);
    fill(this.pumpkinColor);
    line(x + 12, y + 30, x + 17, y + 30);

    pop();
  }
}
