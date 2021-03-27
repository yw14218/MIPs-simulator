#include "Memory.hpp"
#include "Memory_map.hpp"
#include <vector>
#include <string>
using namespace std;

void MEMORY_MAP::INIT_MEMORY(){
  ADDR_NULL.OFFSET_SET(0);
  ADDR_NULL.LENGTH_SET(4);

  ADDR_INSTR.OFFSET_SET(0x10000000);
  ADDR_INSTR.LENGTH_SET(0x1000000);

  ADDR_DATA.OFFSET_SET(0x20000000);
  ADDR_DATA.LENGTH_SET(0x4000000);

  ADDR_GETC.OFFSET_SET(0x30000000);
  ADDR_GETC.LENGTH_SET(4);

  ADDR_PUTC.OFFSET_SET(0x30000004);
  ADDR_PUTC.LENGTH_SET(4);
}

MEMORY MEMORY_MAP::getADDR_NULL(){
  return ADDR_NULL;
}

MEMORY MEMORY_MAP::getADDR_INSTR(){
  return ADDR_INSTR;
}
//getter for memory

MEMORY MEMORY_MAP::getADDR_DATA(){
  return ADDR_DATA;
}
//getter for data
MEMORY MEMORY_MAP::getADDR_GETC(){
  return ADDR_INSTR;
}

MEMORY MEMORY_MAP::getADDR_PUTC(){
  return ADDR_INSTR;
}
