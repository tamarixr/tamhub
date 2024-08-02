local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("TAMHUB 1.1.1")

local serv = win:Server("Preview", "")

local btns = serv:Channel("Buttons")

btns:Button("Infinite yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
DiscordLib:Notification("Notification", "Loaded Infinite Yield!", "Okay!")
end)

btns:Seperator()

btns:Button("Console", function()
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
DiscordLib:Notification("Notification", "Opened Console!", "Okay!")
end)

btns:Seperator()

btns:Button("Mixed Powers", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/tsbanim.lua",true))()
DiscordLib:Notification("Notification", "Loaded anims!", "Okay!")
end)

btns:Seperator()

btns:Button("Gojo moves (only names)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/custommoves.lua",true))()
DiscordLib:Notification("Notification", "Loaded Names!", "Okay!")
end)

btns:Seperator()

btns:Button("KJ moves (only names)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/kjmoves.lua",true))()
DiscordLib:Notification("Notification", "Loaded Names!", "Okay!")
end)

btns:Seperator()

btns:Button("KJ ult moves (only names)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/kjmovesult.lua",true))()
DiscordLib:Notification("Notification", "Loaded Names!", "Okay!")
end)

btns:Seperator()

btns:Button("ESP", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Cornerbox/Example",true))()
DiscordLib:Notification("Notification", "Loaded ESP!", "Okay!")
end)

btns:Seperator()

btns:Button("Tsb anims but idk", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt",true))()
DiscordLib:Notification("Notification", "Loaded GUI!", "Okay!")
end)

local btns = serv:Channel("Other")

btns:Button("Wave premium key generator", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/free.lua",true))()
DiscordLib:Notification("Notification", "Loaded GUI!", "Okay!")
end)

serv:Channel("by dfptt")


win:Server("Main", "http://www.roblox.com/asset/?id=6031075938")

local btns = serv:Channel("idfk stupid shit")

btns:Button("PHANTASMA DISCORD SERVER (buggy adds x's so uh dont use)", function()
setclipboard(".gg/bntsEjwnA5.")
DiscordLib:Notification("Notification", "(buggy adds x's so uh dont use)", "Okay!")
end)