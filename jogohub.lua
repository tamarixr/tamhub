local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("GO/JOHUB")
local serv = win:Server("GO/JO HUB 1.5", "")

local btns = serv:Channel("Universal")

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

btns:Button("ESP", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Cornerbox/Example",true))()
DiscordLib:Notification("Notification", "Loaded ESP!", "Okay!")
end)

btns:Seperator()

btns:Button("Spoof id to game owner id", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/ofajkjga.lua",true))()
DiscordLib:Notification("Notification", "Spoofed!", "Okay!")
end)

btns:Seperator()

btns:Button("Feyhuu hub (beta cuz im a leaker)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sytcal/BetaOnly/main/BetasLikeNiggas"))()
DiscordLib:Notification("Notification", "Universal so uh yeahhh", "Okay!")
end)

btns:Seperator()

local btns = serv:Channel("Gojo n shit")

btns:Button("Gojo anims", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowpunchforserious.lua",true))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

btns:Seperator()

btns:Button("Hollow Serious punch (USE GOJO ANIMS)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowpunchforserious.lua",true))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

btns:Seperator()

btns:Button("Hollow table flip MAX (USE GOJO ANIMS)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowmax.lua",true))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

btns:Seperator()

btns:Button("Red quotes when normal punch (USE GOJO ANIMS)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/redwhenpnu.lua",true))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

btns:Seperator()

btns:Button("Blue quotes when Consecutive punches (USE GOJO ANIMS)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/bluewhencon.lua",true))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

btns:Seperator()

btns:Button("Anime teleportation", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/animtelp.lua"))()
DiscordLib:Notification("Notification", "Key is T", "Okay!")
end)

serv:Channel("by dfptt")

local btns = serv:Channel("idfk stupid shit")

btns:Button("PHANTASMA DISCORD SERVER", function()
setclipboard("discord.gg/bntsEjwnA5")
DiscordLib:Notification("Notification", "Pasted to clipboard!", "Okay!")
end)
