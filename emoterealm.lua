local ImGui = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))()

local Window = ImGui:CreateWindow({
    Title = "Emote Player by dfptt",
    Size = UDim2.new(0, 300, 0, 200),
    Position = UDim2.new(0.5, 0, 0.5, 0)
})

local EmoteTab = Window:CreateTab({
    Name = "Emotes"
})

local EmoteNames = {}
for _, emote in pairs(game:GetService("ReplicatedStorage").Emotes:GetChildren()) do
    table.insert(EmoteNames, emote.Name)
end

local SelectedEmote = EmoteNames[1]
local LoopEmotes = false
local FavoriteEmotes = {}

local ConfigFolder = "EmotePlayerConfig"
local ConfigFile = "FavoriteEmotes.json"
local function SaveConfig()
    if not isfolder(ConfigFolder) then
        makefolder(ConfigFolder)
    end
    writefile(ConfigFolder .. "/" .. ConfigFile, game:GetService("HttpService"):JSONEncode(FavoriteEmotes))
end

local function LoadConfig()
    if isfolder(ConfigFolder) and isfile(ConfigFolder .. "/" .. ConfigFile) then
        FavoriteEmotes = game:GetService("HttpService"):JSONDecode(readfile(ConfigFolder .. "/" .. ConfigFile))
    end
end

LoadConfig()

EmoteTab:Combo({
    Label = "Select Emote",
    Items = EmoteNames,
    Callback = function(_, Value)
        SelectedEmote = Value
    end
})

EmoteTab:Checkbox({
    Label = "Loop Emotes",
    Value = false,
    Callback = function(_, Value)
        LoopEmotes = Value
    end
})

EmoteTab:Button({
    Text = "Favorite Current Emote",
    Callback = function()
        if not table.find(FavoriteEmotes, SelectedEmote) then
            table.insert(FavoriteEmotes, SelectedEmote)
            SaveConfig()
        end
    end
})

EmoteTab:Combo({
    Label = "Favorite Emotes",
    Items = FavoriteEmotes,
    Callback = function(_, Value)
        SelectedEmote = Value
    end
})

local function PlayEmote()
    local args = {
        [1] = {
            ["Name"] = SelectedEmote,
            ["Type"] = "PlayEmote"
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Replicate"):FireServer(unpack(args))
end

local function WaitForEmoteToFinish()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.AnimationPlayed:Wait()
        end
    end
end

EmoteTab:Button({
    Text = "Play Emote",
    Callback = function()
        if LoopEmotes then
            while LoopEmotes do
                PlayEmote()
                WaitForEmoteToFinish()
            end
        else
            PlayEmote()
        end
    end
})

EmoteTab:Button({
    Text = "Play Favorite Emote",
    Callback = function()
        if #FavoriteEmotes > 0 then
            SelectedEmote = FavoriteEmotes[math.random(1, #FavoriteEmotes)]
            PlayEmote()
        end
    end
})
