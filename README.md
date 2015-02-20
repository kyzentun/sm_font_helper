# sm_font_helper
A theme to help with making fonts for Stepmania.

# Know your Operator Key
Before using this theme, make sure you have the Operator key mapped.  By
default, the Operator key is mapped to Scroll Lock.  If your keyboard does
not have Scroll Lock, map the Operator key to something you have.

# Purpose
This theme is not intended for gameplay.  It is a skeleton theme containing
only a single screen, for checking rendering of glyphs in a font.  Because of
this, the only way to change to another theme is to press the Operator key
to bring up the service menu.


Fonts in Stepmania are a bit troublesome to create.  There aren't any special
keys for reloading the font ini files (yet), so any time you change the ini
file, you have to close Stepmania and reopen it.  I recommend putting your
songs in a special folder instead of the normal Songs folder so that you
don't have to wait for long load times.  After you're done making the font,
you don't even have to move your songs back, you can just put the name of the
folder in the AdditionalSongFolders preference in Preferences.ini.


fontini.txt has an explanation of the structure of a font.

# Usage
To use this theme, create the Fonts folder and put your font in it.  Then
edit or create the language file in Languages to add the strings with the
glyphs you need to test.  Each entry in the TestStrings section will be one
string you will be able to display.  When Stepmania loads this theme, it
will allow you to pick the current font to use and the string to display.
You can use Shift+F2 to reload the language file followed by Ctrl+F2 to tell
the theme to reload the list of strings.


# Updating
Disclaimer:  These instructions are not meant for people who are planning to
contribute improvements to this theme.  People planning to improve this
theme for other people to use should ask for help learning the proper way to
resolve conflicts and stuff.

If you use git to clone this theme, remember that git will not update when
you have local changes.  Since your local changes are (probably) just editing
en.ini, it's best to just stash them, update, then pop them off the stash.
On the command line, you would do this:
```
git stash
git pull origin master
git stash pop
```
If git tells you that you have conflicts, open the file up and remove the lines that start with ">>>>>>", "======" or "<<<<<<".

# Contact
If you have any problems using this theme, contact the Stepmania developers
on the forums at stepmania.com/forums/ or in the IRC channel #stepmania-devs
on irc.freenode.net.
