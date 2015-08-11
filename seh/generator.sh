# See http://www.kegel.com/wine/cl-howto-win7sdk.html
COMPILER=cl.sh
USE_CL=1
TARGET=Makefile

echo "COMPILER="$COMPILER > $TARGET
echo "all:">>$TARGET
echo "dummy:">>$TARGET
echo ".PHONY: all dummy">>$TARGET

echo >>$TARGET
echo "C_SRCS=\\">>$TARGET
echo "	seh.h\\">>$TARGET
for file in `ls *.c`
do
    echo "	"$file "\\">>$TARGET
done

echo >>$TARGET

for file in `ls *.c`
do
    name=`basename $file .c`
    echo $name".exe :" $file >>$TARGET
    if [ USE_CL ]; then
        echo "	" $COMPILER  $file>>$TARGET
    else
        echo "	" $COMPILER  $file "-o" $name".exe">>$TARGET
    fi
done

echo >>$TARGET
echo "all:\\">>$TARGET
for file in `ls *.c`
do
    name=`basename $file .c`
    echo "	"$name".exe\\">>$TARGET
done
