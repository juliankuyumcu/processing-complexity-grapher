// Concept:
// A plot displaying different runtime complexities of programming algorithms.

// Instructions:
// Press the spacebar to cycle through the runtime complexities. Press the W or S keys to increase or decrease the scale of the plot, respectively.

// Sources:
// Link to a graph depicting runtime complexities and their effiencies: https://www.bigocheatsheet.com/

int elements = 0; //Variable for the number of elements considered in the plot's x-axis
float[] operations = {}; //Array storing the # of operations corresponding with the # of elements, depending on the specific runtime complexity
String[] complexities = {"O(1)", "O(logn)", "O(n)", "O(nlogn)", "O(n^2)"}; //Array storing runtime complexities of algorithms
int complexity = 0; //Variable to store the current index of the complexity array
color good = color(0, 255, 0); //The colour green to represent an efficient runtime
color fair = color(255, 255, 0); //The colour yellow to represent a slightly efficient runtime
color bad = color(255, 127, 0); //The colour orange to represent an inefficient runtime
color horrible = color(255, 0, 0); //The colour red to represent a terribly inefficient runtime

void setup() {
  size(800, 800); //Sets the size of the screen to be 800x800 pixels
  strokeWeight(10); //Sets the stroke weight used by lines to 10 pixels
  elements = 30; //Sets the default scale/# of elements considered (30 lines)
  operations = new float[elements];
  complexity = 0; //Sets the default displayed complexity as O(1)
  fill(0); //Sets the fill colour for text to be black
  textSize(25); //Sets the size of text to be 25 pixels
  textAlign(CENTER); //Sets the alignment of text to be centred
}

void draw() {
  background(255); //Sets the background as white

  //Checks if the current complexity is O(n) (linear)
  if (complexities[complexity].equals("O(n)")) {
    stroke(fair); //Changes stroke colour to yellow, fair efficiency
    //Loops through the operations array
    for (int i = 1; i < elements; i++) {
      //Checks if the value has reached the correct output for a linear complexity
      if (operations[i] < i) {
        operations[i] += (i - operations[i]) * 0.1; //If not, add 10% of the difference (slowdown effect)
      }
      //Draw lines at evenly distributed points, with heights corresponding to the # of operations for that # of elements
      line(map(i, 0, elements, 35, width+10), height - 45, map(i, 0, elements, 35, width+10), height - 45 - (height/elements) * operations[i]);
    }
    //Checks if the current complexity is O(n^2) (exponential)
  } else if (complexities[complexity].equals("O(n^2)")) {
    stroke(horrible); //Changes stroke colour to red, horrible efficiency
    //Loops through the operations array
    for (int i = 1; i < elements; i++) {
      //Checks if the value has reached the correct output for an exponential complexity
      if (operations[i] < Math.pow(i, 2)) {
        operations[i] += (Math.pow(i, 2) - operations[i]) * 0.1; //If not, add 10% of the difference (slowdown effect)
      }
      //Draw lines at evenly distributed points, with heights corresponding to the # of operations for that # of elements
      line(map(i, 0, elements, 35, width+10), height - 45, map(i, 0, elements, 35, width+10), height - 45 - (height/elements) * operations[i]);
    }
    //Checks if the current complexity is O(1) (constant)
  } else if (complexities[complexity].equals("O(1)")) {
    stroke(good); //Changes stroke colour to green, good efficiency
    //Loops through the operations array
    for (int i = 1; i < elements; i++) {
      //Checks if the value has reached the correct output for constant complexity
      if (operations[i] < 1) {
        operations[i] += (1 - operations[i]) * 0.1; //If not, add 10% of the difference (slowdown effect)
      }
      //Draw lines at evenly distributed points, with heights corresponding to the # of operations for that # of elements
      line(map(i, 0, elements, 35, width+10), height - 45, map(i, 0, elements, 35, width+10), height - 45 - (height/elements) * operations[i]);
    }
    //Checks if the current complexity is O(logn) (logarithmic)
  } else if (complexities[complexity].equals("O(logn)")) {
    stroke(good); //Changes stroke colour to green, good efficiency
    //Loops through the operations array
    for (int i = 1; i < elements; i++) {
      //Checks if the value has reached the correct output for a logarithmic complexity
      if (operations[i] < (Math.log10(i))) {
        operations[i] += ((Math.log10(i)) - operations[i]) * 0.1; //If not, add 10% of the difference (slowdown effect)
      }
      //Draw lines at evenly distributed points, with heights corresponding to the # of operations for that # of elements
      line(map(i, 0, elements, 35, width+10), height - 45, map(i, 0, elements, 35, width+10), height - 45 - (height/elements) * operations[i]);
    }
    //Checks if the current complexity is O(nlogn) (logarithmic, scaled linearly)
  } else if (complexities[complexity].equals("O(nlogn)")) {
    stroke(bad); //Changes stroke colour to orange, bad effiency
    //Loops through the operations array
    for (int i = 1; i < elements; i++) {
      //Checks if the value has reached the correct output for a linearly scaled logarithmic complexity
      if (operations[i] < (i * Math.log10(i))) {
        operations[i] += ((i * Math.log10(i)) - operations[i]) * 0.1; //If not, add 10% of the difference (slowdown effect)
      }
      //Draw lines at evenly distributed points, with heights corresponding to the # of operations for that # of elements
      line(map(i, 0, elements, 35, width+10), height - 45, map(i, 0, elements, 35, width+10), height - 45 - (height/elements) * operations[i]);
    }
  }

  stroke(0); //Changes the stroke colour to black for axes and text
  line(30, 0, 30, height); //Draws vertical line for y-axis (# of operations)
  line(0, height - 45, width, height - 45); //Draws horizontal line for x-axis (# of elements)

  pushMatrix(); //Pushes current transformation state to stack
  rotate(-HALF_PI); //Rotates screen by -90 degrees
  text("Operations", -width / 2, 20); //Displays y-axis label vertically
  popMatrix(); //Returns to original transformation state

  text("Elements", width / 2, height - 10); //Displays x-axis label

  text(complexities[complexity], 100, 35); //Displays the current runtime complexity in the top left
}

void keyPressed() {
  //Checks if the user pressed W, and if the scale is maximized
  if ((key == 'w' || key == 'W') && elements < 100) {
    elements += 10; //Adds 10 to the # of considered runtimes (increases scale)
    operations = new float[elements]; //Resets operations array due to new size
    //Checks if the user pressed S, and if the scale is minimized
  } else if ((key == 's' || key == 'S') && elements > 10) {
    elements -=10; //Subtracts 10 to the # of considered runtimes (decreases scale)
    operations = new float[elements]; //Resets operations array due to new size
    //Checks if the user pressed the spacebar
  } else if (key == ' ') {
    complexity++; //Increments complexity index
    //Checks if complexity index was on the last complexity in the array
    if (complexity > 4) {
      complexity = 0; //If so, reset the complexity index
    }
    operations = new float[elements]; //Resets operations array for new animation
  }
}
