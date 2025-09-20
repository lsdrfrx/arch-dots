#!/bin/bash

fifo="/tmp/workspace_fifo"
[ -p "$fifo" ] || mkfifo "$fifo"
