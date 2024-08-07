local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local playerGui = player:WaitForChild("PlayerGui")

local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Duration of the cutscene and fade
local cutsceneDuration = 3
local fadeDuration = 2

-- Create a ScreenGui and Frame for the fade effect
local screenGui = Instance.new("ScreenGui", playerGui)
local frame = Instance.new("Frame", screenGui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(900, 0, 900, 0) -- Set the size to be 900 times bigger
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 1

-- Create a TextLabel for the "RAMPAGE" text in Chinese
local textLabel = Instance.new("TextLabel", screenGui)
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
textLabel.Size = UDim2.new(0.2, 0, 0.1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "超级赛亚人" -- "RAMPAGE" in Chinese
textLabel.TextColor3 = Color3.new(1, 0, 0)-- Set text color to red
textLabel.TextColor3 = Color3.new(2, 0, 0)
textLabel.TextColor3 = Color3.new(3, 0, 0)
textLabel.TextColor3 = Color3.new(1, 0, 0)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextTransparency = 1

-- TweenInfo for the fade effect
local fadeInInfo = TweenInfo.new(
    fadeDuration, -- Time
    Enum.EasingStyle.Sine, -- EasingStyle
    Enum.EasingDirection.InOut -- EasingDirection
)

local fadeOutInfo = TweenInfo.new(
    fadeDuration, -- Time
    Enum.EasingStyle.Sine, -- EasingStyle
    Enum.EasingDirection.InOut -- EasingDirection
)

-- TweenInfo for the camera movement
local tweenInfo = TweenInfo.new(
    cutsceneDuration, -- Time
    Enum.EasingStyle.Sine, -- EasingStyle
    Enum.EasingDirection.InOut -- EasingDirection
)

-- Initial and final camera CFrame
local initialCFrame = humanoidRootPart.CFrame * CFrame.new(0, -5, 0)
local finalCFrame = humanoidRootPart.CFrame * CFrame.new(0, 2, 2) * CFrame.Angles(0, math.rad(180), 0)

-- Create the Tween for the camera
local cameraTween = TweenService:Create(camera, tweenInfo, {CFrame = finalCFrame})

-- Create Tweens for the fade effect
local fadeInTween = TweenService:Create(frame, fadeInInfo, {BackgroundTransparency = 0})
local fadeOutTween = TweenService:Create(frame, fadeOutInfo, {BackgroundTransparency = 1})

-- Create Tweens for the text transparency
local textFadeInTween = TweenService:Create(textLabel, fadeInInfo, {TextTransparency = 0})
local textFadeOutTween = TweenService:Create(textLabel, fadeOutInfo, {TextTransparency = 1})

-- Function to play the camera cutscene and fade effect
local function playCutscene()
    -- Set initial camera position
    camera.CFrame = initialCFrame
    
    -- Play the fade-in tween for the black screen and text
    fadeInTween:Play()
    textFadeInTween:Play()
    fadeInTween.Completed:Wait()
    
    -- Play the camera tween
    cameraTween:Play()
    cameraTween.Completed:Wait()
    
    -- Play the fade-out tween for the black screen and text
    fadeOutTween:Play()
    textFadeOutTween:Play()
    fadeOutTween.Completed:Wait()
    
    -- Reset the camera to its default behavior
    camera.CameraSubject = character:WaitForChild("Humanoid")
end

-- Start the cutscene
playCutscene()
