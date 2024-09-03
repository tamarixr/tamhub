------------------------------------<CONFIG>------------------------------------
local CONFIG = {
	TargetHipHeight = 90,        -- target hipheight
	ResetHipHeight = 0,          -- objetive hipheight when the animation finishes
	TransitionTime = 0,
    TransitionTime2 = 0,        -- waiting time to make the transitions -- animation id
	InitialWait = 0,             -- initial waiting time      -- waiting time before initialiting the animation
	StopWait = 2,             -- waiting time before stopping the animation
	AnimationSpeed = 1.5,        -- animation speed
	EnableWarnings = true        -- enable/disable warnings, add "true" to enable it and "false" to disable them
}

------------------------------------<FUNCTIONS>------------------------------------

-- function for the hipheight
local function transitionHipHeight(humanoid, targetHipHeight, transitionTime)
	local initialHipHeight = humanoid.HipHeight
	local timeElapsed = 0
	while timeElapsed < transitionTime do
		timeElapsed = timeElapsed + game:GetService("RunService").Heartbeat:Wait()
		local alpha = timeElapsed / transitionTime
		humanoid.HipHeight = initialHipHeight + (targetHipHeight - initialHipHeight) * alpha
	end
	humanoid.HipHeight = targetHipHeight
end

-- function to show optional warns
local function optionalWarn(message)
	if CONFIG.EnableWarnings then
		warn(message)
	end
end

-- function to check if the character is falling
local function isFalling(humanoid)
	return humanoid:GetState() == Enum.HumanoidStateType.Freefall
end

------------------------------------<INITIALIZATION>------------------------------------

wait(CONFIG.InitialWait)

local player = game.Players.LocalPlayer
if not player then
	optionalWarn("couldn't find player")
	return
end

local character = player.Character
if not character then
	optionalWarn("couldn't find character, are you still alive?")
	return
end

local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then
	optionalWarn("couldn't find humanoid, fix ur character!!")
	return
end

-- wait until the character is not falling
while isFalling(humanoid) do
	wait(0.1)  -- wait a bit before checking again AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
end

------------------------------------<TRANSITION: INITIAL HIP HEIGHT>------------------------------------

transitionHipHeight(humanoid, CONFIG.TargetHipHeight, CONFIG.TransitionTime)

wait(1.2)

transitionHipHeight(humanoid, CONFIG.ResetHipHeight, CONFIG.TransitionTime2)
