#!/bin/bash

killall -q polybar
polybar -r 2>&1 | tee -a /tmp/polybar.log & disown
