read x
if [ $x == 'y' ] || [ $x == 'Y' ]
then
    echo "YES"
elif [ $x == 'n' -o $x == 'N' ]
then
    echo "NO"
fi
