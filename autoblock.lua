local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gojoAnimIDs = {
    TwofoldKick = "rbxassetid://16842286124",
    Teleport = "rbxassetid://16028730554", -- cannot manjikick (itadori counter)
    RapidPunches = "rbxassetid://15042750274",
    LapseBlue = "rbxassetid://14702384584",
	InfiniteVoid = "rbxassetid://14801008075",
    Down = "rbxassetid://15142443111",
    Up = "rbxassetid://15142441185",
    Melee4 = "rbxassetid://14205334593",
    Melee3 = "rbxassetid://14732979549",
    Melee2 = "rbxassetid://14733539493",
    Melee1 = "rbxassetid://14205334593"
}

local hakariAnimIDs = {
    -- Rhythm = "rbxassetid://17169800433",
    EnergySurge = "rbxassetid://17166742239", -- can only manji kick/hakari counter
    FeverBreaker = "rbxassetid://17099951429",
    OverLuck = "rbxassetid://17044048176", -- can only manji kick/hakari counter
    LuckyRushdown = "rbxassetid://17011596206", -- can only manji kick/hakari counter
    LuckyVolley = "rbxassetid://16714319570", -- can only manji kick/hakari counter
    ReserveBalls = "rbxassetid://16705392699",
    RoughEnergy = "rbxassetid://15076580998", -- can only manji kick/hakari counter
    Counter = "rbxassetid://16671125770", -- DON'T ATTACK WHEN HE USES THIS, BLOCK THE MELEE ATTACK FROM FIRING, cannot manji kick (itadori counter)
    ShutterDoors = "rbxassetid://16460186941",
	IdleDeath = "rbxassetid://16357948708",
    Down = "rbxassetid://15142443111",
    Up = "rbxassetid://15142441185",
    Melee4 = "rbxassetid://17147085667",
    Melee3 = "rbxassetid://17147082038",
    Melee2 = "rbxassetid://17147079313",
    Melee1 = "rbxassetid://17147075224"
}

-- Itadori Animations
local itadoriAnimIDs = {
    CursedStrikeHit = "rbxassetid://16872047350",
    CrushingBlow = "rbxassetid://15432272268",
    RushHit = "rbxassetid://16827230331",
    Cleave = "rbxassetid://16638412783",
    CursedStrike = "rbxassetid://15434683426",
    Rush = "rbxassetid://15984964491", -- ONLY COUNTER Gonna add a silly check for this aniamtion 
    FlameArrow = "rbxassetid://15934318270", 
    ManjiKick = "rbxassetid://14841505475", -- BLOCK THE MELEE ATTACK FROM FIRING
    Dismantle = "rbxassetid://18867830088", 
    DivergentFist = "rbxassetid://14771588355",
    SlaughterDemon = "rbxassetid://16735568688",
	MalevolentShrine = "rbxassetid://15489784732",
    Chase = "rbxassetid://15112244663",
    Down = "rbxassetid://15142443111",
    Up = "rbxassetid://15142441185",
    Melee4 = "rbxassetid://14748922700",
    Melee3 = "rbxassetid://14748873813",
    Melee2 = "rbxassetid://14748873193",
    Melee1 = "rbxassetid://14748872179",
    Melee4_Alt = "rbxassetid://17177309004",
    Melee3_Alt = "rbxassetid://17177307018",
    Melee2_Alt = "rbxassetid://17177305963",
    Melee1_Alt = "rbxassetid://17177304783"
}

-- Mahito Animations
local mahitoAnimIDs = {
    IdleTransfigHit = "rbxassetid://18682746799",
    IdleTransfig = "rbxassetid://18681886619", -- can only manji kick/hakari counter and needs delay
    BodyRepel = "rbxassetid://18219731885", -- can only manji kick/hakari counter
    FocusStrike = "rbxassetid://17726887188", -- can only manji kick/hakari counter
    Soulfire = "rbxassetid://17332787780",
    Stockpile = "rbxassetid://18334584217", -- can only manji kick/hakari counter
	SelfPerfection = "rbxassetid://14778379592", -- dash into/tp into or away 
    Chase = "rbxassetid://15112244663",
    Down = "rbxassetid://15142443111",
    Up = "rbxassetid://15142441185",
    Melee4 = "rbxassetid://14205334593",
    Melee3 = "rbxassetid://14732979549",
    Melee2 = "rbxassetid://14733539493",
    Melee1 = "rbxassetid://14205334593"
}

