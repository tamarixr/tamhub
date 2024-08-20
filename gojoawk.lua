local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Define the end position (35 studs up)
local upPosition = humanoidRootPart.Position + Vector3.new(0, 35, 0)
local downPosition = humanoidRootPart.Position -- original position

-- Define the tweening information for going up
local upTweenInfo = TweenInfo.new(
    2, -- Time in seconds to go up
    Enum.EasingStyle.Linear, -- Easing style
    Enum.EasingDirection.Out, -- Easing direction
    0, -- Number of times to repeat
    false, -- Should the tween reverse after completing
    0 -- Delay before tween starts
)

-- Create the tween for going up
local upTween = TweenService:Create(humanoidRootPart, upTweenInfo, {Position = upPosition})

-- Define the tweening information for going down
local downTweenInfo = TweenInfo.new(
    1, -- Time in seconds to go down
    Enum.EasingStyle.Linear, -- Easing style
    Enum.EasingDirection.Out, -- Easing direction
    0, -- Number of times to repeat
    false, -- Should the tween reverse after completing
    0 -- Delay before tween starts
)

-- Create the tween for going down
local downTween = TweenService:Create(humanoidRootPart, downTweenInfo, {Position = downPosition})

-- Play the tween to go up
upTween:Play()

-- After 8.75 seconds, play the animation
delay(8.75, function()
    local Player = player -- LocalPlayer reference
    local AnimationId = "18897538537" -- Replace this with your desired animation ID
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k = Player.Character.Humanoid:LoadAnimation(Anim)
    k:Play() -- Play the animation
    k:AdjustSpeed(1.5) -- Adjust the animation speed, change the value to your preference
end)

-- After 5.5 seconds, play the tween to go down
delay(5.5, function()
    downTween:Play()
end)
