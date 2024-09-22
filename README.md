# apple-notes-pdfs
An AppleScript to export multiple notes to PDFs from Apple Notes on MacOS

**Note:** My favourite way to export Apple Notes, now that I know about it, is [Apple Cloud Notes Parser](https://github.com/threeplanetssoftware/apple_cloud_notes_parser) by https://github.com/threeplanetssoftware. That's a more polished and more complete solution, and outputs notes in a number of formats that you could then do more with.

This script simulates UI interaction to loop through the notes in Apple's Notes app, opening them and activating the menu item to `Export to PDF`. Notes doesn't provide AppleScript with a lot of properties to work with, so this was the most robust AppleScript approach I found to get a copy of each note including embedded images.

Known issues: 
* using AppleScript to run UI interactions is a brittle way to automate a thing---in particular, it's susceptible to real UI interactions messing things up.
* it truncated a large attached PDF image on one of my exported notes---this is not due to AppleScript but because of a bug in Notes PDF export.
