--Snow全源
--by lyy
local EditableService = game:GetService("EditableService")
if not game:IsLoaded() then game.Loaded:Wait() end
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/454244513/WindUIFix/refs/heads/main/main.lua"))()

local p = game:GetService('Players').LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
Instance.new("Model", c).Name = "SecurityModel"
if not c:FindFirstChild("SecurityModel") then
    return WindUI:Notify({ Title = "系统", Content = "检测[1]", Duration = 5 })
end
local OFFSET = 0x1BFA3
local G_ID = game.GameId
local P_ID = game.PlaceId
local function generateKey()
return (bit32.bxor(G_ID, P_ID) + OFFSET) * 2
end
local function secureCheck(...)
local key = ...
if select("#", ...) ~= 1 then
    while true do end
end
if key ~= generateKey() then
    local function crash() return crash() end
    task.spawn(crash)
    while true do end
end
end
local uiUrl = "https://raw.githubusercontent.com/454244513/WindUIFix/refs/heads/main/main.lua"
local WindUI = loadstring(game:HttpGet(uiUrl))()
local adminUrl = "https://raw.githubusercontent.com/canxiaoxue666/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/refs/heads/main/admin"
local adminIds = loadstring(game:HttpGet(adminUrl))()
local blacklistUrl = "https://raw.githubusercontent.com/canxiaoxue666/BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/refs/heads/main/kick"
local blacklist = loadstring(game:HttpGet(blacklistUrl))()
local Players = game:GetService("Players")
local TextBoxService = game:GetService("TextBoxService")
local LocalPlayer = Players.LocalPlayer
local function checkLocalPlayer()
    for _, blacklistedId in pairs(blacklist) do
        if LocalPlayer.UserId == blacklistedId then
            LocalPlayer:Kick("You have been kicked due to being blacklisted. 你因为被列入黑名单而被踢了。")
        end
    end
end
task.spawn(function()
    while true and wait(1) do
        checkLocalPlayer()
    end
end)
local function isAdmin(player)
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
--ui
local win = function(...)
setfpscap(9999)
local P, R, S = game:GetService("Players"), game:GetService("RunService"), game:GetService("Stats")

local screenGui = Instance.new("ScreenGui", P.LocalPlayer:WaitForChild("PlayerGui"))

local f = Instance.new("Frame")
f.Size = UDim2.new(0, 0, 0, 25)  -- 宽度设为0，自动调整
f.Position = UDim2.new(0, 5, 0, 5)
f.BackgroundTransparency = 0.4
f.BackgroundColor3 = Color3.new(0, 0, 0)
f.Active, f.Draggable = true, true
f.AutomaticSize = Enum.AutomaticSize.X  -- 自动调整宽度
f.Parent = screenGui

-- 使用UIListLayout自动排列标签
local layout = Instance.new("UIListLayout", f)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.Padding = UDim.new(0, 5)  -- 标签之间的间距
layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
layout.VerticalAlignment = Enum.VerticalAlignment.Center

-- 添加内边距
local padding = Instance.new("UIPadding", f)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.PaddingTop = UDim.new(0, 3)
padding.PaddingBottom = UDim.new(0, 3)

-- 创建标签
local labels = {}

-- 创建标签函数
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
        -- 使用TextService计算文本宽度
        local textService = game:GetService("TextService")
        local textSize = textService:GetTextSize(text, 12, Enum.Font.Code, Vector2.new(1000, 1000))
        label.Size = UDim2.new(0, textSize.X, 1, 0)
    end
    
    return label
end

-- 创建所有标签
labels[1] = createLabel("FPS:", Color3.new(1, 1, 1), false)  -- 静态标签
labels[2] = createLabel("0", Color3.fromRGB(0, 200, 255), true)  -- 动态标签
labels[3] = createLabel("Ping:", Color3.new(1, 1, 1), false)  -- 静态标签
labels[4] = createLabel("0", Color3.fromRGB(0, 200, 255), true)  -- 动态标签

