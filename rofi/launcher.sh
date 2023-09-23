#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='config'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
