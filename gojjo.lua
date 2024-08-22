-- LocalScript to add a BillboardGui, Highlight, and a glowing invisible part that follows the player’s head
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local function applyHighlight(character)
    -- Create a Highlight object
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.fromRGB(255, 255, 0) -- White fill color
    highlight.OutlineColor = Color3.fromRGB(255, 255, 200) -- White outline color
    highlight.FillTransparency = 0.9     -- Slight transparency for a subtle effect
    highlight.OutlineTransparency = 0.5 -- Slight transparency for outline
end


-- Function to create the glowing part and make it follow the player's head
local function createGlowingPart(character)
    local head = character:FindFirstChild("Head")
    if not head then
        warn("Head not found in character")
        return
    end

    -- Create the invisible part with a yellow glow
    local glowPart = Instance.new("Part")
    glowPart.Name = "GlowingPart"
    glowPart.Size = Vector3.new(2, 2, 2) -- Size of the part
    glowPart.Anchored = false -- Make it movable
    glowPart.CanCollide = false
    glowPart.Transparency = 1 -- Invisible part
    glowPart.BrickColor = BrickColor.new("Bright yellow") -- Color of the glow effect
    glowPart.Material = Enum.Material.Neon -- Neon material for glowing effect
    glowPart.Parent = Workspace

    -- Create a PointLight for the glowing effect
    local pointLight = Instance.new("PointLight")
    pointLight.Color = Color3.fromRGB(255, 255, 75) -- Yellow glow
    pointLight.Brightness = 1 -- Brightness of the light
    pointLight.Range = 8 -- Range of the light
    pointLight.Parent = glowPart

    -- Update the glowPart's position every frame to follow the head
    local function updatePosition()
        glowPart.CFrame = head.CFrame
    end

    -- Connect the function to the Heartbeat event to update position
    game:GetService("RunService").Heartbeat:Connect(updatePosition)
end

player.CharacterAdded:Connect(function(character)
    -- Wait until the head exists in the character model
    local head = character:WaitForChild("Head")

    -- Create a BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Parent = head
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(0, 200, 0, 50) -- Size of the GUI
    billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Offset above the head
    billboardGui.AlwaysOnTop = true

    -- Create the TextLabel inside the BillboardGui
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fills the entire BillboardGui
    textLabel.BackgroundTransparency = 1 -- Makes the background transparent
    textLabel.Text = "<b><i>HONORED ONE</i></b>" -- Rich text for bold and italic
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text color
    textLabel.Font = Enum.Font.Antique -- Closest match to Times New Roman
    textLabel.TextScaled = true -- Scales the text to fit the label
    textLabel.RichText = true -- Enables rich text formatting
    
    -- Create a UIStroke to simulate a glow effect
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Parent = textLabel
    uiStroke.Thickness = 2 -- Thickness of the stroke around the text
    uiStroke.Color = Color3.fromRGB(255, 255, 50) -- Light blue color for glow effect
    uiStroke.Transparency = 0.5 -- Slight transparency to make it look like a glow
    
    -- Adding a shadow effect for more glow-like appearance
    local textShadow = Instance.new("TextLabel")
    textShadow.Parent = billboardGui
    textShadow.Size = textLabel.Size
    textShadow.Position = textLabel.Position
    textShadow.Text = textLabel.Text
    textShadow.TextColor3 = Color3.fromRGB(255, 255, 0) -- Same as stroke color
    textShadow.TextTransparency = 0.8 -- Higher transparency for shadow
    textShadow.BackgroundTransparency = 1
    textShadow.Font = textLabel.Font
    textShadow.TextScaled = true
    textShadow.RichText = true

    -- Apply the white highlight to the character
    applyHighlight(character)

    -- Create the glowing part with yellow light
    createGlowingPart(character)
end)

-- For the case when the character already exists when the script runs
if player.Character then
    local character = player.Character
    local head = character:WaitForChild("Head")

    -- Create a BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Parent = head
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(0, 200, 0, 50) -- Size of the GUI
    billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Offset above the head
    billboardGui.AlwaysOnTop = true

    -- Create the TextLabel inside the BillboardGui
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fills the entire BillboardGui
    textLabel.BackgroundTransparency = 1 -- Makes the background transparent
    textLabel.Text = "<b><i>HONORED ONE</i></b>" -- Rich text for bold and italic
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text color
    textLabel.Font = Enum.Font.Antique -- Closest match to Times New Roman
    textLabel.TextScaled = true -- Scales the text to fit the label
    textLabel.RichText = true -- Enables rich text formatting
    
    -- Create a UIStroke to simulate a glow effect
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Parent = textLabel
    uiStroke.Thickness = 2 -- Thickness of the stroke around the text
    uiStroke.Color = Color3.fromRGB(255, 255, 0) -- Light blue color for glow effect
    uiStroke.Transparency = 0.5 -- Slight transparency to make it look like a glow
    
    -- Adding a shadow effect for more glow-like appearance
    local textShadow = Instance.new("TextLabel")
    textShadow.Parent = billboardGui
    textShadow.Size = textLabel.Size
    textShadow.Position = textLabel.Position
    textShadow.Text = textLabel.Text
    textShadow.TextColor3 = Color3.fromRGB(255, 255, 0) -- Same as stroke color
    textShadow.TextTransparency = 0.8 -- Higher transparency for shadow
    textShadow.BackgroundTransparency = 1
    textShadow.Font = textLabel.Font
    textShadow.TextScaled = true
    textShadow.RichText = true

    -- Apply the white highlight to the character
    applyHighlight(character)

    -- Create the glowing part with yellow light
    createGlowingPart(character)
end
