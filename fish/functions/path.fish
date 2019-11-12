function path --description 'Print each PATH entry on a separate line'
	for val in $PATH
		echo $val
	end
end
