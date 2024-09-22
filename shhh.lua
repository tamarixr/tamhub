local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

-- Function to reset camera mode
local function ResetCamera()
    -- Set camera to follow the player
    Camera.CameraType = Enum.CameraType.Custom -- Default behavior
    Camera.CameraSubject = Player.Character:WaitForChild("Humanoid")

    -- Optional: Reset camera's CFrame to the player's head position
    local head = Player.Character:WaitForChild("Head")
    Camera.CFrame = CFrame.new(head.Position + Vector3.new(0, 5, -10), head.Position)

    -- Optional: Print a confirmation
    print("Camera has been reset.")
end

-- Call the function to reset the camera
ResetCamera()

local assetId1 = 106958907400060
local assetId2 = 89313780663843
local assetId3 = 136002739245486

-- Alternate assets (when health is below 50)
local lowHealthAssetId1 = 88255598029067
local lowHealthAssetId2 = 76242037949350
local lowHealthAssetId3 = 127841164950641 -- Updated asset ID

local flashAssetId = 'rbxassetid://85252368881408' -- Updated for model asset ID
local soundId = "rbxassetid://18169340129"

-- Load normal scenario effects
local effect1 = game:GetObjects("rbxassetid://" .. assetId1)[1]
local effect2 = game:GetObjects("rbxassetid://" .. assetId2)[1]
local effect3 = game:GetObjects("rbxassetid://" .. assetId3)[1]

-- Load low-health scenario effects
local lowHealthEffect1 = game:GetObjects("rbxassetid://" .. lowHealthAssetId1)[1]
local lowHealthEffect2 = game:GetObjects("rbxassetid://" .. lowHealthAssetId2)[1]
local lowHealthEffect3 = game:GetObjects("rbxassetid://" .. lowHealthAssetId3)[1]

-- Check if the assets are loaded correctly
if not effect1 or not effect2 or not effect3 then
    warn("Error loading normal assets.")
end

if not lowHealthEffect1 or not lowHealthEffect2 or not lowHealthEffect3 then
    warn("Error loading low-health assets.")
end

local sound1 = Instance.new("Sound")
local sound2 = Instance.new("Sound")
local sound3 = Instance.new("Sound")
local sound4 = Instance.new("Sound")

-- Set up sounds
sound1.SoundId = soundId
sound1.Parent = game.Workspace
sound2.SoundId = soundId
sound2.Parent = game.Workspace
sound3.SoundId = soundId
sound3.Parent = game.Workspace
sound4.SoundId = soundId
sound4.Parent = game.Workspace

local player = game.Players.LocalPlayer
local character = player and player.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
local humanoid = character and character:FindFirstChildOfClass("Humanoid")

-- Helper function to load and clean up models
local function loadModelForClient(assetId, position, cleanupTime)
    local success, model = pcall(function()
        return game:GetObjects(assetId)[1]  -- Get the first object in the returned array
    end)

    if success and model then
        if model:IsA("Model") then
            if not model.PrimaryPart then
                model.PrimaryPart = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChildWhichIsA("BasePart")
            end

            if model.PrimaryPart then
                model.Parent = workspace
                model:SetPrimaryPartCFrame(position)

                -- Clean up the model after the specified time
                game:GetService("Debris"):AddItem(model, cleanupTime)
            else
                warn("The model does not have a valid PrimaryPart.")
            end
        else
            warn("The loaded asset is not a model.")
        end
    else
        warn("Failed to load the model. Make sure the asset ID is correct and accessible.")
    end
end

