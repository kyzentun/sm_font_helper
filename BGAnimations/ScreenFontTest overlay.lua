local string_name= false
local zoom_text= false
local example_text= false
local zoom_value= 1
local line_height= 32
local text_width= _screen.w-16
local stroke_on= false

local function update_string_name()
	string_name:settext(
		THEME:GetString("ScreenFontTest", "string_name") .. current_string)
end

local function update_zoom_text(amount)
	zoom_value= zoom_value + amount
	zoom_text:settext(
		THEME:GetString("ScreenFontTest", "zoom"):format(zoom_value))
	if example_text then
		example_text:zoom(zoom_value):wrapwidthpixels(text_width/zoom_value)
	end
end

local function update_example_text()
	current_string= string_list[current_string_id]
	update_string_name()
	local str= THEME:GetString("TestStrings", current_string)
	example_text:settext(str):wrapwidthpixels(text_width/zoom_value)
end

local function update_font()
	current_font= font_list[current_font_id]
	SCREENMAN:GetTopScreen():SetNextScreenName("ScreenFontTest")
		:StartTransitioningScreen("SM_GoToNextScreen")
end

local function input(event)
	if event.type == "InputEventType_Release" then return end
	if not event.GameButton then return end
	if event.GameButton == "MenuLeft" then
		current_string_id= current_string_id - 1
		if current_string_id < 1 then current_string_id= #string_list end
		update_example_text()
	elseif event.GameButton == "MenuRight" then
		current_string_id= current_string_id + 1
		if current_string_id > #string_list then current_string_id= 1 end
		update_example_text()
	elseif event.GameButton == "MenuUp" then
		update_zoom_text(.1)
	elseif event.GameButton == "MenuDown" then
		update_zoom_text(-.1)
	elseif event.button == "UpLeft" then
		stroke_on= not stroke_on
		if stroke_on then
			example_text:strokecolor(color("#ffffffff")):diffuse(color("#000000"))
		else
			example_text:strokecolor(color("#00000000")):diffuse(color("#ffffff"))
		end
	elseif event.type == "InputEventType_Repeat" then
		-- Block repeat events from changing the font because it causes the
		-- screen to reload.
		return
	elseif event.GameButton == "Start" then
		current_font_id= current_font_id - 1
		if current_font_id < 1 then current_font_id= #font_list end
		update_font()
	elseif event.GameButton == "Select" then
		current_font_id= current_font_id + 1
		if current_font_id > #font_list then current_font_id= 1 end
		update_font()
	end
end

return Def.ActorFrame{
	Def.Quad{
		OnCommand= function(self)
			SCREENMAN:GetTopScreen():AddInputCallback(input)
			self:xy(_screen.cx, _screen.cy):setsize(_screen.w, _screen.h)
				:diffuse(color("#000000"))
		end
	},
	Def.Quad{
		InitCommand= function(self)
			self:xy(_screen.cx, _screen.cy):setsize(_screen.w, 1)
				:diffuse(color("#3f3f3f"))
		end
	},
	Def.BitmapText{
		Font= "Common Normal", Text= THEME:GetString("ScreenFontTest", "help"),
		InitCommand= function(self)
			self:xy(_screen.cx, line_height*1):diffuse(color("#ffffff"))
				:wrapwidthpixels(_screen.w-16)
		end
	},
	Def.BitmapText{
		Font= "Common Normal",
		Text= THEME:GetString("ScreenFontTest", "font") .." "..current_font,
		InitCommand= function(self)
			self:xy(_screen.w*.25, line_height*2.5):diffuse(color("#ffffff"))
		end
	},
	Def.BitmapText{
		Font= "Common Normal", InitCommand= function(self)
			self:xy(_screen.w*.75, line_height*2.5):diffuse(color("#ffffff"))
			string_name= self
			update_string_name()
		end
	},
	Def.BitmapText{
		Font= "Common Normal", InitCommand= function(self)
			self:xy(_screen.cx, line_height*3.5):diffuse(color("#ffffff"))
			zoom_text= self
			update_zoom_text(0)
		end
	},
	Def.BitmapText{
		Font= current_font, InitCommand= function(self)
			self:xy(_screen.cx, _screen.cy):diffuse(color("#ffffff"))
			example_text= self
			update_example_text()
		end
	},
}
