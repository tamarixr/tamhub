-- Obfuscated script
local a = "rbxassetid://16719053698"
local b = 999999
local c = 0
local d = game:GetService("Players")
local e = game:GetService("RunService")
local f = game:GetService("UserInputService")
local g = game:GetService("GuiService")
local h = d.LocalPlayer
local i = h.Character or h.CharacterAdded:Wait()
local j = i:WaitForChild("Humanoid")
local k = false
local l = nil
local m = function()
    local n = Instance.new("Animation")
    n.AnimationId = a
    local o = j:LoadAnimation(n)
    o.Looped = true
    return o
end
local p = function()
    if not l then
        l = m()
    end
    if not l.IsPlaying then
        l:Play(0, 1, b)
    end
end
local q = function()
    if l and l.IsPlaying then
        l:Stop()
    end
end
local r = function(s, t)
    if t then
        return
    end
    if s.KeyCode == Enum.KeyCode.T then
        if k then
            q()
        else
            k = true
            while k do
                p()
                e.RenderStepped:Wait()
                wait(c / 1000)
            end
        end
        k = not k
    end
end
local u = function()
    local v = Instance.new("ScreenGui", h.PlayerGui)
    local w = Instance.new("TextLabel", v)
    w.Size = UDim2.new(0, 200, 0, 50)
    w.Position = UDim2.new(0.5, -100, 0, 10)
    w.Text = "Made by tamari"
    w.TextScaled = true
    w.BackgroundTransparency = 1
    w.TextColor3 = Color3.new(1, 1, 1)
end
u()
f.InputBegan:Connect(r)
i.AncestryChanged:Connect(
    function(x, y)
        if y == workspace then
            j = i:WaitForChild("Humanoid")
            if k then
                p()
            end
        end
    end
)
