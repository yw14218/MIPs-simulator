#include "RIJ.hpp"
#include "Register_array.hpp"
#include "int_to_str.hpp"
#include <string>
#include <iostream>

//R Type implementations
int R::GET_R1(){
   std::string tmp = _32_binary.substr(6,5);
   return STR_TO_INT(tmp);
}

int R::GET_R2(){
   std::string tmp = _32_binary.substr(11,5);
   return STR_TO_INT(tmp);
}

int R::GET_D(){
   std::string tmp = _32_binary.substr(16,5);
   return STR_TO_INT(tmp);
}

int R::SHIFT_AMOUNT(){
   std::string tmp = _32_binary.substr(21,5);
   //std::cout << "shift:" << STR_TO_INT(tmp) << std::endl;
   return STR_TO_INT(tmp);
}

int R::GET_DATA(){
   std::string tmp = _32_binary.substr(16,16);
   return STR_TO_INT(tmp);
}

int R::GET_ADDRESS(){
  std::string tmp = _32_binary.substr(6,26);
  return STR_TO_INT(tmp);
}

void R::SET_BIN(std::string _32_binary_in){
   _32_binary = _32_binary_in;
}

std::string R::GET_FN_CODE(){
  std::string tmp = _32_binary.substr(26,6);
   if(tmp == "000000"){
       return "sll";
   }
   else if(tmp == "001000"){
       return "jr";
   }
   else if(tmp == "010000"){
       return "mfhi";
   }
   else if(tmp == "011000"){
       return "mult";
   }
   else if(tmp == "100000"){
       return "add";
   }
   else if(tmp == "001001"){
       return "jalr";
   }
   else if(tmp == "010001"){
       return "mthi";
   }
   else if(tmp == "011001"){
       return "multu";
   }
   else if(tmp == "100001"){
       return "addu";
   }
   else if(tmp == "000010"){
       return "srl";
   }
   else if(tmp == "010010"){
       return "mflo";
   }
   else if(tmp == "011010"){
       return "div";
   }
   else if(tmp == "100010"){
       return "sub";
   }
   else if(tmp == "101010"){
       return "slt";
   }
   else if(tmp == "000011"){
       return "sra";
   }
   else if(tmp == "010011"){
       return "mtlo";
   }
   else if(tmp == "011011"){
       return "divu";
   }
   else if(tmp == "100011"){
       return "subu";
   }
   else if(tmp == "101011"){
       return "sltu";
   }
   else if(tmp == "000100"){
       return "sllv";
   }
   else if(tmp == "100100"){
       return "and";
   }
   else if(tmp == "100101"){
       return "or";
   }
   else if(tmp == "000110"){
       return "srlv";
   }
   else if(tmp == "100110"){
       return "xor";
   }
   else if(tmp == "000111"){
       return "srav";
   }
   else if(tmp == "100111"){
       return "nor";
   }
   else{
       return "notimplemented";
   }

}
  //end of R type def
