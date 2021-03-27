#include "Memory.hpp"
#include "int_to_str.hpp"
#include <string>
using namespace std;

void MEMORY::OFFSET_SET(int val){
  offset = val;
}

void MEMORY::LENGTH_SET(int val){
  length = val;
}

void MEMORY::DATA_PUSH(uint32_t &word){
  data.push_back(word);
}

int MEMORY::OFFSET_GET(){
  return offset;
}

int MEMORY::LENGTH_GET(){
  return length;
}

uint32_t MEMORY::DATA_GET(int index){
  while(index + 1 >= data.size()){
    data.push_back(0);

  }
  return data[index];
}

int MEMORY::DATA_SIZE(){
  return data.size();
}

void MEMORY::INITIALISE_DATA(){
  for(int i = 0; i < 134217728; i++)
  data.push_back(0);
}

void MEMORY::DATA_SET(int index, int word){
  if(index == data.size()){
    data.push_back(word);
  }else{
    while(index + 1 >= data.size()){
      data.push_back(0);
    }
    data[index] = word;
  }
}
