#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

echo ""
echo "Checking execution mode ..."

if [ $(id -u) -eq 0 ]; then
	: root
	echo "Root user permissions are correct..."
else
	: not root
	echo "Running the script requires administrator privileges, perform this installation as the root user."
	exit 1
fi
echo ""