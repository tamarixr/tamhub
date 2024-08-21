loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/lelpfalfg.lua")()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Go/Jo Hub 2.0.0 ",
    SubTitle = "mb for no updates today was a bit lazy",
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
    realm = Window:AddTab({Title = "Realm rampage", Icon = "key" }),
    juju = Window:AddTab({Title = "Jujutsu shenanigans", Icon = "book" }),
    other = Window:AddTab({Title = "Other", Icon = "award" }),
    gojo = Window:AddTab({Title = "Gojo", Icon = "aperture" }),
    super = Window:AddTab({Title = "Super Senior Gojo", Icon = "smile" }),
    sukuna = Window:AddTab({Title = "Other movesets!!", Icon = "slice" }),
    sex = Window:AddTab({Title = "sex (not working)", Icon = "heart" }),
    discord = Window:AddTab({Title = "Discord servers", Icon = "mail" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Go/Jo hub has been loaded!",
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
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")()
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
        Title = "insta ban from tsb",
        Description = "get banned",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "gert banned",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/instaban.lua")()
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
        Title = "Hitbox expander",
        Description = "Loads Hitbox expander",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "xapnd the ehitbox",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/hitboxexpand.lua")()
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
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP")()
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
        Title = "FPS unloceker",
        Description = "Loads ESP",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Load fps unlocker",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            setfpscap(9999)
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
        Title = "nameless admin",
        Description = "Loads nameless admin",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "is the admin name or no?,,og dsjgklmsj",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source")()
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
        Title = "mobile keyboard",
        Description = "Loads the mobyle eykobeoardn",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "aaaaaaaaa",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt")()
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



	
  	        Tabs.Tsb:AddButton({
        Title = "TSB anim player",
        Description = "dont use the secret character highly bannable",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "perhaps",
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
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/ggojomoves.lua",true))()
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
        Title = "Gojo tsb anims",
        Description = "Loads gojo tsb anims",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idkkkfkqkjglqkdjgklqjdngijlokqhbjklqnkgqnijkgqdhkjglqihbgqkljghiq",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/gojotsb.lua",true))()
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
                           loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/animid.lua")()
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
        Title = "Invis Tableflip",
        Description = "self explenatory",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk am i?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/invistableflip.lua",true))()
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
                            getgenv().scriptWl = "SolaraV3HookMetaMethodWhen"
                            getgenv().ToggleKeybind = Enum.KeyCode.RightControl
                            getgenv().FreeEmotesTab = false
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/main/main/Phantasm.lua"))()
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
 

		        Tabs.Tsb:AddButton({
        Title = "auto combo gui",
        Description = "obfuscate your scripts before tamari comes and skids it... by 91x",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/skidlol.lua"))()
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
        Title = "Auto block gui",
        Description = "obfuscate your scripts before tamari comes and skids it... by 91x",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/skidd.lua"))()
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
        Title = "invis toggle lol",
        Description = "obfuscate your scripts before tamari comes and skids it...",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/invislol.lua"))()
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
        Title = "mahoraga sound effect when u do the funny crab",
        Description = "MAHORAGGAAA HELP HELP ME MAHORAGA",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/raga.lua"))()
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
        Title = "idk tp script",
        Description = "im hre im not here anymore woah",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "only for solara and wave idk : (",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/TSBUtils.lua"))()
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
        Title = "anti dc woohoo",
        Description = "haha get ez'd",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "finlaly gang",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/noreset.lua")()
			    print("activated")						
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
        Title = "run tool",
        Description = "haha get runned",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "CREDITS TO TIREDBECEN KQDJGLQJGKLQD",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/run.lua")()
			    print("activated")						
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
        Title = "no dash cooldown",
        Description = "fqshfhdfssfhsdfhs",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "ahaha ur uhhh",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/nnocd.lua")()
			    print("activated")						
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
        Title = "gojo anti death counter quotes",
        Description = "erm ryoki tenkai?",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idsgjsqkglsqgjsqklqzgjlkzq",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/ee.lua"))()
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

 


			 Tabs.sukuna:AddButton({
        Title = "anti dc quotes for sukuna",
        Description = "haha get ez'd",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "finlaly gang",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/dddd.lua")()
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
        Title = "ult detecter",
        Description = "haha get detected",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "fqsfqfqsqgqgqd",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/ultdetec.lua")()
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
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/fixcamm.lua",true))()
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
        Title = "Imaginary hollow purple serious punch",
        Description = "no need to explain",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/englishhesthollow.lua",true))()
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
        Title = "english hollowpurple idk",
        Description = "no need to explain",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/eneeglish.lua",true))()
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
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/iidk.lua"))()
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

	

		        Tabs.gojo:AddButton({
        Title = "BLACK FLASH!",
        Description = "KOKUSEN!!",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "on 4th m1",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/caca.lua"))()
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
        Title = "death counter domain expansion",
        Description = "erm ryoki tenkai?",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "on 4th m1",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/dcmain.lua"))()
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
        Title = "domain expansion quotes on omni!",
        Description = "KOKUSEN!!",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "on 4th m1",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/domainexpansion.lua"))()
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

	


		        Tabs.super:AddButton({
        Title = "Super senior gojo red",
        Description = "no need to explain",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "idk are you",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/supperred.lua"))()
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
 


		        Tabs.super:AddButton({
        Title = "Super senior gojo blue",
        Description = "there is no need to elaborate good sir/ma'am",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "tell me please are you sure for the love of god are you sure i juist want to know if you're sure PLEASE TELL ME YES OR NO ARE YOU SURE PLEAESEEEJIKQSJGLOKQHDGLHDLSGHIOJSHGLJHGLMJKGLMQDSHJGJKLMQDSHGMQDS",
                Buttons = {
                    {
                        Title = "uhh that guy was weird confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/ssuperblue.lua"))()
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
 


	
		        Tabs.super:AddButton({
        Title = "Super senior gojo awak quotes (must have the gojo awakening first)",
        Description = "triggers on saitama awakening",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "pfffftttt are you sure or nah nga idrc if you arent just tell me",
                Buttons = {
                    {
                        Title = "gyat! yes i am sure",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/supersenior.lua"))()
                        end
                    },
                    {
                        Title = "kys",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		        Tabs.super:AddButton({
        Title = "Super senior serious punch hollow purple",
        Description = "triggers on saitama awakening",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "gyat gyat gyat gyattttt",
                Buttons = {
                    {
                        Title = "gyat! yes i am sure",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/senior.lua"))()
                        end
                    },
                    {
                        Title = "kys",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


		
		        Tabs.sukuna:AddButton({
        Title = "World cutting table flip",
        Description = "no need to explain",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "pfffftttt are you sure or nah nga idrc if you arent just tell me",
                Buttons = {
                    {
                        Title = "hey man im",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tamarixr/tamhub/main/world.lua"))()
                        end
                    },
                    {
                        Title = "erm what the sukuna",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


	

		        Tabs.sukuna:AddButton({
        Title = "KJ's anims and ult (fe)",
        Description = "self explenatory",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "oh my gyatness",
                Buttons = {
                    {
                        Title = "hey man im",
                        Callback = function()
                            game.Players.LocalPlayer:Kick("▒█░▄▀ ▒█░░▒█ ▒█▀▀▀█ ▒█▀▄░ ▒█▄▄▄█ ░▀▀▀▄▄ ▒█░▒█ ░░▒█░░ ▒█▄▄▄█ ")
                        end
                    },
                    {
                        Title = "erm what the kj",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 



 


	
		
		        Tabs.sex:AddButton({
        Title = "sex funny hahahaha",
        Description = "for y'aall (working?)",
        Callback = function()
            Window:Dialog({
                Title = "funi sex",
                Content = "oh my gyatness",
                Buttons = {
                    {
                        Title = "hey man im",
                        Callback = function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/UnknowingNSFW/Roblox-Exploit/main/RoClothes.lua'))()
                        end
                    },
                    {
                        Title = "erm what the sex",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


	
		        Tabs.realm:AddButton({
        Title = "Auto win clash",
        Description = "toggle is P",
        Callback = function()
            Window:Dialog({
                Title = "funi dio",
                Content = "oh my wryy",
                Buttons = {
                    {
                        Title = "hey man im",
                        Callback = function()
                            loadstring(game:HttpGet'https://raw.githubusercontent.com/tamarixr/tamhub/main/autowin.lua')()
                        end
                    },
                    {
                        Title = "erm what the clash",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


			        Tabs.juju:AddButton({
        Title = "auto block gui and more",
        Description = "toggle is P",
        Callback = function()
            Window:Dialog({
                Title = "funi dio",
                Content = "oh my wryy",
                Buttons = {
                    {
                        Title = "hey man im",
                        Callback = function()
                            loadstring(game:HttpGet'https://raw.githubusercontent.com/tamarixr/tamhub/main/autoblock.lua')()
                        end
                    },
                    {
                        Title = "erm what the clash",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
 


	
		        Tabs.realm:AddButton({
        Title = "Free emotes",
        Description = "uhuhzjlhdsjklgs",
        Callback = function()
            Window:Dialog({
                Title = "funi dio",
                Content = "oh my wryy",
                Buttons = {
                    {
                        Title = "hey man im",
                        Callback = function()
                            loadstring(game:HttpGet'https://raw.githubusercontent.com/tamarixr/tamhub/main/emoterealm.lua')()
                        end
                    },
                    {
                        Title = "erm what the clash",
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
    Title = "give me my credits",
    Content = "if ur gonna make a vid on this give the credits.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end
