function c --description "Open in IDE ($IDE_CMD)"
    if test (count $argv) -gt 0
        $IDE_CMD $argv
    else
        $IDE_CMD .
    end
end
