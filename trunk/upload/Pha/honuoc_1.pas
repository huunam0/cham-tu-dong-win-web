uses crt;
var     a: array [1..255, 1..255] of byte;
        m, n, k: byte;

procedure input;
var     fi: text;
        i, j: byte;
begin
        assign(fi, 'HONUOC.inp');
        reset(fi);
        readln(fi, m, n, k);
        for i:= 1 to m do
                for j:= 1 to n do
                        read(fi, a[i, j]);
        close(fi);
end;

procedure init;
var     i, j, d, c: byte;
        fo: text;
begin
        input;
        for i:= 1 to m - 1 do
                for j:= 1 to n do
                        if a[m, n] - a[i, j]  > 0 then a[i, j]:= a[m, n] - a[i, j] else a[i, j]:= 0;
        d:= 0;
        c:= 0;
        while d < k do
                begin
                        for i:= 1 to m - 1 do
                                for j:= 1 to n do
                                        if a[i, j] > 0 then
                                                begin
                                                        dec(a[i, j]);
                                                        inc(d);
                                                end;
                        inc(c);
                end;
        assign(fo, 'Honuoc.inp');
        rewrite(fo);
        write(fo, c, ' ',d);
        close(fo);
end;

begin
        init;
end.
