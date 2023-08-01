#line 1 "C:/Users/moham/OneDrive/Desktop/New folder/code/MyProject.c"
#line 14 "C:/Users/moham/OneDrive/Desktop/New folder/code/MyProject.c"
 int counter=0;
int i=0;
 int j=0;
 int k=0;
 int h=0;
 int left;
 int right;
 int flag1=0;
 int flag2=0;
 void count(int count)
 {
 right=count%10;
 left=count/10;
 portd=right+(left*16);
  portb.b1 =1;
  portb.b2 =1;
 delay_ms(1000);

 }
 void part2(int str){
 for(j=str;j>=0;j--)
 {


 count(j);
 if(j>3)
 {
  portc.b3 =1;
  portc.b2 =1;


 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;

 counter=3;
 h=1;

 break;
 }
 }
 if(j<=3)
 {

  portc.b3 =1;
  portc.b2 =0;
  portc.B1 =1 ;
 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;

 counter=4;


 break;
 }
 }

 }
 if(j==0)h=0;
  portc.b3 =0;
  portc.B1 =0;
  portc.b2 =0;
 }
 void part1(int str)
 {

 for(j=str;j>=0;j--)
 {
 count(j);
 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;

 counter=1;


 break;
 }
 if(j<=3)
 {

  portc.b0 =1;
  portc.b5 =0;
  portc.B4 =1;
 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;

 counter=2;


 break;
 }
 }



 }
  portc.b0 =0;
  portc.B4 =0;
 }
#line 127 "C:/Users/moham/OneDrive/Desktop/New folder/code/MyProject.c"
 void autom()
{



 for(j=15;j>=0;j--)

 {


 if(j>3)
 {
  portc.b0 =1;
  portc.b5 =1;


 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;

 counter=1;


 break;
 }
 }
 count(j);

 if(j<=3)
 {


  portc.b0 =1;
  portc.b5 =0;
  portc.B4 =1;
 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;

 counter=2;


 break;
 }
 }



 }


  portc.b0 =0;
  portc.B4 =0;








 for(j=23;j>=0;j--)
{ if(counter==1||counter==2 )
{
 break;
}

 counter=0;
 if(j>3)
 {

 if( portc.b7 ==0)
 {
  portb.b1 = portb.b2 =0;



 counter=3;

 break;
 }
  portc.b3 =1;
  portc.b2 =1;
 }
 count(j);


 if(j<=3)
 {

  portc.b3 =1;
  portc.b2 =0;
  portc.B1 =1;
 if( portc.b7 ==0)
 {

  portb.b1 = portb.b2 =0;
 counter=4;

 break;
 }

 }








 }

  portc.b3 =0;
  portc.B1 =0;
  portc.b5 =0;





 }


 void interrupt()
 {
 if(intf_bit==1)
 {

 intf_bit=0;
 counter++;

 }
 }

void main() {
adcon1=7;
trisb=0b00000001;




 portb=0;
 trisc=0b10000000;
 portc=0;
 trisd=0b00000000;portd=0;



 for(;;)
 {

 while( portc.b7 ==1)
 {



 autom();

 }
 while( portc.b7 ==0|| portc.b7 ==1)
 {
 while( portc.b7 ==1)
 {
 autom();
 }
 inte_bit=1;
 gie_bit=1;
 intedg_bit=1;
 while(counter==1)
 {
 while( portc.b7 ==1)
 {

 autom();
 }
  portc.b0 =1;

  portc.b5 =1;


 }

 while(counter==2)
 {



  portc.b0 =1;

  portc.b5 =0;
  portc.B4 =1;

 delay_ms(3000);
 counter=3;
 while( portc.b7 ==1)
 {

 part1(3);
 part2(23);

 autom();
 }


 }

 while(counter==3)
 {


  portc.b0 =0;
  portc.b3 =1;
  portc.b2 =1;
  portc.B4 =0;

 while( portc.b7 ==1)
 {

 part2(23);
 while(h==1)
 {
 part2(23);
 }
 autom();



 }

 }

 while(counter==4)
 {
  portc.b3 =1;
  portc.b2 =0;
  portc.B1 =1;
 delay_ms(3000);
 counter=5;

 while( portc.b7 ==1)
 {
 part2(3);
 autom();
 }

 }
 while(counter==5)
 {
 while( portc.b7 ==1)
 {

 autom();
 }
  portc.b3 =0;
  portc.B1 =0;

 counter=1;

 }

 }


 }
 }
