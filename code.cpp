#include <stdio.h>
int main(){
    FILE *f1,*f2,*f3;
    int n=0,flag1=0,flag2=0,i;
    char head1[]="memory_initialization_radix=16;\n";
    char head2[]="memory_initialization_vector=\n";
    char temp[20];
    f1=fopen("code.coe","wt");
    f2=fopen("test.txt","rt");
    f3=fopen("int.txt","rt");
    fputs(head1,f1);
    fputs(head2,f1);
    for(i=0;i<3072;i++)
        fputs("00000000,\n",f1);
    for(i;i<4205;i++){
        if(flag1==0)
            fgets(temp,9,f2);
        if(temp[0]=='@')
            flag1=1;
        if(flag1==0){
            temp[8]=',';
            temp[9]='\0';
            fputs(temp,f1);
            }
        else{
            fputs("00000000,\n",f1);
            }
        }
    
    for(i;i<4300;i++){
        if(flag2==0)
            fgets(temp,9,f3);
        if(temp[0]=='@')
            flag2=1;
        if(flag2==0){
            temp[8]=',';
            temp[9]='\0';
            fputs(temp,f1);
            }
        else{
            fputs("00000000,\n",f1);
            }
        }
    }