-- 更新帧率和延迟
local t, c = 0, 0
R.Heartbeat:Connect(function()
    c += 1
    if tick() - t >= 1 then
        labels[2].Text = tostring(c)
        

        local ping = S.Network.ServerStatsItem["Data Ping"]:GetValue()
        labels[4].Text = tostring(math.floor(ping))
        
        c, t = 0, tick()
    end
end)
WindUI:AddTheme({
    Name = "Frosted Glacier",
    Accent = Color3.fromHex("#4cc9f0"),         -- 冰蓝点缀色
    Background = Color3.fromHex("#0a2540"),     -- 深蓝背景
    BackgroundTransparency = 0.1,
    Outline = Color3.fromHex("#2a4c6e"),        -- 中等蓝边框
    Text = Color3.fromHex("#ffffff"),          -- 白色文字
    Placeholder = Color3.fromHex("#94b3d1"),    -- 浅灰蓝占位符
    Button = Color3.fromHex("#2c7da0"),         -- 深蓝按钮
    Icon = Color3.fromHex("#e6f2ff"),          -- 浅蓝图标
    Hover = Color3.fromHex("#3a5f8a"),         -- 悬停效果
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
    Success = Color3.fromHex("#4ade80"),       -- 亮绿色
    Warning = Color3.fromHex("#fbbf24"),       -- 琥珀色
    Error = Color3.fromHex("#f87171"),         -- 亮红色
    Info = Color3.fromHex("#60a5fa"),          -- 亮蓝色
})
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")  -- 确保这里正确获取
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character
    local tpEnabled = true
    
    -- 飞行功能变量
    local flying = false
    local flySpeed = 50
    local flyBV, flyBG
    local flyConnection
    
    -- TPWalk变量
    local TPWalk = false
    local TPWalkingConnection = nil
    local currentSpeed = 1.0
    
    -- ESP变量
    local espCache = {}
    local espLoop
    
    local function setupCharacter()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.Died:Connect(function()
                task.wait()
                setupCharacter()
                if TPWalk then startTPWalk() end
                if flying then startFly() end
            end)
        end
    end
    
    -- 飞行功能
    local function startFly()
        if flying or not LocalPlayer.Character then return end
        
        local char = LocalPlayer.Character
        local hum = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        
        flying = true
        hum.PlatformStand = true
        
        -- 创建飞行物理控制器
        flyBV = Instance.new("BodyVelocity", root)
        flyBV.Name = "FlyBodyVelocity"
        flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        flyBV.Velocity = Vector3.new(0, 0, 0)
        
        flyBG = Instance.new("BodyGyro", root)
        flyBG.Name = "FlyBodyGyro"
        flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBG.P = 3000
        
        -- 飞行控制循环
        flyConnection = RunService.RenderStepped:Connect(function(delta)
            if not flying or not root then return end
            
            local camera = workspace.CurrentCamera
            local velocity = Vector3.new(0, 0, 0)
            
            -- 检查UserInputService是否存在
            if UserInputService then
                -- 基础方向控制
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    velocity = velocity + (camera.CFrame.LookVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    velocity = velocity - (camera.CFrame.LookVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    velocity = velocity - (camera.CFrame.RightVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    velocity = velocity + (camera.CFrame.RightVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    velocity = velocity + Vector3.new(0, flySpeed, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    velocity = velocity - Vector3.new(0, flySpeed, 0)
                end
            end
            
            flyBV.Velocity = velocity
            
            -- 平滑朝向
            if camera then
                flyBG.CFrame = CFrame.lookAt(root.Position, root.Position + camera.CFrame.LookVector)
            end
        end)
    end
    
    local function stopFly()
        flying = false
        
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        
        if flyBV then
            flyBV:Destroy()
            flyBV = nil
        end
        
        if flyBG then
            flyBG:Destroy()
            flyBG = nil
        end
        
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.PlatformStand = false
            end
        end
    end
    
    local function toggleFly()
        if flying then
            stopFly()
        else
            startFly()
        end
    end
    
    -- TPWalk函数
    local function getHum()
        local character = LocalPlayer.Character
        if character then
            return character:FindFirstChildOfClass("Humanoid")
        end
        return nil
    end
    
    local function getChar()
        return LocalPlayer.Character
    end
    
    local function stopTPWalk()
        if TPWalk then
            TPWalk = false
            if TPWalkingConnection then
                TPWalkingConnection:Disconnect()
                TPWalkingConnection = nil
            end
        end
    end
    
    local function startTPWalk(speed)
        if TPWalk then
            stopTPWalk()
            return
        end
        
        currentSpeed = tonumber(speed) or currentSpeed
        TPWalk = true
        
        TPWalkingConnection = RunService.Stepped:Connect(function(_, deltaTime)
            if TPWalk then
                local humanoid = getHum()
                if humanoid and humanoid.MoveDirection.Magnitude > 0 then
                    local moveDirection = humanoid.MoveDirection
                    local translation = moveDirection * currentSpeed * deltaTime * 10
                    local character = getChar()
                    if character then
                        character:TranslateBy(translation)
                    end
                end
            end
        end)
    end
    
    LocalPlayer.CharacterAdded:Connect(setupCharacter)
    setupCharacter()
    
    -- 简化的ESP配置
    local DrawingConfig = {
        Enabled = false,
        NameEnabled = true,
        DistanceEnabled = true,
        HealthEnabled = true,
        HealthText = true,  -- 新增：HP文本显示
        
        NameColor = Color3.fromRGB(255, 255, 255),
        DistanceColor = Color3.fromRGB(200, 200, 200),
        HealthColor = Color3.fromRGB(0, 255, 0),
    }
    
    -- 简化的ESP创建函数
    local function createSimpleESP(character, player, enabled)
        local billboard = character:FindFirstChild("SimpleESP")
        if not billboard and enabled then
            billboard = Instance.new("BillboardGui")
            billboard.Name = "SimpleESP"
            billboard.Size = UDim2.new(0, 200, 0, 60)
            billboard.StudsOffset = Vector3.new(0, 6, 0)
            billboard.AlwaysOnTop = true
            billboard.Enabled = true
            billboard.Parent = character
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "ESPText"
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Font = Enum.Font.Gotham
            textLabel.TextSize = 12
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextStrokeTransparency = 0.5
            textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            textLabel.RichText = true
            textLabel.TextYAlignment = Enum.TextYAlignment.Top
            textLabel.Parent = billboard
            
            espCache[character] = {
                Billboard = billboard,
                TextLabel = textLabel
            }
        end
        
        if billboard then
            local textLabel = billboard:FindFirstChild("ESPText")
            if textLabel then
                local humanoid = character:FindFirstChild("Humanoid")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoid and rootPart and humanoid.Health > 0 then
                    local distance = math.round(LocalPlayer:DistanceFromCharacter(rootPart.Position))
                    local health = math.floor(humanoid.Health)
                    local maxHealth = math.floor(humanoid.MaxHealth)
                    
                    local texts = {}
                    
                    if DrawingConfig.NameEnabled then
                        table.insert(texts, string.format("<font color='rgb(%d,%d,%d)'>%s</font>", 
                            DrawingConfig.NameColor.R * 255,
                            DrawingConfig.NameColor.G * 255,
                            DrawingConfig.NameColor.B * 255,
                            player.Name))
                    end
                    
                    if DrawingConfig.DistanceEnabled then
                        table.insert(texts, string.format("<font color='rgb(%d,%d,%d)'>距离: %dm</font>", 
                            DrawingConfig.DistanceColor.R * 255,
                            DrawingConfig.DistanceColor.G * 255,
                            DrawingConfig.DistanceColor.B * 255,
                            distance))
                    end
                    
                    if DrawingConfig.HealthEnabled and DrawingConfig.HealthText then
                        local healthColor = DrawingConfig.HealthColor
                        table.insert(texts, string.format("<font color='rgb(%d,%d,%d)'>HP: %d/%d</font>", 
                            healthColor.R * 255,
                            healthColor.G * 255,
                            healthColor.B * 255,
                            health, maxHealth))
                    end
                    
                    textLabel.Text = table.concat(texts, "\n")
                    billboard.Enabled = enabled
                else
                    billboard.Enabled = false
                end
            end
        end
    end
    
    local function clearESP()
        for character, cache in pairs(espCache) do
            if cache.Billboard then 
                cache.Billboard:Destroy() 
            end
        end
        espCache = {}
    end
    
    local function startESP()
        if espLoop then espLoop:Disconnect() end
        
        espLoop = RunService.Heartbeat:Connect(function()
            if not DrawingConfig.Enabled then
                clearESP()
                return
            end
            
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local character = player.Character
                    createSimpleESP(character, player, DrawingConfig.Enabled)
                end
            end
        end)
    end

    local LP = game:GetService("Players").LocalPlayer
game:GetService("RunService").Heartbeat:Connect(function()
    if fk3rd then
        LP.CameraMode = Enum.CameraMode.Classic
        LP.CameraMaxZoomDistance = 20
        LP.CameraMinZoomDistance = 20
    end
end)



    
    local Window = WindUI:CreateWindow({
        Title = "Snow Script",
        Icon = "snowflake",
        IconThemed = true,
        Author = "On Top Dev.Ninzo",
        Theme = 'Frosted Glacier',
        Size = UDim2.fromOffset(800, 500),  -- 缩小尺寸
        MinSize = Vector2.new(500, 300),    -- 最小尺寸
        Transparent = true,
        SideBarWidth = 180,  -- 缩小侧边栏
        HideSearchBar = true,
        ScrollBarEnabled = true,
    })
    
    Window:Tag({
        Title = "v2",
        Icon = "shield",
        Color = Color3.fromHex("#008cff"),
        Radius = 13,
    })
    
    Window:EditOpenButton({
        Title = "Snow",
        Icon = "snowflake",
        CornerRadius = UDim.new(0, 6),
        StrokeThickness = 1,
        Draggable = false,
    })
    
    local Main = Window:Section({ Title = "主菜单", Opened = true })
    local msgg = Main:Tab({ Title = "公告" })
    local Player = Main:Tab({ Title = "玩家" })
    local Esp = Main:Tab({ Title = "视觉" })
    Window:Divider()
    local servername = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    msgg:Paragraph({
        Title = "官方Q群: 435983304",
        Image = "send"
    })
    
    msgg:Paragraph({
        Title = "当前服务器: " .. servername,
        Image = "snowflake"
    })
    
    msgg:Paragraph({
        Title = "如果未加载出控件 请等待一段时间",
        Image = "rbxassetid://107633504561046"
    })

    msgg:Paragraph({
        Title = "官方DC:discord.gg/54MbbJzpnv",
        Image = "rbxassetid://107633504561046"
    })

    msgg:Paragraph({
        Title = "如有疑问 请求更新 bug修复 请加入官方DC",
        Image = "rbxassetid://107633504561046"
    })
    if not UserInputService.TouchEnabled then
        Player:Keybind({
            Title = "隐藏界面",
            Value = "G",
            Callback = function(v)
                Window:SetToggleKey(Enum.KeyCode[v])
            end
        })
    end
    
    -- 飞行功能
    Player:Section({ Title = "飞行控制" })
    
    Player:Slider({
        Title = "飞行速度",
        Value = {
            Min = 10,
            Max = 200,
            Default = 50,
        },
        Callback = function(value)
            flySpeed = value
        end
    })
    
    Player:Toggle({
        Title = "飞行模式",
        Value = false,
        Callback = function(state)
            if state then
                startFly()
            else
                stopFly()
            end
        end
    })

    Player:Section({ Title = "移动控制" })
    
    Player:Slider({
        Title = "移动速度",
        Value = {
            Min = 1,
            Max = 100,
            Default = 10,
        },
        Callback = function(value)
            currentSpeed = value
        end
    })
    
    Player:Toggle({
        Title = "加速",
        Value = false,
        Callback = function(state)
            if state then
                startTPWalk(currentSpeed)
            else
                stopTPWalk()
            end
        end
    })

    Player:Toggle({
        Title = "透明",
        Value = false,
        Callback = function()
local Run = game:GetService("RunService")
local P = game:GetService("Players").LocalPlayer
Run.RenderStepped:Connect(function()
    local Char = P.Character
    local Root = Char and Char:FindFirstChild("HumanoidRootPart")

    if Root then
        local Rainbow = Color3.fromHSV((tick() % 5) / 5, 1, 1)
        for _, v in pairs(Char:GetDescendants()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                if v.Name == "Head" then
                    v.Transparency = 1 
                    if v:FindFirstChild("face") then v.face:Destroy() end
                else
                    -- 身体其他部位
                    v.Material = Enum.Material.ForceField
                    v.Color = Rainbow
                    v.Transparency = 0.5
                end
            end
        end
    end
end)
        end
    })
Player:Toggle({
    Title = "第三人称",
    Value = false,
    Callback = function(v)
        fk3rd = v
        if not v then
            LP.CameraMode = Enum.CameraMode.LockFirstPerson
            LP.CameraMaxZoomDistance = 0.5
            LP.CameraMinZoomDistance = 0.5
        end
    end
})

    local flyjump
    Player:Toggle({
        Title = "连跳",
        Value = false,
        Callback = function(state)
            if state then
                if flyjump then flyjump:Disconnect() end
                flyjump = UserInputService.JumpRequest:Connect(function()
                    local character = LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                        if humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                end)
            else
                if flyjump then
                    flyjump:Disconnect()
                    flyjump = nil
                end
            end
        end
    })
    
    Player:Toggle({
        Title = "穿墙",
        Value = false,
        Callback = function(state)
            local character = LocalPlayer.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = not state
                    end
                end
            end
        end
    })
    
    local antivoidloop
    local function getRoot(character)
        return character and character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart")
    end
    
    Player:Toggle({
        Title = "防虚空掉落",
        Value = false,
        Callback = function(state)
            if state then
                if antivoidloop then antivoidloop:Disconnect() end
                local OrgDestroyHeight = Workspace.FallenPartsDestroyHeight
                antivoidloop = RunService.Stepped:Connect(function()
                    local char = LocalPlayer.Character
                    if char then
                        local root = getRoot(char)
                        if root and root.Position.Y <= OrgDestroyHeight + 25 then
                            root.Velocity = root.Velocity + Vector3.new(0, 250, 0)
                        end
                    end
                end)
            else
                if antivoidloop then
                    antivoidloop:Disconnect()
                    antivoidloop = nil
                end
            end
        end
    })

    Esp:Toggle({
        Title = "开启ESP",
        Value = false,
        Callback = function(state)
            DrawingConfig.Enabled = state
            if state then
                startESP()
            else
                if espLoop then
                    espLoop:Disconnect()
                    espLoop = nil
                end
                clearESP()
            end
        end
    })
    
    Esp:Toggle({
        Title = "显示玩家名",
        Value = DrawingConfig.NameEnabled,
        Callback = function(state)
            DrawingConfig.NameEnabled = state
        end
    })
    
    Esp:Toggle({
        Title = "显示距离",
        Value = DrawingConfig.DistanceEnabled,
        Callback = function(state)
            DrawingConfig.DistanceEnabled = state
        end
    })
    
    Esp:Toggle({
        Title = "显示HP文本",
        Value = DrawingConfig.HealthText,
        Callback = function(state)
            DrawingConfig.HealthText = state
        end
    })
    
    Esp:Colorpicker({
        Title = "名字颜色",
        Default = DrawingConfig.NameColor,
        Callback = function(color)
            DrawingConfig.NameColor = color
        end
    })
    
    Esp:Colorpicker({
        Title = "距离颜色",
        Default = DrawingConfig.DistanceColor,
        Callback = function(color)
            DrawingConfig.DistanceColor = color
        end
    })
    
    Esp:Colorpicker({
        Title = "HP颜色",
        Default = DrawingConfig.HealthColor,
        Callback = function(color)
            DrawingConfig.HealthColor = color
        end
    })
end
--俄亥俄州
local ohio = function(...)
    secureCheck(...)
    game.TextChatService.ChatWindowConfiguration.Enabled = true
    local banned = game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion")
    if banned then
        game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion"):Destroy()
    end

    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    
    localPlayer.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        rootPart = newCharacter:WaitForChild("HumanoidRootPart")
    end)

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local reqload = require(ReplicatedStorage.devv).load
    local makeToast = reqload("makeToast")
    makeToast("Snow on top", "rainbow", 5)
    
    local rs = game:GetService("RunService")
    local lp = game:GetService("Players").LocalPlayer
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    
    localPlayer.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        rootPart = newCharacter:WaitForChild("HumanoidRootPart")
    end)

    local atms = workspace.ATMs
    local off = Vector3.new(0, -3, 0)
    local rot = CFrame.Angles(1.57079632679, 0, 0)
    local target, timer, state = nil, 0, 0
    local FireServer = require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer
    local InvokeServer = require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).InvokeServer
    local items = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items

    local lastThrowTime = 0
    local tntid

    local function GetGuid(name)
        for _,v in pairs(items) do
            if v.name==name then
                return v.guid
            end
        end
    end

    local function GetTNT()
        tntid = GetGuid('TNT')
        if not tntid then
            InvokeServer('attemptPurchase', 'TNT')
        end
    end

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Signal = require(ReplicatedStorage.devv.client.Helpers.remotes.Signal)
    local FireServer, InvokeServer = Signal.FireServer, Signal.InvokeServer
    local Inventory = require(ReplicatedStorage.devv).load("v3item").inventory
    local NextThrow = 0

    -- 偷盗银行
    rs.Heartbeat:Connect(function()
        if not FromBank then return end

        local Robbery = workspace:FindFirstChild("BankRobbery")
        if not Robbery then return end

        local Vault = Robbery:FindFirstChild("VaultDoor")
        local VPos = Vault and (Vault:IsA("Model") and Vault:GetPivot().Position or Vault.Position)

        if VPos and (VPos - Vector3.new(1123.70703125, 13.76093578338623, -353.52301025390625)).Magnitude < 0.5 then
            if tick() < NextThrow then return end
            NextThrow = tick() + 5

            rootPart.CFrame = CFrame.new(1123.54749, 8.31286526, -364.052216)

            local TNT
            for _, v in pairs(Inventory.items) do
                if v.name == "TNT" then TNT = v.guid break end
            end

            if not TNT then
                InvokeServer("attemptPurchase", "TNT")
                return
            end

            local vaultPos = Vector3.new(1123.70703125, 13.76093578338623, -353.52301025390625)
            local direction = (vaultPos - rootPart.Position).Unit
            
            FireServer("equip", TNT)
            FireServer("throwItem", TNT, direction, Vector3.new(1124.0853271484, 5.3128666877747, -357.68710327148))
            FireServer("removeItem", TNT)
        else
            local Cash = Robbery:FindFirstChild("BankCash")
            local Main = Cash and Cash:FindFirstChild("Main")
            local Att = Main and Main:FindFirstChild("Attachment")
            local Prompt = Att and Att:FindFirstChild("ProximityPrompt")

            if Prompt and Prompt.Enabled then
                rootPart.CFrame = CFrame.new(1110.40369, 2, -325.485962)
                FireServer("stea\211\143BankCash")
            end
        end
    end)

    --自动查找物品
    local childrenCache = {}
    local itemMap= {}
    local function updateCache()
        childrenCache = game.Workspace.Game.Entities.ItemPickup:GetChildren()
        itemMap = {}
        for _, model in pairs(childrenCache) do
            for _, v in pairs(model:GetChildren()) do
                if (v:IsA("MeshPart") or v:IsA("Part")) then
                    local e = v:FindFirstChildOfClass("ProximityPrompt")
                    if e and e.ObjectText then
                        itemMap[e.ObjectText] = {
                            part = v,
                            prompt = e
                        }
                    end
                end
            end
        end
    end
    updateCache()
    local itemPickupFolder= game.Workspace.Game.Entities:FindFirstChild("ItemPickup")
    if itemPickupFolder then
        itemPickupFolder.ChildAdded:Connect(function()
            updateCache()
        end)
        itemPickupFolder.ChildRemoved:Connect(function()
            updateCache()
        end)
    end
    local function Autoitem(itemName)
        local itemData = itemMap[itemName]
        if itemData then
            rootPart.CFrame = itemData.part.CFrame
            itemData.prompt.RequiresLineOfSight = false
            itemData.prompt.HoldDuration = 0
            fireproximityprompt(itemData.prompt)
            return true
        end
        return false
    end

    local busy = false
    rs.Heartbeat:Connect(function()
        if FromATM and not busy then
            local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local dist, target = math.huge, nil
            for _, v in pairs(atms:GetChildren()) do
                if v:IsA("Model") and (v:GetAttribute("health") or 0) > 0 then
                    local d = (hrp.Position - v:GetPivot().Position).Magnitude
                    if d < dist then dist, target = d, v end
                end
            end
            if target then
                busy = true
                hrp.CFrame = (target:GetPivot() + off) * rot
                task.spawn(function()
                    task.wait(0.2)
                    target:SetAttribute("health", 0)
                    target:SetAttribute("isDestroyed", true)
                    task.wait(1)
                    busy = false
                end)
            end
        end
    end)

    rs.Heartbeat:Connect(function()
        if FromBalloon then -- 气球
            for _,v in pairs(game:GetService("ReplicatedStorage").devv.shared.Indicies.v3items.bin.Holdable:GetChildren()) do
                if v:IsA("ModuleScript") then
                    local itemData = require(v)
                    if itemData.holdableType == "Balloon" and itemData.name ~= 'Balloon' then
                        Autoitem(v.Name)
                    end
                end
            end
        end
    end)

    rs.Heartbeat:Connect(function()
        local cashBundles = Workspace.Game.Entities.CashBundle
        local MAX_DISTANCE = 20
        for _, descendant in pairs(cashBundles:GetDescendants()) do
                if descendant:IsA("ClickDetector") then
                    local detectorPos = descendant.Parent:GetPivot().Position
                    local distance = (rootPart.Position - detectorPos).Magnitude
                    if distance <= MAX_DISTANCE then
                        fireclickdetector(descendant)
                    end
                end
            end
    end)

    rs.Heartbeat:Connect(function()
        local bars = game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Holder.Bars
        bars.Strength.Visible = true
        if AntiDoll then
            local isRagdolled = game:GetService("Players").LocalPlayer:GetAttribute("isRagdoll")
            local load = require(game:GetService("ReplicatedStorage").devv).load
            local client = load("ClientReplicator")
            if isRagdolled then
                FireServer("setRagdoll", false)
                client.Set(lp, "ragdolled", false)
                lp:SetAttribute("isRagdoll", false)
            end
        end
        if AntiAdmin then
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player:GetAttribute("clanId") == "6557c057b60ffcc7226f532c" then
                    game:GetService("Players").LocalPlayer:Kick('[Anti Admin] Admin UserName = '.. player.Name)
                    break
                end
            end
        end
    end)

    local sig = require(game:GetService("ReplicatedStorage").devv).load("Signal")
    local ps, lp, lastTick = game:GetService("Players"), game:GetService("Players").LocalPlayer, 0

    game:GetService("RunService").Heartbeat:Connect(function()
        if callphone then
            if tick() - lastTick < 0.5 then return end
            lastTick = tick()
            for _, p in ps:GetPlayers() do
                if p ~= lp then
                    task.spawn(function()
                        local ok, id = sig.InvokeServer("attemptCall", p.UserId)
                        if ok then sig.FireServer("sendPhoneAction", id, "hangup") end
                    end)
                end
            end
        end
    end)

    game:GetService("RunService").Heartbeat:Connect(function()
        if Auarcuff then
            local devv = require(ReplicatedStorage.devv)
            local ClientReplicator = devv.load("ClientReplicator")
            local LocalPlayer = Players.LocalPlayer
            local Handcuffs
            for _, v in pairs(Inventory.items) do
                if v.name == "Handcuffs" then Handcuffs = v.guid break end
            end
            if not Handcuffs then
                InvokeServer("attemptPurchase", "Handcuffs")
                return
            end
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hum = player.Character:FindFirstChild("Humanoid")
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    if hum and root and hum.Health > 0 and hum.Health < 5 then
                        if (myRoot.Position - root.Position).Magnitude <= 30 then
                            if not ClientReplicator.Get(player, "cuffed") then
                                FireServer("equip", Handcuffs)
                                FireServer("cuffPlayer", player)
                            end
                        end
                    end
                end
            end
        end
    end)

    --fake
    game:GetService('RunService').Heartbeat:Connect(function()
        if openfake then
            local v_u_1 = require(game:GetService("ReplicatedStorage").devv).load
            local v_u_2 = v_u_1("moneyDisplay")
            v_u_1("v3sound")
            v_u_2.current = getgenv().fakemoney
            v_u_2.tweenTo = getgenv().fakemoney
            local v6 = v_u_1("v3item").inventory.getEquipped()
            if v6 and v6.name == "Wallet" then
                v6.controller:updateMoney(getgenv().fakemoney)
            end
        end
    end)

    local lastCheck = 0
    game:GetService('RunService').Heartbeat:Connect(function()
        if autokz then
            if tick() - lastCheck < 2 then
                return
            end
            lastCheck = tick()
            local Mask = character:FindFirstChild("Black Bandana")
            if not Mask then
                kzid = GetGuid('Black Bandana')
                if not kzid then
                    InvokeServer('attemptPurchase', 'Black Bandana')
                end
                for i, v in next, items do
                    if v.name == "Black Bandana" then
                        sugid = v.guid
                        if not Mask then
                            FireServer("equip", sugid)
                            FireServer("wearMask", sugid)
                        end
                        break
                    end
                end
            end
        end
    end)

    --silent aim
    local silentaim = false
    local function findTarget()
        if not silentaim then return nil end
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera
        
        local closestTarget = nil
        local closestDistance = math.huge
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local distance = (head.Position - Camera.CFrame.Position).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestTarget = head
                    end
                end
            end
        end
        return closestTarget
    end

    local function setupHooks()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local success, loadModule = pcall(function() 
            return require(ReplicatedStorage:WaitForChild("devv")).load 
        end)
        if not success then return end
        local v3item = loadModule("v3item")
        if v3item and v3item.projectiles then
            local oldFn = v3item.projectiles.newProjectileOfType
            v3item.projectiles.newProjectileOfType = function(ptype, pdata)
                local target = findTarget()
                if target and pdata.cframe then
                    pdata.cframe = CFrame.lookAt(pdata.cframe.Position, target.Position)
                end
                return oldFn(ptype, pdata)
            end
        end
    end
    setupHooks()

    --safe
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local TweenService = game:GetService("TweenService")

    function buyItem(itemName)
        InvokeServer("attemptPurchase", itemName)
    end

    function Teleport(cframe)
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = cframe})
        tween:Play()
        tween.Completed:Wait()
    end

    --auto
    local RunService = game:GetService("RunService")
    local zbtick = 0  -- 初始化时间记录

    RunService.Heartbeat:Connect(function()
        if autozbd then
            if tick() - zbtick < 0.3 then
                return
            end
            zbtick = tick()
            local cases = Workspace:FindFirstChild("GemRobbery"):FindFirstChild("JewelryCases")
            if cases then
                for _, descendant in pairs(cases:GetDescendants()) do
                    if not state then break end
                    if descendant:IsA("ProximityPrompt") and descendant.ActionText == "Steal" and descendant.Enabled == true then
                        descendant.HoldDuration = 0
                        Teleport(CFrame.new(descendant.Parent.Position + Vector3.new(0, 0, 0)))
                        fireproximityprompt(descendant)
                    end
                end
            end
        end
    end)

    RunService.Heartbeat:Connect(function()
        if autouse then
            for i, v in pairs(items) do
            if v.type == "Consumable" and v.subtype ~= "vest" and v.subtype ~= "food" and v.name ~= "Lockpick" then
            FireServer("equip", v.guid)
            FireServer("useConsumable", v.guid)
            FireServer("removeItem", v.guid)
            end
            end
        end
        if autohealth then
            local character = game:GetService("Players").LocalPlayer.Character
            bdid = GetGuid('Bandage')
            if not bdid then
                InvokeServer('attemptPurchase', 'Bandage')
                return
            end
            for i, v in next, items do
                if v.name == 'Bandage' then
                    bande = v.guid
                    local humanoid = character:FindFirstChild("Humanoid")
                    if humanoid.Health ~= 0 and humanoid.Health < humanoid.MaxHealth then
                        FireServer("equip", bande)
                        FireServer("useConsumable", bande)
                        FireServer("removeItem", bande)
                    end
                    break
                end
            end
        end

        if autovest then
            veid = GetGuid('Light Vest')
            if not veid then
                InvokeServer('attemptPurchase', 'Light Vest')
                return
            end
            for i, v in next, items do
                if v.subtype == "vest" then
                    light = v.guid
                    local armor = localPlayer:GetAttribute('armor')
                    if armor == nil or armor <= 0 then
                        FireServer("equip", light)
                        FireServer("useConsumable", light)
                        FireServer("removeItem", light)
                    end
                    break
                end
            end
        end

        if autobx then
            veid = GetGuid('Lockpick')
            if not veid then
                InvokeServer('attemptPurchase', 'Lockpick')
                return
            end
            local chestTypes = {"SmallChest", "LargeChest", "SmallSafe", "MediumSafe", "LargeSafe", "JewelSafe", "GoldJewelSafe"}
            for _, chestType in pairs(chestTypes) do
                local chestFolder = workspace.Game.Entities:FindFirstChild(chestType)
                if chestFolder then
                    for _, chest in pairs(chestFolder:GetChildren()) do
                        if not state then break end
                        if chest.PrimaryPart then
                            local prompt = chest:FindFirstChild("ProximityPrompt", true)
                            if prompt and prompt.Enabled then
                                Teleport(chest.PrimaryPart.CFrame * CFrame.new(0, 3, 0))
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                end
            end
        end

        if sell then
            for i, v in pairs(items) do
                if (v.type == "Holdable" and v.subtype == "gem" and v.sellPrice < 5000) or (v.subtype == "valuable") or (v.type == "Gun" and v.cost < 3999 and v.name ~= "Raygun")then
                    FireServer("equip", v.guid)
                    FireServer("sellItem", v.guid)
                end
            end
        end

        if remls then
            for i, v in pairs(items) do
                if (v.type == "Consumable" and v.subtype == "food" and v.name ~= "Bandage" ) or (v.type == "Throwable" and v.cost < 500 and v.name ~= "Ninja Star" and v.name ~= "Tomahawk") or (v.type == "Melee" and v.cost > 100 ) then
                    FireServer("removeItem", v.guid)
                end
            end
        end

        if autoblock then
            Autoitem("Green Lucky Block")
            Autoitem("Orange Lucky Block")
            Autoitem("Purple Lucky Block")
        end

        if automoss then
            Autoitem("Medium Present")
            Autoitem("Large Present")
        end

        if autoxybs then
            Autoitem("Diamond") --钻石
            Autoitem("Void Gem") --虚空宝石
            Autoitem("Dark Matter Gem") -- 暗物质宝石
            Autoitem("Rollie") --劳力士
            Autoitem("Gold Crown")     -- 金皇冠
            Autoitem("Gold Cup")       -- 金杯
            Autoitem("Pearl Necklace")          -- 珍珠项链
        end

        if autoxywp then
            Autoitem("Blue Candy Cane")
            Autoitem("Suitcase Nuke")
            Autoitem("Nuke Launcher")
            Autoitem("Easter Basket")
            Autoitem("Gold Cup")
            Autoitem("Gold Crown")
            Autoitem("Treasure Map")
            Autoitem("Spectral Scythe")
        end

        if autoptbs then
            Autoitem("Amethyst")
            Autoitem("Sapphire")
            Autoitem("Emerald")
            Autoitem("Topaz")
            Autoitem("Ruby")
        end

        if automoney then
            Autoitem("Money Printer")
        end

        if card then
            local red = false
            for i, v in next, items do
                if v.name == "Military Armory Keycard" then
                    red = true
                    break
                end
            end
            if not red then
                Autoitem("Military Armory Keycard")
            end
        end
    end)

    --Kill AuraRange
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local TS = game:GetService("TweenService")
    local DB = game:GetService("Debris")

    local LP = Players.LocalPlayer
    local Devv = require(ReplicatedStorage.devv)
    local Remote = require(ReplicatedStorage.devv.client.Helpers.remotes.Signal)
    local Inventory = Devv.load("v3item").inventory
    local guid = Devv.load("GUID")

    getgenv().fbx = 0
    getgenv().fby = 0
    getgenv().fbz = 5
    local targetPlayers = {}
    local lastAttack = 0
    local avoidPosition = Vector3.new(-23.943367, 53.9272232, -40.3150673)
    local avoidRadius = 100
    local playerDropdown
    local isBlinkActive = false
    local originalPosition = nil
    local blinkStartTime = 0

    local function createTrace(targetPos)
        local S = LP.Character.PrimaryPart.Position + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
        local mag = (targetPos - S).Magnitude
        local P = Instance.new("Part")
        P.Name, P.Anchored, P.CanCollide, P.CastShadow = "Trace", true, false, false
        P.Material, P.Color, P.Size = Enum.Material.Neon, Color3.fromHSV(tick() % 1, 0.8, 1), Vector3.new(0.15, 0.15, mag)
        P.CFrame, P.Parent = CFrame.lookAt(S, targetPos) * CFrame.new(0, 0, -mag/2), workspace
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://5633695679"
        sound.Parent = P
        sound:Play()
        DB:AddItem(sound, 1)
        TS:Create(P, TweenInfo.new(1), {Transparency = 1, Size = Vector3.new(0, 0, mag)}):Play()
        DB:AddItem(P, 1)
    end

    local function throw()
        if getgenv().fbsx == "Gun Kill" then
            local inv = require(ReplicatedStorage.devv.client.Objects.v3item.modules.inventory)
            local gun = inv.getFromName("Raygun")
            if not gun then
                Remote.InvokeServer("attemptPurchase", "Raygun")
                task.wait(0.3)
                gun = inv.getFromName("Raygun")
            end
            if gun then
                Remote.FireServer("equip", gun.guid)
            end
            return
        end

        Remote.InvokeServer("attemptPurchase", getgenv().fbsx)
        local blade
        for _, v in pairs(Inventory.items) do
            if v.name == getgenv().fbsx then
                blade = v.guid
                break
            end
        end
        task.wait(0.1)
        Remote.FireServer("equip", blade)
        task.wait(0.1)
        local _, id = Remote.InvokeServer("throwSticky", guid(), getgenv().fbsx, blade, Vector3.zero, Vector3.zero)
        getgenv().bladeid = id
    end

    local function updatePlayerList()
        local playerNames = {"ALL"}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LP then
                table.insert(playerNames, player.Name)
            end
        end
        
        if playerDropdown then
            playerDropdown:Refresh(playerNames, true)
        end
    end

    local function onPlayerAdded(player)
        updatePlayerList()
    end

    local function onPlayerRemoving(player)
        updatePlayerList()
    end

    Players.PlayerAdded:Connect(onPlayerAdded)
    Players.PlayerRemoving:Connect(onPlayerRemoving)

    RunService.Heartbeat:Connect(function()
        if not (aurablade or getgenv().tpplayfb) and not isBlinkActive then return end
        local target, dist = nil, math.huge
        local myChar = LP.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
        local myRoot = myChar.HumanoidRootPart

        for _, v in pairs(Players:GetPlayers()) do
            local isTarget = (#targetPlayers == 0) or table.find(targetPlayers, "ALL") or table.find(targetPlayers, v.Name)
            if not isTarget then continue end
            if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 and not v.Character:FindFirstChildOfClass("ForceField") and not LP:IsFriendsWith(v.UserId) then
                local targetPos = v.Character.HumanoidRootPart.Position
                local avoidDist = (targetPos - avoidPosition).Magnitude
                if avoidDist <= avoidRadius then continue end
                
                local mag = (myRoot.Position - targetPos).Magnitude
                if mag < dist then
                    dist = mag
                    target = v.Character.Head
                end
            end
        end

        if target then
            local targetPos = target.Position
            local avoidDist = (targetPos - avoidPosition).Magnitude
            
            if getgenv().tpplayfb and avoidDist > avoidRadius then
                myRoot.CFrame = target.CFrame * CFrame.new(getgenv().fbx, getgenv().fby, getgenv().fbz)
            end

            if aurablade or isBlinkActive then
                local currentTime = tick()
                local attackInterval = isBlinkActive and 0 or (getgenv().fbsx == "Gun Kill" and 0 or 0.1)
                local attackDist = (myRoot.Position - targetPos).Magnitude
                
                if currentTime - lastAttack >= attackInterval and (getgenv().fbsx == "Gun Kill" or attackDist <= 200) and avoidDist > avoidRadius then
                    
                    if isBlinkActive then
                        if not originalPosition then
                            originalPosition = myRoot.Position
                            myRoot.CFrame = CFrame.new(1000, 1000, 1000)
                            blinkStartTime = currentTime
                            return
                        elseif currentTime - blinkStartTime >= math.random(1, 3) then
                            myRoot.CFrame = target.CFrame * CFrame.new(getgenv().fbx, getgenv().fby, getgenv().fbz)
                            if getgenv().fbsx == "Gun Kill" then
                                local item = Devv.load("v3item").GetEquipped(LP)
                                if item and item.type == "Gun" then
                                    lastAttack = currentTime
                                    if item.ammoManager and item.ammoManager.ammo > 0 then
                                        local g = guid()
                                        createTrace(targetPos)
                                        Remote.FireServer("replicateProjectiles", item.guid, {{g, target.CFrame}}, item.firemode)
                                        Remote.FireServer("projectileHit", g, "player", {
                                            hitSize = target.Size,
                                            hitPart = target,
                                            pos = targetPos,
                                            hitPlayerId = Players:GetPlayerFromCharacter(target.Parent).UserId
                                        })
                                        item.ammoManager.ammo = item.ammoManager.ammo - 1
                                    else
                                        Remote.InvokeServer("attemptPurchaseAmmo", item.name)
                                        Remote.FireServer("reload", item.guid)
                                    end
                                end
                            elseif getgenv().bladeid then
                                lastAttack = currentTime
                                createTrace(targetPos)
                                Remote.InvokeServer("hitSticky", getgenv().bladeid, target, target.CFrame, target.CFrame)
                            end
                            task.wait(0.05)
                            myRoot.CFrame = CFrame.new(originalPosition)
                            originalPosition = nil
                            isBlinkActive = false
                        end
                    else
                        if getgenv().fbsx == "Gun Kill" then
                            local item = Devv.load("v3item").GetEquipped(LP)
                            if item and item.type == "Gun" then
                                lastAttack = currentTime
                                if item.ammoManager and item.ammoManager.ammo > 0 then
                                    local g = guid()
                                    createTrace(targetPos)
                                    Remote.FireServer("replicateProjectiles", item.guid, {{g, target.CFrame}}, item.firemode)
                                    Remote.FireServer("projectileHit", g, "player", {
                                        hitSize = target.Size,
                                        hitPart = target,
                                        pos = targetPos,
                                        hitPlayerId = Players:GetPlayerFromCharacter(target.Parent).UserId
                                    })
                                    item.ammoManager.ammo = item.ammoManager.ammo - 1
                                else
                                    Remote.InvokeServer("attemptPurchaseAmmo", item.name)
                                    Remote.FireServer("reload", item.guid)
                                end
                            end
                        elseif getgenv().bladeid then
                            lastAttack = currentTime
                            createTrace(targetPos)
                            Remote.InvokeServer("hitSticky", getgenv().bladeid, target, target.CFrame, target.CFrame)
                        end
                    end
                end
            end
        end
    end)

    local Ohio = Window:Section({Title = "Ohio", Opened = true})
    local Combat = Ohio:Tab({Title = "击杀"})

    local initialPlayerList = {"ALL"}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LP then
            table.insert(initialPlayerList, player.Name)
        end
    end

    playerDropdown = Combat:Dropdown({
        Title = "目标玩家",
        Desc = "选择目标玩家（ALL=全体）",
        Values = initialPlayerList,
        Value = {"ALL"},
        Multi = true,
        AllowNone = true,
        Callback = function(option) 
            targetPlayers = option
        end
    })

    Combat:Dropdown({
        Title = "击杀方式",
        Values = {"Ninja Star", "Tomahawk", "Banana Peel", "Snowball", "Gun Kill"},
        Multi = false,
        Callback = function(option)
            getgenv().fbsx = option[1] or option
        end
    })

    Combat:Toggle({
        Title = "自动击杀",
        Default = false,
        Callback = function(state)
            if state then 
                throw() 
            end
            aurablade = state
        end
    })

    Combat:Toggle({
        Title = "闪现",
        Default = false,
        Callback = function(state)
            isBlinkActive = state
            if not state then
                originalPosition = nil
            end
        end
    })

    Combat:Toggle({
        Title = "TP玩家",
        Default = false,
        Callback = function(state)
            getgenv().tpplayfb = state
        end
    })

    Combat:Slider({
        Title = "X",
        Desc = "TP 距离",
        Value = {Min = -20, Max = 20, Default = 0},
        Callback = function(value) getgenv().fbx = value end
    })

    Combat:Slider({
        Title = "Y",
        Desc = "TP 距离",
        Value = {Min = -20, Max = 20, Default = 0},
        Callback = function(value) getgenv().fby = value end
    })

    Combat:Slider({
        Title = "Z",
        Desc = "TP 距离",
        Value = {Min = -20, Max = 20, Default = 5},
        Callback = function(value) getgenv().fbz = value end
    })

    local Kill = Ohio:Tab({ Title = "战斗" })

    Kill:Toggle({
        Title = "自动护甲",
        Default = false,
        Callback = function(state)
            autovest = state
        end
    })

    Kill:Toggle({
        Title = "自动回血",
        Default = false,
        Callback = function(state)
            autohealth = state
        end
    })

    Kill:Toggle({
        Title = "自动口罩",
        Default = false,
        Callback = function(state)
            autokz = state
        end
    })

    Kill:Toggle({
        Title = "电话骚扰",
        Default = false,
        Callback = function(state)
            callphone = state
        end
    })

    Kill:Toggle({
        Title = "逮捕光环",
        Default = false,
        Callback = function(state)
            Auarcuff = state
        end
    })

    local Auto = Ohio:Tab({ Title = "自动" })

    Auto:Toggle({
        Title = "自动摧毁ATM",
        Default = false,
        Callback = function(state)
           FromATM = state
        end
    })

    Auto:Toggle({
        Title = "自动偷盗银行",
        Default = false,
        Callback = function(state)
           FromBank = state
        end
    })

    Auto:Toggle({
        Title = "自动打开保险",
        Default = false,
        Callback = function(state)
            autobx = state
        end
    })

    Auto:Toggle({
        Title = "自动珠宝店",
        Default = false,
        Callback = function(state)
            autozbd = state
        end
    })

    Auto:Toggle({
        Title = "自动售卖",
        Value = false,
        Callback = function(state) 
            sell = state
        end
    })

    Auto:Toggle({
        Title = "自动移除垃圾",
        Value = false,
        Callback = function(state) 
            remls = state
        end
    })

    Auto:Toggle({
        Title = "自动使用消耗品",
        Value = false,
        Callback = function(state) 
            autouse = state
        end
    })

    local From = Ohio:Tab({ Title = "寻找" })

    From:Toggle({
        Title = "自动寻找稀有物品",
        Default = false,
        Callback = function(state)
            autoxywp = state
        end
    })

    From:Toggle({
        Title = "自动寻找气球",
        Default = false,
        Callback = function(state)
            FromBalloon = state
        end
    })

    From:Toggle({
        Title = "自动寻找印钞机",
        Default = false,
        Callback = function(state)
            automoney = state
        end
    })

    From:Toggle({
        Title = "自动寻找普通宝石",
        Default = false,
        Callback = function(state)
            autoptbs = state
        end
    })

    From:Toggle({
        Title = "自动寻找稀有宝石",
        Default = false,
        Callback = function(state)
            autoxybs = state
        end
    })

    From:Toggle({
        Title = "自动寻找礼物",
        Default = false,
        Callback = function(state)
            automoss = state
        end
    })

    From:Toggle({
        Title = "自动寻找幸运方块",
        Default = false,
        Callback = function(state)
            autoblock = state
        end
    })

    From:Toggle({
        Title = "自动寻找红卡",
        Default = false,
        Callback = function(state)
            card = state
        end
    })

    local Countermeasures = Ohio:Tab({ Title = "反制" })
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local reqload = require(ReplicatedStorage.devv).load
    local makeToast = reqload("makeToast")

    Countermeasures:Button({
        Title = "重进当前服务器[慎！]",
        Locked = false,
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    })

    Countermeasures:Input({
        Title = "弹窗提醒内容",
        Value = "",
        Type = "Input",
        Callback = function(input)
            getgenv().make = input
        end
    })

    Countermeasures:Input({
        Title = "弹窗提醒时长(秒)",
        Value = "",
        Type = "Input",
        Callback = function(input)
            getgenv().makes = input
        end
    })

    Countermeasures:Button({
        Title = "开启弹窗",
        Locked = false,
        Callback = function()
            makeToast(getgenv().make, "rainbow", getgenv().makes)
        end
    })

    Countermeasures:Button({
        Title = "通话禁音",
        Locked = false,
        Callback = function()
            require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("setAirplaneMode", true)
            local lp = game:GetService('Players').LocalPlayer
            lp:SetAttribute('isAirplaneMode', true)
        end
    })

    Countermeasures:Button({
        Title = "不允许战斗中",
        Locked = false,
        Callback = function()
            local combatModule = require(game:GetService("ReplicatedStorage").devv.client.Helpers.ui.combatIndicator)
            if hookfunction then
                hookfunction(combatModule.isInCombat, function() return false end)
                hookfunction(combatModule.enterCombat, function() end)
            end
        end
    })

    Countermeasures:Button({
        Title = "不允许被抓取",
        Locked = false,
        Callback = function()
            local GrabHandler = require(game:GetService("ReplicatedStorage").devv.client.Handlers.GrabHandler)
            local originalCheckValid = GrabHandler.CheckValid
            GrabHandler.CheckValid = function(p28, p29, p30)
                if p29 == game:GetService("Players").LocalPlayer then
                    return false
                end
                return originalCheckValid(p28, p29, p30)
            end
            local originalGrab = GrabHandler.Grab
            GrabHandler.Grab = function(p54, p55)
                if p55 == game:GetService("Players").LocalPlayer then
                    return
                end
                return originalGrab(p54, p55)
            end
        end
    })

    Countermeasures:Button({
        Title = "清除树叶",
        Locked = false,
        Callback = function()
            for _, part in pairs(workspace:GetDescendants()) do
                if part.Name == "Leaves" and part:IsA("MeshPart") then
                    part:Destroy()
                end
            end
        end
    })

    Countermeasures:Button({
        Title = "反坐下",
        Locked = false,
        Callback = function()
            local plr = game:GetService("Players").LocalPlayer
            local function antiSit(char)
                local hum = char:WaitForChild("Humanoid")
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                hum:GetPropertyChangedSignal("Sit"):Connect(function()
                    if hum.Sit then
                        hum.Sit = false
                    end
                end)
                hum.Sit = false
            end
            if plr.Character then antiSit(plr.Character) end
            plr.CharacterAdded:Connect(antiSit)
        end
    })

    Countermeasures:Toggle({
        Title = "反布娃娃",
        Default = false,
        Callback = function(state)
            AntiDoll = state
        end
    })

    Countermeasures:Toggle({
        Title = "反管理",
        Default = false,
        Callback = function(state)
            AntiAdmin = state
        end
    })

    local Bypass = Ohio:Tab({ Title = "绕过" })

    Bypass:Input({
        Title = "伪装金钱数量",
        Value = "",
        Type = "Input",
        Callback = function(input)
            getgenv().fakemoney = input
        end
    })

    Bypass:Toggle({
        Title = "开启伪装",
        Default = false,
        Callback = function(state)
            openfake = state
        end
    })

    Bypass:Slider({
        Title = "物品栏数量",
        Value = {
            Min = 6,
            Max = 12,
            Default = 9,
        },
        Callback = function(value)
            local sum = require(ReplicatedStorage.devv.client.Objects.v3item.modules.inventory)
            sum.numSlots = value
        end
    })

    Bypass:Button({
        Title = "解锁移动经销商",
        Locked = false,
        Callback = function()
            local Signal = require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal)
            local Purchase = Signal.InvokeServer
            Signal.InvokeServer = function(self, ...)
                if self == "attemptPurchase" then
                    local itemName, isDealer = ...
                    return Purchase(self, itemName, false, select(3, ...))
                elseif self == "attemptPurchaseAmmo" then
                    local itemName, isDealer = ...
                    return Purchase(self, itemName, false, select(3, ...))
                end
                return Purchase(self, ...)
            end
            game:GetService("Players").LocalPlayer:SetAttribute("mobileDealer",true)
            local mobileDealer=require(ReplicatedStorage.devv.shared.Indicies.mobileDealer)
            for category,items in pairs(mobileDealer)do for _,item in ipairs(items)do item.stock=12e12 end end
            table.insert(mobileDealer.Gun,{itemName="Acid Gun",stock=12e12})
        end
    })

    Bypass:Button({
        Title = "解锁全皮肤",
        Locked = false,
        Callback = function()
            local ReplicatedStorage = game:GetService('ReplicatedStorage')
            local skinsModule = require(ReplicatedStorage.devv.client.Helpers.ui.screens.CaseMenu.Skins)
            local load = require(ReplicatedStorage.devv).load
            local state = load("state")
            hookfunction(skinsModule.AttemptEquip, function(self, itemName, skinName)
                local skinToEquip = skinName
                if self:IsSkinEquipped(itemName, skinName) then
                    skinToEquip = nil
                end
                state.data.equippedSkins[itemName] = skinToEquip
                load("v3item").inventory.unequipAll()
                load("v3item").inventory.skinUpdate(itemName, skinToEquip)
                self:_setEquipped(itemName, skinToEquip)
                return true
            end)
            local skins = load("skins")
            for skinName in pairs(skins.skinData) do
                for _, itemName in pairs(skins.compatabilities.Generic) do
                    state.data.ownedSkins[itemName] = state.data.ownedSkins[itemName] or {}
                    state.data.ownedSkins[itemName][skinName] = 1
                end
            end
        end
    })

    Bypass:Button({
        Title = "解锁高级表情",
        Locked = false,
        Callback = function()
            for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Emotes.Frame.ScrollingFrame:GetDescendants()) do
                if v.Name == "Locked" then
                    v.Visible = false
                end
            end
        end
    })

    Bypass:Button({
        Title = "绕过火&酸伤害",
        Locked = false,
        Callback = function()
            local fire = game:GetService("ReplicatedStorage").devv.remoteStorage.fireHit
            local acid = game:GetService("ReplicatedStorage").devv.remoteStorage.acidHit
            if fire and acid then
                fire:Destroy()
                acid:Destroy()
            end
        end
    })

    local weapon = Ohio:Tab({ Title = "武器" })

    weapon:Toggle({
        Title = "静默自瞄(子弹不拐弯)",
        Default = false,
        Callback = function(state)
            silentaim = state
        end
    })

    weapon:Button({
        Title = "全枪无后座",
        Locked = false,
        Callback = function()
            for _,particle in pairs(game:GetDescendants()) do
                if particle:IsA("ParticleEmitter") then
                    particle:Destroy()
                end
            end
            game.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("ParticleEmitter") then
                    descendant:Destroy()
                end
            end)
            local inv = require(game:GetService("ReplicatedStorage").devv).load("v3item").inventory.items
            for k,v in pairs(inv) do 
                if v.type == "Gun" then
                    v.recoilAdd = 0
                    v.maxRecoil = 0
                    v.recoilDiminishFactor = 0
                    v.recoilFastDiminishFactor = 0
                end 
            end
            local gunTemplates = game:GetService("ReplicatedStorage").devv.shared.Indicies.v3items.bin.Gun
            for _,gunTemplate in pairs(gunTemplates:GetChildren()) do
                if gunTemplate:IsA("ModuleScript") then
                    local template = require(gunTemplate)
                    template.recoilAdd = 0
                    template.maxRecoil = 0
                    template.recoilDiminishFactor = 0
                    template.recoilFastDiminishFactor = 0
                end
            end
        end
    })

    weapon:Button({
        Title = "全枪据点",
        Locked = false,
        Callback = function()
            local inv = require(game:GetService("ReplicatedStorage").devv).load("v3item").inventory.items
            for k,v in pairs(inv) do 
                if v.type == "Gun" then
                    v.baseSpread = 0
                    v.baseAimSpread = 0
                    v.spread = 0
                    v.aimSpread = 0
                end 
            end
            local gunTemplates = game:GetService("ReplicatedStorage").devv.shared.Indicies.v3items.bin.Gun
            for _,gunTemplate in pairs(gunTemplates:GetChildren()) do
                if gunTemplate:IsA("ModuleScript") then
                    local template = require(gunTemplate)
                    template.baseSpread = 0
                    template.baseAimSpread = 0
                end
            end
        end
    })

    weapon:Button({
        Title = "全枪射速",
        Locked = false,
        Callback = function()
            local inv = require(game:GetService("ReplicatedStorage").devv).load("v3item").inventory.items
            for k,v in pairs(inv) do 
                if v.type == "Gun" then
                    v.fireDebounce = 0
                end 
            end
            local gunTemplates = game:GetService("ReplicatedStorage").devv.shared.Indicies.v3items.bin.Gun
            for _,gunTemplate in pairs(gunTemplates:GetChildren()) do
                if gunTemplate:IsA("ModuleScript") then
                    local template = require(gunTemplate)
                    template.fireDebounce = 0
                end
            end
        end
    })

    weapon:Button({
        Title = "全枪瞬击",
        Callback = function()
            local inv = require(game.ReplicatedStorage.devv).load("v3item").inventory.items
            for k,v in pairs(inv) do 
                if v.type == "Gun" then
                    v.speedMax = 9999
                    v.speedDropoff = 0
                    v.projectileLifetime = 9999
                end 
            end
            local gunTemplates = game.ReplicatedStorage.devv.shared.Indicies.v3items.bin.Gun
            for _,v in pairs(gunTemplates:GetChildren()) do
                if v:IsA("ModuleScript") then
                    local t = require(v)
                    t.speedMax = 9999
                    t.speedDropoff = 0
                    t.projectileLifetime = 9999
                end
            end
        end
    })

    weapon:Button({
        Title = "快速换弹",
        Callback = function()
            local inv = require(game.ReplicatedStorage.devv).load("v3item").inventory.items
            for k,v in pairs(inv) do 
                if v.type == "Gun" then
                    v.reloadTime = 0
                end 
            end
            local gunTemplates = game.ReplicatedStorage.devv.shared.Indicies.v3items.bin.Gun
            for _,v in pairs(gunTemplates:GetChildren()) do
                if v:IsA("ModuleScript") then
                    local t = require(v)
                    t.reloadTime = 0
                end
            end
        end
    })
