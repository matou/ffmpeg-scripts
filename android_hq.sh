#!/bin/sh

# usage: $0 infile outfile

ffmpeg -threads 8 -i $1 -sameq -vcodec mpeg4 -acodec aac -strict experimental -ac 2 -r 23 -ab 192k -aspect 16:9 $2
