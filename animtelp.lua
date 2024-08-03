local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local teleportKey = Enum.KeyCode.T -- The key to press for teleporting
local cooldown = 0.9 -- Cooldown time in seconds
local canTeleport = true -- Variable to check if the player can teleport

local animationId = "rbxassetid://15957361339"
local soundId = "rbxassetid://15956555583"

-- Function to play teleportation animation
local function playTeleportAnimation()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = animationId
            local animator = humanoid:FindFirstChildOfClass("Animator")
            if not animator then
                animator = Instance.new("Animator")
                animator.Parent = humanoid
            end
            local animationTrack = animator:LoadAnimation(animation)
            animationTrack:Play()
        end
    end
end

-- Function to play teleportation sound
local function playTeleportSound()
    local character = player.Character
    if character then
        local sound = Instance.new("Sound")
        sound.SoundId = soundId
        sound.Volume = 1
        sound.Parent = character:FindFirstChild("HumanoidRootPart")
        sound:Play()
    end
end

-- Function to teleport the player
local function teleportPlayer()
    local character = player.Character
    if character then
        local targetPosition = mouse.Hit.p
        -- Adjust the target position to avoid teleporting inside the ground
        targetPosition = Vector3.new(targetPosition.X, targetPosition.Y + 5, targetPosition.Z)
        
        -- Teleport the player's character
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(targetPosition)
        end
    end
end

-- Function to handle teleportation with cooldown
local function onTeleportKeyPress()
    if canTeleport then
        canTeleport = false
        playTeleportAnimation()
        playTeleportSound()
        teleportPlayer()
        -- Start cooldown
        wait(cooldown)
        canTeleport = true
    end
end

-- Listen for the teleport key press
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == teleportKey then
        onTeleportKeyPress()
    end
end)
