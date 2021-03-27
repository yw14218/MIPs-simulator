#ifndef MEMORY_MAP_H
#define MEMORY_MAP_H

#include "Memory.hpp"
using namespace std;

class MEMORY_MAP{
private:
  MEMORY ADDR_NULL;
  MEMORY ADDR_INSTR;
  MEMORY ADDR_DATA;
  MEMORY ADDR_GETC;
  MEMORY ADDR_PUTC;

public:
    void INIT_MEMORY();

    MEMORY getADDR_INSTR();
    MEMORY getADDR_DATA();
    MEMORY getADDR_NULL();
    MEMORY getADDR_GETC();
    MEMORY getADDR_PUTC();
};

#endif
