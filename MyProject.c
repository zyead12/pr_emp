#define  red1  portc.b0
#define    yellow1 portc.B1
#define     green1 portc.b2
#define   red2  portc.b3
#define     yellow2 portc.B4
#define     green2 portc.b5
#define    lsd portb.b2
#define     msd portb.b1
#define sw portc.b7




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
         msd=1;
         lsd=1;
         delay_ms(1000);
         
     }
     void part2(int str){
         for(j=str;j>=0;j--)
          {


              count(j);
              if(j>3)
              {
              red2=1;
           green1=1;


                if(sw==0)
          {
          msd=lsd=0;

          counter=3;
                h=1;

               break;
          }
                }
              if(j<=3)
              {

                 red2=1;
                 green1=0;
                    yellow1=1          ;
                           if(sw==0)
          {
          msd=lsd=0;

          counter=4;


               break;
          }
              }

     }
     if(j==0)h=0;
     red2=0;
     yellow1=0;
     green1=0;
     }
    void part1(int str)
    {

          for(j=str;j>=0;j--)
          {
              count(j);
                       if(sw==0)
          {
          msd=lsd=0;

          counter=1;


               break;
          }
              if(j<=3)
              {

              red1=1;
              green2=0;
              yellow2=1;
              if(sw==0)
          {
          msd=lsd=0;

          counter=2;


               break;
          }
              }



          }
                red1=0;
           yellow2=0;
                        }






          

    


      void autom()
{



          for(j=15;j>=0;j--)
          
          {


                 if(j>3)
                 {
              red1=1;
           green2=1;


          if(sw==0)
          {
          msd=lsd=0;

          counter=1;


               break;
          }
             }
                   count(j);

              if(j<=3)
              {


              red1=1;
              green2=0;
              yellow2=1;
              if(sw==0)
          {
          msd=lsd=0;

          counter=2;


               break;
          }
              }



           }


           red1=0;
           yellow2=0;








          for(j=23;j>=0;j--)
{                      if(counter==1||counter==2 )
{
                             break;
}

                counter=0;
                    if(j>3)
                        {
                        
                   if(sw==0)
                   {
                    msd=lsd=0;

                    
                    
                  counter=3;

                      break;
                   }
                   red2=1;
           green1=1;
                   }
              count(j);


              if(j<=3)
              {

                 red2=1;
                 green1=0;
                    yellow1=1;
                     if(sw==0)
                   {
                   
                    msd=lsd=0;
          counter=4;

                      break;
                   }

              }








          }

                  red2=0;
                  yellow1=0;
                  green2=0;





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



         //green1=0;
  portb=0;
  trisc=0b10000000;
  portc=0;
  trisd=0b00000000;portd=0;
  


      for(;;)
      {

             while(sw==1)
          {



                          autom();

           }
                 while(sw==0||sw==1)
                 {
                  while(sw==1)
       {
            autom();
       }
                      inte_bit=1;
        gie_bit=1;
        intedg_bit=1;
          while(counter==1)
       {
       while(sw==1)
       {
       
            autom();
       }
           red1=1;

           green2=1;


       }

         while(counter==2)
       {



           red1=1;

           green2=0;
           yellow2=1;

            delay_ms(3000);
            counter=3;
             while(sw==1)
       {

          part1(3);
          part2(23);
          
            autom();
       }


       }

          while(counter==3)
       {


               red1=0;
           red2=1;
           green1=1;
           yellow2=0;

            while(sw==1)
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
           red2=1;
           green1=0;
           yellow1=1;
           delay_ms(3000);
           counter=5;

          while(sw==1)
       {
              part2(3);
            autom();
       }

       }
       while(counter==5)
       {
        while(sw==1)
       {
       
            autom();
       }
       red2=0;
       yellow1=0;

       counter=1;

        }

       }


      }
      }