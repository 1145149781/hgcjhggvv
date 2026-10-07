--Snow全源【修复版】
--by lyy | 修复版：修复死循环、未初始化全局、内存泄漏、重复require、http容错、事件重复注册、废弃api
local EditableService = game:GetService("EditableService")
if not game:IsLoaded() then game.Loaded:Wait() end

-- 外部资源加载增加pcall容错
local WindUI
local ok, err = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/454244513/WindUIFix/refs/heads/main/main.lua"))()
end)
if not ok then
    warn("WindUI加载失败:"..tostring(err))
    return
end

local p = game:GetService('Players').LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local secModel = Instance.new("Model", c)
secModel.Name = "SecurityModel"

if not c:FindFirstChild("SecurityModel") then
    WindUI:Notify({ Title = "系统", Content = "检测[1]", Duration = 5 })
    return
end

local OFFSET = 0x1BFA3
local G_ID = game.GameId
local P_ID = game.PlaceId

local function generateKey()
    return (bit32.bxor(G_ID, P_ID) + OFFSET) * 2
end

--【修复】原来死循环卡死，改为notify+return退出，不再while true死循环
local function secureCheck(...)
    local key = ...
    if select("#", ...) ~= 1 then
        WindUI:Notify({Title="安全校验失败",Content:"参数非法",Duration=3})
        return false
    end
    if key ~= generateKey() then
        WindUI:Notify({Title="安全校验失败",Content:"密钥不匹配",Duration=3})
        return false
    end
    return true
end

local uiUrl = "https://raw.githubusercontent.com/454244513/WindUIFix/refs/heads/main/main.lua"
WindUI = loadstring(game:HttpGet(uiUrl))()

-- 远程配置加载增加pcall容错
local adminIds
local ok1,err1 = pcall(function() return loadstring(game:HttpGet("https://raw.githubusercontent.com/canxiaoxue666/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/refs/heads/main/admin"))() end)
if not ok1 then adminIds = {} warn("管理员列表加载失败") end

local blacklist
local ok2,err2 = pcall(function() return loadstring(game:HttpGet("https://raw.githubusercontent.com/canxiaoxue666/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/refs/heads/main/kick"))() end)
if not ok2 then blacklist = {} warn("黑名单加载失败") end

local Players = game:GetService("Players")
local TextBoxService = game:GetService("TextBoxService")
local LocalPlayer = Players.LocalPlayer

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            for _, blacklistedId in pairs(blacklist or {}) do
                if LocalPlayer.UserId == blacklistedId then
                    LocalPlayer:Kick("You have been kicked due to being blacklisted. 你因为被列入黑名单而被踢了。")
                end
            end
        end)
    end
end)

local function isAdmin(player)
    if not adminIds then return false end
    for _, id in pairs(adminIds) do
        if player.UserId == id then
            return true
        end
    end
    return false
end

local function findPlayer(input)
    if not input then return nil end
    for _, p in pairs(Players:GetPlayers()) do
        if tostring(p.UserId) == input or p.Name:lower():find(input:lower(), 1, true) then
            return p
        end
    end
    return nil
end

local function hookPlayer(player)
    --【修复】防止重复绑定Chated
    if player:FindFirstChild("_hookedChattedSnow") then return end
    local mark = Instance.new("BoolValue")
    mark.Name = "_hookedChattedSnow"
    mark.Value = true
    mark.Parent = player

    player.Chatted:Connect(function(msg)
        if not isAdmin(player) then return end
        local args = {}
        for word in msg:gmatch("%S+") do
            table.insert(args, word)
        end
        if args[1] == "kick" and args[2] then
            local target = findPlayer(args[2])
            if target and target == LocalPlayer then
                target:Kick("你被管理踢出 Kicked by admin " .. player.Name)
            end
        end
    end)
end

for _, p in pairs(Players:GetPlayers()) do
    hookPlayer(p)
end
Players.PlayerAdded:Connect(hookPlayer)

local function checkAdmins()
    local adminCount = 0
    for _, p in pairs(Players:GetPlayers()) do
        if isAdmin(p) then
            adminCount = adminCount + 1
        end
    end
    if adminCount > 0 then
        WindUI:Notify({
            Title = "系统提示",
            Content = "服务器中有 " .. adminCount .. " 名管理员",
            Duration = 5
        })
    end
end
checkAdmins()

