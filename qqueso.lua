local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("HumanoidRootPart")

local music = Instance.new("Sound")
local id = 17873732848
music.Volume = 1
music.PlaybackSpeed = 1
music.Looped = false
music.SoundId = "rbxassetid://"..id
music:Play()
music.Parent = game:GetService("ReplicatedStorage")

local final1 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
final1.Parent = game.Players.LocalPlayer.Character["Head"]
for _, child in ipairs(final1:GetChildren()) do
    if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
        child:Emit(50) -- Emit 20 particles
    end
end
local final4 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
final4.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(final4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(3) -- Emit 20 particles
        end
    end
