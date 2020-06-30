
#!/bin/bash

debug=0

if [ "$DEBUG" = 1 ];then
    debug=1
fi

function isInstanceRunning() {
    local printLog=0
    local exclude="$2"
    local running=""
    if [ -z "$exclude" ];then
        running=$(ps aux \
            | grep -v grep \
            | grep -iE "$1")
    else
        running=$(ps aux \
            | grep -v grep \
            | grep -v "$exclude" \
            |  grep -iE "$1")
    fi

    if [ ${printLog} = 1 ];then
        echo ${running}
    fi
    exclude=""
    if [ "x$running" = "x" ]
    then
        return 0
    else
        return 1
    fi
}

export -f isInstanceRunning

function stopInstance() {
    local printLog=0
    local exclude="$2"
    local pIds=""
    if [ -z "$exclude" ];then
        pIds=$(ps aux \
            | grep -v grep \
            | grep -iE "$1" \
            | awk '{print $2}')
    else
        pIds=$(ps aux \
            | grep -v grep \
            | grep -v "$exclude" \
            | grep -iE "$1" \
            | awk '{print $2}')
    fi

    if [ -z "$pIds" ];then
        if [ ${printLog} = 1 ];then
            echo "stop failed no $1 running"
        fi
    else
        if [ ${printLog} = 1 ];then
            echo "killing $pIds ..."
        fi
        echo -n "$pIds" | xargs kill -9
        if [ ${printLog} = 1 ];then
            isInstanceRunning $1 "$exclude"
            if [ "$?" == 0 ];then
                echo "$1 has stopped success"
            else
                echo "$1 stop failed"
            fi
        fi
    fi
}

export -f stopInstance

keyword=$1

if [[ -z "$keyword" ]];then
    keyword="s2"
fi

stopInstance ${keyword}
