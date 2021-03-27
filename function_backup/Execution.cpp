#include "execution.hpp"
#include "Register.hpp"
#include "Register_array.hpp"
#include "Memory.hpp"
#include "Memory_map.hpp"
#include "R.hpp"
#include "J.hpp"
#include "int_to_str.hpp"
#include <iostream>
#include <string>
using namespace std;

//R Type implementations
void R_TYPE(const std::string &_32_binary, REGISTER* reg);

//J Type implementations
void J_TYPE(const std::string &_32_binary, REGISTER* reg, string op_code, int &PC_int);

//end of R type def
void TYPE_DET(const std::string &_32_binary, REGISTER* reg, int &PC_int);




// Execution may change to take input as uint32_t;
int Execution(MEMORY addr_instr){

  for(int i = 0; i < 32; i++){
    register_array.REGISTER_INI(i);
  }

  //register access reg
  //REGISTER *reg;
  //reg = register_array.GET_REGISTER_ARRAY();
  register_array.REGISTER_INI_PC();


  //sequential execution
  // int PC_obj = register_array.GET_PC();//0,4,8,12
  int PC_int = 0;//0,1,2,3
  while(PC_int < addr_instr.DATA_SIZE()){
    string instruct = addr_instr.DATA_GET(PC_int);
    cout << instruct << endl;
    TYPE_DET(instruct, reg, PC_int);
    // int tmp = PC_int*4+0x1000000;
    // PC_obj.SET_PC(tmp);
    PC_int++;
  }

    // PC_obj.SET_VAL(0);//terminate
  return 0;
}

void TYPE_DET(const std::string &_32_binary, REGISTER* reg, int &PC_int){
  std::string op_code;
  for(int i = 0; i < 6; i++){
    op_code.push_back(_32_binary[i]);
  }

  if(op_code == "000000"){
    R_TYPE(_32_binary, reg);
  }
  if(op_code == "000010" || op_code == "000011"){
    J_TYPE(_32_binary, reg, op_code,PC_int);
  }
  //
  // else{
  //   I_TYPE(_32_binary);
  // }
}

void R_TYPE(const std::string &_32_binary, REGISTER* reg){
  R instruction;
  instruction.SET_BIN(_32_binary);
  std::string FN = instruction.GET_FN_CODE();
  if(FN == "addu"){
     int tmp1 = instruction.GET_R1();
     int tmp2 = instruction.GET_R2();
     std::string R1 = reg[tmp1].GET_VAL();
     std::string R2 = reg[tmp2].GET_VAL();
     int Des = instruction.GET_D();

     int tmp = STR_TO_INT(R1) + STR_TO_INT(R2);

     reg[Des].SET_VAL(INT_TO_STR(tmp));

     }
  }

void J_TYPE(const std::string &_32_binary, REGISTER* reg, string op_code, int &PC_int){
  J instruction;
  instruction.SET_BIN(_32_binary);

  if(op_code == "000010"){//J
     int adr = instruction.GET_ADDRESS();
      if(adr == 0 || (adr > 67108864 and adr < 71303168)){
        PC_int = adr;
        return;
      }else{
        exit(-12);//address forbiden
      }

     }
  }
