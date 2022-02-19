#!/bin/bash

if [ -f "map" ]; then
    # test correction
    echo "Great, thanks. mv is actually the move command, but it can be reused to rename things into the same directory."
    echo "Another useful command is rm - but be careful with it, it deletes a file. If you want to replay a scenario, delete the solution file."
    echo "In this case, that would be..."
    echo "rm map"
elif [ -f "mop" ]; then
    # help
    echo "I see my map is still a mop, would you mind changing that? I think the command would be something like..."
    echo "mv mop map"
else
    # prompt
    echo "Hey. I also just got here after making a map, but something went wrong with mine. I think I called it mop. Can you rename it to map for me?"
    printf "\nSomething like this should do it:\n\nmv mop map\n\n"
    echo "Talk to me when that's done, thanks."
    # create mop file
    echo "Did you expect to find something here? :)" > mop
fi
