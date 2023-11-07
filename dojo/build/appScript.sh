#!/bin/bash



clear; 
javac -cp .:../jars/* \
      -d ../bin/ \
      ../lib/*.java \
      ../src/*.java \
      ../apps/AppSuite/*.java \
      
cd ../bin/

java -cp .:../jars/* Runner

sleep 2
cd -





