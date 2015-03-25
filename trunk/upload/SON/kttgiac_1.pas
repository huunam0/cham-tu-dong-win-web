USES crt;
PROCEDURE xuly;
VAR f,fi:TEXT;
    a,b: ARRAY [1..3] OF REAL;
    x,y,z,p: REAL;
BEGIN
    assign(f,'KTTGIAC.INP'); reset(f);
    assign(fi,'KTTGIAC.OUT'); rewrite(fi);
    readln(f,a[1],b[1]);
    readln(f,a[2],b[2]);
    readln(f,a[3],b[3]);
    x:=sqrt(sqr(a[1]-a[2])+sqr(b[1]-b[2]));
    y:=sqrt(sqr(a[2]-a[3])+sqr(b[2]-b[3]));
    z:=sqrt(sqr(a[1]-a[3])+sqr(b[1]-b[3]));
    IF (x+y<=z) or (x+z<=y) or (z+y<=x) THEN write(fi,0)
    ELSE
        BEGIN
            p:=x+y+z; write (fi,p:3:3,' ');
            p:=p/2;
            p:=sqrt(p*(p-x)*(p-y)*(p-z));
            write(fi,p:3:3);
        END;
    close(f);
    close(fi);
END;

BEGIN
    clrscr;
    xuly;
END.

