#!/bin/sh
echo "---- Lista de Containers ----"
if [ $1 ];then
    if [ "$1" == "update" ];then
    docker stats --format {{.Name}} --no-stream > ~/.container-list
    else
        cat ~/.container-list -n | grep "$1"
    fi
else
    cat ~/.container-list -n
fi
echo "-----------------------------"
read option
container=$(cat ~/.container-list | sed -n ${option}p)
docker exec -it $container sh
