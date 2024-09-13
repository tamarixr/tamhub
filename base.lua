local teleportX = 1097
local teleportY = 405
local teleportZ = 23036

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local rootPart = character:WaitForChild("HumanoidRootPart")

rootPart.CFrame = CFrame.new(teleportX, teleportY, teleportZ)

wait(2.5)

local teleportX = 147
local teleportY = 440
local teleportZ = 23

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local rootPart = character:WaitForChild("HumanoidRootPart")

rootPart.CFrame = CFrame.new(teleportX, teleportY, teleportZ)
