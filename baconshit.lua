local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Bacon Hub V1",
    SubTitle = "By The Strongest Bacon Himself",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Adding the required tabs: Movesets, Universal Shit, Universal Scripts, and Hubs
local Tabs = {
    Movesets = Window:AddTab({ Title = "Movesets", Icon = "" }),
    UniversalShit = Window:AddTab({ Title = "Universal Shit", Icon = "" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    Hubs = Window:AddTab({ Title = "Hubs", Icon = "" }) -- Added Hubs tab
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Bacon Hub!",
        Content = "BACON HUB HAS BEEN EXECUTED, ENJOY",
        Duration = 5
    })

    -- Movesets tab content
    Tabs.Movesets:AddParagraph({
        Title = "Test Others Script",
        Content = "Here you can customize movesets."
    })

    -- Adding buttons in Movesets tab
    Tabs.Movesets:AddButton({
        Title = "Saitama to Gojo",
        Description = "Transforms Saitama into Gojo",
        Callback = function()
            _G.settings = {
                ["RedStartupId"] = "rbxassetid://1177475221",
                ["RedHitId"] = "rbxassetid://8625377966",
            }
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()
        end
    })

    Tabs.Movesets:AddButton({
        Title = "Saitama to Gojo 2",
        Description = "Max speed Gojo transformation",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/PurpleCone/gojo-max-speed/main/sdfgh'))()
        end
    })

    Tabs.Movesets:AddButton({
        Title = "My Own Saitama to Nah",
        Description = "STILL IN WIP",
        Callback = function()
            print("STILL IN WIP")
        end
    })

    -- Universal Shit tab content
    Tabs.UniversalShit:AddParagraph({
        Title = "Universal Config",
        Content = "Here you can configure universal settings."
    })

    -- Universal Scripts tab content
    Tabs.UniversalScripts:AddParagraph({
        Title = "Scripts",
        Content = "Execute universal scripts from here."
    })

    -- Adding the Infinite Yield button in Universal Scripts tab
    Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yield",
        Description = "Load Infinite Yield Admin Script",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end
    })

    -- Hubs tab content
    Tabs.Hubs:AddParagraph({
        Title = "Hub List",
        Content = "Select a hub to execute."
    })

    -- Adding Kade Hub button in Hubs tab
    Tabs.Hubs:AddButton({
        Title = "Kade Hub",
        Description = "Execute Kade Hub",
        Callback = function()
            getgenv().DisableWarning = false
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/KadeHubRepository/main/Latest.lua"))()
        end
    })

    -- Adding Oni Hub button in Hubs tab
    Tabs.Hubs:AddButton({
        Title = "Oni Hub",
        Description = "Execute Oni Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/CfEQux4K"))()
        end
    })

    -- Adding Phantasm Hub button in Hubs tab
    Tabs.Hubs:AddButton({
        Title = "Phantasm Hub",
        Description = "Execute Phantasm Hub",
        Callback = function()
            getgenv().ToggleKeybind = Enum.KeyCode.RightControl
            getgenv().FreeEmotesTab = false
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/main/main/Phantasm-Loader.lua"))()
        end
    })

    -- Adding Custom Movesets (FiP Hub) button in Hubs tab
    Tabs.Hubs:AddButton({
        Title = "FiP Hub",
        Description = "Execute FiP Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/devxrestff/fibhubuniversal/main/README.md"))()
        end
    })

    -- Adding Obsydian Hub button in Hubs tab
    Tabs.Hubs:AddButton({
        Title = "Obsydian Hub",
        Description = "Execute Obsydian Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dragonfly5101/Obsydian/main/ObsydianP.txt'))()
        end
    })
end

-- Addons:
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.UniversalShit)
SaveManager:BuildConfigSection(Tabs.UniversalShit)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Bacon Hub!",
    Content = "BACON HUB HAS BEEN EXECUTED, ENJOY",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
