#!/bin/bash
 
if [ -f ~/.font ] ; then
	xrdb .Xresources
	rm ~/.font
else
	xrdb .Xresourcesf
	touch ~/.font
fi
