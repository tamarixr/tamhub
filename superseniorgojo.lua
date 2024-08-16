message = "Reversed grip technique really did save me huh?"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(2.25)
message = "I'm just edginĝ to do it already!"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(2.25)
message = "It's going in!"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(2.25)
local music = Instance.new("Sound")
local id = 17111962824
music.Volume = 1
music.PlaybackSpeed = 1
music.Looped = false
music.SoundId = "rbxassetid://"..id
music:Play()
music.Parent = game:GetService("ReplicatedStorage")
message = "Mom and dad, i think im... im the honored one after all!."
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
