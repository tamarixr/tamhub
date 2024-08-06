local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("1").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Repulse"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("2").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Attract"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("3").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Erase"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("4").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Infinity"
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local playerGui = player:WaitForChild("PlayerGui")
 
 
local function findGuiAndSetText()
 
    local screenGui = playerGui:FindFirstChild("ScreenGui")
 
    if screenGui then
 
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
 
        if magicHealthFrame then
 
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
 
            if textLabel then
 
                textLabel.Text = "?"
 
            end
 
        end
 
    end
 
end
 
 
playerGui.DescendantAdded:Connect(findGuiAndSetText)
 
findGuiAndSetText()

local changeAnim = function(12242894215, 13560306510, 2, 1,3, 1,1)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local yes = humanoid.AnimationPlayed:Connect(function(d)
if d.Animation.AnimationId == "rbxassetid://"..tostring(OGAnim) then
d:Stop()
local pchar= game.Players.LocalPlayer.Character
local AnimationId = tostring(NewAnim)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = pchar:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
k:Play()
k:AdjustWeight(WeightLevel,0)
task.spawn(function()
    repeat task.wait() until k.TimePosition >= AnimTposEnd
    k:Stop(StopSpeed)
    end)
if NewAnimSpeed then
k:AdjustSpeed(NewAnimSpeed)
end
if NewAnimTPos then
k.TimePosition = NewAnimTPos
end
end
end)
end
 
