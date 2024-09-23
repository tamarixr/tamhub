local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

-- Function to reset camera mode
local function ResetCamera()
    Camera.CameraType = Enum.CameraType.Custom
    Camera.CameraSubject = Player.Character:WaitForChild("Humanoid")
    local head = Player.Character:WaitForChild("Head")
    Camera.CFrame = CFrame.new(head.Position + Vector3.new(0, 5, -10), head.Position)
    print("Camera has been reset.")
end

ResetCamera()

-- Low-health assets (when health is below 50)
local lowHealthAssetId1 = 88255598029067
local lowHealthAssetId2 = 76242037949350
local lowHealthAssetId3 = 127841164950641

-- High-health assets (when health is above 50)
local highHealthAssetId1 = 76242037949350
local highHealthAssetId2 = 118307365422277

local flashAssetId = 'rbxassetid://85252368881408'
local soundId = "rbxassetid://18169340129"

-- Load low-health scenario effects
local lowHealthEffect1 = game:GetObjects("rbxassetid://" .. lowHealthAssetId1)[1]
local lowHealthEffect2 = game:GetObjects("rbxassetid://" .. lowHealthAssetId2)[1]
local lowHealthEffect3 = game:GetObjects("rbxassetid://" .. lowHealthAssetId3)[1]

-- Load high-health scenario effects
local highHealthEffect1 = game:GetObjects("rbxassetid://" .. highHealthAssetId1)[1]
local highHealthEffect2 = game:GetObjects("rbxassetid://" .. highHealthAssetId2)[1]

-- Sound setup
local sound1 = Instance.new("Sound")
local sound2 = Instance.new("Sound")
local sound3 = Instance.new("Sound")
sound1.SoundId = soundId
sound2.SoundId = soundId
sound3.SoundId = soundId
sound1.Parent = workspace
sound2.Parent = workspace
sound3.Parent = workspace

local player = Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
local humanoid = character:FindFirstChildOfClass("Humanoid")
local rightHand = character:FindFirstChild("Torso") or character:FindFirstChild("Upper Torso")

-- Function to load model and clean up
local function loadModelForClient(assetId, position, cleanupTime)
    local success, model = pcall(function() return game:GetObjects(assetId)[1] end)
    if success and model then
        if model:IsA("Model") then
            if not model.PrimaryPart then
                model.PrimaryPart = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChildWhichIsA("BasePart")
            end
            if model.PrimaryPart then
                model.Parent = workspace
                model:SetPrimaryPartCFrame(position)
                game:GetService("Debris"):AddItem(model, cleanupTime)
            else
                warn("Model has no valid PrimaryPart.")
            end
        else
            warn("Loaded asset is not a model.")
        end
    else
        warn("Failed to load model.")
    end
end

