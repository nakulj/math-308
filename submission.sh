#git clean -f -X


function zipdir () {
	zip -r Submission$1.zip $2 -x \*.tex $2/img\*
}

function pdf () {
	"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o temp.pdf --append $1/assignment$1.pdf
}

for i in ${@:2}
do
	zipdir $1 $i
	pdf $i
done
echo "to Submission$1.zip"