end
--通缉
local wanted = function(...)
secureCheck(...)
local Wanted = Window:Section({ Title = "通缉", Opened = true })
local Kill = Wanted:Tab({ Title = "战斗" })
local Auto = Wanted:Tab({ Title = "自动" })
local Bypass = Wanted:Tab({ Title = "绕过" })
local TP = Wanted:Tab({ Title = "传送" })
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local character = Player.Character or Player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local devModule = require(ReplicatedStorage.Devv)
local FireServer = devModule.GetModule("Network").FireServer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local plr = game:GetService("Players").LocalPlayer
local Devv = require(ReplicatedStorage.Devv)
local ivk = Devv.GetModule("Network").InvokeServer
local gz = workspace.Local.Gizmos.Green
local old
old = hookmetamethod(game,'__namecall',function(self, ...)
local args = {...}
if bypasspt and args[1] == "Turret" then
return nil
end
return old(self,...)
end)
local function clc()
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local ids = {}
    for _, v in pairs(gz:GetChildren()) do
        if v.Name == "Cash" then
            local oid = v:GetAttribute("objectId")
            if oid then
                local p = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart")
                if p and (hrp.Position - p.Position).Magnitude then
                    table.insert(ids, oid)
                end
            end
        end
    end
    if #ids > 0 then
        ivk("collectCurrency", ids)
    end
