#include "Memory_map.hpp"
#include "Register_array.hpp"
#include "RIJ.hpp"
#include "int_to_str.hpp"

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cmath>
#include <cstdint>

void LOAD_INSTRUCTION_TO_MEMORY(string location);
void Execution(const uint32_t &instruction, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER*  &reg, int &nPC_int);
void TYPE_DET(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int);
void R_TYPE(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int);
void J_TYPE(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int, std::string op_code);
int I_TYPE(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int, std::string op_code);
//branch delay
void branch_slot(MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER*  &reg, int &nPC_int);

std::string ORDER(std::string word);
int32_t R_Hi = 0;
int32_t R_Lo = 0;
int32_t PC_int = 0;

int main(int argc, char *argv[]){
  std::string location = argv[1];

  LOAD_INSTRUCTION_TO_MEMORY(location);
  exit(-10);
}

void LOAD_INSTRUCTION_TO_MEMORY(string location){
  //Initialise MEMORY
  MEMORY_MAP memory_map;
  memory_map.INIT_MEMORY();
  MEMORY addr_instr = memory_map.getADDR_INSTR();

  MEMORY addr_null = memory_map.getADDR_NULL();
  MEMORY addr_data = memory_map.getADDR_DATA();
  MEMORY addr_getc = memory_map.getADDR_GETC();
  MEMORY addr_putc = memory_map.getADDR_PUTC();
  addr_data.INITIALISE_DATA();


  //Initialise Register
  REGISTER_ARRAY register_array;
  REGISTER* reg = register_array.GET_REGISTER_ARRAY();
  for(int i = 0; i < 32; i++){
    register_array.REGISTER_INI(i);
  }

  //open file

  ifstream infile;
  infile.open(location.c_str());
  if(!infile.is_open()){
    exit(-21);//IO ERROR
  }

  //load words to memory
  uint32_t word;
  while(infile.read(reinterpret_cast<char*>(&word), sizeof word)){
    word = STR_TO_INT(ORDER(INT_TO_STR(word)));//order correction

    addr_instr.DATA_PUSH(word);
  }
  //Extracts 4 characters from the stream and stores them in the array pointed to by &word.

  int nPC_int = 67108864;
  //points to current address;

  int size = addr_instr.DATA_SIZE();
  while(nPC_int != 0 && nPC_int < size + 67108864){

     uint32_t instr = addr_instr.DATA_GET(nPC_int - 67108864);
     Execution(instr, addr_instr, addr_data, addr_getc, addr_putc, reg, nPC_int);
  }


  std::string reg_v0 = INT_TO_STR(reg[2].GET_VAL());
  reg_v0 = reg_v0.substr(24,8);
  int v0 = STR_TO_INT(reg_v0);
  exit(v0);
  // return value of R2;

}

//end of main scope


void branch_slot(MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int){
  uint32_t instr = addr_instr.DATA_GET(nPC_int - 67108864);
  std::string instr_string = INT_TO_STR(instr);
  TYPE_DET(instr_string, addr_instr, addr_data, addr_getc, addr_putc, reg, nPC_int);
}

std::string ORDER(std::string word){
  std::string instruction;
  instruction = word.substr(24,8) + word.substr(16,8) + word.substr(8,8) + word.substr(0,8);
  return instruction;
}

void Execution(const uint32_t &instruction, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int){
  std::string instr_string = INT_TO_STR(instruction);
  TYPE_DET(instr_string,  addr_instr, addr_data, addr_getc, addr_putc, reg, nPC_int);
}

//type determinate and execute
void TYPE_DET(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int){
  std::string op_code;
  for(int i = 0; i < 6; i++){
    op_code.push_back(_32_binary[i]);
  }

  if(_32_binary == "00000000000000000000000000000000"){//nop
    nPC_int++;
    return;
  }

  else if(op_code == "000000"){
    R_TYPE(_32_binary, addr_instr, addr_data, addr_getc, addr_putc,  reg, nPC_int);
  }

  else if(op_code == "000010" || op_code == "000011"){
    J_TYPE(_32_binary, addr_instr, addr_data, addr_getc, addr_putc,  reg, nPC_int, op_code);
  }

  else{
    I_TYPE(_32_binary, addr_instr, addr_data, addr_getc, addr_putc,  reg, nPC_int, op_code);
  }


}

