class Theme
{
  int themeId = 0;
  color BUTTON_CLICKED_COLOR;
  color BUTTON_MOUSEOVER_COLOR;
  color BUTTON_DEFAULT_COLOR;
  color BUTTON_TEXT_COLOR;
  color LABEL_TEXT_COLOR;
  color TEXTBOX_COLOR;
  color TEXTBOX_STROKE_COLOR;
  color TEXTBOX_TEXT_COLOR;
  color TEXTBOX_STROKE_HL_COLOR;

  Theme(int id)
  {
    setTheme(id);
  }
  void setTheme(int id)
  {
    this.themeId = id;
    select(this.themeId);
  }
  void select(int id)
  {
    switch(id)
    {
    case 0:
      //blue water
      BUTTON_CLICKED_COLOR = #026DBC;
      BUTTON_MOUSEOVER_COLOR = #007FDE;
      BUTTON_DEFAULT_COLOR = #034271;
      BUTTON_TEXT_COLOR = #FFFFFF;
      LABEL_TEXT_COLOR = #CBCBCB;
      TEXTBOX_COLOR = #026DBC;
      TEXTBOX_STROKE_HL_COLOR = #007FDE;
      TEXTBOX_STROKE_COLOR = #015CCB;
      TEXTBOX_TEXT_COLOR = #FFFFFF;
      break;
    case 1:
      //white sky
      BUTTON_CLICKED_COLOR = #FFFFFF;//#026DBC;
      BUTTON_MOUSEOVER_COLOR = #EAEAEA;
      BUTTON_DEFAULT_COLOR = #D8D8D8;
      BUTTON_TEXT_COLOR = #000000;//#FFFFFF;
      LABEL_TEXT_COLOR = #000000;
      TEXTBOX_COLOR = #D8D8D8;
      TEXTBOX_STROKE_HL_COLOR = #007FDE;
      TEXTBOX_STROKE_COLOR = #AAAAAA;
      TEXTBOX_TEXT_COLOR = #000000;
      break;
    }
  }
}
