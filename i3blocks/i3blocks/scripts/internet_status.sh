#!/bin/bash

if ping -c 1 -W 1 8.8.8.8 &> /dev/null; then
    echo "<span foreground='#00FF00'>Online</span>"
else
    echo "<span foreground='#FF0000'>Offline</span>"
fi
