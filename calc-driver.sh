#!/usr/bin/env sh

for expression in $(cat calc-input) ; do
	echo "Expression: $expression"
	echo "$expression" | ./calc
done
