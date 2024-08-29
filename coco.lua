-- Utility function to set tool names
local function setToolName(buttonName, newName)
    local player = game.Players.LocalPlayer
    local playerGui = player.PlayerGui
    local hotbar = playerGui:FindFirstChild("Hotbar")
    local backpack = hotbar and hotbar:FindFirstChild("Backpack")
    local hotbarFrame = backpack and backpack:FindFirstChild("Hotbar")
    local baseButton = hotbarFrame and hotbarFrame:FindFirstChild(buttonName)
    
    if baseButton then
        local ToolName = baseButton:FindFirstChild("ToolName")
        if ToolName then
            ToolName.Text = newName
        end
    end
end

-- Set tool names
setToolName("1", "Serious Punch")
setToolName("2", "Table Flip")
setToolName("3", "Omni Directional Punch")
setToolName("4", "Serious Uprise")

-- Function to handle GUI updates
local function findGuiAndSetText()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = playerGui:FindFirstChild("ScreenGui")
    
    if screenGui then
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
        if magicHealthFrame then
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
            if textLabel then
                textLabel.Text = "The Ultimate Coconut"
            end
        end
    end
end

-- Update GUI text when added
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
playerGui.DescendantAdded:Connect(findGuiAndSetText)
findGuiAndSetText()

-- Function to handle animations
local function onAnimationPlayed(animationTrack)
    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))
    
    -- List of animations and their replacements
    local animationReplacements = {
        [10468665991] = "rbxassetid://12983333733",
        [10466974800] = "rbxassetid://12534735382",
        [10471336737] = "rbxassetid://13376869471",
        [12510170988] = "rbxassetid://15295895753",
        [11343318134] = "rbxassetid://12983333733",
        [15955393872] = "rbxassetid://15944317351",
        [12983333733] = "rbxassetid://13073745835",
        [12447707844] = "rbxassetid://16734584478",
        [10479335397] = "rbxassetid://13380255751",
        [10503381238] = "rbxassetid://10503381238",
        [10470104242] = "rbxassetid://10470104242",
    }
    
    local replacementId = animationReplacements[animationId]
    if replacementId then
        -- Stop all animations
        for _, animTrack in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
            animTrack:Stop()
        end
        
        -- Play replacement animation
        local anim = Instance.new("Animation")
        anim.AnimationId = replacementId
        local newAnimTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        newAnimTrack:Play()
        
        -- Adjust animation settings
        newAnimTrack:AdjustSpeed(0)
        newAnimTrack.TimePosition = 0
        newAnimTrack:AdjustSpeed(1)
    end
end

-- Connect function to AnimationPlayed event
local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

-- Function to handle BodyVelocity
local function onBodyVelocityAdded(bodyVelocity)
    if bodyVelocity:IsA("BodyVelocity") then
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
    end
end

-- Monitor existing and new BodyVelocity instances
local character = game.Players.LocalPlayer.Character
for _, descendant in pairs(character:GetDescendants()) do
    onBodyVelocityAdded(descendant)
end

character.DescendantAdded:Connect(onBodyVelocityAdded)

-- Handle new character
game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    for _, descendant in pairs(character:GetDescendants()) do
        onBodyVelocityAdded(descendant)
    end
end)
local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("1").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Coconut Flick"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Coconut Barrage"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("3").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Coconut BackHand"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("4").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Coconut HeadKick"
