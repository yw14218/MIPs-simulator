#!/bin/bash
rm test/output/*.stdout
rm test/output/*.stdin
rm test/output/*.stderr


TestId="XORI";
Instruction="XORI";
Author="yf4418";
Exp="15"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


TestId="SH";
Instruction="SH";
Author="yf4418";
Exp="255"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MFHI_01_sra16";
Instruction="MFHI";
Author="yf4418";
Exp="59"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MFLO-01-sra1";
Instruction="MFLO";
Author="yf4418";
Exp="48"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULT_02_NP";
Instruction="MULT";
Author="yf4418";
Exp="255"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULT_03_NP_lo";
Instruction="MULT";
Author="yf4418";
Exp="160"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULT_04_PP_hi";
Instruction="MULT";
Author="yf4418";
Exp="22"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULT-01-NN";
Instruction="MULT";
Author="yf4418";
Exp="5"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULTU_01_F1_hi";
Instruction="MULTU";
Author="yf4418";
Exp="59"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULTU_01_FF_hi";
Instruction="MULTU";
Author="yf4418";
Exp="202"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="MULTU_01_FF";
Instruction="MULTU";
Author="yf4418";
Exp="5"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="OR_02_msb_10";
Instruction="OR";
Author="yf4418";
Exp="101"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="OR_01_msb";
Instruction="OR";
Author="yf4418";
Exp="101"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ORI_01_lsb_00";
Instruction="ORI";
Author="yf4418";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ORI_01_lsb_21";
Instruction="ORI";
Author="yf4418";
Exp="33"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="SB_01_i2";
Instruction="SB";
Author="yf4418";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="SW-lb01";
Instruction="SW";
Author="yf4418";
Exp="245"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BLTZAL_02";
Instruction="BLTZAL";
Author="yf4418";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BLTZAL_01";
Instruction="BLTZAL";
Author="yf4418";
Exp="5"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BLTZ_02";
Instruction="BLTZ";
Author="yw14218";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BLTZ_01";
Instruction="BLTZ";
Author="yw14218";
Exp="1"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


TestId="BLEZ_02";
Instruction="BLEZ";
Author="yw14218";
Exp="1"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BLEZ_01";
Instruction="BLEZ";
Author="yw14218";
Exp="6"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BGTZ_02";
Instruction="BGTZ";
Author="yw14218";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BGTZ_01";
Instruction="BGTZ";
Author="yw14218";
Exp="7"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="J_01";
Instruction="J";
Author="yw14218";
Exp="9"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="DIV_01";
Instruction="DIV";
Author="yw14218";
Exp="2"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="DIVU_01";
Instruction="DIVU";
Author="yw14218";
Exp="4"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


TestId="BNE_01";
Instruction="BNE";
Author="yw14218";
Exp="128"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="SLTU_01";
Instruction="SLTU";
Author="yw14218";
Exp="246"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BGEZAL_02";
Instruction="BGEZAL";
Author="yf4418";
Exp="255"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BGEZAL_01";
Instruction="BGEZAL";
Author="yf4418";
Exp="255"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BGEZ_02";
Instruction="BGEZ";
Author="yf4418";
Exp="255"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BGEZ_01";
Instruction="BGEZ";
Author="yf4418";
Exp="7"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="BEQ_01";
Instruction="BEQ";
Author="yf4418";
Exp="7"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


TestId="ANDI_02";
Instruction="ANDI";
Author="yf4418";
Exp="254"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout ;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ANDI_01";
Instruction="ANDI";
Author="yf4418";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="AND_03";
Instruction="AND";
Author="yf4418";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="AND_02";
Instruction="AND";
Author="yf4418";
Exp="0"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="AND_01";
Instruction="AND";
Author="yf4418";
Exp="255"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADDU_01";
Instruction="ADDU";
Author="yf4418";
Exp="127"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADDIU_01";
Instruction="ADDIU";
Author="yf4418";
Exp="127"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout * 2> test/output/$TestId.got.stderr;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADDI_02_ov";
Instruction="ADDI";
Author="yf4418";
Exp="246"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADDI_01";
Instruction="ADDI";
Author="yf4418";
Exp="128"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADD_03_ov";
Instruction="ADD";
Author="yf4418";
Exp="246"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADD_02_ov";
Instruction="ADD";
Author="yf4418";
Exp="128"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="ADD_01";
Instruction="ADD";
Author="yf4418";
Exp="251"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


TestId="BLEZ_01_countdown-5";
Instruction="BLEZ";
Author="yf4418";
Exp="6"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


TestId="LUI-sra01";
Instruction="LUI";
Author="yf4418";
Exp="110"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="LUI-sra01";
Instruction="LUI";
Author="yf4418";
Exp="110"
bin/mips_simulator testcases/$TestId.bin;
RETCODE=$?;
if [[ "$RETCODE" == "$Exp" ]];
then
  echo "$TestId , $Instruction , Success , $Author , retcode=$RETCODE ";
  echo "$TestId , $Instruction , Success , $Author , retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , Expected retcode $Exp but got retcode $RETCODE ";
  echo "$TestId , $Instruction , Fail , $Author , Expected retcode $Exp but got retcode $RETCODE" >> testlog.csv;
fi


TestId="LW_01_stdin";
Instruction="LW";
Author="yf4418";
Exp="88"
Stdin="X"
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="LW_02_sign0";
Instruction="LW";
Author="yf4418";
Exp="0"
Stdin="￥"
Stdout="255"
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="LWL_01_sra24_87";
Instruction="LWL";
Author="yf4418";
Exp="32"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout * 2> test/output/$TestId.got.stderr;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="LWL_02_lsb_21";
Instruction="LWL";
Author="yf4418";
Exp="16"
Stdin=""
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi

TestId="LB_01_stdin";
Instruction="LB";
Author="yf4418";
Exp="88"
Stdin="X"
Stdout=""
mips-linux-gnu-gcc -static -nostdlib -O3 testcases/$TestId.s -o testcases/$TestId.mips.elf
mips-linux-gnu-objcopy -O binary -j .text testcases/$TestId.mips.elf testcases/$TestId.mips.bin
echo "$Stdin" >> test/output/$TestId.stdin
touch test/output/$TestId.ref.stdout
< test/output/$TestId.stdin bin/mips_simulator testcases/$TestId.mips.bin > test/output/$TestId.got.stdout;
RETCODE=$?;
cmp -s test/output/$TestId.got.stdout test/output/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE expected: $Exp  result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout different or got incorrect retcode $RETCODE" Expected: $Exp >> testlog.csv;
fi


rm test/output/*.elf
rm test/output/*.bin
