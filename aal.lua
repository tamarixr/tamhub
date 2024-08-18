function onAnimation(id, func)
    local id = tostring(id):gsub("rbxassetid://", "")
    
    local char = game:GetService("Players").LocalPlayer.Character
    local humanoid = char and char:WaitForChild("Humanoid", 1)
    if char and humanoid then
        humanoid.AnimationPlayed:Connect(function(v)
            local vID = v.Animation.AnimationId:gsub("rbxassetid://", "")
            if id == vID then
                func(v)
            end
        end)
    end
    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
        local humanoid = char and char:WaitForChild("Humanoid", 1)
        if char and humanoid then
            humanoid.AnimationPlayed:Connect(function(v)
                local vID = v.Animation.AnimationId:gsub("rbxassetid://", "")
                if id == vID then
                    func(v)
                end
            end)
        end
    end)
end



onAnimation("13362587853", function(animation)
        loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/alll.lua")()
end)
