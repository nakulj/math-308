function zipdir () {
	zip -r Submission$1.zip $2 -x \*.tex $2/img\*
}

function pdf () {
	"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o print$1.pdf ${@:2}
}
pdflist=""
for i in ${@:2}
do
	zipdir $1 $i
	pdflist="$pdflist $i/assignment$i.pdf"
done
pdf $1 $pdflist
zip -r Submission$1.zip print$1.pdf
