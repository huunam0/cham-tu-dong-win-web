USES crt;
TYPE      lk=^the;
          THE= RECORD            
                a:INTEGER;
                kt:lk;
            END;     
VAR a: ARRAY [1..10000] OF lk;
    x,y,z: INTEGER;
    dd: ARRAY [1..10000] OF BOOLEAN; 
    
PROCEDURE bat(x,y: INTEGER);
VAR p,q: lk;
BEGIN
        new(q);
        q^.a:= y;
        IF a[x] = NIL THEN
                BEGIN
                        a[x]:= q;
                END
        ELSE
                BEGIN
                        p:= a[x];
                        WHILE p^.kt <> NIL DO
                                p:=p^.kt;
                        p^.kt:= q;
                END;       
END;   
      
PROCEDURE find(x: INTEGER);
VAR     p: lk;
BEGIN
        dd[x]:= TRUE;
        p:= a[x];
        WHILE p <> NIL DO
                BEGIN
                        IF NOT(dd[p^.a]) THEN find(p^.a);
                        p:= p^.kt;
                END;
END;    

FUNCTION test(x,y:INTEGER):BYTE;
BEGIN
    find(x);
    IF dd[y] THEN exit(1)
    ELSE exit(0);
END;    
    
PROCEDURE xuly;
VAR f,f1:TEXT;
BEGIN
    assign(f,'thungn.inp'); reset(f);
    assign(f1,'thungn.out'); rewrite(f1);
    fillchar(dd,sizeof(dd),FALSE);
    WHILE NOT eof(f) DO
        BEGIN   
            readln(f,x,y,z);
            IF z=1 THEN 
                BEGIN
                    bat(x,y);
                    bat(y,x);
                END
            ELSE writeln(f1,test(x,y));            
        END;
    close(f);
    close(f1);
END;        
    
BEGIN
    clrscr;
    xuly;
END.        