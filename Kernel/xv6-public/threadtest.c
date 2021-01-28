#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#define NULL (void *)(0)

void hello(){
    printf(1, "Hello world\n");
    exit();
}


void func(void* a, void* b){
    printf(1, "This is parent\n");
    printf(1, "x: %d\ny: %d\n",*(int*) a, *(int*) b);
    thread_create(&hello, NULL, NULL);
    thread_join();
    exit();
}


int
main(int argc, char *argv[])
{
  int x= 4, y=5;
  printf(1, "this is thread test\n");
  thread_create(&hello, NULL, NULL);
  thread_join();
  thread_create(&func, (void *)&x, (void *)&y);
  thread_join();
  printf(1, "Exit\n");
  exit();

}