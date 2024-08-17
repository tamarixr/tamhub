message = "THE GROUND WILL BURN THE SKY WILL TEAR"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(0.25)
message = "WITHIN THIS REALM OF ENDLESS GLORY"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(0.25)
local music = Instance.new("Sound")
local id = 7083916310
music.Volume = 1
music.PlaybackSpeed = 1
music.Looped = false
music.SoundId = "rbxassetid://"..id
music:Play()
music.Parent = game:GetService("ReplicatedStorage")
message = "DOMAIN EXPANSION : CRIMSON PURGATORY"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
