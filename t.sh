#!/bin/bash

make clean
make simulator
make testbench
./bin/mips_testbench.sh bin/mips_simulator
