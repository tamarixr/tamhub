local assetId = 85612504696252 -- Replace with the actual Asset ID
local newAssetId = 116082434141240 -- New asset to appear in front of the player
local soundId = "rbxassetid://1177475221" -- Replace with the actual Sound ID

local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
local newEffect = game:GetObjects("rbxassetid://" .. newAssetId)[1]
local sound = Instance.new("Sound") -- Create a new Sound instance

if effect and newEffect and sound then
    sound.SoundId = soundId -- Set the SoundId property to the asset ID
    sound.Parent = game.Workspace -- Parent it to Workspace or any other service

    local player = game.Players.LocalPlayer
    local character = player and player.Character
    local rightHand = character and (character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")) -- Adjust for R6 or R15

    if rightHand then
        effect.Parent = rightHand

        -- Adjust CFrame to position effect at the end of the hand
        effect.CFrame = rightHand.CFrame * CFrame.new(0, -rightHand.Size.Y / 3, 0)

        -- Create a weld to keep the effect attached
        local weld = Instance.new("Weld")
        weld.Part0 = rightHand
        weld.Part1 = effect
        weld.C0 = CFrame.new(0, -rightHand.Size.Y / 28, -0.75) -- Adjust the offset if necessary
        weld.Parent = rightHand

        -- Play the sound
        sound:Play()

        -- Wait for 0.25 seconds
        wait(0.35)

        -- Position the new asset in front of the player
        newEffect.Parent = game.Workspace
        newEffect.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -9) -- Adjust the position in front of the player

        -- Destroy the 1st asset when the 2nd asset appears
        effect:Destroy()

        -- Fade away the new asset over 0.5 seconds (quick fade)
        local fadeTime = 0.75 -- Faster fade time
        local transparencyStep = 1 / (fadeTime * 60) -- 60 frames per second

        -- Iterate over the model's descendants and fade them
        for i = 1, fadeTime * 60 do
            for _, descendant in ipairs(newEffect:GetDescendants()) do
                -- Fade BaseParts
                if descendant:IsA("BasePart") then
                    descendant.Transparency = math.clamp(descendant.Transparency + transparencyStep, 0, 1)
                end

                -- Fade ParticleEmitters
                if descendant:IsA("ParticleEmitter") then
                    local particleTransparency = descendant.Transparency.Keypoints[1].Value
                    particleTransparency = math.clamp(particleTransparency + transparencyStep, 0, 1)
                    descendant.Transparency = NumberSequence.new(particleTransparency)
                end

                -- Fade Beams
                if descendant:IsA("Beam") then
                    local beamTransparency = descendant.Transparency.Keypoints[1].Value
                    beamTransparency = math.clamp(beamTransparency + transparencyStep, 0, 1)
                    descendant.Transparency = NumberSequence.new(beamTransparency)
                end

                -- Fade Trails
                if descendant:IsA("Trail") then
                    local trailTransparency = descendant.Transparency.Keypoints[1].Value
                    trailTransparency = math.clamp(trailTransparency + transparencyStep, 0, 1)
                    descendant.Transparency = NumberSequence.new(trailTransparency)
                end

                -- Handle other objects as necessary
            end
            wait(1 / 60) -- Wait for the next frame
        end

        -- Cleanup
        newEffect:Destroy()
        sound:Destroy()
    end
end
