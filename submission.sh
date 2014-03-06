#git clean -f -X


function zipdir () {
	zip -r Submission$1.zip $2 -x \*.tex $2/img\*
}

function pdf () {
	python "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o print$1.pdf $2/assignment$2.pdf
}

for i in ${@:2}
do
	zipdir $1 $i
	pdf $1 $i
done
