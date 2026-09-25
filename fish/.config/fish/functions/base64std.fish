function base64std --description 'base64 from stdin'
    echo $argv[-1] | command base64 $argv[1..-2]
end
