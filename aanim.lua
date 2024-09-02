local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local teleportKey = Enum.KeyCode.T -- The key to press for teleporting
local cooldown = 0 -- Cooldown time in seconds
local canTeleport = true -- Variable to check if the player can teleport

local animationId = "rbxassetid://184559639319"
local soundId = "rbxassetid://6995341122"

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
        sound.Volume = 1.25
        sound.Parent = character:FindFirstChild("HumanoidRootPart")
        sound:Play()
    end
end

-- Function to apply black-and-white screen effect
local function applyBlackAndWhiteEffect()
    -- Create a new ColorCorrectionEffect
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    
    -- Set the effect to black and white by reducing saturation
    colorCorrection.Saturation = -1 -- Fully desaturates the screen
    
    -- Parent the effect to the Lighting service
    colorCorrection.Parent = game.Lighting
    
    -- Use Debris service to remove the effect after 0.25 seconds without delaying the script
    game:GetService("Debris"):AddItem(colorCorrection, 0.08)
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
        applyBlackAndWhiteEffect() -- Apply the black-and-white effect
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
