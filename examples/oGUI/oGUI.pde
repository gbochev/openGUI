Button btnShow=new Button(50,50,90,20);
Button btnHide=new Button(50,80,90,20);
Label lbl=new Label("",10,40);
Label lbl2=new Label("Write your name below, and click on the Show button",10,180);
Textbox tb=new Textbox(10,200,280);
void setup(){
  size(500,300);
  lbl.visible=false;
  btnShow.setText("Show"); 
  btnHide.setText("Hide"); 
  btnShow.setTheme(1);
  btnHide.setTheme(1);
  lbl.setTheme(1);
  lbl2.setTheme(1);
  tb.setTheme(1);
}
void keyReleased(){
tb.keyReleased();
}
void draw(){
 background(200); 
 lbl.draw();
 lbl2.draw();
 btnShow.draw(); 
 btnHide.draw();
 tb.draw();
 if(btnShow.clicked())
 {
 lbl.visible=true; 
 lbl.setText("Your name is :"+tb.text);
 }
 if(btnHide.clicked())lbl.visible=false;
}
