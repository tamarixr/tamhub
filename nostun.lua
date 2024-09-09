
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "No Stun Enabled", Description = "No Stun enabled successfully, enjoy!"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 20, Type = "default"}
)

function isNumber(str)
    if tonumber(str) ~= nil or str == 'inf' then
        return true
    end
end

local tspeed = 0.2  -- Slower speed
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

while tpwalking and hb:Wait() and chr and hum and hum.Parent do
    if hum.MoveDirection.Magnitude > 0 then
        if tspeed and isNumber(tspeed) then
            chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
        else
            chr:TranslateBy(hum.MoveDirection)
        end
    end
end
