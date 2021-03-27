#ifndef MEMORY_H
#define MEMORY_H

#include <iostream>
#include <cstdlib>
#include <vector>
#include <string>


class MEMORY{
  private:
      int offset;
      int length;
      std::vector<uint32_t> data;

  public:
    void OFFSET_SET(int val);
    void LENGTH_SET(int val);
    //for intilisation

    int OFFSET_GET();
    int LENGTH_GET();
    //getters

    // void DATA_SET(int index, uint32_t word);
    void DATA_PUSH(uint32_t &word);
    void DATA_SET(int index, int word);
    uint32_t DATA_GET(int index);
    int DATA_SIZE();

    void INITIALISE_DATA();
};

#endif
