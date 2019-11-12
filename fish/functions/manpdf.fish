function manpdf --description 'Open man page as PDF'
	man -t "$argv[1]" | open -f -a $PREVIEW_APP
end