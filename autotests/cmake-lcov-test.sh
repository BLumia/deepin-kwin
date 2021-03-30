#!/bin/bash
workspace=$1

cd $workspace

mkdir build
cd ./build

export DISPLAY=:0.0

cmake ../
make
#dpkg-buildpackage -b -d -uc -us

#make test

#project_path=$(cd `dirname $0`; pwd)
#获取工程名
#project_name="${project_path##*/}"
#echo $project_name

#获取打包生成文件夹路径
#pathname=$(find . -name obj*)

#echo $pathname

#cd $pathname

make test

#cd ./tests

mkdir -p coverage

lcov -d ../ -c -o ./coverage/coverage.info

lcov --remove ./coverage/coverage.info '*/tests/*' '*/autotests/*' '*/*_autogen/*' -o ./coverage/coverage.info

mkdir -p ../obj-x86_64-linux-gnu/report
genhtml -o ../obj-x86_64-linux-gnu/report ./coverage/coverage.info

exit 0
