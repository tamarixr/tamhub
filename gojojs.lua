humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local animationId = 12983333733

message = "Jujutsi Hanten Shiki : Aka 🔴"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(1)
message = "Jujitsu Hanten Shiki : Ao 🔵"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(2)
message = "Kyoshiki... 🔵 🔴"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
wait(1)
message = "Murasaki! 🔮"
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
