#!/bin/bash



## ------------------------- ##
## VARIABLES

appName="AppSuite"
homeDir="$HOME"
rootDir="$homeDir/Desktop/SICOLO/SICOLO-APPSUITE/dojo/apps/$appName/"

srcDir="$rootDir/src"
libDir="$rootDir/lib"
appsDir="$rootDir/apps"
binDir="$rootDir/bin"

## ------------------------- ##



clear; 

## Compilation
javac -d $binDir $srcDir/*.java $libDir/*.java $appsDir/MarketMenu/*.java $appsDir/Markets/*.java


## Execution
cd $binDir
java $appName.src.Runner






