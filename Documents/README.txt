gistX.x README

THE WORKING GIST MASTER FILE
-This is the ongoing "working" gist file - the master, living, most-recent version, etc.
-All changes to gist should be made here to this file.
-As you work, record changes on the change log as version X.x until it is time to save out a release (see next section)
-The file name should not be changed in this location, with one temporary exception:
	-If you must copy the file off the shared drive to make changes, append this file with "CHECKED_OUT_[your initials]"
	-When you return your updated file it should resume the gistX.x.vsd file name
	-Delete old file (or move to Past Versions folder if one exists - are we doing this?)
-At any point you may save out an internal or external release to be used internally or for a client.
***An internal or external of release should be ASSIGNED A VERSION***

BEFORE SAVING OUT AN INTERNAL OR EXTERNAL VERSION
-Go to change log
-Update all change log entries marked as version "X.x" (this should be all changes since last release)
-Change "X.x" to the version number of the internal or external release you are about to save out
-This will signify which changes are included in your internal or external release

SAVING OUT AN INTERNAL OR EXTERNAL RELEASE
-Confirm that all "X.x" entries in the change log have been changed/attributed to the release you are creating
-Save a copy of the file with new version number to a folder in either __internallyReleasedGists or __externallyReleasedGists
-Change all references to "X.x"
	-NOTE: If there are no references to "X.x" in the change log, then you should be able to change all references to 
	"X.x" globally with one action
	-Right click on any page and select Find/Replace Property Value
	-Search in "All pages"
	-Use the "Search String" and "Replace String" field to replace "X.x" with the assigned version number
	-The version number is being changed in the following places:
		-the gistX.x description in each ontology shape
			-example: "gistX.x Core" will change to "gist8.1 Core"
		-the Version URI (and thus import statements) for each ontology
			-example: http://ontologies.semanticarts.com/o/gistTopX.x will be changed to http://ontologies.semanticarts.com/o/gistTop8.1
	
