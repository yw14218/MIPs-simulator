#include "Register.hpp"
#include "Register_array.hpp"

void REGISTER_ARRAY::REGISTER_INI(int32_t i){
  registers[i].SET_VAL(0);
}

void REGISTER_ARRAY::REGISTER_INI_PC(){
  PC = 0;
}

REGISTER* REGISTER_ARRAY::GET_REGISTER_ARRAY(){
  return registers;
}

int REGISTER_ARRAY::GET_PC(){
  return PC;
}

void REGISTER_ARRAY::SET_PC(int in){
  PC = in;
}

int32_t REGISTER_ARRAY::REG_VAL_GET(int index){
  return registers[index].GET_VAL();
}

// void REGISTER_ARRAY::REG_PRINT(){
//    for(int i = 0; i < 32; i++){
//       std::cout << "R[" << i << "] = " << register_array[i] << std::endl;
//    }
// }
