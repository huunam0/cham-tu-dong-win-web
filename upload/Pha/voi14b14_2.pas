uses crt;
type    the = record
                x: longint;
                y: longint;
        end;
var     a, b: array [1..255] of the;
        n: byte;

procedure input;
var     fi: text;
        i: byte;
begin
        assign(fi, 'VOI14B14.inp');
        reset(fi);
        read(fi, n);
        for i:= 1 to n do
                read(fi, a[i].x, a[i].y);
        for i:= 1 to n do
                read(fi, b[i].x, b[i].y);
        close(fi);
end;

function check(a, b, c: the): boolean;
var     t, x, y, v: longint;
begin
        check:= true;
        x:= (a.y - b.y);
        y:= -(a.x - b.x);
        t:= - (x*a.x + y*a.y);
        v:= x*c.x + y*c.y + t;
        if v <> 0 then exit(false);
end;

procedure proc;
var     i, j, k: byte;
        fo: text;
begin
        input;
        assign(fo, 'VOI14B14.out');
        rewrite(fo);
        for i:= 1 to n - 1 do
                for j:= i + 1 to n do
                        for k:= 1 to n do
                                if check(a[i], a[j], b[k]) then
                                        begin
                                                write(fo, i, ' ', j, ' ', k + n);
                                                close(fo);
                                                exit;
                                        end;
        for i:= 1 to n - 1 do
                for j:= i + 1 to n do
                        for k:= 1 to n do
                                if check(b[i], b[j], a[k]) then
                                        begin
                                                write(fo, k, ' ', i + n, ' ', j + n);
                                                close(fo);
                                                exit;
                                        end;
        write(fo, -1);
        close(fo);
end;

begin
        proc;
end.