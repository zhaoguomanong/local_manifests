#!/bin/sh
repo sync -cdj8 --no-clone-bundle
while [ $? -ne 0 ]
do
repo sync -cdj8 --no-clone-bundle
done
