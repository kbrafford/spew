#include <sys/syscall.h>
#include <unistd.h>

extern char _binary__work_resource_bin_start[];
extern char _binary__work_resource_bin_end[];

#define _BATCH_SIZE 1024

int spew_resource(char *ptr, int len)
{
  int num_batch_packets = len / _BATCH_SIZE;
  int leftover = len % _BATCH_SIZE;

  while(num_batch_packets--)
  {
    syscall(SYS_write, STDOUT_FILENO, ptr, _BATCH_SIZE);
    ptr += _BATCH_SIZE;
  }

  syscall(SYS_write, STDOUT_FILENO, ptr, leftover);

  return 0;
}

int main(void)
{
  spew_resource(_binary__work_resource_bin_start, (unsigned int)(_binary__work_resource_bin_end - _binary__work_resource_bin_start));

  return 0;
}
