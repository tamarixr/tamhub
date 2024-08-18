-- LocalPlayer will be the player running the script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Get the player's HumanoidRootPart (which is needed for teleportation)
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Teleport to every player one by one
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
    if otherPlayer ~= player then -- Skip self
        local otherCharacter = otherPlayer.Character
        if otherCharacter then
            local otherHumanoidRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
            if otherHumanoidRootPart then
                -- Teleport your character to the other player's position
                humanoidRootPart.CFrame = otherHumanoidRootPart.CFrame

                -- Wait a bit before teleporting to the next player
                wait(0.17) -- Adjust the time delay as needed
            end
        end
    end
end
print("caca")
