#!/usr/bin/env osascript
# Returns the number of unread mails in the INBOX of Apple Mail.
tell application "System Events"
  set process_list to (name of every process)
end tell

if process_list contains "Sparrow" then
	tell application "Sparrow"
		if unread count of inbox > 0 then
			set a to " " & unread count of inbox
		end if
	end tell
end if
