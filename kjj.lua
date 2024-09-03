local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")

local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://17140902079"
local Anim = Humanoid:LoadAnimation(AnimAnim)
AnimAnim.AnimationId = "rbxassetid://0" -- Reset animation ID
Anim:Play()

-- Local Script

local soundId = 17150550302 -- Correct sound ID

-- Create a new Sound instance
local sound = Instance.new("Sound")
sound.Name = "audio/kj_awakening_song_only"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0 -- Pitch set to 1.0
sound.PlaybackSpeed = 1.0 -- Adjusted playback speed

-- Parent the sound to Workspace
sound.Parent = workspace

-- Play the sound
sound:Play()

-- Local Script

local soundId = 17150550559 -- Correct sound ID

-- Create a new Sound instance
local sound = Instance.new("Sound")
sound.Name = "audio/kj_awakening_Voice_only"
sound.SoundId = "rbxassetid://" .. soundId
sound.Volume = 1
sound.Pitch = 1.0 -- Pitch set to 1.0
sound.PlaybackSpeed = 1.0 -- Adjusted playback speed

-- Parent the sound to Workspace
sound.Parent = workspace

-- Play the sound
sound:Play()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitBatch3 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch3:Clone()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

EmitBatch3.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch3:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1) -- Emit 1 particle
    end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitBatch1 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch1:Clone()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

EmitBatch1.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch1:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1) -- Emit 1 particle
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitBatch1 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch1:Clone()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

EmitBatch1.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch1:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1) -- Emit 1 particle
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitBatch1 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch1:Clone()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

EmitBatch1.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch1:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1) -- Emit 1 particle
    end
end

end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitBatch2 = ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch2:Clone()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

EmitBatch2.Parent = character:WaitForChild("HumanoidRootPart")

for _, child in ipairs(EmitBatch2:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(1) -- Emit 1 particle
    end
end

local fine = game.ReplicatedStorage.Resources.KJEffects["fine...1"].EnableBatch2:Clone()
fine.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(fine:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD1:Clone()
red.Parent = game.Players.LocalPlayer.Character["Right Leg"]
    for _, child in ipairs(red:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red2 = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD2:Clone()
red2.Parent = game.Players.LocalPlayer.Character["Left Leg"]
    for _, child in ipairs(red2:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red3 = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD3:Clone()
red3.Parent = game.Players.LocalPlayer.Character["Left Leg"]
    for _, child in ipairs(red3:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red4 = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD4:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Right Leg"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
wait(8.2)
fine:Destroy()
red:Destroy()
red2:Destroy()
red3:Destroy()
red4:Destroy()
local fine2 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit2"].EmitBatch1:Clone()
fine2.Parent = game.Players.LocalPlayer.Character["Right Arm"]
    for _, child in ipairs(fine2:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
    end
