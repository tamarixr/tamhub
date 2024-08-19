local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Define a list of target Animation IDs that add the outline
local targetAnimationIds = {
    ["rbxassetid://12342141464"] = 45,
    ["rbxassetid://12447707844"] = 9999, -- 9999 seconds duration for this animation (practically infinite)
    ["rbxassetid://12772543293"] = 45,
    ["rbxassetid://13499771836"] = 45,
    ["rbxassetid://14733282425"] = 45,
    ["rbxassetid://15391323441"] = 45,
    ["rbxassetid://16734584478"] = 45,
    -- Add more animation IDs and their durations as needed
}

-- Define a list of stop Animation IDs that remove the outline
local stopAnimationIds = {
    "rbxassetid://11365563255",
    "rbxassetid://12983333733",
    "rbxassetid://13927612951"
    -- Add more animation IDs as needed
}

-- Define the asset IDs for the notification image and emoji image
local notificationImageId = "https://www.roblox.com/asset/?id=7298229612"
local emojiImageId = "https://www.roblox.com/asset/?id=7298229612" -- Replace with your emoji asset ID

-- Function to create a notification
local function notifyAnimationPlayed(playerName, animationId)
    StarterGui:SetCore("SendNotification", {
        Title = "Ult Detected";
        Text = playerName .. " has used an ult!";
        Duration = 5; -- The notification will show for 5 seconds
        Icon = notificationImageId; -- Asset ID of the image to display in the notification
    })
end

-- Function to check if an animation ID is in the target list
local function isTargetAnimation(animationId)
    return targetAnimationIds[animationId] ~= nil
end

-- Function to check if an animation ID is in the stop list
local function isStopAnimation(animationId)
    for _, stopId in ipairs(stopAnimationIds) do
        if animationId == stopId then
            return true
        end
    end
    return false
end

-- Function to create a red outline around the player
local function createRedOutline(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart then
        -- Create a Highlight object (this is more modern than SelectionBox)
        local highlight = Instance.new("Highlight")
        highlight.Name = "RedOutline"
        highlight.Adornee = character
        highlight.FillColor = Color3.new(1, 0, 0) -- Red color
        highlight.OutlineColor = Color3.new(1, 0, 0) -- Red outline
        highlight.Parent = character
    end
end

-- Function to remove the red outline from the player
local function removeRedOutline(character)
    local highlight = character:FindFirstChild("RedOutline")
    if highlight then
        highlight:Destroy()
    end
end

-- Function to create an emoji above the player's head
local function createEmoji(character)
    local head = character:FindFirstChild("Head")
    if head then
        local existingGui = head:FindFirstChild("EmojiBillboardGui")
        if existingGui then
            existingGui:Destroy()
        end

        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "EmojiBillboardGui"
        billboardGui.Adornee = head
        billboardGui.Size = UDim2.new(0, 50, 0, 50) -- Size of the emoji
        billboardGui.StudsOffset = Vector3.new(0, 3, 0) -- Offset above the head
        billboardGui.Parent = head

        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "EmojiImageLabel"
        imageLabel.Size = UDim2.new(1, 0, 1, 0)
        imageLabel.Image = emojiImageId -- Asset ID of the emoji image
        imageLabel.BackgroundTransparency = 1
        imageLabel.Parent = billboardGui

        print("Emoji created for player:", character.Name) -- Debug message
    else
        print("No head found for player:", character.Name) -- Debug message
    end
end

-- Function to remove the emoji from above the player's head
local function removeEmoji(character)
    local billboardGui = character:FindFirstChild("Head"):FindFirstChild("EmojiBillboardGui")
    if billboardGui then
        billboardGui:Destroy()
        print("Emoji removed from player:", character.Name) -- Debug message
    end
end

-- Function to handle the timing of outline and emoji removal
local function handleOutlineAndEmojiRemoval(character, animationId)
    local duration = targetAnimationIds[animationId]
    if duration then
        -- Wait for the specified duration before removing the outline and emoji
        delay(duration, function()
            removeRedOutline(character)
            removeEmoji(character)
        end)
    end
end

-- Function to listen for animations being played on a player's character
local function onCharacterAdded(char, player)
    -- Exclude the local player (yourself)
    if player == Players.LocalPlayer then return end

    local humanoid = char:WaitForChild("Humanoid")

    -- Listen for new animations being played
    humanoid.AnimationPlayed:Connect(function(animationTrack)
        local animationId = animationTrack.Animation and animationTrack.Animation.AnimationId

        -- If the animation is a stop animation, remove the red outline and emoji
        if animationId and isStopAnimation(animationId) then
            removeRedOutline(char)
            removeEmoji(char)
        elseif animationId and isTargetAnimation(animationId) then
            -- Trigger a notification for the target animation
            notifyAnimationPlayed(player.Name, animationId)
            -- Create or ensure the red outline is present
            createRedOutline(char)
            -- Create the emoji above the player's head
            createEmoji(char)
            -- Handle the removal of the outline and emoji after the specified duration
            handleOutlineAndEmojiRemoval(char, animationId)
        end
    end)
end

-- Function to set up a player
local function onPlayerAdded(player)
    -- Listen for the player's character being added
    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(character, player)
    end)

    -- If the player already has a character, set it up
    if player.Character then
        onCharacterAdded(player.Character, player)
    end
end

-- Connect to all current players
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Connect to new players joining the game
Players.PlayerAdded:Connect(onPlayerAdded)
