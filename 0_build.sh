#!/bin/bash -e

if ! $(test -f jre*); then
  echo
  echo "    To install the Java runtime env, you will need to download"
  echo "    a JRE 9.0.4 tarfile to the current directory from:"
  echo
  echo "        https://www.oracle.com/technetwork/java/javase/downloads/index.html"
  echo
  exit -1
fi

# Compile java app
./_compile.sh

docker build -t javatest:latest .
