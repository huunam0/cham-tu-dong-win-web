#include <bits/stdc++.h>
using namespace std;
 
typedef long long int ll;
typedef long double ld;
typedef pair<int,int> pii;
typedef pair<ll,ll> pll;
typedef vector<int> vi;
typedef vector<vi> vvi;
typedef vector<ll> vl;
typedef vector<vl> vvl;
typedef vector<string> vs;
#define frv(i,cay) for(typeof(cay.begin()) i = cay.begin(); i != cay.end(); i++)
#define fr(i,cay,b)  for (int i=(cay);i<(b); i++)
#define frd(i,cay,b) for (int i=(cay); i>=(b); i--)
#define setall(cay,val) memset(cay, val, sizeof cay)
#define debug(cay) cout << #cay << " = " << cay <<el
#define all(cay) cay.begin(), cay.end()
#define sc(cay) scanf("%d", &cay)
#define el "\n"
#define fi first
#define se second
#define pb push_back
#define mp make_pair
 
const int maxn=300002;
pair<int, int> cay[maxn];
int n, a, b;
vi stung, struc;
 
void solve()
{
    sc(n);
    sc(a);
    sc(b);
    int n1, n2;
    fr(i, 1, n+1){
        sc(n1);
        sc(n2);
        cay[i]=mp(n1, n2);
    }
    sort(cay+1, cay+n+1);
    stung.resize(n+2);
    struc.resize(n+2);
    fr(i, 1, n+1){
        stung[i]=stung[i-1];
        struc[i]=struc[i-1];
        if(cay[i].second==1){
            stung[i]++;
        } else {
            struc[i]++;
        }
    }
    int res=1e9;
    fr(i, 1, n+1){
        int l=1;
        int r=i;
        int vt=-1;
        if(!(stung[i]-stung[l-1]>=a && struc[i]-struc[l-1]>=b)) continue;
        while(l<=r){
            int mid=(l+r)/2;
            if(stung[i] - stung[mid-1]>=a && struc[i]-struc[mid-1]>=b){
                vt=mid;
                l=mid+1;
            } else {
                r=mid-1;
            }
        }
        if(vt!=-1){
            res=min(res, cay[i].first-cay[vt].first);
        }
    }
    if(res==1e9){
        printf("-1");
    } else {
        printf("%d", res);
    }
}
 
int main()
{
    solve();
    return 0;
}