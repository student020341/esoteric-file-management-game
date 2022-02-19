#!/bin/bash

# functions
function do_prompt () {
    prompt=$1
    while read -p "$prompt: " input && [[ $input != $prompt ]]; do
        echo "$input is not $prompt, try that again"
    done
}

function end_prompt () {
    printf "\nLooks like you can do this. Hit enter to go back to the previous menu or ctrl c to exit.\n"
    read
}

# practice
function practice_source () {
    clear
    echo "Source runs a script in your current shell instead of making a new one. This allows a script to set variables in your shell environment."
    echo "The syntax for the command is source and the path to a file. For example, try..."

    # practice 1
    do_prompt "source foo"

    # practice 2
    echo "Good, now try..."
    do_prompt "source bar.sh"

    # practice 3
    echo "Great. Finally, how about this?"
    do_prompt "source a-s-d-f.qwerty"

    end_prompt
}

function practice_cd () {
    clear
    echo "cd is a command for 'change directory' and changes what directory or folder you're in."
    echo "You are currently at $(pwd)"
    echo "if there was a folder called 'foo' and you entered 'cd foo', your directory would change to"
    echo "$(pwd)/foo"
    echo "For practice, try..."

    # practice 1
    printf "\n'cd foo', which would move you into a folder called foo\n"
    do_prompt "cd foo"

    # practice 2
    printf "\nGood. You can also move down multiple folders at once, for example if foo container another folder called bar...\n"
    do_prompt "cd foo/bar"

    # practice 3
    printf "\nGreat. Finally, you can go up with 'cd ..'. To go up multiple times you would use ../../../ and so on.\n"
    do_prompt "cd .."

    end_prompt
}

function practice_ls () {
    clear
    echo "ls is a command for 'list stuff' and lists everything in your current directory."
    echo "This command has no side effects, so the exercise will have some real output."

    # practice 1
    printf "\nwhat's in this folder? use 'ls' to find out!\n"
    do_prompt "ls"
    printf "\ngood - and the result of that is:\n"
    ls

    # practice 2
    printf "\nThat can be hard to read sometimes. There is a flag you can use to make it a list format, a lowercase L. Try that:\n"
    do_prompt "ls -l"
    printf "\ngreat - and the result of that is:\n"
    ls -l

    # practice 3
    printf "\nIt's easier to read the list, but maybe you only want the file and folder names. For that, try -1 (that is # one) instead of -l\n"
    do_prompt "ls -1"
    printf "\nawesome - and the result of that is:\n"
    ls -1

    end_prompt
}

if [ "$1" == "--help" ]; then
    typeset -l input=""
    while [[ $input != "exit" ]]; do
        clear
        # prompts
        echo "Hey. This is an interactive help. These will usually just check your inputs instead of actually running commands on your system."
        echo "Enter a number corresponding with a choice and that will begin an interactive exercise."
        echo "1: practice the source command"
        echo "2: practice the cd command"
        echo "3: practice the ls command"
        echo "exit: return to the terminal, you can also press ctrl c to interrupt this process"

        # input
        read input
        if [ $input == "1" ]; then
            practice_source
        elif [ $input == "2" ]; then
            practice_cd
        elif [ $input == "3" ]; then
            practice_ls
        fi
    done
    echo "Good luck!"
else
    echo "Hey. I'm an example script, I don't really do much. Remember to source your environment when ever you come by!"
    echo "run me and other scripts with --help for interactive practice, ex:"
    echo "./hello.sh --help"

    if [ ! -d "environment" ]; then
        echo "# this file was generated - be careful if you edit it" >environment
        echo "export WORLD_ROOT=$(pwd)/world" >>environment
    fi

    echo "To get started on your adventure, run these commands"
    echo "source environment"
    echo "cd world"
fi
