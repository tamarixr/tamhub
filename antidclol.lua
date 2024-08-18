workspace.FallenPartsDestroyHeight = 0/0

if getgenv().loop then
    coroutine.close(getgenv().loop)
    getgenv().loop = nil
end
local animations = {
    ["rbxassetid://11343250001"]=1.31,
}
function ifind(t,a)
    for i,v in pairs(t) do
        if i==a then
            return i
        end
    end
    return false
end
local plr = game.Players.LocalPlayer
getgenv().loop = coroutine.create(function()
    local dothetech = false
    local lastcf
    while task.wait() do 
        local character = plr.Character
        local animate = character.Humanoid.Animator

        for i,v in pairs(animate:GetPlayingAnimationTracks()) do
            if ifind(animations, v.Animation.AnimationId) then
                task.wait(animations[v.Animation.AnimationId])
                dothetech=true
                lastcf = character.HumanoidRootPart.CFrame
                v.Stopped:Connect(function()
                    dothetech=false
                end)
                repeat wait()
                    workspace.Camera.CameraType = Enum.CameraType.Scriptable
                    character.HumanoidRootPart.CFrame = CFrame.new(0,-1000,0)
                    character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                    character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
                until not dothetech
                task.wait(0.1)
                character.HumanoidRootPart.CFrame=lastcf
                workspace.Camera.CameraType = Enum.CameraType.Custom
                workspace.Camera.CameraSubject = character.Humanoid
                task.wait(1)
            end
        end
    end
end)
coroutine.resume(getgenv().loop)
