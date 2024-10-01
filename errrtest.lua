-- Script to explicitly unanchor every part of the player's character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Unanchoring each individual part of the character
if character:FindFirstChild("Head") then
    wait(0.1)
    character.Head.Anchored = false
end

if character:FindFirstChild("Torso") then
    wait(0.1)
    character.Torso.Anchored = false
elseif character:FindFirstChild("UpperTorso") then
    wait(0.1)
    character.UpperTorso.Anchored = false
end

if character:FindFirstChild("LowerTorso") then
    wait(0.1)
    character.LowerTorso.Anchored = false
end

if character:FindFirstChild("Left Arm") then
    wait(0.1)
    character["Left Arm"].Anchored = false
elseif character:FindFirstChild("LeftUpperArm") then
    wait(0.1)
    character.LeftUpperArm.Anchored = false
end

if character:FindFirstChild("Right Arm") then
    wait(0.1)
    character["Right Arm"].Anchored = false
elseif character:FindFirstChild("RightUpperArm") then
    wait(0.1)
    character.RightUpperArm.Anchored = false
end

if character:FindFirstChild("Left Leg") then
    wait(0.1)
    character["Left Leg"].Anchored = false
elseif character:FindFirstChild("LeftUpperLeg") then
    wait(0.1)
    character.LeftUpperLeg.Anchored = false
end

if character:FindFirstChild("Right Leg") then
    wait(0.1)
    character["Right Leg"].Anchored = false
elseif character:FindFirstChild("RightUpperLeg") then
    wait(0.1)
    character.RightUpperLeg.Anchored = false
end

if character:FindFirstChild("HumanoidRootPart") then
    wait(0.1)
    character.HumanoidRootPart.Anchored = false
end
