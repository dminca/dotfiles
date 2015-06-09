#!/bin/bash
## Display all CPU information
cat /proc/cpuinfo;

## Count processor(s) including core(s)
grep -c processor /proc/cpuinfo;
