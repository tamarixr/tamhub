local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")

local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://18445236460"
local Anim = Humanoid:LoadAnimation(AnimAnim)
AnimAnim.AnimationId = "rbxassetid://0"
Anim:Play()

local soundId = 18445285190

local sound = Instance.new("Sound")
sound.Name = "audio/kj_awakening_varient_2_sfx_only"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0
sound.PlaybackSpeed = 1.0
sound.Parent = workspace
sound:Play()

local soundId = 18445228824

local sound = Instance.new("Sound")
sound.Name = "Audio/kj_awakening_varient_3_voice_only"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0
sound.PlaybackSpeed = 1.0
sound.Parent = workspace
sound:Play()

local soundId = 18445228136

local sound = Instance.new("Sound")
sound.Name = "Audio/kj_music_varient_2_start"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0
sound.PlaybackSpeed = 1.0
sound.Parent = workspace
sound:Play()

local rushSpeed = 7
local maxForce = Vector3.new(100000, 0, 100000)

local camera = game.Workspace.CurrentCamera
local initialLookVector = camera.CFrame.LookVector
local rushDirection = Vector3.new(initialLookVector.X, 0, initialLookVector.Z).unit

local function initiateRush(character)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = rushDirection * rushSpeed
    bodyVelocity.MaxForce = maxForce
    bodyVelocity.P = 10000
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")

    local function updateRushDirection()
        rushDirection = camera.CFrame.LookVector
        rushDirection = Vector3.new(rushDirection.X, 0, rushDirection.Z).unit
        bodyVelocity.Velocity = rushDirection * rushSpeed
    end

    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        updateRushDirection()
    end)

    local function stopRushEffect()
        bodyVelocity:Destroy()
        connection:Disconnect()
    end

    wait(1.6)
    stopRushEffect()
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function setWalkSpeedToSixteen()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 16
end

if character then
    setWalkSpeedToSixteen()
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    setWalkSpeedToSixteen()
end)

initiateRush(character)

wait(0.2)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitBatch3 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch3:Clone()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

EmitBatch3.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch3:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1)
    end
end

local EmitBatch1 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch1:Clone()
EmitBatch1.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch1:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1)
    end
end

local EmitBatch2 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch2:Clone()
EmitBatch2.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch2:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1)
    end
end
