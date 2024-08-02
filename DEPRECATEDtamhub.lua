--Lib
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/InfinitiveUI",true))()

--Create Window
--Lib:CreateWindow(name,DefTab,WinSize,function)
local Win = Lib:CreateWindow("ah",1,nil,nil)

for i = 1, 1 do

--Create Tab
local Tab,name = Win:CreateTab("Main "..tostring(i),function() warn(i) end)

Tab:CreateButton("Infinite yield",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
	end)

Tab:CreateButton("Console",function()
	game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
	end)

Tab:CreateButton("tsb anims",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/tsbanim.lua",true))()
	end)

Tab:CreateButton("Gojo moves (only names)",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/custommoves.lua",true))()
	end)

Tab:CreateButton("KJ moves (only names)",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/kjmoves.lua",true))()
	end)

Tab:CreateButton("KJ ult moves (only names)",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/kjmovesult.lua",true))()
	end)

--Create Tab
local Tab,name = Win:CreateTab("??? "..tostring(i),function() warn(i) end)

Tab:CreateButton("Wave premium key generator",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/free.lua",true))()
	end)

--Create Tab
local Tab,name = Win:CreateTab("Credits "..tostring(i),function() warn(i) end)

--Returns two userdata,UI
--Tab:CreateDropdown(name,{table,string},visible,function)

Tab:CreateDropdown("Dropdown "..i, {{
	"", {}},"dfptt on discord"
},false,function(c,f)
	print(i,name,c,f)
	end)

end
