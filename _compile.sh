#!/bin/bash -x
#javac JavaDemo.java DAPJava.java
javac SimpleDemo.java DAPJava.java
echo "Main-Class: SimpleDemo" > manifest.txt
jar cvfm SimpleDemo.jar manifest.txt *.class
