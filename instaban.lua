-- LocalScript inside StarterPlayerScripts or StarterCharacterScripts

-- Get the player and character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Wait for the Humanoid to be available
local humanoid = character:WaitForChild("Humanoid")

-- Create an Animation object
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://18447913645" -- Replace with your animation ID

-- Load the animation to the humanoid
local animationTrack = humanoid:LoadAnimation(animation)

-- Play the animation
animationTrack:Play()

-- Optional: Set animation speed, loop, etc.
animationTrack:AdjustSpeed(1) -- Normal speed
animationTrack.Looped = false -- Set to true if you want it to loop
