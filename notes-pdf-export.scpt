-- notes-pdf-export.scpt
-- Exports notes from Apple Notes as pdf files
--
-- Uses UI interaction simulation because Notes isn't very scriptable
-- Filenames include a representation of the note's creation date
--
-- Back up your data first. This whole thing is brittle.
-- Seriously. The whole UI simulation is bananas in principle.
--
-- Output: A collection of PDF files with the note's creation date in the filename
--
-- Known issues:

-- UI emulation is slow and brittle; don't touch the computer

-- PDF export from Notes can be flakey: 
--     e.g. a scanned receipt with a tall aspect ratio can get truncated. 
--     This is an issue that seems to have existed for a long time and has 
--     nothing to do with AppleScript

--  I haven't figured out how to choose the folder through the UI so
--    the files probably end up in Documents


-- a function to generate a yyyy-0mm-0dd type date string from
-- the note's creation date
on getDate(aDate)
	set dateDay to day of aDate as integer
	if dateDay is less than 10 then
		set dateDay to "0" & dateDay
	else
		set dateDay to dateDay as string
	end if
	set dateMonth to month of aDate as integer
	if dateMonth is less than 10 then
		set dateMonth to "0" & dateMonth
	else
		set dateMonth to dateMonth as string
	end if
	set dateYear to year of aDate
	return dateYear & "-" & dateMonth & "-" & dateDay & "-" & time of aDate
end getDate

tell application "Notes"
	repeat with theNote in notes
		set noteTitle to name of theNote
		set createTime to creation date of theNote
		set titleDate to getDate(createTime) of me
		set pdfName to noteTitle & "-" & titleDate
		show theNote
		-- Export the selected note as PDF
		tell application "System Events"
			tell process "Notes"
				set frontmost to true
				delay 1
				click menu item "Export as PDF…" of menu "File" of menu bar 1
				delay 0.5
				-- Input the filename in the dialog
				keystroke pdfName
				keystroke return
			end tell
		end tell
	end repeat
end tell