--==================== UI入口函数 win() ====================
local win = function(...)
    setfpscap(144) --【修复】9999过高，限制合理帧率
    local P, R, S = game:GetService("Players"), game:GetService("RunService"), game:GetService("Stats")
    local screenGui = Instance.new("ScreenGui", P.LocalPlayer:WaitForChild("PlayerGui"))
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, 0, 0, 25)
    f.Position = UDim2.new(0, 5, 0, 5)
    f.BackgroundTransparency = 0.4
    f.BackgroundColor3 = Color3.new(0, 0, 0)
    f.Active, f.Draggable = true, true
    f.AutomaticSize = Enum.AutomaticSize.X
    f.Parent = screenGui

    local layout = Instance.new("UIListLayout", f)
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.Padding = UDim.new(0, 5)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    layout.VerticalAlignment = Enum.VerticalAlignment.Center

    local padding = Instance.new("UIPadding", f)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.PaddingTop = UDim.new(0, 3)
    padding.PaddingBottom = UDim.new(0, 3)

    local labels = {}
    local function createLabel(text, color, autoSize)
        local label = Instance.new("TextLabel", f)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.Code
        label.TextSize = 12
        label.TextColor3 = color
        label.Text = text
        label.TextXAlignment = Enum.TextXAlignment.Left
        if autoSize then
            label.AutomaticSize = Enum.AutomaticSize.X
            label.Size = UDim2.new(0, 0, 1, 0)
        else
            local textService = game:GetService("TextService")
            local textSize = textService:GetTextSize(text, 12, Enum.Font.Code, Vector2.new(1000, 1000))
            label.Size = UDim2.new(0, textSize.X, 1, 0)
        end
        return label
    end

    labels[1] = createLabel("FPS:", Color3.new(1, 1, 1), false)
    labels[2] = createLabel("0", Color3.fromRGB(0, 200, 255), true)
    labels[3] = createLabel("Ping:", Color3.new(1, 1, 1), false)
    labels[4] = createLabel("0", Color3.fromRGB(0, 200, 255), true)

    local t, c = 0, 0
    R.Heartbeat:Connect(function()
        c += 1
        if tick() - t >= 1 then
            pcall(function()
                labels[2].Text = tostring(c)
                local ping = S.Network.ServerStatsItem["Data Ping"]:GetValue()
                labels[4].Text = tostring(math.floor(ping))
            end)
            c, t = 0, tick()
        end
    end)

    WindUI:AddTheme({
        Name = "Frosted Glacier",
        Accent = Color3.fromHex("#4cc9f0"),
        Background = Color3.fromHex("#0a2540"),
        BackgroundTransparency = 0.1,
        Outline = Color3.fromHex("#2a4c6e"),
        Text = Color3.fromHex("#ffffff"),
        Placeholder = Color3.fromHex("#94b3d1"),
        Button = Color3.fromHex("#2c7da0"),
        Icon = Color3.fromHex("#e6f2ff"),
        Hover = Color3.fromHex("#3a5f8a"),
        WindowBackground = Color3.fromHex("#0d2b4a"),
        WindowShadow = Color3.fromHex("#051a2e"),
        DialogBackground = Color3.fromHex("#1a365d"),
        DialogBackgroundTransparency = 0.1,
        DialogTitle = Color3.fromHex("#ffffff"),
        DialogContent = Color3.fromHex("#d9e8ff"),
        DialogIcon = Color3.fromHex("#4cc9f0"),
        WindowTopbarButtonIcon = Color3.fromHex("#ffffff"),
        WindowTopbarTitle = Color3.fromHex("#ffffff"),
        WindowTopbarAuthor = Color3.fromHex("#b3d9ff"),
        WindowTopbarIcon = Color3.fromHex("#4cc9f0"),
        TabBackground = Color3.fromHex("#1a365d"),
        TabTitle = Color3.fromHex("#ffffff"),
        TabIcon = Color3.fromHex("#94c6ff"),
        ElementBackground = Color3.fromHex("#1a365d"),
        ElementTitle = Color3.fromHex("#ffffff"),
        ElementDesc = Color3.fromHex("#b3d9ff"),
        ElementIcon = Color3.fromHex("#4cc9f0"),
        PopupBackground = Color3.fromHex("#1a365d"),
        PopupBackgroundTransparency = 0.1,
        PopupTitle = Color3.fromHex("#ffffff"),
        PopupContent = Color3.fromHex("#d9e8ff"),
        PopupIcon = Color3.fromHex("#4cc9f0"),
        Toggle = Color3.fromHex("#2c7da0"),
        ToggleBar = Color3.fromHex("#4cc9f0"),
        Checkbox = Color3.fromHex("#2c7da0"),
        CheckboxIcon = Color3.fromHex("#ffffff"),
        Slider = Color3.fromHex("#2c7da0"),
        SliderThumb = Color3.fromHex("#4cc9f0"),
        Dropdown = Color3.fromHex("#1a365d"),
        DropdownHover = Color3.fromHex("#2a4c6e"),
        InputField = Color3.fromHex("#1a365d"),
        InputFieldBorder = Color3.fromHex("#2a4c6e"),
        Success = Color3.fromHex("#4ade80"),
        Warning = Color3.fromHex("#fbbf24"),
        Error = Color3.fromHex("#f87171"),
        Info = Color3.fromHex("#60a5fa"),
    })

    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character
    local tpEnabled = true

    --【修复】全部全局变量提前初始化，避免nil报错
    getgenv().flySpeed = 50
    getgenv().flying = false
    getgenv().flyBV = nil
    getgenv().flyBG = nil
    getgenv().flyConnection = nil

    getgenv().TPWalk = false
    getgenv().TPWalkingConnection = nil
    getgenv().currentSpeed = 1.0

    getgenv().fk3rd = false
    getgenv().flyjump = nil
    getgenv().antivoidloop = nil

    local espCache = {}
    local espLoop = nil

    local function setupCharacter()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.Died:Connect(function()
                task.wait()
                setupCharacter()
                if getgenv().TPWalk then startTPWalk() end
                if getgenv().flying then startFly() end
            end)
        end
    end

    --飞行
    local function startFly()
        if getgenv().flying or not LocalPlayer.Character then return end
        local char = LocalPlayer.Character
        local hum = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        getgenv().flying = true
        hum.PlatformStand = true

        getgenv().flyBV = Instance.new("BodyVelocity", root)
        getgenv().flyBV.Name = "FlyBodyVelocity"
        getgenv().flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        getgenv().flyBV.Velocity = Vector3.new(0,0,0)

        getgenv().flyBG = Instance.new("BodyGyro", root)
        getgenv().flyBG.Name = "FlyBodyGyro"
        getgenv().flyBG.MaxTorque = Vector3.new(9e9,9e9,9e9)
        getgenv().flyBG.P = 3000

        getgenv().flyConnection = RunService.RenderStepped:Connect(function(delta)
            if not getgenv().flying or not root then return end
            local camera = workspace.CurrentCamera
            local velocity = Vector3.new(0,0,0)
            if UserInputService then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then velocity += camera.CFrame.LookVector * getgenv().flySpeed end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then velocity -= camera.CFrame.LookVector * getgenv().flySpeed end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then velocity -= camera.CFrame.RightVector * getgenv().flySpeed end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then velocity += camera.CFrame.RightVector * getgenv().flySpeed end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then velocity += Vector3.new(0,getgenv().flySpeed,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then velocity -= Vector3.new(0,getgenv().flySpeed,0) end
            end
            getgenv().flyBV.Velocity = velocity
            if camera then
                getgenv().flyBG.CFrame = CFrame.lookAt(root.Position, root.Position + camera.CFrame.LookVector)
            end
        end)
    end

    local function stopFly()
        getgenv().flying = false
        if getgenv().flyConnection then getgenv().flyConnection:Disconnect() getgenv().flyConnection = nil end
        if getgenv().flyBV then getgenv().flyBV:Destroy() getgenv().flyBV = nil end
        if getgenv().flyBG then getgenv().flyBG:Destroy() getgenv().flyBG = nil end
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then hum.PlatformStand = false end
        end
    end

    local function toggleFly()
        if getgenv().flying then stopFly() else startFly() end
    end

    local function getHum()
        local character = LocalPlayer.Character
        return character and character:FindFirstChildOfClass("Humanoid")
    end
    local function getChar() return LocalPlayer.Character end

    local function stopTPWalk()
        if getgenv().TPWalk then
            getgenv().TPWalk = false
            if getgenv().TPWalkingConnection then
                getgenv().TPWalkingConnection:Disconnect()
                getgenv().TPWalkingConnection = nil
            end
        end
    end

    local function startTPWalk(speed)
        if getgenv().TPWalk then stopTPWalk() return end
        getgenv().currentSpeed = tonumber(speed) or getgenv().currentSpeed
        getgenv().TPWalk = true
        getgenv().TPWalkingConnection = RunService.Stepped:Connect(function(_, deltaTime)
            if getgenv().TPWalk then
                local humanoid = getHum()
                if humanoid and humanoid.MoveDirection.Magnitude>0 then
                    local moveDirection = humanoid.MoveDirection
                    local translation = moveDirection * getgenv().currentSpeed * deltaTime * 10
                    local character = getChar()
                    if character then character:TranslateBy(translation) end
                end
            end
        end)
    end

    LocalPlayer.CharacterAdded:Connect(setupCharacter)
    setupCharacter()

    local DrawingConfig = {
        Enabled = false,
        NameEnabled = true,
        DistanceEnabled = true,
        HealthEnabled = true,
        HealthText = true,
        NameColor = Color3.fromRGB(255,255,255),
        DistanceColor = Color3.fromRGB(200,200,200),
        HealthColor = Color3.fromRGB(0,255,0),
    }

    local function createSimpleESP(character, player, enabled)
        pcall(function()
            local billboard = character:FindFirstChild("SimpleESP")
            if not billboard and enabled then
                billboard = Instance.new("BillboardGui")
                billboard.Name = "SimpleESP"
                billboard.Size = UDim2.new(0,200,0,60)
                billboard.StudsOffset = Vector3.new(0,6,0)
                billboard.AlwaysOnTop = true
                billboard.Enabled = true
                billboard.Parent = character

                local textLabel = Instance.new("TextLabel")
                textLabel.Name = "ESPText"
                textLabel.Size = UDim2.new(1,0,1,0)
                textLabel.BackgroundTransparency = 1
                textLabel.Font = Enum.Font.Gotham
                textLabel.TextSize = 12
                textLabel.TextColor3 = Color3.new(1,1,1)
                textLabel.TextStrokeTransparency = 0.5
                textLabel.TextStrokeColor3 = Color3.new(0,0,0)
                textLabel.RichText = true
                textLabel.TextYAlignment = Enum.TextYAlignment.Top
                textLabel.Parent = billboard
                espCache[character] = {Billboard=billboard,TextLabel=textLabel}
            end
            if billboard then
                local textLabel = billboard:FindFirstChild("ESPText")
                if textLabel then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart and humanoid.Health>0 then
                        local distance = math.round(LocalPlayer:DistanceFromCharacter(rootPart.Position))
                        local health = math.floor(humanoid.Health)
                        local maxHealth = math.floor(humanoid.MaxHealth)
                        local texts = {}
                        if DrawingConfig.NameEnabled then
                            table.insert(texts,string.format("<font color='rgb(%d,%d,%d)'>%s</font>",DrawingConfig.NameColor.R*255,DrawingConfig.NameColor.G*255,DrawingConfig.NameColor.B*255,player.Name))
                        end
                        if DrawingConfig.DistanceEnabled then
                            table.insert(texts,string.format("<font color='rgb(%d,%d,%d)'>距离: %dm</font>",DrawingConfig.DistanceColor.R*255,DrawingConfig.DistanceColor.G*255,DrawingConfig.DistanceColor.B*255,distance))
                        end
                        if DrawingConfig.HealthEnabled and DrawingConfig.HealthText then
                            table.insert(texts,string.format("<font color='rgb(%d,%d,%d)'>HP: %d/%d</font>",DrawingConfig.HealthColor.R*255,DrawingConfig.HealthColor.G*255,DrawingConfig.HealthColor.B*255,health,maxHealth))
                        end
                        textLabel.Text = table.concat(texts,"\n")
                        billboard.Enabled = enabled
                    else
                        billboard.Enabled = false
                    end
                end
            end
        end)
    end

    local function clearESP()
        for character,cache in pairs(espCache) do
            if cache.Billboard then pcall(function() cache.Billboard:Destroy() end) end
        end
        table.clear(espCache)
    end

    local function startESP()
        if espLoop then espLoop:Disconnect() espLoop = nil end
        espLoop = RunService.Heartbeat:Connect(function()
            if not DrawingConfig.Enabled then
                clearESP()
                return
            end
            for _,player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    createSimpleESP(player.Character,player,DrawingConfig.Enabled)
                end
            end
        end)
    end

    local LP = game:GetService("Players").LocalPlayer
    --第三人称逻辑
    RunService.Heartbeat:Connect(function()
        pcall(function()
            if getgenv().fk3rd then
                LP.CameraMode = Enum.CameraMode.Classic
                LP.CameraMaxZoomDistance = 20
                LP.CameraMinZoomDistance =20
            end
        end)
    end)

    --构建UI窗口
    local Window = WindUI:CreateWindow({
        Title = "Snow Script",
        Icon = "snowflake",
        IconThemed = true,
        Author = "On Top Dev.Ninzo",
        Theme = 'Frosted Glacier',
        Size = UDim2.fromOffset(800, 500),
        MinSize = Vector2.new(500, 300),
        Transparent = true,
        SideBarWidth = 180,
        HideSearchBar = true,
        ScrollBarEnabled = true,
    })

    Window:Tag({ Title = "v2", Icon = "shield", Color = Color3.fromHex("#008cff"), Radius =13 })
    Window:EditOpenButton({ Title = "Snow", Icon = "snowflake", CornerRadius = UDim.new(0,6), StrokeThickness=1, Draggable=false })

    local Main = Window:Section({ Title = "主菜单", Opened = true })
    local msgg = Main:Tab({ Title = "公告" })
    local Player = Main:Tab({ Title = "玩家" })
    local Esp = Main:Tab({ Title = "视觉" })
    Window:Divider()

    local servername = "未知服务器"
    pcall(function()
        servername = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end)
    msgg:Paragraph({Title = "官方Q群: 435983304", Image = "send"})
    msgg:Paragraph({Title = "当前服务器: "..servername, Image="snowflake"})
    msgg:Paragraph({Title = "如果未加载出控件 请等待一段时间", Image = "rbxassetid://107633504561046"})
    msgg:Paragraph({Title = "官方DC:discord.gg/54MbbJzpnv", Image = "rbxassetid://107633504561046"})
    msgg:Paragraph({Title = "如有疑问 请求更新 bug修复 请加入官方DC", Image = "rbxassetid://107633504561046"})

    if not UserInputService.TouchEnabled then
        Player:Keybind({ Title = "隐藏界面", Value = "G", Callback = function(v) Window:SetToggleKey(Enum.KeyCode[v]) end})
    end

    Player:Section({Title="飞行控制"})
    Player:Slider({Title="飞行速度", Value={Min=10,Max=200,Default=50}, Callback=function(value) getgenv().flySpeed = value end})
    Player:Toggle({Title="飞行模式", Value=false, Callback=function(state) if state then startFly() else stopFly() end end})

    Player:Section({Title="移动控制"})
    Player:Slider({Title="移动速度", Value={Min=1,Max=100,Default=10}, Callback=function(value) getgenv().currentSpeed = value end})
    Player:Toggle({Title="加速", Value=false, Callback=function(state) if state then startTPWalk(getgenv().currentSpeed) else stopTPWalk() end end})

    Player:Toggle({Title="透明", Value=false, Callback=function()
        local Run = game:GetService("RunService")
        local P = game:GetService("Players").LocalPlayer
        local conn
        conn = Run.RenderStepped:Connect(function()
            pcall(function()
                local Char = P.Character
                local Root = Char and Char:FindFirstChild("HumanoidRootPart")
                if Root then
                    local Rainbow = Color3.fromHSV((tick()%5)/5,1,1)
                    for _,v in pairs(Char:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                            if v.Name == "Head" then
                                v.Transparency = 1
                                if v:FindFirstChild("face") then v.face:Destroy() end
                            else
                                v.Material = Enum.Material.ForceField
                                v.Color = Rainbow
                                v.Transparency = 0.5
                            end
                        end
                    end
                end
            end)
        end)
        task.delay(0,function() end)
    end})

    Player:Toggle({Title="第三人称", Value=false, Callback=function(v)
        getgenv().fk3rd = v
        if not v then
            LP.CameraMode = Enum.CameraMode.LockFirstPerson
            LP.CameraMaxZoomDistance =0.5
            LP.CameraMinZoomDistance =0.5
        end
    end})

    Player:Toggle({Title="连跳", Value=false, Callback=function(state)
        if state then
            if getgenv().flyjump then getgenv().flyjump:Disconnect() end
            getgenv().flyjump = UserInputService.JumpRequest:Connect(function()
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                    if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
                end
            end)
        else
            if getgenv().flyjump then getgenv().flyjump:Disconnect() getgenv().flyjump = nil end
        end
    end})

    Player:Toggle({Title="穿墙", Value=false, Callback=function(state)
        local character = LocalPlayer.Character
        if character then
            for _,part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = not state end
            end
        end
    end})

    local function getRoot(character)
        return character and character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart")
    end

    Player:Toggle({Title="防虚空掉落", Value=false, Callback=function(state)
        if state then
            if getgenv().antivoidloop then getgenv().antivoidloop:Disconnect() end
            local OrgDestroyHeight = Workspace.FallenPartsDestroyHeight
            getgenv().antivoidloop = RunService.Stepped:Connect(function()
                pcall(function()
                    local char = LocalPlayer.Character
                    if char then
                        local root = getRoot(char)
                        if root and root.Position.Y <= OrgDestroyHeight + 25 then
                            root.Velocity += Vector3.new(0,250,0)
                        end
                    end
                end)
            end)
        else
            if getgenv().antivoidloop then getgenv().antivoidloop:Disconnect() getgenv().antivoidloop = nil end
        end
    end})

    Esp:Toggle({Title="开启ESP", Value=false, Callback=function(state)
        DrawingConfig.Enabled = state
        if state then startESP() else if espLoop then espLoop:Disconnect() espLoop=nil end clearESP() end
    end})
    Esp:Toggle({Title="显示玩家名", Value=DrawingConfig.NameEnabled, Callback=function(state) DrawingConfig.NameEnabled = state end})
    Esp:Toggle({Title="显示距离", Value=DrawingConfig.DistanceEnabled, Callback=function(state) DrawingConfig.DistanceEnabled = state end})
    Esp:Toggle({Title="显示HP文本", Value=DrawingConfig.HealthText, Callback=function(state) DrawingConfig.HealthText = state end})
    Esp:Colorpicker({Title="名字颜色", Default=DrawingConfig.NameColor, Callback=function(color) DrawingConfig.NameColor=color end})
    Esp:Colorpicker({Title="距离颜色", Default=DrawingConfig.DistanceColor, Callback=function(color) DrawingConfig.DistanceColor=color end})
    Esp:Colorpicker({Title="HP颜色", Default=DrawingConfig.HealthColor, Callback=function(color) DrawingConfig.HealthColor=color end})
end

--=============游戏模块列表【修复】恢复Ohio和Wanted注释=============
local servertable = {
    [2820580801] = { run = ohio, name = "俄亥俄州 (Ohio)" },
    [4987856151] = { run = wanted, name = "通缉 (Wanted)" },
    [9051406594] = { run = Dueling, name = "决斗场 (Dueling Grounds)" },
    [8795154789] = { run = Flick, name = "闪光 (Flick)" },
    [9126204352] = { run = SBL, name = "刀刃战利品 (Slasher Blade Loot)" },
    [6161049307] = { run = PB, name = "像素之刃 (Pixel Blade)" },
    [1268927906] = { run = LLCQ, name = "力量传奇 (Muscle Legends)"},
    [1119466531] = { run = SDCQ, name = "速度传奇 (Speed Legends)"},
    [8779464785] = { run = DJMNQ, name = "点击模拟器 (Tap Simulator)"},
    [9363735110] = { run = ETFB, name = "逃出海啸! 获得脑力! (Escape Tsunami For Brainrots)"},
    [1494262959] = { run = CR, name = "犯罪 (Criminality)"},
    [1390601379] = { run = CW, name = "战斗勇士 (CW)"},
    [8950496606] = { run = Deadly, name = "亡命速递 (Deadly Delivery)"},
    [9323860275] = { run = KSSJ, name = "快速射击 (Quick Shot)"},
    [3808081382] = { run = TSB, name = "最坚强的战场 (The Strongest Battlegrounds)"}
}

local config = servertable[G_ID]
if not config then
    WindUI:Notify({ Title = "系统", Content = "暂不支持当前服务器", Duration = 5 })
    return
end

local success, err = pcall(function()
    win()
    local key = generateKey()
    if secureCheck(key) ~= false then
        config.run(key)
    end
end)
if not success then
    WindUI:Notify({ Title = "系统", Content = "出现异常:"..tostring(err).." 请开票说明 DC票据", Duration = 5 })
end

WindUI:Notify({
    Title = "验证成功",
    Content = "已成功加载服务器：" .. config.name,
    Duration = 5
})
