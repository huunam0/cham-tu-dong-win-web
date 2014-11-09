{*********************************************************************
*  Program   :   DO THUNG NUOC (Bin)                                 *
*  Date      :   24-7-2006                                           *
*  Group     :   Do thi                                              *
*********************************************************************}
{$r+}
const
   tfi          =       'BIN.INP';
   tfo          =       'BIN.OUT';
   N            =       10000;

type
   mang1        =       array[1..N] of integer;

var
   fi, fo       :       text;
   dad          :       mang1;
   sol          :       mang1;

procedure Init;
var i: integer;
begin
    for i:=1 to N do dad[i]:=0;
    for i:=1 to N do sol[i]:=1;
end;

procedure MoVan(u,v: integer);
var i,j: integer;
begin
   i:=u;
   j:=v;
   while dad[i]>0 do i:=dad[i];
   while dad[j]>0 do j:=dad[j];
   if i<>j then
      begin
         if sol[i]<sol[j] then
            begin
               dad[i]:=j;
               sol[j]:=sol[j]+sol[i];
               sol[i]:=0;
            end
         else
            begin
               dad[j]:=i;
               sol[i]:=sol[i]+sol[j];
               sol[j]:=0;
            end;
      end;
end;

procedure Xuat(u,v: integer);
var i,j: integer;
begin
   i:=u;
   j:=v;
   while dad[i]>0 do i:=dad[i];
   while dad[j]>0 do j:=dad[j];
   if i=j then writeln(fo,1) else writeln(fo,0);
end;

procedure Main;
var P,i: longint;
    u,v,k: integer;
begin
   assign(fi,tfi); reset(fi);
   assign(fo,tfo); rewrite(fo);
   Init;
   readln(fi,P);
   for i:=1 to P do
      begin
         readln(fi,u,v,k);
         case k of
            1: MoVan(u,v);
            2: Xuat(u,v);
         end;
      end;
   close(fi); close(fo);
end;

BEGIN
   Main;
END.