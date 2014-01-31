//openGUI free GUI library for Processing. Licensed under General Public License (GPL), created by George Bochev on 30 Jan 2014.
//Notes : you must add void keyReleased() to your main code, and then put there all textbox object's function keyReleased();
//colors
color BUTTON_CLICKED_COLOR = #026DBC;
color BUTTON_MOUSEOVER_COLOR = #007FDE;
color BUTTON_DEFAULT_COLOR = #034271;
color BUTTON_TEXT_COLOR = #FFFFFF;
color LABEL_TEXT_COLOR = #CBCBCB;
color TEXTBOX_COLOR = #026DBC;
color TEXTBOX_STROKE_COLOR = #007FDE;
color TEXTBOX_TEXT_COLOR = #FFFFFF;
//classes
class button 
{
  String text="";  
  int pos_x;
  int pos_y;
  int h=80;
  int w=20;
  boolean value=false;
  boolean visible=true;
  button(int pos_x, int pos_y, int w, int h)
  {
    this.pos_x=pos_x;
    this.pos_y=pos_y;
    this.h=h;
    this.w=w;
  }
  void setText(String text) {
    this.text=text;
  }
  boolean clicked() {
    if (mouseX>pos_x && mouseX<pos_x+w && mouseY>pos_y && mouseY<pos_y+h && mousePressed==true) {   
      value=true;
      return true;
    }
    return false;
  }
  boolean mouseover() {
    if (mouseX>pos_x && mouseX<pos_x+w && mouseY>pos_y && mouseY<pos_y+h) {
      return true;
    }
    return false;
  }
  void draw()
  {
    if (visible)
    {
      if (this.clicked()) fill(BUTTON_CLICKED_COLOR); // return true and set value to true
      else if (this.mouseover()) fill(BUTTON_MOUSEOVER_COLOR); // return true and set color if mouseover
      else fill(BUTTON_DEFAULT_COLOR); //if there is no event sets to default color
      noStroke();
      rect(pos_x, pos_y, w, h);
      fill(BUTTON_TEXT_COLOR);
      text(text, pos_x+5, pos_y+14);
    }
  }
}

class label
{
  String text="";
  int pos_x;
  int pos_y;
  boolean visible=true;
  label(String text, int pos_x, int pos_y)
  {
    this.text=text;
    this.pos_x=pos_x;
    this.pos_y=pos_y;
  }
  void setText(String text)
  {
    this.text=text;
  }
  void draw()
  {
    if (visible)
    {
      fill(LABEL_TEXT_COLOR);
      text(text, pos_x, pos_y);
    }
  }
}
class textbox
{
  String text="";
  int pos_x;
  int pos_y;
  int h=20;
  int w=40;
  boolean visible=true;
  boolean edit=false;
  textbox(int pos_x, int pos_y, int w)
  {
    this.pos_x=pos_x;
    this.pos_y=pos_y;
    this.w=w;
  }
  void setText(String text)
  {
    this.text=text;
  }
  boolean clicked()
  {
    if (mousePressed==true) edit=false;  
    if (mouseX>pos_x && mouseX<pos_x+w && mouseY>pos_y && mouseY<pos_y+h && mousePressed==true) 
    {   
      edit=true;
      return true;
    }
    return false;
  }
  void keyReleased()
  {
    if (edit)
    {
      if (key!=ENTER && key!=BACKSPACE && key!=CODED)
        text+=key;
      if (keyCode==BACKSPACE && text.length()>0) text = text.substring( 0, text.length()-1 ); 
      if (key==ENTER)edit=false;
    }
  }
  void draw()
  {
    this.clicked();
    if (!edit)noStroke();
    else stroke(TEXTBOX_STROKE_COLOR);
    fill(TEXTBOX_COLOR);
    rect(pos_x, pos_y, w, h);
    fill(TEXTBOX_TEXT_COLOR);
    text(text, pos_x+5, pos_y+14);
  }
}
