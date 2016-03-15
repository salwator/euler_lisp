#!/bin/bash
sbcl --script build.lisp $1 $2
time ./$2
