local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")

local assetId = 85612504696252
local newAssetId = 116082434141240

-- Preload assets asynchronously
local assetsToLoad = {
    "rbxassetid://" .. assetId,
    "rbxassetid://" .. newAssetId
}
ContentProvider:PreloadAsync(assetsToLoad)

local soundFileName = "reversal_red.mp3"
local audioUrl = "https://github.com/tamarixr/tamhub/raw/refs/heads/main/baller_breakbeat.mp3"

-- Function to load assets faster
local function fastLoad(asset)
    local loaded = game:GetObjects(asset)
    return loaded and loaded[1] or nil
end

local function createScreenRedFlash()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RedFlashGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local flashFrame = Instance.new("Frame")
    flashFrame.Size = UDim2.new(1, 0, 1, 0)
    flashFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    flashFrame.BackgroundTransparency = 0
    flashFrame.Parent = screenGui

    task.spawn(function()
        for i = 0, 1, 0.2 do
            flashFrame.BackgroundTransparency = i
            RunService.RenderStepped:Wait()
        end
        screenGui:Destroy()
    end)
end

-- Load effects
local effect = fastLoad("rbxassetid://" .. assetId)
local newEffect = fastLoad("rbxassetid://" .. newAssetId)
if not effect or not newEffect then return end

local player = game.Players.LocalPlayer
local character = player and player.Character
local rightHand = character and (character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm"))

if rightHand then
    effect.Parent = rightHand
    effect.CFrame = rightHand.CFrame * CFrame.new(0, -rightHand.Size.Y / 3, 0)

    local weld = Instance.new("Weld")
    weld.Part0 = rightHand
    weld.Part1 = effect
    weld.C0 = CFrame.new(0, -rightHand.Size.Y / 28, -0.75)
    weld.Parent = rightHand

    -- Concurrently handle sound and visuals
    task.spawn(function()
        wait(0.1) -- Reduced delay
        createScreenRedFlash()
        wait(0.75) -- Faster transition

        newEffect.Parent = game.Workspace
        newEffect.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -9)

        effect:Destroy()
        task.spawn(function()
            local fadeTime = 0.2
            local step = 1 / (fadeTime * 60)
            for i = 1, fadeTime * 60 do
                for _, part in ipairs(newEffect:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = math.clamp(part.Transparency + step, 0, 1)
                    end
                end
                RunService.RenderStepped:Wait()
            end
            newEffect:Destroy()
        end)
    end)
end
