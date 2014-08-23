//openGUI free GUI library for Processing. Licensed under General Public License (GPL), created by George Bochev on 30 Jan 2014.
//Notes : you must add void keyReleased() to your main code, and then put there all textbox object's function keyReleased();

class Button 
{
  String text="";  
  int pos_x;
  int pos_y;
  int h=80;
  int w=20;
  boolean value=false;
  boolean visible=true;
  PFont font;
  Theme th;
  int themeId = 0;
  int textSize = 12;
  Button(int pos_x, int pos_y, int w, int h)
  {
    this.pos_x=pos_x;
    this.pos_y=pos_y;
    this.h=h;
    this.w=w;
    th = new Theme(themeId);
  }
  void setTheme(int id)
  {
    this.themeId = id;
    th.setTheme(themeId);
  }
  void setText(String text) {
    this.text=text;
  }
  void setFont(PFont font)
  {
    this.font = font;
  }
  void setTextSize(int txtSize)
  {
    this.textSize = txtSize;
  }
  boolean clicked() {
    if (mouseX>pos_x && mouseX<pos_x+w && mouseY>pos_y && mouseY<pos_y+h && mousePressed==true) {   
      value=true;
      return true;
    }
    return false;
  }
  boolean mouseover() {
    if (mouseX>pos_x && mouseX<pos_x+w && mouseY>pos_y && mouseY<pos_y+h) 
    {
      return true;
    }
    return false;
  }
  void draw()
  {
    if (visible)
    {
      if (this.clicked()) fill(th.BUTTON_CLICKED_COLOR); // return true and set value to true
      else if (this.mouseover()) fill(th.BUTTON_MOUSEOVER_COLOR); // return true and set color if mouseover
      else fill(th.BUTTON_DEFAULT_COLOR); //if there is no event sets to default color
      noStroke();
      rect(pos_x, pos_y, w, h);
      fill(th.BUTTON_TEXT_COLOR);
      if (font != null && textSize > 0)
        textFont(this.font, textSize);
      if (textSize > 0)
        textSize(this.textSize);
      text(text, pos_x+5, pos_y+14);
    }
  }
}

class Label
{
  String text="";
  int pos_x = 0;
  int pos_y = 0;
  boolean visible=true;
  PFont font;
  int textSize = 12;
  Theme th;
  int themeId = 0;
  Label(String text, int pos_x, int pos_y)
  {
    this.text=text;
    this.pos_x=pos_x;
    this.pos_y=pos_y;
    th = new Theme(themeId);
  }
    void setTheme(int id)
  {
    this.themeId = id;
    th.setTheme(themeId);
  }
  void setText(String text)
  {
    this.text=text;
  }
  void setFont(PFont font)
  {
    this.font = font;
  }
  void setTextSize(int txtSize)
  {
    this.textSize = txtSize;
  }
  void setLocation(int pos_x, int pos_y)
  {
    this.pos_x = pos_x;
    this.pos_y = pos_y;
  }
  void draw()
  {
    if (visible)
    {
      fill(th.LABEL_TEXT_COLOR);
      if (this.font!=null && textSize>0)
        textFont(this.font, textSize);
      if (textSize>0)
        textSize(textSize);
      text(text, pos_x, pos_y);
    }
  }
}
class Textbox
{
  String text="";
  int pos_x;
  int pos_y;
  int h=20;
  int w=40;
  PFont font;
  int textSize = 12;
  boolean visible=true;
  boolean edit=false;
  Theme th;
  int themeId = 0;
  Textbox(int pos_x, int pos_y, int w)
  {
    this.pos_x=pos_x;
    this.pos_y=pos_y;
    this.w=w;
    th =new Theme(themeId);
  }
    void setTheme(int id)
  {
    this.themeId = id;
    th.setTheme(themeId);
  }
  void setText(String text)
  {
    this.text=text;
  }
  void setTextSize(int txtSize)
  {
    this.textSize = txtSize;
  }
  void setFont(PFont font)
  {
    this.font = font;
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
      if (key!=ENTER && key!=BACKSPACE && key!=CODED && text.length()*8<w)
        text+=key;
      if (keyCode==BACKSPACE && text.length()>0) text = text.substring( 0, text.length()-1 ); 
      if (key==ENTER)edit=false;
    }
  }
  void draw()
  {
    this.clicked();
    if (!edit) stroke(th.TEXTBOX_STROKE_COLOR);
    else stroke(th.TEXTBOX_STROKE_HL_COLOR);
    fill(th.TEXTBOX_COLOR);
    rect(pos_x, pos_y, w, h);
    fill(th.TEXTBOX_TEXT_COLOR);
//    if(edit)
//    {
//    int s = second();
//    if(s%2 == 0)
//    line(text.length()*5+pos_x+5,pos_y+h-2,text.length()*5+pos_x+5,pos_y+2); 
//    }
    if (this.font!=null && textSize>0)
      textFont(this.font, textSize);
    if (textSize>0)
      textSize(textSize);
    text(text, pos_x+5, pos_y+14);
  }
}
