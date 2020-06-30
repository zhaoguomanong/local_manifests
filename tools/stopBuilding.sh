
#!/bin/bash

debug=0

if [ "$DEBUG" = 1 ];then
    debug=1
fi

function actionSupported() {
    local printNotSupportLog=0
    local actionName="$1"
    local debug="$2"
    if [ "$debug" != "0" ] \
    && [ "$debug" != "1" ];then
        debug=1
    fi
    if [ "x$mCurrentRunningType" != "x$RUNNING_TYPE_SERVER" ] \
    && [ ${debug} != 1 ];then
        if [ ${printNotSupportLog} = 1 ];then
            echo "[$actionName not supported] ---> non server && non debuggable"
        fi
        return 0
    fi
    return 1
}

export -f actionSupported

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

#######color code########
export RED="31m"      # Error message
export GREEN="32m"    # Success message
export YELLOW="33m"   # Warning message
export BLUE="36m"     # Info message


#########################

###############################
function colorEcho(){
    local COLOR=$1
    echo -ne "\033[${COLOR}${@:2}\033[0m"

}

export -f colorEcho

function LOGI() {
    if [ ${debug} != 1 ];then
        return 0
    fi
    local logContent=$1
    local logTime=$(date +%Y%m%d\ %H:%M:%S)
    local outputScreen=$2
    if [ -z "$outputScreen" ];then
        echo "[$logTime] $logContent" >> ${INFO_LOG}
    else
        echo "[$logTime] $logContent" 2>&1 | tee -a ${INFO_LOG}
    fi



}

export -f LOGI

function LOGE() {
    local logContent=$1
    local logTime=$(date +%Y%m%d\ %H:%M:%S)
    local outputScreen=$2
    local content="[$logTime] $logContent"
    echo "$content" >> ${ERROR_LOG}
    if [ ! -z "$outputScreen" ];then
        colorEcho ${RED} "$content\n"
    fi
}

export -f LOGE

function LOGD() {
    if [ ${debug} != 1 ];then
        return 0
    fi
    local logContent=$1
    local logTime=$(date +%Y%m%d\ %H:%M:%S)
    local outputScreen=$2
    if [ -z "$outputScreen" ];then
        echo "[$logTime] $logContent" >> ${DEBUG_LOG}
    else
        echo "[$logTime] $logContent" 2>&1 | tee -a ${DEBUG_LOG}
    fi
}

export -f LOGD

function restartService() {
    local serviceName=$1
    if [ -z "$serviceName" ];then
        return 0
    fi
    which systemctl > /dev/null 2>&1
    if [ $? != 0 ];then
        nohup service ${serviceName} restart > /dev/null 2>&1 &
    else
        systemctl daemon-reload
        systemctl restart ${serviceName}.service
    fi
    return 0
}

export -f restartService

keyword=$1

if [[ -z "$keyword" ]];then
    keyword="s2"
fi

stopInstance ${keyword}
