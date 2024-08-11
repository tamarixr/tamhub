local HttpService = game:GetService('HttpService')
--replace with your webhook url
local webhookurl = 'https://discord.com/api/webhooks/1272199261853057074/hHEvhD9S-2oxf_d5TSP4vuvBxoUjsMqPJQZJSJhKgOgPEOIKm_t0_UnpCl2x3p0Wv32d
 
game.Players.PlayerAdded:Connect(function(player)
    local data = {
        ['content'] = (player.Name..'Has Executed the script!')
    }
    
    data = HttpService:JSONEncode(data) --Creating a JSON string 
    HttpService:PostAsync(webhookurl, data) --sending the data
end)
