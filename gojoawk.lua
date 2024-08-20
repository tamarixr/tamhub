wait(3)
local targetHipHeight = 35  -- Target HipHeight in studs
local transitionTime = 1.5  -- Time in seconds over which to transition

local character = game.Players.LocalPlayer.Character
if character then
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local initialHipHeight = humanoid.HipHeight
        local timeElapsed = 0

        -- Run the transition smoothly over time
        while timeElapsed < transitionTime do
            timeElapsed = timeElapsed + game:GetService("RunService").Heartbeat:Wait()
            local alpha = timeElapsed / transitionTime
            humanoid.HipHeight = initialHipHeight + (targetHipHeight - initialHipHeight) * alpha
        end

        -- Ensure the final HipHeight is set correctly
        humanoid.HipHeight = targetHipHeight

Player = "LocalPlayer"
AnimationId = "18897538537"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players[Player].Character.Humanoid:LoadAnimation(Anim)
k:Play() --Play the animation
k:AdjustSpeed(1.5) --Set '1' to any value you want to adjust the animation speed.
wait(5.25)
k:Stop()

local targetHipHeight = 0  -- Target HipHeight in studs
local transitionTime = 0.25  -- Time in seconds over which to transition

local character = game.Players.LocalPlayer.Character
if character then
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local initialHipHeight = humanoid.HipHeight
        local timeElapsed = 0

        -- Run the transition smoothly over time
        while timeElapsed < transitionTime do
            timeElapsed = timeElapsed + game:GetService("RunService").Heartbeat:Wait()
            local alpha = timeElapsed / transitionTime
            humanoid.HipHeight = initialHipHeight + (targetHipHeight - initialHipHeight) * alpha
        end

        -- Ensure the final HipHeight is set correctly
        humanoid.HipHeight = targetHipHeight
          end
       end
    end
end
