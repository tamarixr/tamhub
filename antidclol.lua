workspace.FallenPartsDestroyHeight = 0/0

if getgenv().loop then
    coroutine.close(getgenv().loop)
    getgenv().loop = nil
end
local animations = {
    ["rbxassetid://11343250001"]=1.31,
}
function ifind(t,a)
    for i,v in pairs(t) do
        if i==a then
            return i
        end
    end
    return false
end
local plr = game.Players.LocalPlayer
getgenv().loop = coroutine.create(function()
    local dothetech = false
    local lastcf
    while task.wait() do 
        local character = plr.Character
        local animate = character.Humanoid.Animator

        for i,v in pairs(animate:GetPlayingAnimationTracks()) do
            if ifind(animations, v.Animation.AnimationId) then
                task.wait(animations[v.Animation.AnimationId])
                dothetech=true
                lastcf = character.HumanoidRootPart.CFrame
                v.Stopped:Connect(function()
                    dothetech=false
                end)
                repeat wait()
                    workspace.Camera.CameraType = Enum.CameraType.Scriptable
                    character.HumanoidRootPart.CFrame = CFrame.new(0,-1000,0)
                    character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                    character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
                until not dothetech
                task.wait(0.1)
                character.HumanoidRootPart.CFrame=lastcf
                workspace.Camera.CameraType = Enum.CameraType.Custom
                workspace.Camera.CameraSubject = character.Humanoid
                task.wait(1)
            end
        end
    end
end)
coroutine.resume(getgenv().loop)
print("caca")
-- Reference to the PlayerAdded event
local Players = game:GetService("Players")

-- Function to handle player death
local function onPlayerDeath(player)
    -- Get the player's character
    local character = player.Character

    -- Check if the character exists
    if character then
        -- Kick the player
        loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/anticdlol.lua")()
        -- Alternatively, you can customize the kick message:
        -- player:Kick("Sorry, you died and got kicked from the game.")
    end
end

-- Connect the function to the PlayerAdded event
Players.PlayerAdded:Connect(function(player)
    -- Connect the onPlayerDeath function to the player's character's death event
    player.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid").Died:Connect(function()
            onPlayerDeath(player)
        end)
    end)
end)
