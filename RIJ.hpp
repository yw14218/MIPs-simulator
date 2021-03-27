#ifndef RIJ_H
#define RIJ_H
#include <string>

class R{
  private:
         std::string _32_binary;

  public:
         int GET_R1();
         int GET_R2();
         int GET_D();
         int GET_DATA();
         int SHIFT_AMOUNT();
         int GET_ADDRESS();
         void SET_BIN(std::string _32_binary_in);
         std::string GET_FN_CODE();
};
#endif
