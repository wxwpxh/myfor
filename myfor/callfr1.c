#include <stdio.h>        
#include <strings.h>      
extern void fr1_(int *,int *,char *);

int main()
{
        int n=10,nSq;
        char szCtest[20];
        strcpy(szCtest,"teststring");
        fr1_(&n,&nSq,szCtest);
        printf( "The square is:%d\n",nSq );
    return 0;
}
