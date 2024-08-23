local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return end -- Exit if the player's character is not loaded yet

local speedFactor = 1.98 -- Speed factor to adjust tween durations
local effectDistance = 7 -- Distance to place effects in front of the player (increased from 3 to 6)

local function flipAndPositionCFrame(baseCFrame, distance)
    -- Flip the effect and position it a bit further from the player
    return baseCFrame * CFrame.new(0, 0, -distance) * CFrame.Angles(0, math.pi, 0)
end

-- Function to ensure the model has a PrimaryPart set
local function ensurePrimaryPart(model)
    if not model.PrimaryPart then
        -- Set PrimaryPart to the first part found if not set
        model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
    end
end

-- Clone and setup effects
local wallFX = game.ReplicatedStorage.Resources.Sorcerer.WallFX:Clone()
ensurePrimaryPart(wallFX)
wallFX.Parent = workspace.Thrown
wallFX:SetPrimaryPartCFrame(flipAndPositionCFrame(humanoidRootPart.CFrame, effectDistance)) -- Flipping and positioning

local lighting = game.ReplicatedStorage.Resources.Sorcerer.Lighting:Clone()
lighting.Parent = game.Lighting

local limitlessBarrier = game.ReplicatedStorage.Resources.Sorcerer.LimitlessBarrier:Clone()
ensurePrimaryPart(limitlessBarrier)
limitlessBarrier.Parent = workspace.Thrown
limitlessBarrier:SetPrimaryPartCFrame(flipAndPositionCFrame(humanoidRootPart.CFrame, effectDistance)) -- Flipping and positioning

-- Cleanup the limitless barrier after adjusted time
task.delay(10 / speedFactor, function()
    limitlessBarrier:Destroy()
end)

local sphere = limitlessBarrier.Sphere

-- Emit particles after a short delay
task.delay(0.085 / speedFactor, function()
    for _, particleEmitter in pairs(wallFX.FirstSlam:GetDescendants()) do
        if particleEmitter:IsA("ParticleEmitter") then
            particleEmitter:Emit(particleEmitter:GetAttribute("EmitCount"))
        end
    end
end)

