COMPILER=i686-w64-mingw32-gcc
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
    echo "	" $COMPILER  $file "-o" $name".exe">>$TARGET
done

echo >>$TARGET
echo "all:\\">>$TARGET
for file in `ls *.c`
do
    name=`basename $file .c`
    echo "	"$name".exe\\">>$TARGET
done
