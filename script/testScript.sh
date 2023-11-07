#!/usr/bin/bash




glob_var1=""
glob_var2=""
glob_var3=""



sampleFunction()
{
	local localVar1=""
	local localVar2=""
	local localVar3=""

	localVar1=1
	localVar2=2
	localVar3=3

	glob_var1=$localVar1
    glob_var2=$localVar2
    glob_var3=$localVar3
}

sampleTestFunction()
{
    echo
	echo "GLOB_VAR1: $glob_var1"
    echo "GLOB_VAR1: $glob_var2"
    echo "GLOB_VAR1: $glob_var3"
    echo
}


clear
sampleFunction
sampleTestFunction