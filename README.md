# apple-notes-pdfs
An AppleScript to export notes to PDFs from Apple Notes on MacOS

This script simulates UI interaction to loop through the notes in Apple's Notes app, opening them and activating the menu item to `Export to PDF`. Notes doesn't provide AppleScript with a lot of properties to work with, so this was the most robust way I found to get a copy of each note including embedded images.

Known issues: 
* using AppleScript to run UI interactions is a brittle way to automate a thing---in particular, it's susceptible to real UI interactions messing things up.
* it truncated a large attached PDF image on one of my notes---this is not due to AppleScript but because of a bug in Notes PDF export.
