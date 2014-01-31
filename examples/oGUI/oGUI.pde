button btnShow=new button(50,50,90,20);
button btnHide=new button(50,80,90,20);
label lbl=new label("",10,40);
label lbl2=new label("Write your name below, adn click on Show button",10,180);
textbox tb=new textbox(10,200,180);
void setup(){
  size(500,300);
  lbl.visible=false;
  btnShow.setText("Show"); 
  btnHide.setText("Hide"); 
}
void keyReleased(){
tb.keyReleased();
}
void draw(){
 background(0); 
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
