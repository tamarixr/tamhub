local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("TAMHUB 2.6.9")

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
DiscordLib:Notification("Notification", "BE CAREFUL DO NOT USE SECRET CHARACTER ITS VERY BANNABLE!", "Okay!")
end)

btns:Seperator()

btns:Button("hollow serious punch test(HEAVY WIP)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowpunchtesbt.lua",true))()
DiscordLib:Notification("Notification", "wip", "Okay!")
end)

local btns = serv:Channel("Other")

btns:Button("Wave premium key generator", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/free.lua",true))()
DiscordLib:Notification("Notification", "Loaded GUI!", "Okay!")
end)

btns:Seperator()

btns:Button("azure modded loader lmao", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded",true))()
DiscordLib:Notification("Notification", "Azure modded loaded (ha rhymes)", "Okay!")
end)

btns:Seperator()

btns:Button("kadehub skidded :rofl:", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/adsadsa.lua",true))()
DiscordLib:Notification("Notification", "KadeHub Initialized", "Okay!")
end)

serv:Channel("by dfptt")


win:Server("Main", "http://www.roblox.com/asset/?id=6031075938")

local btns = serv:Channel("idfk stupid shit")

btns:Button("PHANTASMA DISCORD SERVER (buggy adds x's so uh dont use)", function()
setclipboard(".gg/bntsEjwnA5.")
DiscordLib:Notification("Notification", "(buggy adds x's so uh dont use)", "Okay!")
end)
