-- Define the animation ID (replace with actual animation ID)
local animationId = "17420452843" -- Replace with the actual animation asset ID

-- Define the animation loader function
local function loadAnimation(character)
    -- Ensure the character has a humanoid
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    -- Create and load the animation
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. animationId
    local animator = Instance.new("Animator")
    animator.Parent = humanoid
    local animationTrack = animator:LoadAnimation(animation)

    -- Play the animation
    animationTrack:Play()
end

-- Connect the function to the player's character spawning
local function onCharacterAdded(character)
    loadAnimation(character)
end

-- Get the player
local player = game.Players.LocalPlayer

-- Connect to the player's character added event
player.CharacterAdded:Connect(onCharacterAdded)

-- If the player already has a character, load the animation immediately
if player.Character then
    loadAnimation(player.Character)
end
