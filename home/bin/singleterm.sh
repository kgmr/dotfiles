#!/bin/bash
term(){
    termite -e 'tmux new-session -A -s main'
}
    
if [ $(pidof termite) ];then
    pkill termite
    term
    
else
    term
fi


