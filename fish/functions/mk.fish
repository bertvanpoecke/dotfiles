function mk --description 'Make new directory and enter it.'
	mkdir -p "$argv" && cd "$argv"
end