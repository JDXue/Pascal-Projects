program DayLivedChallenge5;
uses sysutils, dateutils;

var
bd,td:tdatetime;
valdate:string;

function val():tdatetime;
var
userinput,x:string;
begin
 x:=string;
 while userinput<>str do
 writeln('This is not valid, please enter in the format DD/MM/YYYY');
 readln(userinput);
 val:=(strtodate(valdate));
end;


begin
  writeln('');
  readln:=val();
  td:=today;
  (datetostr(td:tdatetime):string);
  daysbetween(bd,td);
end.

