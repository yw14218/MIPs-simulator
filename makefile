simulator : prog
	mkdir -p bin
	cp prog bin/mips_simulator

prog: Memory.o Memory_map.o Register.o Register_array.o simulator.o RIJ.o int_to_str.o
	g++ Memory.o Memory_map.o Register.o Register_array.o simulator.o RIJ.o int_to_str.o -o prog

Register.o: Register.hpp Register.cpp
	  g++ -c Register.cpp

Memory.o: Memory.hpp Memory.cpp
	  g++ -c Memory.cpp

simulator.o: simulator.cpp
	  g++ -c simulator.cpp -o simulator.o

Memory_map.o: Memory_map.cpp Memory_map.hpp
	g++ -c Memory_map.cpp

RIJ.o: RIJ.cpp RIJ.hpp
	g++ -c RIJ.cpp

Register_array.o: Register_array.cpp Register_array.hpp
	g++ -c Register_array.cpp

int_to_str.o: int_to_str.cpp int_to_str.hpp
	g++ -c int_to_str.cpp

run:
	  ./prog

clean:
	  rm *.o prog

testbench:
		chmod 777 bin/mips_testbench.sh
