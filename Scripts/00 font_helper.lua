font_list= FILEMAN:GetDirListing(
	THEME:GetCurrentThemeDirectory() .. "Fonts/*.ini", false, true)
table.insert(font_list, 1, "Common Normal")
string_list= THEME:GetStringNamesInGroup("TestStrings")

current_font_id= 1
current_font= font_list[current_font_id]
current_string_id= 1
current_string= string_list[current_string_id]
