#!/usr/bin/osascript

on run argv
    tell application "TeXShop"
        # activate
        set theFile to item 1 of argv
        set theDoc to open ((POSIX file theFile) as alias)
        try
            tell theDoc to latexinteractive
            repeat
                delay 2
                if taskdone
                exit repeat
                end if
            end repeat
        on error
            set theDoc to front document
            tell theDoc to latexinteractive
        end try
    end tell

    delay 2
    tell application "Sublime Text 2" to activate
end run
