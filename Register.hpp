#ifndef REGISTER_H
#define REGISTER_H

#include <iostream>
#include <cstdlib>

class REGISTER{

private:
    int32_t reg_val;
public:
    void REGISTER_PRINT();// for quick test

    void SET_VAL(int32_t input_val);
    int32_t GET_VAL();
  };

#endif
