uses crt;
var     x, y: string;
        f: array [0..255, 0..255] of byte;

procedure input;
var     fi: text;
begin
        assign(fi, 'XAUMECDN.inp');
        reset(fi);
        readln(fi, x);
        readln(fi, y);
        close(fi);
end;

procedure init;
var     i: byte;
begin
        input;
        f[0, 0]:= 0;
        for i:= 1 to length(x) do
                f[i, 0]:= i;
        for i:= 1 to length(y) do
                f[0, i]:= i;
end;

function min(a, b, c: byte): byte;
begin
        min:= a;
        if min > b then min:= b;
        if min > c then min:= c;
end;

procedure dynamic;
var     i, j: byte;
begin
        init;
        for i:= 1 to length(x) do
                for j:= 1 to length(y) do
                        if x[i] = y[j] then f[i, j]:= min(f[i - 1, j], f[i, j - 1], f[i - 1, j - 1])
                        else f[i, j]:= min(f[i - 1, j], f[i, j - 1], 255) + 1;
end;

procedure trace;
var     i, j: byte;
        s: string;
        fo: text;
begin
        clrscr;
        dynamic;
        i:= length(x);
        j:= length(y);
        s:= '';
        while (i <> 0) and (j <> 0) do
                begin
                        if x[i] = y[j] then
                                begin
                                        s:= x[i] + s;
                                        if f[i, j] = f[i - 1, j - 1] then
                                                begin
                                                        dec(i);
                                                        dec(j);
                                                end;
                                        if f[i, j] = f[i - 1, j] then dec(i);
                                        if f[i, j] = f[i, j - 1] then dec(j);
                                end
                        else
                                begin
                                        if f[i, j] = f[i - 1, j] + 1 then
                                                begin
                                                        s:= x[i] + s;
                                                        dec(i);
                                                end;
                                        if f[i, j] = f[i, j - 1] + 1 then
                                                begin
                                                        s:= y[j] + s;
                                                        dec(j);
                                                end;
                                end;
                end;
        assign(fo, 'XAUMECDN.out');
        rewrite(fo);
        writeln(fo, length(s));
        write(fo, s);
        close(fo);
end;

begin
        trace;
end.