if humanoidRootPart and humanoidRootPart:IsA("BasePart") and humanoid then
    if humanoid.Health < 50 then
        local part1 = lowHealthEffect1:IsA("Folder") and lowHealthEffect1:FindFirstChildWhichIsA("BasePart") or lowHealthEffect1
        local part2 = lowHealthEffect2:IsA("Folder") and lowHealthEffect2:FindFirstChildWhichIsA("BasePart") or lowHealthEffect2
        local part3 = lowHealthEffect3:IsA("Folder") and lowHealthEffect3:FindFirstChildWhichIsA("BasePart") or lowHealthEffect3

        -- Ensure all parts are BaseParts
        if part1 and part1:IsA("BasePart") and part2 and part2:IsA("BasePart") and part3 and part3:IsA("BasePart") then
            part1.Parent = game.Workspace -- Initially parent to workspace
            part2.Parent = character:FindFirstChild("Head") -- Attach part2 to the head
            part3.Parent = game.Workspace

            -- Define parameters for movement and orbiting
            local steps = 50
            local orbitSpeed = 20 -- Orbit speed
            local orbitRadius = 35 -- Orbit radius
            local initialPosition = humanoidRootPart.Position
            local targetPosition = initialPosition + Vector3.new(0, 65, 0)
            local angle = 0 -- Starting angle for the orbit
            local riseDuration = 0.5 -- Time it takes for the player to rise
            local heightIncrease = 50 -- Total height the player should rise
            local initialHipHeight = humanoid.HipHeight -- Store initial hip height

            -- Move part2 upwards and orbit part1 around part2
            for i = 0, steps do
                -- Move part2 upwards
                part2.Position = initialPosition:Lerp(targetPosition, i / steps)
                
                -- Orbit part1 around part2
                angle = angle + orbitSpeed
                local orbitPosition = part2.CFrame * CFrame.new(math.cos(math.rad(angle)) * orbitRadius, 0, math.sin(math.rad(angle)) * orbitRadius)
                part1.CFrame = orbitPosition

                -- Gradually increase HipHeight to make the player rise
                humanoid.HipHeight = initialHipHeight + (heightIncrease / steps) * i

                -- Wait for the next step
                wait(riseDuration / steps)
            end

            part2.Anchored = true -- Anchor part2 so it stays in place at 65 studs
            sound2:Play()

            -- Move part1 towards part2 (next to it)
            local moveDuration = 1 -- Time it takes for part1 to move next to part2
            local moveSteps = 50 -- Number of steps for smooth movement
            local startPosition = part1.Position
            local targetPosition = part2.Position + Vector3.new(-20, 0, 0) -- Move part1 next to part2

            for i = 1, moveSteps do
                part1.Position = startPosition:Lerp(targetPosition, i / moveSteps)
                wait(moveDuration / moveSteps)
            end
           wait(0.5)
            -- Merge part1 into part2
            local mergeDuration = 0.25 -- Time it takes for part1 to merge into part2
            local mergeSteps = 25 -- Number of steps for smooth merging

            for i = 1, mergeSteps do
                part1.CFrame = part1.CFrame:Lerp(part2.CFrame, i / mergeSteps) -- Smoothly merge into part2
                wait(mergeDuration / mergeSteps)
            end

            -- Destroy part1 and part2, and bring in part3
            part1:Destroy()
            part2:Destroy()
            sound1:Destroy()
            sound2:Destroy()

            -- Spawn part3 (the third asset) in the same position as part2
            part3.CFrame = CFrame.new(targetPosition) -- Position part3 where part2 was
            part3.Anchored = true -- Anchor part3 so it doesn’t fall
            sound3:Play() -- Play sound when part3 appears

            -- Wait before adding flash and fourth asset
            wait(0.05)
           -- Function to make the player lay down and anchor for a specific duration
local function makePlayerLayDown(duration)
    -- Get the local player
    local player = game.Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    -- Access the HumanoidRootPart
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    
    -- Store the original position and orientation
    local originalCFrame = rootPart.CFrame
    
    -- Adjust the player's position to lay down
    rootPart.CFrame = rootPart.CFrame * CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(90), 0, 0)
    
    -- Anchor the player's HumanoidRootPart to freeze their movement
    rootPart.Anchored = true
    
    -- Wait for the specified duration
    wait(duration)
    
    -- Reset the player's position and orientation
    rootPart.CFrame = originalCFrame
    
    -- Unanchor the HumanoidRootPart to allow movement again
    rootPart.Anchored = false
