#include "types.h"
#include "stat.h"
#include "user.h"
#define NULL ((void *)0)
int
main(int argc, char *argv[])
{
int a;
int *pi; 
a = 3;
pi = &a; 
a =*pi;
pi=NULL;
printf(1," the null pointer value is : %p\n" ,*pi);
exit();
}
