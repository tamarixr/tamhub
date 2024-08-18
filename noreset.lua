loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/hmmm.lua")()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()  -- Get the player's character
local humanoid = character:WaitForChild("Humanoid")                 -- Get the humanoid of the character

-- Function that will run when the player dies
local function onPlayerDeath()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/hmmm.lua")()  -- Replace this with your desired action
    -- You can execute any code here, such as respawn logic, UI updates, etc.
end

-- Connect the Died event to the onPlayerDeath function
humanoid.Died:Connect(onPlayerDeath)
