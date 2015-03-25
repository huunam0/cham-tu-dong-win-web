uses crt;
type    the = record
                a: integer;
                kt: ^the;
        end;
        lk = ^the;
var     a: array [1..10000] of lk;
        dd: array [1..10000] of boolean;

procedure add(x, y: integer);
var     p, q: lk;
begin
        new(q);
        q^.a:= y;
        if a[x] = nil then
                begin
                        a[x]:= q;
                end
        else
                begin
                        p:= a[x];
                        while p^.kt <> nil do
                                p:= p^.kt;
                        p^.kt:= q;
                end;
end;

procedure dfs(x: integer);
var     p: lk;
begin
        dd[x]:= true;
        p:= a[x];
        while p <> nil do
                begin
                        if not(dd[p^.a]) then dfs(p^.a);
                        p:= p^.kt;
                end;
end;

procedure init;
begin
        fillchar(dd, sizeof(dd), false);
end;

function result(x, y: integer): byte;
begin
        init;
        dfs(x);
        if dd[y] then exit(1) else exit(0);
end;

procedure input;
var     fi, fo: text;
        x, y, z: integer;
begin
        assign(fi, 'THUNGN.inp');
        reset(fi);
        assign(fo, 'THUNGN.out');
        rewrite(fo);
        while not(eof(fi)) do
                begin
                        read(fi, x, y, z);
                        if z = 1 then
                                begin
                                        add(x, y);
                                        add(y, x);
                                end;
                        if z = 2 then writeln(fo, result(x, y));
                end;
        close(fi);
        close(fo);
end;

begin
        input;
end.
