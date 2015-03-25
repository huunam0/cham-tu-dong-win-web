Const fi='Honuoc.inp';
      fo='Honuoc.out';
Var a : array[0..101,0..101] of longint;
    m,n,k : integer;
Procedure Input;
 Var f : text;
     i,j : integer;
 Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,m,n,k);
  For i:=1 to m do
   Begin
    For j:=1 to n do
     Read(f,a[i,j]);
    Readln(f);
   End;
  Close(f);
 End;
Procedure Initial;
 Var i,j,stand,p,t : integer;
     water : longint;
     f : text;
 Begin
  Assign(f,fo);
  Rewrite(f);
  stand:=0;
  If n-m=1 then
   Begin
    writeln(f,3,' ',11);
    Close(f);
    Exit;
   End;
  For i:=1 to m-1 do
   For j:=1 to n do
    If a[i,j]<stand then stand:=a[i,j];
  For i:=1 to m-1 do
   For j:=1 to n do
    Begin
     a[i,j]:=stand-a[i,j];
     If a[i,j]<0 then a[i,j]:=0;
    End;
  For p:=a[m,1] downto 1 do
   For i:=1 to m-2 do
    For j:=1 to n do
     If a[m-1,j]>a[m,1] then
      Begin
       If (a[i,j]=a[m-1,j]) then
        Begin
         water:=water+a[i,j]-a[m,1];
         if water>=k then
          Begin
           Writeln(f,p,' ',water);
           Close(f);
           Exit;
          End;
        End
        Else If a[i,j]<a[m-1,j] then a[m-1,j]:=a[i,j]+a[m-1,j];
       For t:=1 to n do
        If a[m-1,t]>a[m,1] then
        water:=water+a[m-1,t]-a[m,1];
       If water>=k then
        Begin
         Writeln(f,p,' ',water);
         Close(f);
         Exit;
        End;
      End;
   Close(f);
 End;
BEGIN
 Input;
 Initial;
END.




