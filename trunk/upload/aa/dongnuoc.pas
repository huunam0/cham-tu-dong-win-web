uses crt;
var b1,b2,d1,d2,k,i:longint;     f:text;
begin
  assign(f,'dongnuoc.inp');
  reset(f);
  readln(f,d1,d2,k);
  close(f);
  if d1+d2<k then write('-1')
  else
    if (d1=k) or (d2=k) then write(1)
    else
      if d1+d2=k then write(2)
      else
        begin
          b1:=0;
          b2:=0;
          i:=0;
          repeat
            if b1=0 then
              begin
                inc(i);
                b1:=d1;
              end;
            if b2=d2 then
              begin
                inc(i);
                b2:=0;
              end;
            if b2<d2 then
              begin
                if b1>(d2-b2) then
                  begin
                    inc(i);
                    b1:=b1-(d2-b2);
                    b2:=d2;
                  end
                else
                  begin
                    inc(i);
                    b2:=b1+b2;
                    b1:=0;
                  end;
              end;
            if (b1=0) and (b2=d2) then
              begin
                write(-1);
                halt;
              end;
          until (b1=k) or (b2=k) or (b1+b2=k);
        write(i);
        end;
        readln
end.