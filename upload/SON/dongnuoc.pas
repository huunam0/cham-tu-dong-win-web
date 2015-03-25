USES crt, windows;
VAR n,m,z: INTEGER;
PROCEDURE input;
VAR f:TEXT;
BEGIN
    assign(f,'dongnuoc.inp'); reset(f);
    readln(f,m,n,z);
    close(f);
END;       
    
FUNCTION UCLN(x,y:INTEGER):INTEGER;
BEGIN
     IF x MOD y = 0 THEN UCLN:=y ELSE UCLN:=UCLN(y,x MOD y);
END;

PROCEDURE proc;
VAR f:TEXT;
    x,s,s1,y: INTEGER;
BEGIN                    
    assign(f,'dongnuoc.out'); rewrite(f);
    IF (n<z) AND (m<z) THEN
        BEGIN
            write(f,'-1');
            close(f);
            exit;
        END;
    IF m>n THEN x:=UCLN(m,n)
    ELSE x:=UCLN(n,m);
    IF z MOD x <> 0 THEN 
        begin
            write(f,'-1');
            close(f);
            exit;
        END;     
    s1:=0; s:=0; x:=0; y:=0;
    WHILE (x<>z) AND (y<>z) DO        
        BEGIN
        IF x=m THEN x:=0
        ELSE
            IF y=0 THEN y:=n
        ELSE 
            IF (x<m) AND (y>0) THEN
                IF (x+y<m) THEN 
                    BEGIN
                        x:=x+y;
                        y:=0;
                    END
                ELSE 
                    BEGIN
                        x:=m-x;
                        y:=y-x;
                        x:=m;
                    END;
        inc(s);
        END; 
    x:=0; y:=0;
    WHILE (x<>z) AND (y<>z) DO        
        BEGIN
        IF y=n THEN y:=0
        ELSE
            IF x=0 THEN x:=m
        ELSE 
            IF (y<n) AND (x>0) THEN
                IF (x+y<n) THEN 
                    BEGIN
                        y:=x+y;
                        x:=0;
                    END
                ELSE 
                    BEGIN
                        y:=n-y;
                        x:=x-y;
                        y:=n;
                    END;
        inc(s1);
        END; 
    IF s1>s THEN write(f,s)
    ELSE write(f,s1);
    close(f);
END;

BEGIN    
    clrscr;
    input;
    proc;           
END.   