#!/bin/sh

# usage: $0 infile outfile

ffmpeg -threads 8 -i $1 -qscale 0 -vcodec mpeg4 -acodec aac -strict experimental -ac 2 -ab 192k $2
