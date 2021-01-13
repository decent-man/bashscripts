#! /bin/bash

#DDLG v0.1
#A script to dynamically generate dmenu based dialog's on demand
#Sections marked with 'TRBL' are used to troubleshoot any errors. Enable the respective 'echo' to see if the value flow is correct.

#ALGORITHM
#Check first if number of arguments is 1+even : 1st is the prompt message itself and  rest are the pair of values and its corresponding command to be executed in the format: "PromptText" label1 command1 label2 command2 label3 command3..........label* command*

#CODE

if [ "$(($#%2))" == "1" ]
   then


  #---!Custom-Colors:If you uncomment this make sure to comment the Default-Colors
  #	CHOICE=$( for((i=2;i<=$#;i=i+2));do echo "${!i}"; done | dmenu -sb '#A52A2A' -sf black -nf '#A52A2A' -nb black -i -p "$1" )		

  #---!Default-Colors:If you uncomment this make sure to comment the Default-Colors
	CHOICE=$( for((i=2;i<=$#;i=i+2));do echo "${!i}"; done | dmenu -i -p "$1" )		



	#TRBL: To test dmenu's selected choice vs what it outputs
	#echo $CHOICE

  #Loop filling the array with label elements, to compare to CHOICE
	MATCH=0
	for((i=2;i<=$#;i=i+2));
	do
	  if [ "$CHOICE" == "${!i}" ];
	  then 
		  let MATCH=i+1  &&  break
	  fi
	done

	#TRBL: To check what code executes
	#echo ${!MATCH}

	#The execution
	${!MATCH}

fi




