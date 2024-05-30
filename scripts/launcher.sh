#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='launcher-config'

## Run
rofi \
    -show drun \
    -theme "${dir}/${theme}.rasi"
