#!/bin/bash
set -eou pipefail
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
set -x

OPTS=
if uname |grep -iq linux; then
  OPTS="$OPTS -fPIC"
fi
gcc $OPTS -o example_lib.o -c example_lib.c
gcc -shared -o ./libexample.so example_lib.o -lm
go build example.go


