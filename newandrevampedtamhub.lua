local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("TAMHUB 4.1.5")
local serv = win:Server("TAMHUB", "")

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

local btns = serv:Channel("TSB")

btns:Button("Mixed Powers", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/tsbanim.lua",true))()
DiscordLib:Notification("Notification", "Loaded anims!", "Okay!")
end)

btns:Seperator()

btns:Button("Gojo moves with anims!", function()
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

btns:Button("Tsb anims but idk", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt",true))()
DiscordLib:Notification("Notification", "BE CAREFUL DO NOT USE SECRET CHARACTER ITS VERY BANNABLE!", "Okay!")
end)

btns:Seperator()

btns:Button("anim id finder", function()
local lp = game:GetService("Players").LocalPlayer
local function init(c)
    local h = c and c:WaitForChild("Humanoid", 1)
    if c and h then
        local a = {}
        h.AnimationPlayed:Connect(function(v)
            if not table.find(a, v.Animation.AnimationId) then
                table.insert(a, v.Animation.AnimationId)
                warn("Animation:", v.Animation.AnimationId)
            end
        end)
    end
end

init(lp.Character)
lp.CharacterAdded:Connect(init)
DiscordLib:Notification("Notification", "Loaded! (prints on console)", "Okay!")
end)

btns:Seperator()

btns:Button("KADEHUB (actually this time)", function()
getgenv().AutoReport = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/KadeHubRepository/main/Latest.lua"))() 
DiscordLib:Notification("Notification", "Bannable as of 8/3/24 !", "Okay!")
end)

btns:Seperator()

btns:Button("Phantasm (W)", function()
getgenv().scriptWl = "KidsOnlyJoinDiscordIfScriptsDown"
getgenv().ToggleKeybind = Enum.KeyCode.RightControl
getgenv().ForceFluentMobileUI = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrain-Roblox/main/main/Phantasm.lua"))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

btns:Seperator()

btns:Button("Anime teleportation", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/animtelp.lua"))()
DiscordLib:Notification("Notification", "Key is T", "Okay!")
end)

btns:Seperator()

btns:Button("TP to shit", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/TSBUtils.lua"))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end)

local btns = serv:Channel("Other")

btns:Button("Wave premium key generator", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/free.lua",true))()
DiscordLib:Notification("Notification", "Loaded GUI!", "Okay!")
end)

btns:Seperator()

btns:Button("azure modded loader lmao", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
DiscordLib:Notification("Notification", "Azure modded loaded (ha rhymes)", "Okay!")
end)

btns:Seperator()

btns:Button("kadehub skidded :rofl:", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/adsadsa.lua",true))()
DiscordLib:Notification("Notification", "KadeHub Initialized", "Okay!")
end)

btns:Seperator()

local btns = serv:Channel("Gojo n shit")

btns:Button("Go/jo hub", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/jogohub.lua",true))()
DiscordLib:Notification("Notification", "Loaded!", "Okay!")
end) 

serv:Channel("by dfptt")


win:Server("Main", "http://www.roblox.com/asset/?id=18565910638")

local btns = serv:Channel("idfk stupid shit")

btns:Button("PHANTASMA DISCORD SERVER", function()
setclipboard("discord.gg/bntsEjwnA5")
DiscordLib:Notification("Notification", "Pasted to clipboard!", "Okay!")
end)
