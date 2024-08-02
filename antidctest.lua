local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local voidPosition = Vector3.new(0, -10000, 0)
local originalPosition = humanoidRootPart.CFrame

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        if humanoidRootPart.CFrame == originalPosition then
            humanoidRootPart.CFrame = CFrame.new(voidPosition)
        else
            humanoidRootPart.CFrame = originalPosition
        end
    end
end