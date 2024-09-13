local assetId = 85612504696252 -- Replace with the actual Asset ID
local soundId = "rbxassetid://18169340129" -- Replace with the actual Sound ID

local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
local sound = Instance.new("Sound") -- Create a new Sound instance

if effect and sound then
    sound.SoundId = soundId -- Set the SoundId property to the asset ID
    sound.Parent = game.Workspace -- Parent it to Workspace or any other service

    local player = game.Players.LocalPlayer
    local character = player and player.Character
    local rightHand = character and (character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")) -- Adjust for R6 or R15

    if rightHand then
        effect.Parent = rightHand

        -- Adjust CFrame to position effect at the end of the hand
        -- For R15, "RightHand" might be used; for R6, you might need to adjust it further
        effect.CFrame = rightHand.CFrame * CFrame.new(0, -rightHand.Size.Y/3, 0) -- Adjust the offset if necessary

        -- Create a weld to keep the effect attached
        local weld = Instance.new("Weld")
        weld.Part0 = rightHand
        weld.Part1 = effect
        weld.C0 = CFrame.new(0, -rightHand.Size.Y/28, -0.75) -- Adjust the offset if necessary
        weld.Parent = rightHand

        -- Play the sound
        sound:Play()

        -- Wait for 10 seconds
        wait(0.75)

        -- Cleanup
        effect:Destroy()
        sound:Destroy()
    end
end