//type R implementations
void R_TYPE(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int){
  R instruction;
  instruction.SET_BIN(_32_binary);

  std::string Fn = instruction.GET_FN_CODE();
  int r1 = reg[instruction.GET_R1()].GET_VAL();
  int r2 = reg[instruction.GET_R2()].GET_VAL();
  int shift = instruction.SHIFT_AMOUNT();
  int destination = instruction.GET_D();// location

  PC_int = nPC_int;

  if(Fn == "add"){
     int des = r1 + r2;
     if( (r1 >= 0 && r2 >= 0 && des < 0 ) || (r1 < 0 && r2 < 0 && des >= 0) ){
        exit(-10);//overflow
     }
     else{
        reg[destination].SET_VAL(des);
     }
     nPC_int++;
  }

  else if(Fn == "addu"){

     reg[destination].SET_VAL(r1 + r2);
     nPC_int++;
  }

  else if(Fn == "or"){
    reg[destination].SET_VAL(r1 | r2);
    nPC_int++;

  }

  else if(Fn == "jr"){
    nPC_int++;
    PC_int++;
    //std::cerr << "in jr:" << instruction.GET_R1() << " -> " << reg[instruction.GET_R1()].GET_VAL() << std::endl;
    branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
    PC_int = nPC_int;

    uint32_t ur1 = r1;

    if(ur1 % 4 != 0){
      exit(-11);
    }

    if(ur1 == 0 || (ur1 / 4 >= 67108864 && ur1 / 4 < 71303168)){//
        nPC_int = ur1 / 4;
        //std::cerr << "nPC_int in jr:" << r1 << ur1 << std::endl;
    }
    else{
        exit(-11);//address unexcepted
    }

  }

  else if(Fn == "and"){
    reg[destination].SET_VAL(r1 & r2);
    nPC_int++;
  }

  else if(Fn == "xor"){
    reg[destination].SET_VAL(r1 ^ r2);
    nPC_int++;
  }

  else if(Fn == "subu"){
     reg[destination].SET_VAL(r1 - r2);
     nPC_int++;
  }

  else if(Fn == "sub"){
    int des = r1 - r2;
    if( (r1 >= 0 && r2 < 0 && des < 0 ) || (r1 < 0 && r2 >= 0 && des >= 0) ){
       exit(-10);//overflow
    }
    else{
       reg[destination].SET_VAL(des);
    }
    nPC_int++;
  }

  else if(Fn == "sll"){
    reg[destination].SET_VAL(r2 << shift);
    nPC_int++;
  }

  else if(Fn == "sra"){
    reg[destination].SET_VAL(r2 >> shift);
    nPC_int++;
  }

  else if(Fn == "srl"){
    std::string str = INT_TO_STR(r2);
    if(str[0] == '0'){
      reg[destination].SET_VAL(r2 >> shift);
      nPC_int++;
    }
    else{
      int ptr = 31;
      while(ptr >= 0){
        str[ptr] = (ptr < shift) ? '0' : str[ptr - shift];
        ptr--;
      }
      reg[destination].SET_VAL(STR_TO_INT(str));
      nPC_int++;
    }
  }

  else if(Fn == "srlv"){
    std::string str = INT_TO_STR(r2);
    std::string str_r1 = INT_TO_STR(r1);
    shift = STR_TO_INT(str_r1.substr(27,5));

    if(str[0] == '0'){
      reg[destination].SET_VAL(r2 >> shift);
      nPC_int++;
    }
    else{
      int ptr = 31;
      while(ptr >= 0){
        str[ptr] = (ptr < shift) ? '0' : str[ptr - shift];
        ptr--;
      }
      reg[destination].SET_VAL(STR_TO_INT(str));
      nPC_int++;
    }
  }

  else if(Fn == "srav"){
    std::string str_r1 = INT_TO_STR(r1);
    shift = STR_TO_INT(str_r1.substr(27,5));

    reg[destination].SET_VAL(r2 >> shift);
    nPC_int++;
  }

  else if(Fn == "sllv"){
    std::string str_r1 = INT_TO_STR(r1);
    shift = STR_TO_INT(str_r1.substr(27,5));

    reg[destination].SET_VAL(r2 << shift);
    nPC_int++;

  }

  //setters:
  else if(Fn == "slt"){
    if(r1 < r2){
      reg[destination].SET_VAL(1);
    }else{
      reg[destination].SET_VAL(0);
    }
    nPC_int++;
  }

  else if(Fn == "sltu"){
    uint32_t ur1 = unsigned(r1);
    uint32_t ur2 = unsigned(r2);

    if(ur1 < ur2){
      reg[destination].SET_VAL(1);
    }else{
      reg[destination].SET_VAL(0);
    }
    nPC_int++;
  }

  else if(Fn == "multu"){
    uint64_t result;
    uint32_t u32r1 = r1;
    uint32_t u32r2 = r2;
    uint64_t ur1 = u32r1;
    uint64_t ur2 = u32r2;

    result = ur1 * ur2;

    int32_t tmp1 = result >> 32;
    R_Hi = tmp1; //right shift to get MSB
    R_Lo = result & 0xffffffff;
    nPC_int++;
  }

  else if(Fn == "mult"){
    int64_t result;
    int64_t sr1 = r1;
    int64_t sr2 = r2;
    result = sr1 * sr2;

    int32_t tmp1 = result >> 32;
    R_Hi = tmp1; //right shift to get MSB
    R_Lo = result & 0xffffffff;
    nPC_int++;
  }

  else if(Fn == "divu"){
    if(r2 == 0){
      exit(-10); // divide by 0;
    }

    uint32_t ur1 = r1;
    uint32_t ur2 = r2;
    R_Lo = ur1 / ur2;
    R_Hi = ur1 % ur2;
    nPC_int++;
  }

  else if(Fn == "div"){
    if(r2 == 0){
      exit(-10); // divide by 0;
    }

    R_Lo = r1 / r2;
    R_Hi = r1 % r2;
    nPC_int++;
  }

  else if(Fn == "mthi"){//move to Hi
    R_Hi = r1;
    nPC_int++;
  }

  else if(Fn == "mtlo"){
    R_Lo = r1;
    nPC_int++;
  }

  else if(Fn == "mfhi"){
    reg[destination].SET_VAL(R_Hi);
    nPC_int++;
  }

  else if(Fn == "mflo"){
    reg[destination].SET_VAL(R_Lo);
    nPC_int++;
  }

  else if(Fn == "jalr"){
    PC_int++;
    branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
    PC_int = nPC_int;

    if(r1 % 4 != 0){
      exit(-11);
    }

    if(r1 == 0 || (r1 / 4  >= 67108864 and r1 / 4 < 71303168)){
       nPC_int = r1 / 4;

       reg[destination].SET_VAL(4*nPC_int + 8);
    }
    else{
       exit(-11);//address unexcepted
    }

  }

  else{
    exit(-12);//incomplete functionality
  }
}

