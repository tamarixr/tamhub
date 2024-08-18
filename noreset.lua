loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/antidclol.lua")()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Flag to check if the player has already died
local hasDied = false

-- Function to execute when the player dies
local function onPlayerDeath()
    if not hasDied then
        hasDied = true  -- Set the flag to true to prevent multiple executions
        loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/antidclol.lua")()
        print("caca")-- Replace this with your script or function call
        -- Add your script or function execution here
    end
end

-- Connect to the Died event
local humanoid = character:WaitForChild("Humanoid")
humanoid.Died:Connect(onPlayerDeath)

-- Reset the death flag when the character respawns
player.CharacterAdded:Connect(function(newCharacter)
    hasDied = false  -- Reset the flag when a new character is spawned
    humanoid = newCharacter:WaitForChild("Humanoid")
    humanoid.Died:Connect(onPlayerDeath)
end)
