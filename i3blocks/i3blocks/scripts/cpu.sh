#!/bin/bash

CPU=$(mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ { print 100 - $12 }')

printf "%.1f%%\n" "$CPU"
