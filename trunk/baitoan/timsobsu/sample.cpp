#include <bits/stdc++.h>
using namespace std;
 
typedef long long int LL;
LL n;
LL a[]={2,3,5,7,11,13,17,19,23,29};
LL res;
 
void Init()
{
    cin>>n;
    res=LONG_LONG_MAX;
}
 
LL mu(LL i, LL k)
{
    if(k==1) return a[i];
    LL f=mu(i,k/2);
    if (k%2==0) return f*f;
    return f*f*a[i];
}
 
void Try(LL n, LL i, LL x)
{
    if(n==1)
    {
        res=min(res,x);
        return;
    }
    for (LL k=2;k<=n;k++)
    {
        if(n%k==0)
        {
            LL y=mu(i,k-1);
            if(y>0 && x<res/y)
            {
                x=x*y;
                Try(n/k,i+1,x);
                x=x/y;
            }
        }
    }
}
void Solve()
{
    Try(n,0,1);
    cout<<res;
}
 
int main()
{
    Init();
    Solve();
}