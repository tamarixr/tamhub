local assetId = 17352290656 -- Replace with the actual Asset ID
local soundId = "rbxassetid://6667923288" -- Replace with the actual sound asset ID

local tool = script.Parent -- Assuming the script is inside the tool

tool.Activated:Connect(function()
    -- Load the effect
    local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
    
    if effect then
        -- Attach to the player's torso (you can change this to any other part, like "Head" or "HumanoidRootPart")
        local character = game.Players.LocalPlayer.Character
        local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") -- Depending on R6 or R15
        
        if torso then
            -- Parent the effect to the torso
            effect.Parent = torso

            -- Adjust the position to be closer
            effect.CFrame = torso.CFrame * CFrame.new(0, 32, -1) -- Change the last value to move the effect closer or further away

            -- Play the sound
            local sound = Instance.new("Sound")
            sound.SoundId = soundId
            sound.Parent = torso -- Parent it to the torso for localized sound
            sound:Play() -- Play the sound

            -- Wait for 10 seconds
            wait(10)

            -- Destroy the effect
            effect:Destroy()
        end
    end
end)
