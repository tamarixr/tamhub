       local player = game.Players.LocalPlayer
repeat wait() until player.Character.Humanoid
local humanoid = player.Character.Humanoid
local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")
debounce = false -- Activate debounce
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://18447913645"
local playAnim = humanoid:LoadAnimation(anim)
anim.AnimationId = "rbxassetid://0"
local Sound = Instance.new("Sound")
Sound.Parent = character
Sound.SoundId = "PutHereSound"
Sound.Playing = true
spawn(function()
wait(1)
debounce = true
end)
playAnim:Play()
playAnim:AdjustSpeed(0.3)
wait(0.3)
playAnim:AdjustSpeed(1)

local Players = game:GetService("Players")
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()

local animationPlayed = false -- Flag to track if the animation has already been played

game.Workspace.Live["Weakest Dummy"].HumanoidRootPart.Touched:Connect(function(hit)
    if hit.Parent == Character and not debounce and not animationPlayed then
        animationPlayed = true -- Mark the animation as played

        -- Play first animation
        anim.AnimationId = "rbxassetid://18447913645"
        local playAnim = humanoid:LoadAnimation(anim)
        anim.AnimationId = "rbxassetid://0"
        playAnim:Play()
        playAnim:AdjustSpeed(0.3)
 
        wait(0.3)
        playAnim:AdjustSpeed(1)
        local Sound2 = Instance.new("Sound")
        Sound2.Parent = character
        Sound2.SoundId = "PutHeresound"
        Sound2.Playing = true
        local Sound3 = Instance.new("Sound")
        Sound3.Parent = character
        Sound3.SoundId = "PutHersound"
        Sound3.Playing = true
        local Sound4 = Instance.new("Sound")
        Sound4.Parent = character
        Sound4.SoundId = "PutHeresound"
        Sound4.Playing = true
        character.Humanoid.WalkSpeed = 0
        character.Humanoid.AutoRotate = false 
        character:WaitForChild("HumanoidRootPart").CFrame = game.Workspace.Live["Weakest Dummy"].HumanoidRootPart.CFrame * CFrame.new(0, 0, -3) * CFrame.Angles(0, math.pi, 0)
        -- Play second animation
        local dummyHumanoid = game.Workspace.Live["Weakest Dummy"]:WaitForChild("Humanoid")
        local animator = dummyHumanoid:WaitForChild("Animator")
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://18447915110"
        local AnimationTrack = animator:LoadAnimation(Anim)
        AnimationTrack:Play()
        wait(1)
local pchar= game.Workspace.Live:FindFirstChild("Weakest Dummy")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    
    wait(0.1)
    -- Wait for the player to load
    local pchar= game.Workspace.Live:FindFirstChild("Weakest Dummy")
    local player = game.Players.LocalPlayer or player.CharacterAdded:Wait()
    local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local LeftArm = game.Players.LocalPlayer.Character:WaitForChild("Left Arm")  -- Assuming Torso exists in your character model
    
    -- Check for Resources folder in ReplicatedStorage
    local resourcesFolder = ReplicatedStorage:WaitForChild("Resources")
    
    -- Check for KJEffects folder inside Resources
    local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")
    
    -- Check for speedlinesandstuff part inside KJEffects
    local speedlinesandstuffPart = kjEffectsFolder:WaitForChild("barrage")
    
    -- Duplicate the speedlinesandstuff part
    local speedlinesandstuffClone = speedlinesandstuffPart:Clone()
    
    -- Calculate the desired CFrame using the player's torso position
    local desiredCFrame = CFrame.new(LeftArm.Position)
    
    -- Set the desired CFrame for the clone
    speedlinesandstuffClone.CFrame = desiredCFrame
    
    -- Put the duplicate in Workspace
    speedlinesandstuffClone.Parent = Workspace
    
    -- Function to enable all ParticleEmitters
    local function enableParticleEmitters(parent)
        for _, descendant in ipairs(parent:GetDescendants()) do
            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = true
            end
        end
    end
    
    -- Example usage after your dash effect completes
    spawn(function()
        -- Simulating end of dash effect
        wait(1)  -- Adjust the wait time as needed
    
        -- Enable all ParticleEmitters inside speedlinesandstuffClone
        enableParticleEmitters(speedlinesandstuffClone)
    end)
    local hit1 = game.ReplicatedStorage.Resources.KJEffects["HitParticles"].Hit:Clone()
    hit1.Parent = game.Players.LocalPlayer.Character["Left Arm"]
        for _, child in ipairs(hit1:GetChildren()) do
            if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                child:Emit(1) -- Emit 20 particles
            end
        end
    wait(2)
    workspace.barrage:Destroy()
    local hit1 = game.ReplicatedStorage.Resources.KJEffects["HitParticles"].Hit:Clone()
    hit1.Parent = game.Players.LocalPlayer.Character["Right Arm"]
        for _, child in ipairs(hit1:GetChildren()) do
            if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                child:Emit(1) -- Emit 20 particles
            end
        end
    wait(1)
    local hit1 = game.ReplicatedStorage.Resources.KJEffects["RUNAROUNDWIND"].RUNAROUNDWIND:Clone()
    hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
        for _, child in ipairs(hit1:GetChildren()) do
            if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                child:Emit(5) -- Emit 20 particles
            end
        end
    
    wait(1)
    
    wait(0.1)
    
    local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
    hit1.Parent = game.Players.LocalPlayer.Character["Torso"]
        for _, child in ipairs(hit1:GetChildren()) do
            if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                child:Emit(1) -- Emit 20 particles
            end
        end
        wait(5) -- Wait before resetting debounce
        debounce = false -- Reset debounce
        character.Humanoid.WalkSpeed = 16
    character.Humanoid.AutoRotate = true 
    end
end)
