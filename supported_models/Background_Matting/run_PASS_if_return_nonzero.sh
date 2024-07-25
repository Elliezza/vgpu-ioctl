#!/bin/bash
cd /workspace/torch-benchmark && python run.py -d cuda -t train Background_Matting 
ret=$?
echo "$ret"
if [ $ret -eq 0 ]
then
	echo "FAIL" > /results/test_case_yj.log
else
	echo "PASS" > /results/test_case_yj.log
fi
