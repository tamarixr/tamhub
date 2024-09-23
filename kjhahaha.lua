local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local topbarPlus = playerGui:WaitForChild("TopbarPlus")
local topbarContainer = topbarPlus:WaitForChild("TopbarContainer")
local unnamedIcon = topbarContainer:WaitForChild("UnnamedIcon")
local dropdownContainer = unnamedIcon:WaitForChild("DropdownContainer")
local dropdownFrame = dropdownContainer:WaitForChild("DropdownFrame")

local charFrame = Instance.new("Frame")
charFrame.Name = "Char"
charFrame.Parent = dropdownFrame
charFrame.BackgroundTransparency = 1
charFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
charFrame.BorderSizePixel = 1
charFrame.LayoutOrder = 14
charFrame.Size = UDim2.new(1, 0, 0, 32)
charFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
charFrame.ZIndex = 1

local iconButton = Instance.new("TextButton")
iconButton.Name = "IconButton"
iconButton.Parent = charFrame
iconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconButton.BackgroundTransparency = 0.5
iconButton.BorderSizePixel = 0
iconButton.Text = ""
iconButton.TextScaled = false
iconButton.TextSize = 8
iconButton.TextTransparency = 1
iconButton.TextWrapped = false
iconButton.Position = UDim2.new(0, 0, 0, 0)
iconButton.Size = UDim2.new(1, 0, 1, 0)
iconButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconButton.Font = Enum.Font.Legacy
iconButton.LayoutOrder = 0

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Parent = iconButton
iconImage.AnchorPoint = Vector2.new(0, 0.5)
iconImage.BackgroundTransparency = 1
iconImage.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconImage.BorderSizePixel = 1
iconImage.Image = "rbxassetid://17140853847"
iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconImage.ImageRectOffset = Vector2.new(0, 0)
iconImage.ImageRectSize = Vector2.new(0, 0)
iconImage.ImageTransparency = 0
iconImage.LayoutOrder = 0
iconImage.Position = UDim2.new(0, 12, 0, 15)
iconImage.Size = UDim2.new(0, 24, 0, 24)
iconImage.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconImage.TileSize = UDim2.new(1, 0, 1, 0)
iconImage.SliceScale = 1
iconImage.ZIndex = 11

local iconLabel = Instance.new("TextLabel")
iconLabel.Name = "IconLabel"
iconLabel.Parent = iconButton
iconLabel.AnchorPoint = Vector2.new(0, 0.5)
iconLabel.BackgroundTransparency = 1
iconLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconLabel.BorderSizePixel = 1
iconLabel.Font = Enum.Font.GothamMedium
iconLabel.LayoutOrder = 0
iconLabel.Text = "KJ"
iconLabel.TextColor3 = Color3.fromRGB(255, 216, 19)
iconLabel.TextSize = 14
iconLabel.TextScaled = false
iconLabel.TextTransparency = 0
iconLabel.TextWrapped = false
iconLabel.TextXAlignment = Enum.TextXAlignment.Left
iconLabel.TextYAlignment = Enum.TextYAlignment.Center
iconLabel.Position = UDim2.new(0, 44, 0, 15)
iconLabel.Size = UDim2.new(1, -56, 0, 7)
iconLabel.TextStrokeTransparency = 1
iconLabel.ZIndex = 11

local function onErrorNotification()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU'RE ALREADY PLAYING AS THIS CHARACTER.";
        Icon = "";
        Duration = 5;
    })
end

local function handleIconButtonClick()
 
local Players = game:GetService("Players")
local player = Players.LocalPlayer
 
if player and player:FindFirstChild("Backpack") then
    local backpack = player.Backpack
 
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            item:Destroy()
        end
    end
end
loadstring(game:HttpGet('https://raw.githubusercontent.com/Gokou300/Gokou300/main/Kj%20moveset%20Source'))()
    local character = player.Character
    if not character then
        return
    end

    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun and scriptHasRun.Value then
        onErrorNotification()
        return
    end

    if not scriptHasRun then
        scriptHasRun = Instance.new("BoolValue")
        scriptHasRun.Name = "ScriptHasRun"
        scriptHasRun.Value = true
        scriptHasRun.Parent = character
    else
        scriptHasRun.Value = true
    end
end

iconButton.MouseButton1Click:Connect(handleIconButtonClick)

print("Script Loaded 0 cap")  -- Debug print to confirm script initialization

player.CharacterAdded:Connect(function(character)
    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end)

if player.Character then
    local scriptHasRun = player.Character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end
