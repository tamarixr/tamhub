local undetected = "https://raw.githubusercontent.com/ATrain-Roblox/main/main/Kadehub-Re-release"
getgenv().AutoReport = true
if getgenv().KadeHubLoaded ~= true then
    getgenv().KadeHubLoaded = true
   loadstring(game:HttpGet(undetected))()
else
    game.StarterGui:SetCore("SendNotification",  {
        Title = "KadeHub";
        Text = "KadeHub is already executed!";
        Icon = "rbxassetid://17893547380";
        Duration = 15;
    })
end