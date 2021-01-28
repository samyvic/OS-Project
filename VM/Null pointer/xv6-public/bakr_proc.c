#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"

int
main(int argc, char *argv[])
{
  
  char *first = sbrk(0);

  sbrk(PGSIZE);

  *first = 100;
  mprotect(first, 1) ;

  int child = fork();

  if (child > 0)
  {
            wait();

       printf(1, "\nThis will be a trap\n"); 

        *first = 5; 
        
        printf(1, "\nCan you see this message :))\n");

  }
  else if (child == 0)
  {

      printf(1, "This value is protected = %d\n",*first); 

        munprotect(first, 1) ;  

        *first = 5;

        printf(1, "This value is unprotected = %d\n",*first); 

  }

 exit();
}