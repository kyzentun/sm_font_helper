font_list= {"Common Normal"}

local function add_font_list(list)
	for i= 1, #list do
		local path= list[i]
		local slash= #path - path:reverse():find("/") + 2
		local dot= path:find("%.", slash)
		local name= path:sub(slash, dot-1)
--		Warn("path: '" .. path .. "' slash: " .. slash .. " dot: " .. dot ..
--					 " named '" .. name .. "'")
		font_list[#font_list+1]= name
	end
end

add_font_list(FILEMAN:GetDirListing(
	THEME:GetCurrentThemeDirectory() .. "Fonts/*.ini", false, true))

string_list= THEME:GetStringNamesInGroup("TestStrings")

current_font_id= 1
current_font= font_list[current_font_id]
current_string_id= 1
current_string= string_list[current_string_id]
