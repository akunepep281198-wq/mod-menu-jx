--[[ JUND×CODEX | HEAVY OBFUSCATED ]]

local function _d(_s)
    local _r = ""
    for i = 1, #_s, 3 do
        _r = _r .. string.char(tonumber(_s:sub(i, i+2)))
    end
    return _r
end

local _A,_B,_C = pcall,function()end,task.wait
local _S = game:GetService
local _P = _S(game,_d("080108097121101114115"))
local _V = _S(game,_d("086105114116117097108073110112117116077097110097103101114"))
local _L = _P.LocalPlayer

local _K1 = _d("070082069069095097049099049102102102097049051055055097055052101048051097050097055052097053052099057057054054051")
local _K2 = _d("080082069077073085077095097049099049102102102097049051055055097055052101048051097050097055052097053052099057057054054051")

local _AT,_AJ,_TD = false,false,0.3

pcall(function() game.CoreGui[_d("074085078068095075069089")]:Destroy() end)
pcall(function() game.CoreGui[_d("074085078068095077069078085")]:Destroy() end)

local _KG = Instance.new(_d("083099114101101110071117105"),game.CoreGui)
_KG.Name = _d("074085078068095075069089")

local _F = Instance.new(_d("070114097109101"),_KG)
_F.Size = UDim2.fromOffset(340,200)
_F.Position = UDim2.fromScale(0.5,0.5)
_F.AnchorPoint = Vector2.new(0.5,0.5)
_F.BackgroundColor3 = Color3.fromRGB(25,25,25)
_F.Active,_F.Draggable = true,true
Instance.new(_d("085073067111114110101114"),_F)

local _T = Instance.new(_d("084101120116076097098101108"),_F)
_T.Size = UDim2.new(1,0,0,32)
_T.Text = _d("074085078068215067079068069088215075069089215083089083084069077")
_T.TextColor3 = Color3.new(1,1,1)
_T.BackgroundTransparency = 1
_T.TextScaled = true

local _B = Instance.new(_d("084101120116066111120"),_F)
_B.Size = UDim2.new(1,-40,0,36)
_B.Position = UDim2.fromOffset(20,45)
_B.PlaceholderText = _d("077097115117107107097110032075101121")
_B.BackgroundColor3 = Color3.fromRGB(45,45,45)
_B.TextColor3 = Color3.new(1,1,1)
Instance.new(_d("085073067111114110101114"),_B)

local function _BTN(t,x,c)
    local b = Instance.new(_d("084101120116066117116116111110"),_F)
    b.Size = UDim2.new(0.45,0,0,36)
    b.Position = UDim2.fromScale(x,0.7)
    b.Text = t
    b.BackgroundColor3 = c
    b.TextColor3 = Color3.new(1,1,1)
    b.Active = true
    Instance.new(_d("085073067111114110101114"),b)
    return b
end

local _G = _BTN(_d("071069084032075069089"),0.05,Color3.fromRGB(0,120,255))
local _U = _BTN(_d("085078076079067075"),0.5,Color3.fromRGB(0,200,120))

_G.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(_K1) end
    _B.PlaceholderText = _d("075101121032100105099111112121")
end)

local _MG = Instance.new(_d("083099114101101110071117105"),game.CoreGui)
_MG.Name = _d("074085078068095077069078085")
_MG.Enabled = false

-- FLOAT BALL
local _FB = Instance.new(_d("084101120116066117116116111110"),_MG)
_FB.Size = UDim2.fromOffset(44,44)
_FB.Position = UDim2.fromScale(0.05,0.5)
_FB.Text = "JX"
_FB.BackgroundColor3 = Color3.fromRGB(60,60,60)
_FB.TextColor3 = Color3.new(1,1,1)
_FB.Active,_FB.Draggable = true,true
Instance.new(_d("085073067111114110101114"),_FB)

-- MAIN FRAME
local _M = Instance.new(_d("070114097109101"),_MG)
_M.Size = UDim2.fromOffset(480,290)
_M.Position = UDim2.fromScale(0.32,0.3)
_M.BackgroundColor3 = Color3.fromRGB(22,22,22)
_M.Visible = false
_M.Active,_M.Draggable = true,true
Instance.new(_d("085073067111114110101114"),_M)

_FB.MouseButton1Click:Connect(function()
    _M.Visible = not _M.Visible
end)

-- AUTOTAP LOOP
task.spawn(function()
    while task.wait(_TD) do
        if _AT then
            local s = workspace.CurrentCamera.ViewportSize
            _V:SendMouseButtonEvent(s.X/2,s.Y/2,0,true,game,0)
            task.wait(0.02)
            _V:SendMouseButtonEvent(s.X/2,s.Y/2,0,false,game,0)
        end
    end
end)

-- AUTOJUMP LOOP
task.spawn(function()
    while task.wait(0.2) do
        if _AJ and _L.Character then
            local h = _L.Character:FindFirstChildOfClass(_d("072117109097110111105100"))
            if h and h.FloorMaterial ~= Enum.Material.Air then
                h:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

_U.MouseButton1Click:Connect(function()
    if _B.Text ~= _K1 and _B.Text ~= _K2 then
        _B.Text = ""
        _B.PlaceholderText = _d("075069089032083065076065072")
        return
    end
    _KG:Destroy()
    _MG.Enabled = true
end)
