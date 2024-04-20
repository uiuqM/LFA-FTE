#!/bin/bash

STATE=$1
WORD=$2

q0 () {
    local LETTER=$1
    
    case $LETTER in

    a)
        echo 'q1'
    ;;
    b)
        echo 'q5'
    ;;
    esac
}

q1 () {
    local LETTER=$1

    case $LETTER in

    a)
        echo 'q5'
    ;;
    b)
        echo 'q2'
    ;;
    esac
}

q2 () {
    local LETTER=$1

    case $LETTER in

    a)
        echo 'q3'
    ;;
    b)
        echo 'q4'
    ;;
    esac
}

q3 () {
    local LETTER=$1

    case $LETTER in

    a)
        echo 'q6'
    ;;
    b)
        echo 'q4'
    ;;
    esac
}

q4 () {
    local LETTER=$1

    case $LETTER in

    a)
        echo 'q3'
    ;;
    b)
        echo 'q4'
    ;;
    esac
}

q5 () {
    local LETTER=$1

    case $LETTER in

    a)
        echo 'q5'
    ;;
    b)
        echo 'q5'
    ;;
    esac
}

q6 () {
    local LETTER=$1

    case $LETTER in

    a)
        echo 'q6'
    ;;
    b)
        echo 'q4'
    ;;
    esac
}

transition-function () {
    local ST=$1
    local LETTER=$2

    case $ST in

        q0)
            echo $(q0 $LETTER)
        ;;

        q1)
            echo $(q1 $LETTER)
        ;;

        q2)
            echo $(q2 $LETTER)
        ;;
        q3)
            echo $(q3 $LETTER)
        ;;

        q4)
            echo $(q4 $LETTER)
        ;;

        q5)
            echo $(q5 $LETTER)
        ;;

        q6)
            echo $(q6 $LETTER)
        ;;
    esac
}


extended-transition-function () {

    local STATE=$1
    local WORD=$2

    local LW=${#WORD} #length of the word

    if [ $LW -eq 0 ]; 
    then
        echo $STATE
        return 0
    fi

    if [ $LW -eq 1 ];
    then
        transition-function $STATE $WORD
        return 0
    fi

    extended-transition-function $($(extended-transition-function $STATE ${WORD%?}) ${WORD: -1})
}

extended-transition-function 'q0' 'abaaba'