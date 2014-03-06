#git clean -f -X


function zipdir () {
	zip -r Submission$1.zip $2 -x \*.tex $2/img\*
	#"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o temp.pdf $2/assignment$2.
}

for i in ${@:2}
do
	zipdir $1 $i
done
echo "to Submission$1.zip"

