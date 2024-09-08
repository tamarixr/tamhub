local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local function startTweening()
    local healthBar = player.PlayerGui.ScreenGui.MagicHealth.Health.Bar.Bar

    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true) -- 1 second duration, loops infinitely

    -- Function to create a new color tween
    local function tweenColor(target, newColor)
        local tween = TweenService:Create(target, tweenInfo, {ImageColor3 = newColor})
        tween:Play()
    end

    -- Loop through random colors smoothly
    while true do
        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        local newColor = Color3.fromRGB(r, g, b)
        tweenColor(healthBar, newColor)
        
        -- Wait for the duration of the tween before changing to a new color
        wait(1)
    end
end

-- Connect to CharacterAdded event to restart after death
player.CharacterAdded:Connect(function()
    wait(1) -- Optional: Wait for the character and UI to load
    startTweening()
end)

-- Start tweening initially
if player.Character then
    startTweening()
end
