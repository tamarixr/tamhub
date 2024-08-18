-- Get the player and the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- User input service to detect keypresses
local userInputService = game:GetService("UserInputService")

-- Teleport distance (in studs)
local teleportDistance = 25

-- Variables to track keypresses
local isQPressed = false
local isDPressed = false
local isAPressed = false

-- Function to teleport the player
local function teleportPlayer(direction)
    if direction == "Right" then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(teleportDistance, 0, 0)
    elseif direction == "Left" then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(-teleportDistance, 0, 0)
    end
end

-- Function to execute when Q + D is pressed
local function executeRightScript()
    -- Insert your custom script code here
    Player = "LocalPlayer"
    AnimationId = "10480793962"
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k = game.Players[Player].Character.Humanoid:LoadAnimation(Anim)
    k:Play() --Play the animation
    k:AdjustSpeed(1) --Set '1' to any value you want to adjust the animation speed.
    local music = Instance.new("Sound")
    local id = 10481117326
    music.Volume = 1
    music.PlaybackSpeed = 1
    music.Looped = false
    music.SoundId = "rbxassetid://"..id
    music:Play()
    music.Parent = game:GetService("ReplicatedStorage")
    -- Example: you can do anything here, like playing a sound, giving points, etc.
end

-- Function to execute when Q + A is pressed
local function executeLeftScript()
    -- Insert your custom script code here
    Player = "LocalPlayer"
    AnimationId = "10480796021"
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k = game.Players[Player].Character.Humanoid:LoadAnimation(Anim)
    k:Play() --Play the animation
    k:AdjustSpeed(1) --Set '1' to any value you want to adjust the animation speed.
    local music = Instance.new("Sound")
    local id = 10481117326
    music.Volume = 1
    music.PlaybackSpeed = 1
    music.Looped = false
    music.SoundId = "rbxassetid://"..id
    music:Play()
    music.Parent = game:GetService("ReplicatedStorage")
    -- Example: you can do anything here, like triggering an animation, etc.
end

-- Detect when keys are pressed
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        isQPressed = true
    elseif input.KeyCode == Enum.KeyCode.D then
        isDPressed = true
    elseif input.KeyCode == Enum.KeyCode.A then
        isAPressed = true
    end

    -- Check if the correct combination is pressed
    if isQPressed and isDPressed then
        teleportPlayer("Right")
        executeRightScript()
    elseif isQPressed and isAPressed then
        teleportPlayer("Left")
        executeLeftScript()
    end
end)

-- Detect when keys are released
userInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        isQPressed = false
    elseif input.KeyCode == Enum.KeyCode.D then
        isDPressed = false
    elseif input.KeyCode == Enum.KeyCode.A then
        isAPressed = false
    end
end)