end
for _, v in pairs(getgc(true)) do
    if type(v) == "table" then
        pcall(function()
            if rawget(v, "exploitDetected") and typeof(v.exploitDetected) == "Instance" then
                for _, c in pairs(getconnections(v.exploitDetected.OnClientEvent)) do
                    c:Disable()
                end
                rawset(v, "exploitDetected", Instance.new("RemoteEvent"))
            end
            if rawget(v, "gassed") and typeof(v.gassed) == "Instance" then
                for _, c in pairs(getconnections(v.gassed.OnClientEvent)) do
                    c:Disable()
                end
                rawset(v, "gassed", Instance.new("RemoteEvent"))
            end
        end)
    end
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local Debris = game:GetService("Debris")

local Devv = require(ReplicatedStorage.Devv)
local fs = Devv.GetModule("Network").FireServer
local ivk = Devv.GetModule("Network").InvokeServer
local mu = Devv.load("MathUtil")
local nid = Devv.load("NUID")
local ct = Devv.load("ClientTools")

local EquippedScreen = Devv.load("EquippedScreen") 

local isReloading = false
local hitSound = "rbxassetid://5633695679"

local function playHitSound()
    local sound = Instance.new("Sound")
    sound.SoundId = hitSound
    sound.Volume = 0.8
    sound.Parent = workspace
    sound:Play()
    Debris:AddItem(sound, sound.TimeLength + 0.1)
end

local function CreateThickTracer(startPos, endPos)
    local beamPart = Instance.new("Part")
    beamPart.Name = "ThickTracer"
    beamPart.Anchored = true
    beamPart.CanCollide = false
    beamPart.Transparency = 1
    beamPart.Size = Vector3.new(0.1, 0.1, 0.1)
    beamPart.Position = startPos
    beamPart.Parent = workspace
    
    local endPart = beamPart:Clone()
    endPart.Position = endPos
    endPart.Parent = workspace
    
    local startAttachment = Instance.new("Attachment", beamPart)
    local endAttachment = Instance.new("Attachment", endPart)
    
    local beam = Instance.new("Beam")
    beam.Attachment0 = startAttachment
    beam.Attachment1 = endAttachment
    beam.Width0, beam.Width1 = 1.5, 0.8
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 50, 50))
    beam.Brightness = 4
    beam.LightEmission = 1
    beam.Texture = "rbxassetid://446111271"
    beam.FaceCamera = true
    beam.Transparency = NumberSequence.new(0, 0.8)
    beam.Parent = beamPart
    
    Debris:AddItem(beamPart, 0.35)
    Debris:AddItem(endPart, 0.35)
end

local function syncAmmoUI(eq)
    if eq and eq.toolState then
        EquippedScreen:SetAmmo(
            eq.toolState.ammo, 
            eq.toolState.totalAmmo, 
            eq.toolState.isInfinite or false
        )
    end
end

local function reloadWeapon(eq)
    if not eq or isReloading then return end
    local tid = eq:GetId()
    
    isReloading = true
    fs("reload", tid)
    
    task.delay(2, function()
        if eq.ammoData and eq.toolState then
            local magSize = eq.ammoData.magSize or 15
            eq.toolState.ammo = magSize
            syncAmmoUI(eq)
        end
        isReloading = false
    end)
end
local function getNearestEnemy()
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local myTeam = plr:GetAttribute("currentTeam") 
    local nearestEnemy, minDistance = nil, math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= plr and player.Character then
            local char = player.Character
            local targetHrp = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChild("Humanoid")
            
            local targetTeam = player:GetAttribute("currentTeam")
            local isSafe = player:GetAttribute("safe")
            local bounty = player:GetAttribute("bounty") or 0

            local shouldIgnore = false
            
            if isSafe == true then
                shouldIgnore = true
            elseif targetTeam == "none" and bounty == 0 then
                shouldIgnore = true
            elseif myTeam == "police" and targetTeam == "police" then
                shouldIgnore = true
            end

            if not shouldIgnore and targetHrp and humanoid and humanoid.Health > 0 then
                local distance = (hrp.Position - targetHrp.Position).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    nearestEnemy = player
                end
            end
        end
    end
    
    return nearestEnemy
end


RunService.Heartbeat:Connect(function()
    if rageboxm9 then
    if isReloading then return end
    
    local eq = ct.GetLocalEquippedTool()
    if not eq or type(eq.GetId) ~= "function" or not eq.toolState then return end
    
    if eq.toolState.ammo <= 0 then
        reloadWeapon(eq)
        return
    end
    
    local enemy = getNearestEnemy()
    if not enemy then return end
    
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    local enemyHead = enemy.Character:FindFirstChild("Head")
    if not hrp or not enemyHead then return end

    eq.toolState.ammo = eq.toolState.ammo - 1
    syncAmmoUI(eq)

    local tid = eq:GetId()
    local spd = (eq.projectile and eq.projectile.muzzleVelocity) or 1000
    local muzzlePos = hrp.Position + Vector3.new(0, 2, 0)
    local enemyPos = enemyHead.Position
    local dir = (enemyPos - muzzlePos).Unit
    
    local pid = nid()
    local ccf = mu.CompressCFrame(CFrame.lookAlong(muzzlePos, dir))

    ivk("shoot", tid, ccf, {{pid, ccf}})
    
    CreateThickTracer(muzzlePos, enemyPos)
    playHitSound()
    
    fs("registerProjectileHits", pid, tid, {{
        normal = -dir,
        direction = dir,
        hitName = "Head",
        source = "Bullet",
        userId = enemy.UserId,
        massLimit = 5,
        ownerId = plr.UserId,
        position = enemyPos,
        processedPlayerId = plr.UserId,
        hit = enemyHead,
        speed = spd,
        collisionPoint = enemyPos,
        material = Enum.Material.Plastic,
        hitType = "player"
    }})
    end
end)
local rs = game:GetService("ReplicatedStorage")
local run = game:GetService("RunService")
local Devv = require(rs.Devv)
local fs = Devv.GetModule("Network").FireServer

run.Heartbeat:Connect(function()
    if autohead then
    local buf = buffer.create(4)
    buffer.writei16(buf, 0, math.random(-32768, 32767))
    buffer.writei16(buf, 2, math.random(-32768, 32767))
    fs("replicateLook", buf)
    end
end)

local v2 = game:GetService("ReplicatedStorage")
local v4 = require(v2.Devv).load
local Network = v4("Network")
local Players = game:GetService("Players")
local function ForceLoadAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                Network.InvokeServer("requestStreamAround", root.Position, math.huge)
            end
        end
    end
