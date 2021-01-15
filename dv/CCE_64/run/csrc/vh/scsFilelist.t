#include "stdio.h"
#ifdef __cplusplus
extern "C" {
#endif
extern char at_least_one_object_file;
extern void *kernel_scs_file_ht_new(const void *, int);
extern int kernel_scs_file_ht_get(void *, const char *, int *);
extern int  strcmp(const char*, const char*);
  typedef struct {
    char* dFileName;
  } lPkgFileInfoStruct;

  typedef struct {
    char* dFileName;
    char* dRealFileName;
    long dFileOffset;
    unsigned long dFileSize;
    int dFileModTime;
    unsigned int simFlag;
  } lFileInfoStruct;

static int lNumOfScsFiles;
  static lFileInfoStruct lFInfoArr[] = {
  {"synopsys_sim.setup_0", "./synopsys_sim.setup", 73687, 20, 1610695982, 0},
  {"synopsys_sim.setup_1", "/nvme0n1/Applications/Synopsys/vcs-mx_vL-2016.06/bin/synopsys_sim.setup", 73707, 4844, 1464145427, 0},
  {"linux64/packages/synopsys/lib/64/NOVAS__.sim", "", 0, 73687, 0, 0},
  {"linux64/packages/synopsys/lib/64/NOVAS.sim", "", 78551, 47110, 0, 0},
