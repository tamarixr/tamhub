-- LocalScript to add a BillboardGui and Highlight to the local player's head
local player = game.Players.LocalPlayer

local function applyHighlight(character)
    -- Create a Highlight object
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.fromRGB(255, 255, 150) -- White fill color
    highlight.OutlineColor = Color3.fromRGB(255, 255, 235) -- White outline color
    highlight.FillTransparency = 0.8 -- Slight transparency for a subtle effect
    highlight.OutlineTransparency = 0.5 -- Slight transparency for outline
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
    uiStroke.Color = Color3.fromRGB(255, 255,50) -- Light blue color for glow effect
    uiStroke.Transparency = 0.5 -- Slight transparency to make it look like a glow
    
    -- Adding a shadow effect for more glow-like appearance
    local textShadow = Instance.new("TextLabel")
    textShadow.Parent = billboardGui
    textShadow.Size = textLabel.Size
    textShadow.Position = textLabel.Position
    textShadow.Text = textLabel.Text
    textShadow.TextColor3 = Color3.fromRGB(0, 170, 255) -- Same as stroke color
    textShadow.TextTransparency = 0.8 -- Higher transparency for shadow
    textShadow.BackgroundTransparency = 1
    textShadow.Font = textLabel.Font
    textShadow.TextScaled = true
    textShadow.RichText = true

    -- Apply the white highlight to the character
    applyHighlight(character)
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
end
