#include "Register.hpp"
#include <iostream>

void REGISTER::REGISTER_PRINT(){
  std::cerr << reg_val;
}

int32_t REGISTER::GET_VAL(){
  return reg_val;
}

void REGISTER::SET_VAL(int32_t input_val){
    reg_val = input_val;
}