end
RunService.Heartbeat:Connect(function()
if loadallplayer then
ForceLoadAllPlayers()
end
if autokill then
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local devv = require(ReplicatedStorage.Devv)
local FireServer = devv.GetModule("Network").FireServer
local char = LocalPlayer.Character
if not char or not char:FindFirstChild("HumanoidRootPart") then return end
local action = LocalPlayer:GetAttribute("currentTeam") == "police" and "arrest" or "finish"
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local dist = (char.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
if dist <= 500 then
FireServer(action, player.UserId)
end
end
end
end
if autolhkai then
local module = require(game.ReplicatedStorage.Devv)
local ClientTools = module.load("ClientTools")
local inventory = ClientTools.GetInventory()
local items = ClientTools.GetItems()
local rs = game:GetService("ReplicatedStorage")
local dv = require(rs.Devv)

if items and items.Tool then
    for _, toolId in pairs(inventory) do
        local tool = items.Tool[toolId]
        if tool and tool.name then
            if tool.name == 'Large Present' or tool.name == 'Medium Present' or tool.name == 'Small Present' then
                require(rs.Devv).GetModule("Network").FireServer('equip', toolId)
                require(rs.Devv).GetModule("Network").InvokeServer('syncTool', toolId)
                require(rs.Devv).GetModule("Network").FireServer('replicateCFrameAnim', 'Equip', 0.500)
                require(rs.Devv).GetModule("Network").InvokeServer('dropItem', toolId, CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
            end
        end
    end
end
end
if autobank then
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local devv = require(ReplicatedStorage.Devv)
local FireServer = devv.GetModule("Network").FireServer
local InvokeServer = devv.GetModule("Network").InvokeServer

if workspace:FindFirstChild("Local") and workspace.Local:FindFirstChild("Gizmos") and workspace.Local.Gizmos:FindFirstChild("White") and workspace.Local.Gizmos.White:FindFirstChild("MainBankCash") and workspace.Local.Gizmos.White.MainBankCash:FindFirstChild("Cash") then
    local bank = workspace.Local.Gizmos.White.MainBankCash
    local bankid = bank:GetAttribute('objectId')
    if bankid then
        InvokeServer('collectCurrency', {bankid})
    end
end
end
if autoteam then
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Devv= require(ReplicatedStorage.Devv)
local InvokeServer= Devv.GetModule("Network").InvokeServer
local FireServer= Devv.GetModule("Network").FireServer
local pl= game:GetService("Players")
local lp= pl.LocalPlayer
local team= lp:GetAttributes("currentTeam")
for i,v in pairs(team) do
if i== "currentTeam" and v ~= "police" and v == 'none' then
InvokeServer("setPolice", true, { text = "Snow On Top" })
end
end
else
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Devv= require(ReplicatedStorage.Devv)
local InvokeServer= Devv.GetModule("Network").InvokeServer
local FireServer= Devv.GetModule("Network").FireServer
local pl= game:GetService("Players")
local lp= pl.LocalPlayer
local team= lp:GetAttributes("currentTeam")
for i,v in pairs(team) do
if i== "currentTeam" and v == "police" then
InvokeServer("setPolice", false, { text = "Snow On Top" })
end
end
end
if autoteam2 then
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Devv= require(ReplicatedStorage.Devv)
local InvokeServer= Devv.GetModule("Network").InvokeServer
local FireServer= Devv.GetModule("Network").FireServer
local pl= game:GetService("Players")
local lp= pl.LocalPlayer
local team= lp:GetAttributes("currentTeam")
for i,v in pairs(team) do
if i== "currentTeam" and v ~= "syndicate" and v == 'none' then
InvokeServer("setSyndicate", true, { text = "Snow On Top" })
end
end
else
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Devv= require(ReplicatedStorage.Devv)
local InvokeServer= Devv.GetModule("Network").InvokeServer
local FireServer= Devv.GetModule("Network").FireServer
local pl= game:GetService("Players")
local lp= pl.LocalPlayer
local team= lp:GetAttributes("currentTeam")
for i,v in pairs(team) do
if i== "currentTeam" and v == "syndicate" then
InvokeServer("setSyndicate", false, { text = "Snow On Top" })
end
end
end
if autoitem then
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local devv = require(ReplicatedStorage.Devv)
local FireServer = devv.GetModule("Network").FireServer
local InvokeServer = devv.GetModule("Network").InvokeServer

for _, v in pairs(workspace.Local.Gizmos.White:GetChildren()) do
local gizmoType = v:GetAttribute('gizmoType')
local rarity = v:GetAttribute('rarity')
local objectId = v:GetAttribute('objectId')
if gizmoType == 'Lootable' then
if rarity == 'Rare' or rarity == 'Legendary' then
humanoidRootPart.CFrame = v:GetPivot()
InvokeServer('collectLoot', objectId)
break
end
end
end
end
if autoitem1 then
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local devv = require(ReplicatedStorage.Devv)
local FireServer = devv.GetModule("Network").FireServer
local InvokeServer = devv.GetModule("Network").InvokeServer

for _, v in pairs(workspace.Local.Gizmos.White:GetChildren()) do
local gizmoType = v:GetAttribute('gizmoType')
local rarity = v:GetAttribute('rarity')
local objectId = v:GetAttribute('objectId')
if gizmoType == 'Lootable' then
humanoidRootPart.CFrame = v:GetPivot()
InvokeServer('collectLoot', objectId)
break
end
end
end
if autopart then
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local devv = require(ReplicatedStorage.Devv)
local FireServer = devv.GetModule("Network").FireServer
local InvokeServer = devv.GetModule("Network").InvokeServer

for _, v in pairs(workspace.Local.Gizmos.White:GetChildren()) do
local gizmoType = v:GetAttribute('gizmoType')
local objectId = v:GetAttribute('objectId')
if gizmoType == 'WorldItem' then
humanoidRootPart.CFrame = v:GetPivot()
InvokeServer('collectLoot', objectId)
break
end
end
end
    if wantedcash then clc() end
end)
local plr = game:GetService("Players").LocalPlayer

local sg = Instance.new("ScreenGui")
sg.Name = "MONy"
sg.ResetOnSpawn = false
sg.Parent = game:GetService("CoreGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 100, 0, 20)
label.Position = UDim2.new(0, 10, 0.5, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(44, 226, 3)
label.TextSize = 14
label.Font = Enum.Font.GothamBold
label.TextXAlignment = Enum.TextXAlignment.Left
label.Text = "背包价值$0"
label.Parent = sg

game:GetService("RunService").Heartbeat:Connect(function()
    local c = plr.Character
    if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart")
    if not h then return end
    local b = h:FindFirstChild(plr.Name .. "_BagBackBillboard")
    if b then
        for _, d in pairs(b:GetDescendants()) do
            if d.Name == "ValueLabel" then
                local v = d.Text:match("%$([%d,]+)")
                if v then label.Text = "背包价值$" .. v end
                break
            end
        end
    end
end)
local farmingThread = nil
local isFarming = false
Kill:Toggle({
    Title = "强制渲染全体玩家(慎开)",
    Default = false,
    Callback = function(state)
    loadallplayer = state
    end
})
Kill:Toggle({
    Title = "ragebot(全枪)",
    Default = false,
    Callback = function(state)
    rageboxm9 = state
    end
})
Kill:Toggle({
    Title = "自动逮捕&完成",
    Default = false,
    Callback = function(state)
    autokill = state
    end
})
Kill:Paragraph({
Title = "如果你是警察就是自动逮捕 是别的就是自动完成"
})
Auto:Toggle({
    Title = "自动加入警察团队",
    Default = false,
    Callback = function(state)
    autoteam = state
    end
})
Auto:Toggle({
    Title = "自动加入合成团队",
    Default = false,
    Callback = function(state)
    autoteam2 = state
    end
})
Auto:Toggle({
    Title = "自动银行",
    Default = false,
    Callback = function(state)
    autobank = state
    end
})
Auto:Toggle({
    Title = "自动ATM",
    Default = false,
    Callback = function(state)
        if state then
            isFarming = true
            farmingThread = task.spawn(function()
                local Player = Players.LocalPlayer
                while isFarming do
                    local character = Player.Character
                    if not character then
                        Player.CharacterAdded:Wait()
                        character = Player.Character
                    end
                    local root = character:WaitForChild("HumanoidRootPart")
                    local Gizmos = Workspace.Local.Gizmos.White
                    for _, gizmo in pairs(Gizmos:GetChildren()) do
                        if not isFarming then break end                        
                        local gizmoType = gizmo:GetAttribute("gizmoType")
                        if gizmoType == "ATM" or gizmoType == "Register" then
                            local part = gizmo:IsA("BasePart") and gizmo or gizmo:FindFirstChildWhichIsA("BasePart")
                            if part then
                                root.CFrame = CFrame.new(part.Position + Vector3.new(0, 0, 0))
                                task.wait(0.2)
                                local objectId = gizmo:GetAttribute("objectId")
                                if objectId then
                                    FireServer("registerMeleeHits", {{
                                        normal = Vector3.new(0, 1, 0),
                                        direction = Vector3.new(0, -1, 0),
                                        source = "Melee",
                                        id = objectId,
                                        material = Enum.Material.Metal,
                                        position = part.Position,
                                        gizmoType = gizmoType,
                                        processedPlayerId = Player.UserId,
                                        hit = part,
                                        speed = 9999,
                                        collisionPoint = part.Position,
                                        hitName = part.Name,
                                        hitType = "gizmo"
                                    }})
                                end
                                
                                task.wait()
                                break
                            end
                        end
                    end
                    
                    task.wait()
                end
            end)
        else
            isFarming = false
            if farmingThread then
                task.cancel(farmingThread)
                farmingThread = nil
            end
        end
    end
})
Auto:Toggle({
    Title = "自动拾取现金",
    Default = false,
    Callback = function(state)
    wantedcash = state
    end
})
Auto:Toggle({
    Title = "自动拾取稀有物品",
    Default = false,
    Callback = function(state)
    autoitem = state
    end
    })
Auto:Toggle({
    Title = "自动拾取普通物品",
    Default = false,
    Callback = function(state)
    autoitem1 = state
    end
    })
Auto:Toggle({
    Title = "自动拾取礼盒",
    Default = false,
    Callback = function(state)
    autopart = state
    end
    })
Auto:Toggle({
    Title = "自动打开礼盒",
    Default = false,
    Callback = function(state)
    autolhkai = state
    end
    })
Auto:Toggle({
    Title = "自动售卖(每1秒)",
    Default = false,
    Callback = function(state)
    autosell = state
    if autosell then
    while autosell and wait(1) do
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local devv = require(ReplicatedStorage.Devv)
local FireServer = devv.GetModule("Network").FireServer
local InvokeServer = devv.GetModule("Network").InvokeServer
InvokeServer('sellLoot')
    end
    end
    end
    })
Bypass:Paragraph({
Title = "已自动为你绕过银行毒气伤害以及反作弊"
})
Bypass:Toggle({
    Title = "绕过炮台伤害",
    Default = false,
    Callback = function(state)
    bypasspt = state
    end
    })
Bypass:Toggle({
    Title = "藏头",
    Default = false,
    Callback = function(state)
    autohead = state
    end
    })
Bypass:Button({
    Title = "高亮透视",
    Desc = "",
    Locked = false,
    Callback = function()
local folder = workspace.Local.Gizmos.White
local highlights = {}
local labels = {}
local function createLabel(parent)
    local gui = Instance.new("BillboardGui")
    gui.Name = "ItemLabel"
    gui.AlwaysOnTop = true
    gui.Size = UDim2.new(0, 200, 0, 50)
    gui.StudsOffset = Vector3.new(0, 2, 0)
    gui.Adornee = parent
    gui.MaxDistance = 0
    gui.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Name = "LabelText"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.TextSize = 14
    label.Font = Enum.Font.GothamBold
    if parent.Name == "WorldItem" then
        label.Text = "礼盒"
    else
        label.Text = parent.Name
    end
    
    label.Parent = gui
    
    return gui
end
local function processChild(v)
    if not highlights[v] then
        local hesp = Instance.new('Highlight')
        hesp.FillColor = Color3.new(1, 0, 0)
        hesp.FillTransparency = 0
        hesp.Parent = v
        
        local label = createLabel(v)
        
        highlights[v] = hesp
        labels[v] = label
    end
end
local function cleanup()
    for v in pairs(highlights) do
        if not v.Parent then
            if highlights[v] then highlights[v]:Destroy() end
            if labels[v] then labels[v]:Destroy() end
            highlights[v] = nil
            labels[v] = nil
        end
    end
end
for _, v in pairs(folder:GetChildren()) do
    processChild(v)
end
while true do
    cleanup()
    for _, v in pairs(folder:GetChildren()) do
        processChild(v)
    end
    wait(0.1)
end
    end
})
TP:Button({
    Title = "银行",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-391.14544677734375, 615.2535400390625, -1208.0205078125)
    end
})
TP:Button({
    Title = "小银行",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-6856.05517578125, 42.32926940917969, 961.0589599609375)
    end
})
TP:Button({
    Title = "匪徒营地",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-7870.90771484375, 18.118751525878906, 1122.171875)
    end
})
TP:Button({
    Title = "烈焰要塞",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-1578.44189453125, 181.31951904296875, 3147.043701171875)
    end
})
TP:Button({
    Title = "售卖点 [x1]",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-2909.99365234375, 37.254188537597656, 1651.61962890625)
    end
})
TP:Button({
    Title = "售卖点 [x2] 需要4小时",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-7894.72705078125, 21.519939422607422, 1180.4666748046875)
    end
})
TP:Button({
    Title = "AWM",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-822.0567626953125, 325.61944580078125, -504.0443115234375)
    end
})
TP:Button({
    Title = "M4",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-6343.78369140625, 134.38201904296875, -4329.69482421875)
    end
})
TP:Button({
    Title = "AK",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-7839.01708984375, 21.367996215820312, 1194.6827392578125)
    end
})
TP:Button({
    Title = "RPG",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-1391.8367919921875, 271.90240478515625, 3204.337890625)
    end
})
TP:Button({
    Title = "UZI",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(-1350.0574951171875, 40.20344543457031, 2036.589599609375)
    end
})
TP:Button({
    Title = "M1014",
    Desc = "",
    Locked = false,
    Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
humanoidRootPart.CFrame = CFrame.new(1348.4249267578125, 141.04315185546875, -4809.46142578125)
    end
})
end
--决斗场
local Dueling = function(...)
secureCheck(...)
----能力
local Duelight = function(...)
local qing = require(game:GetService("ReplicatedStorage").Modules.BaseActionManager)
local inHook = false
hookfunction(qing.SetNextLightAttackName, function(self, name, duration)
    if inHook then return end  -- Prevent recursion
    inHook = true
    local result = qing.SetNextLightAttackName(self, "Light01", duration)
    
    inHook = false
    return result
end)
hookfunction(qing.SetNextHeavyAttackName, function(self, name, duration)
    if inHook then return end  -- Prevent recursion
    inHook = true
    local result = qing.SetNextHeavyAttackName(self, "Heavy01", duration)
    inHook = false
    return result
end)
hookfunction(qing.SetActionCooldown, function(self, actionType, duration)
    if inHook then return end  -- Prevent recursion
    inHook = true
    local result = qing.SetActionCooldown(self, actionType, 0)
    inHook = false
    return result
end)
hookfunction(qing.SetIsPerformingAction, function(self, state, ...)
    if inHook then return end  -- Prevent recursion
    inHook = true
    local result = qing.SetIsPerformingAction(self, state, ...)
    inHook = false
    return result
end)
end
local dueantijz = function(...)
for _, f in next, getgc() do
    if type(f) == "function" and debug.getinfo(f).name == "_resolveEveryImpact" then
        for i, v in next, debug.getconstants(f) do
            if v == "GetHit" or v == "Block" then
                debug.setconstant(f, i, "Parry")
            end
        end
    end
end
end
local infdod = function(...)
local gcObjects = getgc(true)
for _, obj in ipairs(gcObjects) do
    if type(obj) == "table" and rawget(obj, "_dodgeStaminaRecoverTime") then
        -- Set the value to 0
        obj._dodgeStaminaRecoverTime = 0
        obj._jumpStaminaRecoveryTime = 0
        obj._lightAttackResetTime = 0
        obj._heavyAttackResetTime = 0
        print("Found and modified _dodgeStaminaRecoverTime to 0")
        break
    end
end
end
local duebypassdao = function()
local RS = game:GetService("ReplicatedStorage")
local LP = game:GetService("Players").LocalPlayer
for _, v in pairs(RS:GetDescendants()) do
    if v.Name == "WeaponInventoryController" and v:IsA("ModuleScript") then
        local ctrl = require(v)
        if type(ctrl) == "table" then
            ctrl.IsCosmeticUnlocked = function() return true end
        end
        break
    end
end
local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    if getnamecallmethod() == "FireServer" and tostring(self) == "Request_SetSelectedCosmetic" then
        task.spawn(function()
            local char = LP.Character
            local weapon = char and char:FindFirstChild("MountedWeapons") and char.MountedWeapons:FindFirstChild(args[1])
            if weapon then 
                weapon:SetAttribute("CurrentCosmetic", args[2]) 
            end
        end)
    end
    return old(self, ...)
end)
end
local duehook = function(...)
local dueold
dueold = hookmetamethod(game, "__namecall", function(self, ...)
local args = {...}
local method = getnamecallmethod()
if method == "FireServer" and self.Name == "ResolveImpact" and DueGod then
args[2] = "Parry"
args[3].staggerType = "Parry"
return dueold(self, unpack(args))
end
return dueold(self, ...)
end)
end
local Due = Window:Section({ Title = "决斗场", Opened = true })
local War = Due:Tab({ Title = "战斗" })
War:Toggle({
Title = "轻击重击加快",
Value = false,
Callback = function()
Duelight()
end
})
War:Toggle({
Title = "防止僵直",
Value = false,
Callback = function()
dueantijz()
end
})
War:Toggle({
Title = "无限闪避&跳跃",
Value = false,
Callback = function()
infdod()
end
})
War:Toggle({
Title = "无敌(全程完美格挡)",
Value = false,
Callback = function(s)
duehook()
DueGod = s
end
})
War:Toggle({
Title = "破解全刀皮",
Value = false,
Callback = function(s)
duebypassdao()
end
})
end
--闪光
local Flick = function(...)
secureCheck(...)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local TS = game:GetService("TweenService")
local LP = Players.LocalPlayer

local CurrentTarget, LastShot = nil, 0
local fkrage, fksp, fk3rd = false, false, false
local SoundCfg = { Id = "rbxassetid://8679627751", Volume = 0.7 }

local function ValidPlayer(p)
	local c = p.Character
	return c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 and c:FindFirstChild("Head")
end

local function HeadVisible(head, origin)
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = { LP.Character, head.Parent }
	local r = Workspace:Raycast(origin, head.Position - origin, params)
	return not r or r.Instance:IsDescendantOf(head.Parent)
end

local function GetHead(p)
	local char, root = p.Character, LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
	if not (char and root) then return end
	local head = char:FindFirstChild("Head")
	if head and HeadVisible(head, root.Position) then return head, head.Position end
end

local function VisibleTargets()
	local root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
	if not root then return {} end
	local t = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and ValidPlayer(p) then
			local h, pos = GetHead(p)
			if h then table.insert(t, {Player = p, Head = h, Pos = pos, Dist = (pos - root.Position).Magnitude}) end
		end
	end
	table.sort(t, function(a, b) return a.Dist < b.Dist end)
	return t
end

local function createTrace(targetPos)
	local char = LP.Character
	if not (char and char.PrimaryPart) then return end
	local S = char.PrimaryPart.Position + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
	local mag = (targetPos - S).Magnitude
	local P = Instance.new("Part")
	P.Name, P.Anchored, P.CanCollide, P.CastShadow = "Trace", true, false, false
	P.Material, P.Color, P.Size = Enum.Material.Neon, Color3.fromHSV(tick() % 1, 0.8, 1), Vector3.new(0.15, 0.15, mag)
	P.CFrame, P.Parent = CFrame.lookAt(S, targetPos) * CFrame.new(0, 0, -mag/2), Workspace
	TS:Create(P, TweenInfo.new(0.3), {Transparency = 1, Size = Vector3.new(0, 0, mag)}):Play()
	Debris:AddItem(P, 0.3)
end

local function Shoot(p, head, pos)
	if tick() - LastShot < 0.34 then return end
	local root = LP.Character:FindFirstChild("HumanoidRootPart")
	if not root then return end
	createTrace(pos)
	local s = Instance.new("Sound", Workspace)
	s.SoundId, s.Volume = SoundCfg.Id, SoundCfg.Volume
	s:Play(); Debris:AddItem(s, 2)
	local t, cf = tick(), CFrame.lookAt(root.Position, pos)
	local r = LP:FindFirstChild("ClientRemotes")
	if r then
		r.CheckFire:FireServer(t, root.Position)
		r.CheckShot:FireServer(0, 0, 1, 0.8, cf, pos, head, math.random(1, 1e3), t)
		r.Reload:FireServer()
	end
	LastShot = t
end

RunService.Heartbeat:Connect(function()
	if fkrage then
		if CurrentTarget and not ValidPlayer(CurrentTarget) then CurrentTarget = nil end
		if not CurrentTarget then
			local t = VisibleTargets()
			CurrentTarget = t[1] and t[1].Player
		else
			local h, pos = GetHead(CurrentTarget)
			if h then Shoot(CurrentTarget, h, pos) else CurrentTarget = nil end
		end
	end
end)

local rot = 0
RunService.RenderStepped:Connect(function()
	if fk3rd then
		LP.CameraMode = Enum.CameraMode.Classic
		LP.CameraMaxZoomDistance, LP.CameraMinZoomDistance = 20, 20
	else
		LP.CameraMaxZoomDistance, LP.CameraMinZoomDistance = 128, 0.5
	end
	local c = LP.Character
	if fksp and c and c:FindFirstChild("HumanoidRootPart") then
		rot = rot + 0.35
		c.HumanoidRootPart.CFrame = CFrame.new(c.HumanoidRootPart.Position) * CFrame.Angles(0, rot, 0)
	end
end)

LP.CharacterAdded:Connect(function() CurrentTarget, LastShot = nil, 0 end)

local Flick = Window:Section({ Title = "闪光", Opened = true })
local War = Flick:Tab({ Title = "战斗" })
War:Toggle({ Title = "愤怒机器人", Value = false, Callback = function(v) fkrage = v end })
War:Toggle({ Title = "人物旋转", Value = false, Callback = function(v) fksp = v end })
War:Toggle({ Title = "第三人称", Value = false, Callback = function(v) fk3rd = v end })

end
--刀刃
local SBL = function(...)
secureCheck(...)
local mie = workspace.Live.MobModel
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()  -- 获取玩家角色
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local run = game:GetService("RunService")
local SBLaurakilldc = 50
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
run.Heartbeat:Connect(function()
    if SBLaurakill then
    local pp = humanoidRootPart.Position
    local nearestModel = nil
    local closestDistance = math.huge
    for _, v in pairs(mie:GetChildren()) do
        if not (v:IsA("Model") and v.PrimaryPart) then
            continue
        end
        local health = v:GetAttribute("Health")
        if health == nil or health <= 0 then
            continue
        end
        local po = v.PrimaryPart.Position
        local dc = (pp - po).Magnitude
        if dc <= SBLaurakilldc and dc < closestDistance then
            nearestModel = v
            closestDistance = dc
        end
    end
    if nearestModel then
        local Event = game:GetService("ReplicatedStorage").Remote.Event.Combat.M1
        Event:FireServer({nearestModel.Name})
    end
    end
end)

local SBL = Window:Section({ Title = "刀刃战利品", Opened = true })
local War = SBL:Tab({ Title = "战斗" })
War:Toggle({
Title = "杀戮光环",
Value = false,
Callback = function(state)
SBLaurakill = state
end
})
War:Slider({
Title = "杀戮距离",
Value = {
Min = 50,
Max = 200,
Default = 50,
},
Callback = function(value)
SBLaurakilldc = value
end
})
end
--像素
local PB = function(...)
secureCheck(...)
local PB = Window:Section({ Title = "像素刀刃", Opened = true })
local War = PB:Tab({ Title = "战斗" })
War:Toggle({
    Title = "击殺光環",
    Value = false,
    Callback = function(state)
        _G.KillAura = state
        if state then
            KillAuraFunction()
        end
    end,
})

function KillAuraFunction()
    spawn(function()
        _G.KillAura = true
        while _G.KillAura do
            wait()
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local rootPart = character:WaitForChild("HumanoidRootPart")
                
                -- 尋找附近的敵人
                for _, model in pairs(workspace:GetChildren()) do
                    if model:IsA("Model") and model:GetAttribute("hadEntrance") and model:FindFirstChild("HumanoidRootPart") then
                        local distance = (model.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if distance <= 30 then
                            -- 攻擊敵人
                            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("swing"):FireServer()
                            game:GetService("ReplicatedStorage").remotes.onHit:FireServer(unpack({
                                [1] = model:FindFirstChild("Humanoid"),
                                [2] = math.huge,  -- 巨大傷害
                                [3] = {},
                                [4] = 0,
                            }))
                        end
                    end
                end
                wait(0.5)
            end)
        end
    end)
