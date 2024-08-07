local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "TamHub v.4.2.5 ",
    SubTitle = "by dfptt",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Universal", Icon = "rocket" }),
	Tsb = Window:AddTab({Title = "TSB", Icon = "swords" }),
    other = Window:AddTab({Title = "Other", Icon = "award" }),
    gojo = Window:AddTab({Title = "Gojo", Icon = "aperture" }),
    discord = Window:AddTab({Title = "Discord servers", Icon = "mail" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Tamhub has been loaded!",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "Universal",
        Content = "Universal scripts can be used on any games!.\nEnjoy!"
    })



    Tabs.Main:AddButton({
        Title = "Infinite Yield",
        Description = "Loads Infinite Yield",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load infinite yield",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



        Tabs.Main:AddButton({
        Title = "Open console",
        Description = "idk why im adding this",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Open console",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


    
	        Tabs.Main:AddButton({
        Title = "ESP",
        Description = "Loads ESP",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load ESP",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://pastebin.com/raw/s7viVmDR"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


	
  	        Tabs.Tsb:AddButton({
        Title = "Mixed powers",
        Description = "Loads Mixed powers anims and movesets",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load mixed powers",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/tsbanim.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



		        Tabs.gojo:AddButton({
        Title = "Gojo moves with anims",
        Description = "Loads gojo anims and movesets",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load gojo anims and movesets",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/gojomoves.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		        Tabs.Tsb:AddButton({
        Title = "KJ moveset (only names)",
        Description = "Loads KJ moveset",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load KJ moveset",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/kjmoves.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.Tsb:AddButton({
        Title = "KJ ult moves (only names)",
        Description = "Loads KJ moveset",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load KJ moveset",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/kjmovesult.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.Tsb:AddButton({
        Title = "anim id finder",
        Description = "thanks sonic",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load anim id finder",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            local lp = game:GetService("Players").LocalPlayer
local function init(c)
    local h = c and c:WaitForChild("Humanoid", 1)
    if c and h then
        local a = {}
        h.AnimationPlayed:Connect(function(v)
            if not table.find(a, v.Animation.AnimationId) then
                table.insert(a, v.Animation.AnimationId)
                warn("Animation:", v.Animation.AnimationId)
            end
        end)
    end
end

                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		        Tabs.Tsb:AddButton({
        Title = "Phantasm Hub",
        Description = "By sonic!",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load phantasm hub",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.Tsb:AddButton({
        Title = "Kadehub",
        Description = "By acalapteiticpalepactep idk!",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load tsb anim loader",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            getgenv().AutoReport = true
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/KadeHubRepository/main/Latest.lua"))() 
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.Tsb:AddButton({
        Title = "Anime teleportation",
        Description = "Keybind is T",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/animtelp.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		        Tabs.other:AddButton({
        Title = "WAVE PREMIUM KEY GENERATOR",
        Description = "PUT ROBLOX NAME INTO GUI",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/free.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 

		        Tabs.other:AddButton({
        Title = "azure modded idk",
        Description = "has alot of features may not work on certain execs",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.other:AddButton({
        Title = "KADEHUB SKIDDED LOL",
        Description = "FIX UR OBFUSCATOR LOLOLOL",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/adsadsa.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "Hollow purple serious punch quotes",
        Description = "no need to explain",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowpunchforserious.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		        Tabs.gojo:AddButton({
        Title = "Hollow purple serious punch fixcam",
        Description = "disables cutscene basically",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/mainfixcamm.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "Hollow purple tableflip punch quotes",
        Description = "no need to explain",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/hollowwhentableflip.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "Japanese red quotes",
        Description = "triggers on normal punch",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/redwhenpnu.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "Japanese blue quotes",
        Description = "triggers on consecutive punches",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/bluewhencon.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "english blue quotes",
        Description = "triggers on consecutive punches",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/bblue.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "english red quotes",
        Description = "triggers on normal punch",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/redd.lua",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "Gojo awakening (wip)",
        Description = "triggers on saitama awakening",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/ggojoawk.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		        Tabs.gojo:AddButton({
        Title = "Gojo awakening quotes",
        Description = "triggers on saitama awakening",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/gojoquotes.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.gojo:AddButton({
        Title = "Boow0omp's gojo anims",
        Description = "haha funny",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/gojobyboowomp.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



		        Tabs.discord:AddButton({
        Title = "Phantasm's discord invite",
        Description = "haha funny",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "copies to clipboard btw",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            setclipboard("discord.gg/bntsEjwnA5")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 




-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end