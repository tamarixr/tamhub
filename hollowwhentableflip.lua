	StopFreecam()
	execCmd('unview')
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until speaker.Character ~= nil
	workspace.CurrentCamera.CameraSubject = speaker.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	speaker.CameraMinZoomDistance = 0.5
	speaker.CameraMaxZoomDistance = 400
	speaker.CameraMode = "Classic"
	speaker.Character.Head.Anchored = false
end)
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



onAnimation("11365563255", function(animation)
    loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowmaxpunch.lua")()
    warn("animation id:", animation.Animation.AnimationId)
end)
