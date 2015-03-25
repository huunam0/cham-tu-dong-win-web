program Bai1(LeQuangPhu);
uses crt;
var n:word;
    f: text;

procedure Doc;
begin
  assign(f,'DOCSO.inp'); reset(f);
  read(f,n);
  close(f);
end;

Procedure Doc1;
begin
  case n of
   0: write(f,'Khong');
   1: write(f,'Mot');
   2: write(f,'Hai');
   3: write(f,'Ba');
   4: write(f,'Bon');
   5: write(f,'Nam');
   6: write(f,'Sau');
   7: write(f,'Bay');
   8: write(f,'Tam');
   9: write(f,'Chin');
  end;
end;

procedure Doc2;
var k,i:word;
begin
 k:=n div 10;
 n:=n mod 10;
 case k of
  1: write(f,'Muoi');
  2: write(f,'Hai muoi');
  3: write(f,'Ba muoi');
  4: write(f,'Bon muoi');
  5: write(f,'Nam muoi');
  6: write(f,'Sau muoi');
  7: write(f,' Bay muoi');
  8: write(f,'Tam muoi');
  9: write(f,'Chin muoi');
 end;
 case k of
  1: write(f,' mot');
  2: write(f,' hai');
  3: write(f,' ba') ;
  4: write(f,' bon');
  5: write(f,' lam');
  6: write(f,' sau');
  7: write(f,' bay');
  8: write(f,' tam');
  9: write(f,' chin');
 end;
end;

procedure Doc3;
var k,k1,i:word;
begin
 k:=n div 100;
 n:=n mod 100;
 k1:= n div 10;
 n:= n mod 10;
 case k of
  1: write(f,'Mot tram');
  2: write(f,'Hai tram');
  3: write(f,'Ba tram');
  4: write(f,'Bon tram');
  5: write(f,'Nam tram');
  6: write(f,'Sau tram');
  7: write(f,'Bay tram');
  8: write(f,'Tam tram');
  9: write(f,'Chin tram');
 end;
 if (n <> 0) then
 case k1 of
  0: write(f,'linh');
  1: write(f,' muoi');
  2: write(f,' hai muoi');
  3: write(f,' ba muoi');
  4: write(f,' bon muoi');
  5: write(f,' nam muoi');
  6: write(f,' sau muoi');
  7: write(f,' bay muoi');
  8: write(f,' tam muoi');
  9: write(f,' chin muoi');
 end;
 if k1=0 then
 if n=5 then write(f,'nam') else
 case n of
  1: write(f,' mot');
  2: write(f,' hai');
  3: write(f,' ba');
  4: write(f,' bon');
  5: write(f,' lam');
  6: write(f,' sau');
  7: write(f,' bay');
  8: write(f,' tam');
  9: write(f,' chin');
 end;
end;

procedure Doc4;
var k,k1,k2,i:word;
begin
 k:=n div 1000;
 n:=n mod 1000;
 k1:= n div 100;
 n:= n mod 100;
 k2:= n div 10;
 n:= n mod 10;
 case k of
  1: write(f,'Mot nghin');
  2: write(f,'Hai nghin');
  3: write(f,'Ba nghin');
  4: write(f,'Bon nghin');
  5: write(f,'Nam nghin');
  6: write(f,'Sau nghin');
  7: write(f,'Bay nghin');
  8: write(f,'Tam nghin');
  9: write(f,'Chin nghin');
 end;
 if ((k1=0) and (k2<>0)) or ((k1=0) and (n<>0)) then
 case k1 of
  0: write(f,' khong tram');
  1: write(f,' mot tram');
  2: write(f,' hai tram');
  3: write(f,' ba tram');
  4: write(f,' bon tram');
  5: write(f,' nam tram');
  6: write(f,' sau tram');
  7: write(f,' bay tram');
  8: write(f,' tam tram');
  9: write(f,' chin tram');
 end;
 if (n<>0) then
 case k2 of
  0: write(f,' linh');
  1: write(f,' muoi');
  2: write(f,' hai muoi');
  3: write(f,' ba muoi');
  4: write(f,' bon muoi');
  5: write(f,' nam muoi');
  6: write(f,' sau muoi');
  7: write(f,' bay muoi');
  8: write(f,' tam muoi');
  9: write(f,' chin muoi');
 end;
 if k2=0 then
 if n=5 then write(f,'nam') else
 case n of
  1: write(f,' mot');
  2: write(f,' hai');
  3: write(f,' ba');
  4: write(f,' bon');
  5: write(f,' lam');
  6: write(f,' sau');
  7: write(f,' bay');
  8: write(f,' tam');
  9: write(f,' chin');
 end;
end;

Begin
  Doc;
  assign(f,'DOCSO.out'); rewrite(f);
       if n div 1000 <> 0 then Doc4
  else if n div 100 <> 0 then Doc3
  else if n div 10 <> 0 then Doc2
  else Doc1;
  close(f);
end.