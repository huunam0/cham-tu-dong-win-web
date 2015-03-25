uses crt;
type    the = record
                d: word;
                k: byte;
        end;
var     t: array [1..255] of the;
        f: array [0..255] of byte;
        n, a, b: byte;

procedure input;
var     fi: text;
        i: byte;
begin
        assign(fi, 'VOI14B12.inp');
        reset(fi);
        readln(fi, n, a, b);
        for i:= 1 to n do
                readln(fi, t[i].d, t[i].k);
        close(fi);
end;

procedure swap(var x, y: the);
var     tmp: the;
begin
        tmp:= x;
        x:= y;
        y:= tmp;
end;

procedure QS(x, y: byte);
var     i, j: byte;
        tmp: word;
begin
        i:= x;
        j:= y;
        tmp:= t[(i + j) div 2].d;
        repeat
                while t[i].d < tmp do inc(i);
                while t[j].d > tmp do dec(j);
                if not (i > j) then
                        begin
                                swap(t[i], t[j]);
                                inc(i);
                                dec(j);
                        end;
        until i > j;
        if x < j then QS(x, j);
        if i < y then QS(i, y);
end;

procedure proc;
var     fo: text;
        i, j, d, c, k: byte;
        m: word;
begin
        input;
        QS(1, n);
        m:= high(word);
        for i:= 1 to n - 1 do
                for j:= i + 1 to n do
                        begin
                                c:= 0;
                                d:= 0;
                                for k:= i to j do
                                        begin
                                                if t[k].k = 1 then inc(c);
                                                if t[k].k = 2 then inc(d);
                                        end;
                                if (c >= a) and (d >= b) and (abs(t[j].d - t[i].d) < m) then m:= abs(t[j].d - t[i].d);
                        end;
        assign(fo, 'VOI14B12.out');
        rewrite(fo);
        write(fo, m);
        close(fo);
end;

begin
        proc;
end.