#git clean -f -X


function zipdir () {
	zip -r Submission$1.zip $2 x@exclude.lst
}


echo "Zipping assignments "
for i in ${@:2}
do
	zipdir $1 $i
done
echo "to Submission$1.zip"

