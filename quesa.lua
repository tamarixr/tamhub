local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("HumanoidRootPart")

local duration = 1
local interval = 0.1

local final6 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
final6.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(final6:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit("1") -- Emit 20 particles
        end
    end
