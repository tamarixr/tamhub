-- This script will delete parts named "NoRotate", "Freeze", and the "CameraRig" model from the character.

local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()  -- For LocalScript: gets the character of the player.
-- For ServerScript, you would use something like:
-- local character = game.Workspace:WaitForChild("YourCharacterName")

while true do
    -- Wait for 0.05 seconds to avoid overloading the game
    wait(0.05)
    
    -- Loop through all parts and models in the character
    for _, obj in ipairs(character:GetDescendants()) do
        -- Check if the part is named "NoRotate" or "Freeze" or if it's the "CameraRig" model
        if obj.Name == "NoRotate" or obj.Name == "CameraRig" then
            -- Delete the part or model
            obj:Destroy()
        end
    end
end