-- Megumi Animations
local megumiAnimIDs = {
    GreatSerpent = "rbxassetid://17656896351", -- can only manji kick/hakari counter (I really cannot be bothered finding out where the head of the model is, i'll come back to it later)
    ShadowSwarmRun = "rbxassetid://17588190031", -- can only manji kick/hakari counter
    ShadowSwarm2 = "rbxassetid://17588171119", -- can only manji kick/hakari counter
    ShadowSwarm1 = "rbxassetid://17588168513", -- can only manji kick/hakari counter
    ShadowSwarmHit = "rbxassetid://17588173341",
    MahoragaUse = "rbxassetid://17549011110", -- dash towards/tp into and left click
    ShadowSwarm = "rbxassetid://17588165564",-- can only manji kick/hakari counter + math
    Toad = "rbxassetid://17263623586", -- Gonna figure out later where the tongue is, might do something with the distance of the player using the animation and determine the block/counter from that 
    Shadow = "rbxassetid://17110997686",
    Chase = "rbxassetid://15112244663",
    Down = "rbxassetid://15142443111",
    Up = "rbxassetid://15142441185",
    Melee4 = "rbxassetid://18846293639",
    Melee3 = "rbxassetid://18846291795",
    Melee2 = "rbxassetid://18846289265",
    Melee1 = "rbxassetid://18846287343"
}

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "JJS silly lil GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "JJKAutoCounter"})

local LocalPlayer = Players.LocalPlayer
local CurrentCharacter = ""
local isBlocking = false
local blockRange = 30
local itadoriCooldown = false
local hakariCooldown = false
local counterCooldown = false
local autoCounterTimes = 2
local autoBlockingEnabled = true
local autoCharacterCounterEnabled = true
local toadDelay = 0.7
local flameArrowRange = 30
local tpBehindDomainDist = 3
local autoDashAwayEnabled = false
local autoPunishEnabled = true
local dashIntoHakari = false
local dashIntoDomain = false

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CounterTab = Window:MakeTab({
    Name = "Counter",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Main Tab
MainTab:AddToggle({
    Name = "Auto Blocking",
    Default = true,
    Callback = function(Value)
        autoBlockingEnabled = Value
    end    
})

MainTab:AddToggle({
    Name = "Auto Punish",
    Default = true,
    Callback = function(Value)
        autoPunishEnabled = Value
    end    
})

-- Counter Tab
CounterTab:AddToggle({
    Name = "Auto Character Counter",
    Default = true,
    Callback = function(Value)
        autoCharacterCounterEnabled = Value
    end    
})

CounterTab:AddToggle({
    Name = "TP Away From Domains",
    Default = false,
    Callback = function(Value)
        autoDashAwayEnabled = Value
    end    
})

CounterTab:AddToggle({
    Name = "TP Into Player Using Domain",
    Default = false,
    Callback = function(Value)
        dashIntoDomain = Value
    end    
})

CounterTab:AddToggle({
    Name = "Dash Into Hakari Domain",
    Default = false,
    Callback = function(Value)
        dashIntoHakari = Value
    end    
})

-- Settings Tab
SettingsTab:AddSlider({
    Name = "Block Range",
    Min = 10,
    Max = 50,
    Default = 30,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "studs",
    Callback = function(Value)
        blockRange = Value
    end    
})

SettingsTab:AddSlider({
    Name = "Auto Counter Times",
    Min = 1,
    Max = 5,
    Default = 2,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "times",
    Callback = function(Value)
        autoCounterTimes = Value
    end    
})

SettingsTab:AddSlider({
    Name = "Toad Delay",
    Min = 0.1,
    Max = 2,
    Default = 0.7,
    Color = Color3.fromRGB(255,255,255),
    Increment = 0.1,
    ValueName = "seconds",
    Callback = function(Value)
        toadDelay = Value
    end    
})

SettingsTab:AddSlider({
    Name = "Flame Arrow (Fuga) Range",
    Min = 10,
    Max = 50,
    Default = 30,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "studs",
    Callback = function(Value)
        flameArrowRange = Value
    end    
})

SettingsTab:AddSlider({
    Name = "TP Behind Domain User Distance",
    Min = 1,
    Max = 10,
    Default = 4,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "studs",
    Callback = function(Value)
        tpBehindDomainDist = Value
    end    
})

InfoTab:AddParagraph("Developer", "This script was made by dfptt on discord")

InfoTab:AddParagraph("Contact", "If you need any custom scripts made then add me on discord and i'll see what i can do!!")

InfoTab:AddParagraph("How I Use It", "When i use the script, it's usually only for 1v1's/2v2's since a lot of people kind of messes it up. lmk if there's any bugs aswell :3")

InfoTab:AddParagraph("Features", "This is just an auto block, i've only seen one and it's paid so i thought i'd make a free one")

InfoTab:AddParagraph("niggas be dumb", "obfuscate your shit before dfptt skids it :pray::sob:")

InfoTab:AddParagraph("Auto TP Domains Feature", "The TP Away from Domains feature will TP you away from the player that's using a domain. The TP into Domains feature will TP you into the player and left click to cancel the domain.")

-- checks my silly lil character 
local function UpdateCurrentCharacter()
    local playerCharacter = Workspace.Characters:FindFirstChild(LocalPlayer.Name)
    if playerCharacter then
        local moveset = playerCharacter:GetAttribute("Moveset")
        if moveset and moveset ~= CurrentCharacter then
            CurrentCharacter = moveset
            print("Current character updated to: " .. CurrentCharacter)
        end
    end
end

-- closesy player
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local localCharacter = LocalPlayer.Character
    if localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
        local localPosition = localCharacter.HumanoidRootPart.Position
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local distance = (character.HumanoidRootPart.Position - localPosition).Magnitude
                    if distance < shortestDistance and distance <= blockRange then
                        closestPlayer = player
                        shortestDistance = distance
                    end
                end
            end
        end
    end
    return closestPlayer
end

local function UseAutoCounter() -- for the punish section, it's the left click, ignore the name of it since it's similar to character counter
    if not counterCooldown and autoBlockingEnabled and autoPunishEnabled then
        counterCooldown = true
        local serviceName = CurrentCharacter .. "Service"
        local service = game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild(serviceName)
        if service then
            for i = 1, autoCounterTimes do
                local args = {
                    [1] = false
                }
                service:WaitForChild("RE"):WaitForChild("Activated"):FireServer(unpack(args))
                wait(0.3)
            end
        end
        counterCooldown = false
    end
end

local function StartBlocking()
    if not isBlocking and autoBlockingEnabled then
        isBlocking = true
        game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BlockService"):WaitForChild("RE"):WaitForChild("Activated"):FireServer()
    end
end

local function StopBlocking()
    if isBlocking then
        isBlocking = false
        game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BlockService"):WaitForChild("RE"):WaitForChild("Deactivated"):FireServer()
        UseAutoCounter()
    end
end

local function UseCharacterCounter()
    if not autoCharacterCounterEnabled then return end
    
    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    if humanoid.Health <= 0 or character ~= localPlayer.Character then
        itadoriCooldown = false
        hakariCooldown = false
        return
    end
    
    if CurrentCharacter == "Itadori" and not itadoriCooldown then
        itadoriCooldown = true
        local args = {
            [1] = false
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ManjiKickService"):WaitForChild("RE"):WaitForChild("Activated"):FireServer(unpack(args))
        delay(20, function()
            itadoriCooldown = false
        end)
    elseif CurrentCharacter == "Hakari" and not hakariCooldown then
        hakariCooldown = true
        game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("HakariService"):WaitForChild("RE"):WaitForChild("RightActivated"):FireServer()
        delay(13, function()
            hakariCooldown = false
        end)
    else
        StartBlocking()
    end
end -- there is most definitely another way to find cooldowns but i'm too lazy to find it :3

local function DashAway(player) -- too lazy to change function name, this tp's you away from domains
    local localCharacter = LocalPlayer.Character
    if localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
        local localHRP = localCharacter.HumanoidRootPart
        local playerHRP = player.Character.HumanoidRootPart
        
        local randomAngle = math.rad(math.random(0, 360))
        local randomDirection = Vector3.new(math.cos(randomAngle), 0, math.sin(randomAngle))
        
        local newPosition = localHRP.Position + randomDirection * 50
        
        localHRP.CFrame = CFrame.new(newPosition, playerHRP.Position)
    end
end

local function DashIntoDomain(player)
    if dashIntoDomain then
        local localCharacter = LocalPlayer.Character
        if localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
            local localHRP = localCharacter.HumanoidRootPart
            local playerHRP = player.Character.HumanoidRootPart
            
            local behindOffset = (playerHRP.CFrame.LookVector * -tpBehindDomainDist)
            local newPosition = playerHRP.Position + behindOffset
            localHRP.CFrame = CFrame.new(newPosition, playerHRP.Position)
            
            if game:GetService("Workspace").CurrentCamera then -- i dont think this is necessary but awh well
                game:GetService("Workspace").CurrentCamera.CameraSubject = playerHRP
            end
            
			StopBlocking()
            UseAutoCounter()
            
            if game:GetService("Workspace").CurrentCamera then
                game:GetService("Workspace").CurrentCamera.CameraSubject = localCharacter.Humanoid
            end
        end
    end
end

local function DashIntoHakari(player) -- idek why i'm adding this
    if dashIntoHakari then
        local localCharacter = LocalPlayer.Character
        if localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") then
            local localHRP = localCharacter.HumanoidRootPart
            local playerHRP = player.Character.HumanoidRootPart
            
            localHRP.CFrame = CFrame.new(localHRP.Position, playerHRP.Position)
            
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Q, false, game)
            wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Q, false, game)
        end
    end
end

local function CheckForEnemyAnimations() -- Main Function
    local closestPlayer = GetClosestPlayer()
    if closestPlayer then
        local character = closestPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            local animator = character.Humanoid:FindFirstChild("Animator")
            if animator then
                local playingTracks = animator:GetPlayingAnimationTracks()
                for _, track in ipairs(playingTracks) do
                    local animationId = track.Animation.AnimationId
                    for _, animTable in pairs({gojoAnimIDs, hakariAnimIDs, itadoriAnimIDs, mahitoAnimIDs, megumiAnimIDs}) do
                        for animName, id in pairs(animTable) do
                            if animationId == id then
                                if animName == "IdleDeath" then
                                    if dashIntoHakari then
                                        DashIntoHakari(closestPlayer)
                                        return
                                    elseif autoDashAwayEnabled then
                                        DashAway(closestPlayer)
                                        return
                                    end
                                elseif (animName == "MalevolentShrine" or animName == "InfiniteVoid" or animName == "SelfPerfection") then
                                    if dashIntoDomain then
                                        DashIntoDomain(closestPlayer)
                                        return
                                    elseif autoDashAwayEnabled then
                                        local distance = (closestPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if distance <= blockRange then
                                            DashAway(closestPlayer)
                                            return
                                        end
                                    end
                                elseif animName == "Toad" then
                                    delay(toadDelay, function()
                                        UseCharacterCounter()
                                    end)
                                elseif animName == "FlameArrow" then
                                    print("Flame Arrow detected from player: " .. closestPlayer.Name)
                                    spawn(function()
                                        while true do
                                            local arrowProjectile = Workspace.Bullets:FindFirstChild("ArrowProjectile")
                                            if arrowProjectile then
                                                local distance = (arrowProjectile.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                                if distance <= flameArrowRange then
                                                    UseCharacterCounter()
                                                    print("Countered Flame Arrow at distance: " .. distance)
                                                end
                                            end
                                            wait()
                                        end
                                    end)
                                else
                                    local delayedCounterAnims = { -- Gonna add a slider for this later HOPEFULLY I REMEMBER 
                                        IdleTransfig = 0.6,
                                        FocusStrike = 0.5
                                    }
                                    
                                    if delayedCounterAnims[animName] then
                                        delay(delayedCounterAnims[animName], function()
                                            UseCharacterCounter()
                                        end)
                                    else
                                        UseCharacterCounter()
                                    end
                                end
                                return
                            end
                        end
                    end
                end
            end
        end
    end
    StopBlocking()
end

-- For thed ealy time
local function AddCounterableAnimation(animTable, animName, animId, delayTime)
    animTable[animName] = animId
    if delayTime then
        delayedCounterAnims[animName] = delayTime
    end
end

-- function for countering FOOOOOOOGA
spawn(function()
    while true do
        local arrowProjectile = Workspace.Bullets:FindFirstChild("ArrowProjectile")
        if arrowProjectile then
            while arrowProjectile.Parent do
                local distance = (arrowProjectile.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance <= flameArrowRange then
                    UseCharacterCounter()
                    print("Countered Arrow Projectile at distance: " .. distance)
                end
                wait()
            end
        end
        wait()
    end
end)

RunService.Heartbeat:Connect(function()
    UpdateCurrentCharacter()
    CheckForEnemyAnimations()
end)

OrionLib:Init()
