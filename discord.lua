inviteCode = "aWfYuJZR9q" -- for example: wWvyZM2xbj

local request = http_request or request or (syn and syn.request) or (http and http.request)

if not request then
	return
end

request(
    {
        Url = 'http://127.0.0.1:6463/rpc?v=1',
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
            ['origin'] = 'https://discord.com',
        },
        Body = game:GetService('HttpService'):JSONEncode({
            ["args"] = {
                ['code'] = "",
            },
            ['cmd'] = 'INVITE_BROWSER',
            ['nonce'] = '.',
        });
    }
);
