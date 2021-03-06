#!/usr/bin/env osascript

tell application "System Events"
  set frontApp to the name of the first application process whose frontmost is true
end tell
if frontApp is "iTerm"
  tell application "iTerm" to set frontWindow to the index of the front window
  set loops to 0
  tell application "System Events"
    repeat until (loops > 20) or (name of first application process whose frontmost is true) is "Google Chrome"
      set loops to (loops + 1)
      delay 0.5
    end repeat
  end tell
  if loops < 21
    delay 0.5
    tell application "iTerm"
      activate
      set index of window frontWindow to 1
    end tell
    tell application "System Events" to tell process "iTerm" to perform action "AXRaise" of the first window
  end if
end if

