message = "THE GROUND WILL BURN THE SKY WILL TEAR"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(0.45)
message = "WITHIN THIS REALM OF ENDLESS GLORY"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(0.45)
local music = Instance.new("Sound")
local id = 18269037904
music.Volume = 2
music.PlaybackSpeed = 1
music.Looped = false
music.SoundId = "rbxassetid://"..id
music:Play()
music.Parent = game:GetService("ReplicatedStorage")
message = "DOMAIN EXPANSION : CRIMSON PURGATORY"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
