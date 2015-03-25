uses crt;
var b1,b2,d1,d2,k,i:longint;     f,f2:text;
begin
  assign(f,'dongnuoc.inp');
  reset(f);
  readln(f,d1,d2,k);
  close(f);
  assign(f2,'dongnuoc.out');
  rewrite(f2);
  if d1+d2<k then write(f2,'-1')
  else
    if (d1=k) or (d2=k) then write(f2,1)
    else
      if d1+d2=k then write(f2,2)
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
                write(f2,-1);
                halt;
              end;
          until (b1=k) or (b2=k) or (b1+b2=k);
        write(f2,i);
        end;
        close(f2);
end.
