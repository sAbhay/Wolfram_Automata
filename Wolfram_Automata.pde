import at.mukprojects.console.*;

Console c;

CellularAutomata ca;

int rules[] = {1, 0, 1, 0, 1, 0, 0, 1};

void setup()
{
  fullScreen(P3D);

  ca = new CellularAutomata(rules, 1);
  background(0);
  colorMode(HSB);
  
  println("Rule: " + (128*rules[0] + 64*rules[1] + 32*rules[2] + 16*rules[3] + 8*rules[4] + 4*rules[5] + 2*rules[6] + rules[7]) + "  :  " + rules[0], rules[1], rules[2], rules[3], rules[4], rules[5], rules[6], rules[7]);
}

void draw()
{
  if (!ca.finished()) ca.generate();
  ca.display();
}

void mousePressed()
{
  background(0);
  
  for(int i = 0; i < rules.length; i++)
  {
    rules[i] = (int) random(2);
  }
  
  ca.setRules(rules);
  ca.restart();
  
  println("Rule: " + (128*rules[0] + 64*rules[1] + 32*rules[2] + 16*rules[3] + 8*rules[4] + 4*rules[5] + 2*rules[6] + rules[7]) + "  :  " + rules[0], rules[1], rules[2], rules[3], rules[4], rules[5], rules[6], rules[7]);
}