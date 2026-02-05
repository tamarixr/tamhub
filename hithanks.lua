-- Services
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Variables
local teleportDistance = 25
local isQPressed, isDPressed, isAPressed = false, false, false
local dashEnabled = true
local dashSpeed = 250 -- studs per second
local momentumVelocity = 40 -- initial momentum at dash end
local momentumDecay = 0.9 -- decay factor per frame
local activeDashConnection = nil
local activeMomentum = nil

-- GUI setup (same as before) ---------------------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Parent = screenGui

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 25)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Text = "Dash GUI"
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = topBar

-- Draggable top bar
local dragging, dragInput, dragStart, startPos
local function update(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

topBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

userInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -10, 0, 25)
toggleButton.Position = UDim2.new(0, 5, 0, 30)
toggleButton.Text = "Enable Dash"
toggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 16
toggleButton.Parent = mainFrame

toggleButton.MouseButton1Click:Connect(function()
	dashEnabled = not dashEnabled
	toggleButton.Text = dashEnabled and "Enable Dash" or "Disable Dash"
end)

-- Slider & TextBox
local sliderLabel = Instance.new("TextLabel")
sliderLabel.Text = "Dash Distance: "..teleportDistance
sliderLabel.Size = UDim2.new(1, -10, 0, 20)
sliderLabel.Position = UDim2.new(0, 5, 0, 60)
sliderLabel.BackgroundTransparency = 1
sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sliderLabel.Font = Enum.Font.SourceSans
sliderLabel.TextSize = 14
sliderLabel.Parent = mainFrame

local slider = Instance.new("TextBox")
slider.Size = UDim2.new(1, -10, 0, 25)
slider.Position = UDim2.new(0, 5, 0, 85)
slider.Text = tostring(teleportDistance)
slider.ClearTextOnFocus = false
slider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
slider.TextColor3 = Color3.fromRGB(255, 255, 255)
slider.Font = Enum.Font.SourceSans
slider.TextSize = 14
slider.Parent = mainFrame

slider.FocusLost:Connect(function(enterPressed)
	local val = tonumber(slider.Text)
	if val then
		teleportDistance = val
		sliderLabel.Text = "Dash Distance: "..val
	else
		slider.Text = tostring(teleportDistance)
	end
end)

-- GUI toggle with Right Ctrl
userInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.RightControl then
		mainFrame.Visible = not mainFrame.Visible
	end
end)

-- Fluid micro-TP dash with momentum
local function fluidTpDash(direction)
	if not dashEnabled then return end

	-- Cancel previous dash or momentum
	if activeDashConnection then
		activeDashConnection:Disconnect()
		humanoidRootPart.CanCollide = true
	end
	if activeMomentum then
		activeMomentum:Disconnect()
		activeMomentum = nil
	end

	local dirVector
	if direction == "Right" then
		dirVector = humanoidRootPart.CFrame.RightVector
	elseif direction == "Left" then
		dirVector = -humanoidRootPart.CFrame.RightVector
	else
		return
	end

	local distanceRemaining = teleportDistance
	humanoidRootPart.CanCollide = false

	-- Micro-TP dash
	activeDashConnection = RunService.RenderStepped:Connect(function(deltaTime)
		if distanceRemaining <= 0 then
			humanoidRootPart.CanCollide = true
			activeDashConnection:Disconnect()
			activeDashConnection = nil

			-- Start momentum decay after dash
			local currentVelocity = dirVector * momentumVelocity
			activeMomentum = RunService.RenderStepped:Connect(function()
				humanoidRootPart.Velocity = currentVelocity
				currentVelocity = currentVelocity * momentumDecay
				if currentVelocity.Magnitude < 0.1 then
					humanoidRootPart.Velocity = Vector3.new(0, humanoidRootPart.Velocity.Y, 0)
					activeMomentum:Disconnect()
					activeMomentum = nil
				end
			end)
			return
		end

		local step = math.min(distanceRemaining, dashSpeed * deltaTime)
		humanoidRootPart.CFrame = humanoidRootPart.CFrame + dirVector * step
		distanceRemaining = distanceRemaining - step
	end)
end

-- Animation + sound
local function playDashAnimation(animationId)
	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://"..animationId
	local k = humanoid:LoadAnimation(anim)
	k:Play()
	k:AdjustSpeed(1)
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://10481117326"
	sound.Volume = 1
	sound.PlaybackSpeed = 1
	sound.Looped = false
	sound.Parent = game:GetService("ReplicatedStorage")
	sound:Play()
end

local function executeRightScript()
	playDashAnimation("10480793962")
end

local function executeLeftScript()
	playDashAnimation("10480796021")
end

-- Key detection
userInputService.InputBegan:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if input.KeyCode == Enum.KeyCode.Q then isQPressed = true end
	if input.KeyCode == Enum.KeyCode.D then isDPressed = true end
	if input.KeyCode == Enum.KeyCode.A then isAPressed = true end

	if isQPressed and isDPressed then
		fluidTpDash("Right")
		executeRightScript()
	elseif isQPressed and isAPressed then
		fluidTpDash("Left")
		executeLeftScript()
	end
end)

userInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Q then isQPressed = false end
	if input.KeyCode == Enum.KeyCode.D then isDPressed = false end
	if input.KeyCode == Enum.KeyCode.A then isAPressed = false end
end)