task.delay(1.26 / speedFactor, function()
    task.spawn(function()
        local colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.Name = "cloned"
        colorCorrection.Parent = game.Lighting

        local barrierScreen = lighting.BarrierScreen
        TweenService:Create(colorCorrection, TweenInfo.new(0.35 / speedFactor, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Brightness = barrierScreen.Brightness,
            Contrast = barrierScreen.Contrast,
            Saturation = barrierScreen.Saturation,
            TintColor = barrierScreen.TintColor
        }):Play()

        task.wait(2 / speedFactor)
        TweenService:Create(colorCorrection, TweenInfo.new(0.6 / speedFactor, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Brightness = 0,
            Contrast = 0,
            Saturation = 0
        }):Play()
        
        task.wait(1 / speedFactor)
        colorCorrection:Destroy()
    end)

    task.spawn(function()
        wallFX.Final.BarrierCrater.Transparency = 0
        wallFX.Final.FinalCrater.Transparency = 0
        wallFX.Final.FinalCrater.Color3 = Color3.fromRGB(100, 600, 2000)

        TweenService:Create(wallFX.Final.FinalCrater, TweenInfo.new(4 / speedFactor, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
            Color3 = Color3.fromRGB(0, 0, 0),
            Transparency = 1
        }):Play()

        task.wait(5 / speedFactor)
        TweenService:Create(wallFX.Final.BarrierCrater, TweenInfo.new(3 / speedFactor, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
            Transparency = 1
        }):Play()
    end)

    task.spawn(function()
        local camera = workspace.CurrentCamera
        TweenService:Create(camera, TweenInfo.new(0.6 / speedFactor, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            FieldOfView = 80
        }):Play()

        task.wait(2.14 / speedFactor)
        TweenService:Create(camera, TweenInfo.new(1.35 / speedFactor, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            FieldOfView = 65
        }):Play()
    end)

    local appear = limitlessBarrier.Core.Appear
    for _, particleEmitter in pairs(appear:GetDescendants()) do
        if particleEmitter:IsA("ParticleEmitter") then
            particleEmitter:Emit(particleEmitter.Name)
        end
    end

    local barrierFX = limitlessBarrier.Core.BarrierFX
    for _, particleEmitter in pairs(barrierFX:GetDescendants()) do
        if particleEmitter:IsA("ParticleEmitter") then
            particleEmitter.Enabled = true
        end
    end

    task.delay(2 / speedFactor, function()
        local barrierFX = limitlessBarrier.Core.BarrierFX
        for _, particleEmitter in pairs(barrierFX:GetDescendants()) do
            if particleEmitter:IsA("ParticleEmitter") then
                particleEmitter.Enabled = false
            end
        end
    end)

    local beamRings = limitlessBarrier.Core.BeamRings
    for _, beam in pairs(beamRings:GetDescendants()) do
        if beam:IsA("Beam") then
            beam.Enabled = true
            TweenService:Create(beam, TweenInfo.new(2.15 / speedFactor, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Brightness = 0
            }):Play()
        end
    end

    local function createFlippedWindRing(rotationAngle)
        local windRing = limitlessBarrier.WindRing:Clone()
        ensurePrimaryPart(windRing)
        windRing:SetPrimaryPartCFrame(flipAndPositionCFrame(humanoidRootPart.CFrame, effectDistance))

        local start = windRing.Start
        local endPos = windRing.End

        local clonedMesh = start:Clone()
        clonedMesh.Name = "ClonedMesh"
        clonedMesh.Parent = limitlessBarrier.CurrentTweens

        TweenService:Create(clonedMesh.Decal, TweenInfo.new(0.2 / speedFactor, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.9
        }):Play()

        TweenService:Create(clonedMesh, TweenInfo.new(1 / speedFactor, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = endPos.Size,
            CFrame = endPos.CFrame
        }):Play()

        TweenService:Create(clonedMesh.Mesh, TweenInfo.new(1 / speedFactor, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Scale = endPos.Mesh.Scale
        }):Play()

        task.wait(0.2 / speedFactor)
        TweenService:Create(clonedMesh.Decal, TweenInfo.new(1 / speedFactor, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Transparency = 1
        }):Play()

        task.wait(1.2 / speedFactor)
        clonedMesh:Destroy()
    end

    local function createFlippedSphereEffect()
        local randomSize = Random.new():NextNumber(24, 26)
        local clonedSphere = sphere:Clone()
        clonedSphere.Name = "Cloned"
        clonedSphere.Parent = limitlessBarrier.CurrentTweens
        clonedSphere.CFrame = flipAndPositionCFrame(humanoidRootPart.CFrame, effectDistance)

        TweenService:Create(clonedSphere, TweenInfo.new(0.3 / speedFactor, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Size = Vector3.new(randomSize, randomSize, randomSize),
            Transparency = 3.65
        }):Play()

        task.wait(0.3 / speedFactor)
        TweenService:Create(clonedSphere, TweenInfo.new(0.3 / speedFactor, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Size = Vector3.new(0, 0, 0),
            Transparency = 1
        }):Play()

        task.wait(0.3 / speedFactor)
        clonedSphere:Destroy()
    end

    task.spawn(function()
        for i = 1, 13 do
            spawn(function() createFlippedSphereEffect() end)
            task.wait(0.15 / speedFactor)
        end
    end)

    for i = 1, 13 do
        spawn(function() createFlippedWindRing() end)
        task.wait(0.15 / speedFactor)
    end
end)

