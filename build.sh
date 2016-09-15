ARGS=""
NR_THREADS=2
if [[ $OSTYPE == "linux-gnu" ]]; then
   ARGS="-DMULT_THREADS=on -DNR_THREADS=$NR_THREADS"
elif [[ $OSTYPE == "darwin"* ]]; then
   ARGS="-DMULT_THREADS=off"
fi

BUILD_test=off
#!/bin/bash
mkdir -p build && cd build
cp ../script.sh .
chmod +x script.sh
./script.sh ${ARGS}
./script.sh -DBUILD_core=on -DBUILD_test=$BUILD_test
./script.sh -DBUILD_ui=on
