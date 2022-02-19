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
function practice_redirect () {
    clear
    echo "Using > to redirect will allow you to change where command output goes."
    echo "The syntax for the command is any command, the redirect, and a destination file. For example, try..."

    # practice 1
    do_prompt "ls > ls.txt"

    # practice 2
    echo "Good, now try..."
    do_prompt "pwd > location.txt"

    # practice 3
    echo "Great. Finally, note that a file extension is not required. echo some text into a file called foo, with no extension"
    do_prompt "echo asdf > foo"

    end_prompt
}

function practice_pwd () {
    clear
        
    echo "If you need an absolute path to your current location or directory, use pwd."
    echo "The syntax for the command is just pwd. For example, try..."

    # practice 1
    do_prompt "pwd"
    pwd

    # practice 2
    echo "Good, now try..."
    do_prompt "pwd > mop"

    echo "You can verify the contents of that newly created mop file by running cat mop, try..."
    do_prompt "cat mop"
    pwd

    end_prompt
}

FILE="map"
if [ "$1" == "--help" ]; then
    typeset -l input=""
    while [[ $input != "exit" ]]; do
        clear
        # prompts
        echo "Hey. This is an interactive help. These will usually just check your inputs instead of actually running commands on your system."
        echo "Enter a number corresponding with a choice and that will begin an interactive exercise."
        echo "1: practice redirects with >"
        echo "2: practice the pwd command"
        echo "exit: return to the terminal, you can also press ctrl c to interrupt this process"

        # input
        read input
        if [ $input == "1" ]; then
            practice_redirect
        elif [ $input == "2" ]; then
            practice_pwd
        fi
    done
    echo "Good luck!"
elif [ -f $FILE ]; then
    # we want 
    EXPECTED=`pwd`
    GIVEN=`cat map`

    if [ $EXPECTED = $GIVEN ]; then
        echo "I know where I am now, thanks! I'm going to stay here a bit longer, but you should continue onward to the forest."
    else
        echo "Hmm, I tried to follow this map but I think there is a mistake. Could you try again?"
        echo "Give me a second and then speak to me again."
        rm map
    fi
else
    echo "Hello. I'm lost. Can you tell me where we are?"
    echo "You can use the 'pwd' command to get the location and then use '>' in the same command to store it. For example..."
    printf "\npwd > map\n\n"
    echo "Yes, that would be perfect. Could you please get our location and store it in a file called 'map' for me? Talk to me again when you have it."
fi
