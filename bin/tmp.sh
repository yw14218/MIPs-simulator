#!/bin/bash
rm OVF/test/*.got.stdout

TestId="ADD-wrap";
Instruction="LW";
Author="yf4418";
Exp="246"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi


TestId="ADDU-wrap";
Instruction="LW";
Author="yf4418";
Exp="254"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="BNE-loop";
Instruction="LW";
Author="yf4418";
Exp="10"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="JR-nothing";
Instruction="LW";
Author="yf4418";
Exp="0"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="JR-return-immediate-nodelay";
Instruction="LW";
Author="yf4418";
Exp="10"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="LW-getc";
Instruction="LW";
Author="yf4418";
Exp="88"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="LW-read-data-section";
Instruction="LW";
Author="yf4418";
Exp="0"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="SW-putc";
Instruction="LW";
Author="yf4418";
Exp="0"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi

TestId="SW-read-write-data-section";
Instruction="LW";
Author="yf4418";
Exp="5"
< OVF/test/$TestId.stdin bin/mips_simulator OVF/test/$TestId.mips.bin > OVF/test/$TestId.got.stdout;
RETCODE=$?;
cmp -s OVF/test/$TestId.got.stdout OVF/test/$TestId.ref.stdout;
RESULT=$?;
if [ "$RESULT" == "0" ] && [ "$RETCODE" == "$Exp" ];
then
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Success , $Author , stdout are the same with retcode=$RETCODE" >> testlog.csv;
else
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE result = $RESULT";
  echo "$TestId , $Instruction , Fail , $Author , stdout are different or got retcode $RETCODE" >> testlog.csv;
fi
