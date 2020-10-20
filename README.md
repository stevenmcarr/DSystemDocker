# DSystemDocker

This contains the scripts to build and run the DSystem in docker. DSystem is mostly broken due to its reliance on 32 bit pointer sizes.

To build and run the docker container execute the script `./build_and_run`.

To get the AST run `./mc -t -M <file>` and you will get the AST dumped to `<file>.ast`.
