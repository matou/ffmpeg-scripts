#!/bin/sh

# This script captures the screen of a X window system and the sound from a
# given sound device.
#
# Currently the upper left corner with a size of 1024x768 (-s xga) is captured.
# I recommend setting the size of the monitor to xga. 

# audio settings
AUDIO=alsa
SND_DEVICE=hw:1,0
AUDIO_BITRATE=256k

# video settings:
FRAME_RATE=30
SIZE=xga

FILENAME=`date "+%F_%T"`

#ffmpeg -f $AUDIO -i $SND_DEVICE -f x11grab -r $FRAME_RATE -s $SIZE -i :0.0 -isync -ab $AUDIO_BITRATE -acodec libvorbis -vcodec libx264 -vpre lossless_ultrafast $FILENAME

# -isync seems to work best before the input of the audio (don't know why)
# can't use the raw video and audio input as it needs too much space
# therefore using lossless codecs ffv1 and flac
ffmpeg -f $AUDIO -isync -i $SND_DEVICE -f x11grab -r $FRAME_RATE -s $SIZE -i :0.0 -acodec flac -vcodec ffv1 -sameq $FILENAME.mkv
