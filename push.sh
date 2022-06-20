#!/bin/sh

git add . ; git commit -am "$(date)" ; git push origin master

cd /home/johs/t9.no/blog ; git add . ; git commit -am "$(date)" ; git push origin master
