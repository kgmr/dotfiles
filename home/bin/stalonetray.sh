#!/bin/bash
if [ "$(pidof stalonetray)" ]
then
	pkill stalonetray
else
	stalonetray -bg \#fff
fi
