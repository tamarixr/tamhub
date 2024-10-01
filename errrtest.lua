-- Script to explicitly unanchor every part of the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Unanchoring each individual part of the character
if character:FindFirstChild("Head") then
    
    character.Head.Anchored = false
end

if character:FindFirstChild("Torso") then
    
    character.Torso.Anchored = false
elseif character:FindFirstChild("UpperTorso") then
    
    character.UpperTorso.Anchored = false
end

if character:FindFirstChild("LowerTorso") then
    
    character.LowerTorso.Anchored = false
end

if character:FindFirstChild("Left Arm") then
    
    character["Left Arm"].Anchored = false
elseif character:FindFirstChild("LeftUpperArm") then
    
    character.LeftUpperArm.Anchored = false
end

if character:FindFirstChild("Right Arm") then
    
    character["Right Arm"].Anchored = false
elseif character:FindFirstChild("RightUpperArm") then
    
    character.RightUpperArm.Anchored = false
end

if character:FindFirstChild("Left Leg") then
    
    character["Left Leg"].Anchored = false
elseif character:FindFirstChild("LeftUpperLeg") then
    
    character.LeftUpperLeg.Anchored = false
end

if character:FindFirstChild("Right Leg") then
    
    character["Right Leg"].Anchored = false
elseif character:FindFirstChild("RightUpperLeg") then
    
    character.RightUpperLeg.Anchored = false
end

if character:FindFirstChild("HumanoidRootPart") then
    
    character.HumanoidRootPart.Anchored = false
end
