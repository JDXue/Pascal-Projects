program Bin_Cal;
 uses
   SysUtils;
var
  bin: string;
  i: integer;
  function calc_binary(num:string):integer;
  var
    bits,i, MSB, binary: integer;
  begin
    bits :=length(num);
    MSB:=1;
    binary:=0;
    for i:=1 to bits do
    begin
        writeln(MSB);
        if num[bits-1]='1' then
        begin
        binary:=binary + MSB;
        writeln('Calculating: ',binary,'at position',bits-i);
        end;
        MSB:= MSB*2;
    end;
    begin
    calc_binary := binary;
  end;

  end;

  begin
    writeln('Enter a binary number');
    readln(bin);
    := calc_binary;
     writeln();
     readkey;
  end.


