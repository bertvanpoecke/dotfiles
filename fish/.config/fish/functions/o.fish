function o --description 'Open current or given directory/file'
    if test (count $argv) -eq 0
        open .
    else
        open $argv
    end
end
