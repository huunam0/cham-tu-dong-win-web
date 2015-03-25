uses crt;
var     m, n, k: integer;

procedure input;
var     fi: text;
begin
        assign(fi, 'DONGNUOC.inp');
        reset(fi);
        readln(fi, m, n, k);
        close(fi);
end;

procedure swap(var x, y: integer);
var tg: integer;
begin
        if x < y then
                begin
                        tg:= x;
                        x:= y;
                        y:= tg;
                end;
end;

function proc: integer;
var     l, i, j, p: integer;
begin
        input;
        if (n = k) or (m = k) then exit(1);
        if k > m + n then exit(-1);
        if k = m + n then exit(2);
        swap(m, n);
        l:= n - m;
        j:= m - n;
        p:= n;
        for i:= 1 to 2 do
                begin
                        j:= i * m - n;
                        l:= i * n - m;
                        p:= p * i;
                        if p = k then exit((i - 1) * 2 + 1);
                        if (l = k) or (j = k) then exit(2*i);
                end;
        exit(-1);
end;

procedure result;
var     fo: text;
begin
        assign(fo, 'DONGNUOC.out');
        rewrite(fo);
        write(fo, proc);
        close(fo);
end;

begin
        result;
end.