end
War:Toggle({
    Title = "自動怪物傳送",
    Value = false,
    Callback = function(state)
        _G.AutoMobs = state
        if state then
            AutoTeleportToMobs()
        else
            workspace.Gravity = 196  -- 恢復正常重力
        end
    end,
})

function AutoTeleportToMobs()
    spawn(function()
        workspace.Gravity = 0
        local tweenService = game:GetService("TweenService")
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        
        while _G.AutoMobs do
            wait()
            pcall(function()
                local nearestMob = findNearestMob(rootPart)
                if nearestMob and nearestMob:FindFirstChild("HumanoidRootPart") then
                    local distanceToMob = (nearestMob.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    local tween = tweenService:Create(
                        rootPart, 
                        TweenInfo.new(distanceToMob / 50, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), 
                        {
                            CFrame = nearestMob.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15)
                        }
                    )
                    tween:Play()
                    tween.Completed:Wait()
                end
            end)
        end
    end)
end

function findNearestMob(rootPart)
    local closestDistance = math.huge
    local nearestMob = nil
    
    for _, model in pairs(workspace:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") and model:GetAttribute("hadEntrance") then
            local distance = (model.HumanoidRootPart.Position - rootPart.Position).Magnitude
            if distance < closestDistance then
                nearestMob = model
                closestDistance = distance
            end
        end
    end
    return nearestMob
end
end
--力量传奇
local LLCQ = function(...)
secureCheck(...)
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local ownedGamepasses = localPlayer:WaitForChild("ownedGamepasses")
local run = game:GetService("RunService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
run.Heartbeat:Connect(function()
if AutoDL then
local player = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local ownedGamepasses = localPlayer:WaitForChild("ownedGamepasses")
--举重加快破解
if not ownedGamepasses:FindFirstChild("x2 Rep Time") then
    local boolValue = Instance.new("BoolValue")
    boolValue.Name = "x2 Rep Time"
    boolValue.Value = true
    boolValue.Parent = ownedGamepasses
end
--自动举重破解
if localPlayer:WaitForChild("autoLiftEnabled") then
    localPlayer.autoLiftEnabled.Value = true
end
local backpack = localPlayer:WaitForChild("Backpack")
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local hasWeightInCharacter = character:FindFirstChild("Weight")
local hasWeightInBackpack = backpack:FindFirstChild("Weight")
--装备哑铃
if not hasWeightInCharacter and hasWeightInBackpack then
local player = game:GetService("Players").LocalPlayer
local char = player.Character
if char and char.Humanoid and char.Humanoid.Health > 0 then
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool.Name ~= "Punch" then
            tool.Parent = character
        end
        end
    end
end
end
if AutoAT then
local player = game:GetService("Players").LocalPlayer
local char = player.Character
if char and char.Humanoid and char.Humanoid.Health > 0 then
    local tool = player.Backpack:FindFirstChild("Punch")
    if tool then
        tool.Parent = player.Character
    end
    local pos = char.HumanoidRootPart.Position
    local nearestChar, minDist = nil, math.huge
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character.HumanoidRootPart then
            local dist = (pos - p.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                minDist = dist
                nearestChar = p.Character
            end
        end
    end
    
    if nearestChar and nearestChar.Humanoid.Health > 0 then
        local targetPos = nearestChar.HumanoidRootPart.CFrame * CFrame.new(0, 2, 2)
        char.HumanoidRootPart.CFrame = targetPos
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch","leftHand")
    end
end
end
if AutoMiss then
    if character and character:FindFirstChild("HumanoidRootPart") then
        local randomX = math.random(-100, 100)
        local randomZ = math.random(-100, 100)
        
        -- 设置200米高空随机位置
        character.HumanoidRootPart.CFrame = CFrame.new(
            randomX, 
            -10, 
            randomZ
        )
    end
end
end)
local LLCQ = Window:Section({ Title = "力量传奇", Opened = true })
local Auto = LLCQ:Tab({ Title = "自动" })
Auto:Toggle({
    Title = "自动锻炼",
    Value = false,
    Callback = function(state)
        AutoDL = state
    end
})
Auto:Toggle({
    Title = "自动刷人头",
    Value = false,
    Callback = function(state)
        AutoAT = state
    end
})
Auto:Toggle({
    Title = "自动躲避",
    Value = false,
    Callback = function(state)
        AutoMiss = state
    end
})
end
--速度传奇
local SDCQ = function(...)
secureCheck(...)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer
local rEvents = ReplicatedStorage:WaitForChild("rEvents")

local orbEvent = rEvents:WaitForChild("orbEvent")
local rebirthEvent = rEvents:WaitForChild("rebirthEvent")

task.spawn(function()
    if AutoEat then
    while task.wait(0.2) do
        local currentMap = lp:WaitForChild("currentMap").Value
        local orbFolder = workspace:FindFirstChild("orbFolder")
        if orbFolder and orbFolder:FindFirstChild(currentMap) then
            local folder = orbFolder[currentMap]
            for _, orb in folder:GetChildren() do
                orbEvent:FireServer("collectOrb", orb.Name, currentMap)
            end
        end
    end
    end
end)

task.spawn(function()
    if AutoHood then
    while task.wait(0.1) do
        local hoops = workspace:FindFirstChild("Hoops")
        if hoops and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = lp.Character.HumanoidRootPart
            for _, hoop in ipairs(hoops:GetChildren()) do
                local touchPart = hoop:IsA("BasePart") and hoop or hoop:FindFirstChildWhichIsA("BasePart")
                
                if touchPart then
                    firetouchinterest(hrp, touchPart, 0)
                    firetouchinterest(hrp, touchPart, 1)
                end
            end
        end
    end
    end
end)

task.spawn(function()
    if AutoCS then
    while task.wait(2) do
        rebirthEvent:FireServer("rebirthRequest")
    end
    end
end)
local SDCQ = Window:Section({ Title = "速度传奇", Opened = true })
local Auto = SDCQ:Tab({ Title = "自动" }) 
Auto:Toggle({
    Title = "自动吃球",
    Value = false,
    Callback = function(state)
        AutoEat = state
    end
})
Auto:Toggle({
    Title = "自动进圈",
    Value = false,
    Callback = function(state)
        AutoHood = state
    end
})
Auto:Toggle({
    Title = "自动重生",
    Value = false,
    Callback = function(state)
        AutoCS = state
    end
})
end
--点击模拟器
local DJMNQ = function(...)
secureCheck(...)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Modules.Network)
local Replication = require(ReplicatedStorage.Game.Replication)
local PetStats = require(ReplicatedStorage.Game.PetStats)

repeat task.wait() until Replication.Loaded

local function deleteCommonEpicPets()
    local pets = Replication.Data.Pets
    
    for id, petData in pairs(pets) do
        local tier = petData.Tier or "Normal"
        local petName = petData.Name
        local rarity = PetStats:GetRarity(petName)
        
        local isLowRarity = (rarity == "Common" or rarity == "Uncommon" or rarity == "Rare" or rarity == "Epic")
        local isNormalTier = (tier == "Normal" or tier == "Basic")
        local notSpecialTier = not (tier == "Golden" or tier == "Rainbow" or tier == "Void" or tier == "Electrified")
        if isLowRarity and isNormalTier and notSpecialTier then
            Network:InvokeServer("DeletePet", id)
        end
    end
end


local Replication = require(game:GetService("ReplicatedStorage").Game.Replication)
local Rebirths = require(game:GetService("ReplicatedStorage").Game.Rebirths)

local clicks = Replication.Data.Statistics.Clicks or 0
local currentRebirths = Replication.Data.Statistics.Rebirths or 0

local options = {}
local rebirthData = {}

for i = 1, 50 do
    pcall(function()
        local rebirthCount = Rebirths:fromIndex(i)
        local price = Rebirths:ClicksPrice(Rebirths:getPrice(rebirthCount), currentRebirths)
        local canBuy = clicks >= price
        
        local status = canBuy and "" or ""
        local displayText = string.format("%s 第%d个: +%d次重生 - %d Clicks", 
            status, i, rebirthCount, math.ceil(price))
        
        table.insert(options, displayText)
        rebirthData[displayText] = i
    end)
end

local RunService = game:GetService('RunService')
local AutoTap = false
local AutoRebirth = false
local SelectedRebirthLevel = 1

RunService.Heartbeat:Connect(function()
    if AutoNew then
        Network:InvokeServer("OpenEgg", "New Years Event", 3, {})
    end
    if AutoLJ then
        deleteCommonEpicPets()
    end
    local Network = require(game:GetService("ReplicatedStorage").Modules.Network)
    if AutoTap then
        pcall(function()
            Network:FireServer("Tap", true, nil, true)
        end)
    end
    if AutoRebirth then
        pcall(function()
            Network:InvokeServer("Rebirth", SelectedRebirthLevel)
        end)
    end
end)

local DJMNQ = Window:Section({ Title = "点击模拟器", Opened = true })
local Auto = DJMNQ:Tab({ Title = "自动" })

Auto:Toggle({
    Title = "自动点击",
    Value = false,
    Callback = function(state)
        AutoTap = state
    end
})

Auto:Toggle({
    Title = "自动重生",
    Value = false,
    Callback = function(state)
        AutoRebirth = state
    end
})

Auto:Dropdown({
    Title = "自动重生等级",
    Desc = string.format("当前: %d Clicks", clicks),
    Values = options,
    Value = options[1] or "无可用",
    Callback = function(option)
        local selectedIndex = rebirthData[option]
        if selectedIndex then
            SelectedRebirthLevel = selectedIndex
        end
    end
})
Auto:Toggle({
    Title = "自动删除垃圾宠物",
    Value = false,
    Callback = function(state)
        AutoLJ = state
    end
})
Auto:Toggle({
    Title = "自动打开新年蛋",
    Value = false,
    Callback = function(state)
        AutoNew = state
    end
})
end
--逃出海啸! 获得脑力!
local ETFB = function(...)
secureCheck(...)
local New = workspace:FindFirstChild('Bases')
local LocalPlayer = game:GetService('Players').LocalPlayer
for _, v in pairs(New:GetChildren()) do
if v:GetAttribute('Holder') == LocalPlayer.UserId then
houseid = v.Name
end
end

local Plot = game:GetService("ReplicatedStorage").Packages.Net["RF/Plot.PlotAction"]
local UpgradeSpeed = game:GetService("ReplicatedStorage").RemoteFunctions.UpgradeSpeed
local Rebirth = game:GetService("ReplicatedStorage").RemoteFunctions.Rebirth
local lastTime = 0
local UpRebirth = 0
local Uptime = 0
local Upspeedtime = 0
game:GetService("RunService").Heartbeat:Connect(function()
    if AutoMoney and tick() - lastTime >= 1 then
        lastTime = tick()
        for i = 1, 100 do
            Plot:InvokeServer("Collect Money", houseid, tostring(i))
        end
    end
    if AutoUpdata and tick() - Uptime >= 1 then
        Uptime = tick()
        for i = 1, 100 do
            Plot:InvokeServer("Upgrade Brainrot", houseid, tostring(i))
        end
    end
    if AutoUpdataSpeed and tick() - Upspeedtime >= 1 then
        Upspeedtime = tick()
        for i = 1, 10 do
            UpgradeSpeed:InvokeServer(1)
        end
    end
    if AutoRebirth and tick() - UpRebirth >= 1 then
        UpRebirth = tick()
        for i = 1, 1 do
            Rebirth:InvokeServer()
        end
    end
end)
local ETFB = Window:Section({ Title = "逃出海啸! 获得脑力!", Opened = true })
local Auto = ETFB:Tab({ Title = "自动" })
Auto:Toggle({
    Title = "自动收集金钱",
    Value = false,
    Callback = function(state)
        AutoMoney = state
    end
})
Auto:Toggle({
    Title = "自动升级脑腐",
    Value = false,
    Callback = function(state)
        AutoUpdata = state
    end
})
Auto:Toggle({
    Title = "自动升级速度",
    Value = false,
    Callback = function(state)
        AutoUpdataSpeed = state
    end
})
Auto:Toggle({
    Title = "自动重生",
    Value = false,
    Callback = function(state)
        AutoRebirth = state
    end
})
end
--犯罪
local CR = function(...)
    secureCheck(...)
    
    local plrs = game:GetService("Players")
    local me = plrs.LocalPlayer
    local camera = workspace.CurrentCamera
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Debris = game:GetService("Debris")
    local TweenService = game:GetService("TweenService")
    local ActionEnabled = false
    local ActionRate = 1
    local ScanRange = 100
    local isReloading = false
    local lastShotTime = 0
    local MaxFireDistance = 19
    local PenetrationThickness = 0.55
    local TargetPlayerName = ""
    local ESPEnabled = false
    local ESPConnection = nil

    local function RandomString(length)
        local res = ""
        for i = 1, length do
            res = res .. string.char(math.random(97, 122))
        end
        return res
    end

    local function PlayFeedbackSound()
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://8679627751"
        Sound.Volume = 1
        Sound.Parent = workspace
        Sound:Play()
        Debris:AddItem(Sound, 2)
    end

    local function createTrace(targetPos)
        if not me.Character or not me.Character.PrimaryPart then return end
        local S = me.Character.PrimaryPart.Position + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
        local mag = (targetPos - S).Magnitude
        local P = Instance.new("Part")
        P.Name, P.Anchored, P.CanCollide, P.CastShadow = "Trace", true, false, false
        P.Material, P.Color, P.Size = Enum.Material.Neon, Color3.fromHSV(tick() % 1, 0.8, 1), Vector3.new(0.15, 0.15, mag)
        P.CFrame, P.Parent = CFrame.lookAt(S, targetPos) * CFrame.new(0, 0, -mag/2), workspace
        TweenService:Create(P, TweenInfo.new(0.3), {Transparency = 1, Size = Vector3.new(0, 0, mag)}):Play()
        Debris:AddItem(P, 0.3)
    end

    local function CanPenetrate(part)
        return part and part.Size.Magnitude <= PenetrationThickness
    end

    local function FindOptimalTrajectory(startPos, targetPos)
        local baseDirection = (targetPos - startPos).Unit
        local bestPoint = targetPos
        local minWallHits = math.huge
        
        for attempt = 1, 8 do
            local offset = Vector3.new(
                math.random(-20, 20),
                math.random(-20, 20),
                math.random(-20, 20)
            )
            
            local controlPoint = startPos + (baseDirection * ((startPos - targetPos).Magnitude / 2)) + offset
            
            local wallHits = 0
            local valid = true
            local segments = 6
            
            for i = 1, segments do
                local t = i / segments
                local point = (1 - t)^2 * startPos + 2 * (1 - t) * t * controlPoint + t^2 * targetPos
                
                local rayParams = RaycastParams.new()
                rayParams.FilterDescendantsInstances = {me.Character}
                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                
                local prevPoint = i == 1 and startPos or ((1 - (i-1)/segments)^2 * startPos + 2 * (1 - (i-1)/segments) * ((i-1)/segments) * controlPoint + ((i-1)/segments)^2 * targetPos)
                
                local rayResult = workspace:Raycast(prevPoint, point - prevPoint, rayParams)
                
                if rayResult and not CanPenetrate(rayResult.Instance) then
                    valid = false
                    break
                elseif rayResult then
                    wallHits = wallHits + 1
                end
            end
            
            if valid and wallHits < minWallHits then
                minWallHits = wallHits
                bestPoint = controlPoint
            end
        end
        
        return bestPoint
    end

    local function GetFiringPosition()
        if not me.Character or not me.Character:FindFirstChild("HumanoidRootPart") then
            return camera.CFrame.Position
        end
        
        local rootPos = me.Character.HumanoidRootPart.Position
        local randomOffset = Vector3.new(
            math.random(-MaxFireDistance, MaxFireDistance),
            math.random(-2, 5),
            math.random(-MaxFireDistance, MaxFireDistance)
        )
        
        return rootPos + randomOffset
    end

    local function DoReload(tool)
        if isReloading then return end
        isReloading = true
        ReplicatedStorage.Events.GNX_R:FireServer(tick(), "KLWE89U0", tool)
        isReloading = false
    end

    local function GetTarget()
        if not me.Character or not me.Character:FindFirstChild("HumanoidRootPart") then return nil end
        
        local closestEnemy = nil
        local shortestDistance = ScanRange
        
        for _, player in pairs(plrs:GetPlayers()) do
            if player == me then continue end
            
            if TargetPlayerName ~= "" and player.Name:lower():find(TargetPlayerName:lower()) == nil then
                continue
            end
            
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local head = character and character:FindFirstChild("Head")
           
            if character and head and humanoid and humanoid.Health > 15 then
                local distance = (head.Position - me.Character.HumanoidRootPart.Position).Magnitude
                if distance <= ScanRange and distance < shortestDistance then
                    shortestDistance = distance
                    closestEnemy = player
                end
            end
        end
        
        return closestEnemy
    end

    local function ExecuteAction(target, tool)
        if isReloading then return end
        
        local currentTime = tick()
        local actionDelay = 1 / ActionRate
        if currentTime - lastShotTime < actionDelay then return end
        
        local head = target.Character:FindFirstChild("Head")
        local values = tool:FindFirstChild("Values")
        local ammo = values and values:FindFirstChild("SERVER_Ammo")
        if not head or not ammo then return end
        
        if ammo.Value <= 0 then
            task.spawn(function() DoReload(tool) end)
            return
        end
        
        local headPosition = head.Position
        local firingPosition = GetFiringPosition()
        
        local controlPoint = FindOptimalTrajectory(firingPosition, headPosition)
        local hitDirection = (headPosition - firingPosition).Unit
        
        createTrace(headPosition)
        PlayFeedbackSound()
        
        local randomKey = RandomString(30) .. "0"
        
        ReplicatedStorage.Events.GNX_S:FireServer(
            tick(),
            randomKey,
            tool,
            "FDS9I83",
            firingPosition,
            {hitDirection},
            false
        )
        
        ReplicatedStorage.Events["ZFKLF__H"]:FireServer(
            "\240\159\167\136",
            tool,
            randomKey,
            1,
            head,
            headPosition,
            hitDirection
        )
        
        if tool:FindFirstChild("Hitmarker") then
            tool.Hitmarker:Fire(head)
        end
        
        lastShotTime = currentTime
    end

    local function updateTargetPlayer(input)
        TargetPlayerName = input
    end

    local function applyESP(model)
        if not ESPEnabled or not model:IsA("Model") then return end

        if model:FindFirstChildOfClass("Highlight") then return end

        local highlight = Instance.new("Highlight")
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = Color3.fromRGB(0, 150, 255)
        highlight.FillTransparency = 0.6
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.OutlineTransparency = 0.1
        highlight.Adornee = model
        highlight.Parent = model
    end

    local function toggleESP(state)
        ESPEnabled = state
        
        if ESPEnabled then
            local success, container = pcall(function()
                return workspace.Map:WaitForChild("BredMakurz")
            end)
            
            if success and container then
                ESPConnection = container.ChildAdded:Connect(applyESP)
                
                for _, child in ipairs(container:GetChildren()) do
                    applyESP(child)
                end
            end
        else
            if ESPConnection then
                ESPConnection:Disconnect()
                ESPConnection = nil
            end
            
            local success, container = pcall(function()
                return workspace.Map:WaitForChild("BredMakurz")
            end)
            
            if success and container then
                for _, child in ipairs(container:GetChildren()) do
                    local highlight = child:FindFirstChildOfClass("Highlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end

    task.spawn(function()
        while task.wait() do
            if ActionEnabled and me.Character and not isReloading then
                local tool = me.Character:FindFirstChildOfClass("Tool")
                if tool then
                    local target = GetTarget()
                    if target then
                        ExecuteAction(target, tool)
                    end
                end
            end
            task.wait(0.05)
        end
    end)

    local CR = Window:Section({ Title = "Operation / 操作", Opened = true })
    local War = CR:Tab({ Title = "Combat / 战斗" })
   
    War:Toggle({
        Title = "Ragebot",
        Value = false,
        Callback = function(state)
            ActionEnabled = state
        end
    })
   
    War:Slider({
        Title = "射击速度",
        Value = {
            Min = 1,
            Max = 30,
            Default = 1,
        },
        Callback = function(value)
            ActionRate = value
        end
    })
   
    War:Slider({
        Title = "距离",
        Value = {
            Min = 10,
            Max = 800,
            Default = 100,
        },
        Callback = function(value)
            ScanRange = value
        end
    })
    
    War:Input({
        Title = "目标玩家（留空=全体）",
        Desc = "输入用户名选择",
        Value = "",
        Type = "Input",
        Callback = function(input)
            updateTargetPlayer(input)
        end
    })

    War:Toggle({
        Title = "物资透视",
        Value = false,
        Callback = function(state)
            toggleESP(state)
        end
    })
end
--cw
local CW = function(...)
secureCheck(...)
local Run = game:GetService("RunService")
local P = game:GetService("Players").LocalPlayer

-- 创建两层圆环：Core(核心亮线) 和 Glow(外围光晕)
local Core = Instance.new("CylinderHandleAdornment", workspace)
local Glow = Instance.new("CylinderHandleAdornment", workspace)

local function Set(C, Rad, Thick, Trans)
    C.Height, C.Radius, C.InnerRadius = 0.1, Rad, Rad - Thick
    C.AlwaysOnTop, C.Transparency, C.ZIndex = true, Trans, 10
    C.CFrame = CFrame.Angles(math.rad(90), 0, 0)
end

Set(Core, 15, 0.1, 0)    -- 核心：细、亮
Set(Glow, 15.3, 1, 0.7)  -- 光晕：宽、透

Run.RenderStepped:Connect(function()
    local Root = P.Character and P.Character:FindFirstChild("HumanoidRootPart")
    if Root then
        -- 这里的 tick()%10/10 控制颜色流光速度
        local Color = Color3.fromHSV((tick() % 5) / 5, 1, 1) 
        
        Core.Adornee, Glow.Adornee = Root, Root
        Core.Color3, Glow.Color3 = Color, Color
        Core.Visible, Glow.Visible = true, true
        
        -- 高级特效：光晕呼吸效果 (Transparency 在 0.5 到 0.8 之间波动)
        Glow.Transparency = 0.65 + math.sin(tick() * 3) * 0.15
    else
        Core.Visible, Glow.Visible = false, false
    end
end)

local Run, WS, Cam = game:GetService("RunService"), workspace, workspace.CurrentCamera
local Cache, Cfg = {}, {
    PlacedClaymore = {N="Claymore", C=Color3.fromRGB(255, 50, 50)},
    utility7Proxy = {N="C4", C=Color3.fromRGB(255, 150, 50)},
    utility5Proxy = {N="Grenade", C=Color3.fromRGB(50, 255, 50)},
    OpenBearTrap = {N="Trap", C=Color3.fromRGB(50, 150, 255)}
}

local function Make(T, P)
    local D = Drawing.new(T)
    for k,v in pairs(P) do D[k]=v end
    return D
end

local function Add(Obj)
    local D = Cfg[Obj.Name]
    if D and Obj:IsA("BasePart") then
        Cache[Obj] = {
            Box = Make("Square", {Thickness=1.5, Color=D.C, Filled=false}),
            Name = Make("Text", {Text=D.N, Color=D.C, Center=true, Size=13, Outline=true}),
            Dist = Make("Text", {Color=Color3.new(1,1,1), Center=true, Size=12, Outline=true})
        }
    end
end

local function Scan(P)
    for _,v in pairs(P:GetChildren()) do Add(v) end
    P.ChildAdded:Connect(Add)
end
Scan(WS); if WS:FindFirstChild("EffectsJunk") then Scan(WS.EffectsJunk) end

Run.RenderStepped:Connect(function()
    for Obj, D in pairs(Cache) do
        if Obj.Parent then
            local Pos, Vis = Cam:WorldToViewportPoint(Obj.Position)
            if Vis then
                local Dist = (Cam.CFrame.Position - Obj.Position).Magnitude
                local Size = 2000 / Dist
                D.Box.Size = Vector2.new(Size, Size)
                D.Box.Position = Vector2.new(Pos.X - Size/2, Pos.Y - Size/2)
                D.Box.Visible = true
                
                D.Name.Position = Vector2.new(Pos.X, Pos.Y - Size/2 - 15)
                D.Name.Visible = true
                
                D.Dist.Text = math.floor(Dist).."m"
                D.Dist.Position = Vector2.new(Pos.X, Pos.Y + Size/2 + 2)
                D.Dist.Visible = true
            else
                D.Box.Visible, D.Name.Visible, D.Dist.Visible = false, false, false
            end
        else
            D.Box:Remove(); D.Name:Remove(); D.Dist:Remove()
            Cache[Obj] = nil
        end
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
_G.SupremeConfig = {
    InfiniteStamina = true,
    MaxStamina = 100
}
local StaminaHandler = nil
pcall(function()
    StaminaHandler = require(ReplicatedStorage.Client.Source.DefaultStamina.DefaultStaminaHandlerClient)
end)

if not StaminaHandler then
    for _, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "getDefaultStamina") then
            StaminaHandler = v
            break
        end
    end
end
RunService.Heartbeat:Connect(function()
    if _G.SupremeConfig.InfiniteStamina and StaminaHandler then
        local staminaObject = StaminaHandler.getDefaultStamina()
        if staminaObject and staminaObject.setStamina then
            staminaObject:setStamina(_G.SupremeConfig.MaxStamina)
        end
    end
end)
    local function Notify(title, content)
        WindUI:Notify({
            Title = title,
            Content = content,
            Duration = 3,
            Icon = "snowflake", 
        })
    end
    for _, obj in pairs(getgc(true)) do
        if type(obj) == "table" then
            for key, value in pairs(obj) do
                if type(key) == "string" and string.find(key:lower(), "accode") and value == true then
                    obj[key] = false
                end
            end
           
            if rawget(obj, "getEnvVariables") and type(obj.getEnvVariables) == "function" then
                local original = obj.getEnvVariables
                obj.getEnvVariables = function()
                    local env = original()
                    for k in pairs(env) do
                        if type(k) == "string" and string.find(k:lower(), "accode") then
                            env[k] = false
                        end
                    end
                    return env
                end
            end
        end
    end

    local Network = require(game:GetService("ReplicatedStorage").Shared.Vendor.Network)
    local originalFireServer = Network.FireServer
    Network.FireServer = function(self, event, ...)
        if event == "LogACTrigger" or event == "LogKick" then
            return nil
        end
        return originalFireServer(self, event, ...)
    end

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
   
    _G.SupremeConfig = {
        KillAura = false,
        AuraRange = 15,
        AutoParry = false,
        ParryRange = 5
    }

    local lastAttackTime = 0
    local attackCooldown = 0.5

    local SpeedModule = require(game:GetService("ReplicatedStorage").Client.Source.Movement.WalkSpeedHandlerClient)
    local container = SpeedModule.getValueContainer()
    local JumpModule = require(game:GetService("ReplicatedStorage").Client.Source.Jump.JumpHandlerClient) 
    local jumpContainer = JumpModule.getJumpPowerValueContainer()

    local Main = Window:Section({ Title = "战斗勇士", Opened = true })
    local CombatTab = Main:Tab({ Title = "战斗" })
    local AttributeTab = Main:Tab({ Title = "属性" })
   
    CombatTab:Toggle({
        Title = "杀戮光环",
        Value = false,
        Callback = function(state)
            _G.SupremeConfig.KillAura = state
        end
    })

    CombatTab:Toggle({
        Title = "自动格挡",
        Value = false,
        Callback = function(state)
            _G.SupremeConfig.AutoParry = state
        end
    })

    CombatTab:Input({
        Title = "格挡感应距离",
        Value = "5",
        Placeholder = "范围",
        Callback = function(val)
            _G.SupremeConfig.ParryRange = tonumber(val) or 5
        end
    })

    CombatTab:Toggle({
        Title = "自动空投",
        Value = false,
        Callback = function(state)
            fromairdrop = state
        end
    })

    AttributeTab:Toggle({
        Title = "去除掉落伤害",
        Value = false,
        Callback = function(state)
            _G.NoFallDamage = state
        end
    })

    AttributeTab:Toggle({
        Title = "反布娃娃",
        Value = false,
        Callback = function(state)
            _G.NoRagdoll = state
        end
    })
    AttributeTab:Toggle({
    Title = "无限体力",
    Value = false,
    Callback = function(state) 
        _G.SupremeConfig.InfiniteStamina = state
    end
    })

    AttributeTab:Slider({
        Title = "体力上限",
        Value = {
            Min = 1,
            Max = 200,
            Default = 100,
        },
        Callback = function(value)
            _G.SupremeConfig.MaxStamina = tonumber(value) or 100
        end
    })
    AttributeTab:Slider({
        Title = "移动速度",
        Value = {
            Min = 1,
            Max = 100,
            Default = 30,
        },
        Callback = function(value)
            container:setBaseValue(value) 
        end
    })
    AttributeTab:Slider({
        Title = "跳跃高度",
        Value = {
            Min = 1,
            Max = 100,
            Default = 30,
        },
        Callback = function(value)
            jumpContainer:setBaseValue(value)
        end
    })
    _G.NoFallDamage = false
    _G.NoRagdoll = false
    local oldFireServer = Network.FireServer

    Network.FireServer = function(self, remoteName, ...)
        if _G.NoFallDamage and (remoteName == "TakeFallDamage" or remoteName == "StartFallDamage") then
            Notify("无敌", "已拦截坠落伤害")
            return
        end
        return oldFireServer(self, remoteName, ...)
    end

    for _, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "_doActualRagdoll") and rawget(v, "attemptToggleActualRagdollClient") then
            local old_toggle = v._toggleActualRagdoll
            local old_do = v._doActualRagdoll
            v._toggleActualRagdoll = function(self, isRagdolled)
                if _G.NoRagdoll and isRagdolled then
                    Notify("无敌", "已拦截布娃娃状态")
                    return
                end
                return old_toggle(self, isRagdolled)
            end
        end
    end

    local function MonitorParry(char)
        if char == LocalPlayer.Character then return end
        
        local hum = char:WaitForChild("Humanoid", 5)
        local animator = hum and hum:WaitForChild("Animator", 5)
        if not animator then return end
        
        animator.AnimationPlayed:Connect(function(track)
            if not _G.SupremeConfig.AutoParry then return end
            
            pcall(function()
                local myChar = LocalPlayer.Character
                if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
                
                local myRoot = myChar.HumanoidRootPart
                local enemyRoot = char:FindFirstChild("HumanoidRootPart")
                if myRoot and enemyRoot then
                    if (myRoot.Position - enemyRoot.Position).Magnitude <= _G.SupremeConfig.ParryRange then
                        if track.Length > 0 and track.Length < 1.3 then
                            Network:FireServer("Parry")
                            Notify("自动格挡", "格挡了 " .. char.Name .. " 的攻击")
                        end
                    end
                end
            end)
        end)
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            MonitorParry(player.Character)
        end
        player.CharacterAdded:Connect(MonitorParry)
    end
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(MonitorParry)
    end)

    RunService.RenderStepped:Connect(function()
        if fromairdrop then
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(game.Workspace.Map:GetChildren()) do
                if v.Name:match("Airdrop") then
                    local Prompt = v:FindFirstChild("ProximityPrompt", true)
                    if Prompt then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:GetPivot() + Vector3.new(0, 3, 0)
                        Notify("通知", "已传送空投")
                    end
                end
            end
        end
        end
        if not _G.SupremeConfig.KillAura then return end
       
        local currentTime = tick()
        if currentTime - lastAttackTime < attackCooldown then
            return 
        end
       
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
       
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool or not (tool:GetAttribute("ItemType") == "weapon") then return end
       
        local hitboxPart = tool:FindFirstChild("Hitbox", true) or tool:FindFirstChild("Hitboxes", true) or tool
        local myRoot = char.HumanoidRootPart
        local closestPlayer = nil
        local closestDistance = math.huge
        local closestPart = nil
       
        for _, enemy in pairs(Players:GetPlayers()) do
            if enemy ~= LocalPlayer and enemy.Character then
                local enemyChar = enemy.Character
                local humanoid = enemyChar:FindFirstChildOfClass("Humanoid")
                local enemyPart = enemyChar:FindFirstChild("Head") or enemyChar:FindFirstChild("HumanoidRootPart")
               
                if humanoid and humanoid.Health > 0 and enemyPart then
                    local dist = (myRoot.Position - enemyPart.Position).Magnitude
                    
                    if dist <= _G.SupremeConfig.AuraRange then
                        local isBlocking = false
                        local animator = humanoid:FindFirstChildOfClass("Animator")
                        if animator then
                            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                                if track.Animation and string.find(track.Animation.AnimationId, "8799568465") then
                                    if track.IsPlaying then
                                        isBlocking = true
                                        Notify("跳过目标", enemy.Name .. " 正在格挡")
                                        break
                                    end
                                end
                            end
                        end

                        if not isBlocking and dist < closestDistance then
                            closestDistance = dist
                            closestPlayer = enemy
                            closestPart = enemyPart
                        end
                    end
                end
            end
        end
       
        if closestPart and closestPlayer then
            lastAttackTime = currentTime
            
            Notify("自动攻击", "正在攻击: " .. closestPlayer.Name)
           
            local direction = (closestPart.Position - myRoot.Position).Unit
            myRoot.CFrame = CFrame.new(myRoot.Position, myRoot.Position + Vector3.new(direction.X, 0, direction.Z))
           
            Network:FireServer("MeleeSwing", tool, 1)
           
            local lookV = myRoot.CFrame.LookVector
            Network:FireServer("MeleeDamage",
                tool,
                closestPart,
                hitboxPart,
                closestPart.Position,
                closestPart.CFrame,
                lookV,
                lookV,
                Vector3.new(0, 0, 0),
                0.15 + (math.random() * 0.04)
            )
        end
    end)
end
--Deadly
local Deadly = function(...)
secureCheck(...)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RootPart = Character:WaitForChild("HumanoidRootPart")

local TE = require(ReplicatedStorage.Shared.Core.TEvent)
local World = workspace.GameSystem.Loots.World
local InteractiveItem = workspace.GameSystem.InteractiveItem

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    RootPart = char:WaitForChild("HumanoidRootPart")
end)
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local TE = require(Rep.Shared.Core.TEvent)
local InteractiveItem = workspace.GameSystem.InteractiveItem

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
task.spawn(function()
while task.wait(0.1) do
if autohd then
    for _, descendant in pairs(InteractiveItem:GetDescendants()) do
        if descendant:IsA("Part") then
            if (rootPart.Position - descendant.Position).Magnitude <= 30 then
                local part = descendant.Parent
                local open = part:GetAttribute('Open')
                if open ~= true then
                TE.FireRemote("Interactable", part)
                end
            end
        end
    end
end
end
end)
task.spawn(function()
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local TE = require(Rep.Shared.Core.TEvent)
local World = workspace.GameSystem.Loots.World

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

while task.wait(0.1) do
    if autocf then
    for _, descendant in pairs(World:GetDescendants()) do
        if descendant:IsA("Part") then
            if (rootPart.Position - descendant.Position).Magnitude <= 30 then
                local part = descendant.Parent
                local id = part:GetAttribute('id')
                if id ~= '10221' or id ~= '10201' or id ~= '10035' then
                TE.FireRemote("Interactable", part)
                end
            end
        end
    end
end
end
end)
task.spawn(function()
local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local TE = require(Rep.Shared.Core.TEvent)
local World = workspace.GameSystem.Loots.World

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

while task.wait(1) do
if god then
local Rep = game:GetService("ReplicatedStorage")
local TE = require(Rep.Shared.Core.TEvent)
local Player = game:GetService('Players')
local LocalPlayer = Player.LocalPlayer

TE.FireRemote('PlayerInElevator', true, LocalPlayer.Character.PrimaryPart.CFrame.Position, TE.UnixTimeMillis())
end
end
end)
local TabEntity = Window:Tab({Title = "自动"})
local TabESP = Window:Tab({Title = "透视"})
TabEntity:Toggle({
    Title = "无敌(自动放物品)",
    Callback = function(state)
        god = state
    end
})
TabEntity:Toggle({
    Title = "自动互动",
    Callback = function(state)
        autohd = state
    end
})
TabEntity:Toggle({
    Title = "自动拾取",
    Callback = function(state)
        autocf = state
    end
})
local _Storage = {
    Connections = {},
    TrackedParts = {}
}
local function ESP(TargetPart: BasePart, Name: string, Color: Color3, Enable: boolean)
    if not TargetPart or not TargetPart:IsA("BasePart") then return end
    local oldHighlight = TargetPart:FindFirstChild("ESP_Highlight")
    local oldGui = TargetPart:FindFirstChild("ESP_Gui")
    if oldHighlight then oldHighlight:Destroy() end
    if oldGui then oldGui:Destroy() end

    if not Enable then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = Color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color
    highlight.Adornee = TargetPart
    highlight.Parent = TargetPart

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Gui"
    billboard.Adornee = TargetPart
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local label = Instance.new("TextLabel")
    label.Parent = billboard
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = Name
    label.TextColor3 = Color
    label.TextStrokeTransparency = 0
    label.TextScaled = false 
    label.TextSize = 14
    label.Font = Enum.Font.SourceSansBold
    billboard.Parent = TargetPart

    task.spawn(function()
        while TargetPart and TargetPart.Parent and billboard and billboard.Parent do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local charPos = LocalPlayer.Character.HumanoidRootPart.Position
                local partPos = TargetPart.Position
                local distance = (charPos - partPos).Magnitude
                label.Text = string.format("%s\n[%.1fm]", Name, distance)
            else
                label.Text = Name .. "\n[--]"
            end
            task.wait(0.1)
        end
    end)
