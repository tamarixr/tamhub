local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")

local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://18462892217"
local Anim = Humanoid:LoadAnimation(AnimAnim)
AnimAnim.AnimationId = "rbxassetid://0"
Anim:Play()

wait(1.1)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local torso = character:FindFirstChild("Torso")
local workspace = game:GetService("Workspace")

local resourcesFolder = ReplicatedStorage:FindFirstChild("Resources")
if not resourcesFolder then return end

local fiveSeasonsFX = resourcesFolder:FindFirstChild("FiveSeasonsFX")
if not fiveSeasonsFX then return end

local jumpFXModel = fiveSeasonsFX:FindFirstChild("JumpFX")
if not jumpFXModel then return end

local jumpFXPart = jumpFXModel:FindFirstChild("JumpFX")
if not jumpFXPart then return end

local clonedJumpFX = jumpFXPart:Clone()
clonedJumpFX.Parent = workspace

local function emitParticles(instance)
    for _, child in ipairs(instance:GetDescendants()) do
        if child:IsA("ParticleEmitter") then
            child.Enabled = true
            child:Emit(1)
            child.Enabled = false
        end
    end
end

local function positionOnFloor(part)
    if torso then
        local torsoPosition = torso.Position
        local rayOrigin = torsoPosition + Vector3.new(0, 10, 0)
        local rayDirection = Vector3.new(0, -20, 0)
        local raycastResult = workspace:Raycast(rayOrigin, rayDirection)

        if raycastResult then
            part.Position = raycastResult.Position - Vector3.new(0, 0.9, 0)
        end
    end
end

emitParticles(clonedJumpFX)
positionOnFloor(clonedJumpFX)