//type J implementations
void J_TYPE(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int, std::string op_code){
  R instruction;
  instruction.SET_BIN(_32_binary);
  PC_int = nPC_int;

  if(op_code == "000010"){//J
     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;
     uint32_t adr = instruction.GET_ADDRESS();
     adr = ((nPC_int*4) & (0xf0000000)) | (adr << 2);

     if(adr % 4 != 0){
       exit(-11);
     }

     if(adr == 0 || (adr / 4  >= 67108864 and adr / 4 < 71303168)){
        nPC_int = adr / 4;
     }
     else{
        exit(-11);//address unexcepted
     }

  }

  else if(op_code == "000011"){//JAL
     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;

     uint32_t adr = instruction.GET_ADDRESS();
     adr = ((nPC_int*4) & (0xf0000000)) | (adr << 2);

     if(adr % 4 != 0){
       exit(-11);
     }

     if(adr == 0 || (adr / 4  >= 67108864 and adr / 4 < 71303168)){
        nPC_int = adr / 4;

        reg[31].SET_VAL(adr + 8);
     }
    else{
        exit(-11);//address unexcepted
    }

  }

  else{
     exit(-12);
  }
}


int I_TYPE(const std::string &_32_binary, MEMORY& addr_instr, MEMORY& addr_data, MEMORY& addr_getc, MEMORY& addr_putc, REGISTER* &reg, int &nPC_int, string op_code){
  R instruction;
  instruction.SET_BIN(_32_binary);

  int rs = reg[instruction.GET_R1()].GET_VAL();
  int rt = instruction.GET_R2(); // location
  int data = instruction.GET_DATA(); // value
  PC_int = nPC_int;
  if(op_code == "001111"){
     data = data << 16;
     reg[rt].SET_VAL(data);
     nPC_int++;
  }//lui

  else if(op_code == "001101"){
     reg[rt].SET_VAL(data | rs);
     nPC_int++;
  }//ori

  else if(op_code == "000101"){
      std::string _16_bit_binary;
     if(reg[rt].GET_VAL() == rs){
       PC_int++;
       branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
       PC_int = nPC_int;//delay
       nPC_int+=2;
     }
     else{
        PC_int++;
        branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
        PC_int = nPC_int;//delay

        if(data > 32767){
          _16_bit_binary = SIGNED_INT_TO_STR(data);
        }

        else{
          _16_bit_binary = INT_TO_STR(data);
        }

        int offset = STR_TO_INT(_16_bit_binary);
        nPC_int += offset;
        nPC_int++;
     }
  }//bne

  //addiu
  else if(op_code == "001001"){
      std::string _16_bit_binary;
      if(data > 32767){
        _16_bit_binary = SIGNED_INT_TO_STR(data);
      }

      else{
        _16_bit_binary = INT_TO_STR(data);
      }

      int immediate = STR_TO_INT(_16_bit_binary);
      // std::cerr << "rs" << rs <<endl;
      // std::cerr << "imm" << immediate <<endl;
      // std::cerr << "addiu" << (rs + immediate) <<endl;
      reg[rt].SET_VAL(rs + immediate);
      nPC_int++;
  }

  //addi
  else if(op_code == "001000"){
      std::string _16_bit_binary;
      if(data > 32767){
        _16_bit_binary = SIGNED_INT_TO_STR(data);
      }

      else{
        _16_bit_binary = INT_TO_STR(data);
      }

      int immediate = STR_TO_INT(_16_bit_binary);

      int des = rs + immediate;
      if( (rs >= 0 && immediate >= 0 && des < 0 ) || (rs < 0 && immediate < 0 && des >= 0) ){
         exit(-10);//overflow
      }
      else{
         reg[rt].SET_VAL(des);
      }
      nPC_int++;
  }

  //andi
  else if(op_code == "001100"){
    reg[rt].SET_VAL(rs & data);
    nPC_int++;

  }
  //xori
  else if(op_code == "001110"){
    reg[rt].SET_VAL(rs ^ data);
    nPC_int++;

  }
  //beq
  else if(op_code == "000100"){

     std::string _16_bit_binary;
     if(reg[rt].GET_VAL() != rs){
       PC_int++;
       branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
       PC_int = nPC_int;//delay
       nPC_int+=2;
     }
     else{
        PC_int++;
        branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
        PC_int = nPC_int;//delay

        if(data > 32767){
          _16_bit_binary = SIGNED_INT_TO_STR(data);
        }

        else{
          _16_bit_binary = INT_TO_STR(data);
        }

        int offset = STR_TO_INT(_16_bit_binary);
        nPC_int += offset;
        nPC_int++;
     }
  }

  //bgtz
  else if(op_code == "000111" && rt == 0){


   std::string _16_bit_binary;
   if(rs <= 0 ){
     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;//delay
     nPC_int+=2;
   }
   else{
      PC_int++;
      branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
      PC_int = nPC_int;//delay

      if(data > 32767){
        _16_bit_binary = SIGNED_INT_TO_STR(data);
      }

      else{
        _16_bit_binary = INT_TO_STR(data);
      }

      int offset = STR_TO_INT(_16_bit_binary);
      nPC_int += offset;
      nPC_int++;
   }

  }
  //end of bgtz
  //bltz
  else if(op_code == "000001" && rt == 0){

   std::string _16_bit_binary;
   if(rs >= 0){
     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;//delay
     nPC_int+=2;
   }
   else{
      PC_int++;
      branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
      PC_int = nPC_int;//delay

      if(data > 32767){
        _16_bit_binary = SIGNED_INT_TO_STR(data);
      }

      else{
        _16_bit_binary = INT_TO_STR(data);
      }

      int offset = STR_TO_INT(_16_bit_binary);
      nPC_int += offset;
      nPC_int++;
   }

  }

 //bgez
 else if(op_code == "000001" && rt == 1){

  std::string _16_bit_binary;
  if(rs < 0){
    PC_int++;
    branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
    PC_int = nPC_int;//delay
    nPC_int+=2;
  }
  else{
     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;//delay


     if(data > 32767){
       _16_bit_binary = SIGNED_INT_TO_STR(data);
     }

     else{
       _16_bit_binary = INT_TO_STR(data);
     }

     int offset = STR_TO_INT(_16_bit_binary);
     nPC_int += offset;
     nPC_int++;
  }

 }

 //blez
 else if(op_code == "000110" && rt == 0){

  std::string _16_bit_binary;
  if(rs > 0){
    PC_int++;
    branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
    PC_int = nPC_int;//delay
    nPC_int+=2;
  }
  else{
     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;//delay



     if(data > 32767){
       _16_bit_binary = SIGNED_INT_TO_STR(data);
     }

     else{
       _16_bit_binary = INT_TO_STR(data);
     }
     int offset = STR_TO_INT(_16_bit_binary);
     nPC_int += offset;
     nPC_int++;
  }
}
  //end of blez

//setters
else if(op_code == "001010"){//slti
  std::string _16_bit_binary;
  if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

  else{
     _16_bit_binary = INT_TO_STR(data);
   }

  data = STR_TO_INT(_16_bit_binary);

  if(rs < data){
    reg[rt].SET_VAL(1);
  }
  else{
    reg[rt].SET_VAL(0);
  }
  nPC_int++;
}

else if(op_code == "001011"){//sltiu
  unsigned ur1 = unsigned(rs);
  unsigned ur2 = unsigned(data);

  if(rs < data){
    reg[rt].SET_VAL(1);
  }
  else{
    reg[rt].SET_VAL(0);
  }
  nPC_int++;
}

else if(op_code == "000001" && rt == 16){//BLTZAL branch on rs < 0 and link
  std::string _16_bit_binary;

  if(rs >= 0){
    PC_int++;
    branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
    PC_int = nPC_int;//delay
    nPC_int+=2;
     reg[31].SET_VAL(nPC_int * 4);
  }

  else{

     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;//delay

     if(data > 32767){
       _16_bit_binary = SIGNED_INT_TO_STR(data);
     }

     else{
       _16_bit_binary = INT_TO_STR(data);
     }

     int offset = STR_TO_INT(_16_bit_binary);
     nPC_int += offset;
     nPC_int++;
      reg[31].SET_VAL((PC_int+2) * 4);
  }
}

else if(op_code == "000001" && rt == 17){//BGEZAL branch on r1 >= 0 and link
  std::string _16_bit_binary;

  if(rs < 0){
    PC_int++;
    branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
    PC_int = nPC_int;//delay

    nPC_int+=2;
    reg[31].SET_VAL(nPC_int * 4);
  }

  else{//$s>=0

     PC_int++;
     branch_slot(addr_instr, addr_data, addr_getc, addr_putc, reg, PC_int);
     PC_int = nPC_int;//delay

     if(data > 32767){
       _16_bit_binary = SIGNED_INT_TO_STR(data);
     }

     else{
       _16_bit_binary = INT_TO_STR(data);
     }

     int offset = STR_TO_INT(_16_bit_binary);
     nPC_int += offset;
     nPC_int++;
     reg[31].SET_VAL((PC_int+2) * 4);
  }
}



else if(op_code == "101011"){//SW
  std::string _16_bit_binary;
  if(data > 32767){
    _16_bit_binary = SIGNED_INT_TO_STR(data);
  }

  else{
    _16_bit_binary = INT_TO_STR(data);
  }
  int offset = STR_TO_INT(_16_bit_binary);
  int mem = rs + offset;

  if(mem < 536870912 | (mem >= 603979776 && mem != 805306372)){
     exit(-11);
  }

  else if(mem % 4 != 0){
     exit(-11);
  }

  else if(mem == 805306372){
     addr_putc.DATA_SET(0, reg[rt].GET_VAL());
     nPC_int++;
     int c = reg[rt].GET_VAL();
     putchar(c);
  }

  else{
    int index = (mem - 536870912) / 4;
    addr_data.DATA_SET(index, reg[rt].GET_VAL());
    nPC_int++;
  }
}//sw

else if(op_code == "101000"){
  std::string _16_bit_binary;
  if(data > 32767){
    _16_bit_binary = SIGNED_INT_TO_STR(data);
  }

  else{
    _16_bit_binary = INT_TO_STR(data);
  }
  int offset = STR_TO_INT(_16_bit_binary);
  int mem = rs + offset;

  if(mem < 536870912 | (mem >= 603979776 && mem != 805306372)){
     exit(-11);
  }

  else if(mem == 805306372){
     addr_putc.DATA_SET(0, reg[rt].GET_VAL() & 0xff);
     nPC_int++;
     int c = reg[rt].GET_VAL();
     putchar(c);
  }

  else{
    int index = (mem - 536870912) / 4;
    int endian = (mem - 536870912) & 4;
    int tmp_mem = addr_data.DATA_GET(index);
    int tmp_reg = reg[rt].GET_VAL();
    switch (endian){
      case 0:
          tmp_mem = tmp_mem & 0x00ffffff;
          tmp_reg = (tmp_reg << 24) & 0xff000000;
          addr_data.DATA_SET(index, tmp_mem | tmp_reg);
      case 1:
          tmp_mem = tmp_mem & 0xff00ffff;
          tmp_reg = (tmp_reg << 16) & 0x00ff0000;
          addr_data.DATA_SET(index, tmp_mem | tmp_reg);


      case 2:
          tmp_mem = tmp_mem & 0xffff00ff;
          tmp_reg = (tmp_reg << 8) & 0x0000ff00;
          addr_data.DATA_SET(index, tmp_mem | tmp_reg);


      case 3:
         tmp_mem = tmp_mem & 0xffffff00;
         tmp_reg = (tmp_reg) & 0xff;
         addr_data.DATA_SET(index, tmp_mem | tmp_reg);

    }

    nPC_int++;
  }



}//sb

else if(op_code == "101001"){
  std::string _16_bit_binary;
  if(data > 32767){
    _16_bit_binary = SIGNED_INT_TO_STR(data);
  }

  else{
    _16_bit_binary = INT_TO_STR(data);
  }
  int offset = STR_TO_INT(_16_bit_binary);
  int mem = rs + offset;

  if(mem < 536870912 | (mem >= 603979776 && mem != 805306372)){
     exit(-11);
  }

  else if(mem == 805306372){
     addr_putc.DATA_SET(0, reg[rt].GET_VAL() & 0xffff);
     nPC_int++;
     int c = reg[rt].GET_VAL();
     putchar(c);
  }

  else if(mem % 2 != 0){
     exit(-11);
  }

  else{
    int index = (mem - 536870912) / 4;
    int endian = (mem - 536870912) % 4;
    int tmp_mem = addr_data.DATA_GET(index);
    int tmp_reg = reg[rt].GET_VAL();

    switch (endian){
      case 0:
          tmp_mem = tmp_mem & 0x0000ffff;
          tmp_reg = (tmp_reg << 16) & 0xffff0000;
          addr_data.DATA_SET(index, tmp_mem | tmp_reg);
      case 2:
          tmp_mem = tmp_mem & 0xffff0000;
          tmp_reg = tmp_reg & 0xffff;
          addr_data.DATA_SET(index, tmp_mem | tmp_reg);

    }

    nPC_int++;
  }


}//sh


else if(op_code == "100011"){
  std::string _16_bit_binary;
  if(data > 32767){
    _16_bit_binary = SIGNED_INT_TO_STR(data);
  }

  else{
    _16_bit_binary = INT_TO_STR(data);
  }
  int offset = STR_TO_INT(_16_bit_binary);
  int mem = rs + offset;

  if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
     exit(-11);
  }

  else if(mem % 4 != 0){
     exit(-11);
  }

  else if(mem == 805306368){//problematic

     nPC_int++;
     int c = getchar();
     if(c != EOF){
         reg[rt].SET_VAL(c);
     }

     else{
         reg[rt].SET_VAL(-1);
     }

  }

   else{
    int index = (mem - 536870912) / 4;
    int tmp = addr_data.DATA_GET(index);
    reg[rt].SET_VAL(tmp);
    nPC_int++;
  }


}//lw

 else if(op_code == "100001"){
   std::string _16_bit_binary;
   if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

   else{
     _16_bit_binary = INT_TO_STR(data);
   }
   int offset = STR_TO_INT(_16_bit_binary);
   int mem = rs + offset;

   if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
      exit(-11);
   }
   else if(mem % 2 != 0){
      exit(-11);
   }
   else if(mem == 805306368){
     nPC_int++;
     int c = getchar();
     if(c != EOF){

        int c1 = (c & 0xffff0000) >> 16;
        int c2 = c & 0xffff;
        if(c1 != 0)
          c = c1;
        else{
          c = c2;
        }

        if(c & 0xffff > 32767)
         reg[rt].SET_VAL((c & 0xffff) | 0xffff0000);
        else
         reg[rt].SET_VAL(c & 0xffff);
     }

     else{
         reg[rt].SET_VAL(-1 & 0xffff0000);
     }

   }

   else{
     int index = (mem - 536870912) / 4;
     int endian = (mem - 536870912) % 4;
     int tmp = addr_data.DATA_GET(index);

     switch (endian){
       case 0:
           tmp = tmp & 0xffff0000;

       case 2:
           tmp = tmp & 0xffff;
     }

     std::string tmp_str;

     if(tmp > 32767){
       tmp_str = SIGNED_INT_TO_STR(tmp);
     }
     else{
       tmp_str = INT_TO_STR(tmp);
     }

     tmp = STR_TO_INT(tmp_str);//sign extented

     reg[rt].SET_VAL(tmp);
     nPC_int++;
   }
 } // lh

 else if(op_code == "100000"){
   std::string _16_bit_binary;
   if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

   else{
     _16_bit_binary = INT_TO_STR(data);
   }
   int offset = STR_TO_INT(_16_bit_binary);
   int mem = rs + offset;

   if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
      exit(-11);
   }

   else if(mem == 805306368){
     nPC_int++;
     int c = getchar();
     if(c != EOF){

       int c1 = (c & 0xff000000) >> 24;
       int c2 = (c & 0x00ff0000) >> 16;
       int c3 = (c & 0x0000ff00) >> 8;
       int c4 = c & 0xff;

       if(c1 != 0)
          c = c1;
       else if(c2 != 0)
          c = c2;
       else if(c3 != 0)
          c = c3;
       else{
          c = 0;
       }

       if(c & 0xff > 127)
        reg[rt].SET_VAL((c & 0xff) | 0xffffff00);
       else
        reg[rt].SET_VAL(c & 0xff);
     }

}
   else{
     int index = (mem - 536870912) / 4;
     int endian = (mem - 536870912) % 4;
     int tmp = addr_data.DATA_GET(index);

     switch (endian){
       case 0:
           tmp = tmp & 0xff000000;

       case 1:
           tmp = tmp & 0x00ff0000;

       case 2:
           tmp = tmp & 0x0000ff00;

       case 3:
           tmp = tmp & 0xff;

     }
     std::string tmp_str;

     if(tmp > 127){
       tmp_str = SIGNED_INT_TO_STR(tmp);
     }
     else{
       tmp_str = INT_TO_STR(tmp);
     }

     tmp = STR_TO_INT(tmp_str);//sign extented

     reg[rt].SET_VAL(tmp);
     nPC_int++;
   }
 } // lb

 else if(op_code == "100001"){
   std::string _16_bit_binary;
   if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

   else{
     _16_bit_binary = INT_TO_STR(data);
   }
   int offset = STR_TO_INT(_16_bit_binary);
   int mem = rs + offset;

   if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
      exit(-11);
   }
   else if(mem % 2!= 0){
      exit(-11);
   }

   else if(mem == 805306368){
     nPC_int++;
     int c = getchar();
     if(c != EOF){

        int c1 = (c & 0xffff0000) >> 16;
        int c2 = c & 0xffff;
        if(c1 != 0)
          c = c1;
        else{
          c = c2;
        }

        if(c & 0xffff > 32767)
         reg[rt].SET_VAL((c & 0xffff) | 0xffff0000);
        else
         reg[rt].SET_VAL(c & 0xffff);
     }

     else{
         reg[rt].SET_VAL(-1 & 0xffff0000);
     }

   }

   else{
     int index = (mem - 536870912) / 4;
     int endian = (mem - 536870912) % 4;
     int tmp = addr_data.DATA_GET(index);

     switch (endian){
       case 0:
           tmp = tmp & 0xffff0000;

       case 2:
           tmp = tmp & 0xffff;
     }
     std::string tmp_str;

     tmp_str = INT_TO_STR(tmp);
     tmp = STR_TO_INT(tmp_str);//sign extented

     reg[rt].SET_VAL(tmp);
     nPC_int++;
   }
 } // lhu


 else if(op_code == "100001"){
   std::string _16_bit_binary;
   if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

   else{
     _16_bit_binary = INT_TO_STR(data);
   }
   int offset = STR_TO_INT(_16_bit_binary);
   int mem = rs + offset;

   if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
      exit(-11);
   }

   else if(mem == 805306368){
     nPC_int++;
     int c = getchar();
     if(c != EOF){

       int c1 = (c & 0xff000000) >> 24;
       int c2 = (c & 0x00ff0000) >> 16;
       int c3 = (c & 0x0000ff00) >> 8;
       int c4 = c & 0xff;

       if(c1 != 0)
          c = c1;
       else if(c2 != 0)
          c = c2;
       else if(c3 != 0)
          c = c3;
       else{
          c = 0;
       }

       if(c & 0xff > 127)
        reg[rt].SET_VAL((c & 0xff) | 0xffffff00);
       else
        reg[rt].SET_VAL(c & 0xff);
     }

     else{
         reg[rt].SET_VAL(-1 & 0xff000000);
     }
   }

   else{
     int index = (mem - 536870912) / 4;
     int endian = (mem - 536870912) % 4;
     int tmp = addr_data.DATA_GET(index);

     switch (endian){
       case 0:
           tmp = tmp & 0xff000000;

       case 1:
           tmp = tmp & 0x00ff0000;

       case 2:
           tmp = tmp & 0x0000ff00;

       case 3:
           tmp = tmp & 0xff;

     }

     std::string tmp_str;


     tmp_str = INT_TO_STR(tmp);
     tmp = STR_TO_INT(tmp_str);
     reg[rt].SET_VAL(tmp);
     nPC_int++;
   }
 } // lbu