end

local function AutoESP(ParentInstance: Instance, NameKeyword: string, DisplayName: string, Color: Color3, Enable: boolean, ExactMatch: boolean)
    local connectionKey = ParentInstance:GetFullName() .. "_" .. NameKeyword

    local function checkMatch(objName)
        if ExactMatch then
            return objName == NameKeyword
        else
            return objName:find(NameKeyword) ~= nil
        end
    end

    if not Enable then
        if _Storage.Connections[connectionKey] then
            _Storage.Connections[connectionKey]:Disconnect()
            _Storage.Connections[connectionKey] = nil
        end
        for i, part in ipairs(ParentInstance:GetDescendants()) do
            local shouldClear = checkMatch(part.Name) or (part.Parent and checkMatch(part.Parent.Name))
            if part:IsA("BasePart") and shouldClear then
                ESP(part, "", nil, false)
            end
        end
        return
    end

    local function applyToModule(object)
        local targetPart = nil
        
        if checkMatch(object.Name) then
            if object:IsA("BasePart") then
                targetPart = object
            elseif object:IsA("Model") then
                targetPart = object.PrimaryPart or object:FindFirstChildWhichIsA("BasePart", true)
            elseif object:IsA("Folder") or object:IsA("Configuration") then
                targetPart = object:FindFirstChildWhichIsA("BasePart", true)
            end
        end

        if targetPart then
            ESP(targetPart, DisplayName, Color, true)
        end
    end

    for _, child in pairs(ParentInstance:GetDescendants()) do
        applyToModule(child)
    end

    if not _Storage.Connections[connectionKey] then
        _Storage.Connections[connectionKey] = ParentInstance.DescendantAdded:Connect(function(child)
            task.delay(0.1, function()
                applyToModule(child)
            end)
        end)
    end
