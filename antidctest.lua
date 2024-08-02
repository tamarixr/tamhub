local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function DestroyGui()
    PlayerGui:FindFirstChild("Your_Gui"):Destroy()
end

DestroyGui()
