-- Variables to store the state
local spamSpace = false
local UIS = game:GetService("UserInputService")

-- Function to send notifications
local function sendNotification(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Spacebar Spam";
        Text = message;
        Duration = 2;
    })
end

-- Function to toggle the spacebar spamming
local function toggleSpam()
    spamSpace = not spamSpace
    if spamSpace then
        sendNotification("Spacebar Spam: ON")
    else
        sendNotification("Spacebar Spam: OFF")
        -- Stop sending the space key when toggled off
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    end
end

-- Connect the toggle function to the "P" key
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        toggleSpam()
    end
end)

-- Loop to spam the spacebar when enabled
game:GetService("RunService").RenderStepped:Connect(function()
    if spamSpace then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        wait(0.002)  -- Adjust the speed of spamming here
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    end
end)
