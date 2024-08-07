        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.HumanoidRootPart
    else
        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    end
end)

coroutine.wrap(function()
    local RunService = game:GetService("RunService")
    RunService.Heartbeat:Connect(function()
        if Options.invisToggle.Value == true then
            local char = game.Players.LocalPlayer.Character
            local root = char and char:WaitForChild("HumanoidRootPart", 1)
            local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
            if char and root and humanoid then
                local rx, ry, rz = workspace.CurrentCamera.CFrame:ToOrientation()
                root.CFrame = CFrame.new(root.CFrame.p) * CFrame.fromOrientation(0, ry, 0)
                local old = { cframe = root.CFrame, cameraoffset = humanoid.CameraOffset }
                root.CFrame = root.CFrame * CFrame.Angles(0, 0, math.rad(180))
                humanoid.CameraOffset = Vector3.new(0, -3.23, 0)
                local id = "rbxassetid://18182425133"
                local anim = Instance.new("Animation")
                anim.AnimationId = id
                local loaded = humanoid.Animator:LoadAnimation(anim)
                loaded.Priority = Enum.AnimationPriority.Action4
                loaded:Play()
                loaded.TimePosition = 2
                loaded:AdjustSpeed(0)
                RunService.RenderStepped:Wait()
                loaded:Stop()
                humanoid.CameraOffset = old.cameraoffset
                root.CFrame = old.cframe
                for i, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") and v.Transparency ~= 1 then
                        v.Transparency = 0.5
                    end
                end
            end
        else
            local char = game.Players.LocalPlayer.Character
            for i, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency == 0.5 then
                    v.Transparency = 0
                end
            end
        end
    end)
end)()
