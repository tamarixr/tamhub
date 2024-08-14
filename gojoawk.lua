game.Players.LocalPlayer.Character.Humanoid.HipHeight = 30
wait(10)
Player = "LocalPlayer"
AnimationId = "18897538537"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players[Player].Character.Humanoid:LoadAnimation(Anim)
k:Play() --Play the animation
k:AdjustSpeed(1.5) --Set '1' to any value you want to adjust the animation speed.
wait(2.5)
game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
