uses crt;
type    the = record
                x: real;
                y: real;
        end;
var     m, n, p, q: real;
        a, b, c: the;

procedure input;
var     fi: text;
begin
        assign(fi, 'KTTGIAC.inp');
        reset(fi);
        read(fi, a.x, a.y, b.x, b.y, c.x, c.y);
        close(fi);
end;

function check: boolean;
var     t, x, y, v: real;
begin
        check:= true;
        x:= (a.y - b.y);
        y:= -(a.x - b.x);
        t:= - (x*a.x + y*a.y);
        v:= x*c.x + y*c.y + t;
        if v = 0 then exit(false);
end;

function cv: real;
begin
        m:= sqrt(sqr(a.x - b.x) + sqr(a.y - b.y));
        n:= sqrt(sqr(b.x - c.x) + sqr(b.y - c.y));
        p:= sqrt(sqr(c.x - a.x) + sqr(c.y - a.y));
        exit(m + n + p);
end;

function dt: real;
var     c: real;
begin
        c:= q / 2;
        exit(sqrt(c*(c - m)*(c - n)*(c - p)));
end;

procedure proc;
var     fo: text;
begin
        input;
        assign(fo, 'KTTGIAC.out');
        rewrite(fo);
        if check = false then
                write(fo, 0)
        else
                begin
                        q:= cv;
                        write(fo, q:0:3, ' ', dt:0:3);
                end;
        close(fo);
end;

begin
        proc;
end.