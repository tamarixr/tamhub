local assetId = 85612504696252 -- Replace with the actual Asset ID
local newAssetId = 116082434141240 -- New asset to appear in front of the player

local su = {
    [1] = "" .. " ",
    [2] = "" .. " ",
    [3] = "Has Been Made!",
}

local function wf(sn, au)
    if not isfile(sn) then
        if string.find(au, "https://cdn.discordapp.com/attachments/") then
            local response = request({Url = au, Method = "GET"})
            -- Check if the response was successful
            if response.StatusCode == 200 then
                -- Attempt to write the file
                local success, err = pcall(function()
                    writefile(sn, response.Body)
                end)
                if success then
                    print("Downloaded: " .. sn .. " " .. su[3])
                else
                    error("Failed to write file: " .. err)
                end
            else
                error("Failed to download: " .. response.StatusCode .. " - " .. response.StatusMessage)
            end
        else
            error("No valid URL found: " .. au)
        end
    end
    return getcustomasset(sn) 
end

local soundFileName = "baller_breakbeaTTTt.mp3"
local audioUrl = "https://cdn.discordapp.com/attachments/1286679967341477895/1287381076196724787/ReversalRedFire.MP3?ex=6703cb8e&is=67027a0e&hm=21b352661fc312c169b306b951d1e17761e66aa53a23e98a07be06cdb98e4e35&" -- Replace with your actual audio URL

-- Call the function with the audio URL
wf(soundFileName, audioUrl)

-- Create or get the folder in the executor's Workspace
local folderName = "tamarisorcererrrrrrrrrrrrrrrrrrr"
local workspaceFolder = game.Workspace:FindFirstChild(folderName)

if not workspaceFolder then
    -- Folder does not exist, create it
    workspaceFolder = Instance.new("Folder")
    workspaceFolder.Name = folderName
    workspaceFolder.Parent = game.Workspace -- Parent it to Workspace
    print("Folder created: " .. folderName)
else
    print("Folder already exists: " .. folderName)
end

local effect = game:GetObjects("rbxassetid://" .. assetId)[1]
local newEffect = game:GetObjects("rbxassetid://" .. newAssetId)[1]
local sound = Instance.new("Sound") -- Create a new Sound instance

if effect and newEffect and sound then
    sound.SoundId = getcustomasset(soundFileName) -- Set the SoundId property to the downloaded sound asset
    sound.Parent = workspaceFolder -- Parent it to the workspace folder

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

        -- Wait for 0.35 seconds before playing the sound
        wait(0.35)

        -- Play the sound
        sound:Play()

        -- Wait for 0.25 seconds
        wait(0.25)

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
