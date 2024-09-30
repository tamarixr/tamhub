local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local Player = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/fixcam.txt"))()

-- Asset IDs
local assetId1 = 94201630583173
local assetId2 = 91177211996799
local assetId3 = 131603464787296
local assetId4 = 125695196226339 -- Replace with valid asset ID
local assetId5 = 76755377553285 -- Replace with valid asset ID

local soundId = "rbxassetid://18169340129"

-- Load assets
local effect1 = game:GetObjects("rbxassetid://" .. assetId1)[1]
local effect2 = game:GetObjects("rbxassetid://" .. assetId2)[1]
local effect3 = game:GetObjects("rbxassetid://" .. assetId3)[1]
local effect4 = game:GetObjects("rbxassetid://" .. assetId4)[1]
local effect5 = game:GetObjects("rbxassetid://" .. assetId5)[1]

if not effect1 or not effect2 or not effect3 or not effect4 or not effect5 then
    warn("Error loading one or more assets.")
end

local sound1 = Instance.new("Sound")
sound1.SoundId = soundId
sound1.Parent = game.Workspace

local player = Players.LocalPlayer
local character = player and player.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

-- Helper function to darken world and create a spotlight effect
local function darkenWorldAndSpotlight()
    local originalBrightness = Lighting.Brightness
    local originalAmbient = Lighting.Ambient

    -- Darken the world
    Lighting.Brightness = 0.001
    Lighting.Ambient = Color3.new(0, 0, 0)

    -- Set the Time of Day to night
    Lighting.TimeOfDay = "00:00:00"

    -- Set the brightness for night
    Lighting.Brightness = 0.2 -- Lower brightness for night

    local spotlight = Instance.new("PointLight", humanoidRootPart)
    spotlight.Color = Color3.fromRGB(191, 102, 255)
    spotlight.Range = 10
    spotlight.Brightness = 5

    return originalBrightness, originalAmbient, spotlight
end

-- Restore original lighting after spotlight effect
local function restoreLighting(originalBrightness, originalAmbient, spotlight)
    Lighting.Brightness = originalBrightness
    Lighting.Ambient = originalAmbient
    spotlight:Destroy()
    
    -- Reset the Time of Day to normal (daytime)
    Lighting.TimeOfDay = "12:00:00" -- Reset to noon
    -- Optionally reset brightness to default
    Lighting.Brightness = 2 -- You can set this to whatever your default is
end

-- Helper function to create a white flash effect
local function createWhiteFlash()
    local screenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(1, 1, 1)
    frame.BackgroundTransparency = 0
    frame.ZIndex = 10

    wait(0.42) -- Duration of the flash
    frame.BackgroundTransparency = 1

    Debris:AddItem(screenGui, 0.5) -- Clean up after flash
end

-- Function to add and destroy part 3
local function addAndDestroyPart3()
    local part3 = effect3:Clone()
    part3.Parent = humanoidRootPart
    part3.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 1, -6.5)

    -- Destroy part3 after 0.75 seconds
    Debris:AddItem(part3, 0.80)
end

-- Helper function to spawn and move models smoothly
local function moveAndCollideAssets(part1, part2, targetOffset1, targetOffset2, duration, onComplete)
    local steps = 100  -- Increase steps for smoother movement
    for i = 0, steps do
        local alpha = i / steps
        part1.CFrame = part1.CFrame:Lerp(targetOffset1, alpha)
        part2.CFrame = part2.CFrame:Lerp(targetOffset2, alpha)
        wait(duration / steps)
    end
    if onComplete then onComplete() end
end

-- Main logic
if humanoidRootPart then
    local part1 = effect1:Clone()
    local part2 = effect2:Clone()

    part1.Parent = humanoidRootPart
    part2.Parent = humanoidRootPart

    -- Set start offsets further apart for speed
    local startOffset1 = humanoidRootPart.CFrame * CFrame.new(-4, 1, -6.5)  -- Start left
    local startOffset2 = humanoidRootPart.CFrame * CFrame.new(4, 1, -6.5)   -- Start right
    local targetOffset1 = humanoidRootPart.CFrame * CFrame.new(8, 1, -6.5) -- Target position for asset 1
    local targetOffset2 = humanoidRootPart.CFrame * CFrame.new(-8, 1, -6.5)  -- Target position for asset 2

    part1.CFrame = startOffset1
    part2.CFrame = startOffset2

    -- Start a timer to destroy part1 and part2 after 0.75 seconds
    delay(0.75, function()
        part1:Destroy()
        part2:Destroy()

        -- Add part 3 when part1 and part2 are destroyed
        addAndDestroyPart3()
    end)

    -- Move and collide assets to their target positions
    moveAndCollideAssets(part1, part2, targetOffset1, targetOffset2, 1, function()
        -- Other actions after movement, if needed
    end)

    -- Darken world and handle lighting and spotlight effects
    local part4 = effect4:Clone()
    local hand = character:FindFirstChild("Right Arm") or character:FindFirstChild("Left Arm")
    
    part4.Parent = hand
    part4.CFrame = hand.CFrame

    local originalBrightness, originalAmbient, spotlight = darkenWorldAndSpotlight()

    wait(1.40)

    part4:Destroy()

    local part5 = effect5:Clone()
    part5.Parent = humanoidRootPart
    part5.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 5, 0)

    createWhiteFlash() -- Create the flash effect
    restoreLighting(originalBrightness, originalAmbient, spotlight)
    
    local shootDirection = humanoidRootPart.CFrame.LookVector
    local speed = 1000
    local shootStart = tick()
    local shootDuration = 10

    while tick() - shootStart < shootDuration do
        part5.CFrame = part5.CFrame + (shootDirection * speed * 0.1)
        wait(0.1)
    end

    part5:Destroy()
end
