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



onAnimation("13071982935", function(animation)    
        loadstring("\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\83\116\97\114\116\101\114\71\117\105\34\41\58\83\101\116\67\111\114\101\40\34\83\101\110\100\78\111\116\105\102\105\99\97\116\105\111\110\34\44\123\10\32\32\32\32\84\105\116\108\101\32\61\32\34\84\121\112\105\99\97\108\32\67\111\111\108\107\105\100\34\59\10\32\32\32\32\84\101\120\116\32\61\32\34\70\105\120\99\97\109\32\83\99\114\105\112\116\32\83\117\98\115\99\114\105\98\101\32\102\111\114\32\109\111\114\101\33\59\32\34\59\10\32\32\32\32\68\117\114\97\116\105\111\110\32\61\32\54\48\59\10\125\41\32\32\10\10\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\104\97\114\105\115\112\114\111\102\97\110\110\121\47\100\47\109\97\105\110\47\102\105\120\99\97\109\46\116\120\116\34\41\41\40\41\10")()
end)