end

function RandomColor()
    return Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
end
local ESPSettings = {
    NPCs = false,
    Items = false,
    Cabinets = false,
    Oil = false,
    Loot = false,
    Fridge = false,
    Crate = false,
    Barrel = false,
    Soil = false
}


TabESP:Toggle({
    Title = "透视NPC",
    Callback = function(state)
        ESPSettings.NPCs = state
        local path = workspace.GameSystem.NPCModels
        AutoESP(path, "Gear", "NPC: Gear", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Sell", "NPC: Sell", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Vt", "NPC: Vt", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Classes", "NPC: Classes", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Discord", "NPC: Discord", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Mr. Bill", "NPC: Mr. Bill", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Gordon", "NPC: Gordon", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Pot", "NPC: Pot", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Cane Father", "NPC: Cane Father", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Joe", "NPC: Joe", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Joeh", "NPC: Joeh", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Leoo", "NPC: Leoo", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Merx", "NPC: Merx", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Mr. G", "NPC: Mr. G", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Zom. Hong", "NPC: Zom. Hong", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Quackingtonia", "NPC: Quackingtonia", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "The Lost W", "NPC: The Lost W", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Babysitter", "NPC: Babysitter", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Radio Kid", "NPC: Radio Kid", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "The Chief", "NPC: The Chief", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Dungeon Master", "NPC: Dungeon Master", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "XanderGrey", "NPC: XanderGrey", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Khoi", "NPC: Khoi", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Polar", "NPC: Polar", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Twelve", "NPC: Twelve", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "zelar1um", "NPC: zelar1um", RandomColor(), ESPSettings.NPCs, false)
        AutoESP(path, "Exterminator", "NPC: Exterminator", RandomColor(), ESPSettings.NPCs, false)
    end
})


TabESP:Toggle({
    Title = "透视储物柜",
    Callback = function(state)
        ESPSettings.Cabinets = state
        local path = workspace.GameSystem.InteractiveItem
        AutoESP(path, "Cabinet", "柜子", Color3.fromRGB(0, 255, 255), ESPSettings.Cabinets, false)
    end
})

TabESP:Toggle({
    Title = "透视核废桶",
    Callback = function(state)
        ESPSettings.Oil = state
        local path = workspace.GameSystem.InteractiveItem
        AutoESP(path, "OilBucket", "核废桶", Color3.fromRGB(255, 150, 0), ESPSettings.Oil, false)
    end
})
TabESP:Toggle({
    Title = "透视战利品",
    Callback = function(state)
        ESPSettings.Loot = state
        local path = workspace.GameSystem.Loots.World
        for _, item in pairs(path:GetChildren()) do
            if item:IsA("Tool") then
                local part = item:FindFirstChildWhichIsA("BasePart") or item.PrimaryPart
                if part then
                    ESP(part, "战利品", Color3.fromRGB(255, 215, 0), ESPSettings.Loot)
                end
            end
        end
    end
})

TabESP:Toggle({
    Title = "透视冰箱",
    Callback = function(state)
        ESPSettings.Fridge = state
        local path = workspace.GameSystem.InteractiveItem
        AutoESP(path, "Fridge", "冰箱", RandomColor(), ESPSettings.Fridge, false)
    end
})

TabESP:Toggle({
    Title = "透视板条箱",
    Callback = function(state)
        ESPSettings.Crate = state
        local path = workspace.GameSystem.InteractiveItem
        AutoESP(path, "Crate", "板条箱", RandomColor(), ESPSettings.Crate, false)
    end
})

TabESP:Toggle({
    Title = "透视木桶",
    Callback = function(state)
        ESPSettings.Barrel = state
        local path = workspace.GameSystem.InteractiveItem
        AutoESP(path, "WoodenBucket", "木桶", RandomColor(), ESPSettings.Barrel, false)
    end
})

TabESP:Toggle({
    Title = "透视土堆",
    Callback = function(state)
        ESPSettings.Soil = state
        local path = workspace.GameSystem.InteractiveItem
        AutoESP(path, "SoilMound", "土堆", RandomColor(), ESPSettings.Soil, false)
    end
})
end
--快速射击
local KSSJ = function(...)
    secureCheck(...)
    local PS, RS, TS, DB = game:GetService("Players"), game:GetService("RunService"), game:GetService("TweenService"), game:GetService("Debris")
    local LP, RE, RQ = PS.LocalPlayer, game:GetService("ReplicatedStorage").Remotes.ShootRemote, game:GetService("ReplicatedStorage").Remotes.ReloadRemote
    RS.RenderStepped:Connect(function()
        if not Ragebot then return end
        local target, dist = nil, math.huge
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Humanoid") and v.Health > 0 and v.Parent:FindFirstChild("Head") and v.Parent ~= LP.Character and not v.Parent:FindFirstChildWhichIsA("ForceField") then
                local d = (LP.Character.PrimaryPart.Position - v.Parent.Head.Position).Magnitude
                if d < dist then target = v.Parent.Head; dist = d end
            end
        end
        if target then
            local S = LP.Character.PrimaryPart.Position + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
            local E = target.Position
            RE:FireServer(S, E, target, (E - S).Unit, workspace:GetServerTimeNow())
            RQ:FireServer()
            local P = Instance.new("Part")
            local mag = (E - S).Magnitude
            P.Name, P.Anchored, P.CanCollide, P.CastShadow = "Trace", true, false, false
            P.Material, P.Color = Enum.Material.Neon, Color3.fromHSV(tick() % 1, 0.8, 1)
            P.Size = Vector3.new(0.15, 0.15, mag)
            P.CFrame = CFrame.lookAt(S, E) * CFrame.new(0, 0, -mag/2)
            P.Parent = workspace
            TS:Create(P, TweenInfo.new(0.3), {Transparency = 1, Size = Vector3.new(0, 0, mag)}):Play()
            DB:AddItem(P, 0.3)
        end
    end)
    local Main = Window:Section({ Title = "快速射击", Opened = true })
    local CombatTab = Main:Tab({ Title = "战斗" })
    CombatTab:Toggle({ Title = "Ragebot", Value = false, Callback = function(s) Ragebot = s end })
end
--最坚强的
local TSB = function(...)
secureCheck(...)
local Settings = {
    Ragdoll = false, Slow = false, Freeze = false, NoFatigue = false,
    AutoRun = false, FullBright = false, FaceNearest = false, SpeedBoost = false,
    GlobalBlock = false
}

local LP = game.Players.LocalPlayer
local RS = game:GetService("RunService")
local Event = game:GetService("Players").LocalPlayer.Character.Communicate

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method, args = getnamecallmethod(), {...}
    if method == "FindFirstChild" or method == "FindFirstChildOfClass" then
        if Settings.Ragdoll and args[1] == "Ragdoll" then return nil end
        if Settings.Slow and args[1] == "Slowed" then return nil end
        if Settings.Freeze and args[1] == "Freeze" then return nil end
    elseif method == "GetAttribute" then
        local attr = args[1]
        if Settings.NoFatigue and attr == "NoFatigue" then return true end
        if Settings.AutoRun and attr == "S_AutoRun" then return true end
    end
    return old(self, ...)
end)
setreadonly(mt, true)
RS.RenderStepped:Connect(function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")

    if AutoDZ and LP:GetAttribute('Ultimate') == 100 then
        Event:FireServer({Goal = "KeyRelease",Key = Enum.KeyCode.G})
    end
    
    if Settings.FullBright then
        game.Lighting.Brightness, game.Lighting.ClockTime, game.Lighting.OutdoorAmbient = 2, 12, Color3.new(1,1,1)
    end
    
    if Settings.SpeedBoost and hum and hum.MoveDirection.Magnitude > 0 then
        char:TranslateBy(hum.MoveDirection * 0.05)
    end

    if Settings.FaceNearest and hrp then
        local target, dist = nil, math.huge
        for _, v in next, game.Players:GetPlayers() do
            if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local d = (hrp.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if d < dist then target, dist = v.Character.HumanoidRootPart, d end
            end
        end
        if target then
            hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(target.Position.X, hrp.Position.Y, target.Position.Z))
        end
    end
end)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local LastTick = 0
local gmfb = false
local TargetPlayer

local function updateTargetPlayer(input)
    TargetPlayer = input
end
local platformPos = Vector3.new(100, 100, 100)
local platform = Instance.new("Part")
platform.Size = Vector3.new(5, 1, 5)
platform.Position = platformPos
platform.Anchored = true
platform.Parent = workspace
RunService.Heartbeat:Connect(function()
    if not gmfb then return end
    
    local Char = LP.Character
    local Root = Char and Char:FindFirstChild("HumanoidRootPart")
    local Comm = Char and Char:FindFirstChild("Communicate")
    if not (Root and Comm) then return end
    
    local function Act()
        if tick() - LastTick < 0.1 then return end
        LastTick = tick()
        Comm:FireServer({Goal = "LeftClick"})
        Comm:FireServer({Goal = "LeftClickRelease"})
    end

    if Char:FindFirstChild("Trash Can") then
        local LowestHealth = math.huge
        local SelectedTarget
        
        for _, P in ipairs(Players:GetPlayers()) do
            if P ~= LP and P.Character and P.Character:FindFirstChild("HumanoidRootPart") and P.Character:FindFirstChildOfClass("Humanoid") then
                local Hum = P.Character:FindFirstChildOfClass("Humanoid")
                if Hum.Health > 0 then
                    if TargetPlayer and TargetPlayer ~= "" and P.Name:lower():find(TargetPlayer:lower()) then
                        SelectedTarget = P.Character.HumanoidRootPart
                        break
                    elseif not TargetPlayer or TargetPlayer == "" then
                        if Hum.Health < LowestHealth then
                            LowestHealth = Hum.Health
                            SelectedTarget = P.Character.HumanoidRootPart
                        end
                    end
                end
            end
        end
        
        if SelectedTarget then
            Root.CFrame = CFrame.lookAt(SelectedTarget.Position + Vector3.new(0, 0, 10), SelectedTarget.Position)
            Act()
        end
    else
        local foundTrash = false
        for _, v in ipairs(workspace.Map.Trash:GetChildren()) do
            if v:IsA("Model") and not v:GetAttribute("Broken") then
                Root.CFrame = v:GetPivot() * CFrame.new(0, -2, 2)
                Act()
                foundTrash = true
                break
            end
        end
        
        if not foundTrash then
            Root.CFrame = CFrame.new(platformPos + Vector3.new(0, 3, 0))
        end
    end
end)

local LP = game:GetService("Players").LocalPlayer
local LastSkillValue
local LastM1FireValue
local LastM1CooldownValue
local Pressing = false
local PressTime = 0
local M1CooldownTime = 0

game:GetService("RunService").Heartbeat:Connect(function()
if AutoBlack then
    local TargetChar = nil
    local ClosestDist = math.huge
    
    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        if Player ~= LP and Player.Character then
            local Root = Player.Character:FindFirstChild("HumanoidRootPart")
            local MyRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            
            if Root and MyRoot then
                local Dist = (Root.Position - MyRoot.Position).Magnitude
                if Dist < 50 and Dist < ClosestDist then
                    ClosestDist = Dist
                    TargetChar = Player.Character
                end
            end
        end
    end
    
    if TargetChar then
        local HoldingM1 = TargetChar:GetAttribute("HoldingM1")
        local CurrentSkill = TargetChar:GetAttribute("LastSkill")
        local CurrentM1Fire = TargetChar:GetAttribute("LastM1Fire")
        local CurrentM1Cooldown = TargetChar:GetAttribute("M1cooldown")
        
        if (HoldingM1 == true) or (CurrentSkill and CurrentSkill ~= LastSkillValue) or 
           (CurrentM1Fire and CurrentM1Fire ~= LastM1FireValue) then
            
            LastSkillValue = CurrentSkill
            LastM1FireValue = CurrentM1Fire
            
            local Event = LP.Character and LP.Character:FindFirstChild("Communicate")
            if Event and not Pressing then
                Event:FireServer({Goal = "KeyPress", Key = Enum.KeyCode.F})
                Pressing = true
                PressTime = tick()
                M1CooldownTime = tick()
            end
        elseif CurrentM1Cooldown and CurrentM1Cooldown == LastM1CooldownValue and tick() - M1CooldownTime >= 5 then
            local Event = LP.Character and LP.Character:FindFirstChild("Communicate")
            if Event and not Pressing then
                Event:FireServer({Goal = "KeyPress", Key = Enum.KeyCode.F})
                Pressing = true
                PressTime = tick()
                M1CooldownTime = tick()
            end
        elseif Pressing and tick() - PressTime >= 0.5 then
            local Event = LP.Character and LP.Character:FindFirstChild("Communicate")
            if Event then
                Event:FireServer({Goal = "KeyRelease", Key = Enum.KeyCode.F})
                Pressing = false
            end
        end
        
        LastM1CooldownValue = CurrentM1Cooldown
    elseif Pressing and tick() - PressTime >= 0.5 then
        local Event = LP.Character and LP.Character:FindFirstChild("Communicate")
        if Event then
            Event:FireServer({Goal = "KeyRelease", Key = Enum.KeyCode.F})
            Pressing = false
        end
    end
end
end)
local Main = Window:Section({ Title = "最强战场", Opened = true })
local Tab = Main:Tab({ Title = "主功能" })
Tab:Input({
    Title = "目标玩家（留空=全体）",
    Desc = "输入用户名选择",
    Value = "",
    Type = "Input",
    Callback = function(input)
        updateTargetPlayer(input)
    end
})
Tab:Toggle({
    Title = "自动垃圾桶击杀",
    Desc = "没有垃圾桶会自动传送安全点位",
    Value = false,
    Callback = function(state) 
        gmfb = state
    end
})
Tab:Toggle({ Title = "移除布娃娃", Value = false, Callback = function(v) Settings.Ragdoll = v end })
Tab:Toggle({ Title = "移除减速", Value = false, Callback = function(v) Settings.Slow = v end })
Tab:Toggle({ Title = "移除冻结", Value = false, Callback = function(v) Settings.Freeze = v end })
Tab:Toggle({ Title = "移除疲劳", Value = false, Callback = function(v) Settings.NoFatigue = v end })
Tab:Toggle({ Title = "自动大招", Value = false, Callback = function(v) AutoDZ = v end })
Tab:Toggle({ Title = "自动格挡", Value = false, Callback = function(v) AutoBlack = v end })
Tab:Toggle({ Title = "自动朝向", Value = false, Callback = function(v) Settings.FaceNearest = v end })
Tab:Toggle({ Title = "微加速", Value = false, Callback = function(v) Settings.SpeedBoost = v end })
Tab:Toggle({ Title = "高亮", Value = false, Callback = function(v) Settings.FullBright = v end })
end
local servertable = {
--[2820580801] = { run = ohio, name = "俄亥俄州 (Ohio)" },
--[4987856151] = { run = wanted, name = "通缉 (Wanted)" },
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
    return WindUI:Notify({ Title = "系统", Content = "暂不支持当前服务器", Duration = 5 })
end
local success, err = pcall(function()
win()
config.run(generateKey())
end)
if not success then
    return WindUI:Notify({ Title = "系统", Content = "出现异常"..err.."           请开票说明 DC票据", Duration = 5 })
end
WindUI:Notify({
Title = "验证成功",
Content = "已成功加载服务器：" .. config.name,
Duration = 5
})