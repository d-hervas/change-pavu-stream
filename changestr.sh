#!/bin/bash

pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo "moving stream $streamId"
    newSink=$(pactl list short sinks | grep 'SUSPENDED' | cut -c 1)
    echo "to sink $newSink"
    pactl move-sink-input "$streamId" "$newSink"
done
