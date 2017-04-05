class CellularAutomata
{
  private int[] rules;
  private int generation;
  private int size;
  private int[] cells;

  CellularAutomata(int r[], int s)
  {
    rules = r;
    generation = 0;
    size = s;
    cells = new int[width/size];
    restart();
  }

  private int executeRules(int left, int cell, int right)
  {
    if (left == 1 && cell == 1 && right == 1) return rules[0];
    if (left == 1 && cell == 1 && right == 0) return rules[1];
    if (left == 1 && cell == 0 && right == 1) return rules[2];
    if (left == 1 && cell == 0 && right == 0) return rules[3];
    if (left == 0 && cell == 1 && right == 1) return rules[4];
    if (left == 0 && cell == 1 && right == 0) return rules[5];
    if (left == 0 && cell == 0 && right == 1) return rules[6];
    if (left == 0 && cell == 0 && right == 0) return rules[7];
    return 0;
  } 

  public void generate()
  {
    int nextLine[] = new int[cells.length];

    for (int i = 1; i < cells.length-1; i++)
    { 
      int left = cells[i-1];
      int cell = cells[i];
      int right = cells[i+1];

      nextLine[i] = executeRules(left, cell, right);
    }

    for (int i = 1; i < cells.length-1; i++)
    {
      cells[i] = nextLine[i];
    }

    generation++;
  }

  public void display()
  {
    for (int i = 0; i < cells.length; i++)
    {
      if (cells[i] == 1)
      {
        fill(generation * 255/height, 255, 255);
        //fill(255, 0, 255);
        noStroke();
        rect(i * size, generation * size, size, size);
      }
    }
  }

  public void restart()
  { 
    for (int i = 0; i < cells.length; i++)
    {
      cells[i] = 0;
    }

    cells[cells.length/2] = 1;
    generation = 0;
  }

  public boolean finished()
  {
    if (generation > height/size) 
    {
      return true;
    } else 
    {
      return false;
    }
  }

  public void setRules(int r[])
  {
    rules = r;
  }
}