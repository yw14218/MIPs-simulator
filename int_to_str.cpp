#include "int_to_str.hpp"
#include <string>
#include <cmath>

using namespace std;

std::string SIGNED_INT_TO_STR(int a){
  std::string bin;
  bool positive=true;
  if(a < 0){
    positive = false;
    a = -a;
  }
//short division
  while(a>=1){
    if(a%2 == 0){
      bin = "0" + bin;
    }else{
      bin = "1" + bin;
    }
    a = a/2;
  }


  //sign extension
  while(bin.length()<32){
      bin = "1" + bin;
  }

  //negate+1
  if(!positive){
    for(int i = 0; i < bin.size(); i++){
      bin[i]= (bin[i]=='1') ? '0' : '1';
    }
  }

  if(!positive){
    for(int i = 31; i >=0; i--){
      bin[i]= (bin[i]=='1') ? '0' : '1';
      i = (bin[i]=='0') ? i : -1;
    }
  }

  return bin;

}

string INT_TO_STR(int a){
  std::string bin;
  bool positive=true;
  if(a < 0){
    positive = false;
    a = -a;
  }
//short division
  while(a>=1){
    if(a%2 == 0){
      bin = "0" + bin;
    }else{
      bin = "1" + bin;
    }
    a = a/2;
  }


  //sign extension
  while(bin.length()<32){
      bin = "0" + bin;
  }

  //negate+1
  if(!positive){
    for(int i = 0; i < bin.size(); i++){
      bin[i]= (bin[i]=='1') ? '0' : '1';
    }
  }

  if(!positive){
    for(int i = 31; i >=0; i--){
      bin[i]= (bin[i]=='1') ? '0' : '1';
      i = (bin[i]=='0') ? i : -1;
    }
  }

  return bin;
}

int STR_TO_INT(string s1){
  //must be 32 bits
  //0 extension
  while(s1.length()<32){
      s1 = "0" + s1;
  }

  int tmp = 0;
  if(s1[0] == '0'){
     for(int i = 1; i < 32; i++){
         if(s1[i] == '1'){
            tmp += 1073741824/(pow(2,i-1));
         }
         else{
            tmp = tmp;
         }
     }
  }

  else{
     tmp = -2147483648;
     for(int i = 1; i < 32;i++){
         if(s1[i] == '1'){
            tmp += 1073741824/(pow(2,i-1));
         }
         else{
            tmp = tmp;
         }
     }
  }

return tmp;
}
