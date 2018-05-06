#include "alphabet_mapping.h"


int f[]={262,277,294,311,330, 349,370,392,415,440,466,494,523,554,587,622,659,698,740,784,831,880,932,988};
// 24 notes c4 to b5

int noteDuration =0;
char nam[50];//maximum length of name
int count=0;// length of name
int ind=0;//temporary variable
char inp_char;// input character

void setup(){
  Serial.begin(9600);// data rate in bits/sec
}


//Reset the board
void (*ResetBoard) (void)=0;


//helper function takes arguement as letter_inde(for eg. for b letter index is 1 and for a letter_index is 0) 
// play combination of tones for particular alphabet 
void helper(int letter_index){
  for (int i = 0; i<4; i++){
  noteDuration=2500/(4*Duration[letter_index][i]) ;
  tone(8,f[freqIndex[letter_index][i]],noteDuration);
  delay(noteDuration);
  }
  }


 //Generate a tone for name
 void play_tone(){
  for (int i=0;i<count;i++){
    ind=nam[i]-97;
    if (Serial.available()>0){
      inp_char=Serial.read();
      if (inp_char=='0'){ResetBoard();}//to stop the tone from playing
      }
    helper(ind);
    }
 }
void loop(){
//if data is available on serial monitor
while (Serial.available()>0){
  inp_char=Serial.read();//read character
  if (inp_char=='0'){//to stop the tone from playing
    ResetBoard();
    }
  nam[count]=inp_char;//append input char into name
  ind=inp_char-97;//ascii value of input char - 97(lower case a) gives index of letter
  count++;
  nam[count]='\0';
  }
  delay(300);
  play_tone();
}
