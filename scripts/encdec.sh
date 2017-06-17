#!/bin/bash

MODE=$1

FOLDER=./secrets

if [ "$MODE" != 'encrypt' ] && [ "$MODE" != 'decrypt' ]; then
	echo "Specify mode (encrypt/decrypt):"
	echo "	encdec.sh {MODE}"
	exit 1
fi

read -s -p "Password: " SECENCPASS
echo

if [ "$MODE" == 'encrypt' ]; then
	rm -f ${FOLDER}/*.enc;

	for FILE in ${FOLDER}/*; do
		openssl aes-256-cbc -a -salt -k "$SECENCPASS" -in $FILE -out "${FILE}.enc"
		if [ $? -eq 0 ]; then
			echo "${FILE}.enc is written"
		fi
	done
fi

if [ "$MODE" == 'decrypt' ]; then
	for FILE in ${FOLDER}/*.enc; do
		openssl aes-256-cbc -d -a -salt -k "$SECENCPASS" -in $FILE -out "${FILE%.enc}";
		if [ $? -eq 0 ]; then
			echo "${FILE%.enc} is written"
		fi
	done
fi


unset SECENPASS
