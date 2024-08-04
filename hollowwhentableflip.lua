local id = "11365563255"

local function anim()
    local char = game:GetService("Players").LocalPlayer.Character
    local humanoid = char and char:WaitForChild("Humanoid", 1)
    if char and humanoid then
        humanoid.AnimationPlayed:Connect(function(v)
            local vID = v.Animation.AnimationId:gsub("rbxassetid://", "")
            if id == vID then
                loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowmaxpunch.lua")()
            end
        end)
    end
end

anim()
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(anim)
