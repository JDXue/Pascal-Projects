program TimerChallenge6;
uses sysutils;
var
  finish,start:tdatetime;

function time(finish,start:tdatetime):string;
 var
   diff:tdatetime;
  begin
    diff:=(finish-start);
   time:=(TimeToStr(diff));
  end;

begin
  writeln('');
  readln();
  Now:=(start);
  readln();
  Now:=(finish);
  writeln('',time);
end.

