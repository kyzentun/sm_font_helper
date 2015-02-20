# sm_font_helper
A theme to help with making fonts for Stepmania.

Before using this theme, make sure you have the Operator key mapped.  By
default, the Operator key is mapped to Scroll Lock.  If your keyboard does
not have Scroll Lock, map the Operator key to something you have.

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

To use this theme, create the Fonts folder and put your font in it.  Then
edit or create the language file in Languages to add the strings with the
glyphs you need to test.  Each entry in the TestStrings section will be one
string you will be able to display.  When Stepmania loads this theme, it
will allow you to pick the current font to use and the string to display.
You can use Shift+F2 to reload the language file followed by Ctrl+F2 to tell
the theme to reload the list of strings.
