#include <sys/syscall.h>
#include <unistd.h>

extern char _binary_resource_bin_start[];
extern char _binary_resource_bin_end[];

int spew_resource(char *ptr, int len)
{
  while(len--)
    syscall(SYS_write, STDOUT_FILENO, ptr++, 1);
  return 0;
}

int main(void) {
  spew_resource(_binary_resource_bin_start, (unsigned int)(_binary_resource_bin_end - _binary_resource_bin_start));

  return 0;
}
