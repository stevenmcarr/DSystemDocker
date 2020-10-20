#!/bin/bash
while getopts "tM:" opt
do
case $opt in 
  M) SRC=`basename $OPTARG` 
     SRCARGS="-M $SRC "
     AST=`basename $OPTARG`.ast;;
  t) ARGS+="-$opt ";;
  ?) echo "Usage: mc [-t] -M <file>"
     exit 1;;
esac
done
shift $((OPTIND-1))
EXEARGS=$@
for file in $SRCS
do
	docker cp $file dsystem:/home/dsystem/
done
docker cp $SRC dsystem:/home/dsystem/
docker exec --user dsystem dsystem /home/dsystem/DSystem/src/execs/Memoria/Memoria-Linux-i686-g $ARGS $SRCARGS > $SRC.ast
