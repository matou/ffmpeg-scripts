#!/bin/sh

# usage: $0 infile outfile

avconv -threads 8 -i $1 -t 60 -b 65536k -vcodec mpeg4 -profile 15 -acodec ac3 -ac 2 -ab 192k $2.mp4
