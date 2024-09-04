local assetId = 17352290656
local effect = game:GetObjects("rbxassetid://" .. assetId)[1]

if effect then
    
    local character = game.Players.LocalPlayer.Character
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

    if torso then
        
        effect.Parent = torso

        effect.CFrame = torso.CFrame * CFrame.new(0, 30, -1)


local sound = Instance.new("Sound")


sound.SoundId = "rbxassetid://6667923288"

sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

sound:Play()

sound.Ended:Connect(function()
    sound:Destroy()
end)
    end
end