// LWR
 else if(op_code == "100110"){
   std::string _16_bit_binary;
   if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

   else{
     _16_bit_binary = INT_TO_STR(data);
   }
   int offset = STR_TO_INT(_16_bit_binary);
   int mem = rs + offset;

   if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
      exit(-11);
   }

   else if(mem % 4 != 0){
      exit(-11);
   }

   else if(mem == 805306368){//problematic

      int c;
      nPC_int++;
      if((c = getchar()) != EOF){
        int c = getchar();
        if(c != EOF){
            int rt_tmp = (reg[rt].GET_VAL()) & 0xffff0000;
            int c_tmp = c & 0xffff;
            reg[rt].SET_VAL(rt_tmp | c_tmp);
        }

        else{
            int rt_tmp = (reg[rt].GET_VAL()) & 0xffff0000;
            int c_tmp = -1 & 0xffff;
            reg[rt].SET_VAL(rt_tmp | c_tmp);
        }

      }
   }

   else{
     int index = (mem - 536870912) / 4;
     int tmp = addr_data.DATA_GET(index);
     tmp = tmp & 0xffff;

     int rt_tmp = (reg[rt].GET_VAL()) & 0xffff0000;
     rt_tmp = rt_tmp | tmp;
     reg[rt].SET_VAL(rt_tmp);
     nPC_int++;
   }
 }

 else if(op_code == "100010"){//lwl
   std::string _16_bit_binary;
   if(data > 32767){
     _16_bit_binary = SIGNED_INT_TO_STR(data);
   }

   else{
     _16_bit_binary = INT_TO_STR(data);
   }
   int offset = STR_TO_INT(_16_bit_binary);
   int mem = rs + offset;

   if(mem < 536870912 | (mem >= 603979776 && mem != 805306368)){
      exit(-11);
   }

   else if(mem % 4 != 0){
      exit(-11);
   }

   else if(mem == 805306368){//problematic
     nPC_int++;
     int c = getchar();
     if(c != EOF){
         int rt_tmp = (reg[rt].GET_VAL()) & 0xffff;
         int c_tmp = c & 0xffff0000;
         reg[rt].SET_VAL(rt_tmp | c_tmp);
     }

     else{
         int rt_tmp = (reg[rt].GET_VAL()) & 0xffff;
         int c_tmp = -1 & 0xffff0000;
         reg[rt].SET_VAL(rt_tmp | c_tmp);
     }


   }

   else{
     int index = (mem - 536870912) / 4;
     int tmp = addr_data.DATA_GET(index);
     tmp = tmp & 0xffff0000;

     int rt_tmp = (reg[rt].GET_VAL()) & 0xffff;
     rt_tmp = rt_tmp | tmp;
     reg[rt].SET_VAL(rt_tmp);
     nPC_int++;
   }
 }
 //get left char

 else{
      exit(-12);
 }


}