end

-- Execute the function with a 1.5-second duration
makePlayerLayDown(1.5)
            -- Add flash asset 5 studs above the player's head
            local flashPosition = humanoidRootPart.Position + Vector3.new(0, 15, 0)
            loadModelForClient(flashAssetId, CFrame.new(flashPosition), 6)
            part3:Destroy()
            local screenGui = Instance.new("ScreenGui")
            local frame = Instance.new("Frame")
            screenGui.Parent = player.PlayerGui
            frame.Parent = screenGui
            frame.BackgroundColor3 = Color3.new(1, 1, 1)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0
            frame.ZIndex = 10

            local flashDuration = 6
            local transparencySteps = 15
            for i = 0, transparencySteps do
                frame.BackgroundTransparency = i / transparencySteps
                humanoid.HipHeight = initialHipHeight
                wait(flashDuration / transparencySteps)
            end
               
            screenGui:Destroy()
            sound3:Destroy()
        else
            warn("One or more of the low-health assets is not a BasePart.")
        end
    else
        -- Normal behavior when health is 50 or higher

        local part1 = effect1:IsA("Folder") and effect1:FindFirstChildWhichIsA("BasePart") or effect1
        local part2 = effect2:IsA("Folder") and effect2:FindFirstChildWhichIsA("BasePart") or effect2
        local part3 = effect3:IsA("Folder") and effect3:FindFirstChildWhichIsA("BasePart") or effect3

        if part1 and part1:IsA("BasePart") and part2 and part2:IsA("BasePart") and part3 and part3:IsA("BasePart") then
            part1.Parent = humanoidRootPart
            local startOffset1 = CFrame.new(8, 1, 5)
            local startOffset2 = CFrame.new(-8, 1, 5)
            local targetOffset = CFrame.new(0, 1, 5)

            part1.CFrame = humanoidRootPart.CFrame * startOffset1
            local weld1 = Instance.new("Weld")
            weld1.Part0 = humanoidRootPart
            weld1.Part1 = part1
            weld1.C0 = startOffset1
            weld1.Parent = humanoidRootPart

            wait(0.85)

            part2.Parent = humanoidRootPart
            part2.CFrame = humanoidRootPart.CFrame * startOffset2
            local weld2 = Instance.new("Weld")
            weld2.Part0 = humanoidRootPart
            weld2.Part1 = part2
            weld2.C0 = startOffset2
            weld2.Parent = humanoidRootPart

            sound1:Play()
            sound2:Play()

            wait(1.5)

            local duration = 1.25
            local steps = 25
            for i = 0, steps do
                local alpha = i / steps
                weld1.C0 = startOffset1:Lerp(targetOffset, alpha)
                weld2.C0 = startOffset2:Lerp(targetOffset, alpha)
                wait(duration / steps)
            end
            wait(1.5)

            part1:Destroy()
            part2:Destroy()

            part3.Parent = game.Workspace
            local startOffset3 = CFrame.new(0, 5, 0)
            local shootDirection = humanoidRootPart.CFrame.LookVector
            local speed = 450

            part3.CFrame = humanoidRootPart.CFrame * startOffset3
            sound3:Play()

            local shootStart = tick()
            local shootDuration = 10

            while tick() - shootStart < shootDuration do
                local elapsed = tick() - shootStart
                local moveAmount = shootDirection * speed * 0.1
                part3.Position = part3.Position + moveAmount
                wait(0.1)
            end

            part3:Destroy()
            sound1:Destroy()
            sound2:Destroy()
            sound3:Destroy()
        else
            warn("One or more of the normal assets is not a BasePart.")
        end
    end
else
    warn("No valid HumanoidRootPart or Humanoid found")
end
