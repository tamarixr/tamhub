local assetId = 17352290656 -- Replace with the actual Asset ID
local effect = game:GetObjects("rbxassetid://" .. assetId)[1]

if effect then
    -- Attach to the player's torso (you can change this to any other part, like "Head" or "HumanoidRootPart")
    local character = game.Players.LocalPlayer.Character
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") -- Depending on R6 or R15

    if torso then
        -- Parent the effect to the torso
        effect.Parent = torso

        -- Adjust the position to be closer
        effect.CFrame = torso.CFrame * CFrame.new(0, 32, -1) -- Change the last value to move the effect closer or further away (negative value moves it closer)

        -- Wait for 10 seconds
        wait(10)

        -- Destroy the effect
        effect:Destroy()
local soundId = "rbxassetid://6667923288" -- Replace YOUR_SOUND_ID with the actual ID of the sound you want to play

local sound = Instance.new("Sound") -- Create a new Sound instance
sound.SoundId = soundId -- Set the SoundId property to the asset ID
sound.Parent = game.Workspace -- Parent it to Workspace or any other service
sound:Play() -- Play the sound
    end
end
