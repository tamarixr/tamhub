message = "DOMAIN EXPANSION :"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(0.45)
local music = Instance.new("Sound")
local id = 7817341182
music.Volume = 2
music.PlaybackSpeed = 1
music.Looped = false
music.SoundId = "rbxassetid://"..id
music:Play()
music.Parent = game:GetService("ReplicatedStorage")
message = "THE PUNCH THAT ENDS IT ALL"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