if humanoidRootPart and humanoid then
    -- Low health condition
    if humanoid.Health < 50 then
        local part1 = lowHealthEffect1:IsA("Folder") and lowHealthEffect1:FindFirstChildWhichIsA("BasePart") or lowHealthEffect1
        local part2 = lowHealthEffect2:IsA("Folder") and lowHealthEffect2:FindFirstChildWhichIsA("BasePart") or lowHealthEffect2
        local part3 = lowHealthEffect3:IsA("Folder") and lowHealthEffect3:FindFirstChildWhichIsA("BasePart") or lowHealthEffect3

        if part1 and part1:IsA("BasePart") and part2 and part2:IsA("BasePart") and part3 and part3:IsA("BasePart") then
            part1.Parent = workspace
            part2.Parent = workspace
            part3.Parent = workspace

            -- Orbit and merge logic
            local steps = 100
            local orbitRadius = 50
            local orbitSpeed = 20
            local mergeSpeed = 0.5
            local angle1, angle2 = 0, 180  -- Starting angles for the orbit
            local centerPosition = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 75 -- In front of the player

            -- Orbit and gradually merge part1 and part2
            for i = 1, steps do
                -- Orbit part1 and part2 around the center position
                angle1 = angle1 + orbitSpeed
                angle2 = angle2 + orbitSpeed
                local position1 = centerPosition + Vector3.new(math.cos(math.rad(angle1)) * orbitRadius, 0, math.sin(math.rad(angle1)) * orbitRadius)
                local position2 = centerPosition + Vector3.new(math.cos(math.rad(angle2)) * orbitRadius, 0, math.sin(math.rad(angle2)) * orbitRadius)

                -- Update positions
                part1.CFrame = CFrame.new(position1)
                part2.CFrame = CFrame.new(position2)

                -- Gradually reduce orbit radius to make parts get closer
                orbitRadius = orbitRadius - mergeSpeed
                wait(0.05)
            end

            -- Merge part1 and part2
            for i = 1, 25 do
                part1.CFrame = part1.CFrame:Lerp(part2.CFrame, i / 25)
                wait(0.02)
            end

            -- Destroy part1 and part2, and spawn part3
            part1:Destroy()
            part2:Destroy()
            part3.CFrame = CFrame.new(centerPosition)
            part3.Anchored = true
            sound3:Play()

            -- Flash effect
            wait(0.05)
            local flashPosition = humanoidRootPart.Position + Vector3.new(0, 15, 0)
            loadModelForClient(flashAssetId, CFrame.new(flashPosition), 6)
            part3:Destroy()

            -- Screen flash effect
            local screenGui = Instance.new("ScreenGui")
            local frame = Instance.new("Frame")
            screenGui.Parent = player.PlayerGui
            frame.Parent = screenGui
            frame.BackgroundColor3 = Color3.new(1, 1, 1)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0
            frame.ZIndex = 10

            -- Fade out flash
            local flashDuration = 6
            local transparencySteps = 15
            for i = 0, transparencySteps do
                frame.BackgroundTransparency = i / transparencySteps
                wait(flashDuration / transparencySteps)
            end
            screenGui:Destroy()
            sound3:Destroy()

        else
            warn("One or more of the low-health assets is not a BasePart.")
        end

    -- High health condition
    elseif humanoid.Health > 50 then
        local part1 = highHealthEffect1:IsA("Folder") and highHealthEffect1:FindFirstChildWhichIsA("BasePart") or highHealthEffect1
        local part2 = highHealthEffect2:IsA("Folder") and highHealthEffect2:FindFirstChildWhichIsA("BasePart") or highHealthEffect2

        if part1 and part1:IsA("BasePart") and part2 and part2:IsA("BasePart") then
            -- Set part1 to start at the player's hand
            part1.Parent = workspace
            part1.CFrame = rightHand.CFrame

            -- Define target position 35 studs away from the hand
            local targetPosition = rightHand.CFrame * CFrame.new(0, 0, -95)

            -- Shoot part1 out 35 studs away from the player's hand
            local steps = 50
            local shootDuration = 0.5

            for i = 1, steps do
                part1.CFrame = part1.CFrame:Lerp(targetPosition, i / steps)
                wait(shootDuration / steps)
            end

            sound1:Play() -- Play sound when part1 shoots out

            -- Add part2 at the location of part1 after 1 second
            wait(4)

            -- Destroy part1 when part2 spawns
            part1:Destroy()
            
            part2.Parent = workspace
            part2.CFrame = targetPosition -- Spawn part2 at the position of part1
            sound2:Play() -- Play sound when part2 is added

            -- Add flash effect when part2 spawns
                     -- Add screen-wide flash effect (no flash asset model)
            local screenGui = Instance.new("ScreenGui")
            local frame = Instance.new("Frame")
            screenGui.Parent = player.PlayerGui
            frame.Parent = screenGui
            frame.BackgroundColor3 = Color3.new(1, 1, 1)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0
            frame.ZIndex = 10

            local flashDuration = 4
            local transparencySteps = 5
            for i = 0, transparencySteps do
                frame.BackgroundTransparency = i / transparencySteps
                wait(flashDuration / transparencySteps)
            end
            part2:Destroy()
            screenGui:Destroy()
        else
            warn("One or more high-health assets is not a BasePart.")
        end
    end
end
