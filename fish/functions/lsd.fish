function lsd --description 'List only directories in long format'
	command ls -lF -G $argv | grep '^d'
end
