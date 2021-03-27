#ifndef REGISTER_ARRAY_H
#define REGISTER_ARRAY_H

#include "Register.hpp"

class REGISTER_ARRAY{
  private:
     REGISTER registers[32];
     int PC = 0; // program counter

  public:
    REGISTER* GET_REGISTER_ARRAY();
    void REGISTER_INI(int32_t i);

    void REGISTER_INI_PC();
    int GET_PC();
    void SET_PC(int in);

    int32_t REG_VAL_GET(int index);
};

#endif