task.delay(3.8 / speedFactor, function()
    local endEmit = limitlessBarrier.Core.EndEmit
    for _, particleEmitter in pairs(endEmit:GetDescendants()) do
        if particleEmitter:IsA("ParticleEmitter") then
            particleEmitter:Emit(particleEmitter:GetAttribute("EmitCount"))
        end
    end

    local final = wallFX.Final
    for _, particleEmitter in pairs(final:GetDescendants()) do
        if particleEmitter:IsA("ParticleEmitter") then
            particleEmitter:Emit(particleEmitter:GetAttribute("EmitCount"))
        end
    end

    task.spawn(function()
        local impactFrameWhite = lighting.ImpactFrameWhite
        impactFrameWhite.Enabled = true
        task.wait(0.045 / speedFactor)
        impactFrameWhite.Enabled = false
        impactFrameWhite.Enabled = true
        task.wait(0.045 / speedFactor)
        impactFrameWhite.Enabled = false

        local clonedBarrierFinal = lighting.BarrierFinal:Clone()
        clonedBarrierFinal.Name = "cloned2"
        clonedBarrierFinal.Parent = game.Lighting
        TweenService:Create(clonedBarrierFinal, TweenInfo.new(0.6 / speedFactor, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Brightness = 0,
            Contrast = 0,
            Saturation = 0,
            TintColor = Color3.fromRGB(255, 255, 255)
        }):Play()

        task.wait(1.5 / speedFactor)
        clonedBarrierFinal:Destroy()
    end)

    task.spawn(function()
        local camera = workspace.CurrentCamera
        TweenService:Create(camera, TweenInfo.new(0.2 / speedFactor, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            FieldOfView = 98
        }):Play()

        task.wait(0.2 / speedFactor)
        TweenService:Create(camera, TweenInfo.new(0.5 / speedFactor, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            FieldOfView = 70
        }):Play()
    end)

    task.spawn(function()
        local windRing = limitlessBarrier.WindRing:Clone()
        ensurePrimaryPart(windRing)
        windRing:SetPrimaryPartCFrame(flipAndPositionCFrame(humanoidRootPart.CFrame, effectDistance))

        local start = windRing.Start
        local endPos = windRing.End2

        local clonedMesh = start:Clone()
        clonedMesh.Name = "ClonedMesh"
        clonedMesh.Parent = limitlessBarrier.CurrentTweens

        TweenService:Create(clonedMesh.Decal, TweenInfo.new(0.2 / speedFactor, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.9
        }):Play()

        TweenService:Create(clonedMesh, TweenInfo.new(5 / speedFactor, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Size = endPos.Size,
            CFrame = endPos.CFrame
        }):Play()

        TweenService:Create(clonedMesh.Mesh, TweenInfo.new(5 / speedFactor, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Scale = endPos.Mesh.Scale
        }):Play()

        task.wait(0.2 / speedFactor)
        TweenService:Create(clonedMesh.Decal, TweenInfo.new(5 / speedFactor, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Transparency = 1
        }):Play()

        task.wait(5.2 / speedFactor)
        clonedMesh:Destroy()
    end)

    local function createFlippedFinalSphereEffect()
        local randomSize = Random.new():NextNumber(55, 50)
        local clonedSphere = sphere:Clone()
        clonedSphere.Name = "Cloned"
        clonedSphere.Transparency = 0.01
        clonedSphere.Material = Enum.Material.Neon
        clonedSphere.Color = Color3.fromRGB(84, 150, 194)
        clonedSphere.Parent = limitlessBarrier.CurrentTweens
        clonedSphere.CFrame = flipAndPositionCFrame(humanoidRootPart.CFrame, effectDistance)

        TweenService:Create(clonedSphere, TweenInfo.new(0.2 / speedFactor, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = Vector3.new(randomSize, randomSize, randomSize),
            Transparency = 1
        }):Play()

        task.wait(0.2 / speedFactor)
        clonedSphere:Destroy()
    end

    for i = 1, 5 do
        spawn(function() createFlippedFinalSphereEffect() end)
        task.wait(0.065 / speedFactor)
    end
end)
