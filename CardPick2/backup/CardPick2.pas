program CardPick2;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, sysutils
  { you can add units after this };

var
  ran_val, ran_suit:integer;
  cval: string;

  function suits(ran_suit:integer):string;
   var
     name: string;
     begin
       if ran_suit=1 then
        name:='Hearts';
       write('of',name);
       if ran_suit=2 then
        name:='Diamonds';
       write('of',name);
       if ran_suit=3 then
        name:='Clubs';
        write('of',name);
       if ran_suit=4 then
        name:='Spades';
        write('of',name);
     end;

begin
writeln('Press <enter> to pick a random card');
readln;
randomize;
ran_suit:=random(4);
ran_val:=random(14);

writeln('You got: ');

if ran_val>=10 then
 write(ran_val);
Case ran_val of
 11: begin
     cval:='Jack';
     write(cval);
     end;
12: begin
     cval:='Queen';
     write(cval);
     end;
13: begin
     cval:='King';
     write(cval);
     end;
14: begin
     cval:='Ace';
     write(cval);
     end;
end;

suits(ran_suit);
 readln;
end.

