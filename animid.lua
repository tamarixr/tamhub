local lp = game:GetService("Players").LocalPlayer
local function init(c)
    local h = c and c:WaitForChild("Humanoid", 1)
    if c and h then
        local a = {}
        h.AnimationPlayed:Connect(function(v)
            if not table.find(a, v.Animation.AnimationId) then
                table.insert(a, v.Animation.AnimationId)
                warn("Animation:", v.Animation.AnimationId)
            end
        end)
    end
end

init(lp.Character)
lp.CharacterAdded:Connect(init)
