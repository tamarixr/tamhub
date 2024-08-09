loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/goku.lua")()

-- Create the Tool
local tool = Instance.new("Tool")
tool.Name = "Instant transmission"
tool.RequiresHandle = false
tool.CanBeDropped = false

-- Add the Tool to the player's Backpack
tool.Parent = game.Players.LocalPlayer.Backpack

-- Function to find the closest player
local function findClosestPlayer()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return nil end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return nil end

    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local otherHumanoidRootPart = otherPlayer.Character.HumanoidRootPart
            local distance = (humanoidRootPart.Position - otherHumanoidRootPart.Position).magnitude

            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    return closestPlayer
end

-- Function to teleport the player to the closest player
local function teleportToClosestPlayer()
    local player = game.Players.LocalPlayer
    local closestPlayer = findClosestPlayer()

    if closestPlayer and closestPlayer.Character then
        local closestHumanoidRootPart = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
        if closestHumanoidRootPart then
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = closestHumanoidRootPart.CFrame * CFrame.new(0, 0, 3)  -- Teleport 3 studs behind the closest player
        end
    end
end

-- Function to execute when the tool is activated
local function onActivated()
    teleportToClosestPlayer()
end

-- Connect the activation function to the tool
tool.Activated:Connect(onActivated)


-- LocalScript to create and animate a text label

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CreditsGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "CreditsLabel"
textLabel.Text = "credits to ur mom and my dad"
textLabel.Size = UDim2.new(0, 300, 0, 50)  -- Width, Height
textLabel.Position = UDim2.new(1, -310, 1, -60) -- Right 10, Bottom 10
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text color
textLabel.TextStrokeTransparency = 0.8 -- Optional: Adds a slight stroke to make text more readable
textLabel.TextScaled = true
textLabel.Parent = screenGui

-- TweenService for animations
local tweenService = game:GetService("TweenService")

-- Tween info for fade and move
local tweenInfo = TweenInfo.new(
    3, -- Time (duration of the animation)
    Enum.EasingStyle.Linear, -- Easing style
    Enum.EasingDirection.InOut, -- Easing direction
    0, -- Number of times to repeat
    false, -- Whether the tween should reverse
    0 -- Delay time before tween starts
)

-- Goal for the tween: Move right and fade out
local tweenGoal = {
    Position = UDim2.new(1, 50, 1, -60), -- Move right by 50 pixels
    TextTransparency = 1 -- Fade out
}

-- Create the tween
local tween = tweenService:Create(textLabel, tweenInfo, tweenGoal)

-- Function to start the tween after 6 seconds
local function startTween()
    wait(6) -- Wait for 6 seconds
    tween:Play() -- Play the tween animation
end

-- Call the function to start the tween
startTween()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")

-- Create BillboardGui
local billboardGui = Instance.new("BillboardGui")
billboardGui.Parent = head
billboardGui.Adornee = head
billboardGui.Size = UDim2.new(0, 40, 0, 100)  -- Adjust size as needed
billboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Adjust height offset as needed
billboardGui.AlwaysOnTop = true

-- Create TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = billboardGui
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Son Goku"
textLabel.TextColor3 = Color3.new(1, 1, 1)  -- White text
textLabel.TextStrokeTransparency = 0.5  -- Add stroke to make text more readable
textLabel.TextScaled = true
textLabel.TextAlign = Enum.TextAlign.Center
textLabel.TextWrapped = true

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")
local RunService = game:GetService("RunService")

-- Function to create an invisible part with a red glow effect
local function createAuraPart(position)
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1) -- 1x1x1 block
    part.Position = position
    part.Anchored = true
    part.CanCollide = false
    part.Color = Color3.fromRGB(255, 0, 0) -- Red color
    part.Transparency = 1 -- Make the part invisible
    part.Parent = workspace -- Parent to workspace or wherever appropriate

    -- Add a PointLight for glowing effect
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(255, 0, 0) -- Red light
    light.Brightness = 2 -- Adjust brightness for the glow
    light.Range = 10 -- Adjust range for the glow
    light.Parent = part

    return part
end

-- Create the aura part
local auraPart = createAuraPart(head.Position)
local duration = 4 -- Duration for the aura to follow
local startTime = tick() -- Record the start time

-- Function to update the aura position
local function updateAura()
    if tick() - startTime < duration then
        -- Update the position to follow the head
        auraPart.Position = head.Position
    else
        -- Remove the aura part after the duration
        auraPart:Destroy()
        RunService.RenderStepped:Disconnect(updateAura)
    end
end

-- Connect the update function to RenderStepped
RunService.RenderStepped:Connect(updateAura)
