#include "types.h"
#include "stat.h"
#include "user.h"
#define NULL ((void *)0)
int main(int argc, char *argv[])
{​​​​​
int *p;
p = NULL;
printf(1, "%d", *p);
exit();
}