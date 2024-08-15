-- Create the GUI elements
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local GarouCombo = Instance.new("TextButton")
local MetalBatCombo = Instance.new("TextButton")
local MakakuCombo = Instance.new("TextButton")
local OneShotGarou = Instance.new("TextButton")
local OBFUSCATEYOURSCRIPTSORTAMARISGONNASKID = Instance.new("TextButton")

-- Properties
ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0, 0, 0.5, -100)
Frame.Size = UDim2.new(0, 200, 0, 250)

local function createButton(button, parent, position, text)
    button.Parent = parent
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.fromRGB(255, 255, 255)
end

createButton(GarouCombo, Frame, UDim2.new(0, 0, 0, 0), "Garou Combo")
createButton(MetalBatCombo, Frame, UDim2.new(0, 0, 0, 50), "Metal Bat Combo")
createButton(MakakuCombo, Frame, UDim2.new(0, 0, 0, 100), "HP Eater Saitama")
createButton(OneShotGarou, Frame, UDim2.new(0, 0, 0, 150), "HP Eater Garou")

-- Function for Garou Combo (Placeholder)
local function garouCombo()
    -- Insert the Garou combo code here
    print("Garou combo executed")
end

GarouCombo.MouseButton1Click:Connect(garouCombo)

-- Function for Metal Bat Combo (Placeholder)
local function metalBatCombo()
    -- Insert the Metal Bat combo code here
    print("Metal Bat combo executed")
end

MetalBatCombo.MouseButton1Click:Connect(metalBatCombo)

-- Function for HP Eater Saitama
local function hpEaterSaitama()
    local function performLeftClick()
        local args = {
            [1] = {
                ["Goal"] = "LeftClick",
                ["Mobile"] = true
            }
        }
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    end

    local function releaseLeftClick()
        local args = {
            [1] = {
                ["Goal"] = "LeftClickRelease",
                ["Mobile"] = true
            }
        }
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    end

    local function performJump()
        local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end

    local function performCombo()
        for i = 1, 3 do
            performLeftClick()
            wait(0.3)
            releaseLeftClick()
            wait(0.3)
        end
        
        wait(0.1)
        performJump()
        
        wait(0.15)
        performLeftClick()
        releaseLeftClick()
    end

    performCombo()
    wait(0.7)
    local args = {
        [1] = {
            ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Consecutive Punches"),
            ["Goal"] = "Console Move"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(1.5)
    local args = {
        [1] = {
            ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uppercut"),
            ["Goal"] = "Console Move"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(2.35)
    local args = {
        [1] = {
            ["Dash"] = Enum.KeyCode.W,
            ["Key"] = Enum.KeyCode.Q,
            ["Goal"] = "KeyPress"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(0.75)

    for i = 1, 3 do
        performLeftClick()
        wait(0.3)
        releaseLeftClick()
        wait(0.5)
    end

    local args = {
        [1] = {
            ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Normal Punch"),
            ["Goal"] = "Console Move"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
end

MakakuCombo.MouseButton1Click:Connect(hpEaterSaitama)

-- Function for HP Eater Garou
local function hpEaterGarou()
    local function performLeftClick()
        local args = {
            [1] = {
                ["Goal"] = "LeftClick",
                ["Mobile"] = true
            }
        }
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    end

    local function releaseLeftClick()
        local args = {
            [1] = {
                ["Goal"] = "LeftClickRelease",
                ["Mobile"] = true
            }
        }
        game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    end

    local function performJump()
        local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end

    local function performCombo()
        for i = 1, 3 do
            performLeftClick()
            wait(0.3)
            releaseLeftClick()
            wait(0.3)
        end
        
        wait(0.10)
        performJump()
        
        wait(0.15)
        performLeftClick()
        releaseLeftClick()
    end

    performCombo()
    wait(1.1)
    local args = {
        [1] = {
            ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hunter's Grasp"),
            ["Goal"] = "Console Move"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(1.5)
    local args = {
        [1] = {
            ["Dash"] = Enum.KeyCode.W,
            ["Key"] = Enum.KeyCode.Q,
            ["Goal"] = "KeyPress"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(0.5)
    local args = {
        [1] = {
            ["Goal"] = "LeftClick",
            ["Mobile"] = true
        }
    }
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(1.5)
    local args = {
        [1] = {
            ["Goal"] = "LeftClickRelease",
            ["Mobile"] = true
        }
    }
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(0)
    local args = {
        [1] = {
            ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Lethal Whirlwind Stream"),
            ["Goal"] = "Console Move"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
    wait(2.5)
    local args = {
        [1] = {
            ["Tool"] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flowing Water"),
            ["Goal"] = "Console Move"
        }
    }

    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
end

OneShotGarou.MouseButton1Click:Connect(hpEaterGarou)
