#!/usr/bin/env bash


#sudo mkarchiso -v profile

#sudo mkarchiso -w work -o out -v profile


mkdir -p tmp
sudo mkarchiso -w tmp/work -o tmp/out -v profile
