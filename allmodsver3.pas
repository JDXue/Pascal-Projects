program allmodsver3;
uses crt;
var

  add,ui,sequence,colour,playagain:string;
  i:integer;
  blockseq:array of string;//dynamic array for colours
  score:integer;



function colourpick():String;{input the array in auguments}
var
{changed the colour pick array to byte form so that it would operate in text
background function}
  colours:array[1..4] of string=('red','blue','green','yellow');
  x:integer;
begin
 randomize;
  x:=(random(4)+1);
  colour:=colours[x];
  colourpick:=colours[x];//finds variable in index of random number

end;
procedure firstcol;
 //*procedure* used to generate the first colour, before score can be depended on
begin

    setlength(blockseq,2);
  blockseq[1]:=colour;//puts first colour in sequence
   //problem with delay and clrscr
  end;
 procedure levelup;
 {*procedure* maintains the list of colours so far, dynamic array didn't like
 being called as string argument}
 var
 index,i:integer;
 begin
 score:=score+1;  //gets 1 point for getting a sequence right
 index:=score+1; {two variables? one for array size and one for the index?}
 Setlength(blockseq,index);
 {index didn't work to save the colour pick in the dynamic array, so I swapped
 the score variable in, so it doesn't read an extra value, and it stopped raised
 exception class in assembler}
 blockseq[score]:=colour;

 end;
  procedure seq;{this makes the colour sequence into a
  list of letters to be compared with the user's input}

  begin
   Case colour of
    'red':begin
            {case used for different possibilities of the colourpick function,
             there is an issue, definately the statements or calling the subroutines
             upd:*fixed*}
           add:='r';
       end;
    'blue':begin

           add:='b'; //add is used to save the letter version of the colour
       end;
    'green':begin

           add:='g';
       end;
    'yellow':begin

           add:='y';
       end;
     end;
   end;
procedure twodarray;
var
k,i:integer;
block:array[0..1,0..1]of string;
begin
for i := 0 to 1 do
    begin
      for k := 0 to 1 do
          write(block[i,k],'     ');
      writeln();
     end;

    {atm, this conditional statement is not going through the sequence of
    colours, for statement should go through all indexes in blockseq}
    for k:=0 to (length(blockseq)-1) do
  begin
    if blockseq[k]= 'red' then
       begin
            textbackground(red);
            write(block[0,0],'   ');//block will flash for particular quadrant
            delay(500);
            textbackground(black); //black allows there to be a break inbetween colour
            delay(500);//now 1/2 second, which works better
            clrscr;
       end;

    if blockseq[k]= 'blue' then
       begin
            textbackground(lightblue);
            write(block[1,0],'   ');
            delay(500);
            textbackground(black);
            delay(500);
            clrscr;
       end;

    if blockseq[k]= 'green' then
       begin
            textbackground(green);
            write(block[0,1],'   ');
            delay(500);
            textbackground(black);
            delay(500);
            clrscr;

       end;

    if blockseq[k]= 'yellow' then
       begin
            textbackground(yellow);
            write(block[1,1],'   ');
            delay(500);
            textbackground(black);
            delay(500);
            clrscr;
       end;

      end;
end;

  {---this section was originally in a separate function, but I've found out that
  it seems to only output random colours when this is in the main program-----}
begin
 playagain:='y';
 while playagain='y' do
begin
 //add a way to reset sequence?
 setlength(blockseq,0);
writeln('Press <enter> to add the next colour to the sequence, and press "Q" to stop');
readln;
clrscr;
      colourpick;
      firstcol;
      seq;
      sequence:=add;
      twodarray;
      readln(ui);


   if ui=(sequence) then
      score:=score+1;
      gotoxy(100,1);
        writeln('score: ',score);
        delay(2000);
        clrscr;
   repeat
     begin
        colourpick;
        seq;
        levelup;
        gotoxy(1,1);
        twodarray;
        sequence:=(concat(sequence,add));
   readln(ui);
    gotoxy(100,1);
        writeln('score: ',score);
        delay(2000);
        clrscr;
     end;
    until ui<>sequence;
   if ui<>sequence then
  writeln('Your score was ', score);
   writeln('Output would be: ',sequence);{function is written out to the
   screen to check it works}
  writeln('Play again? (y)=yes (n)=no');
readln(playagain);
if (playagain<>'y')or(playagain<>'n') then
begin
repeat
writeln('Enter either (y) or (n)');
readln(playagain);
until(playagain='y') or (playagain='n');
end;
 if playagain='n' then
 begin
   writeln('Goodbye');
   delay(2000);
   halt;
   end;
  if playagain='y' then
   continue;
 end;
end.

