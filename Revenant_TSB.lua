-- This file has been deobfuscated using Hurricane https://discord.com/invite/AbeurBzKXe
	pcall(function()
		local setfflag_ = setfflag or set_fflag or setfastflag or getgenv and getgenv().setfflag
		if typeof(setfflag_) ~= "function" then
			return
		end

		for _, v23 in ipairs({ "S2PhysicsSenderRate" }) do
			pcall(setfflag_, v23, "2147483647")
		end
	end)

	local localPlayer = game:GetService("Players").LocalPlayer

	if localPlayer and not localPlayer:GetAttribute("PreloadDone") then
		while true do
			task.wait(0.1)
			if not (localPlayer:GetAttribute("PreloadDone") or not localPlayer.Parent) then
				continue
			end
			break
		end
	end

	getgenv()._RevenantTSBLoaded = true
	getgenv()._RevenantLoadStart = tick()
	getgenv()._RevenantDoneLoading = false

	local str3 = "https://gitlab.com/aristooey/Obsidian/-/raw/main/"

	if getgenv().RevenantLoaded then
		if getgenv().RevenantCleanup then
			pcall(getgenv().RevenantCleanup)
		end

		getgenv().RevenantLoaded = false

		pcall(function()
			game:GetService("StarterGui"):SetCore("SendNotification", { Title = bypassText("Revenant"), Text = "Re-executing...", Duration = 1 })
		end)

		task.wait(0)
	end

	getgenv().RevenantLoaded = true

	if not isfolder("Revenant") then
		makefolder("Revenant")
	end

	if not isfolder("Revenant/obsidian") then
		makefolder("Revenant/obsidian")
	end

	if not isfile("Revenant/obsidian/Library.lua") then
		writefile("Revenant/obsidian/Library.lua", game:HttpGet(str3 .. "Library.lua"))
	end

	if not isfile("Revenant/obsidian/ThemeManager.lua") then
		writefile("Revenant/obsidian/ThemeManager.lua", game:HttpGet(str3 .. "addons/ThemeManager.lua"))
	end

	if not isfile("Revenant/obsidian/SaveManager.lua") then
		writefile("Revenant/obsidian/SaveManager.lua", game:HttpGet(str3 .. "addons/SaveManager.lua"))
	end

	local function fn16(arg)
		if arg then
			pcall(function()
				writefile("Revenant/obsidian/Library.lua", game:HttpGet(str3 .. "Library.lua"))
			end)
		end

		local ok, result = pcall(function()
			return loadfile("Revenant/obsidian/Library.lua")()
		end)

		if ok and type(result) == "table" then
			return result
		end
		return nil
	end

	local v24 = fn16(false) or fn16(true)

	if not v24 then
		local ok, result = pcall(function()
			return loadstring(game:HttpGet(str3 .. "Library.lua"))()
		end)

		if ok and type(result) == "table" then
			v24 = result
		end
	end

	if not v24 then
		return warn("[Revenant] Obsidian Library failed to load (repo unreachable?)")
	end
	v24.ForceCheckbox = true

	if not v24.CreateLoading then
		writefile("Revenant/obsidian/Library.lua", game:HttpGet(str3 .. "Library.lua"))
		writefile("Revenant/obsidian/ThemeManager.lua", game:HttpGet(str3 .. "addons/ThemeManager.lua"))
		writefile("Revenant/obsidian/SaveManager.lua", game:HttpGet(str3 .. "addons/SaveManager.lua"))
		v24 = loadfile("Revenant/obsidian/Library.lua")()
		v24.ForceCheckbox = true
	end

	local v25 = loadfile("Revenant/obsidian/ThemeManager.lua")()
	local v26 = loadfile("Revenant/obsidian/SaveManager.lua")()
	local options = v24.Options
	local toggles = v24.Toggles

	local obj = setmetatable({ Value = false }, { __index = function()
		return function()
		end
	end })

	if not getmetatable(options) then
		setmetatable(options, { __index = function()
			return obj
		end })
	end

	if not getmetatable(toggles) then
		setmetatable(toggles, { __index = function()
			return obj
		end })
	end

	_rawget = function(arg, arg2)
		if type(arg) ~= "table" then
			return nil
		end
		return rawget(arg, arg2)
	end

	_revDesyncBlocked = function(arg)
		if not arg then
			return false
		end
		return arg:FindFirstChild("AbsoluteImmortal") and true or false
	end

	local flag5 = false
	local n13 = 0
	local flag6 = false
	local fn17 = nil
	local fn18 = nil
	local str4 = nil
	local fn19 = nil
	local fn20 = nil
	local tbl5 = nil
	local tbl6 = nil
	local tbl7 = nil
	local flag7 = nil
	local flag8 = nil
	local flag9 = nil
	local tbl8 = nil
	local tbl9 = nil
	local tbl10 = nil
	local v27 = nil
	local connection = nil
	local v28 = nil
	local connection2 = nil
	local connection3 = nil
	local tbl11 = nil
	local fn21 = nil
	local fn22 = nil
	local fn23 = nil
	local fn24 = nil
	local fn25 = nil
	local fn26 = nil
	local fn27 = nil
	local fn28 = nil
	local fn29 = nil
	local fn30 = nil
	local tbl12 = nil
	local str5 = nil
	local fn31 = nil
	local fn32 = nil
	local tbl13 = nil
	local rcsMyRank = nil
	local str6 = nil
	local tbl14 = nil
	local tbl15 = nil
	local rcsMyHWID = nil
	local str7 = nil
	local connection4 = nil
	local fn33 = nil
	local fn34 = nil
	local fn35 = nil
	local fn36 = nil
	getgenv()._antiBoxT = 1
	local clone = nil
	local humanoidRootPart = nil
	local v29 = nil
	local localPlayer2 = game:GetService("Players").LocalPlayer

	if not (localPlayer2.DisplayName ~= "" and localPlayer2.DisplayName) then
	end

	local CoreGui = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
	local v30 = CoreGui

	pcall(function()
		v30 = (gethui or get_hidden_gui or function()
		end)() or CoreGui
	end)

	local revenantLoadingGui = v30:FindFirstChild("RevenantLoadingGui")

	if revenantLoadingGui then
		pcall(function()
			revenantLoadingGui:Destroy()
		end)
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "RevenantLoadingGui"
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = math.huge
	screenGui.IgnoreGuiInset = true

	pcall(function()
		(protectgui or syn and syn.protect_gui or function()
		end)(screenGui)
	end)

	screenGui.Parent = v30
	local textLabel = Instance.new("TextLabel")
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.Gotham
	textLabel.TextSize = 15
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.AnchorPoint = Vector2.new(0.5, 0)
	textLabel.Position = UDim2.new(0.5, 0, 0.085, 0)
	textLabel.Size = UDim2.new(0, 500, 0, 20)
	textLabel.ZIndex = math.huge
	textLabel.Text = ""
	textLabel.Parent = screenGui

	task.spawn(function()
		for i = 1, 9 do
			if not screenGui.Parent then
				return
			end
			textLabel.Text = ("Loading.."):sub(1, i)
			task.wait(0.03)
		end
	end)

	local function fn37()
		if not screenGui.Parent then
			return
		end
		textLabel.Text = string.format("Loaded in %.1f seconds!", tick() - (getgenv()._RevenantLoadStart or tick()))
		task.wait(2)

		while screenGui.Parent and textLabel.Text ~= "" do
			textLabel.Text = textLabel.Text:sub(1, -2)
			task.wait(0.03)
		end

		pcall(function()
			screenGui:Destroy()
		end)
	end

	if type(isfile) == "function" and type(writefile) == "function" and type(readfile) == "function" then
		writefile("Revenant/obsidian/Library.lua", game:HttpGet(str3 .. "Library.lua"))
		writefile("Revenant/obsidian/ThemeManager.lua", game:HttpGet(str3 .. "addons/ThemeManager.lua"))
		writefile("Revenant/obsidian/SaveManager.lua", game:HttpGet(str3 .. "addons/SaveManager.lua"))
		v24 = loadfile("Revenant/obsidian/Library.lua")()
		v24.ForceCheckbox = true
		v25 = loadfile("Revenant/obsidian/ThemeManager.lua")()
		v26 = loadfile("Revenant/obsidian/SaveManager.lua")()
		options = v24.Options
		toggles = v24.Toggles

		local obj2 = setmetatable({ Value = false }, { __index = function()
			return function()
			end
		end })

		if not getmetatable(options) then
			setmetatable(options, { __index = function()
				return obj2
			end })
		end

		if not getmetatable(toggles) then
			setmetatable(toggles, { __index = function()
				return obj2
			end })
		end
	end

	task.spawn(function()
		if not isfolder("Revenant/assets") then
			makefolder("Revenant/assets")
		end

		local str8 = "https://gitlab.com/aristooey/Revenant/-/raw/main/assets/"

		for _, v31 in ipairs({ "M1Hit1.mp3", "M1Hit2.mp3", "M1Hit3.mp3", "M1Hit4.mp3" }) do
			local str9 = "Revenant/assets/" .. v31

			if not isfile(str9) then
				local ok, result = pcall(function()
					return game:HttpGet(str8 .. v31)
				end)

				if ok and result and #result > 0 then
					pcall(writefile, str9, result)
				end
			end
		end
	end)

	local function fn38(arg, arg2)
		local function fn39(arg3)
			local n14 = math.floor(arg3 / 100)
			local n15 = (19 * arg3 % 19 + (15 - math.floor((13 + 8 * n14) / 25) + n14 - math.floor(n14 / 4)) % 30) % 30
			local n16 = (2 * arg3 % 4 + 4 * arg3 % 7 + 6 * n15 + (4 + n14 - math.floor(n14 / 4)) % 7) % 7
			local n17 = 22 + n15 + n16
			if n15 == 29 and n16 == 6 then
				return "04 19"
			end

			if n15 == 28 and n16 == 6 then
				return "04 18"
			end

			if n17 > 31 then
				return ("04 %02d"):format(n17 - 31)
			end
			return ("03 %02d"):format(n17)
		end

		local tbl16 = { ["01 01"] = "�", ["10 31"] = "�", [fn39(tonumber(os.date("%Y")))] = "�" }

		if arg2 and arg2.entireChristmas then
			for i = 1, 31 do
				tbl16["12 " .. ("%02d"):format(i)] = ({ "�", "�" })[math.random(1, 2)]
			end
		end

		local v31 = os.date("%m %d")
		if tbl16[v31] then
			local v32 = tbl16[v31]
			return ("%s %s %s"):format(v32, arg, v32)
		end
		return arg
	end

	local function fn39(arg)
		return fn38(arg, { entireChristmas = true })
	end

	task.spawn(function()
		local ok, result = xpcall(function()
			local v31

			local function fn40()
				local ok, result = pcall(function()
					if not isfolder("Revenant") then
						makefolder("Revenant")
					end

					if not isfolder("Revenant/assets") then
						makefolder("Revenant/assets")
					end

					local id = nil

					pcall(function()
						local v32 = game
						local data = game:GetService("HttpService"):JSONDecode(v32:HttpGet("https://gitlab.com/api/v4/projects/aristooey%2FRevenant/repository/commits?ref_name=main&path=exponential.png&per_page=1"))
						id = type(data) == "table" and data[1] and data[1].id
					end)

					local sha = isfile("Revenant/assets/.exponential.sha") and readfile("Revenant/assets/.exponential.sha") or nil
					local flag10 = not isfile("Revenant/assets/exponential") or id and id ~= sha

					if flag10 then
						local response = game:HttpGet("https://gitlab.com/aristooey/Revenant/-/raw/main/exponential.png")

						if type(response) == "string" and #response > 0 then
							writefile("Revenant/assets/exponential", response)

							if id then
								writefile("Revenant/assets/.exponential.sha", id)
							end
						end
					end

					if not isfile("Revenant/assets/exponential") then
						return nil
					end
					return getcustomasset("Revenant/assets/exponential")
				end)

				return ok and type(result) == "string" and result ~= "" and result or "ghost"
			end

			v31 = v24:CreateWindow({
				Title = "",
				Footer = fn39("Phantasm's old test version fixed + improved. | discord.gg/TYdSMmQaF9"),
				Icon = fn40(),
				CornerRadius = 10,
				SidebarCompacted = true,
				NotifySide = "Right",
				ShowCustomCursor = false,
				Resizable = true,
				Center = true,
				AutoShow = true,
				Animations = { ToggleWindow = true, TabSwitch = true, Groupbox = true, Dropdown = true, KeyPicker = true },
			})

			v24.ShowCustomCursor = false

			do
				if type(v24.Animations) == "table" then
					v24.Animations.ToggleWindow = false
				end

				task.delay(0.6, function()
					local list = v24.Toggles

					if type(list) ~= "table" then
						return
					end

					for _, t in pairs(list) do
						pcall(function()
							if t.Display then
								t:Display()
							end
						end)
					end
				end)
			end
			local notify = v24.Notify

			v24.Notify = function(arg, arg2)
				if v24.Unloaded then
					return
				end

				if type(arg2) == "table" then
					local str8 = tostring(arg2.Title or "")

					return notify(arg, {
						Title = str8 ~= "" and str8 or "Revenant",
						Description = tostring(arg2.Content or ""),
						Time = arg2.Time or arg2.Duration or 4,
						SoundId = 106145041472451,
						Volume = 1,
					})
				end

				return notify(arg, {
					Title = fn39("Revenant"),
					Description = tostring(arg2 or ""),
					Time = 4,
					SoundId = 106145041472451,
					Volume = 1,
				})
			end

			do
				local MAP = {
					["..."] = "...",["3 blocks in a row from the target toggles the mode."] = "连续 3 次格挡目标即可切换模式。",
					["3s - Fakeout"] = "3 秒 · 假动作",["5s - Long Fakeout"] = "5 秒 · 长假动作",
					[";bring {player,all}"] = ";bring {玩家,all}  → 拉到身边",[";fling/void {player,all,others}"] = ";fling/void {玩家,all,others}  → 弹飞",
					[";goto/tp/to {player}"] = ";goto/tp/to {玩家}  → 前往",[";kick {player,all} {reason}"] = ";kick {玩家,all} {原因}  → 踢出",
					[";kill {player,all}"] = ";kill {玩家,all}  → 杀死",[";listrevenantusers/listrev"] = ";listrevenantusers/listrev  → 列出同类",
					[";rejoin/rj"] = ";rejoin/rj  → 重进本房",[";reset"] = ";reset  → 重置角色",
					[";say {player,all} {message}"] = ";say {玩家,all} {消息}  → 代为发言",[";sonic {player,all}"] = ";sonic {玩家,all}  → 整蛊",
					[";view/spectate {player}"] = ";view/spectate {玩家}  → 观战",[";whitelist/addwhitelist {player}"] = ";whitelist/addwhitelist {玩家}  → 加入白名单",
					["<font color=\"rgb(0,255,255)\">Anti Frozen Soul</font>"] = "<font color=\"rgb(0,255,255)\">反制 · 冰霜之魂</font>",["<font color=\"rgb(125,255,134)\">Anti Wild Psychic</font>"] = "<font color=\"rgb(125,255,134)\">反制 · 狂暴超能</font>",
					["<font color=\"rgb(153,144,255)\">Anti Deadly Ninja</font>"] = "<font color=\"rgb(153,144,255)\">反制 · 致命忍者</font>",["<font color=\"rgb(153,144,255)\">Anti Martial Artist</font>"] = "<font color=\"rgb(153,144,255)\">反制 · 武术家</font>",
					["<font color=\"rgb(167,40,241)\">Anti Cosmic Form</font>"] = "<font color=\"rgb(167,40,241)\">反制 · 宇宙形态</font>",["<font color=\"rgb(255,102,105)\">Anti Destructive Cyborg</font>"] = "<font color=\"rgb(255,102,105)\">反制 · 破坏机械人</font>",
					["<font color=\"rgb(255,102,105)\">Anti KJ</font>"] = "<font color=\"rgb(255,102,105)\">反制 · KJ</font>",["<font color=\"rgb(255,134,136)\">Anti The Strongest Hero</font>"] = "<font color=\"rgb(255,134,136)\">反制 · 最强英雄</font>",
					["<font color=\"rgb(255,166,170)\">Anti Tech Prodigy</font>"] = "<font color=\"rgb(255,166,170)\">反制 · 科技天才</font>",["<font color=\"rgb(255,21,56)\">Anti Monster Form</font>"] = "<font color=\"rgb(255,21,56)\">反制 · 怪兽形态</font>",
					["<font color=\"rgb(255,255,255)\">Anti Brutal Demon</font>"] = "<font color=\"rgb(255,255,255)\">反制 · 残暴恶魔</font>",["<font color=\"rgb(255,60,0)\">Anti Blade Master</font>"] = "<font color=\"rgb(255,60,0)\">反制 · 剑圣</font>",
					["<font color=\"rgb(93,190,255)\">Anti Hero Hunter</font>"] = "<font color=\"rgb(93,190,255)\">反制 · 英雄猎人</font>",["Above Tunnel"] = "隧道上方",
					["Accent color"] = "强调色",["Actions"] = "操作",
					["Add Current to Favorite"] = "收藏当前",["Admin Quotes"] = "管理员台词",
					["Airstrike"] = "空袭",["All"] = "全部",
					["Allows you to purchase any limited emote at any time."] = "可以随时购买任何限定表情。",["Always"] = "常开",
					["Always Can Chat"] = "始终可聊天",["Always Enabled"] = "始终显示",
					["Ambient"] = "环境光",["Ambient Enabled"] = "启用环境光",
					["Animation Functions"] = "动画功能",["Animation Speed"] = "动画速度",
					["Animations"] = "动画",["Anime TP"] = "动漫传送",
					["Anime Teleportation"] = "动漫传送",["Anime Teleportation Keybind"] = "动漫传送 · 按键",
					["Anti 20-20-20 Dropkick"] = "反制 · 20-20-20 飞踢",["Anti Atomic Slash"] = "反制 · 原子斩",
					["Anti Atomic Slash Finisher"] = "反制 · 原子斩终结",["Anti Berserk"] = "反制 · 狂暴",
					["Anti Brutal Beatdown"] = "反制 · 残暴痛击",["Anti Carnage"] = "反制 · 杀戮",
					["Anti Conquest"] = "反制 · 征服",["Anti Consecutive Punches"] = "反制 · 连续拳",
					["Anti Cosmic Strike"] = "反制 · 宇宙打击",["Anti Crushed Rock"] = "反制 · 碎岩",
					["Anti Crushing Pull"] = "反制 · 碾压牵引",["Anti Death Blow"] = "反制 · 致命一击",
					["Anti Death Counter"] = "反制 · 死亡反击",["Anti Death Counter Delay"] = "防死亡反击等待",
					["Anti Death Counter Shockwave"] = "反制 · 死亡反击冲击波",["Anti Dragon's Descent"] = "反制 · 龙之降临",
					["Anti Earth Splitting Strike"] = "反制 · 裂地击",["Anti Expulsive Push"] = "反制 · 排斥推力",
					["Anti Final Hunt Finisher"] = "反制 · 终猎终结",["Anti Five Seasons"] = "反制 · 五季",
					["Anti Flamewave Cannon"] = "反制 · 炎波炮",["Anti Flash Strike"] = "反制 · 闪光斩",
					["Anti Flowing Water"] = "反制 · 流水拳",["Anti Fourfold Flashstrike"] = "反制 · 四重闪光斩",
					["Anti Freezing Path"] = "反制 · 冰封之路",["Anti Frost Forge"] = "反制 · 霜铸",
					["Anti Gamma Ray Burst"] = "反制 · 伽马射线暴",["Anti God Slayer"] = "反制 · 弑神者",
					["Anti Grand Fissure"] = "反制 · 大裂谷",["Anti Great Fajin"] = "反制 · 大爆发",
					["Anti Hunter's Grasp"] = "反制 · 猎人擒握",["Anti Hunter's Mark"] = "反制 · 猎人印记",
					["Anti Incinerate"] = "反制 · 焚毁",["Anti Iron Giant"] = "反制 · 钢铁巨人",
					["Anti Judgement Chain"] = "反制 · 裁决之链",["Anti Last Breath"] = "反制 · 最后一息",
					["Anti Lethal Whirlwind Stream"] = "反制 · 致命旋风",["Anti Limit Breaker"] = "反制 · 突破极限",
					["Anti Mech Dash"] = "反制 · 机甲冲刺",["Anti Mech M1s"] = "反制 · 机甲普攻",
					["Anti Missiles"] = "反制 · 导弹",["Anti Moves"] = "防制招式",
					["Anti Normal Punch"] = "反制 · 普通拳",["Anti Nuclear Fission"] = "反制 · 核裂变",
					["Anti Omni Directional Punch"] = "反制 · 全向拳",["Anti Permafrost"] = "反制 · 永冻",
					["Anti Photon Dive"] = "反制 · 光子俯冲",["Anti Photon Edge"] = "反制 · 光子刃",
					["Anti Prey's Peril"] = "反制 · 猎物之危",["Anti Psychic Ricochet"] = "反制 · 念力弹射",
					["Anti Ragdoll"] = "防布娃娃",["Anti Railgun"] = "反制 · 轨道炮",
					["Anti Rampage"] = "反制 · 暴走",["Anti Rock Splitting Fist"] = "反制 · 碎岩拳",
					["Anti Savage Tornado"] = "反制 · 狂暴龙卷",["Anti Scorching Blade"] = "反制 · 灼热之刃",
					["Anti Serious Punch"] = "反制 · 认真一拳",["Anti Shove"] = "反制 · 推击",
					["Anti Singularity"] = "反制 · 奇点",["Anti Sky Ripping Fist"] = "反制 · 裂空拳",
					["Anti Sky Snatcher"] = "反制 · 夺空者",["Anti Solar Cleave"] = "反制 · 烈阳斩",
					["Anti Speedblitz Dropkick"] = "反制 · 闪电飞踢",["Anti Stoic Bomb"] = "反制 · 坚忍炸弹",
					["Anti Stone Coffin"] = "反制 · 石棺",["Anti Stone Grave"] = "反制 · 石墓",
					["Anti Straight On"] = "反制 · 正面突进",["Anti Strength Difference"] = "反制 · 力量差距",
					["Anti Sunrise"] = "反制 · 日出斩",["Anti Sunset"] = "反制 · 日落斩",
					["Anti Table Flip"] = "反制 · 掀桌",["Anti Tactical Storm"] = "反制 · 战术风暴",
					["Anti Terrible Tornado"] = "反制 · 恐怖龙卷",["Anti The Final Hunt"] = "反制 · 最终狩猎",
					["Anti Thunder Kick"] = "反制 · 雷霆踢",["Anti Trashcan"] = "防垃圾桶",
					["Anti Twin Fangs"] = "反制 · 双牙",["Anti Twinblade Rush"] = "反制 · 双刃突袭",
					["Anti Uppercut"] = "反制 · 上勾拳",["Anti Water Stream Cutting Fist"] = "反制 · 水流斩拳",
					["Anti Whirlwind Drop"] = "反制 · 旋风落",["Anti Whirlwind Kick"] = "反制 · 旋风踢",
					["Anti Windstorm Fury"] = "反制 · 风暴狂怒",["Anti's"] = "防制",
					["Anti-Fling"] = "防弹飞",["Anti-Invisibility"] = "反隐身",
					["Apply"] = "应用",["Apply Selected"] = "应用所选",
					["Are you sure you want to unload Revenant? All active features will be disabled and the script will be unloaded."] = "确定要卸载 Revenant 吗？所有功能都会关闭，脚本将被卸载。",["Area"] = "范围",
					["Arena"] = "竞技场",["Atmos Cleave"] = "大气斩",
					["Atomic Slash"] = "原子斩",["Attach"] = "吸附",
					["Attach X"] = "吸附 X",["Attach Y"] = "吸附 Y",
					["Attach Z"] = "吸附 Z",["Attack All"] = "全体攻击",
					["AttackAllMoves"] = "全体攻击 · 招式",["Aurora"] = "极光",
					["Auto Cosmic Garou"] = "自动宇宙饿狼",["Auto Goon"] = "自动抖动",
					["Auto Goon Speed"] = "自动抖动速度",["Auto Prediction"] = "自动预判",
					["Auto Ragdoll Cancel"] = "自动解除布娃娃",["Auto Wall Combo"] = "自动贴墙连",
					["Auto Wall Combo + Bring"] = "自动贴墙连 + 拉人",["Auto-Sky"] = "自动天空",
					["Automation"] = "自动化",["Avatar Disguise"] = "外观伪装",
					["Back Dash Distance (Multiplier)"] = "后冲距离（倍数）",["Background Image"] = "背景图片",
					["Background color"] = "背景色",["Bang Anim"] = "砰砰动作",
					["Bang Animation"] = "砰砰动作",["Bang Animation Speed"] = "砰砰动作速度",
					["Barrage"] = "连打",["Baseplate"] = "基础平台",
					["Below Baseplate"] = "基础平台下方",["Berry Smoothie"] = "莓果冰沙",
					["Better One"] = "进阶",["Better with Anti-Fling"] = "配合「防弹飞」效果更好",
					["Bigger Jail"] = "大监狱",["Binding Cloth"] = "束缚之布",
					["Black Domain"] = "黑域",["Block"] = "格挡",
					["Block Animation"] = "格挡动画",["Block Color"] = "格挡颜色",
					["Blocking"] = "格挡",["Blue"] = "蓝色",
					["Boxer"] = "拳击",["Bring"] = "拉人",
					["Brutal Beatdown"] = "残暴痛击",["Bullet Barrage"] = "弹幕连打",
					["Burst"] = "爆发",["Buttercup"] = "奶油花",
					["Buy"] = "购买",["Bypass Limited Emotes Timer"] = "绕过限定表情时限",
					["Bypasses"] = "解除限制",["CFrame"] = "CFrame 位移",
					["CFrame Speed"] = "CFrame 加速",["Can lag, also, Anti-invisibility on mech would be laggy, so there isn't any."] = "可能掉帧；机甲形态的反隐身会很卡，所以没做。",
					["Cancel"] = "取消",["Candy Cane"] = "拐杖糖",
					["Candy Pop"] = "糖果",["Change themes for Revenant!"] = "更换 Revenant 的主题！",
					["Character"] = "角色",["Character \""] = "角色 \"",
					["Character Exploits"] = "角色漏洞",["Characters"] = "角色列表",
					["Chat"] = "聊天",["Chat Flooder"] = "聊天刷屏",
					["Chat Flooder Delay"] = "聊天刷屏间隔",["Choose to Chinese"] = "选择中文",
					["Cobalt Remote Spy"] = "Cobalt 远程监视",["Combat"] = "战斗",
					["Combat Functions"] = "战斗功能",["Comfort"] = "易用性",
					["Command"] = "指令",["Command Bar"] = "指令栏",
					["Command Bar Keybind"] = "指令栏按键",["Command Functions"] = "指令功能",
					["Command bar"] = "指令栏",["Command transport recovered on emote slot "] = "指令通道已在表情槽恢复: ",
					["Commands"] = "指令",["Compatibility"] = "兼容",
					["Config"] = "配置",["Config JSON"] = "配置 JSON",
					["Config list"] = "配置列表",["Config name"] = "配置名称",
					["Configuration"] = "配置",["Consecutive Punches"] = "连续拳",
					["Contrast check"] = "对比度检查",["Copied color"] = "已复制颜色",
					["Copy Discord Server"] = "复制 Discord 邀请",["Copy Hex"] = "复制 HEX",
					["Copy Job ID"] = "复制房间 ID",["Copy Profile Link"] = "复制主页链接",
					["Copy RGB"] = "复制 RGB",["Copy Username"] = "复制用户名",
					["Copy color"] = "复制颜色",["Could not join that server"] = "无法加入该服务器",
					["Crazy"] = "疯狂",["Create config"] = "新建配置",
					["Create theme"] = "新建主题",["Credits"] = "致谢",
					["Crimson Whirl"] = "赤红旋风",["Crowd Finisher"] = "群体终结",
					["CrushPullMode"] = "碾压牵引模式",["Crushed Rock Variant"] = "碎岩（变体）",
					["Crushing Pull"] = "碾压牵引",["Crushing Pull Extender"] = "碾压牵引延长",
					["Crushing Pull Mode"] = "碾压牵引模式",["Crushing Pull Variant"] = "碾压牵引（变体）",
					["Current autoload config: none"] = "当前自动加载配置：无",["Current default theme: none"] = "当前默认主题：无",
					["Custom Animations"] = "自定义动画",["Custom Back Dash"] = "自定义后冲",
					["Custom Downslam"] = "自定义下砸",["Custom Front Dash"] = "自定义前冲",
					["Custom Side Dash"] = "自定义侧冲",["Custom Uppercut"] = "自定义上勾",
					["Custom theme name"] = "自定义主题名称",["Custom themes"] = "自定义主题",
					["Dark Domain"] = "暗域",["Dashes"] = "冲刺",
					["Death"] = "死亡",["Death Blow"] = "致命一击",
					["Death Counter"] = "死亡反击",["Death Counter Quotes Mode"] = "死亡反击台词模式",
					["Death Counter attempt detected."] = "检测到死亡反击尝试。",["Default"] = "默认",
					["Delete config"] = "删除配置",["Delete theme"] = "删除主题",
					["Desync"] = "脱同步",["Desync Visualizer"] = "脱同步可视化",
					["Discord link copied to clipboard. Please report this issue."] = "Discord 链接已复制，请反馈该问题。",["Disguise"] = "伪装",
					["Disguise Functions"] = "伪装功能",["Don't Follow"] = "不跟随",
					["Double Trouble"] = "双重麻烦",["Down Fall"] = "坠落",
					["Downslam"] = "下砸",["Downslam Finisher"] = "下砸终结",
					["ESP"] = "透视",["Emote"] = "表情",
					["Emote Dash"] = "表情冲刺",["Emote not found."] = "找不到该表情。",
					["Enable Custom Downslam"] = "启用自定义下砸",["Enable Custom M1's"] = "启用自定义普攻",
					["Enable Custom Saitama Anims"] = "启用自定义琦玉动画",["Enable Custom Uppercut"] = "启用自定义上勾",
					["Enable SG VFX"] = "启用星辉特效",["Encrypted"] = "加密",
					["Encrypted Position"] = "加密坐标",["Encrypted Speed"] = "加密速度",
					["End"] = "终点",["Enter ms..."] = "输入毫秒...",
					["Enter username or user ID..."] = "输入用户名或用户 ID...",["Even Bigger Jail"] = "更大监狱",
					["Executor: ..."] = "执行器: ...",["Export current config"] = "导出当前配置",
					["Export current theme"] = "导出当前主题",["Expose Whitelisted Players"] = "显示白名单玩家",
					["Expose moves in chat"] = "在聊天中显示招式",["Extended Dash Time"] = "延长冲刺时间",
					["Extra"] = "扩展",["Fantasy"] = "幻想",
					["Favorites"] = "收藏",["Finishin'"] = "终结技",
					["Fission"] = "裂变",["Flame M1"] = "火焰普攻",
					["Fling"] = "弹飞",["Fling "] = "弹飞",
					["Fling Speed"] = "弹飞速度",["Fling Timeout"] = "弹飞超时",
					["Fling Type"] = "弹飞方式",["Flip"] = "翻转",
					["Fly"] = "飞行",["Fly "] = "飞行",
					["Fly Speed"] = "飞行速度",["Flying"] = "漂浮",
					["Follow"] = "跟随",["Font Face"] = "字体",
					["Font color"] = "文字颜色",["Forward Dash Attack"] = "前冲攻击",
					["Free Stargazer / Nightchild"] = "免费 观星者 / 夜之子",["Freezing Path"] = "冰封之路",
					["Friends with Staff"] = "管理员的好友",["Front Dash Distance"] = "前冲距离",
					["Frost Forge"] = "霜铸",["Future"] = "未来",
					["GET KING MOVESET 999% OP REAL🔥🔥😭"] = "获取王者招式 999% 超模 真的🔥🔥😭",["Game: ..."] = "游戏: ...",
					["Gamma Ray Burst"] = "伽马射线暴",["Garou"] = "饿狼",
					["General"] = "常规",["Genos"] = "杰诺斯",
					["Get Whitebeard Lmaooo"] = "搞个白胡子 哈哈哈",["Girly Walk"] = "少女步",
					["Give Selected (Everyone)"] = "发放所选（所有人）",["Give Selected (Me)"] = "发放所选（自己）",
					["Give Selected (Player)"] = "发放所选（指定玩家）",["God Slayer"] = "弑神者",
					["God's Fear"] = "神之恐惧",["Gojo"] = "五条",
					["Gojo Quotes"] = "五条台词",["Gojo Run"] = "五条跑",
					["Goku"] = "悟空",["Goku Black"] = "黑悟空",
					["Goofy"] = "蠢萌步",["Gotham"] = "哥谭",
					["Goto"] = "前往",["Grave Maker"] = "掘墓者",
					["Halloween!!"] = "万圣节！！",["Hand Offset"] = "手部偏移",
					["Hard Press"] = "重压",["Head First"] = "头槌突进",
					["Head Float"] = "头部漂浮",["Head Float Spam Delay"] = "头部漂浮间隔",
					["Heads up"] = "提示",["Heavy"] = "重击",
					["Hitbox Accurate"] = "判定框精确",["Hold"] = "按住",
					["Home"] = "主页",["Homerun"] = "全垒打",
					["How to use"] = "使用方法",["How to use Stand:"] = "替身使用说明：",
					["Hunter"] = "猎人步",["Hunters Grasp"] = "猎人擒握",
					["Ice Hammer"] = "冰锤",["Ice HammerOld"] = "冰锤（旧版）",
					["Idle"] = "待机",["Idle 1"] = "待机 1",
					["Idle 2"] = "待机 2",["Idle 3"] = "待机 3",
					["Idle 4"] = "待机 4",["Idle Animation"] = "待机动画",
					["Idle Animation End Fade Time"] = "待机动画结束淡出时间",["Idle Animation Start Fade Time"] = "待机动画开始淡入时间",
					["If used with invisibility will hide your chat bubble, might make your camera weird."] = "与隐身同开时会隐藏你的聊天气泡，镜头可能有点怪。",["If you mark someone using Hunters Mark and use Godslayer this will automatically teleport to someone that is marked"] = "用「猎人印记」标记后用「弑神者」，会自动传送到被标记的人身边。",
					["Import config"] = "导入配置",["Import theme"] = "导入主题",
					["In Charge"] = "领队步",["In Don't Follow mode, you stay in place. Stand only acts during your moves."] = "「不跟随」模式下你原地不动，替身只在你出招时行动。",
					["Infinite Yield"] = "Infinite Yield 指令台",["Infinity"] = "无下限",
					["Info"] = "信息",["Invalid player."] = "无效玩家。",
					["Invincible Wobbly Edit"] = "无敌摇摆编辑",["Invisibility"] = "隐身",
					["Invisible Atmos Cleave"] = "隐身 · 大气斩",["Invisible Atomic Samurai"] = "隐身出招 · 原子武士",
					["Invisible Atomic Slash"] = "隐身 · 原子斩",["Invisible Atomic Slash Finisher"] = "隐身 · 原子斩终结",
					["Invisible AtomicSamurai"] = "隐身出招 · 原子武士",["Invisible Block"] = "隐身格挡",
					["Invisible Counter"] = "隐身反击",["Invisible Counter Hit"] = "隐身反击命中",
					["Invisible Crushing Pull"] = "隐身 · 碾压牵引",["Invisible Expulsive Push"] = "隐身 · 排斥推力",
					["Invisible Garou"] = "隐身出招 · 饿狼",["Invisible Genos"] = "隐身出招 · 杰诺斯",
					["Invisible Incinerate"] = "隐身 · 焚毁",["Invisible Moves"] = "隐身出招",
					["Invisible Omni-Directional Punch"] = "隐身 · 全向拳",["Invisible Saitama"] = "隐身出招 · 琦玉",
					["Invisible Serious Punch"] = "隐身 · 认真一拳",["Invisible Solar Cleave"] = "隐身 · 烈阳斩",
					["Invisible Speed-o'-Sonic"] = "隐身出招 · 音速索尼克",["Invisible Stone Grave"] = "隐身 · 石墓",
					["Invisible Suiryu"] = "隐身出招 · 水龙",["Invisible Sunrise"] = "隐身 · 日出斩",
					["Invisible Sunrise Finisher"] = "隐身 · 日出终结",["Invisible Sunset"] = "隐身 · 日落斩",
					["Invisible Table Flip"] = "隐身 · 掀桌",["Invisible Tatsumaki"] = "隐身出招 · 龙卷",
					["Invisible Terrible Tornado"] = "隐身 · 恐怖龙卷",["Invisible Terrible Tornado Finisher"] = "隐身 · 恐怖龙卷终结",
					["Invisible Ult"] = "隐身 · 大招",["Invisible Windstorm Fury"] = "隐身 · 风暴狂怒",
					["Jail"] = "监狱",["Jail But Smaller"] = "小监狱",
					["Jaw Breaker"] = "碎颚",["Job ID copied"] = "房间 ID 已复制",
					["Job: ..."] = "房间: ...",["Join Server"] = "加入服务器",
					["Join by Job ID"] = "用房间 ID 加入",["Joining server..."] = "正在加入服务器...",
					["Judgement Chain"] = "裁决之链",["Kazotsky Kick"] = "卡祖茨基踢",
					["Keybind Menu"] = "按键菜单",["Keybinds"] = "按键",
					["Kick"] = "踢击",["Kills"] = "击杀",
					["Last Breath"] = "最后一息",["Last Hit"] = "最后命中",
					["Launch Hide"] = "隐藏击飞",["Launch Power"] = "击飞力度",
					["Leaderboard"] = "排行榜",["Leave On"] = "离开条件",
					["Left"] = "左",["Lethal Whirlwind Stream"] = "致命旋风",
					["Lighting"] = "光照",["Lighting Preset"] = "光照预设",
					["Lighting Technology"] = "光照技术",["Limit Breaker"] = "突破极限",
					["Limited Emotes"] = "限定表情",["Load config"] = "加载配置",
					["Load theme"] = "加载主题",["Lock"] = "锁定",
					["Lock On"] = "锁定",["Lock-on"] = "锁定",
					["Lock-on Mode"] = "锁定模式",["Locked"] = "已锁定",
					["Looking"] = "准星",["Looped Animation"] = "循环动画",
					["Looped Animation Speed"] = "循环动画速度",["M1"] = "普攻",
					["M1 Animations"] = "普攻动画",["M1 Reset / No Dash Debounce"] = "普攻重置 / 无冲刺延迟",
					["Main color"] = "主色",["Manual"] = "手动",
					["Map"] = "地图",["Map Functions"] = "地图功能",
					["March"] = "正步",["Menu"] = "菜单",
					["Menu Bind"] = "菜单按键",["Message"] = "消息",
					["Metal Bat"] = "金属球棒",["Method"] = "方式",
					["Middle"] = "中间",["Misc"] = "杂项",
					["Misc Functions"] = "杂项功能",["Mobile"] = "手机端",
					["Mobile device detected. To hide on-screen keybinds, navigate to Settings and disable \"Show Keybinds\"."] = "检测到手机设备。想隐藏屏幕按键，请到「界面设置」关闭「显示按键」。",["Mode: Silent Lock"] = "模式：静默锁定",
					["Mode: Teleport to Mouse"] = "模式：传送到鼠标",["Moderation"] = "管理",
					["Mountain 1"] = "山 1",["Mountain 2"] = "山 2",
					["Mountain Edge"] = "山边",["Move Notification"] = "招式提示",
					["Move Notifications"] = "招式提示",["Movement"] = "移动",
					["Moves"] = "招式",["Multi Ice Slash"] = "多重冰斩",
					["Name Quotes"] = "名字台词",["Neck Destroyer"] = "断颈",
					["Night"] = "夜晚",["No Cutscenes"] = "跳过过场",
					["No Dash Cooldown"] = "无冲刺冷却",["No Debris"] = "无碎片",
					["No Explosions"] = "无爆炸",["No Fatigue"] = "无疲劳",
					["No Impact Frames"] = "去掉命中定格",["No Jump Bypass"] = "跳跃限制解除",
					["No Quotes"] = "无台词",["No Revenant users in this server."] = "本服务器没有其他 Revenant 用户。",
					["No Rotations Bypass"] = "转向限制解除",["No Slow"] = "无减速",
					["No Smoke"] = "无烟雾",["No Stun"] = "无硬直",
					["No Trashcan Hold"] = "去除垃圾桶抓取延迟",["No Trees"] = "无树",
					["No Wait - Prevents Tabbing"] = "不等待（防切屏）",["No Walls"] = "无墙",
					["No targets selected."] = "未选择目标。",["None"] = "无",
					["None "] = "无 ",["Normal"] = "普通",
					["Normal Obsidian"] = "经典黑曜",["Normal Punch"] = "普通拳",
					["Nothing to paste"] = "没有可粘贴的内容",["Notification Side"] = "通知位置",
					["Nuclear Fission"] = "核裂变",["Off"] = "关闭",
					["Officer Earl"] = "厄尔警官",["Old Revenant."] = "旧版 Revenant",
					["Omni-Directional Punch"] = "全向拳",["One Hand"] = "单手",
					["Only works if the target is a Revenant user."] = "仅对同样使用 Revenant 的玩家生效。",["Open"] = "开启",
					["Orbit"] = "环绕",["Orbit Distance"] = "环绕距离",
					["Orbit Speed"] = "环绕速度",["Other"] = "其他",
					["Other Characters"] = "其他角色",["Outline color"] = "描边颜色",
					["Overwrite config"] = "覆盖配置",["Overwrite theme"] = "覆盖主题",
					["Owner &amp; Solo Developer"] = "作者 &amp; 独立开发者",["Paste a Job ID first"] = "请先粘贴房间 ID",
					["Paste color"] = "粘贴颜色",["Pasted color"] = "已粘贴颜色",
					["Permafrost"] = "永冻",["Phantasm's old test version fixed + improved. | discord.gg/TYdSMmQaF9"] = "Phantasm 旧测试版 · 修复增强 | discord.gg/TYdSMmQaF9",
					["Pick a player or [All]."] = "请选择玩家或 [全体]。",["Ping Spoofer"] = "延迟伪装",
					["Ping: ..."] = "延迟: ...",["Pinpoint Cut Air Variation Finisher"] = "精准斩·空中终结",
					["Player"] = "玩家",["Players"] = "玩家",
					["Players: ..."] = "玩家: ...",["Please select a valid target first."] = "请先选择一个有效目标。",
					["Point"] = "点位",["Prediction"] = "预判",
					["Press"] = "按下",["Press F3 to quickly switch between teleport modes."] = "按 F3 可快速切换传送模式。",
					["Prey's Peril Bypass"] = "猎物之危 · 解除限制",["Privileged"] = "特权",
					["Privileged Functions"] = "特权功能",["Privileged connected with "] = "特权用户已连接: ",
					["Profile & Info"] = "资料与信息",["Profile link copied"] = "主页链接已复制",
					["Put the message here"] = "在此输入消息",["QOL Effects"] = "体验优化特效",
					["Quality Of Life"] = "体验优化",["R6"] = "R6",
					["Ragdoll Hide"] = "隐藏布娃娃",["Rage"] = "怒气",
					["Railgun"] = "轨道炮",["Rainbow Ambient"] = "彩虹环境光",
					["Random"] = "随机",["Ravaging Kick"] = "蹂躏踢",
					["Re-executing..."] = "正在重新执行...",["Recommended with custom side dash speed set to 1.4."] = "建议把侧冲速度设为 1.4。",
					["Refresh list"] = "刷新列表",["Rejoin Server"] = "重新加入服务器",
					["Remove"] = "移除",["Remove ALL Equipped"] = "移除全部已装备",
					["Remove Barrage Arms"] = "移除连打手臂",["Remove Benches"] = "移除长椅",
					["Remove Floor"] = "移除地板",["Remove Selected (Me)"] = "移除所选（自己）",
					["Removers"] = "移除器",["Reset autoload"] = "重置自动加载",
					["Reset default"] = "重置默认",["Reset to Defaults"] = "恢复默认值",
					["Restore Original"] = "恢复原始",["Revenant"] = "Revenant",
					["Revenant "] = "Revenant",["Reverse"] = "反手",
					["Right"] = "右",["Ripping Fist"] = "撕裂拳",
					["Rising"] = "升龙",["Rising Fist"] = "升龙拳",
					["Run Command"] = "执行指令",["Saitama"] = "琦玉",
					["Saitama Animations"] = "琦玉动画",["Sans Quotes"] = "Sans 台词",
					["Sassy Walk"] = "傲娇步",["Savage Tornado"] = "狂暴龙卷",
					["Save"] = "保存",["Save Position on Death"] = "死亡时保存位置",
					["Saved Favorites"] = "已收藏",["Script loaded successfully!"] = "脚本加载成功！",
					["Scripts"] = "脚本",["Search"] = "搜索",
					["Seismic Fist"] = "震地拳",["Select a target and choose Follow or Don't Follow."] = "先选择目标，再选「跟随」或「不跟随」。",
					["Select an emote to purchase (use this if the emote is not visible in the default TSB UI):"] = "选择要购买的表情（若在 TSB 默认界面里看不到该表情，就用这里）：",["Send Command In Chat"] = "在聊天中发送指令",
					["Serious Punch"] = "认真一拳",["Server"] = "服务器",
					["Server Info"] = "服务器信息",["Session"] = "会话",
					["Session: 00:00:00"] = "时长: 00:00:00",["Set as autoload"] = "设为自动加载",
					["Set as default"] = "设为默认",["Settings"] = "设置",
					["ShadowMap"] = "阴影贴图",["Shove"] = "推击",
					["Show Death Counter"] = "显示死亡反击",["Show Hidden Kills"] = "显示隐藏击杀",
					["Show Keybinds"] = "显示按键",["Shows on-screen keybind buttons. Useful for mobile."] = "在屏幕上显示按键按钮，手机端很实用。",
					["Side Dash Distance (Multiplier)"] = "侧冲距离（倍数）",["Side Dash Speed"] = "侧冲速度",
					["Silent"] = "静默",["Silent Aim"] = "静默瞄准",
					["Silent Lock"] = "静默锁定",["Simple"] = "简约",
					["Singularity"] = "奇点",["Skill Bring"] = "招式拉人",
					["Skill Bring Area"] = "招式拉人 · 范围",["Skill Bring Moves"] = "招式拉人 · 招式",
					["Skill Throw"] = "招式投掷",["Skill Throw Moves"] = "招式投掷 · 招式",
					["Slap"] = "拍击",["Snowball"] = "雪球",
					["Sonic"] = "索尼克",["Sonic Burst"] = "音速爆发",
					["Sound Volume"] = "音效音量",["Special People"] = "特殊人员",
					["Spectate"] = "观战",["Speed"] = "速度",
					["Spin"] = "旋转",["Spoofed Ping (ms)"] = "伪装延迟（毫秒）",
					["Staff"] = "管理员",["Staff Detector"] = "管理员检测",
					["Stand"] = "替身",["Stand "] = "替身",
					["Stand Method"] = "替身方式",["Stand attaches behind the target and mirrors their position."] = "替身会贴到目标身后并同步它的位置。",
					["Start"] = "起点",["Steve Walk"] = "史蒂夫步",
					["Strength"] = "力量",["Strengthness"] = "力量",
					["Suiryu"] = "水龙",["Sukuna Quotes"] = "宿傩台词",
					["Sunrising"] = "日出",["Support"] = "支持",
					["Sweep"] = "横扫",["Sword Walk"] = "持剑步",
					["T-Pose"] = "T 字姿势",["TP Mode"] = "传送模式",
					["Table Flip"] = "掀桌",["Take 40%"] = "扣除 40%",
					["Target"] = "目标",["Target Player"] = "目标玩家",
					["Target has left the game."] = "目标已离开游戏。",["Tatsumaki"] = "龙卷",
					["Tatsumaki Ult Bypass"] = "龙卷大招 · 解除限制",["Teleport 1"] = "传送点 1",
					["Teleport 2"] = "传送点 2",["Teleport Animation"] = "传送动画",
					["Teleport Back"] = "传送回来",["Teleport Back "] = "传送回来",
					["Teleport Sound"] = "传送音效",["Teleport To Area"] = "传送到区域",
					["Teleport to Mouse"] = "传送到鼠标",["Teleportation"] = "传送",
					["Teleports"] = "传送",["Thanks to"] = "鸣谢",
					["That is not a valid Job ID"] = "这不是有效的房间 ID",["The Fallen"] = "堕落",
					["The Necessary"] = "必备项目",["The Right Way"] = "正道",
					["The Strongest"] = "最强",["Theme JSON"] = "主题 JSON",
					["Theme list"] = "主题列表",["Themes"] = "主题",
					["Theres no revenant user here."] = "这里没有其他 Revenant 用户。",["Throw"] = "投掷",
					["To report issues, reach out via Discord."] = "遇到问题请通过 Discord 反馈。",["Toggle"] = "切换",
					["Toggle All Off"] = "全部关闭",["Toggle All On"] = "全部开启",
					["Toggle Menu"] = "开关菜单",["Toggled off ❌"] = "已关闭 ❌",
					["Toggled on ✅"] = "已开启 ✅",["Touch Fling"] = "触碰弹飞",
					["Trashcan"] = "垃圾桶",["Trashcan Launch"] = "垃圾桶击飞",
					["Trinity Tear"] = "三重撕裂",["Troll"] = "恶搞",
					["Twin Fangs"] = "双牙",["Type a message first."] = "请先输入一条消息。",
					["UI React"] = "自在极意",["UI Settings"] = "界面设置",
					["Ult Mirage"] = "大招幻影",["Ultra Instinct Reaction"] = "自在极意反应",
					["Unified"] = "统一",["Unknown command."] = "未知指令。",
					["Unload"] = "卸载",["Unload Script"] = "卸载脚本",
					["Unlock"] = "解锁",["Unlocked"] = "已解锁",
					["Unobtainable Skills"] = "未解锁招式",["Unviewing.."] = "正在取消观战..",
					["Unwhitelisted "] = "已移出白名单: ",["Uppercut"] = "上勾",
					["Upside Down"] = "倒立",["Usage: join <jobid>"] = "用法：join <房间ID>",
					["Use Commands in Chat"] = "在聊天中使用指令",["Useless"] = "无用",
					["User"] = "用户",["User Functions"] = "用户功能",
					["User: ..."] = "用户: ...",["UserId: ..."] = "用户 ID: ...",
					["Username / User ID"] = "用户名 / 用户 ID",["Username copied"] = "用户名已复制",
					["Utility"] = "实用",["VEX Explorer"] = "VEX 浏览器",
					["Vanishing"] = "消失",["Velocity"] = "速度",
					["Viewing"] = "正在观战",["Visible Keybinds"] = "显示按键",
					["Visual Functions"] = "视觉功能",["Visuals"] = "视觉",
					["Void"] = "虚空",["Volume"] = "音量",
					["Voxel"] = "体素",["Walk"] = "行走",
					["Walk Animation"] = "行走动画",["Walk Animation Speed"] = "行走动画速度",
					["Wall Combo"] = "贴墙连击",["Wall Combo Anywhere"] = "任意位置贴墙连",
					["Warm"] = "暖色",["Weakest Dummy"] = "最弱假人",
					["When you use a move and the target has that move on cooldown, Stand auto-uses it."] = "当你出招且目标该招式在冷却时，替身会自动替你放。",["Whitebeard"] = "白胡子",
					["Whitelist"] = "白名单",["Whitelisted "] = "已加入白名单: ",
					["Windstorm Fury Bypass"] = "风暴狂怒 · 解除限制",["Wobble Intensity"] = "摇摆强度",
					["World"] = "世界",["X Value"] = "X 值",
					["Y Value"] = "Y 值",["Yandere Walk"] = "病娇步",
					["You are already in that server"] = "你已在该服务器中",["Your character is not ready."] = "你的角色还没准备好。",
					["Z Value"] = "Z 值",["[All]"] = "[全体]",
					["[DEF] Aura"] = "[默认] 气场",["[DEF] Casual"] = "[默认] 休闲",
					["[DEF] Confident"] = "[默认] 自信",["[DEF] Divine"] = "[默认] 神圣",
					["[DEF] Fent Master"] = "[默认] 大师",["[DEF] Fly Idle"] = "[默认] 漂浮",
					["[DEF] God"] = "[默认] 神",["[DEF] I guess?"] = "[默认] 大概吧？",
					["[DEF] Preparing"] = "[默认] 蓄势",["[DEF] Rework"] = "[默认] 重制",
					["[DEF] Serious"] = "[默认] 认真",["[DEF] Stand User"] = "[默认] 替身使者",
					["[DEF] Watch"] = "[默认] 观望",["[SG] Contaminant"] = "[星辉] 污染者",
					["[SG] Crazed"] = "[星辉] 疯狂",["[SG] Equinox"] = "[星辉] 昼夜平分",
					["[SG] Euclidean"] = "[星辉] 欧几里得",["[SG] Mayhem"] = "[星辉] 混乱",
					["[SG] Persistence"] = "[星辉] 坚持",["[SG] Purity"] = "[星辉] 纯净",
					["[SG] Rainbow"] = "[星辉] 彩虹",["[SG] The Big Black"] = "[星辉] 大黑",
					["[SG] Zyledon"] = "[星辉] 泽利顿",["check your character list ;)"] = "去角色列表看看 ;)",
					["copied to clipboard!!"] = "已复制到剪贴板！！",["discord server"] = "Discord 服务器",
					["if youre a mobile user and want to use commands turn on \"use commands in chat\" and type \";(command that you wish)\" so you can use the command bar"] = "如果你用手机，想用指令请打开「在聊天中使用指令」，然后输入「;(你想用的指令)」即可。",["not elevated permissions"] = "没有更高权限",
					["paste a job id"] = "粘贴房间 ID",["rank: ..."] = "等级: ...",
					["sometimes is unstable if you get killed high, but it's rare."] = "在高处被击杀时偶尔不稳，但很少见。",["take 40% health away"] = "扣除 40% 血量",
					["times"] = "次数",["times (exact)"] = "次数（精确）",
					["version: <b>v23/09/2026</b> <font color=\"rgb(0,200,120)\">[clean]</font>"] = "版本: <b>v23/09/2026</b> <font color=\\\"rgb(0,200,120)\\\">[clean]</font>",["把界面文字切换为中文 / Switch the UI to Chinese"] = "把界面文字切换为中文 / Switch the UI to Chinese",
				}

				local PREFIX = {
					{ "User: ", "用户: " },
					{ "UserId: ", "用户 ID: " },
					{ "Executor: ", "执行器: " },
					{ "Session: ", "时长: " },
					{ "Game: ", "游戏: " },
					{ "Players: ", "玩家: " },
					{ "Job: ", "房间: " },
					{ "Ping: ", "延迟: " },
					{ "rank: ", "等级: " },
					{ "version: ", "版本: " },
				}

				local MODE = { Toggle = "切换", Hold = "按住", Press = "按下", Always = "常开" }

				local ICON = {
					check = true, eye = true, ["eye-off"] = true, user = true, users = true, shield = true,
					["shield-check"] = true, house = true, crosshair = true, map = true, ["map-pin"] = true,
					keyboard = true, settings = true, ["settings-2"] = true, sparkles = true, star = true,
					terminal = true, trash = true, film = true, shirt = true, ellipsis = true, info = true,
					crown = true, podium = true, ["hand-fist"] = true, ["person-standing"] = true, magnet = true,
					wind = true, egg = true, gavel = true, parenthesis = true, parentheses = true, plus = true,
					search = true, server = true, ["sliders-horizontal"] = true, ["layout-dashboard"] = true,
					["user-round-cog"] = true, ["folder-cog"] = true, wand = true, ["wand-sparkles"] = true,
					paintbrush = true, move = true, ["move-diagonal-2"] = true, ["chevron-up"] = true,
					["chevron-down"] = true, x = true, folder = true, bot = true, earth = true, heart = true,
					code = true, cpu = true, zap = true, flame = true, sword = true, bug = true, bell = true,
				}

				local zh = {
					Enable = false,
					Want = false,
					Orig = setmetatable({}, { __mode = "k" }),
					Last = setmetatable({}, { __mode = "k" }),
				}

				getgenv()._revI18N = zh

				pcall(function()
					if isfile and isfile("Revenant/lang.cfg") then
						local s = readfile and readfile("Revenant/lang.cfg") or ""
						zh.Want = string.find(tostring(s or ""), "zh") ~= nil
					end
				end)

				local function pickLine(s)
					local hit = MAP[s]
					if hit then
						return hit
					end

					for i = 1, #PREFIX do
						local p = PREFIX[i]
						if string.sub(s, 1, #p[1]) == p[1] then
							return p[2] .. string.sub(s, #p[1] + 1)
						end
					end

					local head, tail = string.match(s, "^(.-): (.*)$")
					if head and MAP[head] then
						return MAP[head] .. ": " .. tail
					end

					local key, name, mode = string.match(s, "^%[(.-)%] (.-) %((.-)%)$")
					if key then
						return "[" .. key .. "] " .. (MAP[name] or name) .. " (" .. (MODE[mode] or mode) .. ")"
					end

					return nil
				end

				function zh.Translate(s)
					if type(s) ~= "string" or s == "" then
						return nil
					end

					if MAP[s] then
						return MAP[s]
					end

					if string.find(s, "\n", 1, true) then
						local parts = {}

						for one in string.gmatch(s .. "\n", "(.-)\n") do
							parts[#parts + 1] = pickLine(one) or one
						end

						return table.concat(parts, "\n")
					end

					return pickLine(s)
				end

				local function isText(inst)
					local c = inst.ClassName
					return c == "TextLabel" or c == "TextButton" or c == "TextBox"
				end

				local function visit(inst)
					if not zh.Enable or not isText(inst) then
						return
					end

					local cur = inst.Text

					if cur == "" or cur == zh.Last[inst] then
						return
					end

					if ICON[cur] then
						return
					end

					local orig = zh.Orig[inst]

					if orig ~= cur then

						orig = cur
						zh.Orig[inst] = orig
					end

					local out = zh.Translate(orig)
					if out and out ~= cur then
						zh.Last[inst] = out
						inst.Text = out
					end
				end

				local scanned = setmetatable({}, { __mode = "k" })

				local function watch(inst)
					if scanned[inst] or not isText(inst) then
						return
					end

					scanned[inst] = true

					pcall(function()
						inst:GetPropertyChangedSignal("Text"):Connect(function()
							visit(inst)
						end)
					end)

					visit(inst)
				end

				local function scanAll()
					local root = v24.ScreenGui
					if not root then
						return
					end

					for _, d in ipairs(root:GetDescendants()) do
						watch(d)

						visit(d)
					end
				end

				function zh:SetEnabled(on)
					local want = on == true
					if want == self.Enable then
						return
					end

					self.Enable = want

					if want then
						scanAll()
						pcall(writefile, "Revenant/lang.cfg", "zh")
					else
						for inst, orig in pairs(self.Orig) do
							if inst.Parent then
								pcall(function()
									inst.Text = orig
								end)
							end
						end

						pcall(writefile, "Revenant/lang.cfg", "en")
					end
				end

				if v24.ScreenGui then
					pcall(function()
						v24.ScreenGui.DescendantAdded:Connect(function(d)
							watch(d)
						end)
					end)
				end

				local function trTable(arg)
					local t = table.clone(arg)

					if type(t.Title) == "string" then
						t.Title = zh.Translate(t.Title) or t.Title
					end

					local desc = t.Description or t.Content
					if type(desc) == "string" then
						local done = zh.Translate(desc) or desc
						if t.Content ~= nil then
							t.Content = done
						end
						if t.Description ~= nil then
							t.Description = done
						end
					end

					return t
				end

				local zhNotify = v24.Notify
				if type(zhNotify) == "function" then
					v24.Notify = function(a, b)
						if zh.Enable then
							if type(b) == "table" then
								return zhNotify(a, trTable(b))
							elseif type(b) == "string" then
								return zhNotify(a, zh.Translate(b) or b)
							elseif type(a) == "table" then
								return zhNotify(trTable(a), b)
							elseif type(a) == "string" then
								return zhNotify(zh.Translate(a) or a, b)
							end
						end

						return zhNotify(a, b)
					end
				end
			end

			local str8
			str8 = tostring(game.PlaceId)
			local flag10
			flag10 = true
			local tbl16
			tbl16 = { ["131048399685555"] = true, ["10449761463"] = true }

			if typeof(getrawmetatable) == "function" and typeof(setreadonly) == "function" and typeof(newcclosure) == "function" then
				local flag11 = typeof(getcallingscript) == "function"
			end

			local flag11
			flag11 = type(sethiddenproperty) == "function"
			local tbl17

			tbl17 = {
				Home = v31:AddTab("Revenant", "house", "Home"),
				LocalPlayer = v31:AddTab("User", "user", "User Functions"),
				Exploits = v31:AddTab("Combat", "crosshair", "Combat Functions"),
				Visuals = v31:AddTab("Visuals", "eye", "Visual Functions"),
			}

			tbl17.Combat = tbl17.Exploits
			tbl17.Commands = v31:AddTab("Commands", "terminal", "Command Functions")
			tbl17.Privileged = v31:AddTab("Privileged", "shield", "Privileged Functions")
			tbl17.PrivOther = tbl17.Privileged:AddRightGroupbox("Other", "star")
			tbl17.Privileged:SetVisible(false)
			tbl17.Map = v31:AddTab("Map", "map", "Map Functions")
			tbl17.Anims = v31:AddTab("Animations", "film", "Animation Functions")
			tbl17.Disguise = v31:AddTab("Disguise", "shirt", "Disguise Functions")
			tbl17.Misc = v31:AddTab("Misc", "ellipsis", "Misc Functions")
			tbl17.Settings = v31:AddTab("UI Settings", "settings", "Change themes for Revenant!")
			tbl17.ChangeLogs = tbl17.Home
			local Movement, Character
			local v32 = tbl17.LocalPlayer:AddLeftTabbox()
			Movement = v32:AddTab("Movement")
			Character = v32:AddTab("Character")
			local Keybinds
			Keybinds = tbl17.LocalPlayer:AddLeftGroupbox("Keybinds", "keyboard")
			local Automation
			Automation = tbl17.LocalPlayer:AddRightGroupbox("Automation", "bot")
			local Dashes
			Dashes = tbl17.LocalPlayer:AddRightGroupbox("Dashes", "wind")
			local v33
			v33 = tbl17.Visuals:AddLeftGroupbox("Quality Of Life", "sparkles")
			local esp
			esp = tbl17.Visuals:AddRightGroupbox("ESP", "eye")
			local World
			World = tbl17.Visuals:AddRightGroupbox("World", "earth")
			local r6
			r6 = tbl17.Anims:AddLeftGroupbox("R6", "person-standing")
			local v34
			v34 = tbl17.Anims:AddLeftGroupbox("M1 Animations", "hand-fist")
			local v35
			v35 = tbl17.Anims:AddLeftGroupbox("Saitama Animations", "egg")
			local v36
			v36 = tbl17.Anims:AddRightGroupbox("Custom Animations", "wand-sparkles")
			local Bring
			Bring = tbl17.Exploits:AddLeftGroupbox("Bring", "magnet")
			local v37
			v37 = tbl17.Exploits:AddLeftGroupbox("Anti's", "shield-check")
			local v38
			v38 = tbl17.Exploits:AddRightGroupbox("Wall Combo", "hand-fist")
			local Trashcan
			Trashcan = tbl17.Exploits:AddRightGroupbox("Trashcan", "trash")
			local v39
			v39 = tbl17.Exploits:AddRightGroupbox("Invisible Moves", "eye-off")
			local fn41, fn42

			do
				local Stand = tbl17.Exploits:AddRightGroupbox("Stand", "users")

				fn41 = function(arg)
					return (arg.DisplayName ~= "" and arg.DisplayName or arg.Name) .. "(@" .. arg.Name .. ")"
				end

				fn42 = function(arg)
					if not arg or arg == "" then
						return nil
					end
					local match = arg:match("@([^%)]+)")

					if match then
						local v40 = game:GetService("Players"):FindFirstChild(match)
						if v40 then
							return v40
						end
					end

					local v40 = pairs
					local Players = game:GetService("Players")

					for _, player in v40(Players:GetPlayers()) do
						if player.Name == arg or player.DisplayName == arg then
							return player
						end
					end

					return nil
				end

				local localPlayer3 = game:GetService("Players").LocalPlayer
				local RunService = game:GetService("RunService")
				local v40 = nil
				local flag12 = true
				local flag13 = false
				local connection5 = nil
				local connection6 = nil
				local connection7 = nil
				local connection8 = nil
				local connection9 = nil
				local connection10 = nil
				local connection11 = nil
				local v41 = nil
				local n14 = 0
				local n15 = 0
				local tbl18 = { 0, 0, 0, 0 }
				local n16 = 0
				local n17 = 0
				local connection12 = nil
				local fn43 = nil
				local cframe = CFrame.new(-2, 2, 5)
				local cframe2 = CFrame.new(0, 0, -4)
				local v42 = cframe

				local tbl19 = {
					{ "Normal Punch", 10468665991, 20, 1, "Normal Punch" },
					{ "Consecutive Punches", 10466974800, 15, 2, "Consecutive Punches" },
					{ "Shove", 10471336737, 10, 3, "Shove" },
					{ "Uppercut", 12510170988, 20, 4, "Uppercut" },
					{ "Table Flip", 11365563255, 20, 2, "Table Flip" },
					{ "Serious Punch", 12983333733, 20, 3, "Serious Punch" },
					{ "Omni Directional Punch", 13927612951, 20, 4, "Omni Directional Punch" },
					{ "Lethal Whirlwind Stream", 12296882427, 20, 2, "Lethal Whirlwind Stream" },
					{ "Flowing Water", 12272894215, 17.5, 1, "Flowing Water" },
					{ "Hunters Grasp", 12307656616, 15, 3, "Hunter's Grasp" },
					{ "Preys Peril", 12351854556, 17, 4, "Prey's Peril" },
					{ "Water Stream Cutting Fist", 12460977270, 8.45, 1, "Water Stream Cutting Fist" },
					{ "The Final Hunt", 12463072679, 101, 2, "The Final Hunt" },
					{ "Rock Splitting Fist", 14057231976, 14, 3, "Rock Splitting Fist" },
					{ "Crushed Rock", 13630786846, 9.58, 4, "Crushed Rock" },
					{ "Machine Gun Blows", 12534735382, 15, 1, "Machine Gun Blows" },
					{ "Ignition Burst", 12502664044, 17.5, 2, "Ignition Burst" },
					{ "Blitz Shot", 12618271998, 25, 3, "Blitz Shot" },
					{ "Jet Dive", 12684390285, 17.5, 4, "Jet Dive" },
					{ "Thunder Kick", 14721837245, 15, 1, "Thunder Kick" },
					{ "Speedblitz Dropkick", 12832505612, 20, 2, "Speedblitz Dropkick" },
					{ "Flamewave Cannon", 13083332742, 25, 3, "Flamewave Cannon" },
					{ "Incinerate", 13146710762, 101, 4, "Incinerate" },
					{ "Flash Strike", 13309500827, 17.5, 1, "Flash Strike" },
					{ "Whirlwind Kick", 13294790250, 20, 2, "Whirlwind Kick" },
					{ "Scatter", 13362587853, 21.25, 3, "Scatter" },
					{ "Explosive Shuriken", 13501296372, 17.5, 4, "Explosive Shuriken" },
					{ "Twinblade Rush", 13632347366, 20, 1, "Twinblade Rush" },
					{ "Straight On", 13643152947, 17, 2, "Straight On" },
					{ "Carnage", 13723174078, 25, 3, "Carnage" },
					{ "Fourfold Flashstrike", 13881335713, 25, 4, "Fourfold Flashstrike" },
					{ "Homerun", 14004235777, 17.5, 1, "Homerun" },
					{ "Grand Slam", 14299135500, 20, 3, "Grand Slam" },
					{ "Foul Ball", 14351441234, 23, 4, "Foul Ball" },
					{ "Savage Tornado", 14719290328, 17, 1, "Savage Tornado" },
					{ "Brutal Beatdown", 14701242661, 30, 2, "Brutal Beatdown" },
					{ "Strength Difference", 14900168720, 20, 3, "Strength Difference" },
					{ "Death Blow", 15128849047, 101, 4, "Death Blow" },
					{ "Quick Slice", 15290930205, 20, 1, "Quick Slice" },
					{ "Atmos Cleave", 15145462680, 22, 2, "Atmos Cleave" },
					{ "Pinpoint Cut", 15295895753, 17, 3, "Pinpoint Cut" },
					{ "Pinpoint Cut", 15295336270, 17, 3, "Pinpoint Cut" },
					{ "Split Second Counter", 15311685628, 17.5, 4, "Split Second Counter" },
					{ "Sunset", 15520132233, 15, 1, "Sunset" },
					{ "Solar Cleave", 15676072469, 15, 2, "Solar Cleave" },
					{ "Sunrise", 16062410809, 20, 3, "Sunrise" },
					{ "Atomic Slash", 16082123712, 101, 4, "Atomic Slash" },
					{ "Crushing Pull", 16139108718, 21, 1, "Crushing Pull" },
					{ "Windstorm Fury", 16515850153, 20, 2, "Windstorm Fury" },
					{ "Stone Coffin", 16431491215, 25, 3, "Stone Coffin" },
					{ "Expulsive Push", 16597322398, 19, 4, "Expulsive Push" },
					{ "Cosmic Strike", 16737255386, 30, 1, "Cosmic Strike" },
					{ "Psychic Ricochet", 17464644182, 15, 2, "Psychic Ricochet" },
					{ "Terrible Tornado", 17275150809, 101, 3, "Terrible Tornado" },
					{ "Sky Snatcher", 17860467628, 17, 4, "Sky Snatcher" },
					{ "Bullet Barrage", 17799224866, 20, 1, "Bullet Barrage" },
					{ "Vanishing Kick", 17838006839, 23, 2, "Vanishing Kick" },
					{ "Whirlwind Drop", 17857788598, 15, 3, "Whirlwind Drop" },
					{ "Head First", 18179181663, 20, 4, "Head First" },
					{ "Grand Fissure", 129651400898906, 18, 1, "Grand Fissure" },
					{ "Twin Fangs", 18896229321, 15, 2, "Twin Fangs" },
					{ "Earth Splitting Strike", 18897119503, 30, 3, "Earth Splitting Strike" },
					{ "Last Breath", 106755459092436, 101, 4, "Last Breath" },
					{ "Ravage", 16945573694, 17.5, 1, "Ravage" },
					{ "Swift Sweep", 16944265635, 15, 2, "Swift Sweep" },
					{ "Collateral Ruin", 17325254223, 22.5, 3, "Collateral Ruin" },
					{ "Spiraling Storm", 78521642007560, 22.5, 4, "Spiraling Storm" },
					{ "Stoic Bomb", 17141153099, 15, 1, "Stoic Bomb" },
					{ "202020 Dropkick", 17354976067, 101, 2, "20-20-20 Dropkick" },
					{ "Five Seasons", 18462892217, 100, 3, "Five Seasons" },
					{ "Unlimited Flex Works", 77727115892579, 0, 4, "Unlimited Flex Works" },
					{ "Permafrost", 100558589307006, 20, 1, "Permafrost" },
					{ "Frost Forge", 137561511768861, 15, 2, "Frost Forge" },
					{ "Freezing Path", 112620365240235, 25, 3, "Freezing Path" },
					{ "Judgement Chain", 75547590335774, 20, 4, "Judgement Chain" },
					{ "Weboom", 113166426814229, 20, 1, "Weboom" },
					{ "Trinity Tear", 77509627104305, 25, 2, "Trinity Tear" },
					{ "Plasma Cannon", 116753755471636, 20, 3, "Plasma Cannon" },
					{ "Double Trouble", 138443750790136, 20, 4, "Double Trouble" },
					{ "Doom Dive", 101588604872680, 23, 1, "Doom Dive" },
					{ "Crowd Buster", 105442749844047, 22, 2, "Crowd Buster" },
					{ "Hammer Heel", 109617620932970, 18, 3, "Hammer Heel" },
					{ "Binding Cloth", 125955606488863, 20, 4, "Binding Cloth" },
					{ "Hammer Heel", 135289891173395, 18, 3, "Hammer Heel" },
					{ "Machine Gun Blows", 12971270638, 15, 1, "Machine Gun Blows" },
					{ "Crushed Rock", 72451715583225, 9.58, 4, "Crushed Rock" },
					{ "Block", 13380778193, 0, 0, "Block" },
					{ "Block", 13370310513, 0, 0, "Block" },
					{ "Block", 13935548552, 0, 0, "Block" },
				}

				local function fn44()
					local character = localPlayer3.Character
					if not character then
						return
					end

					for _, descendant in pairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.CanCollide = false
						end
					end
				end

				local tbl20 = {}

				local function fn45()
					if not v40 or not v40.Character then
						return
					end

					if not localPlayer3.Character then
						return
					end
					local humanoidRootPart2 = localPlayer3.Character:FindFirstChild("HumanoidRootPart")
					local humanoidRootPart3 = v40.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart2 or not humanoidRootPart3 then
						return
					end
					tbl20 = {}

					for _, descendant in pairs(localPlayer3.Character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							tbl20[descendant] = { CanCollide = descendant.CanCollide, Massless = descendant.Massless }
							descendant.CanCollide = false
							descendant.Massless = true
						end
					end

					local humanoid = localPlayer3.Character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid.AutoRotate = false
						end)

						humanoid.PlatformStand = true
					end

					humanoidRootPart2.CFrame = humanoidRootPart3.CFrame * v42
					humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero

					if sethiddenproperty then
						pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", humanoidRootPart3)
					end
				end

				local function fn46(arg)
					v42 = arg
				end

				local tbl21 = {}

				local function fn47()
					for _, v43 in pairs(tbl21) do
						pcall(function()
							v43:Disconnect()
						end)
					end

					tbl21 = {}
				end

				local tbl22 = {
					{
						id = "16136144568",
						name = "Idle 1",
						tpos = 0.69,
						free = true,
						oscillate = true,
						tposMin = 0.45,
						tposMax = 0.7,
						speed = 0.1,
					},
					{ id = "17861840167", name = "Idle 2", tpos = 1, free = false, oscillate = false },
					{ id = "16524522673", name = "Idle 3", tpos = 0.71, free = false, oscillate = false },
					{ id = "15099756132", name = "Idle 4", tpos = 0, free = true, oscillate = false },
					{
						id = "94105258532295",
						name = "Stand User",
						tpos = 6.5,
						free = true,
						oscillate = false,
						loopStart = 6.5,
						loopEnd = 13,
					},
				}

				local function fn48()
					if not flag13 or not flag12 then
						return
					end
					local now2 = tick()
					if v41 and v41.IsPlaying and now2 - n15 < 0.1 then
						return
					end
					n15 = now2
					local character = localPlayer3.Character
					local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
					humanoid = humanoid and humanoid:FindFirstChildWhichIsA("Animator")
					if not humanoid then
						return
					end
					local v43 = nil
					local str9 = options.StandIdleAnimDropdown and options.StandIdleAnimDropdown.Value or "Random"

					if str9 ~= "Random" then
						for _, v44 in ipairs(tbl22) do
							if v44.name == str9 then
								v43 = v44
								break
							end
						end
					end

					if not v43 then
						local n18

						repeat
							n18 = math.random(1, #tbl22)
						until n18 ~= n14

						n14 = n18
						v43 = tbl22[n18]
					end

					if connection11 then
						connection11:Disconnect()
						connection11 = nil
					end

					if v41 then
						pcall(v41.Stop, v41, 0)
						v41 = nil
					end

					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://" .. v43.id
					local v44 = humanoid:LoadAnimation(animation)
					v44.Priority = Enum.AnimationPriority.Action4
					v44.Looped = true
					v41 = v44

					if v43.free then
						v44:Play()
						v44:AdjustWeight(1)

						if v43.oscillate then
							v44.TimePosition = v43.tpos
							v44:AdjustSpeed(-(v43.speed or 0.1))
						elseif v43.tpos then
							v44.TimePosition = v43.tpos
						end

						connection11 = RunService.RenderStepped:Connect(function()
							if not flag13 then
								if connection11 then
									connection11:Disconnect()
									connection11 = nil
								end

								pcall(v44.Stop, v44, 0)
								v41 = nil
								return
							end

							if n17 > 0 then
								if v44.IsPlaying then
									pcall(v44.Stop, v44, 0)
								end

								return
							end

							if not v44.IsPlaying then
								return
							end
							v44:AdjustWeight(1)

							if v43.freezeAt and v44.TimePosition >= v43.freezeAt then
								v44:AdjustSpeed(0)
								v44.TimePosition = v43.freezeAt
							elseif v43.oscillate then
								local speed = v43.speed or 0.1

								if v43.tposMax <= v44.TimePosition then
									v44:AdjustSpeed(-speed)
								elseif v44.TimePosition <= v43.tposMin then
									v44:AdjustSpeed(speed)
								end
							elseif v43.loopEnd and v44.TimePosition >= v43.loopEnd then
								v44.TimePosition = v43.loopStart or 0
							end
						end)
					else
						v44:Play()
						v44:AdjustSpeed(0)
						v44:AdjustWeight(1)
						v44.TimePosition = v43.tpos

						connection11 = RunService.RenderStepped:Connect(function()
							if not flag13 then
								if connection11 then
									connection11:Disconnect()
									connection11 = nil
								end

								pcall(v44.Stop, v44, 0)
								v41 = nil
								return
							end

							if n17 > 0 then
								if v44.IsPlaying then
									pcall(v44.Stop, v44, 0)
								end

								return
							end

							if not v44.IsPlaying then
								return
							end
							v44:AdjustSpeed(0)
							v44:AdjustWeight(1)
							v44.TimePosition = v43.tpos
						end)
					end
				end

				local function fn49()
					n17 = 0
					n15 = 0

					if connection11 then
						connection11:Disconnect()
						connection11 = nil
					end

					if v41 then
						pcall(v41.Stop, v41, 0)
						v41 = nil
					end

					if connection5 then
						connection5:Disconnect()
						connection5 = nil
					end

					if connection12 then
						connection12:Disconnect()
						connection12 = nil
					end

					if connection6 then
						connection6:Disconnect()
						connection6 = nil
					end

					if connection7 then
						connection7:Disconnect()
						connection7 = nil
					end

					if connection8 then
						connection8:Disconnect()
						connection8 = nil
					end

					if connection10 then
						connection10:Disconnect()
						connection10 = nil
					end

					fn47()

					pcall(function()
						if localPlayer3.Character then
							local humanoid = localPlayer3.Character:FindFirstChildWhichIsA("Humanoid")

							if humanoid then
								humanoid.PlatformStand = false

								pcall(function()
									humanoid.AutoRotate = true
								end)
							end

							local humanoidRootPart2 = localPlayer3.Character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart2 then
								humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
								humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
								humanoidRootPart2.Velocity = Vector3.zero
								humanoidRootPart2.RotVelocity = Vector3.zero

								if sethiddenproperty then
									pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", humanoidRootPart2)
								end
							end

							for k, v43 in pairs(tbl20) do
								if k and k.Parent then
									k.CanCollide = v43.CanCollide
									k.Massless = v43.Massless
								end
							end

							tbl20 = {}
						end
					end)

					tbl18 = { 0, 0, 0, 0 }
				end

				local function fn50()
					flag12 = not flag12

					if flag12 then
						fn43()
					else
						if connection5 then
							connection5:Disconnect()
							connection5 = nil
						end

						if connection12 then
							connection12:Disconnect()
							connection12 = nil
						end

						pcall(function()
							local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

							if humanoid then
								humanoid.PlatformStand = false
							end
						end)
					end

					pcall(function()
						options.StandMethodDropdown:SetValue(flag12 and "Follow" or "Don't Follow")
					end)
				end

				local function fn51(arg)
					local character = arg.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildWhichIsA("Humanoid")
					if not humanoid then
						return
					end

					if connection6 then
						connection6:Disconnect()
						connection6 = nil
					end

					connection6 = humanoid.AnimationPlayed:Connect(function(arg2)
						local animationId = arg2.Animation and arg2.Animation.AnimationId or ""

						if animationId:match("10470389827") or animationId:match("13380778193") or animationId:match("13370310513") or animationId:match("13935548552") then
							n16 += 1

							if n16 >= 3 then
								n16 = 0
								fn50()
							end

							task.delay(1, function()
								if n16 > 0 then
									n16 -= 1
								end
							end)

							return
						end

						for _, v43 in pairs(tbl19) do
							if animationId ~= "rbxassetid://" .. tostring(v43[2]) then
								continue
							else
								local v44 = v43[4]

								if v44 ~= 0 then
									tbl18[v44] = v43[3]

									task.spawn(function()
										task.wait(v43[3])
										tbl18[v44] = 0
									end)

									continue
								end
							end

							break
						end
					end)

					fn47()

					for _, v43 in pairs(tbl19) do
						local str9 = "Holding" .. string.gsub(v43[1], " ", "")

						pcall(function()
							character:SetAttribute(str9, false)
						end)

						local connection13 = character:GetAttributeChangedSignal(str9):Connect(function()
							if character:GetAttribute(str9) == true and tbl18[v43[4]] ~= 0 then
								for _, v44 in pairs(tbl19) do
									if v44[4] == v43[4] and localPlayer3.Backpack:FindFirstChild(v44[5]) then
										pcall(function()
											localPlayer3.Character.Communicate:FireServer(unpack({ { Tool = localPlayer3.Backpack:WaitForChild(v44[5]), Goal = "Console Move" } }))
										end)
									end
								end
							end
						end)

						table.insert(tbl21, connection13)
					end
				end

				local function fn52()
					if connection8 then
						connection8:Disconnect()
						connection8 = nil
					end

					local character = localPlayer3.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildWhichIsA("Humanoid")
					local animator = humanoid and humanoid:FindFirstChildWhichIsA("Animator")
					if not humanoid then
						return
					end

					local function fn53(arg)
						local str9 = (arg.Animation and arg.Animation.AnimationId or ""):gsub("%s+", "")

						for _, v43 in pairs(tbl19) do
							if str9 == "rbxassetid://" .. tostring(v43[2]) then
								if v43[4] ~= 0 then
									fn46(cframe2)

									task.spawn(function()
										if connection12 then
											connection12:Disconnect()
											connection12 = nil
										end

										local humanoidRootPart2 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")
										local cFrame = not flag12 and humanoidRootPart2 and humanoidRootPart2.CFrame
										n17 += 1

										pcall(function()
											local humanoid2 = localPlayer3.Character and localPlayer3.Character:FindFirstChildWhichIsA("Humanoid")

											if humanoid2 then
												humanoid2.PlatformStand = false
											end
										end)

										connection12 = RunService.Heartbeat:Connect(function()
											local humanoidRootPart3 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")
											local humanoidRootPart4 = v40 and v40.Character and v40.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart3 and humanoidRootPart4 then
												humanoidRootPart3.CFrame = humanoidRootPart4.CFrame * cframe2
												humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
												humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero

												if sethiddenproperty then
													pcall(sethiddenproperty, humanoidRootPart3, "PhysicsRepRootPart", humanoidRootPart4)
												end
											end
										end)

										arg.Stopped:Wait()

										if connection12 then
											connection12:Disconnect()
											connection12 = nil
										end

										n17 = math.max(0, n17 - 1)
										if n17 > 0 then
											return
										end
										fn46(cframe)

										if flag12 then
											n15 = 0
										else
											local humanoidRootPart3 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart3 and cFrame then
												humanoidRootPart3.CFrame = cFrame
												humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
												humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero
											end
										end
									end)
								end

								break
							end
						end
					end

					connection8 = humanoid.AnimationPlayed:Connect(fn53)

					if animator then
						local connection13 = animator.AnimationPlayed:Connect(fn53)
						local v43 = connection8

						connection8 = { Disconnect = function()
							pcall(function()
								v43:Disconnect()
							end)

							pcall(function()
								connection13:Disconnect()
							end)
						end }
					end
				end

				fn43 = function()
					if connection5 then
						connection5:Disconnect()
						connection5 = nil
					end

					connection5 = RunService.Heartbeat:Connect(function()
						if not flag13 or n17 > 0 then
							return
						end

						if not v40 or not v40.Character then
							return
						end

						if not localPlayer3.Character then
							return
						end
						local humanoidRootPart2 = localPlayer3.Character:FindFirstChild("HumanoidRootPart")
						local humanoidRootPart3 = v40.Character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart2 or not humanoidRootPart3 then
							return
						end
						local humanoid = localPlayer3.Character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							if humanoid.AutoRotate then
								humanoid.AutoRotate = false
							end

							if flag12 then
								humanoid.PlatformStand = true
							end
						end

						if flag12 then
							fn44()
							humanoidRootPart2.CFrame = humanoidRootPart3.CFrame * v42
							humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
							humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero

							if sethiddenproperty then
								pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", humanoidRootPart3)
							end

							local flag14

							if not v41 then
								flag14 = true
							else
								flag14 = not v41.IsPlaying
							end

							if flag14 then
								local now2 = tick()

								if now2 - n15 >= 1 then
									n15 = now2
									task.defer(fn48)
								end
							end
						end
					end)
				end

				local fn53 = nil

				fn53 = function(arg)
					fn49()
					flag13 = true
					v40 = arg
					v42 = cframe

					if not arg.Character then
						connection7 = arg.CharacterAdded:Connect(function(character)
							local humanoid = character:WaitForChild("Humanoid", 10)
							if not humanoid then
								return
							end
							humanoid:WaitForChild("Animator", 10)
							fn53(arg)
						end)

						return
					end

					fn45()
					fn51(arg)
					fn52()
					fn43()
					task.defer(fn48)

					connection7 = arg.CharacterAdded:Connect(function(character)
						local humanoid = character:WaitForChild("Humanoid", 10)
						if not humanoid then
							return
						end
						humanoid:WaitForChild("Animator", 10)

						if flag13 then
							fn53(arg)
						end
					end)

					if connection10 then
						connection10:Disconnect()
					end

					connection10 = game:GetService("Players").PlayerRemoving:Connect(function(player)
						if player == arg then
							_standDeactivate()

							pcall(function()
								options.StandMethodDropdown:SetValue("Off")
							end)

							v24:Notify({ Title = fn39("Stand"), Content = "Target has left the game.", Time = 3 })
						end
					end)

					if connection9 then
						connection9:Disconnect()
					end

					connection9 = localPlayer3.CharacterAdded:Connect(function(character)
						local humanoid = character:WaitForChild("Humanoid", 10)
						if not humanoid then
							return
						end
						humanoid:WaitForChild("Animator", 10)
						if not flag13 then
							return
						end

						if connection11 then
							connection11:Disconnect()
							connection11 = nil
						end

						if v41 then
							pcall(v41.Stop, v41, 0)
							v41 = nil
						end

						n15 = 0
						fn45()
						fn52()

						if flag12 then
							task.defer(fn48)
						end
					end)
				end

				local function fn54()
					flag13 = false
					fn49()

					if connection9 then
						connection9:Disconnect()
						connection9 = nil
					end
				end

				local function fn55()
					local localPlayer4 = game:GetService("Players").LocalPlayer
					local tbl23 = {}
					local v43 = pairs
					local Players = game:GetService("Players")

					for _, player in v43(Players:GetPlayers()) do
						if player ~= localPlayer4 then
							table.insert(tbl23, fn41(player))
						end
					end

					return tbl23
				end

				local str9 = ""

				local StandTargetDropdown = Stand:AddDropdown("StandTargetDropdown", {
					Text = "Target Player",
					Values = fn55(),
					Default = "",
					Searchable = true,
					AllowNull = true,
					Callback = function(arg)
						if arg ~= "" and arg == str9 then
							pcall(function()
								options.StandTargetDropdown:SetValue("")
							end)

							str9 = ""
							fn54()
							v40 = nil
							return
						end

						str9 = arg
						local v43 = flag13
						fn54()
						local v44 = fn42(arg)

						if v44 then
							v40 = v44

							if v43 then
								fn53(v44)
							end
						end
					end,
				})

				game:GetService("Players").PlayerAdded:Connect(function()
					pcall(function()
						StandTargetDropdown:SetValues(fn55())
					end)
				end)

				game:GetService("Players").PlayerRemoving:Connect(function()
					pcall(function()
						StandTargetDropdown:SetValues(fn55())
					end)
				end)

				Stand:AddDropdown("StandMethodDropdown", {
					Text = "Stand Method",
					Values = { "Off", "Follow", "Don't Follow" },
					Default = "Off",
					Callback = function(arg)
						if arg == "Off" then
							flag13 = false
							flag12 = true
							fn54()
						elseif arg == "Follow" then
							flag12 = true
							local v43 = fn42(tostring(options.StandTargetDropdown and options.StandTargetDropdown.Value or ""))

							if v43 then
								fn53(v43)
							else
								v24:Notify({ Title = fn39("Stand"), Content = "Please select a valid target first.", Time = 3 })

								pcall(function()
									options.StandMethodDropdown:SetValue("Off")
								end)
							end
						elseif arg == "Don't Follow" then
							flag12 = false
							local v43 = fn42(tostring(options.StandTargetDropdown and options.StandTargetDropdown.Value or ""))

							if v43 then
								fn53(v43)

								if connection5 then
									connection5:Disconnect()
									connection5 = nil
								end

								pcall(function()
									local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildWhichIsA("Humanoid")

									if humanoid then
										humanoid.PlatformStand = false
									end
								end)
							else
								v24:Notify({ Title = fn39("Stand"), Content = "Please select a valid target first.", Time = 3 })

								pcall(function()
									options.StandMethodDropdown:SetValue("Off")
								end)
							end
						end
					end,
				})

				local tbl23 = { "Random" }

				for _, v43 in ipairs(tbl22) do
					tbl23[#tbl23 + 1] = v43.name
				end

				Stand:AddDivider({ Text = "Idle" })

				Stand:AddDropdown("StandIdleAnimDropdown", {
					Text = "Idle Animation",
					Values = tbl23,
					Default = "Random",
					Callback = function()
						if flag13 and flag12 then
							if connection11 then
								connection11:Disconnect()
								connection11 = nil
							end

							if v41 then
								pcall(v41.Stop, v41, 0)
								v41 = nil
							end

							n15 = 0
							task.defer(fn48)
						end
					end,
				})

				Stand:AddDivider({ Text = "How to use" })
				Stand:AddLabel("How to use Stand:", true)
				Stand:AddLabel("Select a target and choose Follow or Don't Follow.", true)
				Stand:AddLabel("Stand attaches behind the target and mirrors their position.", true)
				Stand:AddLabel("3 blocks in a row from the target toggles the mode.", true)
				Stand:AddLabel("When you use a move and the target has that move on cooldown, Stand auto-uses it.", true)
				Stand:AddLabel("In Don't Follow mode, you stay in place. Stand only acts during your moves.", true)
				local fn56 = nil

				fn56 = function()
					getgenv()._standActivateFn = function(arg)
						fn53(arg)
						fn56()
					end

					getgenv()._standDeactivateFn = function()
						fn54()
						fn56()
					end
				end

				fn56()
			end

			v39:AddButton({
				Text = "Toggle All On",
				Callback = function()
					for k, toggle in pairs(toggles) do
						if k:find("^InvisibleMoves_") and toggle.Type == "Toggle" then
							toggle:SetValue(true)
						end
					end

					for k, option in pairs(options) do
						if k:find("^InvisibleMoves_") and option.Type == "Dropdown" then
							local tbl18 = {}

							for _, value in pairs(option.Values) do
								tbl18[value] = true
							end

							option:SetValue(tbl18)
						end
					end
				end,
			}):AddButton({
				Text = "Toggle All Off",
				Callback = function()
					for k, toggle in pairs(toggles) do
						if k:find("^InvisibleMoves_") and toggle.Type == "Toggle" then
							toggle:SetValue(false)
						end
					end

					for k, option in pairs(options) do
						if k:find("^InvisibleMoves_") and option.Type == "Dropdown" then
							option:SetValue({})
						end
					end
				end,
			})

			v39:AddDivider({ Text = "Blocking" })
			v39:AddToggle("InvisibleMoves_Block", { Text = "Invisible Block", Default = false })
			v39:AddToggle("InvisibleMoves_BlockColor", { Text = "Block Color", Default = false }):AddColorPicker("InvisibleMoves_BlockColor1", { Default = Color3.fromRGB(0, 255, 255), Title = "Start" }):AddColorPicker("InvisibleMoves_BlockColor2", { Default = Color3.fromRGB(0, 0, 255), Title = "Middle", Transparency = 0 }):AddColorPicker("InvisibleMoves_BlockColor3", { Default = Color3.fromRGB(255, 0, 0), Title = "End", Transparency = 0 })
			v39:AddToggle("InvisibleMoves_Counter", { Text = "Invisible Counter", Default = false })
			v39:AddToggle("InvisibleMoves_CounterHit", { Text = "Invisible Counter Hit", Default = false })
			v39:AddDivider({ Text = "Characters" })

			v39:AddDropdown("InvisibleMoves_Saitama", {
				Text = "Invisible Saitama",
				Values = {
					"Invisible Ult",
					"Invisible Table Flip",
					"Invisible Serious Punch",
					"Invisible Omni-Directional Punch",
				},
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			v39:AddDropdown("InvisibleMoves_Garou", {
				Text = "Invisible Garou",
				Values = { "Invisible Ult" },
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			v39:AddDropdown("InvisibleMoves_Sonic", {
				Text = "Invisible Speed-o'-Sonic",
				Values = { "Invisible Ult" },
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			v39:AddDropdown("InvisibleMoves_Genos", {
				Text = "Invisible Genos",
				Values = { "Invisible Ult", "Invisible Incinerate" },
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			v39:AddDropdown("InvisibleMoves_Tatsumaki", {
				Text = "Invisible Tatsumaki",
				Values = {
					"Invisible Crushing Pull",
					"Invisible Windstorm Fury",
					"Invisible Stone Grave",
					"Invisible Expulsive Push",
					"Invisible Ult",
					"Invisible Terrible Tornado",
					"Invisible Terrible Tornado Finisher",
				},
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			v39:AddDropdown("InvisibleMoves_AtomicSamurai", {
				Text = "Invisible Atomic Samurai",
				Values = {
					"Invisible Atmos Cleave",
					"Invisible Ult",
					"Invisible Sunset",
					"Invisible Solar Cleave",
					"Invisible Sunrise",
					"Invisible Sunrise Finisher",
					"Invisible Atomic Slash",
					"Invisible Atomic Slash Finisher",
				},
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			v39:AddDropdown("InvisibleMoves_Suiryu", {
				Text = "Invisible Suiryu",
				Values = { "Bullet Barrage" },
				Multi = true,
				Default = {},
				Searchable = true,
				AllowNull = true,
			})

			local tbl18

			tbl18 = {
				L_KEY = { Id = "121572214", Speed = 1, StartTime = 0.5, Track = nil, IsActive = false },
				F2_KEY = { Id = "179224234", Speed = 1, StartTime = 0, Track = nil, IsActive = false },
				TPOSE_A = { Id = "15503004900", Speed = 0, StartTime = 1.6, Track = nil, IsActive = false },
				JERK = { Id = "72042024", Speed = 1, StartTime = 0, Track = nil, IsActive = false },
				BANG = {
					Id = "148840371",
					Speed = 1,
					StartTime = 0,
					Track = nil,
					IsActive = false,
					Priority = Enum.AnimationPriority.Action4,
				},
				WAVE = { Id = "128777973", Speed = 1, StartTime = 0, Track = nil },
				POINT = { Id = "128853357", Speed = 1, StartTime = 0, Track = nil },
				HAPPY = { Id = "129423030", Speed = 1, StartTime = 0, Track = nil },
				LAUGH = { Id = "129423131", Speed = 1, StartTime = 0, Track = nil },
				MUSTACHE = {
					Id = "65067813",
					Speed = 0,
					StartTime = 0.2,
					Track = nil,
					IsActive = false,
					Priority = Enum.AnimationPriority.Action4,
				},
			}

			local tbl19

			tbl19 = {
				["121572214"] = 1e13,
				["72042024"] = 1e13,
				["179224234"] = -1e9,
				["15503004900"] = 10000000,
				["180435571"] = 100000,
				["148840371"] = -1e9,
				["65067813"] = -1e9,
				["128777973"] = -1e9,
				["128853357"] = -1e9,
				["129423030"] = -1e9,
				["129423131"] = -1e9,
			}

			local n14
			n14 = 0.1
			local Players
			Players = game:GetService("Players")
			local RunService
			RunService = game:GetService("RunService")

			do
				local repDual = getgenv()._repDual

				if repDual and repDual.relConn then
					pcall(function()
						repDual.relConn:Disconnect()
						repDual.backConn:Disconnect()
					end)
				end

				local repDual2

				repDual2 = {
					me = nil,
					target = nil,
					follow = function(me, target)
						local v40 = repDual2
						repDual2.me = me
						v40.target = target
					end,
					release = function()
						local v40 = repDual2
						repDual2.me = nil
						v40.target = nil
					end,
				}

				local obj2 = setmetatable({}, { __mode = "k" })
				local obj3 = setmetatable({}, { __mode = "k" })
				repDual2.shp = repDual and repDual.shp or sethiddenproperty
				local instanceHandle = getrenv and getrenv().InstanceHandle
				local flag12 = instanceHandle ~= nil

				if repDual2.shp then
					local shp = repDual2.shp

					pcall(function()
						sethiddenproperty = function(arg, arg2, arg3, ...)
							if arg2 == "PhysicsRepRootPart" then
								obj2[arg] = arg3
								obj3[arg] = os.clock()
								if flag12 then
									return shp(arg, "PhysicsRepRootRef", instanceHandle.new(arg3))
								end
							end

							return shp(arg, arg2, arg3, ...)
						end
					end)
				end

				getgenv()._repDual = repDual2

				RunService.Stepped:Connect(function()
					local me = repDual2.me
					local target = repDual2.target

					if me and me.Parent and target and target.Parent and sethiddenproperty then
						pcall(sethiddenproperty, me, "PhysicsRepRootPart", target)
					end
				end)

				local function fn43()
					if flag12 or repDual2.worldCF then
						return
					end
					local character = Players.LocalPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if not character then
						return
					end
					local result = nil

					if gethiddenproperty then
						local ok
						ok, result = pcall(gethiddenproperty, character, "PhysicsRepRootPart")
						ok = ok and typeof(result) == "Instance"
						local v40 = nil

						if not ok then
							result = v40
						end
					end

					local flag13 = result == nil

					if flag13 then
						flag13 = os.clock() - (obj3[character] or 0) < 0.25
					end

					if flag13 then
						result = obj2[character]
					end

					if not (typeof(result) == "Instance" and result ~= character and result:IsA("BasePart")) then
						return
					end
					local cFrame = character.CFrame
					if not (cFrame.Position.Magnitude < 10000000) then
						return
					end
					local v40 = repDual2
					repDual2.worldCF = cFrame
					v40.relRoot = character
					character.CFrame = result.CFrame:ToObjectSpace(cFrame)
				end

				local function fn44()
					local worldCF = repDual2.worldCF
					local relRoot = repDual2.relRoot
					if not worldCF then
						return
					end
					repDual2.worldCF = nil

					if relRoot.Parent then
						relRoot.CFrame = worldCF
					end
				end

				if repDual2.shp then
					repDual2.relConn = RunService.Heartbeat:Connect(function()
						task.defer(fn43)
					end)

					repDual2.backConn = RunService.Stepped:Connect(fn44)

					pcall(function()
						RunService:UnbindFromRenderStep("RevRepRel")
					end)

					RunService:BindToRenderStep("RevRepRel", Enum.RenderPriority.First.Value, fn44)
				end
			end

			local UserInputService
			UserInputService = game:GetService("UserInputService")
			local localPlayer3
			localPlayer3 = Players.LocalPlayer

			do
				local function fn43()
					local tbl20 = {
						"sethiddenproperty",
						"setreadonly",
						"getrawmetatable",
						"newcclosure",
						"hookfunction",
						"gethui",
						"cloneref",
						"setclipboard",
						"writefile",
						"readfile",
						"isfile",
						"isfolder",
						"makefolder",
					}

					local tbl21 = {
						"replicatesignal",
						"getupvalues",
						"getgc",
						"getrenv",
						"getcallingscript",
						"keypress",
						"keyrelease",
						"identifyexecutor",
					}

					local tbl22 = { "protectgui" }

					local function fn44(arg)
						local value = rawget(getfenv(), arg)

						if value == nil then
							local ok

							ok, value = pcall(function()
								return getgenv and getgenv()[arg]
							end)

							value = ok and value or nil
						end

						return type(value) == "function"
					end

					local tbl23 = { critical = {}, core = {}, extra = {} }

					for _, v40 in ipairs({ "getgenv", "loadstring" }) do
						if not fn44(v40) then
							table.insert(tbl23.critical, v40)
						end
					end

					for _, v40 in ipairs(tbl20) do
						if not fn44(v40) then
							table.insert(tbl23.core, v40)
						end
					end

					for _, v40 in ipairs(tbl21) do
						if not fn44(v40) then
							table.insert(tbl23.extra, v40)
						end
					end

					tbl23.optional = {}

					for _, v40 in ipairs(tbl22) do
						if not fn44(v40) then
							table.insert(tbl23.optional, v40)
						end
					end

					if not (fn44("request") or fn44("http_request") or syn and type(syn.request) == "function") then
						table.insert(tbl23.core, "request")
					end

					if type(debug) ~= "table" or type(debug.setupvalue) ~= "function" then
						table.insert(tbl23.core, "debug.setupvalue")
					end

					if fn44("gethui") then
						local ok, result = pcall(gethui)

						if not ok or typeof(result) ~= "Instance" then
							table.insert(tbl23.core, "gethui")
						end
					end

					if fn44("getgenv") then
						local ok, result = pcall(getgenv)

						if not ok or type(result) ~= "table" then
							table.insert(tbl23.critical, "getgenv")
						end
					end

					if fn44("newcclosure") then
						local ok, result = pcall(newcclosure, function()
							return 1
						end)

						if not ok or type(result) ~= "function" then
							table.insert(tbl23.core, "newcclosure")
						end
					end

					local str9 = "Unknown"

					if fn44("identifyexecutor") then
						local ok, result, result2 = pcall(identifyexecutor)

						if ok and result then
							str9 = result2 and tostring(result) .. " " .. tostring(result2) or tostring(result)
						end
					end

					local str10, str11

					if #tbl23.critical > 0 then
						str10 = "rgb(255,68,68)"
						str11 = "Unsupported"
					elseif #tbl23.core > 0 then
						str10 = "rgb(255,140,0)"
						str11 = "Limited"
					elseif #tbl23.extra > 0 then
						str10 = "rgb(255,205,60)"
						str11 = "Partial"
					else
						str10 = "rgb(50,255,50)"
						str11 = "Full Support"
					end

					return str9, str11, str10, tbl23
				end

				local User = tbl17.Home:AddLeftGroupbox("User", "user")

				pcall(function()
					User:SetDescription("Profile & Info")
				end)

				User:AddImage("HomeAvatar", {
					Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=420&h=420"):format(localPlayer3.UserId),
					Height = 150,
				})

				local v40 = User:AddLabel("User: ...", true)
				local v41 = User:AddLabel("UserId: ...", true)
				local v42 = User:AddLabel("Executor: ...", true)
				User:AddDivider()
				local v43 = User:AddLabel("Session: 00:00:00", true)
				User:AddDivider()

				User:AddButton({
					Text = "Copy Username",
					Func = function()
						if setclipboard then
							setclipboard(localPlayer3.Name)
						end

						v24:Notify({ Title = "Revenant", Content = "Username copied", Time = 2 })
					end,
				})

				User:AddButton({
					Text = "Copy Profile Link",
					Func = function()
						if setclipboard then
							setclipboard(("https://www.roblox.com/users/%d/profile"):format(localPlayer3.UserId))
						end

						v24:Notify({ Title = "Revenant", Content = "Profile link copied", Time = 2 })
					end,
				})

				local Session = tbl17.Home:AddRightGroupbox("Session", "server")

				pcall(function()
					Session:SetDescription("Server Info")
				end)

				local v44 = Session:AddLabel("Game: ...", true)
				local v45 = Session:AddLabel("Players: ...", true)
				local v46 = Session:AddLabel("Job: ...", true)
				local v47 = Session:AddLabel("Ping: ...", true)

				Session:AddButton({
					Text = "Rejoin Server",
					Func = function()
						pcall(function()
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer3)
						end)
					end,
				})

				Session:AddDivider()

				Session:AddInput("JoinJobId", {
					Text = "Join by Job ID",
					Placeholder = "paste a job id",
					Finished = true,
					Callback = function(arg)
						local revRunCmd = getgenv().__RevRunCmd

						if revRunCmd and arg and arg ~= "" then
							revRunCmd("join", { arg })
						end
					end,
				})

				Session:AddButton({
					Text = "Join Server",
					Func = function()
						local joinJobId = options.JoinJobId
						local value = joinJobId and joinJobId.Value

						if (not value or value == "") and joinJobId and joinJobId.Holder then
							local textBox = joinJobId.Holder:FindFirstChildWhichIsA("TextBox", true)
							value = textBox and textBox.Text or value
						end

						local revRunCmd = getgenv().__RevRunCmd

						if revRunCmd and value and value ~= "" then
							revRunCmd("join", { value })
						else
							v24:Notify({ Title = "Revenant", Content = "Paste a Job ID first", Time = 3 })
						end
					end,
				})

				Session:AddButton({
					Text = "Copy Job ID",
					Func = function()
						if setclipboard then
							setclipboard(tostring(game.JobId))
						end

						v24:Notify({ Title = "Revenant", Content = "Job ID copied", Time = 2 })
					end,
				})

				task.spawn(function()
					local v48, v49, v50 = fn43()
					v40:SetText(localPlayer3.DisplayName ~= localPlayer3.Name and "User: <b>" .. localPlayer3.DisplayName .. "</b> (@" .. localPlayer3.Name .. ")" or "User: <b>" .. localPlayer3.Name .. "</b>")
					v41:SetText("UserId: <b>" .. tostring(localPlayer3.UserId) .. "</b>")
					v42:SetText(("Executor: <b>%s</b>  <b><font color=\"%s\">%s</font></b>"):format(v48, v50, v49))
					v46:SetText("Job: " .. tostring(game.JobId):sub(1, 8) .. "...")
					local name = nil

					pcall(function()
						name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
					end)

					name = name or "Place " .. tostring(game.PlaceId)
					v44:SetText("Game: <b>" .. name .. "</b>")

					task.spawn(function()
						local request_ = request or http_request or syn and syn.request
						if not request_ then
							return
						end

						local ok, result = pcall(request_, {
							Url = ("https://apis.roblox.com/universes/v1/places/%d/universe"):format(game.PlaceId),
							Method = "GET",
						})

						if not (ok and result and result.Body) then
							return
						end
						local match = tostring(result.Body):match("\"universeId\"%s*:%s*(%d+)")
						if not match then
							return
						end

						local ok2, result2 = pcall(request_, {
							Url = ("https://games.roblox.com/v1/games?universeIds=%s"):format(match),
							Method = "GET",
							Headers = { ["Accept-Language"] = "en-US,en;q=0.9" },
						})

						if not (ok2 and result2 and result2.Body) then
							return
						end
						local match2 = tostring(result2.Body):match("\"name\"%s*:%s*\"(.-)\"")

						if match2 and match2 ~= "" and match2 ~= "[TITLE UNAVAILABLE]" then
							v44:SetText("Game: <b>" .. match2 .. "</b>")
						end
					end)
				end)

				local now2 = os.clock()

				task.spawn(function()
					while not v24.Unloaded do
						local n15 = math.floor(os.clock() - now2)
						v43:SetText(("Session: %02d:%02d:%02d"):format(math.floor(n15 / 3600), math.floor(n15 % 3600 / 60), n15 % 60))
						local maxPlayers = Players.MaxPlayers
						v45:SetText(("Players: <b>%d / %d</b>"):format(#Players:GetPlayers(), maxPlayers))
						local str9 = "?"

						pcall(function()
							str9 = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
						end)

						v47:SetText("Ping: <b>" .. tostring(str9) .. " ms</b>")
						task.wait(1)
					end
				end)
			end

			local connection5
			connection5 = nil
			local v40
			v40 = nil
			local flag12
			flag12 = false
			local tbl20
			tbl20 = {}
			local tPoseActive, connection6, v41, connection7, flag13, connection8, cFrame, tbl21, tbl22, flag14
			local flag15, flag16, fn43, fn44, tbl23, connection9, part2, connection10, connection11, connection12
			local tbl24, v42, fn45, fn46, fn47, fn48, fn49, fn50, fn51, fn52
			local connection13, fn53, fn54, connection14, connection15, tbl25, tbl26, fn55, fn56, connection16
			local connection17, fn57, fn58

			do
				local tbl27 = {}
				tPoseActive = false
				connection6 = nil
				v41 = nil
				connection7 = nil
				flag13 = false
				connection8 = nil
				cFrame = nil
				tbl21 = { target = nil, player = nil }
				game:GetService("StarterPlayer"):FindFirstChild("StarterCharacter")
				tbl22 = {}
				flag14 = false
				str4 = nil
				flag15 = false
				flag16 = false

				fn43 = function()
				end

				fn44 = function()
				end

				tbl23 = { Flying = false, ["Touch Fling"] = false, ["Touch Fling Settings"] = Vector3.zero }
				getgenv().InvisActive = false
				getgenv().FUCActive = false
				getgenv().OldPos = nil
				local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
				getgenv().FPDH = fallenPartsDestroyHeight
				workspace.FallenPartsDestroyHeight = (0/0)

				connection9 = workspace:GetPropertyChangedSignal("FallenPartsDestroyHeight"):Connect(function()
					local fallenPartsDestroyHeight2 = workspace.FallenPartsDestroyHeight

					if fallenPartsDestroyHeight2 == fallenPartsDestroyHeight2 then
						workspace.FallenPartsDestroyHeight = (0/0)
					end
				end)

				part2 = Instance.new("Part", workspace)
				part2.CFrame = CFrame.new(0, -10008, 0)
				part2.Anchored = true
				part2.Size = Vector3.new(2048, 10, 2048)
				part2.Transparency = 0.5
				part2.CanCollide = true
				part2.Name = game:GetService("HttpService"):GenerateGUID()
				connection10 = nil
				local connection18 = nil

				local function fn59(arg)
					if not arg then
						return
					end
					local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 3)
					if not humanoid or not humanoidRootPart2 then
						return
					end

					if connection10 then
						connection10:Disconnect()
						connection10 = nil
					end

					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					connection10 = RunService.RenderStepped:Connect(function()
						local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart3 then
							part2.CFrame = CFrame.new(humanoidRootPart3.Position.X, -10008, humanoidRootPart3.Position.Z)
						end
					end)

					if not (type(getconnections) == "function" and type(debug) == "table" and type(debug.getconstants) == "function" and type(debug.getupvalues) == "function" and type(debug.setupvalue) == "function") then
						local health = humanoid.Health
						connection10:Disconnect()

						connection10 = RunService.RenderStepped:Connect(function()
							local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart3 then
								health = humanoid.Health
								part2.CFrame = CFrame.new(humanoidRootPart3.Position.X, -10008, humanoidRootPart3.Position.Z)
							end
						end)

						connection18 = humanoid.HealthChanged:Connect(function(health2)
							local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart")

							if health2 <= 0 and humanoidRootPart3 and humanoidRootPart3.CFrame.Y <= 0 then
								humanoid.Health = health
							end
						end)
					end
				end

				fn59(localPlayer3.Character)

				connection11 = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(0.1)
					fn59(character)
				end)

				local connection19 = nil
				local connection20 = nil
				connection12 = nil
				local flag17 = false
				tbl24 = {}

				local function fn60()
					if type(getconnections) ~= "function" or type(debug) ~= "table" or type(debug.getconstants) ~= "function" or type(debug.getupvalues) ~= "function" or type(debug.setupvalue) ~= "function" then
						return false
					end

					local ok, result = pcall(function()
						for _, v43 in ipairs(getconnections(RunService.Heartbeat)) do
							local ok, result = pcall(function()
								return v43.Function
							end)

							if ok and type(result) == "function" then
								local ok2, result2 = pcall(debug.getconstants, result)

								if ok2 and type(result2) == "table" then
									for _, v44 in pairs(result2) do
										if type(v44) == "string" and v44:find("crep revive", 1, true) then
											local ok3, result3 = pcall(debug.getupvalues, result)
											if ok3 and type(result3) == "table" and type(result3[40]) == "boolean" then
												debug.setupvalue(result, 40, false)
												return true
											end
											return false
										end
									end
								end
							end
						end

						return false
					end)

					return ok and result == true
				end

				task.spawn(function()
					local function fn61()
						task.wait(2.5)

						for i = 1, 6 do
							if fn60() then
								return
							end
							task.wait(0.5)
						end
					end

					task.spawn(fn61)

					local connection21 = localPlayer3.CharacterAdded:Connect(function()
						task.spawn(fn61)
					end)

					table.insert(tbl24, function()
						pcall(function()
							connection21:Disconnect()
						end)
					end)
				end)

				local tbl28 = {}
				local obj2 = setmetatable({}, { __mode = "k" })

				local function createFolder(parent)
					if not parent then
						return nil
					end
					local movingExclusion = parent:FindFirstChild("MovingExclusion")
					if movingExclusion then
						return movingExclusion
					end
					local folder = Instance.new("Folder")
					folder.Name = "MovingExclusion"

					pcall(function()
						folder:SetAttribute("RevenantOwned", true)
					end)

					folder.Parent = parent
					obj2[folder] = true
					return folder
				end

				local function fn61(arg)
					if not arg then
						return
					end
					createFolder(arg)

					local connection21 = arg.ChildRemoved:Connect(function(child)
						if child.Name == "MovingExclusion" and getgenv().RevenantLoaded then
							task.defer(createFolder, arg)
						end
					end)

					table.insert(tbl28, connection21)
				end

				fn61(localPlayer3.Character)

				table.insert(tbl28, localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(0.1)
					fn61(character)
				end))

				table.insert(tbl24, function()
					for _, v43 in ipairs(tbl28) do
						pcall(function()
							v43:Disconnect()
						end)
					end

					tbl28 = {}
					local character = localPlayer3.Character
					local movingExclusion = character and character:FindFirstChild("MovingExclusion")

					if movingExclusion and (obj2[movingExclusion] or movingExclusion:GetAttribute("RevenantOwned")) then
						pcall(function()
							movingExclusion:Destroy()
						end)
					end
				end)

				if getgenv()._standDeactivateFn then
					table.insert(tbl24, getgenv()._standDeactivateFn)
				end

				v42 = nil

				fn45 = function()
					return UserInputService:GetFocusedTextBox() ~= nil
				end

				fn46 = function(arg)
					local ok, result = pcall(function()
						return arg.DisplayName
					end)

					if not ok or not result or result == "" then
						return arg.Name
					end

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= arg and player.DisplayName == result then
							return arg.Name
						end
					end

					return result
				end

				local function fn62()
					local tbl29 = {}

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer3 then
							tbl29[#tbl29 + 1] = fn41(player)
						end
					end

					return tbl29
				end

				fn47 = function(arg)
					return fn42(arg)
				end

				fn48 = function()
					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					if connection20 then
						connection20:Disconnect()
						connection20 = nil
					end
				end

				fn49 = function(arg)
					if not arg or not arg.Parent then
						return
					end
					fn48()

					if arg.Character then
						pcall(function()
							flag17 = true
							workspace.CurrentCamera.CameraSubject = arg.Character
							flag17 = false
						end)
					end

					connection19 = arg.CharacterAdded:Connect(function()
						while true do
							task.wait()
							if not (arg.Character and arg.Character:FindFirstChild("HumanoidRootPart")) then
								continue
							end
							break
						end

						pcall(function()
							flag17 = true
							workspace.CurrentCamera.CameraSubject = arg.Character
							flag17 = false
						end)
					end)

					connection20 = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
						if flag17 then
							return
						end

						if not arg or not arg.Parent then
							fn48()

							pcall(function()
								workspace.CurrentCamera.CameraSubject = localPlayer3.Character
							end)

							return
						end

						if arg.Character then
							pcall(function()
								flag17 = true
								workspace.CurrentCamera.CameraSubject = arg.Character
								flag17 = false
							end)
						end
					end)
				end

				fn50 = function()
					fn48()

					pcall(function()
						workspace.CurrentCamera.CameraSubject = localPlayer3.Character
					end)
				end

				local function fn63()
					tbl27 = {}

					for k, v43 in pairs(tbl18) do
						if k ~= "WAVE" and k ~= "POINT" and k ~= "HAPPY" and k ~= "LAUGH" and k ~= "F2_KEY" then
							tbl27[k] = v43.IsActive
						end
					end

					tbl27.__TPoseActive = tPoseActive
				end

				local function fn64()
					if not next(tbl27) then
						return
					end
					local character = localPlayer3.Character
					local n15 = tick() + 2

					while not character and tick() < n15 do
						task.wait(0.05)
						character = localPlayer3.Character
					end

					if not character then
						return
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 1)
					if not humanoid then
						return
					end

					if not (humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 1)) then
						return
					end
					task.wait(0.05)

					for k, v43 in pairs(tbl27) do
						if k:sub(1, 2) ~= "__" then
							if v43 and not tbl18[k].IsActive then
								tbl18[k].IsActive = false

								task.spawn(function()
									toggleAnim(tbl18[k])
								end)
							end
						end
					end

					if tbl27.__TPoseActive and not tPoseActive then
						task.spawn(toggleTPose)
					end
				end

				local function fn65(arg)
					if arg.Track then
						arg.Track:Stop()
						arg.Track:Destroy()
						arg.Track = nil
					end
				end

				local function fn66()
					local tposeA = tbl18.TPOSE_A

					if tposeA.Track then
						pcall(function()
							if tposeA.Track.IsPlaying then
								tposeA.Track:Stop()
							end
						end)

						pcall(function()
							tposeA.Track:Destroy()
						end)

						tposeA.Track = nil
					end

					v41 = nil
				end

				local function fn67(arg, arg2, priority, arg3)
					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://" .. arg.Id
					local v43 = arg2:LoadAnimation(animation)
					v43.Priority = priority
					v43.Looped = true
					v43:Play()
					v43:AdjustSpeed(0)

					if arg.StartTime and arg.StartTime > 0 then
						v43.TimePosition = arg.StartTime
					end

					pcall(function()
						local v44 = v43
						local adjustWeight = v44.AdjustWeight
						local v45 = arg3
						local n15

						if arg3 then
							n15 = v45
						else
							n15 = 100000000
						end

						adjustWeight(v44, n15)
					end)

					return v43
				end

				local function fn68(arg, looped)
					looped = looped == nil and true or looped
					local character = localPlayer3.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					humanoid = humanoid and humanoid:FindFirstChildOfClass("Animator")
					if not humanoid then
						return
					end

					if arg.Track and arg.Track.IsPlaying then
						return arg.Track
					end
					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://" .. arg.Id
					arg.Track = humanoid:LoadAnimation(animation)
					arg.Track.Priority = arg.Priority or (arg.Id == "121572214" or arg.Id == "72042024") and Enum.AnimationPriority.Action4 or Enum.AnimationPriority.Action3
					arg.Track.Looped = looped
					local v43 = tbl19[arg.Id]

					if v43 then
						arg.Track:AdjustWeight(v43)
					end

					arg.Track:Play()
					arg.Track:AdjustSpeed(arg.Speed)
					arg.Track.TimePosition = arg.StartTime
					return arg.Track
				end

				local tbl29 = { WAVE = true, POINT = true, HAPPY = true, LAUGH = true, F2_KEY = true, TPOSE_A = true }

				local function fn69(arg, arg2)
					tbl20 = {}

					for k, v43 in pairs(tbl18) do
						if not tbl29[k] then
							if not (arg and k == "L_KEY") then
								if not (arg2 and (k == "L_KEY" or k == "JERK")) then
									if v43.IsActive and v43.Track and v43.Track.IsPlaying then
										tbl20[k] = true
										v43.Track:Stop()
									end
								end
							end
						end
					end

					if tPoseActive then
						tbl20.TPOSE_A = true

						if connection6 then
							connection6:Disconnect()
							connection6 = nil
						end

						fn66()
						tPoseActive = false

						if not arg2 then
							pcall(function()
								if toggles.TogTPose then
									_guard.TPose = true
									toggles.TogTPose:SetValue(false)
									_guard.TPose = false
								end
							end)
						end
					end
				end

				fn51 = function(arg)
					for k, v43 in pairs(tbl18) do
						if not tbl29[k] then
							if not (arg and (k == "L_KEY" or k == "JERK")) then
								if tbl20[k] and v43.IsActive then
									if v43.Track then
										v43.Track:Play()
										v43.Track:AdjustSpeed(v43.Speed)
									else
										fn68(v43, true, Enum.AnimationPriority.Action4)
									end
								end
							end
						end
					end

					if tbl20.TPOSE_A and not arg and toggles.TogTPose and toggles.TogTPose.Value then
						tPoseActive = false

						connection6 = RunService.Heartbeat:Connect(function()
							if getgenv().InvisActive or getgenv().FUCActive then
								return
							end
							local character = localPlayer3.Character
							character = character and character:FindFirstChildOfClass("Humanoid")
							character = character and character:FindFirstChildOfClass("Animator")
							if not character then
								return
							end

							if v41 ~= character then
								fn66()
								v41 = character
								tbl18.TPOSE_A.Track = fn67(tbl18.TPOSE_A, character, Enum.AnimationPriority.Action3, 1e12)
								return
							end

							local tposeA = tbl18.TPOSE_A

							if not tposeA.Track or not tposeA.Track.IsPlaying then
								if tposeA.Track then
									pcall(function()
										tposeA.Track:Destroy()
									end)
								end

								tposeA.Track = fn67(tposeA, character, Enum.AnimationPriority.Action3, 1e12)
							end
						end)

						tPoseActive = true
					end

					tbl20 = {}
				end

				local function toggleIsActive(arg)
					arg.IsActive = not arg.IsActive

					if arg.IsActive then
						fn68(arg, true, Enum.AnimationPriority.Action4)
					else
						fn65(arg)
					end

					if arg.IsActive and not connection5 then
						connection5 = RunService.Heartbeat:Connect(function()
							if flag12 then
								return
							end

							for k, v43 in pairs(tbl18) do
								if not tbl29[k] and v43.IsActive then
									if not (getgenv().InvisActive and k ~= "L_KEY" and k ~= "JERK") then
										if not v43.Track or v43.Track.Parent == nil then
											fn68(v43, true, Enum.AnimationPriority.Action4)
										else
											if not v43.Track.IsPlaying then
												v43.Track:Play()
											end

											if k == "L_KEY" and v43.Track.TimePosition < 0.1 then
												v43.Track.TimePosition = 0.5
											end
										end
									end
								end
							end
						end)
					elseif not arg.IsActive then
						local flag18 = false

						for k, v43 in pairs(tbl18) do
							if not tbl29[k] and v43.IsActive then
								flag18 = true
								break
							end
						end

						if not flag18 and connection5 then
							connection5:Disconnect()
							connection5 = nil
						end
					end
				end

				local tbl30

				tbl30 = {
					conns = {},
					tracks = {},
					active = false,
					play = function(arg, timePosition, arg2, arg3)
						local character = localPlayer3.Character
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")
						if not humanoid then
							return
						end
						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://" .. arg

						local ok, result = pcall(function()
							return humanoid:LoadAnimation(animation)
						end)

						if not ok or not result then
							return
						end
						result.Priority = Enum.AnimationPriority.Action4
						local v43 = tbl19[arg]

						if v43 then
							pcall(function()
								result:AdjustWeight(v43)
							end)
						end

						tbl30.tracks[arg3] = result
						result.Looped = true

						tbl30.conns[arg3] = RunService.RenderStepped:Connect(function()
							if not tbl30.active then
								return
							end

							if not result.IsPlaying then
								result:Play()
								result.TimePosition = timePosition
							elseif arg2 < result.TimePosition then
								result.TimePosition = timePosition
							end
						end)

						result:Play()

						pcall(function()
							result:AdjustSpeed(tbl18.JERK.Speed or 1)
						end)

						result.TimePosition = timePosition
					end,
					stop = function()
						tbl30.active = false

						for _, conn in pairs(tbl30.conns) do
							pcall(function()
								conn:Disconnect()
							end)
						end

						local tracks = tbl30.tracks
						local v43 = tbl30
						tbl30.conns = {}
						v43.tracks = {}

						local function fn70(arg)
							pcall(function()
								arg:AdjustWeight(1, 0)
							end)

							pcall(function()
								arg:Stop(0.25)
							end)

							task.delay(0.35, function()
								pcall(function()
									arg:Destroy()
								end)
							end)
						end

						for _, track in pairs(tracks) do
							fn70(track)
						end

						pcall(function()
							local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")
							if not humanoid then
								return
							end

							for _, v44 in pairs(humanoid:GetPlayingAnimationTracks()) do
								if v44.Animation and tostring(v44.Animation.AnimationId):match("72042024") then
									fn70(v44)
								end
							end
						end)
					end,
					start = function()
						tbl30.stop()
						tbl30.active = true
						tbl30.play("72042024", 0.5, 0.9, 1)
					end,
					toggle = function()
						if tbl30.active then
							tbl30.stop()
						else
							tbl30.start()
						end

						tbl18.JERK.IsActive = tbl30.active
					end,
				}

				fn52 = function()
					if getgenv().InvisActive or getgenv().FUCActive then
						return
					end

					if connection6 then
						connection6:Disconnect()
						connection6 = nil
					end

					tPoseActive = not tPoseActive

					if tPoseActive then
						local character = localPlayer3.Character
						character = character and character:FindFirstChildOfClass("Humanoid")
						character = character and character:FindFirstChildOfClass("Animator")
						if not character then
							tPoseActive = false
							return
						end
						fn66()
						v41 = character
						tbl18.TPOSE_A.Track = fn67(tbl18.TPOSE_A, character, Enum.AnimationPriority.Action3, 1e12)

						connection6 = RunService.Heartbeat:Connect(function()
							if getgenv().InvisActive or getgenv().FUCActive then
								return
							end
							local character2 = localPlayer3.Character
							character2 = character2 and character2:FindFirstChildOfClass("Humanoid")
							character2 = character2 and character2:FindFirstChildOfClass("Animator")
							if not character2 then
								return
							end

							if v41 ~= character2 then
								fn66()
								v41 = character2
								tbl18.TPOSE_A.Track = fn67(tbl18.TPOSE_A, character2, Enum.AnimationPriority.Action3, 1e12)
								return
							end

							local tposeA = tbl18.TPOSE_A

							if not tposeA.Track or not tposeA.Track.IsPlaying then
								if tposeA.Track then
									pcall(function()
										tposeA.Track:Destroy()
									end)
								end

								tposeA.Track = fn67(tposeA, character2, Enum.AnimationPriority.Action3, 1e12)
							end
						end)
					else
						fn66()
					end
				end

				connection13 = nil
				local connection21 = nil
				local v43 = nil

				fn53 = function()
					local character = localPlayer3.Character

					if flag13 then
						flag13 = false

						if connection8 then
							connection8:Disconnect()
							connection8 = nil
						end

						if tbl21.stepConn then
							tbl21.stepConn:Disconnect()
							tbl21.stepConn = nil
						end

						if tbl21.repConn then
							tbl21.repConn:Disconnect()
							tbl21.repConn = nil
						end

						if connection13 then
							connection13:Disconnect()
							connection13 = nil
						end

						if connection21 then
							connection21:Disconnect()
							connection21 = nil
						end

						local character2 = localPlayer3.Character
						local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart2 then
							if sethiddenproperty then
								pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)
							end

							humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
							humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
							humanoidRootPart2.Velocity = Vector3.zero
							humanoidRootPart2.RotVelocity = Vector3.zero
						end

						if tbl21.target and tbl21.target.Parent then
							pcall(function()
								sethiddenproperty(tbl21.target, "PhysicsRepRootPart", nil)
							end)

							pcall(function()
								tbl21.target.AssemblyLinearVelocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.AssemblyAngularVelocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.Velocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.RotVelocity = Vector3.zero
							end)
						end

						tbl21.target = nil
						tbl21.player = nil
						local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")

						if humanoid then
							pcall(function()
								humanoid.AutoRotate = true
							end)

							pcall(function()
								humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
							end)
						end

						if cFrame and humanoidRootPart2 then
							local v44 = cFrame
							cFrame = nil

							task.spawn(function()
								for i = 1, 4 do
									RunService.Heartbeat:Wait()
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
									humanoidRootPart2.Velocity = Vector3.zero
									humanoidRootPart2.RotVelocity = Vector3.zero
									humanoidRootPart2.CFrame = v44
								end
							end)
						end

						pcall(function()
							_guard.Weld = true
							toggles.TogWeld:SetValue(false)
							_guard.Weld = false
						end)

						pcall(function()
							options.KPWeld.Toggled = false
							options.KPWeld:Update()
						end)

						if not flag11 and not flag16 then
							fn50()
						end

						v24:Notify({ Title = flag11 and "Attach" or "Orbit", Content = "Toggled off ❌", Time = 2 })
						return
					end

					if character then
						character:FindFirstChild("HumanoidRootPart")
					end

					local tbl31 = {}
					local v44 = ipairs
					local Players2 = game:GetService("Players")

					for _, player in v44(Players2:GetPlayers()) do
						table.insert(tbl31, player)
					end

					local live = workspace:FindFirstChild("Live")

					if live then
						for _, child in ipairs(live:GetChildren()) do
							if child:IsA("Model") and child:FindFirstChild("Humanoid") then
								table.insert(tbl31, child)
							end
						end
					end

					local flag18 = false

					for _, v45 in ipairs(tbl31) do
						if not (v45 == localPlayer3 or typeof(v45) == "Instance" and v45:IsA("Model") and v45 == localPlayer3.Character) then
							local character2 = typeof(v45) == "Instance" and v45:IsA("Player") and v45.Character or v45

							if character2 then
								local humanoid = character2:FindFirstChildOfClass("Humanoid")
								if humanoid and humanoid.Health > 0 then
									flag18 = true
									break
								end
							end
						end
					end

					if not flag18 then
						pcall(function()
							options.KPWeld.Toggled = false
							options.KPWeld:Update()
						end)

						return
					end

					if not character then
						pcall(function()
							options.KPWeld.Toggled = false
							options.KPWeld:Update()
						end)

						return
					end

					local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")

					if not humanoidRootPart2 then
						pcall(function()
							options.KPWeld.Toggled = false
							options.KPWeld:Update()
						end)

						return
					end

					flag13 = true
					cFrame = humanoidRootPart2.CFrame
					humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero

					if sethiddenproperty then
						pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", humanoidRootPart2)
					end

					pcall(function()
						_guard.Weld = true
						toggles.TogWeld:SetValue(true)
						_guard.Weld = false
					end)

					pcall(function()
						options.KPWeld.Toggled = true
					end)

					local function fn70()
						local mouseLocation = UserInputService:GetMouseLocation()
						local tbl32 = {}
						local v45 = ipairs
						local Players3 = game:GetService("Players")

						for _, player in v45(Players3:GetPlayers()) do
							table.insert(tbl32, player)
						end

						local live2 = workspace:FindFirstChild("Live")

						if live2 then
							for _, child in ipairs(live2:GetChildren()) do
								if child:IsA("Model") and child:FindFirstChild("Humanoid") then
									table.insert(tbl32, child)
								end
							end
						end

						local huge = math.huge
						local v46 = nil
						local v47 = nil

						for _, v48 in ipairs(tbl32) do
							if not (v48 == localPlayer3 or typeof(v48) == "Instance" and v48:IsA("Model") and v48 == localPlayer3.Character) then
								local character2 = typeof(v48) == "Instance" and v48:IsA("Player") and v48.Character or v48

								if character2 then
									local humanoid = character2:FindFirstChildOfClass("Humanoid")

									if not (not humanoid or humanoid.Health <= 0) then
										local rootPart = humanoid.RootPart or character2:FindFirstChild("HumanoidRootPart")

										if rootPart then
											if humanoid.Health ~= 0 and workspace.CurrentCamera then
												local v49 = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
												local magnitude = (Vector2.new(v49.X, v49.Y) - mouseLocation).Magnitude

												if magnitude < huge then
													huge = magnitude
													v46 = v48
													v47 = rootPart
												end
											end
										end
									end
								end
							end
						end

						return v47, v46
					end

					local v45, v46 = fn70()
					tbl21.target = v45
					tbl21.player = v46

					if not v45 or not v46 then
						flag13 = false

						pcall(function()
							_guard.Weld = true
							toggles.TogWeld:SetValue(false)
							_guard.Weld = false
						end)

						pcall(function()
							options.KPWeld.Toggled = false
							options.KPWeld:Update()
						end)

						local character2 = localPlayer3.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if character2 then
							character2.AssemblyLinearVelocity = Vector3.zero
							character2.AssemblyAngularVelocity = Vector3.zero
							character2.Velocity = Vector3.zero
							character2.RotVelocity = Vector3.zero
						end

						return
					end

					local function fn71()
						flag13 = false

						if connection8 then
							connection8:Disconnect()
							connection8 = nil
						end

						if tbl21.stepConn then
							tbl21.stepConn:Disconnect()
							tbl21.stepConn = nil
						end

						if tbl21.repConn then
							tbl21.repConn:Disconnect()
							tbl21.repConn = nil
						end

						if connection13 then
							connection13:Disconnect()
							connection13 = nil
						end

						pcall(function()
							if connection21 then
								connection21:Disconnect()
								connection21 = nil

								if v43 and v43.Parent then
									local humanoid = v43.Parent:FindFirstChildOfClass("Humanoid")

									if humanoid then
										pcall(function()
											humanoid.AutoRotate = true
										end)
									end
								end

								v43 = nil
							end
						end)

						local character2 = localPlayer3.Character
						local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart3 then
							if sethiddenproperty then
								pcall(sethiddenproperty, humanoidRootPart3, "PhysicsRepRootPart", nil)
							end

							humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
							humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero
							humanoidRootPart3.Velocity = Vector3.zero
							humanoidRootPart3.RotVelocity = Vector3.zero
						end

						if tbl21.target and tbl21.target.Parent then
							pcall(function()
								sethiddenproperty(tbl21.target, "PhysicsRepRootPart", nil)
							end)

							pcall(function()
								tbl21.target.AssemblyLinearVelocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.AssemblyAngularVelocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.Velocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.RotVelocity = Vector3.zero
							end)
						end

						tbl21.target = nil
						tbl21.player = nil
						local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")

						if humanoid then
							pcall(function()
								humanoid.AutoRotate = true
							end)

							pcall(function()
								humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
							end)
						end

						if cFrame and humanoidRootPart3 then
							local v47 = cFrame
							cFrame = nil

							task.spawn(function()
								for i = 1, 4 do
									RunService.Heartbeat:Wait()
									humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero
									humanoidRootPart3.Velocity = Vector3.zero
									humanoidRootPart3.RotVelocity = Vector3.zero
									humanoidRootPart3.CFrame = v47
								end
							end)
						end

						pcall(function()
							_guard.Weld = true
							toggles.TogWeld:SetValue(false)
							_guard.Weld = false
						end)

						pcall(function()
							options.KPWeld.Toggled = false
							options.KPWeld:Update()
						end)

						if not flag11 and not flag16 then
							fn50()
						end

						v24:Notify({ Title = flag11 and "Attach" or "Orbit", Content = "Toggled off ❌", Time = 2 })
					end

					connection13 = game:GetService("Players").PlayerRemoving:Connect(function(player)
						if player == v46 then
							fn71()
						end
					end)

					if flag11 then
						local n15 = 0
						local v47 = nil

						local function fn72(arg, arg2)
							if connection21 then
								return
							end
							v47 = arg

							connection21 = RunService.RenderStepped:Connect(function()
								if arg2 and arg2.Parent and arg2.AutoRotate then
									arg2.AutoRotate = false
								end
							end)
						end

						local function fn73()
							if connection21 then
								connection21:Disconnect()
								connection21 = nil
							end

							if v47 and v47.Parent then
								local humanoid = v47.Parent:FindFirstChildOfClass("Humanoid")

								if humanoid then
									pcall(function()
										humanoid.AutoRotate = true
									end)
								end
							end

							v47 = nil
						end

						connection8 = RunService.Heartbeat:Connect(function()
							if not flag13 then
								return
							end
							local flag19 = options.AttachMethod and options.AttachMethod.Value == "Hitbox Accurate"
							local character2 = localPlayer3.Character
							local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")

							if not character2 or not humanoidRootPart3 then
								local humanoidRootPart4 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart4 then
									pcall(sethiddenproperty, humanoidRootPart4, "PhysicsRepRootPart", nil)
								end

								return
							end

							if v46 and v46.Parent then
								local character3 = typeof(v46) == "Instance" and v46:IsA("Player") and v46.Character or v46

								if character3 then
									local humanoid

									if flag19 then
										humanoid = character3:FindFirstChildOfClass("Humanoid")
										humanoid = humanoid and humanoid.RootPart
										local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

										if humanoid2 then
											fn72(humanoidRootPart3, humanoid2)
										end
									else
										if connection21 then
											fn73()
										end

										humanoid = character3:FindFirstChild("UpperTorso") or character3:FindFirstChild("Torso") or character3:FindFirstChild("HumanoidRootPart")
									end

									if humanoid then
										v45 = humanoid
										tbl21.target = humanoid
									end
								end

								if not v45 or not v45.Parent then
									return
								end

								if options.AttachMethod and options.AttachMethod.Value == "Orbit" then
									local n16 = options.AttachOrbitSpeed and options.AttachOrbitSpeed.Value or 10
									local n17 = options.AttachOrbitDistance and options.AttachOrbitDistance.Value or 3
									n15 += n16
									local position = v45.Position
									local n18 = CFrame.Angles(0, math.rad(n15), 0) * CFrame.new(n17, 0, 0)
									local humanoid = character2:FindFirstChildOfClass("Humanoid")

									if humanoid then
										pcall(function()
											humanoid.AutoRotate = false
										end)
									end

									local n19 = CFrame.new(position.X, position.Y, position.Z) * n18
									humanoidRootPart3.CFrame = CFrame.lookAt(n19.Position, Vector3.new(position.X, n19.Position.Y, position.Z))
									humanoidRootPart3.AssemblyLinearVelocity = v45.AssemblyLinearVelocity
									humanoidRootPart3.AssemblyAngularVelocity = v45.AssemblyAngularVelocity
								else
									humanoidRootPart3.CFrame = v45.CFrame * CFrame.new(options.WeldOffsetX and options.WeldOffsetX.Value or 0, options.WeldOffsetY and options.WeldOffsetY.Value or 0, -(options.WeldOffsetZ and options.WeldOffsetZ.Value or 0))
									local flag20 = tbl23 and tbl23["Touch Fling"] and options.TouchFlingMethod and options.TouchFlingMethod.Value == "Death"

									if flag20 then
										humanoidRootPart3.AssemblyLinearVelocity = Vector3.new((0/0), (0/0), (0/0))
										humanoidRootPart3.AssemblyAngularVelocity = Vector3.new((0/0), (0/0), (0/0))
									else
										humanoidRootPart3.AssemblyLinearVelocity = v45.AssemblyLinearVelocity
										humanoidRootPart3.AssemblyAngularVelocity = v45.AssemblyAngularVelocity
									end

									local humanoid = character2:FindFirstChildOfClass("Humanoid")

									if humanoid then
										pcall(function()
											humanoid.AutoRotate = false
										end)

										if flag20 then
											pcall(function()
												sethiddenproperty(humanoid, "MoveDirectionInternal", Vector3.new((0/0), (0/0), (0/0)))
											end)
										end
									end
								end

								return
							end

							fn71()
						end)

						tbl21.stepConn = RunService.Stepped:Connect(function()
							if not flag13 then
								return
							end

							if options.AttachMethod and options.AttachMethod.Value == "Orbit" then
								return
							end

							if not (v45 and v45.Parent) then
								return
							end
							local character2 = localPlayer3.Character
							character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
							if not character2 then
								return
							end
							character2.CFrame = v45.CFrame * CFrame.new(options.WeldOffsetX and options.WeldOffsetX.Value or 0, options.WeldOffsetY and options.WeldOffsetY.Value or 0, -(options.WeldOffsetZ and options.WeldOffsetZ.Value or 0))
						end)

						tbl21.repConn = RunService.Stepped:Connect(function()
							if not flag13 then
								return
							end

							if not (v45 and v45.Parent) then
								return
							end
							local character2 = localPlayer3.Character
							character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
							if not character2 then
								return
							end
							pcall(sethiddenproperty, character2, "PhysicsRepRootPart", v45)
						end)
					else
						local n15 = 0

						if not flag16 then
							fn49(v46)
						end

						task.spawn(function()
							while flag13 do
								local character2 = localPlayer3.Character
								local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
								local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")
								local character3 = v46 and v46.Character
								local humanoidRootPart4 = character3 and character3:FindFirstChild("HumanoidRootPart")
								local humanoid2 = character3 and character3:FindFirstChildOfClass("Humanoid")

								if character2 and humanoidRootPart3 and humanoid and v46 and v46.Parent and character3 and humanoidRootPart4 and humanoid2 then
									local n16 = options.OrbitSpeed and options.OrbitSpeed.Value or 10
									local n17 = options.OrbitDistance and options.OrbitDistance.Value or 3
									n15 += n16
									local n18 = humanoidRootPart4.Position + humanoid2.MoveDirection * humanoidRootPart4.Velocity.Magnitude / 2.75
									local n19 = CFrame.Angles(0, math.rad(n15), 0) * CFrame.new(n17, 0, 0)
									humanoidRootPart3.CFrame = CFrame.lookAt(humanoidRootPart3.Position, Vector3.new(n18.X, humanoidRootPart3.Position.Y, n18.Z))
									task.wait()
									humanoidRootPart3.CFrame = CFrame.new(n18.X, humanoidRootPart4.Position.Y, n18.Z) * n19
									RunService.RenderStepped:Wait()
								elseif not v46 or not v46.Parent then
									fn71()
									break
								else
									RunService.RenderStepped:Wait()
								end
							end
						end)
					end

					v24:Notify({ Title = flag11 and "Attach" or "Orbit", Content = "Toggled on ✅", Time = 2 })
				end

				fn54 = function(arg, visible)
					if not arg then
						return
					end

					if not pcall(function()
						arg:SetVisible(visible)
					end) then
						pcall(function()
							local frame = arg.Frame or arg.HolderFrame or arg.Container

							if frame then
								frame.Visible = visible
							end
						end)
					end
				end

				local function fn70()
					connection7 = RunService.Heartbeat:Connect(function()
						if not toggles.TogHeadFloat.Value then
							return
						end

						if not tbl18.L_KEY.IsActive then
							return
						end
						local character = localPlayer3.Character
						character = character and character:FindFirstChildOfClass("Humanoid")
						local animator = character and character:FindFirstChildOfClass("Animator")
						if not animator then
							return
						end
						local lKey = tbl18.L_KEY

						if not lKey.Track or not lKey.Track.IsPlaying then
							if lKey.Track then
								pcall(function()
									lKey.Track:Destroy()
								end)
							end

							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://" .. lKey.Id
							lKey.Track = animator:LoadAnimation(animation)
							lKey.Track.Priority = Enum.AnimationPriority.Action4
							lKey.Track.Looped = true
							lKey.Track:AdjustWeight(1e13)
							lKey.Track:Play()
							lKey.Track:AdjustSpeed(lKey.Speed)
							lKey.Track.TimePosition = lKey.StartTime
						end
					end)
				end

				local function fn71()
					if connection7 then
						connection7:Disconnect()
						connection7 = nil
					end
				end

				connection14 = localPlayer3.CharacterAdded:Connect(function()
					if flag14 then
						flag14 = false
						fn50()

						if connection12 then
							connection12:Disconnect()
							connection12 = nil
						end
					end

					if connection6 then
						connection6:Disconnect()
						connection6 = nil
					end

					for _, v44 in pairs(tbl18) do
						v44.Track = nil
					end

					fn71()
					tPoseActive = false
					local f2Key = tbl18.F2_KEY

					if f2Key.Track then
						pcall(function()
							f2Key.Track:Stop()
						end)

						pcall(function()
							f2Key.Track:Destroy()
						end)

						f2Key.Track = nil
					end

					local tposeA = tbl18.TPOSE_A

					if tposeA.Track then
						pcall(function()
							tposeA.Track:Stop()
						end)

						pcall(function()
							tposeA.Track:Destroy()
						end)

						tposeA.Track = nil
					end

					v41 = nil
					v40 = nil
					flag12 = false
					tbl20 = {}
					task.spawn(fn64)
				end)

				connection15 = localPlayer3.CharacterRemoving:Connect(fn63)
				tbl25 = {}
				tbl26 = {}

				local TogHeadFloat = r6:AddToggle("TogHeadFloat", {
					Text = "Head Float",
					Default = false,
					Callback = function(arg)
						if arg then
							local value = options.SpamSpeed and options.SpamSpeed.Value

							if value then
								n14 = value
							end
						else
							if options.KPHeadFloat then
								options.KPHeadFloat.Toggled = false
							end

							fn71()

							if tbl18.L_KEY.IsActive then
								toggleIsActive(tbl18.L_KEY)
							end
						end
					end,
				})

				TogHeadFloat:AddKeyPicker("KPHeadFloat", {
					Default = "L",
					Text = "Head Float",
					SyncToggleState = false,
					Mode = "Toggle",
					Callback = function()
						if not toggles.TogHeadFloat.Value then
							options.KPHeadFloat.Toggled = false
							return
						end

						if fn45() then
							return
						end
						toggleIsActive(tbl18.L_KEY)
					end,
				})

				local v44 = r6:AddDependencyBox()

				v44:AddSlider("SpamSpeed", {
					Text = "Head Float Spam Delay",
					Default = 0.1,
					Min = 0.05,
					Max = 1,
					Rounding = 2,
					Callback = function(arg)
						n14 = arg
					end,
				})

				v44:SetupDependencies({ { TogHeadFloat, true } })

				local TogJerk = r6:AddToggle("TogJerk", {
					Text = "Auto Goon",
					Default = false,
					Callback = function(arg)
						if arg then
							local speed = options.JerkSpeed and options.JerkSpeed.Value

							if speed then
								tbl18.JERK.Speed = speed
							end
						else
							if options.KPJerk then
								options.KPJerk.Toggled = false
							end

							if tbl18.JERK.IsActive then
								tbl30.toggle()
							end
						end
					end,
				})

				TogJerk:AddKeyPicker("KPJerk", {
					Default = "J",
					Text = "Auto Goon",
					SyncToggleState = false,
					Mode = "Toggle",
					Callback = function()
						if not toggles.TogJerk.Value then
							options.KPJerk.Toggled = false
							return
						end

						if fn45() then
							return
						end
						tbl30.toggle()
					end,
				})

				local v45 = r6:AddDependencyBox()

				v45:AddSlider("JerkSpeed", {
					Text = "Auto Goon Speed",
					Default = 1,
					Min = 0,
					Max = 10,
					Rounding = 1,
					Callback = function(speed)
						tbl18.JERK.Speed = speed

						if tbl18.JERK.Track then
							tbl18.JERK.Track:AdjustSpeed(speed)
						end

						for _, track in pairs(tbl30.tracks) do
							pcall(function()
								track:AdjustSpeed(speed)
							end)
						end
					end,
				})

				v45:SetupDependencies({ { TogJerk, true } })

				local TogBang = r6:AddToggle("TogBang", {
					Text = "Bang Animation",
					Default = false,
					Callback = function(arg)
						if arg then
							local speed = options.BangSpeed and options.BangSpeed.Value

							if speed then
								tbl18.BANG.Speed = speed
							end
						else
							if options.KPBang then
								options.KPBang.Toggled = false
							end

							if tbl18.BANG.IsActive then
								toggleIsActive(tbl18.BANG)
							end
						end
					end,
				})

				TogBang:AddKeyPicker("KPBang", {
					Default = "P",
					Text = "Bang Anim",
					SyncToggleState = false,
					Mode = "Toggle",
					Callback = function()
						if not toggles.TogBang.Value then
							options.KPBang.Toggled = false
							return
						end

						if fn45() then
							return
						end
						toggleIsActive(tbl18.BANG)
					end,
				})

				local v46 = r6:AddDependencyBox()

				v46:AddSlider("BangSpeed", {
					Text = "Bang Animation Speed",
					Default = 33,
					Min = 0,
					Max = 33,
					Rounding = 1,
					Callback = function(speed)
						tbl18.BANG.Speed = speed

						if tbl18.BANG.Track then
							tbl18.BANG.Track:AdjustSpeed(speed)
						end
					end,
				})

				v46:SetupDependencies({ { TogBang, true } })

				local TogTPose = r6:AddToggle("TogTPose", {
					Text = "T-Pose",
					Default = false,
					Callback = function(arg)
						if not arg then
							if options.KPTPose then
								options.KPTPose.Toggled = false
							end

							if tPoseActive then
								fn52()
							end
						end
					end,
				})

				TogTPose:AddKeyPicker("KPTPose", {
					Default = "C",
					Text = "T-Pose",
					SyncToggleState = false,
					Mode = "Toggle",
					Callback = function()
						if not toggles.TogTPose.Value then
							options.KPTPose.Toggled = false
							return
						end

						if fn45() then
							return
						end

						if getgenv().FUCActive then
							options.KPTPose.Toggled = tPoseActive
							return
						end

						if getgenv().InvisActive then
							getgenv()._invisSavedTPose = not (getgenv()._invisSavedTPose or false)
							return
						end

						if options.KPTPose.Toggled == tPoseActive then
							return
						end
						fn52()
					end,
				})

				TogHeadFloat:OnChanged(function(arg)
					if tbl25.HeadFloat then
						return
					end

					if fn45() then
						tbl25.HeadFloat = true
						TogHeadFloat:SetValue(not arg)
						tbl25.HeadFloat = false
						return
					end

					if not arg then
						local kpHeadFloat = options and options.KPHeadFloat

						if kpHeadFloat then
							kpHeadFloat.Toggled = false
						end

						fn71()

						if tbl18.L_KEY.IsActive then
							toggleIsActive(tbl18.L_KEY)
						end
					end
				end)

				TogJerk:OnChanged(function(arg)
					if tbl25.Jerk then
						return
					end

					if fn45() then
						tbl25.Jerk = true
						TogJerk:SetValue(not arg)
						tbl25.Jerk = false
						return
					end

					if not arg then
						local kpJerk = options and options.KPJerk

						if kpJerk then
							kpJerk.Toggled = false
						end

						if tbl18.JERK.IsActive then
							toggleIsActive(tbl18.JERK)
						end
					end
				end)

				TogBang:OnChanged(function(arg)
					if tbl25.Bang then
						return
					end

					if fn45() then
						tbl25.Bang = true
						TogBang:SetValue(not arg)
						tbl25.Bang = false
						return
					end

					if not arg then
						local kpBang = options and options.KPBang

						if kpBang then
							kpBang.Toggled = false
						end

						if tbl18.BANG.IsActive then
							toggleIsActive(tbl18.BANG)
						end
					end
				end)

				TogTPose:OnChanged(function(invisSavedTPose)
					if tbl25.TPose then
						return
					end

					if fn45() then
						tbl25.TPose = true
						TogTPose:SetValue(not invisSavedTPose)
						tbl25.TPose = false
						return
					end

					if getgenv().InvisActive then
						getgenv()._invisSavedTPose = invisSavedTPose
						return
					end

					if invisSavedTPose and getgenv().FUCActive then
						tbl25.TPose = true
						TogTPose:SetValue(false)
						tbl25.TPose = false
						return
					end

					if not invisSavedTPose and tPoseActive then
						fn52()
					end
				end)

				RunService.Heartbeat:Connect(function()
					if not getgenv().InvisActive then
						return
					end
					local tposeA = tbl18.TPOSE_A
					local f2Key = tbl18.F2_KEY

					if tposeA.Track and tposeA.Track.IsPlaying then
						pcall(tposeA.Track.Stop, tposeA.Track, 0)
					end

					if f2Key.Track and f2Key.Track.IsPlaying then
						pcall(f2Key.Track.Stop, f2Key.Track, 0)
					end

					if tPoseActive then
						if connection6 then
							connection6:Disconnect()
							connection6 = nil
						end

						tPoseActive = false
					end
				end)

				task.spawn(function()
					while not v24.Unloaded do
						task.wait(0.05)

						if not v24.Unloaded then
							if tbl18.L_KEY.IsActive then
								local now2 = tick()

								while tbl18.L_KEY.IsActive and tick() - now2 < 1 and not v24.Unloaded do
									task.wait(0.05)
								end

								if tbl18.L_KEY.IsActive and not v24.Unloaded and toggles.TogHeadFloat.Value then
									fn70()
								end

								while tbl18.L_KEY.IsActive and not v24.Unloaded do
									task.wait(0.05)
								end

								fn71()
							end

							continue
						end

						break
					end

					fn71()
				end)

				local function fn72(arg)
					if arg == "MB1" then
						return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
					end

					if arg == "MB2" then
						return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
					end

					local ok, result = pcall(function()
						return UserInputService:IsKeyDown(Enum.KeyCode[arg])
					end)

					return ok and result or false
				end

				task.spawn(function()
					while not v24.Unloaded do
						task.wait()

						if not v24.Unloaded then
							local kpHeadFloat = options and options.KPHeadFloat
							kpHeadFloat = kpHeadFloat and kpHeadFloat.Value or "None"

							if kpHeadFloat ~= "None" and fn72(kpHeadFloat) and toggles.TogHeadFloat.Value then
								local now2 = tick()

								while fn72(kpHeadFloat) and toggles.TogHeadFloat.Value and not v24.Unloaded do
									if fn45() then
										task.wait(0.1)
										kpHeadFloat = options and options.KPHeadFloat and options.KPHeadFloat.Value or "None"
									else
										if tick() - now2 > 0.3 then
											toggleIsActive(tbl18.L_KEY)
											options.KPHeadFloat.Toggled = tbl18.L_KEY.IsActive
											task.wait(n14)
										end

										task.wait()
										kpHeadFloat = options and options.KPHeadFloat and options.KPHeadFloat.Value or "None"
									end
								end
							end

							continue
						end

						break
					end
				end)

				if tbl16[str8] then
					local fucActive = false
					clone = nil
					humanoidRootPart = nil
					v29 = nil
					local v47 = nil
					local n15 = 0
					local n16 = 1
					local connection22 = nil

					local function fn73(arg)
						if connection22 then
							connection22:Disconnect()
							connection22 = nil
						end

						if clone then
							pcall(function()
								clone:Destroy()
							end)

							clone = nil
						end

						humanoidRootPart = nil
						v29 = nil
						v47 = nil
						n15 = 0
						local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
						local humanoid = arg:FindFirstChildOfClass("Humanoid")
						local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
						if not humanoidRootPart2 or not humanoid or not animator then
							return
						end
						local archivable = arg.Archivable
						arg.Archivable = true
						clone = arg:Clone()
						arg.Archivable = archivable
						clone.Parent = workspace
						humanoidRootPart = clone:FindFirstChild("HumanoidRootPart")
						local humanoid2 = clone:FindFirstChildOfClass("Humanoid")
						local animator2 = humanoid2 and humanoid2:FindFirstChildOfClass("Animator")

						if humanoidRootPart then
							humanoidRootPart.Anchored = true
							humanoidRootPart.CFrame = CFrame.new(100000000, 100000000, 100000000)
						end

						local highlight = Instance.new("Highlight", clone)
						highlight.FillTransparency = 0.5
						highlight.OutlineTransparency = 0
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillColor = Color3.fromRGB(0, 255, 255)
						highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
						highlight.Adornee = clone

						for _, descendant in pairs(clone:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant ~= humanoidRootPart then
								descendant.CollisionGroup = "untouchable"
								descendant.Massless = true
								descendant.CanCollide = false
								descendant.CanTouch = false
								descendant.CanQuery = false
								descendant.Transparency = 0.5
							elseif descendant:IsA("Trail") or descendant:IsA("ParticleEmitter") then
								pcall(function()
									descendant:Destroy()
								end)
							elseif descendant:IsA("Script") or descendant:IsA("LocalScript") then
								descendant:Destroy()
							end
						end

						task.delay(0.1, function()
							if not animator2 or not clone then
								return
							end
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://18236605028"
							v29 = animator2:LoadAnimation(animation)
							v29.Priority = Enum.AnimationPriority.Action4
						end)

						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://100933578899042"
						v47 = animator:LoadAnimation(animation)
						animation.AnimationId = "rbxassetid://18236605028"
						v47.Priority = Enum.AnimationPriority.Action4

						connection22 = RunService.RenderStepped:Connect(function()
							if not clone or not clone.Parent then
								return
							end
							n15 += 1

							if v47 then
								if fucActive and not v47.IsPlaying then
									v47:Play()
									v47.Looped = true
								elseif v47.IsPlaying and (not fucActive or n15 % 1000 == 0) then
									v47:Stop()
								end

								if v47.Speed ~= n16 then
									v47:AdjustSpeed(n16)
								end
							end

							if v29 and humanoidRootPart then
								if fucActive then
									local character = localPlayer3.Character
									character = character and character:FindFirstChild("HumanoidRootPart")

									if character then
										humanoidRootPart.CFrame = character.CFrame
									end

									if not v29.IsPlaying then
										v29:Play()
										v29.Looped = true
									end
								else
									humanoidRootPart.CFrame = CFrame.new(100000000, 100000000, 100000000)

									if v29.IsPlaying then
										v29:Stop()
									end
								end

								if v29.Speed ~= n16 then
									v29:AdjustSpeed(n16)
								end
							end
						end)
					end

					if localPlayer3.Character then
						task.spawn(fn73, localPlayer3.Character)
					end

					localPlayer3.CharacterAdded:Connect(function(character)
						fucActive = false
						getgenv().FUCActive = false

						pcall(function()
							if options.KPFUC then
								options.KPFUC.Toggled = false
							end
						end)

						task.wait(1)
						fn73(character)
					end)

					local TogFUC = r6:AddToggle("TogFUC", { Text = "Encrypted Position", Default = false })
					local v48 = r6:AddDependencyBox()

					v48:AddSlider("FUCSpeed", {
						Text = "Encrypted Speed",
						Default = 1,
						Min = 0,
						Max = 10,
						Rounding = 1,
						Callback = function(arg)
							n16 = arg
						end,
					})

					v48:SetupDependencies({ { TogFUC, true } })
					r6:AddToggle("TogHandOffset", { Text = "Hand Offset", Default = false })

					TogFUC:AddKeyPicker("KPFUC", {
						Default = "K",
						Text = "Encrypted",
						SyncToggleState = false,
						Mode = "Toggle",
						Callback = function(arg)
							if tbl26.FC then
								return
							end

							if arg and not toggles.TogFUC.Value then
								RunService.RenderStepped:Wait()
								tbl26.FC = true
								options.KPFUC.Toggled = false
								options.KPFUC:DoClick()
								tbl26.FC = false
								return
							end

							if toggles.TogFUC.Value and not fn45() then
								if options.KPFUC.Toggled == fucActive then
									return
								end
								fucActive = not fucActive
								getgenv().FUCActive = fucActive

								if fucActive then
									fn69(false, true)
								else
									fn51(false)
								end
							end
						end,
					})

					TogFUC:OnChanged(function(arg)
						if tbl25.FUC then
							return
						end

						if fn45() then
							tbl25.FUC = true
							TogFUC:SetValue(not arg)
							tbl25.FUC = false
							return
						end

						if not arg and fucActive then
							if options.KPFUC then
								options.KPFUC.Toggled = false
							end

							fucActive = false
							getgenv().FUCActive = false
							fn51(false)
						end
					end)

					table.insert(tbl24, function()
						pcall(function()
							toggles.TogHeadFloat:SetValue(false)
						end)

						pcall(function()
							toggles.TogJerk:SetValue(false)
						end)

						pcall(function()
							toggles.TogBang:SetValue(false)
						end)

						pcall(function()
							toggles.TogTPose:SetValue(false)
						end)
					end)

					table.insert(tbl24, function()
						if fucActive then
							fucActive = false
							getgenv().FUCActive = false

							pcall(function()
								toggles.TogFUC:SetValue(false)
							end)
						end

						if clone then
							pcall(function()
								clone:Destroy()
							end)

							clone = nil
						end

						humanoidRootPart = nil
						v29 = nil
						v47 = nil
					end)
				end

				fn55 = function(arg)
					local character = arg.Character
					if not character then
						return false
					end
					local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart2 then
						return false
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if not humanoid or humanoid.Health <= 0 then
						return false
					end
					local position = humanoidRootPart2.Position
					if position.Y <= (getgenv().FPDH or workspace.FallenPartsDestroyHeight) + 100 then
						return false
					end

					if math.abs(position.X) > 10000 or math.abs(position.Z) > 10000 then
						return false
					end
					return true
				end

				local function fn73(arg)
					arg = arg and arg.Character
					arg = arg and arg:FindFirstChild("HumanoidRootPart")
					return arg and arg.Velocity.Magnitude >= 2000 or false
				end

				fn56 = function(arg)
					if not arg or not arg.Parent then
						return
					end
					local character = localPlayer3.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					local rootPart = humanoid and humanoid.RootPart
					local character2 = arg.Character
					if not character2 then
						return
					end
					local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
					local rootPart2 = humanoid2 and humanoid2.RootPart
					local head = character2:FindFirstChild("Head")
					local accessory = character2:FindFirstChildOfClass("Accessory")
					accessory = accessory and accessory:FindFirstChild("Handle")
					if not (character and humanoid and rootPart) then
						v24:Notify({ Title = fn39("Fling"), Content = "Your character is not ready.", Time = 4 })
						return
					end

					if humanoid2 and humanoid2.Sit then
						v24:Notify({ Title = fn39("Fling"), Content = arg.Name .. " is currently seated.", Time = 4 })
						return
					end

					if not character2:FindFirstChildWhichIsA("BasePart") then
						return
					end

					if rootPart.Velocity.Magnitude < 50 then
						local cFrame2 = rootPart.CFrame
						getgenv().OldPos = cFrame2
					end

					if head then
						pcall(function()
							workspace.CurrentCamera.CameraSubject = head
						end)
					elseif accessory then
						pcall(function()
							workspace.CurrentCamera.CameraSubject = accessory
						end)
					elseif humanoid2 then
						pcall(function()
							workspace.CurrentCamera.CameraSubject = humanoid2
						end)
					end

					local str9 = options.CmdFlingMethod and options.CmdFlingMethod.Value or "Void"
					local n15 = options.FlingSpeed and options.FlingSpeed.Value or 15
					local n16 = str9 == "Anti-Fling" and -0.75
					local n17

					if n16 then
						n17 = n16
					else
						n17 = str9 == "Normal" and 0 or 1
					end

					local v47 = flag11
					local n18 = 0

					local function fn74(arg2)
						return arg2 and arg2.Parent ~= nil
					end

					local function fn75(arg2)
						if not v47 then
							return
						end
						pcall(sethiddenproperty, rootPart, "PhysicsRepRootPart", nil)

						pcall(function()
							rootPart.AssemblyLinearVelocity = Vector3.zero
						end)

						pcall(function()
							rootPart.AssemblyAngularVelocity = Vector3.zero
						end)

						if arg2 and arg2.Parent then
							pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", nil)

							pcall(function()
								arg2.AssemblyLinearVelocity = Vector3.zero
							end)

							pcall(function()
								arg2.AssemblyAngularVelocity = Vector3.zero
							end)
						end
					end

					local function fn76(arg2)
						if not fn74(arg2) then
							return
						end
						local position = arg2.Position
						local n19 = 0

						pcall(function()
							n19 = arg2.Velocity.Magnitude
						end)

						n18 += n15
						local n20 = CFrame.new(0, n17, 0) * CFrame.Angles(1.5707963267948966, 0, math.rad(n18))
						local moveDirection = humanoid2 and humanoid2.MoveDirection or Vector3.zero

						pcall(function()
							if v47 then
								local cFrame2 = CFrame.new(position) * n20
								sethiddenproperty(rootPart, "PhysicsRepRootPart", arg2)
								sethiddenproperty(arg2, "PhysicsRepRootPart", rootPart)
								rootPart.CFrame = cFrame2
							else
								local n21 = moveDirection * n19 / 1.25
								local cFrame2 = CFrame.new(position) * n20 + n21
								rootPart.CFrame = cFrame2
								character:SetPrimaryPartCFrame(cFrame2)
							end

							rootPart.Velocity = Vector3.new(0, -9e9, 0)
							rootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
						end)
					end

					local function fn77(arg2)
						local now2 = tick()
						local n19 = options.FlingTimeout and options.FlingTimeout.Value or 3

						pcall(function()
							humanoid2.PlatformStand = true
						end)

						while fn74(arg2) do
							if not (not humanoid2 or not humanoid2.Parent) then
								fn76(arg2)
								task.wait()
								if not (now2 + n19 < tick() or not flag14 or not fn74(arg2)) then
									continue
								end
							end

							break
						end

						pcall(function()
							humanoid2.PlatformStand = false
						end)

						pcall(function()
							humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
						end)

						fn75(arg2)
					end

					workspace.FallenPartsDestroyHeight = (0/0)
					local bodyVelocity = Instance.new("BodyVelocity")
					bodyVelocity.Parent = rootPart
					bodyVelocity.Velocity = Vector3.new(0, -9e12, 0)
					bodyVelocity.MaxForce = Vector3.new(0, -9e12, 0)
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

					if rootPart2 and fn74(rootPart2) then
						pcall(fn77, rootPart2)
					elseif head and fn74(head) then
						pcall(fn77, head)
					else
						if not (accessory and fn74(accessory)) then
							v24:Notify({ Title = fn39("Fling"), Content = arg.Name .. " has no valid parts to target.", Time = 4 })
							bodyVelocity:Destroy()
							humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
							return
						end

						pcall(fn77, accessory)
					end

					pcall(function()
						bodyVelocity:Destroy()
					end)

					pcall(function()
						humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
					end)

					pcall(function()
						rootPart.Velocity = Vector3.new()
					end)

					pcall(function()
						rootPart.RotVelocity = Vector3.new()
					end)

					pcall(function()
						workspace.CurrentCamera.CameraSubject = humanoid
					end)

					if getgenv().OldPos then
						local now2 = tick()

						while true do
							pcall(function()
								rootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
								character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
								humanoid:ChangeState("GettingUp")

								for _, child in pairs(character:GetChildren()) do
									if child:IsA("BasePart") then
										child.Velocity = Vector3.new()
										child.RotVelocity = Vector3.new()
									end
								end
							end)

							task.wait()
							if not ((rootPart.Position - getgenv().OldPos.p).Magnitude < 25 or tick() - now2 > 3) then
								continue
							end
							break
						end

						pcall(function()
							rootPart.Velocity = Vector3.new()
						end)

						pcall(function()
							rootPart.RotVelocity = Vector3.new()
						end)
					end
				end

				fn18 = function()
				end

				local function fn74()
					if not v42 then
						return
					end
					local v47 = fn62()
					flingPlayerCache = v47
					local tbl31 = {}

					for k in pairs(tbl22) do
						tbl31[k] = true
					end

					pcall(function()
						(nil):SetValues(v47)
						;(nil):SetValue(tbl31)
					end)
				end

				connection16 = Players.PlayerAdded:Connect(function(player)
					task.wait(0.5)
					pcall(fn74)
					local flag18 = flag14

					if flag14 then
						flag18 = str4 == "all" or str4 == "others"
					end

					if flag18 and player ~= localPlayer3 then
						task.spawn(function()
							task.wait(1)

							if flag14 and (str4 == "all" or str4 == "others") and fn55(player) then
								tbl22[fn46(player)] = player
								pcall(fn74)
							end
						end)
					end
				end)

				connection17 = Players.PlayerRemoving:Connect(function()
					task.wait(0.1)
					pcall(fn74)
				end)

				local function fn75()
					local n15 = 0

					for k in pairs(tbl22) do
						n15 += 1
					end

					return n15
				end

				fn57 = function()
					if flag14 then
						return
					end

					if fn75() == 0 then
						v24:Notify({ Title = fn39("Fling"), Content = "No targets selected.", Time = 4 })
						return
					end
					flag14 = true

					if localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid") then
						connection12 = localPlayer3.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
							if flag14 then
								flag14 = false
								fn50()

								if connection12 then
									connection12:Disconnect()
									connection12 = nil
								end
							end
						end)
					end

					task.spawn(function()
						local connection22 = Players.PlayerRemoving:Connect(function(player)
							local v47 = fn46(player)

							if tbl22[v47] then
								tbl22[v47] = nil

								pcall(function()
									local cameraSubject = workspace.CurrentCamera.CameraSubject

									if cameraSubject and player.Character and cameraSubject:IsDescendantOf(player.Character) then
										fn48()
										flag15 = false

										pcall(function()
											workspace.CurrentCamera.CameraSubject = localPlayer3.Character
										end)
									end
								end)

								if next(tbl22) == nil then
									flag14 = false
								end
							end
						end)

						local tbl31 = {}
						local n15 = 0

						local function fn76()
							local tbl32 = {}

							for _, v47 in ipairs(tbl31) do
								tbl32[v47] = true
							end

							for k in pairs(tbl22) do
								if not tbl32[k] then
									table.insert(tbl31, k)
								end
							end

							for i = #tbl31, 1, -1 do
								if not tbl22[tbl31[i]] then
									table.remove(tbl31, i)

									if i <= n15 then
										n15 = math.max(0, n15 - 1)
									end
								end
							end
						end

						local function fn77()
							tbl31 = {}
							n15 = 0
						end

						local function fn78(arg)
							fn76()
							local n16 = #tbl31
							if n16 == 0 then
								return nil
							end

							for i = 1, n16 do
								local n17 = (n15 + i - 1) % n16 + 1
								local v47 = arg[tbl31[n17]]
								if v47 and fn55(v47) and not fn73(v47) then
									n15 = n17
									return v47
								end
							end

							return nil
						end

						local v47 = nil

						while flag14 do
							local tbl32 = {}

							for k, v48 in pairs(tbl22) do
								if v48 and v48.Parent then
									tbl32[k] = v48
								else
									tbl22[k] = nil
								end
							end

							local v48 = fn78(tbl32)

							if next(tbl32) == nil then
								if flag15 and not flag16 then
									fn50()
									flag15 = false
								end

								flag14 = false
								break
							elseif not v48 then
								if flag15 and not flag16 then
									fn50()
									flag15 = false
									v47 = nil
								end

								task.wait(0.2)
							else
								if not flag16 and v47 ~= v48 then
									fn49(v48)
									flag15 = true
									v47 = v48
								end

								if not tbl23["Touch Fling"] then
									fn43()
								end

								local ok, result = pcall(fn56, v48)

								if not ok then
									warn("[Revenant Fling] PhantaFling error: " .. tostring(result))
								end

								if not tbl23["Touch Fling"] then
									fn44()
								end

								if str4 == nil then
									tbl22[fn46(v48)] = nil
								end
							end
						end

						fn77()
						flag15 = false
						flag16 = false
						fn50()

						if connection12 then
							connection12:Disconnect()
							connection12 = nil
						end

						connection22:Disconnect()
					end)
				end

				fn58 = function()
					if not flag14 then
						return
					end
					flag14 = false

					if connection12 then
						connection12:Disconnect()
						connection12 = nil
					end

					pcall(function()
						for _, v47 in pairs(tbl22) do
							if v47 and v47.Character then
								local humanoidRootPart2 = v47.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 then
									pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)

									pcall(function()
										humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
									end)

									pcall(function()
										humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
									end)

									pcall(function()
										humanoidRootPart2.Velocity = Vector3.zero
									end)

									pcall(function()
										humanoidRootPart2.RotVelocity = Vector3.zero
									end)
								end
							end
						end
					end)

					fn50()
				end

				localPlayer3.CharacterAdded:Connect(function()
					if tbl23 and tbl23["Touch Fling"] and fn75() > 0 then
						task.wait(1.5)

						if tbl23["Touch Fling"] and not flag14 then
							fn57()
						end
					end
				end)
			end

			local fn59

			fn59 = function()
			end

			do
				local flag17 = false
				local connection18 = nil
				local tbl27

				tbl27 = {
					conns = {},
					noclip = function(arg)
						if not arg then
							return
						end

						for _, descendant in pairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.CanCollide then
								descendant.CanCollide = false
							end
						end

						local playerFromCharacter = Players:GetPlayerFromCharacter(arg)
						if not playerFromCharacter then
							return
						end
						local str9 = "d" .. playerFromCharacter.UserId
						local v43 = tbl27.conns[str9]

						if v43 then
							v43:Disconnect()
						end

						tbl27.conns[str9] = arg.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("BasePart") and descendant.CanCollide then
								descendant.CanCollide = false
							end
						end)
					end,
					stop = function()
						for _, conn in pairs(tbl27.conns) do
							pcall(conn.Disconnect, conn)
						end

						table.clear(tbl27.conns)
					end,
				}

				getgenv()._revenantAntiFlingBuild = function(arg)
					arg:AddToggle("AntiFlingToggle", {
						Text = "Anti-Fling",
						Default = false,
						Callback = function(arg2)
							if arg2 then
								if flag17 then
									return
								end
								flag17 = true
								local n15 = 0

								connection18 = RunService.Stepped:Connect(function(time_, deltaTime)
									n15 += deltaTime
									if n15 < 0.5 then
										return
									end
									n15 = 0

									for _, player in pairs(Players:GetPlayers()) do
										if player ~= localPlayer3 and player.Character then
											tbl27.noclip(player.Character)
										end
									end
								end)
							else
								flag17 = false

								if connection18 then
									connection18:Disconnect()
									connection18 = nil
								end

								tbl27.stop()
							end
						end,
					})

					table.insert(tbl24, function()
						flag17 = false

						if connection18 then
							connection18:Disconnect()
							connection18 = nil
						end

						tbl27.stop()

						pcall(function()
							toggles.AntiFlingToggle:SetValue(false)
						end)
					end)
				end
			end

			if tbl16[str8] then
				local flag17 = false
				local tbl27 = {}
				local tbl28 = {}
				local tbl29 = {}
				local obj2 = setmetatable({}, { __mode = "k" })

				local function fn60()
				end

				local function fn61(arg)
					return arg:IsA("Accessory") and arg.Name == "Counter"
				end

				local tbl30 = {}
				local tbl31 = {}

				local function fn62(arg)
					tbl28[arg] = nil
					tbl30[arg] = nil
				end

				local TweenService = game:GetService("TweenService")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")

				local function fn63(arg, arg2, arg3)
					if tbl28[arg2] then
						return
					end
					tbl28[arg2] = true
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart2 then
						return
					end

					task.spawn(function()
						local sound = Instance.new("Sound")
						sound.SoundId = "rbxassetid://6476791205"
						sound.Volume = 10
						sound.Parent = humanoidRootPart2
						sound:Play()

						local ok, result = pcall(function()
							return ReplicatedStorage:WaitForChild("Resources", 5):WaitForChild("LegacyReplication", 5):WaitForChild("Menacing", 5)
						end)

						if not ok or not result then
							return
						end
						local tbl32 = {}

						for i = 1, 10 do
							local v43 = Random.new():NextNumber(0.9, 1.1)
							local clone2 = result:Clone()
							clone2.Enabled = true
							clone2.Size = UDim2.new(v43, 0, v43, 0)
							local v44 = Random.new():NextNumber(-4, 4)
							local n15 = math.random(-4, 4)
							clone2.StudsOffsetWorldSpace = Vector3.new(v44, 0, n15)
							clone2.Parent = humanoidRootPart2
							table.insert(tbl32, clone2)

							task.delay(i, function()
								if clone2.Parent then
									local v45 = table.find(tbl32, clone2)

									if v45 then
										table.remove(tbl32, v45)
									end

									local tbl33 = { StudsOffsetWorldSpace = clone2.StudsOffsetWorldSpace - Vector3.new(0, 10, 0) }
									TweenService:Create(clone2, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), tbl33):Play()
									TweenService:Create(clone2.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 1 }):Play()
								end
							end)
						end

						local tbl33 = {}
						local v43

						while task.wait() do
							for _, v44 in pairs(tbl32) do
								if not tbl33[v44] then
									tbl33[v44] = v44.StudsOffsetWorldSpace
								end

								local v45 = Random.new():NextNumber(-0.04, 0.04)
								v44.StudsOffsetWorldSpace = tbl33[v44] + Vector3.new(v45, v45, v45)
							end

							if not (arg3 and arg3.Parent) then
								local v44 = tbl32

								for _, v45 in pairs(v44) do
									TweenService:Create(v45, TweenInfo.new(Random.new():NextNumber(2, 3), Enum.EasingStyle.Back, Enum.EasingDirection.In), {
										StudsOffsetWorldSpace = (tbl33[v45] or v45.StudsOffsetWorldSpace) - Vector3.new(0, 10, 0),
									}):Play()

									TweenService:Create(v45.ImageLabel, TweenInfo.new(v43, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 1 }):Play()
								end

								task.delay(3, function()
									for _, v45 in pairs(v44) do
										pcall(function()
											v45:Destroy()
										end)
									end
								end)

								return
							end
						end
					end)
				end

				local function fn64(arg, arg2)
					if not arg or not arg2 or arg2 == localPlayer3 then
						return
					end

					if tbl31[arg] then
						return
					end
					tbl31[arg] = true

					for _, child in pairs(arg:GetChildren()) do
						if fn61(child) then
							if flag17 and not tbl30[arg2] then
								MoveNotify(arg2, "Death Counter")
								tbl30[arg2] = true
								fn63(arg, arg2, child)
							end

							child.AncestryChanged:Connect(function()
								if not child.Parent then
									fn62(arg2)
								end
							end)
						end
					end

					local connection18 = arg.ChildAdded:Connect(function(child)
						if not flag17 then
							return
						end

						if not fn61(child) then
							return
						end
						MoveNotify(arg2, "Death Counter")
						if tbl30[arg2] then
							return
						end
						tbl30[arg2] = true

						task.defer(function()
							fn63(arg, arg2, child)
						end)

						child.AncestryChanged:Connect(function()
							if not child.Parent then
								fn62(arg2)
							end
						end)
					end)

					table.insert(tbl27, connection18)
				end

				local function fn65(arg)
					if arg == localPlayer3 then
						return
					end

					if arg.Character then
						task.spawn(fn64, arg.Character, arg)
					end

					local connection18 = arg.CharacterAdded:Connect(function(character)
						if not flag17 then
							return
						end
						fn62(arg)
						task.wait(0.1)
						fn64(character, arg)
					end)

					table.insert(tbl27, connection18)
				end

				table.insert(tbl24, function()
					flag17 = false

					for _, v43 in pairs(tbl27) do
						pcall(v43.Disconnect, v43)
					end

					tbl27 = {}
					tbl28 = {}
					tbl30 = {}
					tbl31 = {}

					pcall(function()
						toggles.ShowDeathCounter:SetValue(false)
					end)
				end)

				local connection18 = nil

				local function fn66()
					return options.AntiMoves_Saitama and _rawget(options.AntiMoves_Saitama.Value, "Anti Death Counter")
				end

				local function fn67()
					local value = options.AntiDCWaitBeforeKillDD and options.AntiDCWaitBeforeKillDD.Value
					if value == "3s - Fakeout" then
						return 3
					end

					if value == "5s - Long Fakeout" then
						return 5
					end
					return 0
				end

				local function fn68(arg)
					local rbxGeneral = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")

					if rbxGeneral then
						rbxGeneral:SendAsync(arg)
					end
				end

				local tbl32 = {
					"Ah yes...My Anti Death Counter technique. One i haven't used since the Heian era.",
					"You dare try and death counter me? I'll allow it once. There won't be a second time.",
					"Know your place, fool.",
					"Let's have a contest of firepower. Arm yourself.",
					"I fought sweats and noobs a thousand years ago, your still one of the better ones. Stand Proud, You are strong.",
					"Stand Proud, You are strong.",
					"If i wasn't a scripter, that would have eliminated me on the first blow.",
					"You've done it now, brat!",
					"I knew it. You're similar to all those brats who tried to death counter me.",
					"You follow my movement, and attack with death counter. It started happening after your ultimate activated.",
					"The activation of the strongest' ultimate and death counter both represent perfect cycles of chaos and peace.",
					"Your ability as i've seen....Is to death counter anything and everything. It's the ultimate counter!",
					"You might have defeated me if i wasn't a scripter back then.",
					"Domain Expansion: Shadow Realm",
					"Fuga (Open)",
				}

				local tbl33 = {
					"I alone, am The Honoured One.",
					"The world just feels so wonderful right now..",
					"Nah, I'd Win.",
					"If i would get hit by death counter, it would cause me a little trouble, but i would win.",
					"Domain Expansion: Infinite Void",
					"式: アンチデスカウンター (Imaginary Technique: Anti Death Counter)",
					"deathcountererhaha tried to split me in half, but Gojo always wins.",
					"YOU LOOK UGLIER THAN EVER, deathcountererhaha!!",
				}

				local tbl34 = {
					{ Quote = "It took me a while..", WaitTime = 2 },
					{
						Quote = "But I finally grasped it on the verge of death deathcountererhaha..",
						WaitTime = 2,
					},
					{ Quote = "The true essence of cursed energy..", WaitTime = 2 },
					{ Quote = "REVERSE CURSED TECHNIQUE!!", WaitTime = 0 },
				}

				local tbl35 = {
					"deathcountererhaha tried.",
					"deathcountererhaha thinks he can win with death counter.",
					"deathcountererhaha death countered me. But i refused.",
					"deathcountererhaha is an idiot for trying to death counter me.",
					"deathcountererhaha tried to death counter me.",
					"did you really think you could kill me deathcountererhaha....?",
					"I'm not gonna let that slide, deathcountererhaha.",
				}

				local tbl36 = {
					";kill deathcountererhaha",
					";respawn deathcountererhaha",
					";kick deathcountererhaha",
					";ban deathcountererhaha",
					";re deathcountererhaha",
				}

				local function fn69(arg, arg2)
					local str9 = options.AntiDCQuotesDD and options.AntiDCQuotesDD.Value or "No Quotes"
					if str9 == "No Quotes" then
						return
					end
					local str10 = arg2 and arg2 ~= "" and arg2 or "[placeholder]"

					if str9 == "Sukuna Quotes" then
						fn68(tbl32[math.random(#tbl32)])
					elseif str9 == "Gojo Quotes" then
						if math.random(2) == 1 then
							fn68(tbl33[math.random(#tbl33)]:gsub("deathcountererhaha", str10):gsub("DEATHCOUNTERERHAHA", str10:upper()))
						else
							task.spawn(function()
								for _, v43 in ipairs(tbl34) do
									fn68(v43.Quote:gsub("deathcountererhaha", str10))

									if v43.WaitTime > 0 then
										task.wait(v43.WaitTime)
									end
								end
							end)
						end

						task.spawn(function()
							local character = localPlayer3.Character
							if not character then
								return
							end
							local humanoid = character:FindFirstChildOfClass("Humanoid")
							if not humanoid then
								return
							end
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://17275798442"
							local v43 = humanoid:LoadAnimation(animation)
							v43:Play()
							v43.TimePosition = 2.5

							repeat
								task.wait()
							until v43.TimePosition >= 3

							local hipHeight = 0

							for i = 1, 150 do
								hipHeight += 0.1
								humanoid.HipHeight = hipHeight
								task.wait()
							end

							repeat
								task.wait()
							until v43.TimePosition >= 6.5

							v43:AdjustSpeed(0.2)
							task.wait(7)
							v43:Stop(0.6)
							humanoid.HipHeight = 0
						end)
					elseif str9 == "Name Quotes" then
						fn68(string.gsub(tbl35[math.random(#tbl35)], "deathcountererhaha", str10))
					elseif str9 == "Admin Quotes" then
						fn68(string.gsub(tbl36[math.random(#tbl36)], "deathcountererhaha", str10))
					elseif str9 == "Random" then
						local tbl37 = { "Sukuna Quotes", "Gojo Quotes", "Name Quotes", "Admin Quotes" }
						local v43 = tbl37[math.random(#tbl37)]

						if v43 == "Sukuna Quotes" then
							fn68(tbl32[math.random(#tbl32)])
						elseif v43 == "Gojo Quotes" then
							fn68(string.gsub(tbl33[math.random(#tbl33)], "deathcountererhaha", str10))
						elseif v43 == "Name Quotes" then
							fn68(string.gsub(tbl35[math.random(#tbl35)], "deathcountererhaha", str10))
						elseif v43 == "Admin Quotes" then
							fn68(string.gsub(tbl36[math.random(#tbl36)], "deathcountererhaha", str10))
						end
					elseif str9 == "Sans Quotes" then
						local tbl37 = {
							DeathCounterQuote1 = {
								"✱ looks like that guy who death countered me looked pretty frustrated.",
								"✱ i mustn't gossip, i would be angry too.",
								"✱ yeah... maybe.",
							},
							DeathCounterQuote2 = {
								"✱ hmm. their expression...",
								"✱ that was the expression of someone who's raged twice in a row.",
								"✱ suffice to say, they looked really... unsatisfied.",
								"✱ all right.",
								"✱ how 'bout i make it a third?",
							},
							DeathCounterQuote3 = {
								"✱ hmm. their expression...",
								"✱ that was the expression of someone who's died thrice in a row.",
								"✱ . . .",
								"✱ guess you could say... i turned that smile upside down.",
								"✱ whats the punchline?",
								"✱ i don't know.",
							},
							DeathCounterQuote4 = {
								"✱ hmm. their expression...",
								"✱ that's the expression of someone who's unwilling to give up.",
								"✱ . . .i can't count after 4.",
								"✱ me and you might be surprised to see more dialogue.",
								"✱ don't worry. im sure it ends somewhere.",
							},
							DeathCounterQuote5 = {
								"✱ hmm. their expression...",
								"✱ that's the expression of someone who's unwilling to give up.",
								"✱ did i get you? did you think that the dialogue was gonna repeat?",
								"✱ don't worry. its gonna repeat soon.",
								"✱ over and over, until everything is reset.",
							},
							DeathCounterQuote6 = {
								"✱ our reports showed a massive sweat in the roblox continuum.",
								"✱ players dashing left and right, comboing and dying...",
								"✱ until suddenly, everything ends.",
							},
							DeathCounterQuote7 = {
								"✱ heh heh heh...",
								"✱ you think it's the devs fault, isn't it?",
								"✱ you can't understand how this feels.",
							},
							DeathCounterQuote8 = {
								"✱ knowing that one day, without any warning...",
								"✱ it's all going to be updated.",
								"✱ look. i gave up trying to go back to rank 1 a long time ago.",
							},
							DeathCounterQuote9 = {
								"✱ getting to the leaderboard doesn't really appeal anymore, either.",
								"✱ cause even if i do...",
								"✱ we'll just end up right back here, without any memory of it, right?",
							},
							DeathCounterQuote10 = {
								"✱ getting to the leaderboard doesn't really appeal anymore, either.",
								"✱ cause even if i do...",
								"✱ we'll just end up right back here, without any memory of it, right?",
							},
							DeathCounterQuote11 = {
								"✱ you really like trying to punch me, huh?",
								"✱ i know you didn't answer me before, but...",
								"✱ let's just be friends alright?",
								"✱ . . .",
								"✱ sike. if we're truly friends...",
								"✱ y o u w o n t c o m e b a c k",
							},
							DeathCounterQuote12 = {
								"✱ friendship...",
								"✱ it's really great right?",
								"✱ cmon, just stop death countering me.",
								"✱ really? you're trusting me?",
								"✱ c'mere, pal. sike, geeettttttt dunked on!!!",
							},
							DeathCounterQuote13 = { "✱ . . .", "✱ ready?" },
						}

						local function fn70(arg3)
							return tbl37["DeathCounterQuote" .. tostring(arg3)]
						end

						if not arg then
							fn68("* you're just a dirty ragequitter, aren't you?")
							return
						end
						local attribute = arg:GetAttribute("Saness")

						if attribute and attribute ~= 13 then
							local v43 = fn70(attribute)

							if v43 then
								for _, v44 in ipairs(v43) do
									fn68(v44)
									task.wait(3)
								end
							end

							arg:SetAttribute("Saness", attribute + 1)
						elseif not attribute then
							fn68("* what? you think i'm just gonna stand there and take it?")
							task.wait(3)
							fn68("* welp. this is why i never make promises.")
							task.wait(5)
							arg:SetAttribute("Saness", 1)
						end
					end
				end

				local function fn70(cFrame2)
					local character = localPlayer3.Character
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
					if not (character and humanoidRootPart2) then
						return
					end

					task.spawn(function()
						RunService.RenderStepped:Once(function()
							humanoidRootPart2.Velocity = Vector3.new()
							RunService.Heartbeat:Wait()
							humanoidRootPart2.Velocity = Vector3.new()
						end)

						RunService.Heartbeat:Once(function()
							humanoidRootPart2.CFrame = cFrame2
						end)
					end)
				end

				local function fn71()
					if getgenv()._RevenantFixCam then
						getgenv()._RevenantFixCam()
						return
					end
					local character = localPlayer3.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if character and humanoid and workspace.CurrentCamera then
						local cFrame2 = workspace.CurrentCamera.CFrame
						workspace.CurrentCamera:Destroy()
						local camera = Instance.new("Camera", workspace)
						camera.CameraType = Enum.CameraType.Custom
						camera.CameraSubject = humanoid
						camera.CFrame = cFrame2
						localPlayer3.CameraMode = Enum.CameraMode.Classic
						local head = character:FindFirstChild("Head")

						if head then
							head.Anchored = false
						end
					end
				end

				local function fn72(arg)
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					if not arg then
						return
					end

					connection18 = arg.AnimationPlayed:Connect(function(arg2)
						if not fn66() then
							return
						end

						if not arg2.Animation.AnimationId:match("11343250001") then
							return
						end

						task.spawn(function()
							local v43 = fn67()
							local flag18 = v43 <= 0

							if v43 <= 0 then
								pcall(function()
									arg2:Stop()
								end)
							end

							task.spawn(fn71)
							local character = localPlayer3.Character
							character:WaitForChild("AbsoluteImmortal", 1)
							local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
							local cFrame2 = humanoidRootPart2.CFrame
							local v44 = nil

							for _, player in pairs(Players:GetPlayers()) do
								if player ~= localPlayer3 then
									local character2 = player.Character
									local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
									local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")

									if character2 and humanoidRootPart3 and humanoid then
										for _, v45 in pairs(humanoid:GetPlayingAnimationTracks()) do
											if v45.Animation.AnimationId:match("11343318134") and (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude <= 15 then
												v44 = player
											end
										end
									end
								end
							end

							local character2, v45

							if v44 then
								character2 = v44.Character
								character2 = character2 and character2:FindFirstChildOfClass("Humanoid")
								v45 = fn46(v44)
								v24:Notify({ Title = fn39("Death Counter"), Content = v45 .. " used Death Counter on you.", Time = 5 })
							else
								local model = Instance.new("Model")
								local humanoid = Instance.new("Humanoid", model)
								humanoid.Health = 100
								character2 = humanoid
								v45 = nil

								task.delay(v43 + 2, function()
									humanoid.Health = 0
								end)

								v24:Notify({ Title = fn39("Death Counter"), Content = "Death Counter attempt detected.", Time = 5 })
							end

							if v43 > 0 then
								task.wait(v43)
								if not fn66() then
									return
								end
								character = localPlayer3.Character
								local humanoidRootPart3 = character and character:FindFirstChild("HumanoidRootPart")
								if not (character and humanoidRootPart3) then
									return
								end
							end

							local cameraSubject = workspace.CurrentCamera and workspace.CurrentCamera.CameraSubject

							if workspace.CurrentCamera then
								workspace.CurrentCamera.CameraSubject = nil
							end

							local humanoid = character:FindFirstChildOfClass("Humanoid")
							local n15 = CFrame.new(0, -10000, 0) * CFrame.Angles(1.5707963267948966, 0, 0)
							local now2 = tick()

							while true do
								fn70(n15)

								if v43 > 0 and not flag18 then
									pcall(function()
										arg2:Stop()
									end)

									flag18 = true
								end

								RunService.RenderStepped:Wait()
								if not (character2 and character2.Health <= 0 or humanoid and humanoid.Health <= 0 or tick() >= now2 + 10) then
									continue
								end
								break
							end

							if workspace.CurrentCamera then
								workspace.CurrentCamera.CameraSubject = cameraSubject
							end

							fn70(cFrame2)

							task.spawn(function()
								fn69(v44, v45)
							end)

							task.wait(1)
							local character3 = localPlayer3.Character

							if character3 then
								local freeze = character3:FindFirstChild("Freeze")
								local noRotate = character3:FindFirstChild("NoRotate")

								if freeze then
									freeze:Destroy()
								end

								if noRotate then
									noRotate:Destroy()
								end
							end

							task.spawn(fn71)
						end)
					end)
				end

				local function fn73(arg)
					if not arg then
						return
					end
					local humanoid = arg:FindFirstChildOfClass("Humanoid")

					if humanoid then
						fn72(humanoid)
					else
						task.spawn(function()
							local humanoid2 = arg:WaitForChild("Humanoid", 5)

							if humanoid2 and fn66() then
								fn72(humanoid2)
							end
						end)
					end
				end

				fn73(localPlayer3.Character)

				local connection19 = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(0.1)
					fn73(character)
				end)

				table.insert(tbl24, function()
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					pcall(function()
						options.AntiDCQuotesDD:SetValue("No Quotes")
					end)

					pcall(function()
						options.AntiDCWaitBeforeKillDD:SetValue("No Wait - Near Instant And Prevents Tabbing")
					end)
				end)

				local v43 = nil
				game:GetService("StarterGui")

				table.insert(tbl24, function()
					if v43 then
						v43:Disconnect()
						v43 = nil
					end
				end)

				v37:AddButton({
					Text = "Toggle All On",
					Func = function()
						local v44, v45, v46 = pairs(toggles)

						while true do
							local v47, v48 = v44(v45, v46)

							if v47 == nil then
								break
							elseif v47:find("^AntiMoves_") and v48.Type == "Toggle" then
								v48:SetValue(true)
								v46 = v47
							else
								v46 = v47
							end
						end

						local v47, v48, v49 = pairs(options)

						while true do
							local v50, v51 = v47(v48, v49)

							if v50 == nil then
								break
							elseif v50:find("^AntiMoves_") and v51.Type == "Dropdown" then
								local v52, v53, v54 = pairs(v51.Values)
								local tbl37 = {}

								while true do
									local v55, v56 = v52(v53, v54)

									if v55 == nil then
										break
									else
										tbl37[v56] = true
										v54 = v55
									end
								end

								v51:SetValue(tbl37)
								v49 = v50
							else
								v49 = v50
							end
						end
					end,
				}):AddButton({
					Text = "Toggle All Off",
					Func = function()
						local v44, v45, v46 = pairs(toggles)

						while true do
							local v47, v48 = v44(v45, v46)

							if v47 == nil then
								break
							elseif v47:find("^AntiMoves_") and v48.Type == "Toggle" then
								v48:SetValue(false)
								v46 = v47
							else
								v46 = v47
							end
						end

						local v47, v48, v49 = pairs(options)

						while true do
							local v50, v51 = v47(v48, v49)

							if v50 == nil then
								break
							elseif v50:find("^AntiMoves_") and v51.Type == "Dropdown" then
								v51:SetValue({})
								v49 = v50
							else
								v49 = v50
							end
						end
					end,
				})

				v37:AddButton({
					Text = "The Necessary",
					Func = function()
						local tbl37 = {
							AntiMoves_Saitama = { "Anti Table Flip", "Anti Serious Punch", "Anti Omni Directional Punch", "Anti Death Counter" },
							AntiMoves_Garou = { "Anti Rampage", "Anti The Final Hunt", "Anti Final Hunt Finisher" },
							AntiMoves_MonsterForm = { "Anti Limit Breaker", "Anti God Slayer", "Anti Hunter's Mark" },
							AntiMoves_CosmicForm = { "Anti Singularity", "Anti Nuclear Fission", "Anti Gamma Ray Burst" },
							AntiMoves_Genos = { "Anti Speedblitz Dropkick", "Anti Incinerate", "Anti Flamewave Cannon" },
							AntiMoves_Sonic = { "Anti Twinblade Rush", "Anti Fourfold Flashstrike", "Anti Carnage" },
							AntiMoves_MetalBat = { "Anti Strength Difference", "Anti Death Blow" },
							AntiMoves_AtomicSamurai = { "Anti Scorching Blade", "Anti Sunset", "Anti Atomic Slash", "Anti Atomic Slash Finisher" },
							AntiMoves_Tatsumaki = { "Anti Berserk", "Anti Terrible Tornado", "Anti Crushing Pull" },
							AntiMoves_Suiryu = { "Anti Last Breath", "Anti Earth Splitting Strike" },
							AntiMoves_TechProdigy = { "Anti Conquest", "Anti Railgun" },
						}

						for k, option in pairs(options) do
							if k:find("^AntiMoves_") and option.Type == "Dropdown" then
								local tbl38 = {}
								local v44 = ipairs
								local tbl39 = tbl37[k] or {}

								for _, v45 in v44(tbl39) do
									tbl38[v45] = true
								end

								option:SetValue(tbl38)
							end
						end

						pcall(function()
							toggles.AntiMoves_Trashcan:SetValue(false)
						end)
					end,
				})

				if getgenv()._revenantAntiFlingBuild then
					getgenv()._revenantAntiFlingBuild(v37)
					getgenv()._revenantAntiFlingBuild = nil
				end

				local tbl37 = {}
				local flag18 = false

				local tbl38 = {
					Head = true,
					UpperTorso = true,
					LowerTorso = true,
					Torso = true,
					LeftUpperArm = true,
					LeftLowerArm = true,
					LeftHand = true,
					RightUpperArm = true,
					RightLowerArm = true,
					RightHand = true,
					LeftUpperLeg = true,
					LeftLowerLeg = true,
					LeftFoot = true,
					RightUpperLeg = true,
					RightLowerLeg = true,
					RightFoot = true,
					["Left Arm"] = true,
					["Right Arm"] = true,
					["Left Leg"] = true,
					["Right Leg"] = true,
				}

				local function fn74()
					flag18 = false

					for _, v44 in ipairs(tbl37) do
						pcall(v44.Disconnect, v44)
					end

					tbl37 = {}
				end

				local function fn75()
					local tbl39 = {}

					for _, v44 in ipairs(tbl37) do
						if v44.Connected then
							table.insert(tbl39, v44)
						end
					end

					tbl37 = tbl39
				end

				local function fn76(arg)
					for _, child in pairs(arg:GetChildren()) do
						if child:IsA("BasePart") and tbl38[child.Name] then
							child.Transparency = 0.5
						elseif child:IsA("Accessory") then
							local handle = child:FindFirstChild("Handle")

							if handle and handle:IsA("BasePart") then
								handle.Transparency = 0.5
							end
						end
					end
				end

				local function fn77(arg)
					for _, child in pairs(arg:GetChildren()) do
						if child:IsA("BasePart") and tbl38[child.Name] then
							child.Transparency = 0
						elseif child:IsA("Accessory") then
							local handle = child:FindFirstChild("Handle")

							if handle and handle:IsA("BasePart") then
								handle.Transparency = 0
							end
						end
					end
				end

				local tbl39 = {
					"18182425133",
					"136370737633649",
					"18462892217",
					"74844382738532",
					"77727115892579",
					"107114358965793",
					"71181015443030",
					"76020797916551",
				}

				local function fn78(arg, arg2)
					local animationId = arg.Animation and arg.Animation.AnimationId or ""

					for _, v44 in ipairs(tbl39) do
						if animationId:match(v44) and arg.Speed < 1 then
							fn76(arg2)

							task.spawn(function()
								while true do
									arg:AdjustWeight(-999999)
									RunService.Heartbeat:Wait()
									if arg.IsPlaying and flag18 then
										continue
									end
									break
								end

								fn77(arg2)
							end)

							break
						end
					end
				end

				local function fn79(arg)
					if arg == localPlayer3 then
						return
					end
					fn75()
					local character = arg.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildWhichIsA("Humanoid")
					character:FindFirstChild("HumanoidRootPart")
					if not humanoid then
						return
					end

					for _, v44 in pairs(humanoid:GetPlayingAnimationTracks()) do
						fn78(v44, character, arg)
					end

					local connection20 = humanoid.AnimationPlayed:Connect(function(arg2)
						if not flag18 then
							return
						end
						fn78(arg2, character, arg)
					end)

					table.insert(tbl37, connection20)
				end

				local function fn80(arg)
					if arg == localPlayer3 then
						return
					end

					if arg.Character then
						fn79(arg)
					end

					local connection20 = arg.CharacterAdded:Connect(function()
						if not flag18 then
							return
						end
						task.wait(0.5)
						fn79(arg)
					end)

					table.insert(tbl37, connection20)
				end

				v37:AddDivider({ Text = "General" })

				v37:AddToggle("AntiInvisToggle", {
					Text = "Anti-Invisibility",
					Default = false,
					Risky = true,
					Tooltip = "Can lag, also, Anti-invisibility on mech would be laggy, so there isn't any.",
					Callback = function(arg)
						if arg then
							flag18 = true

							for _, player in pairs(Players:GetPlayers()) do
								fn80(player)
							end

							local connection20 = Players.PlayerAdded:Connect(function(player)
								if not flag18 then
									return
								end
								fn80(player)
							end)

							table.insert(tbl37, connection20)
						else
							fn74()
						end
					end,
				})

				table.insert(tbl24, function()
					fn74()

					pcall(function()
						toggles.AntiInvisToggle:SetValue(false)
					end)
				end)

				v37:AddToggle("AntiMoves_Trashcan", { Text = "Anti Trashcan", Default = false })
				v37:AddDivider({ Text = "Anti Moves" })

				v37:AddDropdown("AntiMoves_Saitama", {
					Text = "<font color=\"rgb(255,134,136)\">Anti The Strongest Hero</font>",
					Values = {
						"Anti Normal Punch",
						"Anti Consecutive Punches",
						"Anti Shove",
						"Anti Uppercut",
						"Anti Death Counter",
						"Anti Death Counter Shockwave",
						"Anti Table Flip",
						"Anti Serious Punch",
						"Anti Omni Directional Punch",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				local addDivider = v37.AddDivider
				getgenv()._revDCDivider = addDivider(v37, { Text = "Death Counter" })

				v37:AddDropdown("AntiDCQuotesDD", {
					Text = "Death Counter Quotes Mode",
					Values = {
						"No Quotes",
						"Sukuna Quotes",
						"Gojo Quotes",
						"Name Quotes",
						"Admin Quotes",
						"Sans Quotes",
						"Random",
					},
					Default = 1,
					Multi = false,
					Visible = false,
				})

				v37:AddDropdown("AntiDCWaitBeforeKillDD", {
					Text = "Anti Death Counter Delay",
					Values = { "No Wait - Prevents Tabbing", "3s - Fakeout", "5s - Long Fakeout" },
					Default = 1,
					Multi = false,
					Visible = false,
				})

				local function fn81()
					local value = options.AntiMoves_Saitama and options.AntiMoves_Saitama.Value and _rawget(options.AntiMoves_Saitama.Value, "Anti Death Counter")
					fn54(options.AntiDCQuotesDD, value == true)
					fn54(options.AntiDCWaitBeforeKillDD, value == true)
					fn54(getgenv()._revDCDivider, value == true)
				end

				pcall(function()
					options.AntiMoves_Saitama:OnChanged(fn81)
				end)

				task.defer(fn81)
				v37:AddDivider({ Text = "Other Characters" })

				v37:AddDropdown("AntiMoves_Garou", {
					Text = "<font color=\"rgb(93,190,255)\">Anti Hero Hunter</font>",
					Values = {
						"Anti Flowing Water",
						"Anti Lethal Whirlwind Stream",
						"Anti Hunter's Grasp",
						"Anti Prey's Peril",
						"Anti Rampage",
						"Anti Water Stream Cutting Fist",
						"Anti The Final Hunt",
						"Anti Final Hunt Finisher",
						"Anti Rock Splitting Fist",
						"Anti Crushed Rock",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_MonsterForm", {
					Text = "<font color=\"rgb(255,21,56)\">Anti Monster Form</font>",
					Values = {
						"Anti Limit Breaker",
						"Anti Hunter's Mark",
						"Anti Great Fajin",
						"Anti God Slayer",
						"Anti Sky Ripping Fist",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_CosmicForm", {
					Text = "<font color=\"rgb(167,40,241)\">Anti Cosmic Form</font>",
					Values = { "Anti Singularity", "Anti Nuclear Fission", "Anti Gamma Ray Burst" },
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_Genos", {
					Text = "<font color=\"rgb(255,102,105)\">Anti Destructive Cyborg</font>",
					Values = {
						"Anti Thunder Kick",
						"Anti Speedblitz Dropkick",
						"Anti Flamewave Cannon",
						"Anti Incinerate",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_Sonic", {
					Text = "<font color=\"rgb(153,144,255)\">Anti Deadly Ninja</font>",
					Values = {
						"Anti Flash Strike",
						"Anti Whirlwind Kick",
						"Anti Twinblade Rush",
						"Anti Straight On",
						"Anti Carnage",
						"Anti Fourfold Flashstrike",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_MetalBat", {
					Text = "<font color=\"rgb(255,255,255)\">Anti Brutal Demon</font>",
					Values = {
						"Anti Savage Tornado",
						"Anti Brutal Beatdown",
						"Anti Strength Difference",
						"Anti Death Blow",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_AtomicSamurai", {
					Text = "<font color=\"rgb(255,60,0)\">Anti Blade Master</font>",
					Values = {
						"Anti Scorching Blade",
						"Anti Sunset",
						"Anti Solar Cleave",
						"Anti Sunrise",
						"Anti Atomic Slash",
						"Anti Atomic Slash Finisher",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_Tatsumaki", {
					Text = "<font color=\"rgb(125,255,134)\">Anti Wild Psychic</font>",
					Values = {
						"Anti Crushing Pull",
						"Anti Windstorm Fury",
						"Anti Stone Coffin",
						"Anti Expulsive Push",
						"Anti Berserk",
						"Anti Cosmic Strike",
						"Anti Psychic Ricochet",
						"Anti Terrible Tornado",
						"Anti Sky Snatcher",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_Suiryu", {
					Text = "<font color=\"rgb(153,144,255)\">Anti Martial Artist</font>",
					Values = {
						"Anti Whirlwind Drop",
						"Anti Dragon's Descent",
						"Anti Grand Fissure",
						"Anti Twin Fangs",
						"Anti Earth Splitting Strike",
						"Anti Last Breath",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_TechProdigy", {
					Text = "<font color=\"rgb(255,166,170)\">Anti Tech Prodigy</font>",
					Values = {
						"Anti Railgun",
						"Anti Tactical Storm",
						"Anti Iron Giant",
						"Anti Mech M1s",
						"Anti Mech Dash",
						"Anti Photon Edge",
						"Anti Photon Dive",
						"Anti Conquest",
						"Anti Missiles",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_KJ", {
					Text = "<font color=\"rgb(255,102,105)\">Anti KJ</font>",
					Values = { "Anti Stoic Bomb", "Anti 20-20-20 Dropkick", "Anti Five Seasons" },
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				v37:AddDropdown("AntiMoves_FrozenSoul", {
					Text = "<font color=\"rgb(0,255,255)\">Anti Frozen Soul</font>",
					Values = { "Anti Permafrost", "Anti Frost Forge", "Anti Freezing Path", "Anti Judgement Chain" },
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				MoveNotify = function(arg, arg2)
					if options.MoveNotificationMoves and not _rawget(options.MoveNotificationMoves.Value, arg2) then
						return
					end

					if toggles.MoveNotifications and toggles.MoveNotifications.Value then
						v24:Notify({ Title = "Move Notification", Content = arg.DisplayName .. " used " .. arg2, Time = 5 })
					end

					local value = toggles.ExposeMoveInChat and toggles.ExposeMoveInChat.Value

					if value then
						value = not (toggles.ExposeWhitelistedPlayers and toggles.ExposeWhitelistedPlayers.Value and table.find(RevenantWhitelist, arg))
					end

					if value then
						pcall(function()
							local TextChatService = game:GetService("TextChatService")

							if TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService then
								if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
									local rbxGeneral = TextChatService.TextChannels:FindFirstChild("RBXGeneral")

									if rbxGeneral then
										rbxGeneral:SendAsync("❗" .. arg.DisplayName .. " used " .. arg2 .. "❗")
									end
								end
							else
								local defaultChatSystemChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
								local sayMessageRequest = defaultChatSystemChatEvents and defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")

								if defaultChatSystemChatEvents and sayMessageRequest then
									sayMessageRequest:FireServer("❗" .. arg.DisplayName .. " used " .. arg2 .. "❗", "all")
								end
							end
						end)
					end
				end

				local function fn82()
					return flag17
				end

				local function fn83(arg)
					local deathCounterUltHighlight = arg and arg:FindFirstChild("DeathCounterUltHighlight")

					if deathCounterUltHighlight then
						pcall(function()
							deathCounterUltHighlight:Destroy()
						end)
					end
				end

				local function fn84(adornee)
					if not adornee or adornee.Name == "Weakest Dummy" then
						return
					end
					local playerFromCharacter = Players:GetPlayerFromCharacter(adornee)
					if not playerFromCharacter or playerFromCharacter == localPlayer3 then
						return
					end
					local flag19 = adornee:FindFirstChild("Counter") ~= nil
					local flag20 = fn82() and adornee:GetAttribute("Character") == "Bald" and adornee:GetAttribute("Ulted") == true and not flag19
					local deathCounterUltHighlight = adornee:FindFirstChild("DeathCounterUltHighlight")

					if flag20 then
						if not deathCounterUltHighlight then
							deathCounterUltHighlight = Instance.new("Highlight")
							deathCounterUltHighlight.Name = "DeathCounterUltHighlight"
							deathCounterUltHighlight.Adornee = adornee
							deathCounterUltHighlight.Parent = adornee
						end

						deathCounterUltHighlight.FillColor = Color3.fromRGB(255, 255, 0)
						deathCounterUltHighlight.OutlineColor = Color3.fromRGB(255, 255, 0)
						deathCounterUltHighlight.FillTransparency = 0.5
						deathCounterUltHighlight.OutlineTransparency = 0
						deathCounterUltHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

						if not adornee:FindFirstChild("RevenantLockOnHL") then
							deathCounterUltHighlight.Parent = nil
							deathCounterUltHighlight.Parent = adornee
						end
					elseif deathCounterUltHighlight then
						pcall(function()
							deathCounterUltHighlight:Destroy()
						end)
					end
				end

				local function fn85(arg)
					if not arg or obj2[arg] then
						return
					end
					obj2[arg] = true
					fn84(arg)

					table.insert(tbl29, arg:GetAttributeChangedSignal("Ulted"):Connect(function()
						fn84(arg)
					end))

					table.insert(tbl29, arg:GetAttributeChangedSignal("Character"):Connect(function()
						fn84(arg)
					end))

					table.insert(tbl29, arg.ChildAdded:Connect(function(child)
						if fn61(child) then
							fn84(arg)
						end
					end))

					table.insert(tbl29, arg.ChildRemoved:Connect(function(child)
						if fn61(child) then
							fn84(arg)
						end
					end))
				end

				local function fn86(player)
					if player == localPlayer3 then
						return
					end

					if player.Character then
						fn85(player.Character)
					end

					table.insert(tbl29, player.CharacterAdded:Connect(function(character)
						task.wait(0.1)
						fn85(character)
					end))
				end

				local function fn87()
					for _, player in pairs(Players:GetPlayers()) do
						if player.Character then
							fn84(player.Character)
						end
					end
				end

				for _, player in pairs(Players:GetPlayers()) do
					fn86(player)
				end

				table.insert(tbl29, Players.PlayerAdded:Connect(fn86))

				table.insert(tbl29, Players.PlayerRemoving:Connect(function(player)
					if player.Character then
						fn83(player.Character)
					end
				end))

				task.spawn(function()
					while not v24.Unloaded do
						task.wait(0.5)

						if flag17 then
							pcall(fn87)
						end
					end
				end)

				table.insert(tbl24, function()
					for _, v44 in pairs(tbl29) do
						pcall(v44.Disconnect, v44)
					end

					tbl29 = {}
					obj2 = setmetatable({}, { __mode = "k" })

					for _, player in pairs(Players:GetPlayers()) do
						if player.Character then
							fn83(player.Character)
						end
					end
				end)

				tbl5 = {}
				tbl6 = {}
				tbl7 = {}

				localPlayer3.CharacterAdded:Connect(function()
					getgenv().desync = nil
					getgenv().desync2 = nil
				end)

				fn17 = function(arg)
					if not arg then
						return false
					end
					local model = arg:FindFirstAncestorWhichIsA("Model")
					if model and model:FindFirstChild("Counter") then
						return true
					end

					for _, v44 in pairs(arg:GetPlayingAnimationTracks()) do
						local animationId = v44.Animation.AnimationId
						if animationId:match("13726226905") or animationId:match("13726235415") then
							return true
						end
					end

					return false
				end

				fn20 = function(arg, arg2)
					if not arg2 then
						return
					end

					if tbl5[arg] then
						pcall(function()
							tbl5[arg]:Disconnect()
						end)

						tbl5[arg] = nil
					end

					while true do
						task.wait()
						if not (not arg2.Parent or arg2:FindFirstChild("HumanoidRootPart") and arg2:FindFirstChildOfClass("Humanoid")) then
							continue
						end
						break
					end

					if not arg2.Parent then
						return
					end
					local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart")
					local humanoid = arg2:FindFirstChildOfClass("Humanoid")
					if not (humanoidRootPart2 and humanoid) then
						return
					end

					local function fn88(arg3, arg4)
						local match = tostring(arg4):match("%d+")

						for _, v44 in pairs(arg3:GetPlayingAnimationTracks()) do
							if v44.Animation.AnimationId:match(match) then
								return v44
							end
						end

						return nil
					end

					tbl5[arg] = humanoid.AnimationPlayed:Connect(function(arg3)
						if v24.Unloaded then
							return
						end
						local animationId = arg3.Animation.AnimationId
						local character = localPlayer3.Character
						local humanoidRootPart3 = character and character:FindFirstChild("HumanoidRootPart")
						if not (character and humanoidRootPart3) then
							return
						end

						task.spawn(function()
							if arg3.WeightTarget == 0 or arg3.Speed == 0 then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
							local v44 = character
							local humanoid2

							if character then
								humanoid2 = character:FindFirstChildOfClass("Humanoid")
							else
								humanoid2 = v44
							end

							local function fn89(arg4)
								pcall(function()
									repeat
										local desync = { CFrame = cframe }
										getgenv().desync = desync
										task.wait()
										local character2 = localPlayer3.Character
										local humanoidRootPart4 = character2 and character2:FindFirstChild("HumanoidRootPart")
										local humanoid3 = character2 and character2:FindFirstChildOfClass("Humanoid")
										if not (character2 and humanoidRootPart4 and humanoid3) then
											return
										end
										humanoidRootPart3 = humanoidRootPart4
										humanoid2 = humanoid3
									until arg4()
								end)

								getgenv().desync = nil

								if flag11 then
									local humanoidRootPart4 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart4 then
										pcall(sethiddenproperty, humanoidRootPart4, "PhysicsRepRootPart", nil)
									end
								end
							end

							local function fn90(arg4)
								local now2 = tick()

								while true do
									if not arg3.IsPlaying then
										return false
									else
										if v24.Unloaded then
											return false
										end
										RunService.RenderStepped:Wait()
										if not (now2 + arg4 <= tick()) then
											continue
										end
										break
									end
								end

								return arg3.IsPlaying and true or false
							end

							local function fn91(arg4)
								if not arg4 then
									return false
								end
								local model = arg4:FindFirstAncestorWhichIsA("Model")
								return model and model:FindFirstChild("Counter") and true or false
							end

							local function fn92(size)
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = size
								part3.CanCollide = false
								part3.CanQuery = false
								part3.Transparency = getgenv()._antiBoxT or 1
								local flag19 = false

								local connection20 = part3.Touched:Connect(function(hit)
									if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
										flag19 = true
									end
								end)

								local connection21 = part3.TouchEnded:Connect(function(hit)
									if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
										flag19 = false
									end
								end)

								return part3, function()
									return flag19
								end, function()
									pcall(function()
										part3:Destroy()
									end)

									connection20:Disconnect()
									connection21:Disconnect()
								end
							end

							local function fn93()
								local invisPart30 = getgenv().InvisPart30
								if getgenv().InvisActive and invisPart30 then
									return invisPart30.Position
								end
								return humanoidRootPart3.Position
							end

							if animationId:match("10468665991") and _rawget(options.AntiMoves_Saitama.Value, "Anti Normal Punch") then
								local tbl40 = {}
								local tbl41 = {}
								local n15 = CFrame.new(6, 0, -37.5) * CFrame.Angles(0, -0.087266462599716474, 0)
								local n16 = CFrame.new(-6, 0, -37.5) * CFrame.Angles(0, 0.087266462599716474, 0)
								local cframe2 = CFrame.new
								tbl41[1] = n15
								tbl41[2] = n16

								do
									local values = table.pack(cframe2(0, 0, -37.5))
									table.move(values, 1, values.n, 3, tbl41)
								end

								local tbl42 = { Vector3.new(12.5, 5, 75), Vector3.new(12.5, 5, 75), Vector3.new(12.5, 5, 75) }
								local tbl43 = { false, false, false }
								local tbl44 = {}

								for i = 1, 3 do
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = tbl42[i]
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									table.insert(tbl40, part3)
									local v45 = i

									table.insert(tbl44, part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											tbl43[v45] = true
										end
									end))

									table.insert(tbl44, part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											tbl43[v45] = false
										end
									end))
								end

								local now2 = tick()

								while true do
									for i, v45 in ipairs(tbl40) do
										v45.CFrame = humanoidRootPart2.CFrame * tbl41[i]
									end

									if (tbl43[1] or tbl43[2] or tbl43[3]) and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 0.8 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil

								for _, v45 in ipairs(tbl44) do
									v45:Disconnect()
								end

								for _, v45 in ipairs(tbl40) do
									pcall(function()
										v45:Destroy()
									end)
								end
							end

							if animationId:match("10466974800") and _rawget(options.AntiMoves_Saitama.Value, "Anti Consecutive Punches") then
								local v45, v46, v47 = fn92(Vector3.new(12.5, 5, 12.5))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -6.25)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 1.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("10471336737") and _rawget(options.AntiMoves_Saitama.Value, "Anti Shove") then
								local v45, v46, v47 = fn92(Vector3.new(7.5, 5, 7.5))
								v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -3.75)
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -3.75)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 0.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("12510170988") and _rawget(options.AntiMoves_Saitama.Value, "Anti Uppercut") then
								task.wait(0.25)
								if not arg3.IsPlaying then
									return
								end
								local v45, v46, v47 = fn92(Vector3.new(10, 10, 10))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -5)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 0.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("12983333733") and arg2:GetAttribute("Ulted") ~= nil then
								MoveNotify(arg, "Serious Punch")
							end

							if animationId:match("12983333733") and _rawget(options.AntiMoves_Saitama.Value, "Anti Serious Punch") then
								task.delay(1, function()
									if arg2:FindFirstChild("AbsoluteImmortal", true) and arg2:FindFirstChild("Freeze") then
										task.wait(4.25)
										local now2 = tick()

										fn89(function()
											local n15 = now2 + 2
											return tick() >= n15
										end)
									end
								end)
							end

							if animationId:match("11365563255") and arg2:GetAttribute("Ulted") ~= nil then
								MoveNotify(arg, "Table Flip")
							end

							if animationId:match("11365563255") and _rawget(options.AntiMoves_Saitama.Value, "Anti Table Flip") and arg2:GetAttribute("Ulted") ~= nil then
								task.delay(1, function()
									if arg2:FindFirstChild("AbsoluteImmortal", true) and arg2:FindFirstChild("Freeze") then
										task.wait(3)
										local now2 = tick()

										fn89(function()
											local n15 = now2 + 2.5
											return tick() >= n15
										end)
									end
								end)
							end

							if animationId:match("13927612951") and arg2:GetAttribute("Ulted") ~= nil then
								MoveNotify(arg, "Omni-Directional Punch")
							end

							if animationId:match("13927612951") and _rawget(options.AntiMoves_Saitama.Value, "Anti Omni Directional Punch") and arg2:GetAttribute("Ulted") ~= nil then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 150
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 2.5
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("12342141464") and _rawget(options.AntiMoves_Garou.Value, "Anti Rampage") then
								task.wait(3.5)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 125
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1.25
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("12463072679") and _rawget(options.AntiMoves_Garou.Value, "Anti The Final Hunt") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 25
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 0.75
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("122216590829087") and _rawget(options.AntiMoves_Garou.Value, "Anti Final Hunt Finisher") then
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(210, 1010, 210)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								local now2 = nil

								local connection20 = humanoid.AnimationPlayed:Connect(function(arg4)
									if (arg4.Animation and arg4.Animation.AnimationId or ""):match("125881219961499") then
										now2 = now2 or tick()
									end
								end)

								local now3 = tick()

								while humanoidRootPart2.Parent do
									local lookVector = humanoidRootPart2.CFrame.LookVector
									local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
									local n15 = humanoidRootPart2.Position + Vector3.new(0, -495, 0)

									if vector.Magnitude > 0.001 then
										part3.CFrame = CFrame.lookAt(n15, n15 + vector.Unit)
									else
										local n16 = part3.CFrame - part3.CFrame.Position
										part3.CFrame = CFrame.new(n15) * n16
									end

									local cFrame2 = part3.CFrame
									local pointToObjectSpace = cFrame2.PointToObjectSpace
									local v45 = fn93()
									local v46 = pointToObjectSpace(cFrame2, v45)

									if math.abs(v46.X) <= 105 and math.abs(v46.Y) <= 505 and math.abs(v46.Z) <= 105 and arg2:GetAttribute("FinalHuntFinisherUsed") then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (now2 and tick() >= now2 + 1 or tick() >= now3 + 10 or v24.Unloaded) then
										continue
									end
									break
								end

								getgenv().desync = nil

								pcall(function()
									connection20:Disconnect()
								end)

								pcall(function()
									part3:Destroy()
								end)
							end

							if animationId:match("12272894215") and _rawget(options.AntiMoves_Garou.Value, "Anti Flowing Water") then
								local v45, v46, v47 = fn92(Vector3.new(10, 5, 10))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -5)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 0.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("12273188754") and _rawget(options.AntiMoves_Garou.Value, "Anti Flowing Water") then
								local v45, v46, v47 = fn92(Vector3.new(15, 5, 15))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -7.5)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 2 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("14374357351") and _rawget(options.AntiMoves_Garou.Value, "Anti Flowing Water") then
								local v45, v46, v47 = fn92(Vector3.new(10, 5, 15))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -7.5)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 1.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
								task.wait(0.5)
								local now3 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 25
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now3 + 1.25
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("12296882427") and _rawget(options.AntiMoves_Garou.Value, "Anti Lethal Whirlwind Stream") then
								local now2 = tick()

								fn89(function()
									local cFrame2 = humanoidRootPart2.CFrame
									local flag19 = (fn93() - (cFrame2 * CFrame.new(0, 0, -2.5)).Position).Magnitude > 10 or fn17(humanoid)
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 0.5
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("12296113986") and _rawget(options.AntiMoves_Garou.Value, "Anti Lethal Whirlwind Stream") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 15
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 0.5
										flag20 = tick() >= n15
									end

									return flag20
								end)

								task.delay(1.35, function()
									local now3 = tick()

									while true do
										task.wait()
										local position = humanoidRootPart2.Position
										if not ((fn93() - position).Magnitude <= 15 or tick() >= now3 + 0.65) then
											continue
										end
										break
									end

									local position = humanoidRootPart2.Position

									if (fn93() - position).Magnitude <= 15 then
										local now4 = tick()

										fn89(function()
											local position2 = humanoidRootPart2.Position
											local flag19 = (fn93() - position2).Magnitude > 15
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now4 + 0.65
												flag20 = tick() >= n15
											end

											return flag20
										end)
									end
								end)
							end

							if animationId:match("14798608838") and _rawget(options.AntiMoves_Garou.Value, "Anti Lethal Whirlwind Stream") then
								task.delay(0.75, function()
									local now2 = tick()

									while true do
										task.wait()
										local position = humanoidRootPart2.Position
										if not ((fn93() - position).Magnitude <= 25 or tick() >= now2 + 0.75) then
											continue
										end
										break
									end

									local position = humanoidRootPart2.Position

									if (fn93() - position).Magnitude <= 25 then
										local now3 = tick()

										fn89(function()
											local position2 = humanoidRootPart2.Position
											local flag19 = (fn93() - position2).Magnitude > 25
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now3 + 0.75
												flag20 = tick() >= n15
											end

											return flag20
										end)
									end
								end)
							end

							if animationId:match("12307656616") and _rawget(options.AntiMoves_Garou.Value, "Anti Hunter's Grasp") then
								local now2 = tick()

								fn89(function()
									local cFrame2 = humanoidRootPart2.CFrame
									local flag19 = (fn93() - (cFrame2 * CFrame.new(0, 0, -2.5)).Position).Magnitude > 10 or fn17(humanoid)
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 0.35
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("13603396939") and _rawget(options.AntiMoves_Garou.Value, "Anti Prey's Peril") then
								local now2 = tick()

								fn89(function()
									local cFrame2 = humanoidRootPart2.CFrame
									local flag19 = (fn93() - (cFrame2 * CFrame.new(0, 0, -1)).Position).Magnitude > 7.5 or fn17(humanoid)

									if not flag19 then
										local n15 = now2 + 2.5
										flag19 = tick() >= n15
									end

									return flag19
								end)
							end

							if animationId:match("12460977270") and _rawget(options.AntiMoves_Garou.Value, "Anti Water Stream Cutting Fist") then
								local v45, v46, v47 = fn92(Vector3.new(12.5, 5, 12.5))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -6.25)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 1.85 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("14057231976") and _rawget(options.AntiMoves_Garou.Value, "Anti Rock Splitting Fist") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 10
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 0.5
										flag20 = tick() >= n15
									end

									return flag20
								end)

								task.wait(0.5)
								local now3 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 10 or fn17(humanoid)

									if not flag19 then
										local n15 = now3 + 1.25
										flag19 = tick() >= n15
									end

									return flag19
								end)
							end

							if (animationId:match("13630786846") or animationId:match("135104210400610")) and _rawget(options.AntiMoves_Garou.Value, "Anti Crushed Rock") then
								local v45, v46, v47 = fn92(Vector3.new(25, 10, 75))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -37.5)

									if v46() and not fn17(humanoid) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 1.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("72451715583225") and _rawget(options.AntiMoves_Garou.Value, "Anti Crushed Rock") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 15
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 0.75
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("13813955149") and toggles.AntiMoves_Trashcan and toggles.AntiMoves_Trashcan.Value then
								local position = humanoidRootPart2.Position

								if (fn93() - position).Magnitude <= 25 then
									getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
									task.wait(0.75)
									getgenv().desync = nil
								end

								local connection20 = nil

								connection20 = workspace.Thrown.ChildAdded:Connect(function(child)
									if child:IsA("MeshPart") and child.Name:lower() == "trash can" then
										connection20:Disconnect()

										task.spawn(function()
											local now2 = tick()

											while child.Parent do
												local position2 = child.Position

												if (fn93() - position2).Magnitude <= 40 then
													getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
												else
													getgenv().desync = nil
												end

												RunService.RenderStepped:Wait()
												if not (tick() >= now2 + 1.2 or v24.Unloaded) then
													continue
												end
												break
											end

											getgenv().desync = nil
										end)

										local now2 = tick()

										fn89(function()
											local position2 = child.Position
											local flag19 = (fn93() - position2).Magnitude > 25
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now2 + 2
												flag20 = tick() >= n15
											end

											return flag20
										end)
									end
								end)
							end

							if animationId:match("15128849047") then
								MoveNotify(arg, "Death Blow")
							end

							if animationId:match("15128849047") and _rawget(options.AntiMoves_MetalBat.Value, "Anti Death Blow") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 100 or fn88(humanoid, "15123665491")
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 3
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("14900168720") and _rawget(options.AntiMoves_MetalBat.Value, "Anti Strength Difference") then
								if not fn90(1) then
									return
								end
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 30
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1
										flag20 = tick() >= n15
									end

									return flag20 or not arg3.IsPlaying
								end)
							end

							if animationId:match("14920779925") and _rawget(options.AntiMoves_MetalBat.Value, "Anti Strength Difference") then
								if not fn90(2.5) then
									return
								end
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 30

									if not flag19 then
										local n15 = now2 + 1.2
										flag19 = tick() >= n15
									end

									return flag19 or not arg3.IsPlaying
								end)
							end

							if animationId:match("14701242661") and _rawget(options.AntiMoves_MetalBat.Value, "Anti Brutal Beatdown") then
								local n15 = 40

								local function fn94(arg4)
									if not humanoidRootPart2.Parent or v24.Unloaded then
										return
									end
									local now2 = tick()

									fn89(function()
										local position = humanoidRootPart2.Position
										local flag19 = (fn93() - position).Magnitude > n15

										if not flag19 then
											local n16 = now2 + arg4
											flag19 = tick() >= n16
										end

										return flag19 or not arg3.IsPlaying or not humanoidRootPart2.Parent or v24.Unloaded
									end)
								end

								if not fn90(1.5) then
									return
								end
								fn94(2.7)
								if not fn90(0.2) then
									return
								end
								fn94(3.5)
								if not fn90(2) then
									return
								end
								local now2 = tick()

								fn89(function()
									local n16 = humanoidRootPart2.Position + Vector3.new(0, -40, 0)
									local flag19 = (fn93() - n16).Magnitude > 50
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n17 = now2 + 1
										flag20 = tick() >= n17
									end

									return flag20
								end)
							end

							if animationId:match("15123665491") and _rawget(options.AntiMoves_MetalBat.Value, "Anti Death Blow") then
								task.wait(11)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 100
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 2
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("15391323441") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Scorching Blade") then
								task.wait(5.5)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 125
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("16082123712") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Atomic Slash") then
								task.wait(2.5)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 50
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1.5
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("14719290328") and _rawget(options.AntiMoves_MetalBat.Value, "Anti Savage Tornado") then
								local position = humanoidRootPart2.Position

								if (fn93() - position).Magnitude <= 50 then
									getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
								end

								task.wait(0.5)

								if arg3.IsPlaying then
									local now2 = tick()

									fn89(function()
										local position2 = humanoidRootPart2.Position
										local flag19 = (fn93() - position2).Magnitude > 50 or fn91(humanoid2)

										if not flag19 then
											local n15 = now2 + 3.5
											flag19 = tick() >= n15
										end

										return flag19 or not arg3.IsPlaying
									end)
								end
							end

							if animationId:match("15520132233") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Sunset") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 50 or fn91(humanoid2)

									if not flag19 then
										local n15 = now2 + 3.3
										flag19 = tick() >= n15
									end

									return flag19 or not arg3.IsPlaying
								end)

								repeat
									task.wait()
								until now2 + 5.5 <= tick()

								local now3 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 100 or fn91(humanoid2)
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now3 + 1
										flag20 = tick() >= n15
									end

									return flag20 or not arg3.IsPlaying
								end)
							end

							if animationId:match("15676072469") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Solar Cleave") then
								local v45, v46, v47 = fn92(Vector3.new(50, 10, 150))
								local now2 = tick()

								while true do
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -75)

									if v46() and not fn91(humanoid2) then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 2 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v47()
							end

							if animationId:match("16057411888") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Atomic Slash Finisher") then
								task.wait(4.25)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 50
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 2
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("16062410809") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Sunrise") then
								getgenv()._revSunriseBox = getgenv()._revSunriseBox or setmetatable({}, { __mode = "k" })
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(20, 10, 60)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								getgenv()._revSunriseBox[humanoidRootPart2] = part3
								local now2 = tick()

								while true do
									if not (not humanoidRootPart2.Parent or not part3.Parent) then
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -20)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 10 and math.abs(v46.Y) <= 5 and math.abs(v46.Z) <= 30 then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 2 or v24.Unloaded) then
											continue
										end
									end

									break
								end

								getgenv().desync = nil

								if getgenv()._revSunriseBox[humanoidRootPart2] == part3 then
									getgenv()._revSunriseBox[humanoidRootPart2] = nil
								end

								pcall(function()
									part3:Destroy()
								end)
							end

							if animationId:match("16062712948") and _rawget(options.AntiMoves_AtomicSamurai.Value, "Anti Sunrise") then
								local revSunriseBox = getgenv()._revSunriseBox and getgenv()._revSunriseBox[humanoidRootPart2]

								if revSunriseBox then
									pcall(function()
										revSunriseBox:Destroy()
									end)

									getgenv()._revSunriseBox[humanoidRootPart2] = nil
								end

								task.wait(4)

								if humanoidRootPart2.Parent and not v24.Unloaded then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(40, 30, 40)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now2 = tick()

									while humanoidRootPart2.Parent do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -20)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)
										local character2 = localPlayer3.Character
										local absoluteImmortal

										if character2 then
											absoluteImmortal = character2:FindFirstChild("AbsoluteImmortal") or character2:FindFirstChild("ForceField")
										else
											absoluteImmortal = character2
										end

										if not absoluteImmortal and math.abs(v46.X) <= 20 and math.abs(v46.Y) <= 15 and math.abs(v46.Z) <= 20 then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 3 or v24.Unloaded) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("18435535291") and _rawget(options.AntiMoves_Suiryu.Value, "Anti Dragon's Descent") then
								task.wait(4.25)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 100
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1.25
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("17857788598") and _rawget(options.AntiMoves_Suiryu.Value, "Anti Whirlwind Drop") then
								task.wait(0.65)

								if arg3.IsPlaying then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(35, 2048, 35)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local flag19 = false

									local connection20 = part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = true
										end
									end)

									local connection21 = part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = false
										end
									end)

									local now2 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame

										if flag19 and not fn88(humanoid, "15128849047") then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 0.85 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil
									connection20:Disconnect()
									connection21:Disconnect()

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("129651400898906") and _rawget(options.AntiMoves_Suiryu.Value, "Anti Grand Fissure") then
								task.wait(0.5)
								local cFrame2 = humanoidRootPart2.CFrame
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 75

									if not flag19 then
										local n15 = now2 + 1.25
										flag19 = tick() >= n15
									end

									return flag19 or not arg3.IsPlaying
								end)

								task.wait(1)
								local now3 = tick()

								fn89(function()
									local position = cFrame2.Position
									local flag19 = (fn93() - position).Magnitude > 75
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now3 + 1.75
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("18896229321") and _rawget(options.AntiMoves_Suiryu.Value, "Anti Twin Fangs") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 15 or fn17(humanoid)

									if not flag19 then
										local n15 = now2 + 3.5
										flag19 = tick() >= n15
									end

									return flag19 or not arg3.IsPlaying
								end)

								task.wait(1)

								if arg3.IsPlaying then
									local position = humanoidRootPart2.Position

									if (fn93() - position).Magnitude <= 25 then
										local now3 = tick()

										fn89(function()
											local position2 = humanoidRootPart2.Position
											local flag19 = (fn93() - position2).Magnitude > 25
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now3 + 2
												flag20 = tick() >= n15
											end

											return flag20 or not arg3.IsPlaying
										end)
									end
								end
							end

							if animationId:match("18897119503") and _rawget(options.AntiMoves_Suiryu.Value, "Anti Earth Splitting Strike") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 50
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1.5
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("106755459092436") or animationId:match("75502010126640") then
								MoveNotify(arg, "Last Breath")
							end

							if (animationId:match("106755459092436") or animationId:match("75502010126640")) and _rawget(options.AntiMoves_Suiryu.Value, "Anti Last Breath") then
								getgenv()._lbBoxStop = getgenv()._lbBoxStop or setmetatable({}, { __mode = "k" })
								getgenv()._lbBoxStart = getgenv()._lbBoxStart or setmetatable({}, { __mode = "k" })
								local v45 = humanoidRootPart2
								getgenv()._lbBoxStart[v45] = tick()
								getgenv()._lbBoxStop[humanoidRootPart2] = false
								local v46, v47, v48 = fn92(Vector3.new(30, 30, 170))
								local now2 = tick()

								while true do
									local lookVector = humanoidRootPart2.CFrame.LookVector
									local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
									local vector2 = vector.Magnitude < 0.001 and Vector3.new(0, 0, -1) or vector.Unit
									local n15 = humanoidRootPart2.Position + vector2 * 65
									v46.CFrame = CFrame.lookAt(n15, n15 + vector2)

									if v47() then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 7 or getgenv()._lbBoxStop[humanoidRootPart2]) then
										continue
									end
									break
								end

								getgenv().desync = nil
								v48()
							end

							if animationId:match("102814369422840") and getgenv()._lbBoxStart and getgenv()._lbBoxStart[humanoidRootPart2] then
								if tick() - getgenv()._lbBoxStart[humanoidRootPart2] >= 2 and getgenv()._lbBoxStop then
									getgenv()._lbBoxStop[humanoidRootPart2] = true
								end
							end

							if animationId:match("16515850153") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Windstorm Fury") then
								task.spawn(function()
									local position = humanoidRootPart2.Position

									if (fn93() - position).Magnitude <= 15 then
										getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
									end

									local dotted = workspace.Thrown:WaitForChild("Dotted", 1)

									if dotted then
										local dots = dotted:WaitForChild("Dots", 1)
										if not dots then
											getgenv().desync = nil
											return
										end
										local now2 = tick()
										local position2 = dots.Position

										if (fn93() - position2).Magnitude > 20 then
											getgenv().desync = nil
										end

										fn89(function()
											local position3 = dots.Position
											local flag19 = (fn93() - position3).Magnitude > 20 or fn91(humanoid2)
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now2 + 4.25
												flag20 = tick() >= n15
											end

											return flag20
										end)
									else
										getgenv().desync = nil
									end
								end)
							end

							if animationId:match("16431491215") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Stone Coffin") then
								local now2 = tick()

								while true do
									task.wait()
									local cFrame2 = humanoidRootPart2.CFrame
									if not ((fn93() - (cFrame2 * CFrame.new(0, 0, -25)).Position).Magnitude <= 25 or fn88(humanoid, "15128849047") or tick() >= now2 + 0.75) then
										continue
									end
									break
								end

								if not fn88(humanoid, "15128849047") then
									fn89(function()
										local cFrame2 = humanoidRootPart2.CFrame
										local flag19 = (fn93() - (cFrame2 * CFrame.new(0, 0, -20)).Position).Magnitude > 25 or fn88(humanoid, "15128849047")

										if not flag19 then
											local n15 = now2 + 0.75
											flag19 = tick() >= n15
										end

										return flag19
									end)
								end
							end

							if animationId:match("16597912086") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Expulsive Push") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 15 or fn17(humanoid)

									if not flag19 then
										local n15 = now2 + 0.75
										flag19 = tick() >= n15
									end

									return flag19
								end)
							end

							if animationId:match("17275150809") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Terrible Tornado") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 50
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("17278415853") and arg2:GetAttribute("Character") == "Esper" and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Terrible Tornado") then
								task.wait(11)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 100
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 6
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("16734584478") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Berserk") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 75
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 5.75
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("13376869471") and _rawget(options.AntiMoves_Sonic.Value, "Anti Flash Strike") then
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(10, 7.5, 60)
								part3.CanCollide = false
								part3.Transparency = getgenv()._antiBoxT or 1
								local flag19 = false

								local connection20 = part3.Touched:Connect(function(hit)
									if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
										flag19 = true
									end
								end)

								local connection21 = part3.TouchEnded:Connect(function(hit)
									if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
										flag19 = false
									end
								end)

								local now2 = tick()

								while true do
									part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)
									RunService.RenderStepped:Wait()
									if not (flag19 or tick() >= now2 + 3 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								if flag19 then
									local now3 = tick()

									fn89(function()
										local flag20 = not flag19

										if not flag20 then
											local n15 = now3 + 1
											flag20 = tick() >= n15
										end

										return flag20 or not arg3.IsPlaying
									end)
								end

								connection20:Disconnect()
								connection21:Disconnect()

								pcall(function()
									part3:Destroy()
								end)
							end

							if animationId:match("13639700348") and _rawget(options.AntiMoves_Sonic.Value, "Anti Straight On") then
								task.wait(0.05)

								if humanoidRootPart2.Parent and not v24.Unloaded then
									local position = humanoidRootPart2.Position
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(20, 20, 60)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now2 = tick()

									while humanoidRootPart2.Parent do
										local lookVector = humanoidRootPart2.CFrame.LookVector
										local vector = Vector3.new(lookVector.X, 0, lookVector.Z)

										if vector.Magnitude < 0.01 then
											vector = Vector3.new(0, 0, -1)
										end

										part3.CFrame = CFrame.lookAt(position, position + vector.Unit) * CFrame.new(0, 0, -20)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 10 and math.abs(v46.Y) <= 10 and math.abs(v46.Z) <= 30 then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 0.4 or v24.Unloaded) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("13294790250") and _rawget(options.AntiMoves_Sonic.Value, "Anti Whirlwind Kick") then
								task.wait(0.5)
								local now2 = tick()

								fn89(function()
									local cFrame2 = humanoidRootPart2.CFrame
									local flag19 = (fn93() - (cFrame2 * CFrame.new(0, 0, -2.5)).Position).Magnitude > 10 or fn17(humanoid)

									if not flag19 then
										local n15 = now2 + 0.75
										flag19 = tick() >= n15
									end

									return flag19
								end)
							end

							if animationId:match("13632347366") and _rawget(options.AntiMoves_Sonic.Value, "Anti Twinblade Rush") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 75 or fn91(humanoid2)

									if not flag19 then
										local n15 = now2 + 1.75
										flag19 = tick() >= n15
									end

									return flag19 or not arg3.IsPlaying
								end)
							end

							if animationId:match("13723174078") and _rawget(options.AntiMoves_Sonic.Value, "Anti Carnage") then
								task.wait(0.5)
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 50
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 2
										flag20 = tick() >= n15
									end

									return flag20 or not arg3.IsPlaying
								end)
							end

							if animationId:match("13881335713") and _rawget(options.AntiMoves_Sonic.Value, "Anti Fourfold Flashstrike") then
								task.wait(0.75)

								if arg3.IsPlaying then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(35, 5, 60)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local flag19 = false

									local connection20 = part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = true
										end
									end)

									local connection21 = part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = false
										end
									end)

									local now2 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)
										RunService.RenderStepped:Wait()
										if not (flag19 or tick() >= now2 + 3 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									if flag19 then
										local now3 = tick()

										fn89(function()
											local flag20 = not flag19
											local flag21

											if flag20 then
												flag21 = flag20
											else
												local n15 = now3 + 1
												flag21 = tick() >= n15
											end

											return flag21 or not arg3.IsPlaying
										end)
									end

									connection20:Disconnect()
									connection21:Disconnect()

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("14721837245") and _rawget(options.AntiMoves_Genos.Value, "Anti Thunder Kick") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 25 or fn88(humanoid, "15128849047")
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1.5
										flag20 = tick() >= n15
									end

									return flag20 or not arg3.IsPlaying
								end)

								if tick() >= now2 + 1.5 then
									task.wait(1)
									local now3 = tick()

									fn89(function()
										local position = humanoidRootPart2.Position
										local flag19 = (fn93() - position).Magnitude > 100

										if not flag19 then
											local n15 = now3 + 1.5
											flag19 = tick() >= n15
										end

										return flag19 or not arg3.IsPlaying
									end)
								end
							end

							if animationId:match("13083332742") and _rawget(options.AntiMoves_Genos.Value, "Anti Flamewave Cannon") then
								task.wait(1)
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(12.5, 5, 1000)
								part3.CanCollide = false
								part3.Transparency = getgenv()._antiBoxT or 1

								task.delay(0.25, function()
									part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)
								end)

								local flag19 = false

								local connection20 = part3.Touched:Connect(function(hit)
									if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
										flag19 = true
									end
								end)

								local connection21 = part3.TouchEnded:Connect(function(hit)
									if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
										flag19 = false
									end
								end)

								local now2 = tick()

								while true do
									if flag19 and not fn91(humanoid2) then
										getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 4 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil
								connection20:Disconnect()
								connection21:Disconnect()

								pcall(function()
									part3:Destroy()
								end)
							end

							if animationId:match("13146710762") and _rawget(options.AntiMoves_Genos.Value, "Anti Incinerate") then
								task.wait(3.25)

								if arg3.IsPlaying then
									local tbl40 = {}
									local tbl41 = {}
									local n15 = CFrame.new(50, 0, -200) * CFrame.Angles(0, -0.26179938779914941, 0)
									local n16 = CFrame.new(-50, 0, -200) * CFrame.Angles(0, 0.26179938779914941, 0)
									local cframe2 = CFrame.new
									tbl41[1] = n15
									tbl41[2] = n16

									do
										local values = table.pack(cframe2(0, 0, -200))
										table.move(values, 1, values.n, 3, tbl41)
									end

									local flag19 = false
									local tbl42 = {}

									for _, v45 in ipairs(tbl41) do
										local part3 = Instance.new("Part", workspace)
										part3.Anchored = true
										part3.Size = Vector3.new(100, 75, 400)
										part3.CanCollide = false
										part3.Transparency = getgenv()._antiBoxT or 1
										part3.CFrame = humanoidRootPart2.CFrame * v45
										table.insert(tbl40, part3)

										table.insert(tbl42, part3.Touched:Connect(function(hit)
											if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
												flag19 = true
											end
										end))

										table.insert(tbl42, part3.TouchEnded:Connect(function(hit)
											if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
												flag19 = false
											end
										end))
									end

									local now2 = tick()

									while true do
										if flag19 and not fn91(humanoid2) then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 6 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil

									for _, v45 in ipairs(tbl42) do
										v45:Disconnect()
									end

									for _, v45 in ipairs(tbl40) do
										pcall(function()
											v45:Destroy()
										end)
									end
								end
							end

							if animationId:match("12832505612") and _rawget(options.AntiMoves_Genos.Value, "Anti Speedblitz Dropkick") then
								local lookVector = humanoidRootPart2.CFrame.LookVector
								local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
								local unit = vector.Magnitude > 0.001 and vector.Unit or Vector3.new(0, 0, -1)
								local position = humanoidRootPart2.Position
								local cFrame2 = CFrame.lookAt(position, position + unit) * CFrame.new(0, 0, -155)
								task.wait()
								getgenv()._revSBDKick = getgenv()._revSBDKick or setmetatable({}, { __mode = "k" })
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(30, 10, 310)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								part3.CFrame = cFrame2
								getgenv()._revSBDKick[humanoidRootPart2] = part3
								local now2 = tick()

								while part3.Parent do
									local pointToObjectSpace = cFrame2.PointToObjectSpace
									local v45 = fn93()
									local v46 = pointToObjectSpace(cFrame2, v45)

									if math.abs(v46.X) <= 15 and math.abs(v46.Y) <= 5 and math.abs(v46.Z) <= 155 and arg2:FindFirstChild("AbsoluteImmortal", true) and not fn91(humanoid2) then
										getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 5 or not arg3.IsPlaying or v24.Unloaded) then
										continue
									end
									break
								end

								getgenv().desync = nil

								if getgenv()._revSBDKick[humanoidRootPart2] == part3 then
									getgenv()._revSBDKick[humanoidRootPart2] = nil
								end

								pcall(function()
									part3:Destroy()
								end)
							end

							if animationId:match("12830917034") and _rawget(options.AntiMoves_Genos.Value, "Anti Speedblitz Dropkick") then
								local revSBDKick = getgenv()._revSBDKick and getgenv()._revSBDKick[humanoidRootPart2]

								if revSBDKick then
									pcall(function()
										revSBDKick:Destroy()
									end)

									getgenv()._revSBDKick[humanoidRootPart2] = nil
								end

								local now2 = tick()
								task.wait(0.9)

								if humanoidRootPart2.Parent and not v24.Unloaded then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(130, 310, 130)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1

									while humanoidRootPart2.Parent do
										part3.CFrame = CFrame.new(humanoidRootPart2.Position + Vector3.new(0, -145, 0))
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 65 and math.abs(v46.Y) <= 155 and math.abs(v46.Z) <= 65 and arg2:FindFirstChild("AbsoluteImmortal", true) and not fn91(humanoid2) then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 1.55 + 0.7 or v24.Unloaded) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("16737255386") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Cosmic Strike") then
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 30
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1
										flag20 = tick() >= n15
									end

									return flag20
								end)
							end

							if animationId:match("17860467628") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Sky Snatcher") then
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(30, 20, 75)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								local now2 = tick()

								while humanoidRootPart2.Parent do
									part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -12.5)
									local cFrame2 = part3.CFrame
									local pointToObjectSpace = cFrame2.PointToObjectSpace
									local v45 = fn93()
									local v46 = pointToObjectSpace(cFrame2, v45)

									if math.abs(v46.X) <= 15 and math.abs(v46.Y) <= 10 and math.abs(v46.Z) <= 37.5 then
										getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 10 or not arg3.IsPlaying or v24.Unloaded) then
										continue
									end
									break
								end

								getgenv().desync = nil

								pcall(function()
									part3:Destroy()
								end)
							end

							if animationId:match("17464644182") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Psychic Ricochet") then
								local flag19 = false

								local connection20 = humanoid.AnimationPlayed:Connect(function(arg4)
									if (arg4.Animation and arg4.Animation.AnimationId or ""):match("17450393107") then
										flag19 = true
									end
								end)

								local now2 = tick()

								fn89(function()
									local flag20 = flag19

									if not flag19 then
										local position = humanoidRootPart2.Position
										flag20 = (fn93() - position).Magnitude > 30
									end

									if not flag20 then
										local n15 = now2 + 1
										flag20 = tick() >= n15
									end

									return flag20 or not arg3.IsPlaying
								end)

								pcall(function()
									connection20:Disconnect()
								end)
							end

							if animationId:match("17141153099") and _rawget(options.AntiMoves_KJ.Value, "Anti Stoic Bomb") then
								task.delay(2, function()
									local now2 = tick()

									while true do
										task.wait()
										local position = humanoidRootPart2.Position
										if not ((fn93() - position).Magnitude <= 75 or tick() >= now2 + 1.5) then
											continue
										end
										break
									end

									local position = humanoidRootPart2.Position

									if (fn93() - position).Magnitude <= 75 then
										local now3 = tick()

										fn89(function()
											local position2 = humanoidRootPart2.Position
											local flag19 = (fn93() - position2).Magnitude > 75
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now3 + 1.5
												flag20 = tick() >= n15
											end

											return flag20
										end)
									end
								end)
							end

							if animationId:match("17354976067") and _rawget(options.AntiMoves_KJ.Value, "Anti 20-20-20 Dropkick") then
								task.delay(1, function()
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(25, 5, 125)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local flag19 = false

									local connection20 = part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = true
										end
									end)

									local connection21 = part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = false
										end
									end)

									local now2 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)
										RunService.RenderStepped:Wait()
										if not (flag19 or tick() >= now2 + 5 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									if flag19 then
										local now3 = tick()

										fn89(function()
											local flag20 = not flag19
											local flag21

											if flag20 then
												flag21 = flag20
											else
												local n15 = now3 + 1.5
												flag21 = tick() >= n15
											end

											return flag21 or not arg3.IsPlaying
										end)
									end

									connection20:Disconnect()
									connection21:Disconnect()

									pcall(function()
										part3:Destroy()
									end)
								end)
							end

							if animationId:match("18462894593") and _rawget(options.AntiMoves_KJ.Value, "Anti Five Seasons") then
								task.delay(6.75, function()
									local now2 = tick()

									fn89(function()
										local n15 = now2 + 1
										return tick() >= n15
									end)
								end)
							end

							if animationId:match("100558589307006") and _rawget(options.AntiMoves_FrozenSoul.Value, "Anti Permafrost") then
								task.wait(0.35)

								if arg3.IsPlaying then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(45, 25, 85)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local flag19 = false

									local connection20 = part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = true
										end
									end)

									local connection21 = part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = false
										end
									end)

									local now2 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)

										if flag19 and not fn88(humanoid, "15128849047") then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										task.wait()
										if not (tick() >= now2 + 0.65 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil
									connection20:Disconnect()
									connection21:Disconnect()

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("137561511768861") and _rawget(options.AntiMoves_FrozenSoul.Value, "Anti Frost Forge") then
								task.delay(1, function()
									local now2 = tick()

									while true do
										task.wait()
										local position = humanoidRootPart2.Position
										if not ((fn93() - position).Magnitude <= 150 or tick() >= now2 + 0.75) then
											continue
										end
										break
									end

									local position = humanoidRootPart2.Position

									if (fn93() - position).Magnitude <= 150 then
										local now3 = tick()

										fn89(function()
											local position2 = humanoidRootPart2.Position
											local flag19 = (fn93() - position2).Magnitude > 150
											local flag20

											if flag19 then
												flag20 = flag19
											else
												local n15 = now3 + 0.75
												flag20 = tick() >= n15
											end

											return flag20
										end)
									end
								end)
							end

							if animationId:match("112620365240235") and _rawget(options.AntiMoves_FrozenSoul.Value, "Anti Freezing Path") then
								task.wait(0.5)

								if arg3.IsPlaying then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(20, 10, 35)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local flag19 = false

									local connection20 = part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = true
										end
									end)

									local connection21 = part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = false
										end
									end)

									local now2 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)

										if flag19 and not fn88(humanoid, "15128849047") then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										task.wait()
										if not (tick() >= now2 + 4 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil
									connection20:Disconnect()
									connection21:Disconnect()

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("75547590335774") and _rawget(options.AntiMoves_FrozenSoul.Value, "Anti Judgement Chain") then
								task.wait(0.35)

								if arg3.IsPlaying then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(10, 5, 175)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local flag19 = false

									local connection20 = part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = true
										end
									end)

									local connection21 = part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											flag19 = false
										end
									end)

									local now2 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)

										if flag19 and not fn88(humanoid, "15128849047") then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										task.wait()
										if not (tick() >= now2 + 1 or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil
									connection20:Disconnect()
									connection21:Disconnect()

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("107484339495811") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti God Slayer") then
								if not fn90(0.2) then
									return
								end
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 30
									local flag20

									if flag19 then
										flag20 = flag19
									else
										local n15 = now2 + 1.5
										flag20 = tick() >= n15
									end

									return flag20 or not arg3.IsPlaying
								end)
							end

							if animationId:match("122393983431258") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti God Slayer") then
								if not fn90(5) then
									return
								end

								for _, v45 in ipairs({ { 0, 1 }, { 0.8, 1 }, { 4, 2 } }) do
									if v45[1] > 0 and not fn90(v45[1]) then
										return
									end

									if not humanoidRootPart2.Parent or v24.Unloaded then
										return
									end

									if not arg3.IsPlaying then
										return
									end
									local now2 = tick()

									fn89(function()
										local position = humanoidRootPart2.Position
										local flag19 = (fn93() - position).Magnitude > 60
										local flag20

										if flag19 then
											flag20 = flag19
										else
											local n15 = now2 + v45[2]
											flag20 = tick() >= n15
										end

										return flag20 or not arg3.IsPlaying
									end)
								end
							end

							if animationId:match("85025226664507") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti Hunter's Mark") then
								if not fn90(1) then
									return
								end

								if humanoidRootPart2.Parent and not v24.Unloaded then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(30, 20, 40)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now2 = tick()

									while humanoidRootPart2.Parent do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -15)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 15 and math.abs(v46.Y) <= 10 and math.abs(v46.Z) <= 20 then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 0.8 or v24.Unloaded or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("84363696088617") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti Great Fajin") then
								if humanoidRootPart2.Parent and not v24.Unloaded then
									local now2 = nil

									local connection20 = humanoid.AnimationPlayed:Connect(function(arg4)
										local animation = arg4.Animation

										if animation and animation.AnimationId:match("71317401437256") then
											now2 = now2 or tick()
										end
									end)

									if not (now2 or arg3.IsPlaying) then
										pcall(function()
											connection20:Disconnect()
										end)

										return
									end

									task.wait(1)

									if humanoidRootPart2.Parent and not v24.Unloaded then
										local part3 = Instance.new("Part", workspace)
										part3.Anchored = true
										part3.Size = Vector3.new(30, 50, 210)
										part3.CanCollide = false
										part3.CanQuery = false
										part3.CanTouch = false
										part3.Transparency = getgenv()._antiBoxT or 1
										local now3 = tick()

										while humanoidRootPart2.Parent do
											part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -95)
											local cFrame2 = part3.CFrame
											local pointToObjectSpace = cFrame2.PointToObjectSpace
											local v45 = fn93()
											local v46 = pointToObjectSpace(cFrame2, v45)

											if math.abs(v46.X) <= 15 and math.abs(v46.Y) <= 25 and math.abs(v46.Z) <= 105 then
												getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
											else
												getgenv().desync = nil
											end

											RunService.RenderStepped:Wait()
											if not (tick() >= now3 + 4 or now2 and tick() >= now2 + 1 or not now2 and not arg3.IsPlaying or v24.Unloaded) then
												continue
											end
											break
										end

										getgenv().desync = nil

										pcall(function()
											part3:Destroy()
										end)
									end

									pcall(function()
										connection20:Disconnect()
									end)
								end
							end

							if animationId:match("71317401437256") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti Great Fajin") then
								if humanoidRootPart2.Parent and not v24.Unloaded then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(30, 50, 210)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now2 = tick()

									while humanoidRootPart2.Parent do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -95)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 15 and math.abs(v46.Y) <= 25 and math.abs(v46.Z) <= 105 then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 1 or v24.Unloaded or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("136465810903839") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti Sky Ripping Fist") then
								if not fn90(1) then
									return
								end

								if humanoidRootPart2.Parent and not v24.Unloaded then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(30, 30, 100)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now2 = tick()

									while humanoidRootPart2.Parent do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -40)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 15 and math.abs(v46.Y) <= 15 and math.abs(v46.Z) <= 50 then
											getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now2 + 2 or v24.Unloaded or not arg3.IsPlaying) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end
							end

							if animationId:match("97401167464229") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti Limit Breaker") then
								task.wait(2.5)

								for _, v45 in ipairs({ { 60, 0, 2 }, { 100, 0, 3 }, { 300, -200, 2 } }) do
									if not (not humanoidRootPart2.Parent or v24.Unloaded) then
										local now2 = tick()

										while humanoidRootPart2.Parent do
											local n15 = humanoidRootPart2.Position + Vector3.new(0, v45[2], 0)
											local v46 = v45[1]

											if (fn93() - n15).Magnitude <= v46 then
												getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
											else
												getgenv().desync = nil
											end

											RunService.RenderStepped:Wait()
											local n16 = now2 + v45[3]
											if not (tick() >= n16 or v24.Unloaded) then
												continue
											end
											break
										end

										getgenv().desync = nil
										continue
									end

									break
								end
							end

							if animationId:match("125265459886863") and _rawget(options.AntiMoves_MonsterForm.Value, "Anti Sky Ripping Fist") then
								if arg2:FindFirstChildOfClass("ForceField") then
									task.spawn(function()
										local flag19 = false

										local connection20 = humanoid.AnimationPlayed:Connect(function(arg4)
											local animation = arg4.Animation

											if animation and animation.AnimationId:match("112887150655350") then
												flag19 = true
											end
										end)

										local function fn94(arg4, arg5, arg6)
											if flag19 or not humanoidRootPart2.Parent or v24.Unloaded then
												return
											end
											local part3 = Instance.new("Part", workspace)
											part3.Anchored = true
											part3.Size = Vector3.new(30, 30, arg4)
											part3.CanCollide = false
											part3.CanQuery = false
											part3.CanTouch = false
											part3.Transparency = getgenv()._antiBoxT or 1
											local n15 = arg4 / 2
											local now2 = tick()

											while humanoidRootPart2.Parent do
												part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, arg5)
												local v45 = part3.CFrame:PointToObjectSpace(fn93())

												if math.abs(v45.X) <= 15 and math.abs(v45.Y) <= 15 and math.abs(v45.Z) <= n15 then
													getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
												else
													getgenv().desync = nil
												end

												RunService.RenderStepped:Wait()
												if not (flag19 or tick() >= now2 + arg6 or v24.Unloaded) then
													continue
												end
												break
											end

											getgenv().desync = nil

											pcall(function()
												part3:Destroy()
											end)
										end

										task.wait(1)
										fn94(40, -20, 5)

										if not flag19 then
											task.wait(2)
											fn94(50, -25, 1)
										end

										pcall(function()
											connection20:Disconnect()
										end)
									end)
								end
							end

							if animationId:match("121326674097055") and _rawget(options.AntiMoves_CosmicForm.Value, "Anti Gamma Ray Burst") then
								task.spawn(function()
									local now2 = tick()

									while arg3.IsPlaying and not v24.Unloaded and tick() < now2 + 10 do
										local v45 = fn93()

										if humanoidRootPart2.Parent and v45 and (v45 - humanoidRootPart2.Position).Magnitude <= 20 then
											fn89(function()
												if v24.Unloaded then
													return true
												end

												if not arg3.IsPlaying then
													return true
												end

												if now2 + 10 <= tick() then
													return true
												end

												if not humanoidRootPart2.Parent then
													return true
												end
												local v46 = fn93()
												if not v46 then
													return true
												end
												return (v46 - humanoidRootPart2.Position).Magnitude > 20
											end)
										end

										RunService.RenderStepped:Wait()
									end
								end)
							end

							if animationId:match("71181015443030") and _rawget(options.AntiMoves_CosmicForm.Value, "Anti Nuclear Fission") then
								local flag19 = true

								pcall(function()
									flag19 = math.abs(arg3.Speed - 1) <= 0.05
								end)

								if flag19 then
									if not fn90(17.2) then
										return
									end

									if humanoidRootPart2.Parent and not v24.Unloaded and _rawget(options.AntiMoves_CosmicForm.Value, "Anti Nuclear Fission") then
										local now2 = tick()

										while true do
											if not ((getgenv()._nfLastExpAt or 0) > now2) then
												local v45 = fn93()

												if v45 and (v45 - humanoidRootPart2.Position).Magnitude <= 375 then
													getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
												else
													getgenv().desync = nil
												end

												RunService.RenderStepped:Wait()
												if not (tick() >= now2 + 3 or not humanoidRootPart2.Parent or v24.Unloaded or not arg3.IsPlaying) then
													continue
												end
											end

											break
										end

										if (getgenv()._nfLastExpAt or 0) <= now2 then
											getgenv().desync = nil
										end
									end
								end
							end

							if animationId:match("139070970861356") and _rawget(options.AntiMoves_CosmicForm.Value, "Anti Singularity") then
								task.spawn(function()
									if not fn90(4) then
										return
									end

									if not humanoidRootPart2.Parent or v24.Unloaded then
										return
									end

									if not _rawget(options.AntiMoves_CosmicForm.Value, "Anti Singularity") then
										return
									end
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(400, 1000, 400)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now2 = tick()

									while humanoidRootPart2.Parent do
										if not (now2 < (getgenv()._singBallFiredAt or 0)) then
											part3.CFrame = CFrame.new(humanoidRootPart2.Position)
											local v45 = part3.CFrame:PointToObjectSpace(fn93())

											if math.abs(v45.X) <= 200 and math.abs(v45.Y) <= 500 and math.abs(v45.Z) <= 200 then
												getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
											else
												getgenv().desync = nil
											end

											RunService.RenderStepped:Wait()
											if not (tick() >= now2 + 0.7 or v24.Unloaded or not arg3.IsPlaying) then
												continue
											end
										end

										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end)

								if not fn90(2) then
									return
								end
								local now2 = tick()

								fn89(function()
									local position = humanoidRootPart2.Position
									local flag19 = (fn93() - position).Magnitude > 30

									if not flag19 then
										local n15 = now2 + 2
										flag19 = tick() >= n15
									end

									return flag19 or not arg3.IsPlaying
								end)
							end

							if animationId:match("79527508933159") and _rawget(options.AntiMoves_CosmicForm.Value, "Anti Nuclear Fission") then
								local flag19 = true

								pcall(function()
									flag19 = math.abs(arg3.Speed - 1) <= 0.05
								end)

								if flag19 then
									local now2 = tick()
									local nfCastTimes

									while true do
										nfCastTimes = getgenv()._nfCastTimes
										nfCastTimes = nfCastTimes and nfCastTimes[arg.Name]

										if not (nfCastTimes and math.abs(nfCastTimes - now2) < 1.5) then
											local thrown = workspace:FindFirstChild("Thrown")

											if thrown and thrown:FindFirstChild("EFPNUCLEAR_" .. arg.Name) then
												nfCastTimes = now2
												break
											else
												task.wait(0.05)
												nfCastTimes = nil
												if not (tick() - now2 > 0.8) then
													continue
												end
											end
										end

										break
									end

									if nfCastTimes then
										local revCosmicAnti = getgenv()._revCosmicAnti

										if revCosmicAnti and revCosmicAnti.trackNFPortal then
											task.spawn(revCosmicAnti.trackNFPortal, humanoidRootPart2)
										end

										local now3 = tick()

										fn89(function()
											local position = humanoidRootPart2.Position
											local flag20 = (fn93() - position).Magnitude > 49

											if not flag20 then
												local n15 = now3 + 0.8
												flag20 = tick() >= n15
											end

											return flag20 or not arg3.IsPlaying
										end)
									end
								end
							end

							if animationId:match("11343318134") and _rawget(options.AntiMoves_Saitama.Value, "Anti Death Counter Shockwave") then
								task.wait(7.5)
								if not arg3.IsPlaying then
									return
								end
								local tbl40 = {}
								local tbl41 = {}
								local n15 = CFrame.new(60, 0, -250) * CFrame.Angles(0, -0.26179938779914941, 0)
								local n16 = CFrame.new(-60, 0, -250) * CFrame.Angles(0, 0.26179938779914941, 0)
								local cframe2 = CFrame.new
								tbl41[1] = n15
								tbl41[2] = n16

								do
									local values = table.pack(cframe2(0, 0, -250))
									table.move(values, 1, values.n, 3, tbl41)
								end

								local tbl42 = { false, false, false }
								local tbl43 = {}

								for i in ipairs(tbl41) do
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(125, 5, 500)
									part3.CanCollide = false
									part3.Transparency = getgenv()._antiBoxT or 1
									table.insert(tbl40, part3)
									local v45 = i

									table.insert(tbl43, part3.Touched:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											tbl42[v45] = true
										end
									end))

									table.insert(tbl43, part3.TouchEnded:Connect(function(hit)
										if hit == humanoidRootPart3 or hit == getgenv().InvisPart30 then
											tbl42[v45] = false
										end
									end))
								end

								local now2 = tick()

								while true do
									for i, v45 in ipairs(tbl40) do
										v45.CFrame = humanoidRootPart2.CFrame * tbl41[i]
									end

									if tbl42[1] or tbl42[2] or tbl42[3] then
										getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 2.5 or not arg3.IsPlaying) then
										continue
									end
									break
								end

								getgenv().desync = nil

								for _, v45 in ipairs(tbl43) do
									v45:Disconnect()
								end

								for _, v45 in ipairs(tbl40) do
									pcall(function()
										v45:Destroy()
									end)
								end
							end

							if animationId:match("116972556865480") and _rawget(options.AntiMoves_TechProdigy.Value, "Anti Railgun") then
								local now2 = nil

								local connection20 = arg2.DescendantAdded:Connect(function(descendant)
									if descendant:IsA("Sound") and tostring(descendant.SoundId):match("134381535082318") then
										now2 = tick()
									end
								end)

								local now3 = tick()
								local now4 = nil
								local exitTo = nil

								while true do
									if now2 then
										exitTo = 1
										break
									else
										if not arg3.IsPlaying then
											now4 = now4 or tick()
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now3 + 30 or now4 and tick() >= now4 + 1.5) then
											continue
										end
										break
									end
								end

								if exitTo == 1 then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.Size = Vector3.new(10, 10, 268)
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									local now5 = tick()

									while true do
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -part3.Size.Z / 2)
										local cFrame2 = part3.CFrame
										local pointToObjectSpace = cFrame2.PointToObjectSpace
										local v45 = fn93()
										local v46 = pointToObjectSpace(cFrame2, v45)

										if math.abs(v46.X) <= 5 and math.abs(v46.Y) <= 5 and math.abs(v46.Z) <= 134 then
											getgenv().desync = { CFrame = cframe }
										else
											getgenv().desync = nil
										end

										RunService.RenderStepped:Wait()
										if not (tick() >= now5 + 1 or v24.Unloaded or not humanoidRootPart2.Parent) then
											continue
										end
										break
									end

									getgenv().desync = nil

									pcall(function()
										part3:Destroy()
									end)
								end

								getgenv().desync = nil
								connection20:Disconnect()
							end

							if animationId:match("89247791365343") and _rawget(options.AntiMoves_TechProdigy.Value, "Anti Tactical Storm") then
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(35, 15, 35)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								local now2 = tick()

								while true do
									part3.CFrame = humanoidRootPart2.CFrame
									local cFrame2 = part3.CFrame
									local pointToObjectSpace = cFrame2.PointToObjectSpace
									local v45 = fn93()
									local v46 = pointToObjectSpace(cFrame2, v45)

									if math.abs(v46.X) <= 17.5 and math.abs(v46.Y) <= 7.5 and math.abs(v46.Z) <= 17.5 then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 4.7 or not humanoidRootPart2.Parent or v24.Unloaded) then
										continue
									end
									break
								end

								getgenv().desync = nil

								pcall(function()
									part3:Destroy()
								end)
							end
						end)
					end)

					if tbl7[arg] then
						for _, v44 in ipairs(tbl7[arg]) do
							pcall(function()
								v44:Disconnect()
							end)
						end
					end

					local tbl40 = {}
					tbl7[arg] = tbl40
					local obj3 = setmetatable({}, { __mode = "k" })

					local function fn89()
						local invisPart30 = getgenv().InvisPart30
						if getgenv().InvisActive and invisPart30 then
							return invisPart30.Position
						end
						local character = localPlayer3.Character
						character = character and character:FindFirstChild("HumanoidRootPart")
						return character and character.Position
					end

					local function fn90(arg3)
						task.spawn(function()
							if arg3 and arg3 > 0 then
								task.wait(arg3)
							end

							pcall(function()
								local character = localPlayer3.Character
								local communicate = character and character:FindFirstChild("Communicate")
								if not communicate or not character:FindFirstChild("Mech") then
									return
								end
								local currentCamera = workspace.CurrentCamera
								communicate:FireServer({ Goal = "KeyPress", Key = Enum.KeyCode.F, MousePos = currentCamera and currentCamera.CFrame or CFrame.new() })
							end)
						end)
					end

					local tbl41 = {
						["102363056607622"] = { mag = 35, parry = true, parryDelay = 0.1 },
						["123296069589003"] = { mag = 28, parry = true, parryDelay = 0 },
						["134784174843500"] = { mag = 29, parry = true, parryDelay = 0.2 },
						["109396157070251"] = { mag = 25, jm = true, parry = true, parryDelay = 0.4 },
					}

					local tbl42 = { size = Vector3.new(50, 20, 50), off = 0, life = 1, parry = true, parryDelay = 0 }
					local tbl43 = { mag = 42, delay = 1, life = 1.5 }
					local tbl44 = { size = Vector3.new(200, 1000, 200), offY = -480, delay = 0.8, life = 2 }
					local tbl45 = { size = Vector3.new(200, 1000, 200), offY = -480, delay = 5.3, life = 1 }
					local tbl46 = { mag = 60, life = 2.8 }

					local function fn91(arg3)
						task.spawn(function()
							if arg3.delay then
								task.wait(arg3.delay)
							end

							if v24.Unloaded then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
							local part3 = nil

							if not arg3.mag then
								part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = arg3.size
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
							end

							local now2 = tick()
							local flag19 = false

							while true do
								if humanoidRootPart2 and humanoidRootPart2.Parent then
									local v44 = fn89()

									if not arg3.mag then
										part3.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, arg3.offY or 0, arg3.off or 0)
									end

									if v44 then
										local flag20 = not arg3.mag and part3.CFrame:PointToObjectSpace(v44) or nil
										local mag = arg3.mag

										if mag then
											mag = (v44 - humanoidRootPart2.Position + Vector3.new(0, arg3.offY or 0, 0)).Magnitude <= arg3.mag
										end

										local flag21

										if mag then
											flag21 = mag
										else
											local flag22

											if flag20 then
												local n15 = arg3.size.X / 2
												flag22 = math.abs(flag20.X) <= n15
											else
												flag22 = flag20
											end

											if flag22 then
												local n15 = arg3.size.Y / 2
												flag21 = math.abs(flag20.Y) <= n15
											else
												flag21 = flag22
											end

											if flag21 then
												local n15 = arg3.size.Z / 2
												flag21 = math.abs(flag20.Z) <= n15
											end
										end

										if flag21 then
											if arg3.parry and localPlayer3.Character and localPlayer3.Character:FindFirstChild("Mech") then
												getgenv().desync = nil

												if not flag19 then
													fn90(arg3.parryDelay)
													flag19 = true
												end
											else
												getgenv().desync = { CFrame = cframe }
											end
										else
											getgenv().desync = nil
										end
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + (arg3.life or 1.1) or v24.Unloaded) then
										continue
									end
								end

								break
							end

							getgenv().desync = nil

							if part3 then
								pcall(function()
									part3:Destroy()
								end)
							end
						end)
					end

					local function fn92(arg3)
						task.spawn(function()
							task.wait(6)
							if v24.Unloaded then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
							local now2 = tick()

							while true do
								if not (not (humanoidRootPart2 and humanoidRootPart2.Parent) or not arg3:IsDescendantOf(workspace)) then
									local invisPart30 = getgenv().InvisPart30
									local position

									if getgenv().InvisActive and invisPart30 then
										position = invisPart30.Position
									else
										position = localPlayer3.Character
										position = position and position:FindFirstChild("HumanoidRootPart")
										position = position and position.Position
									end

									if position then
										if (position - humanoidRootPart2.Position).Magnitude <= 60 then
											getgenv().desync = { CFrame = cframe }
										else
											getgenv().desync = nil
										end
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 1.5 or v24.Unloaded) then
										continue
									end
								end

								break
							end

							getgenv().desync = nil
						end)
					end

					local function fn93(arg3)
						task.spawn(function()
							local animationController = arg3:FindFirstChildOfClass("AnimationController") or arg3:WaitForChild("AnimationController", 10)
							if not animationController then
								return
							end

							local function fn94()
								if obj3[arg3] then
									return
								end

								if _rawget(options.AntiMoves_TechProdigy.Value, "Anti Iron Giant") then
									obj3[arg3] = true
									fn92(arg3)
								end
							end

							local function fn95(arg4)
								if arg4:match("76020797916551") then
									fn94()
									return
								end

								if arg4:match("121434691577715") and _rawget(options.AntiMoves_TechProdigy.Value, "Anti Mech Dash") then
									fn91(tbl42)
									return
								end

								if arg4:match("73164438751875") and _rawget(options.AntiMoves_TechProdigy.Value, "Anti Photon Edge") then
									fn91(tbl43)
									return
								end

								if arg4:match("132749700521148") and _rawget(options.AntiMoves_TechProdigy.Value, "Anti Photon Dive") then
									fn91(tbl44)
									fn91(tbl45)
									return
								end

								if arg4:match("133153701552920") and _rawget(options.AntiMoves_TechProdigy.Value, "Anti Conquest") then
									fn91(tbl46)
									return
								end

								if _rawget(options.AntiMoves_TechProdigy.Value, "Anti Mech M1s") then
									for k, v44 in pairs(tbl41) do
										if arg4:match(k) then
											if v44.jm then
												getgenv()._revJMArmUntil = tick() + 4
												getgenv()._revJMArmRoot = humanoidRootPart2
											end

											fn91(v44)
											return
										end
									end
								end
							end

							local animator = animationController:FindFirstChildOfClass("Animator")

							if animator then
								for _, v44 in pairs(animator:GetPlayingAnimationTracks()) do
									fn95(v44.Animation and v44.Animation.AnimationId or "")
								end
							end

							table.insert(tbl40, animationController.AnimationPlayed:Connect(function(arg4)
								fn95(arg4.Animation and arg4.Animation.AnimationId or "")
							end))
						end)
					end

					local mech = arg2:FindFirstChild("Mech")

					if mech then
						fn93(mech)
					end

					table.insert(tbl40, arg2.ChildAdded:Connect(function(child)
						if child.Name == "Mech" then
							fn93(child)
						end
					end))
				end

				fn19 = function(arg)
					if arg == localPlayer3 then
						return
					end

					if arg.Character then
						task.spawn(fn20, arg, arg.Character)
					end

					tbl6[arg] = arg.CharacterAdded:Connect(function(character)
						task.spawn(fn20, arg, character)
					end)
				end

				for _, player in pairs(Players:GetPlayers()) do
					task.spawn(fn19, player)
				end

				local connection20 = Players.PlayerAdded:Connect(function(player)
					if player == localPlayer3 then
						return
					end

					task.spawn(function()
						local now2 = tick()

						while true do
							RunService.RenderStepped:Wait()
							if not (player:GetAttribute("PreloadDone") or tick() >= now2 + 30) then
								continue
							end
							break
						end

						if player and player.Parent then
							if player.Character then
								task.spawn(fn20, player, player.Character)
							end

							tbl6[player] = player.CharacterAdded:Connect(function(character)
								task.spawn(fn20, player, character)
							end)
						end
					end)
				end)

				Players.PlayerRemoving:Connect(function(player)
					if tbl5[player] then
						pcall(function()
							tbl5[player]:Disconnect()
						end)

						tbl5[player] = nil
					end

					if tbl6[player] then
						pcall(function()
							tbl6[player]:Disconnect()
						end)

						tbl6[player] = nil
					end

					if tbl7[player] then
						for _, v44 in ipairs(tbl7[player]) do
							pcall(function()
								v44:Disconnect()
							end)
						end

						tbl7[player] = nil
					end
				end)

				local connection21 = nil

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end

					connection21 = thrown.ChildAdded:Connect(function(child)
						if child.Name ~= "JustMeshes" then
							return
						end
						local now2 = tick()
						if (getgenv()._revJMArmUntil or 0) < now2 then
							return
						end

						if not _rawget(options.AntiMoves_TechProdigy.Value, "Anti Mech M1s") then
							return
						end

						task.spawn(function()
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
							local part3 = Instance.new("Part", workspace)
							part3.Anchored = true
							part3.Size = Vector3.new(50, 50, 70)
							part3.CanCollide = false
							part3.CanQuery = false
							part3.CanTouch = false
							part3.Transparency = getgenv()._antiBoxT or 1
							local vector = Vector3.new(0, 0, -1)

							pcall(function()
								local revJMArmRoot = getgenv()._revJMArmRoot

								if revJMArmRoot and revJMArmRoot.Parent then
									local lookVector = revJMArmRoot.CFrame.LookVector
									vector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
								end
							end)

							local now3 = tick()

							while child.Parent do
								local ok, result = pcall(function()
									return child:GetPivot().Position
								end)

								if not (not ok or not result) then
									part3.CFrame = CFrame.lookAt(result, result + vector)
									local invisPart30 = getgenv().InvisPart30
									local position

									if getgenv().InvisActive and invisPart30 then
										position = invisPart30.Position
									else
										position = localPlayer3.Character
										position = position and position:FindFirstChild("HumanoidRootPart")
										position = position and position.Position
									end

									if position then
										local v44 = part3.CFrame:PointToObjectSpace(position)

										if math.abs(v44.X) <= 25 and math.abs(v44.Y) <= 25 and math.abs(v44.Z) <= 35 then
											getgenv().desync = { CFrame = cframe }
										else
											getgenv().desync = nil
										end
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now3 + 10 or v24.Unloaded) then
										continue
									end
								end

								break
							end

							getgenv().desync = nil

							pcall(function()
								part3:Destroy()
							end)
						end)
					end)
				end)

				local tbl40 = { tracked = {}, had = false, thrownConn = nil, renderConn = nil }

				local function fn88()
					local invisPart30 = getgenv().InvisPart30
					if getgenv().InvisActive and invisPart30 then
						return invisPart30.Position
					end
					local character = localPlayer3.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					return character and character.Position
				end

				local function fn89(child)
					if child.Name ~= "Missile" then
						return
					end

					if tbl40.tracked[child] then
						return
					end

					if not _rawget(options.AntiMoves_TechProdigy.Value, "Anti Missiles") then
						return
					end

					if not (child:IsA("BasePart") or child:IsA("Model")) then
						return
					end
					local part3 = Instance.new("Part", workspace)
					part3.Anchored = true
					part3.Size = Vector3.new(45, 30, 45)
					part3.CanCollide = false
					part3.CanQuery = false
					part3.CanTouch = false
					part3.Transparency = getgenv()._antiBoxT or 1
					tbl40.tracked[child] = part3

					child.AncestryChanged:Connect(function(child2, parent)
						if not parent and tbl40.tracked[child] then
							pcall(function()
								tbl40.tracked[child]:Destroy()
							end)

							tbl40.tracked[child] = nil

							if next(tbl40.tracked) == nil and tbl40.had then
								getgenv().desync = nil
								tbl40.had = false
							end
						end
					end)
				end

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end
					tbl40.thrownConn = thrown.ChildAdded:Connect(fn89)
				end)

				tbl40.renderConn = RunService.RenderStepped:Connect(function()
					if not _rawget(options.AntiMoves_TechProdigy.Value, "Anti Missiles") then
						if next(tbl40.tracked) ~= nil then
							for k, v44 in pairs(tbl40.tracked) do
								pcall(function()
									v44:Destroy()
								end)

								tbl40.tracked[k] = nil
							end
						end

						if tbl40.had then
							getgenv().desync = nil
							tbl40.had = false
						end

						return
					end

					if next(tbl40.tracked) == nil then
						return
					end
					local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
					local v44 = fn88()
					local flag19 = false

					for k, v45 in pairs(tbl40.tracked) do
						if k.Parent then
							local cFrame2

							if k:IsA("Model") then
								local ok

								ok, cFrame2 = pcall(function()
									return k:GetPivot()
								end)

								cFrame2 = ok and cFrame2 or nil
							else
								cFrame2 = k.CFrame
							end

							if cFrame2 then
								v45.CFrame = cFrame2

								if v44 then
									local v46 = cFrame2:PointToObjectSpace(v44)

									if math.abs(v46.X) <= 22.5 and math.abs(v46.Y) <= 15 and math.abs(v46.Z) <= 22.5 then
										flag19 = true
									end
								end
							end
						end
					end

					if flag19 then
						getgenv().desync = { CFrame = cframe }
						tbl40.had = true
					elseif tbl40.had then
						getgenv().desync = nil
						tbl40.had = false
					end
				end)

				local connection22 = nil

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end

					connection22 = thrown.ChildAdded:Connect(function(child)
						task.spawn(function()
							if not _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Cosmic Strike") then
								return
							end

							if not (child:IsA("Part") and child.Name == "Part") then
								return
							end

							local ok, result = pcall(function()
								return child.Shape == Enum.PartType.Ball
							end)

							if not ok or not result then
								return
							end
							local size = child.Size
							if math.abs(size.X - 60) > 0.5 or math.abs(size.Y - 60) > 0.5 or math.abs(size.Z - 60) > 0.5 then
								return
							end
							local now2 = tick()

							while child:GetAttribute("Spawn") == nil do
								if tick() - now2 > 1.5 or not child.Parent or v24.Unloaded then
									return
								end
								task.wait(0.05)
							end

							task.wait(3)
							if not child.Parent or v24.Unloaded then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
							local part3 = Instance.new("Part", workspace)
							part3.Anchored = true
							part3.Size = Vector3.new(200, 1000, 200)
							part3.CanCollide = false
							part3.CanQuery = false
							part3.CanTouch = false
							part3.Transparency = getgenv()._antiBoxT or 1
							part3.CFrame = CFrame.new(child.Position)
							local now3 = tick()
							local now4 = nil

							while true do
								if child.Parent then
									part3.CFrame = CFrame.new(child.Position)
								else
									now4 = now4 or tick()
								end

								local invisPart30 = getgenv().InvisPart30
								local position

								if getgenv().InvisActive and invisPart30 then
									position = invisPart30.Position
								else
									position = localPlayer3.Character
									position = position and position:FindFirstChild("HumanoidRootPart")
									position = position and position.Position
								end

								if position then
									local v44 = part3.CFrame:PointToObjectSpace(position)

									if math.abs(v44.X) <= 100 and math.abs(v44.Y) <= 500 and math.abs(v44.Z) <= 100 then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end
								end

								RunService.RenderStepped:Wait()
								if not (now4 and tick() >= now4 + 0.7 or tick() >= now3 + 30 or v24.Unloaded) then
									continue
								end
								break
							end

							getgenv().desync = nil

							pcall(function()
								part3:Destroy()
							end)
						end)
					end)
				end)

				local connection23 = nil

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end

					connection23 = thrown.ChildAdded:Connect(function(child)
						task.spawn(function()
							if child.Name ~= "Meteorite" then
								return
							end

							if not _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Cosmic Strike") then
								return
							end

							if v24.Unloaded then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)
							local part3 = Instance.new("Part", workspace)
							part3.Anchored = true
							part3.Size = Vector3.new(150, 200, 150)
							part3.CanCollide = false
							part3.CanQuery = false
							part3.CanTouch = false
							part3.Transparency = getgenv()._antiBoxT or 1
							local now2 = nil

							child.AncestryChanged:Connect(function(child2, parent)
								if not parent and not now2 then
									now2 = tick()
								end
							end)

							local now3 = tick()

							while true do
								if child.Parent then
									local ok, result = pcall(function()
										return child:IsA("Model") and child:GetPivot() or child.CFrame
									end)

									if ok and result then
										part3.CFrame = CFrame.new(result.Position + Vector3.new(0, -100, 0))
									end
								end

								local invisPart30 = getgenv().InvisPart30
								local position

								if getgenv().InvisActive and invisPart30 then
									position = invisPart30.Position
								else
									position = localPlayer3.Character
									position = position and position:FindFirstChild("HumanoidRootPart")
									position = position and position.Position
								end

								if position then
									local v44 = part3.CFrame:PointToObjectSpace(position)

									if math.abs(v44.X) <= 75 and math.abs(v44.Y) <= 100 and math.abs(v44.Z) <= 75 then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end
								end

								RunService.RenderStepped:Wait()
								if not (tick() >= now3 + 3.5 or now2 and tick() >= now2 + 0.2 or v24.Unloaded) then
									continue
								end
								break
							end

							getgenv().desync = nil

							pcall(function()
								part3:Destroy()
							end)
						end)
					end)
				end)

				getgenv()._revCosmicAnti = getgenv()._revCosmicAnti or {}
				local revCosmicAnti = getgenv()._revCosmicAnti
				revCosmicAnti.myCastConns = {}

				revCosmicAnti.hookMyCast = function(arg)
					for _, myCastConn in ipairs(revCosmicAnti.myCastConns) do
						pcall(function()
							myCastConn:Disconnect()
						end)
					end

					revCosmicAnti.myCastConns = {}
					local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")

					if humanoid then
						table.insert(revCosmicAnti.myCastConns, humanoid.AnimationPlayed:Connect(function(arg2)
							local animation = arg2.Animation

							if animation and animation.AnimationId:match("139070970861356") then
								getgenv()._singMyCastAt = tick()
							end
						end))
					end

					if arg then
						table.insert(revCosmicAnti.myCastConns, arg.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("Sound") then
								local str9 = tostring(descendant.SoundId)

								if str9:match("90982015898562") or str9:match("116652942039151") then
									getgenv()._singMyCastAt = tick()
								end
							end
						end))
					end
				end

				if localPlayer3.Character then
					task.spawn(revCosmicAnti.hookMyCast, localPlayer3.Character)
				end

				revCosmicAnti.myCharConn = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(1)
					revCosmicAnti.hookMyCast(character)
				end)

				getgenv()._singShoots = getgenv()._singShoots or {}

				if not getgenv()._singRepHooked then
					local replication = ReplicatedStorage:FindFirstChild("Replication")

					if replication and replication:IsA("RemoteEvent") then
						getgenv()._singRepHooked = true

						revCosmicAnti.singRepConn = replication.OnClientEvent:Connect(function(arg)
							if type(arg) == "table" and tostring(arg.Mod) == "Orb" and typeof(arg.Char) == "Instance" then
								local str9 = tostring(arg.Event)

								if str9 == "ShootEvent" or str9 == "FirstEvent" then
									local singShoots = getgenv()._singShoots

									singShoots[#singShoots + 1] = {
										char = arg.Char,
										t = tick(),
										pos = arg.Char.PrimaryPart and arg.Char.PrimaryPart.Position,
									}

									while #singShoots > 10 do
										table.remove(singShoots, 1)
									end
								end
							end
						end)
					end
				end

				getgenv()._singBallCaster = function(arg)
					local v44, v45, v46 = ipairs(getgenv()._singShoots or {})
					local huge = math.huge
					local char = nil

					for _, v47 in v44, v45, v46 do
						local t = v47.t
						local n15 = tick() - t

						if n15 >= 0 and n15 < 0.9 then
							if v47.pos and arg then
								n15 += (v47.pos - arg).Magnitude / 500
							end

							if n15 < huge then
								char = v47.char
								huge = n15
							end
						end
					end

					return char
				end

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end

					revCosmicAnti.singConn = thrown.ChildAdded:Connect(function(child)
						task.spawn(function()
							if not _rawget(options.AntiMoves_CosmicForm.Value, "Anti Singularity") then
								return
							end

							if v24.Unloaded then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)

							local function fn90()
								local invisPart30 = getgenv().InvisPart30
								if getgenv().InvisActive and invisPart30 then
									return invisPart30.Position
								end
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								return character and character.Position
							end

							local function fn91(arg)
								getgenv()._singLastImpact = { t = tick(), pos = arg }
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(250, 1000, 250)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								part3.CFrame = CFrame.new(arg)
								local now2 = tick()

								while true do
									local v44 = fn90()

									if v44 then
										local v45 = part3.CFrame:PointToObjectSpace(v44)

										if math.abs(v45.X) <= 125 and math.abs(v45.Y) <= 500 and math.abs(v45.Z) <= 125 then
											local desync = { CFrame = cframe }
											getgenv().desync = desync
										else
											getgenv().desync = nil
										end
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 3 or v24.Unloaded) then
										continue
									end
									break
								end

								getgenv().desync = nil

								pcall(function()
									part3:Destroy()
								end)
							end

							if child:IsA("BasePart") and child.Name == "EnergyBallProjectile" then
								local singBallCaster = getgenv()._singBallCaster

								if singBallCaster then
									local position = child.Position
									singBallCaster = getgenv()._singBallCaster(position)
								end

								local flag19

								if singBallCaster ~= nil then
									flag19 = singBallCaster == localPlayer3.Character
								else
									local singMyCastAt = getgenv()._singMyCastAt
									singMyCastAt = singMyCastAt and tick() - singMyCastAt < 8
									flag19 = false

									if singMyCastAt then
										flag19 = localPlayer3.Character
										flag19 = flag19 and flag19:FindFirstChild("HumanoidRootPart")
										flag19 = flag19 and (flag19.Position - child.Position).Magnitude <= 20 or false
									end
								end

								if flag19 then
									local now2 = tick()
									local position

									while true do
										position = child.Position
										RunService.RenderStepped:Wait()
										if not (not child.Parent or tick() >= now2 + 15 or v24.Unloaded) then
											continue
										end
										break
									end

									if not child.Parent then
										getgenv()._singLastImpact = { t = tick(), pos = position }
									end

									return
								end

								local position = child.Position
								local now2 = tick()
								local flag20

								while true do
									local flag21 = child.Parent and tick() - now2 < 0.35
									flag20 = false

									if flag21 then
										if (child.Position - position).Magnitude > 2 then
											flag20 = true
											break
										else
											RunService.RenderStepped:Wait()
											continue
										end
									end

									break
								end

								if not flag20 or v24.Unloaded then
									return
								end
								getgenv()._singBallFiredAt = tick()
								local part3 = Instance.new("Part", workspace)
								part3.Anchored = true
								part3.Size = Vector3.new(400, 1000, 400)
								part3.CanCollide = false
								part3.CanQuery = false
								part3.CanTouch = false
								part3.Transparency = getgenv()._antiBoxT or 1
								local now3 = tick()
								local flag21 = false
								local v44 = nil
								local flag22 = false
								local n15 = 0

								while true do
									if not child.Parent then
										flag21 = true
										break
									else
										part3.CFrame = child.CFrame
										local position2 = child.Position

										if v44 then
											local magnitude = (position2 - v44).Magnitude

											if magnitude > 1 then
												flag22 = true
												n15 = 0
											elseif flag22 and magnitude < 0.1 then
												n15 += 1

												if n15 >= 3 then
													flag21 = true
												end
											end
										end

										if flag21 then
											v44 = position2
											break
										end
										local v45 = fn90()

										if v45 then
											local v46 = part3.CFrame:PointToObjectSpace(v45)

											if math.abs(v46.X) <= 200 and math.abs(v46.Y) <= 500 and math.abs(v46.Z) <= 200 then
												getgenv().desync = { CFrame = cframe }
											else
												getgenv().desync = nil
											end
										end

										RunService.RenderStepped:Wait()
										if tick() >= now3 + 15 or v24.Unloaded then
											v44 = position2
											break
										end
										v44 = position2
									end
								end

								getgenv().desync = nil

								pcall(function()
									part3:Destroy()
								end)

								if flag21 and v44 and not v24.Unloaded then
									fn91(v44)
								end
							elseif child:IsA("BasePart") and child.Name == "Blast1ImpactFrame" then
								local singLastImpact = getgenv()._singLastImpact
								local flag19

								if singLastImpact then
									local t = singLastImpact.t
									flag19 = tick() - t < 1.5
								else
									flag19 = singLastImpact
								end

								if flag19 and (child.Position - singLastImpact.pos).Magnitude < 80 then
									return
								end
								fn91(child.Position)
							end
						end)
					end)
				end)

				revCosmicAnti.trackNFPortal = function(arg)
					local thrown = workspace:FindFirstChild("Thrown")
					if not thrown or not arg then
						return
					end
					getgenv()._nfGen = getgenv()._nfGen or setmetatable({}, { __mode = "k" })
					getgenv()._nfGen[arg] = (getgenv()._nfGen[arg] or 0) + 1
					local v44 = getgenv()._nfGen[arg]
					local v45 = nil

					local connection24 = thrown.ChildAdded:Connect(function(child)
						if not v45 and child:IsA("Model") and child.Name == "PortalModel" then
							v45 = child
						end
					end)

					local now2 = tick()

					while true do
						task.wait(0.05)
						if not (v45 or tick() - now2 > 1.5 or v24.Unloaded) then
							continue
						end
						break
					end

					pcall(function()
						connection24:Disconnect()
					end)

					if not v45 or v24.Unloaded then
						return
					end
					local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)

					local function fn90()
						local invisPart30 = getgenv().InvisPart30
						if getgenv().InvisActive and invisPart30 then
							return invisPart30.Position
						end
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
						return humanoidRootPart2 and humanoidRootPart2.Position
					end

					local now3 = tick()
					local flag19

					while true do
						if getgenv()._nfGen[arg] ~= v44 then
							flag19 = true
							break
						else
							flag19 = false

							if v45.Parent then
								local ok, result = pcall(function()
									return v45:GetPivot()
								end)

								if ok then
									local v46 = fn90()

									if v46 and (v46 - result.Position).Magnitude <= 30 then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end
								end

								RunService.RenderStepped:Wait()
								if not (tick() >= now3 + 60 or v24.Unloaded) then
									continue
								end
							end

							break
						end
					end

					if not flag19 then
						getgenv().desync = nil
					end
				end

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end
					local tbl41 = {}
					local nfLastExpAt = 0
					local v44 = nil
					local n15 = 0

					revCosmicAnti.nfConn = thrown.ChildAdded:Connect(function(child)
						task.spawn(function()
							if not _rawget(options.AntiMoves_CosmicForm.Value, "Anti Nuclear Fission") then
								return
							end

							if v24.Unloaded then
								return
							end
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)

							local function fn90()
								local invisPart30 = getgenv().InvisPart30
								if getgenv().InvisActive and invisPart30 then
									return invisPart30.Position
								end
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								return character and character.Position
							end

							if child:IsA("Folder") and child.Name:match("^EFPNUCLEAR_") then
								getgenv()._nfCastTimes = getgenv()._nfCastTimes or {}
								getgenv()._nfCastTimes[child.Name:gsub("^EFPNUCLEAR_", "")] = tick()

								if child.Name == "EFPNUCLEAR_" .. localPlayer3.Name then
									n15 = tick() + 15
								else
									table.insert(tbl41, tick())
								end
							elseif child:IsA("Model") and child.Name == "ExploFx" then
								if tick() < n15 then
									return
								end

								local ok, result = pcall(function()
									return child:GetPivot().Position
								end)

								if not ok then
									return
								end

								if tick() - nfLastExpAt < 2 and v44 and (result - v44).Magnitude < 100 then
									return
								end
								nfLastExpAt = tick()
								v44 = result
								getgenv()._nfLastExpAt = nfLastExpAt
								local now2 = tick()

								while true do
									local v45 = fn90()

									if v45 and (v45 - result).Magnitude <= 375 then
										getgenv().desync = { CFrame = cframe }
									else
										getgenv().desync = nil
									end

									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 5 or v24.Unloaded) then
										continue
									end
									break
								end

								getgenv().desync = nil
							end
						end)
					end)
				end)

				task.spawn(function()
					local thrown = workspace:WaitForChild("Thrown", 10)
					if not thrown then
						return
					end

					revCosmicAnti.grbConn = thrown.DescendantAdded:Connect(function(descendant)
						task.spawn(function()
							if not descendant:IsA("BasePart") then
								return
							end
							local parent = descendant.Parent
							if not parent or parent.Name ~= "Beam" and parent.Name ~= "Beam2" then
								return
							end
							local parent2 = parent.Parent
							if not parent2 or not tostring(parent2.Name):match("^GammaRayBurst") then
								return
							end

							if not _rawget(options.AntiMoves_CosmicForm.Value, "Anti Gamma Ray Burst") then
								return
							end

							if v24.Unloaded then
								return
							end
							getgenv()._grbArmed = getgenv()._grbArmed or setmetatable({}, { __mode = "k" })
							local v44 = getgenv()._grbArmed[parent2]
							if v44 and tick() - v44 < 5 then
								return
							end
							getgenv()._grbArmed[parent2] = tick()
							local cframe = CFrame.new(-3.4e38, -3.4e38, -3.4e38)

							local function fn90()
								local invisPart30 = getgenv().InvisPart30
								if getgenv().InvisActive and invisPart30 then
									return invisPart30.Position
								end
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								return character and character.Position
							end

							local character = localPlayer3.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")
							local flag19 = false

							if humanoid then
								local ok, result = pcall(function()
									return humanoid:GetPlayingAnimationTracks()
								end)

								ok = ok and result
								local flag20 = false

								if ok then
									local flag21 = false

									for _, v45 in ipairs(result) do
										local animation = v45.Animation
										if animation and tostring(animation.AnimationId):match("121326674097055") and v45.IsPlaying then
											flag21 = true
											break
										end
									end

									flag19 = flag21
								else
									flag19 = flag20
								end
							end

							if flag19 then
								return
							end
							RunService.RenderStepped:Wait()
							RunService.RenderStepped:Wait()
							local tbl41 = {}

							for _, v45 in ipairs({ "Beam", "Beam2" }) do
								local v46 = parent2:FindFirstChild(v45)

								if v46 then
									local n15 = 0
									local v47 = nil

									for _, child in ipairs(v46:GetChildren()) do
										if child:IsA("BasePart") then
											local n16 = math.max(child.Size.X, child.Size.Y, child.Size.Z)

											if n15 < n16 then
												n15 = n16
												v47 = child
											end
										end
									end

									if v47 then
										tbl41[v45] = v47
									end
								end
							end

							local tbl42 = {}

							for _, v45 in ipairs({ "Beam", "Beam2" }) do
								if tbl41[v45] then
									local part3 = Instance.new("Part", workspace)
									part3.Anchored = true
									part3.CanCollide = false
									part3.CanQuery = false
									part3.CanTouch = false
									part3.Transparency = getgenv()._antiBoxT or 1
									table.insert(tbl42, { arm = tbl41[v45], box = part3 })
								end
							end

							if #tbl42 == 0 then
								return
							end
							local now2 = tick()

							while true do
								local flag20 = false
								local flag21 = false

								for _, v45 in ipairs(tbl42) do
									local arm = v45.arm

									if arm.Parent then
										local size = arm.Size
										local vector

										if size.Y >= size.X and size.Y >= size.Z then
											vector = Vector3.new(1.5, 1.1, 1.5)
										elseif size.X >= size.Y and size.X >= size.Z then
											vector = Vector3.new(1.1, 1.5, 1.5)
										else
											vector = Vector3.new(1.5, 1.5, 1.1)
										end

										v45.box.Size = size * vector
										v45.box.CFrame = arm.CFrame
										local v46 = fn90()
										flag20 = true

										if v46 then
											local v47 = v45.box.CFrame:PointToObjectSpace(v46)
											local n15 = v45.box.Size / 2
											local x = n15.X
											local flag22 = math.abs(v47.X) <= x

											if flag22 then
												local y = n15.Y
												flag22 = math.abs(v47.Y) <= y
											end

											local flag23

											if flag22 then
												local z = n15.Z
												flag23 = math.abs(v47.Z) <= z
											else
												flag23 = flag22
											end

											if flag23 then
												flag21 = true
											end
										end
									end
								end

								if flag21 then
									getgenv().desync = { CFrame = cframe }
								else
									getgenv().desync = nil
								end

								if flag20 then
									RunService.RenderStepped:Wait()
									if not (tick() >= now2 + 8 or v24.Unloaded) then
										continue
									end
								end

								break
							end

							getgenv().desync = nil

							for _, v45 in ipairs(tbl42) do
								pcall(function()
									v45.box:Destroy()
								end)
							end
						end)
					end)
				end)

				table.insert(tbl24, function()
					pcall(function()
						connection20:Disconnect()
					end)

					if revCosmicAnti.grbConn then
						pcall(function()
							revCosmicAnti.grbConn:Disconnect()
						end)

						revCosmicAnti.grbConn = nil
					end

					if revCosmicAnti.nfConn then
						pcall(function()
							revCosmicAnti.nfConn:Disconnect()
						end)

						revCosmicAnti.nfConn = nil
					end

					if connection21 then
						pcall(function()
							connection21:Disconnect()
						end)

						connection21 = nil
					end

					if connection22 then
						pcall(function()
							connection22:Disconnect()
						end)

						connection22 = nil
					end

					if connection23 then
						pcall(function()
							connection23:Disconnect()
						end)

						connection23 = nil
					end

					if revCosmicAnti.singConn then
						pcall(function()
							revCosmicAnti.singConn:Disconnect()
						end)

						revCosmicAnti.singConn = nil
					end

					if revCosmicAnti.singRepConn then
						pcall(function()
							revCosmicAnti.singRepConn:Disconnect()
						end)

						revCosmicAnti.singRepConn = nil
						getgenv()._singRepHooked = false
					end

					pcall(function()
						revCosmicAnti.myCharConn:Disconnect()
					end)

					for _, myCastConn in ipairs(revCosmicAnti.myCastConns) do
						pcall(function()
							myCastConn:Disconnect()
						end)
					end

					if tbl40.thrownConn then
						pcall(function()
							tbl40.thrownConn:Disconnect()
						end)

						tbl40.thrownConn = nil
					end

					if tbl40.renderConn then
						pcall(function()
							tbl40.renderConn:Disconnect()
						end)

						tbl40.renderConn = nil
					end

					for k, v44 in pairs(tbl40.tracked) do
						pcall(function()
							v44:Destroy()
						end)

						tbl40.tracked[k] = nil
					end

					for _, v44 in pairs(tbl5) do
						pcall(v44.Disconnect, v44)
					end

					for _, v44 in pairs(tbl6) do
						pcall(v44.Disconnect, v44)
					end

					for _, v44 in pairs(tbl7) do
						for _, v45 in ipairs(v44) do
							pcall(function()
								v45:Disconnect()
							end)
						end
					end

					tbl5 = {}
					tbl6 = {}
					tbl7 = {}
					getgenv().desync = nil

					pcall(function()
						toggles.AntiMoves_Trashcan:SetValue(false)
					end)

					pcall(function()
						options.AntiMoves_Saitama:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_Garou:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_Genos:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_Tatsumaki:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_AtomicSamurai:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_Suiryu:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_MetalBat:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_Sonic:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_KJ:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_FrozenSoul:SetValue({})
					end)

					pcall(function()
						options.AntiMoves_TechProdigy:SetValue({})
					end)

					pcall(function()
						toggles.ShowDeathCounter:SetValue(false)
					end)
				end)

				task.spawn(function()
					local model = nil

					task.spawn(function()
						repeat
							task.wait()
						until localPlayer3.Character

						local character = localPlayer3.Character
						model = Instance.new("Model")
						character.Archivable = true
						local clone2 = character:Clone()
						character.Archivable = false

						if clone2:FindFirstChildWhichIsA("Humanoid") then
							clone2.Humanoid:Destroy()
						end

						for _, child in pairs(clone2:GetChildren()) do
							if child:IsA("Humanoid") then
								child:Destroy()
							elseif child:IsA("BasePart") or child:IsA("MeshPart") then
								local clone3 = child:Clone()
								clone3.CanCollide = false
								clone3.Anchored = true

								clone3.Transparency = not table.find({
									"HumanoidRootPart",
									"FakeHead",
									"Hitbox_RightArm",
									"Hitbox_LeftArm",
									"Hitbox_RightLeg",
									"Hitbox_LeftLeg",
								}, clone3.Name) and 0.65 or 1

								clone3.Color = Color3.fromRGB(255, 255, 255)
								clone3.Size = clone3.Size * 1.01
								clone3.Parent = model

								if clone3.Name ~= "Head" then
									if clone3.Name ~= "HumanoidRootPart" then
										clone3.Material = Enum.Material.ForceField
										local specialMesh = Instance.new("SpecialMesh", clone3)
										specialMesh.Scale = clone3.Size
										specialMesh.TextureId = "rbxassetid://5101923607"
										specialMesh.VertexColor = Vector3.new(255, 0, 0)
									end
								else
									clone3.Color = Color3.fromRGB(255, 0, 0)
								end

								for _, v44 in pairs({ "Sound", "Decal", "Trail", "BodyVelocity", "BodyGyro", "BodyPosition", "ParticleEmitter" }) do
									local v45 = clone3:FindFirstChildWhichIsA(v44)

									if v45 then
										v45:Destroy()
									end
								end
							end
						end

						model.Parent = workspace.Terrain
						getgenv()._vizClone = model
					end)

					RunService.Heartbeat:Connect(function()
						if v24.Unloaded then
							return
						end

						if not model then
							return
						end
						local character = localPlayer3.Character
						if not character then
							return
						end
						local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if not (humanoidRootPart2 and humanoid) then
							return
						end
						local invisibility = tbl23.Invisibility or tbl23["Doing Wall Combo Anywhere"]
						local flag19 = false

						if invisibility then
							flag19 = (not getgenv().desync or _revDesyncBlocked(character)) and true
							flag19 = flag19 or false
						end

						local cFrame2 = nil

						if humanoid.Health > 0 then
							local invisibility2 = tbl23.Invisibility or tbl23["Upside Down"]
							local n15 = nil

							if invisibility2 then
								n15 = humanoidRootPart2.CFrame * CFrame.Angles(0, 0, 3.1415926535897931)
							end

							if getgenv().flingDesync then
								n15 = getgenv().flingDesync.CFrame or n15
							end

							if getgenv().desync and not _revDesyncBlocked(character) then
								cFrame2 = getgenv().desync.CFrame or n15
							else
								cFrame2 = n15
							end
						end

						if flag19 and toggles.Visualizer and toggles.Visualizer.Value then
							for _, child in pairs(model:GetChildren()) do
								if child:IsA("BasePart") then
									local v44 = character:FindFirstChild(child.Name)

									if v44 and v44:IsA("BasePart") then
										child.CFrame = v44.CFrame
									end
								end
							end
						end

						if cFrame2 then
							local value = toggles.Visualizer and toggles.Visualizer.Value

							if value then
								value = not (toggles.AlwaysVisualize and toggles.AlwaysVisualize.Value)
							end

							if value and not flag19 then
								for _, child in pairs(model:GetChildren()) do
									if child:IsA("BasePart") then
										local v44 = character:FindFirstChild(child.Name)

										if v44 and v44:IsA("BasePart") then
											child.CFrame = v44.CFrame
										end
									end
								end
							end
						end

						if not flag19 then
							if toggles.Visualizer and toggles.Visualizer.Value and toggles.AlwaysVisualize and toggles.AlwaysVisualize.Value then
								for _, child in pairs(model:GetChildren()) do
									if child:IsA("BasePart") then
										local v44 = character:FindFirstChild(child.Name)

										if v44 and v44:IsA("BasePart") then
											child.CFrame = v44.CFrame
										end
									end
								end
							elseif not (toggles.Visualizer and toggles.Visualizer.Value and (toggles.AlwaysVisualize and toggles.AlwaysVisualize.Value or cFrame2)) then
								for _, child in pairs(model:GetChildren()) do
									if child:IsA("BasePart") then
										child.CFrame = CFrame.new(0, 1000000, 0)
									end
								end
							end
						end
					end)
				end)

				task.spawn(function()
					local function fn90(arg)
						while true do
							task.wait()
							if not (localPlayer3.Character == arg and arg:FindFirstChild("HumanoidRootPart") and arg:FindFirstChildOfClass("Humanoid")) then
								continue
							end
							break
						end

						if localPlayer3.Character ~= arg then
							return
						end
						local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")

						task.spawn(function()
							while task.wait() and (not localPlayer3.Character or localPlayer3.Character == arg) do
								if getgenv().desync and not _revDesyncBlocked(arg) then
									local tbl41 = {}

									local ok, result = pcall(function()
										return ReplicatedStorage.Resources.NinjaUlt.Afterimage_Despawn:Clone()
									end)

									local ok2, result2 = pcall(function()
										return ReplicatedStorage.Resources.VanishingKick.tpthing:Clone()
									end)

									if ok and result then
										result.Parent = humanoidRootPart2
										tbl41[1] = result

										for _, child in pairs(result:GetChildren()) do
											if child:IsA("ParticleEmitter") then
												child.Enabled = true
												child.Rate = 100
											end
										end
									end

									if ok2 and result2 then
										result2.Parent = humanoidRootPart2
										tbl41[2] = result2
										result2.Enabled = true
										result2.Rate = 100
									end

									while true do
										if tbl41[1] and tbl41[1].Parent then
											tbl41[1].CFrame = humanoidRootPart2.CFrame
										end

										RunService.RenderStepped:Wait()
										if not (not getgenv().desync or _revDesyncBlocked(arg)) then
											continue
										end
										break
									end

									for _, v44 in pairs(tbl41) do
										pcall(function()
											v44:Destroy()
										end)
									end
								end
							end
						end)

						task.spawn(function()
							for _, descendant in pairs(arg:GetDescendants()) do
								if descendant:IsA("BasePart") and descendant ~= humanoidRootPart2 and descendant.Transparency ~= 1 and not descendant.Name:lower():find("hitbox") then
									task.spawn(function()
										while task.wait() and (not localPlayer3.Character or localPlayer3.Character == arg) do
											if descendant and (tbl23.Invisibility or getgenv().desync and not _revDesyncBlocked(arg)) then
												descendant.Transparency = 0.5

												while true do
													RunService.RenderStepped:Wait()
													if not (not tbl23.Invisibility and (not getgenv().desync or _revDesyncBlocked(arg)) or localPlayer3.Character and localPlayer3.Character ~= arg) then
														continue
													end
													break
												end

												descendant.Transparency = 0
											end
										end
									end)
								end
							end
						end)
					end

					if localPlayer3.Character then
						task.spawn(fn90, localPlayer3.Character)
					end

					localPlayer3.CharacterAdded:Connect(function(character)
						task.spawn(fn90, character)
					end)
				end)

				esp:AddDivider({ Text = "Death Counter" })

				esp:AddToggle("ShowDeathCounter", {
					Text = "Show Death Counter",
					Default = false,
					Callback = function(arg)
						flag17 = arg
						fn87()

						if arg then
							for _, v44 in pairs(tbl27) do
								pcall(v44.Disconnect, v44)
							end

							tbl27 = {}
							tbl28 = {}
							tbl30 = {}
							tbl31 = {}

							for _, player in pairs(Players:GetPlayers()) do
								fn65(player)
							end

							table.insert(tbl27, Players.PlayerAdded:Connect(function(player)
								if flag17 then
									fn65(player)
								end
							end))

							table.insert(tbl27, Players.PlayerRemoving:Connect(function(player)
								fn62(player)
							end))
						else
							for _, v44 in pairs(tbl27) do
								pcall(v44.Disconnect, v44)
							end

							tbl27 = {}
							tbl28 = {}
							tbl30 = {}
							tbl31 = {}
						end
					end,
				})

				esp:AddDivider({ Text = "Move Notifications" })
				esp:AddToggle("MoveNotifications", { Text = "Move Notifications", Default = false })
				esp:AddToggle("ExposeMoveInChat", { Text = "Expose moves in chat", Default = false })
				esp:AddToggle("ExposeWhitelistedPlayers", { Text = "Expose Whitelisted Players", Default = false })

				esp:AddDropdown("MoveNotificationMoves", {
					Values = {
						"Death Counter",
						"Table Flip",
						"Serious Punch",
						"Omni-Directional Punch",
						"Death Blow",
						"Last Breath",
					},
					Default = {},
					Multi = true,
					AllowNull = true,
					Searchable = false,
					Text = "Moves",
				})
			end

			tbl23 = {
				Flying = false,
				["Touch Fling"] = false,
				["Touch Fling Settings"] = Vector3.zero,
				["Trashcan Launch"] = false,
			}

			local tbl27
			tbl27 = { Fly = false, ["Lock-on"] = false, ["Touch Fling"] = false }

			do
				local flag17 = false
				local flag18 = false
				local v43 = nil
				local v44 = nil
				local v45 = nil
				local tbl28 = {}
				local model = Instance.new("Model", workspace)
				local humanoid = Instance.new("Humanoid", model)
				local part3 = Instance.new("Part", model)
				part3.Name = "HumanoidRootPart"
				part3.CanCollide = false
				part3.Transparency = 1
				part3.Anchored = true
				part3.Size = Vector3.new(2, 2, 1)
				getgenv().InvisHumanoid = humanoid
				getgenv().InvisPart30 = part3
				local n15 = 1
				local flag19 = false

				RunService.Heartbeat:Connect(function()
					if v24.Unloaded then
						return
					end
					local genv = getgenv()
					local flag20 = genv.flingDesync ~= nil
					local flag21 = genv.desync ~= nil
					local flag22 = genv.desync2 ~= nil

					if flag21 or flag22 then
						flag19 = true
					elseif flag19 then
						flag19 = false

						task.spawn(function()
							for i = 1, 3 do
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								if not character then
									return
								end
								character.CFrame = character.CFrame * CFrame.new(0, 0, 0.001)
								RunService.Heartbeat:Wait()
							end
						end)
					end

					if not flag17 and not flag20 and not flag21 and not flag22 and not tbl23["Touch Fling"] and not tbl23["Trashcan Launch"] and not tbl23["Upside Down"] then
						return
					end

					if genv.TrashcanIsRunning then
						local character = localPlayer3.Character
						character = character and character:FindFirstChild("HumanoidRootPart")

						if character then
							part3.CFrame = character.CFrame
						end

						return
					end

					if flag18 then
						return
					end
					flag18 = true
					local character = localPlayer3.Character
					local humanoid2 = character and character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
					if not character or not humanoid2 or not humanoidRootPart2 then
						flag18 = false
						return
					end

					if humanoid2.Health <= 0 then
						if flag17 then
							task.spawn(softResetInvisibility)
						end

						flag18 = false
						return
					end

					local cFrame2 = humanoidRootPart2.CFrame
					local revTPOverride = genv._revTPOverride

					if revTPOverride then
						genv._revTPOverride = nil
						humanoidRootPart2.CFrame = revTPOverride
					else
						revTPOverride = cFrame2
					end

					local velocity = humanoidRootPart2.Velocity
					v45 = revTPOverride
					genv._revRealCF = revTPOverride
					genv._revRealCFt = os.clock()
					local currentCamera = workspace.CurrentCamera
					local cFrame3

					if tbl23["Upside Down"] then
						cFrame3 = revTPOverride * CFrame.Angles(0, 0, 3.1415926535897931)
					else
						cFrame3 = nil

						if flag17 then
							cFrame3 = revTPOverride
						end
					end

					local flag23 = flag21 and not _revDesyncBlocked(localPlayer3.Character)
					local flag24 = false

					if flag23 then
						cFrame3 = getgenv().desync.CFrame or cFrame3
						flag24 = true
					end

					if flag22 then
						cFrame3 = getgenv().desync2.CFrame or cFrame3
						flag24 = true
					end

					if flag20 then
						cFrame3 = getgenv().flingDesync.CFrame or cFrame3
					end

					if cFrame3 then
						local upsideDown

						if currentCamera then
							upsideDown = tbl23["Upside Down"]

							if not upsideDown then
								upsideDown = not (flag17 and not flag21 and not flag22 and not flag20)
							end
						else
							upsideDown = currentCamera
						end

						if upsideDown then
							character:SetAttribute("NoHeadLerp", true)
							currentCamera.CameraSubject = humanoid
						end

						part3.CFrame = revTPOverride

						if not tbl23.Flying then
							if flag24 then
								n15 = -n15
								cFrame3 *= CFrame.new(0, 0.001 * n15, 0)
							end

							local revRagRel = nil

							if flag24 then
								revRagRel = getgenv()._revRagRel

								if not revRagRel then
									revRagRel = {}
									getgenv()._revRagRel = revRagRel
								end

								table.clear(revRagRel)
								local revRagParts = getgenv()._revRagParts
								local flag25 = not revRagParts or revRagParts.char ~= character

								if not flag25 then
									local t = revRagParts.t
									flag25 = os.clock() - t > 0.5
								end

								if flag25 then
									revRagParts = { char = character, t = os.clock(), parts = {} }

									for _, descendant in ipairs(character:GetDescendants()) do
										if descendant:IsA("BasePart") and descendant ~= humanoidRootPart2 then
											revRagParts.parts[#revRagParts.parts + 1] = descendant
										end
									end

									getgenv()._revRagParts = revRagParts
								end

								local cFrame4 = humanoidRootPart2.CFrame

								for _, part4 in ipairs(revRagParts.parts) do
									if part4.Parent then
										revRagRel[part4] = cFrame4:ToObjectSpace(part4.CFrame)
									end
								end
							end

							humanoidRootPart2.CFrame = cFrame3

							if revRagRel then
								for k, v46 in pairs(revRagRel) do
									if k.Parent then
										k.CFrame = cFrame3 * v46
									end
								end
							end
						end
					end

					local v46 = nil
					local v47 = nil
					local flag25 = flag17

					if flag17 then
						flag25 = not (flag20 and getgenv().flingDesync.Velocity)
					end

					if flag25 then
						if v44 ~= humanoid2 then
							if v43 then
								pcall(function()
									if v43.IsPlaying then
										v43:Stop()
									end
								end)

								v43 = nil
							end

							v44 = humanoid2
						end

						local animator = humanoid2:FindFirstChildOfClass("Animator")

						if animator then
							if not v43 or v43.Parent == nil then
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://71181015443030"
								v43 = animator:LoadAnimation(animation)
								v43.Priority = Enum.AnimationPriority.Action4
							end

							v46 = v43
							v46:Play()
							v46.TimePosition = 13.45
							v46:AdjustSpeed(0)
							v46:AdjustWeight(2e9)
						end
					end

					if flag17 and getgenv().MechInvisHandled then
						local mechInvisTrack = getgenv()._mechInvisTrack

						if mechInvisTrack then
							pcall(function()
								if not mechInvisTrack.IsPlaying then
									mechInvisTrack:Play()
								end

								mechInvisTrack.TimePosition = 0.01
								mechInvisTrack:AdjustSpeed(0)
								mechInvisTrack:AdjustWeight(2e9)
							end)

							v47 = mechInvisTrack
						end
					end

					if tbl23["Trashcan Launch"] and toggles.TrashcanLaunch and toggles.TrashcanLaunch.Value then
						humanoidRootPart2.AssemblyLinearVelocity = humanoidRootPart2.CFrame.LookVector * options.Trashcan_LaunchPower.Value
					elseif getgenv().flingDesync and getgenv().flingDesync.Velocity then
						humanoidRootPart2.Velocity = Vector3.new(-2e15, -2e15, -2e15)
					elseif tbl23["Touch Fling"] then
						if options.TouchFlingMethod and (options.TouchFlingMethod.Value == "Normal" or options.TouchFlingMethod.Value == "Better One") then
							local touchFlingSettings = tbl23["Touch Fling Settings"]

							if touchFlingSettings.Magnitude <= 1073741824 then
								pcall(function()
									humanoidRootPart2.Velocity = touchFlingSettings
								end)

								pcall(function()
									humanoidRootPart2.RotVelocity = Vector3.zero
								end)
							else
								humanoidRootPart2.AssemblyLinearVelocity = touchFlingSettings
								humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
							end
						elseif options.TouchFlingMethod then
						end
					end

					RunService.RenderStepped:Wait()
					humanoid.CameraOffset = humanoid2.CameraOffset

					if currentCamera and currentCamera.CameraSubject == humanoid then
						if not tbl23["Upside Down"] then
							character:SetAttribute("NoHeadLerp", false)
						end

						currentCamera.CameraSubject = humanoid2
					end

					if v46 and v46.IsPlaying then
						pcall(function()
							v46:Stop()
						end)
					end

					if v47 and v47.IsPlaying then
						pcall(function()
							v47:Stop()
						end)
					end

					if cFrame3 and not tbl23.Flying then
						if flag24 then
							revTPOverride *= CFrame.new(0, 0.001 * n15, 0)
						end

						local flag26 = currentCamera and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter and not flag21 and not flag22

						if flag26 then
							flag26 = not (flag17 and not flag21 and not flag22 and not flag20)
						end

						if flag26 and not tbl23["Upside Down"] then
							local lookVector = currentCamera.CFrame.LookVector
							local vector = Vector3.new(lookVector.X, 0, lookVector.Z)

							if vector.Magnitude > 0.001 then
								humanoidRootPart2.CFrame = CFrame.new(revTPOverride.Position, revTPOverride.Position + vector)
							else
								humanoidRootPart2.CFrame = revTPOverride
							end
						else
							humanoidRootPart2.CFrame = revTPOverride
						end

						if getgenv()._revRagRel then
							for k, v48 in pairs(getgenv()._revRagRel) do
								if k.Parent then
									k.CFrame = humanoidRootPart2.CFrame * v48
								end
							end

							table.clear(getgenv()._revRagRel)
						end
					end

					if not tbl23.Flying then
						humanoidRootPart2.Velocity = velocity
					end

					flag18 = false
				end)

				local function stopInvisibilityFn()
					if not flag17 then
						return
					end
					flag17 = false
					getgenv().InvisActive = false
					flag18 = false

					if v43 then
						pcall(function()
							if v43.IsPlaying then
								v43:Stop()
							end
						end)

						v43 = nil
					end

					v44 = nil
					local character = localPlayer3.Character

					if character then
						local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart2 and v45 then
							pcall(function()
								humanoidRootPart2.CFrame = v45
							end)
						end

						v45 = nil
						local humanoid2 = character:FindFirstChildOfClass("Humanoid")

						if humanoid2 then
							pcall(function()
								workspace.CurrentCamera.CameraSubject = humanoid2
							end)
						end

						pcall(function()
							character:SetAttribute("NoHeadLerp", false)
						end)

						for _, v46 in pairs(tbl28) do
							pcall(function()
								v46:Disconnect()
							end)
						end

						tbl28 = {}

						for _, descendant in pairs(character:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
								descendant.LocalTransparencyModifier = 0
							end
						end
					end

					if not getgenv().TrashcanIsRunning then
						fn51(true)
					end

					if getgenv()._invisSavedTPose then
						fn52()
					end

					getgenv()._invisSavedTPose = nil
				end

				table.insert(tbl24, function()
					stopInvisibilityFn()

					pcall(function()
						toggles.TogInvis:SetValue(false)
					end)
				end)

				getgenv().stopInvisibilityFn = stopInvisibilityFn

				local function fn60()
					if v43 then
						pcall(function()
							if v43.IsPlaying then
								v43:Stop()
							end
						end)

						v43 = nil
					end

					v44 = nil
					v45 = nil
					flag18 = false
				end

				local function fn61(arg)
					if not arg:IsA("BasePart") then
						return
					end

					if arg.Name == "HumanoidRootPart" then
						return
					end

					if arg.Transparency == 1 then
						return
					end

					if arg.Name:lower():find("hitbox") then
						return
					end
					arg.LocalTransparencyModifier = 0.5

					local connection18 = arg:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
						if not flag17 then
							return
						end

						if arg.LocalTransparencyModifier ~= 0.5 then
							arg.LocalTransparencyModifier = 0.5
						end
					end)

					table.insert(tbl28, connection18)
				end

				local function fn62(arg)
					for _, descendant in pairs(arg:GetDescendants()) do
						fn61(descendant)
					end

					local connection18 = arg.DescendantAdded:Connect(function(descendant)
						if flag17 then
							fn61(descendant)
						end
					end)

					table.insert(tbl28, connection18)
				end

				local function fn63()
					if flag17 then
						stopInvisibilityFn()
						return
					end
					local character = localPlayer3.Character
					if not character then
						return
					end
					local humanoid2 = character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
					if not humanoid2 or not humanoidRootPart2 then
						return
					end
					getgenv()._invisSavedTPose = tPoseActive or false
					flag17 = true
					getgenv().InvisActive = true
					flag18 = false
					local character2 = localPlayer3.Character

					if character2 then
						fn62(character2)
					end
				end

				local TogInvis = Character:AddToggle("TogInvis", {
					Text = "Invisibility",
					Default = false,
					Callback = function(arg)
						if not arg then
							if options.KPInvis then
								options.KPInvis.Toggled = false
							end

							if flag17 then
								stopInvisibilityFn()
							end
						end
					end,
				})

				TogInvis:AddKeyPicker("KPInvis", {
					Default = "U",
					Text = "Invisibility",
					SyncToggleState = false,
					Mode = "Toggle",
					Callback = function()
						if tbl26.IV then
							return
						end

						if not toggles.TogInvis.Value then
							options.KPInvis.Toggled = false
							return
						end

						if fn45() then
							return
						end
						fn63()
					end,
				})

				TogInvis:OnChanged(function(arg)
					if tbl25.Invis then
						return
					end

					if fn45() then
						tbl25.Invis = true
						TogInvis:SetValue(not arg)
						tbl25.Invis = false
						return
					end

					if not arg and flag17 then
						stopInvisibilityFn()
					end
				end)

				task.defer(function()
					local kpInvis = options.KPInvis

					if kpInvis then
						local setMode = kpInvis.SetMode

						if type(setMode) == "function" then
							kpInvis.SetMode = function(arg, arg2, ...)
								if arg2 == "Always" then
									arg2 = "Toggle"
								end

								local v46 = table.pack(...)
								local v47 = setMode
								v46.n = 3 + v46.n - 1
								table.move(v46, 1, v46.n, 3, v46)
								v46[1] = arg
								v46[2] = arg2
								return v47(table.unpack(v46, 1, v46.n))
							end
						end

						if kpInvis.Mode == "Always" then
							pcall(function()
								kpInvis:SetMode("Toggle")
							end)
						end
					end
				end)

				localPlayer3.CharacterAdded:Connect(function(character)
					if flag17 then
						fn60()

						for _, v46 in pairs(tbl28) do
							pcall(function()
								v46:Disconnect()
							end)
						end

						tbl28 = {}

						task.defer(function()
							if not flag17 then
								return
							end
							local character2 = localPlayer3.Character

							if character2 then
								fn62(character2)
							end
						end)
					end

					local humanoid2 = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 5)

					if humanoid2 then
						humanoid2.Died:Connect(function()
							if flag17 then
								fn60()
							end
						end)
					end
				end)

				if localPlayer3.Character then
					local humanoid2 = localPlayer3.Character:FindFirstChildOfClass("Humanoid")

					if humanoid2 then
						humanoid2.Died:Connect(function()
							if flag17 then
								fn60()
							end
						end)
					end
				end
			end

			if typeof(getrawmetatable) == "function" and getrawmetatable(game) then
				local index = getrawmetatable(game).__index
			end

			table.insert(tbl24, function()
				pcall(function()
					toggles.MoveNotifications:SetValue(false)
				end)

				pcall(function()
					toggles.ExposeMoveInChat:SetValue(false)
				end)

				pcall(function()
					toggles.ExposeWhitelistedPlayers:SetValue(false)
				end)
			end)

			getChar = function(arg)
				return arg.Character
			end

			getRoot = function(arg)
				return arg and arg:FindFirstChild("HumanoidRootPart") or nil
			end

			getHumanoid = function(arg)
				return arg and arg:FindFirstChild("Humanoid") or nil
			end

			do
				local connection18 = nil
				local folder = nil
				local connection19 = nil
				local connection20 = nil
				local flag17 = false
				local cFrame2 = nil
				local fieldOfView = nil
				local tbl28 = {}
				local n15 = 0

				local function fn60()
					local now2 = tick()
					local v43 = nil

					for _, v44 in ipairs(tbl28) do
						if now2 - v44.t >= 0.25 and (not v43 or v44.t > v43.t) then
							v43 = v44
						end
					end

					return v43 and v43.fov or nil
				end

				pcall(function()
					RunService:BindToRenderStep("RevenantFovRing", 250, function()
						local currentCamera = workspace.CurrentCamera

						if currentCamera and currentCamera.CameraType ~= Enum.CameraType.Scriptable then
							n15 = n15 % 45 + 1
							local v43 = tbl28[n15]

							if v43 then
								local fieldOfView2 = currentCamera.FieldOfView
								local now2 = tick()
								v43.fov = fieldOfView2
								v43.t = now2
							else
								tbl28[n15] = { fov = currentCamera.FieldOfView, t = tick() }
							end
						end
					end)

					table.insert(tbl24, function()
						pcall(function()
							RunService:UnbindFromRenderStep("RevenantFovRing")
						end)
					end)
				end)

				local flag18 = false

				local function fn61()
					local custom = Enum.CameraType.Custom

					pcall(function()
						local shared_ = getrenv().shared

						if type(shared_) == "table" and (rawget(shared_, "isconsole") or rawget(shared_, "ismobile")) then
							custom = Enum.CameraType.Track
						end
					end)

					return custom
				end

				local tbl29 = {}
				local flag19 = false
				local flag20 = false
				local flag21 = typeof(getgc) == "function" and debug ~= nil and debug.getupvalues ~= nil and debug.setupvalue ~= nil and debug.info ~= nil

				local function fn62()
					if not flag21 then
						return
					end

					if flag19 then
						flag20 = true
						return
					end
					flag19 = true

					task.spawn(function()
						repeat
							flag20 = false
							local tbl30 = {}

							pcall(function()
								for i, v43 in ipairs(getgc()) do
									if i % 8000 == 0 then
										task.wait()
									end

									if type(v43) == "function" then
										local ok, result = pcall(debug.info, v43, "s")

										if ok and type(result) == "string" and result:find("CosmicAura") then
											local ok2, result2 = pcall(debug.getupvalues, v43)

											if ok2 and type(result2) == "table" then
												for k, v44 in pairs(result2) do
													if typeof(v44) == "Instance" and v44:IsA("Camera") then
														table.insert(tbl30, { fn = v43, idx = k })
														local currentCamera = workspace.CurrentCamera

														if v44 ~= currentCamera then
															pcall(debug.setupvalue, v43, k, currentCamera)
														end
													end
												end
											end
										end
									end
								end
							end)

							tbl29 = tbl30
						until not flag20

						flag19 = false
					end)
				end

				local function fn63(arg)
					if not flag21 then
						return
					end
					local currentCamera = arg or workspace.CurrentCamera
					if #tbl29 == 0 then
						fn62()
						return
					end

					for _, v43 in ipairs(tbl29) do
						pcall(function()
							local v44 = debug.getupvalues(v43.fn)
							local flag22 = type(v44) == "table" and v44[v43.idx]

							if typeof(flag22) == "Instance" and flag22:IsA("Camera") and flag22 ~= currentCamera then
								debug.setupvalue(v43.fn, v43.idx, currentCamera)
							end
						end)
					end
				end

				if flag21 then
					task.defer(fn62)

					task.spawn(function()
						local live = workspace:WaitForChild("Live", 10)
						if not live then
							return
						end

						local connection21 = live.DescendantAdded:Connect(function(descendant)
							if descendant.Name == "aurasfxcosmic" then
								task.defer(fn62)
							end
						end)

						table.insert(tbl24, function()
							pcall(function()
								connection21:Disconnect()
							end)
						end)
					end)
				end

				local function revenantFixCam()
					if flag18 then
						return
					end
					flag18 = true

					pcall(function()
						local currentCamera = workspace.CurrentCamera
						if not currentCamera then
							return
						end
						local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")
						local cFrame3 = cFrame2 or currentCamera.CFrame
						local fieldOfView2 = fn60() or fieldOfView or currentCamera.FieldOfView
						local children = currentCamera:GetChildren()
						local camera = Instance.new("Camera")
						camera.Name = "Camera"
						camera.CameraType = fn61()
						local cameraSubject = nil

						pcall(function()
							cameraSubject = currentCamera.CameraSubject
						end)

						if cameraSubject or humanoid then
							camera.CameraSubject = cameraSubject or humanoid
						end

						camera.FieldOfView = fieldOfView2
						camera.CFrame = cFrame3

						for _, child in ipairs(children) do
							pcall(function()
								child.Parent = camera
							end)
						end

						currentCamera:Destroy()
						camera.Parent = workspace

						pcall(function()
							workspace.CurrentCamera = camera
						end)

						camera.CFrame = cFrame3
						fn63(camera, currentCamera)

						pcall(function()
							localPlayer3.CameraMode = Enum.CameraMode.Classic
						end)

						pcall(function()
							local head = localPlayer3.Character and localPlayer3.Character:FindFirstChild("Head")

							if head then
								head.Anchored = false
							end
						end)
					end)

					task.delay(0.25, function()
						flag18 = false
					end)
				end

				getgenv()._RevenantFixCam = revenantFixCam

				getgenv()._revGammaCasting = function()
					local ok, result = pcall(function()
						local character = localPlayer3.Character
						character = character and character:FindFirstChildOfClass("Humanoid")
						if not character then
							return false
						end

						for _, v43 in ipairs(character:GetPlayingAnimationTracks()) do
							local animation = v43.Animation
							if animation and tostring(animation.AnimationId):match("121326674097055") and v43.IsPlaying then
								return true
							end
						end

						return false
					end)

					return ok and result == true
				end

				local function fn64(arg)
					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					if not arg then
						return
					end

					connection19 = arg:GetPropertyChangedSignal("CameraType"):Connect(function()
						if not toggles.NoCameraAnimations.Value then
							return
						end

						if getgenv()._cpCamActive then
							return
						end

						if getgenv()._revGammaCasting() then
							return
						end

						if arg.CameraType == Enum.CameraType.Scriptable then
							task.defer(revenantFixCam)
						end
					end)

					if toggles.NoCameraAnimations.Value and not getgenv()._cpCamActive and not getgenv()._revGammaCasting() and arg.CameraType == Enum.CameraType.Scriptable then
						task.defer(revenantFixCam)
					end
				end

				local function fn65()
					if connection20 then
						return
					end

					pcall(function()
						RunService:BindToRenderStep("RevenantNoCutsceneSnap", 250, function()
							local currentCamera = workspace.CurrentCamera

							if currentCamera and currentCamera.CameraType ~= Enum.CameraType.Scriptable then
								cFrame2 = currentCamera.CFrame
								fieldOfView = currentCamera.FieldOfView
							end
						end)

						flag17 = true
					end)

					connection20 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
						fn64(workspace.CurrentCamera)
					end)

					fn64(workspace.CurrentCamera)
				end

				local function fn66()
					if connection20 then
						connection20:Disconnect()
						connection20 = nil
					end

					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					if flag17 then
						pcall(function()
							RunService:UnbindFromRenderStep("RevenantNoCutsceneSnap")
						end)

						flag17 = false
					end

					cFrame2 = nil
					fieldOfView = nil
				end

				v33:AddDivider({ Text = "Comfort" })

				v33:AddToggle("NoCameraAnimations", {
					Text = "No Cutscenes",
					Default = false,
					Callback = function(arg)
						if arg then
							fn65()
							local character = localPlayer3.Character

							if character and character:FindFirstChild("Communicate") then
								pcall(function()
									character.Communicate:FireServer({ Goal = "Disable Intro" })
								end)
							end

							pcall(function()
								if not (folder and folder.Parent == workspace) then
									folder = Instance.new("Folder")
									folder.Name = "CancelCutscene"
									folder.Parent = workspace
								end
							end)

							pcall(function()
								localPlayer3:SetAttribute("Cutscene", true)
							end)

							if not connection18 then
								connection18 = localPlayer3:GetAttributeChangedSignal("Cutscene"):Connect(function()
									if not (toggles.NoCameraAnimations and toggles.NoCameraAnimations.Value) then
										return
									end

									if localPlayer3:GetAttribute("Cutscene") then
										return
									end

									if getgenv()._revGammaCasting() then
										if getgenv()._revNCGammaWait then
											return
										end
										getgenv()._revNCGammaWait = true

										task.spawn(function()
											local now2 = os.clock()

											while true do
												task.wait(0.1)
												if not (not getgenv()._revGammaCasting() or os.clock() - now2 > 12) then
													continue
												end
												break
											end

											getgenv()._revNCGammaWait = nil

											if toggles.NoCameraAnimations and toggles.NoCameraAnimations.Value and not localPlayer3:GetAttribute("Cutscene") then
												pcall(function()
													localPlayer3:SetAttribute("Cutscene", true)
												end)
											end
										end)

										return
									end

									pcall(function()
										localPlayer3:SetAttribute("Cutscene", true)
									end)
								end)
							end
						else
							if connection18 then
								connection18:Disconnect()
								connection18 = nil
							end

							if folder then
								pcall(function()
									folder:Destroy()
								end)

								folder = nil
							end

							pcall(function()
								localPlayer3:SetAttribute("Cutscene", nil)
							end)

							fn66()
						end
					end,
				})
			end

			task.spawn(function()
				local ReplicatedStorage = game:GetService("ReplicatedStorage")

				local ok, result = pcall(function()
					return require(ReplicatedStorage:WaitForChild("Emotes", 5).VFX.VfxMods.CosmicTransformation)
				end)

				if not ok or type(result) ~= "table" or type(result.Transform) ~= "function" and not getgenv()._revCosmicOrigTransform then
					return
				end

				if not getgenv()._revCosmicOrigTransform then
					local transform = result.Transform
					getgenv()._revCosmicOrigTransform = transform
				end

				local revCosmicOrigTransform = getgenv()._revCosmicOrigTransform

				result.Transform = function(arg, ...)
					local flag17 = false

					pcall(function()
						flag17 = toggles.NoCameraAnimations and toggles.NoCameraAnimations.Value and type(arg) == "table" and arg.Data and arg.Data.Char == localPlayer3.Character
					end)

					if not flag17 then
						return revCosmicOrigTransform(arg, ...)
					end
					local char = arg.Data.Char

					task.spawn(function()
						pcall(function()
							local tbl28 = { Char = char }
							require(ReplicatedStorage.Emotes.VFX.VfxMods.OutsideV2).FirstEvent(tbl28)
						end)
					end)

					if not getgenv()._revCosmicStormDeb then
						getgenv()._revCosmicStormDeb = true

						task.delay(15, function()
							getgenv()._revCosmicStormDeb = nil
						end)

						task.spawn(function()
							pcall(function()
								local tbl28 = { Char = char }
								require(ReplicatedStorage.Emotes.VFX.VfxMods.OutsideV2).StormEvent(tbl28)
							end)
						end)
					end

					task.delay(21, function()
						pcall(function()
							if not (char and char.Parent and char == localPlayer3.Character) then
								return
							end
							local humanoid = char:FindFirstChildOfClass("Humanoid")
							if humanoid and humanoid.Health <= 0 then
								return
							end
							local tbl28 = { Char = char }
							require(ReplicatedStorage.Resources.CosmicMods.CosmicAura).On(tbl28)
						end)
					end)
				end
			end)

			do
				local connection18 = nil

				local tbl28 = {
					FXUi = true,
					ImpactFrames = true,
					Flash = true,
					Flexworks = true,
					Impact = true,
					Impact2 = true,
					Impact3 = true,
					BatImpact = true,
					GuiAnim = true,
				}

				local tbl29 = {
					[16043154171] = true,
					[16043156031] = true,
					[16043158393] = true,
					[105292724912360] = true,
					[103970496814859] = true,
					[93303659862392] = true,
					[94704269051379] = true,
					[130906905620601] = true,
					[109102382074339] = true,
					[126154177884499] = true,
					[120470487224640] = true,
					[94235068917138] = true,
					[114904469060907] = true,
					[96950156220147] = true,
					[77914202999518] = true,
					[89355993626809] = true,
					[115593152504814] = true,
					[115163935702377] = true,
					[108096961515162] = true,
					[102945330807458] = true,
					[115639466881686] = true,
					[106408645024146] = true,
					[103997621662882] = true,
					[98963378226348] = true,
					[138283827252840] = true,
					[73173862771821] = true,
					[117531049069077] = true,
					[121303853299291] = true,
					[74163589277108] = true,
					[137944251539418] = true,
					[95226061517603] = true,
					[72435938627045] = true,
					[119647743483603] = true,
					[102617503479857] = true,
					[110614492664851] = true,
					[81097880372288] = true,
					[87309776188141] = true,
					[105436748671671] = true,
					[134753950772177] = true,
					[86474305783911] = true,
					[97883435866681] = true,
					[76686961734515] = true,
					[106261393454295] = true,
					[81361300795575] = true,
					[113822570797393] = true,
					[93640005406026] = true,
					[74826122905979] = true,
					[80569592853717] = true,
					[130793433659495] = true,
					[102243745630290] = true,
					[109920530003012] = true,
					[107274089700796] = true,
					[110560007325867] = true,
					[91131196553271] = true,
					[82251506475110] = true,
					[113913037215750] = true,
					[86411735996581] = true,
					[130252920211103] = true,
					[129540317907477] = true,
					[94633349340540] = true,
					[105469428177188] = true,
					[125283792631442] = true,
					[102826955814599] = true,
					[100560142860033] = true,
					[72329473186813] = true,
					[94764943055014] = true,
					[109737467645438] = true,
					[94104018760133] = true,
					[135340999229786] = true,
					[116369193123612] = true,
					[138739736224559] = true,
					[107398892449054] = true,
					[115408320782661] = true,
					[88029783968112] = true,
					[114367728582047] = true,
					[71115028351211] = true,
					[128209762942507] = true,
					[135612265319562] = true,
					[136778760216909] = true,
					[127184491594129] = true,
					[81267088526737] = true,
					[107845455071459] = true,
					[132879914759638] = true,
					[116007646917770] = true,
					[86959970063821] = true,
					[140294545484487] = true,
					[98356396354229] = true,
					[73605700056697] = true,
					[122599341911025] = true,
					[117243238428924] = true,
					[95518008977547] = true,
					[138849208199971] = true,
					[73935048963355] = true,
					[103631148976788] = true,
					[86672899835729] = true,
					[101593549372972] = true,
					[101026638630620] = true,
					[135023497538345] = true,
					[116245317561450] = true,
					[104549023168408] = true,
					[124601842175416] = true,
					[95063533357827] = true,
					[115275513392510] = true,
					[118649894755242] = true,
					[74494101080766] = true,
					[99391352503459] = true,
					[130743174214274] = true,
					[124341087397944] = true,
					[116158995501139] = true,
					[119043669629506] = true,
					[85357434522503] = true,
					[134287593965913] = true,
					[80633305470043] = true,
					[104505399372264] = true,
					[140516601322189] = true,
					[83801301820362] = true,
					[118908722684741] = true,
					[77903660175367] = true,
					[95871279377800] = true,
					[137437339568498] = true,
					[83794856745215] = true,
					[90617277024495] = true,
					[97869669692406] = true,
					[125073842964769] = true,
					[77719436337178] = true,
					[135130254530476] = true,
					[133291137360011] = true,
					[122708430598665] = true,
					[92085106755517] = true,
					[110920005677301] = true,
					[116868353430885] = true,
					[93902988976044] = true,
					[85497761633086] = true,
					[124968255343643] = true,
					[139004446602247] = true,
					[100970557557125] = true,
					[126073612267687] = true,
					[105256600563418] = true,
					[92414014150729] = true,
					[137904293073306] = true,
					[80229944863595] = true,
					[98656433665318] = true,
					[126147592945920] = true,
					[92853523793264] = true,
					[139448484005733] = true,
					[73023260163943] = true,
					[133837327195020] = true,
					[91024067363257] = true,
					[136578840916634] = true,
					[127183812524721] = true,
					[99261029156994] = true,
					[134013965686190] = true,
					[72744714087575] = true,
					[4764912960] = true,
					[4764912210] = true,
					[14930748961] = true,
					[14931855855] = true,
					[14931341259] = true,
					[106792203557879] = true,
					[88213374101309] = true,
					[102124585705250] = true,
					[122881398740986] = true,
					[131733671726440] = true,
					[86305665311392] = true,
					[105281946376502] = true,
					[104125620628837] = true,
					[98336902467504] = true,
					[113687582207053] = true,
					[127033860942588] = true,
					[99751918094340] = true,
					[135799583139820] = true,
					[129595931954395] = true,
					[126609776608260] = true,
					[116853770948076] = true,
					[109066697041039] = true,
					[16042830962] = true,
					[16042830626] = true,
					[16042833831] = true,
					[16042834411] = true,
					[16042831168] = true,
					[16042831574] = true,
					[16042831829] = true,
					[16042832058] = true,
					[16042832395] = true,
					[16042832710] = true,
					[16042833093] = true,
					[16042833348] = true,
					[16055042320] = true,
					[16055045366] = true,
					[16055051443] = true,
					[16056702722] = true,
					[16056781361] = true,
					[17276089013] = true,
					[17276089280] = true,
					[17276088758] = true,
					[18461885601] = true,
					[17356805968] = true,
					[17347809692] = true,
					[14846394635] = true,
					[17346970224] = true,
					[17347684206] = true,
					[17347686924] = true,
					[17347690212] = true,
					[17347685782] = true,
					[17347708539] = true,
					[17347708315] = true,
					[17347707975] = true,
					[17347707700] = true,
					[17347707474] = true,
					[17347707209] = true,
					[17347707014] = true,
					[17347706806] = true,
					[17347706466] = true,
					[17347706137] = true,
					[17347705829] = true,
					[17347705579] = true,
					[17347705251] = true,
					[17347704883] = true,
					[17347704516] = true,
					[17347704069] = true,
					[17347703745] = true,
					[17347703368] = true,
					[17347703007] = true,
					[17347702728] = true,
					[17347702433] = true,
					[17347702120] = true,
					[17347701445] = true,
					[17347701136] = true,
					[17347700792] = true,
					[17347700354] = true,
					[17347700035] = true,
					[17347699788] = true,
					[17347699461] = true,
					[17347699145] = true,
					[17347698620] = true,
					[17347698120] = true,
					[17347697854] = true,
					[17347697646] = true,
					[17094610660] = true,
					[17094608312] = true,
					[17094608875] = true,
					[17094609366] = true,
					[17094609732] = true,
					[17094610225] = true,
					[17094610356] = true,
					[17094608019] = true,
					[18472609888] = true,
					[18472608830] = true,
					[18472608233] = true,
					[18472607714] = true,
					[18472607302] = true,
					[18472606925] = true,
					[18472606450] = true,
					[18472605849] = true,
					[18472605337] = true,
					[18472604803] = true,
					[18472613393] = true,
					[18472604377] = true,
					[18472603887] = true,
					[18472603444] = true,
					[18472602928] = true,
					[18472657080] = true,
					[18472602029] = true,
					[18472612972] = true,
					[18472612563] = true,
					[18472612143] = true,
					[18472611655] = true,
					[18472611130] = true,
					[18472610685] = true,
					[18472610370] = true,
					[18472613799] = true,
					[5168609593] = true,
					[17464258529] = true,
					[18468265266] = true,
					[18442187192] = true,
					[16968231260] = true,
					[132041598730582] = true,
					[88479946788220] = true,
					[99809310543950] = true,
					[121778149812033] = true,
					[133363172644321] = true,
					[120338738082550] = true,
					[73239621587797] = true,
					[122997268822491] = true,
					[134088653296612] = true,
					[104520572712911] = true,
					[132348477091663] = true,
					[117164402500989] = true,
					[119627926834607] = true,
					[80378599710093] = true,
					[138545858093468] = true,
					[78543193976484] = true,
					[84560812248785] = true,
					[121109264264863] = true,
					[127430563589722] = true,
					[135607453825698] = true,
					[77283137532868] = true,
					[90068457495667] = true,
					[125494010846103] = true,
					[133765555984165] = true,
					[95529898334632] = true,
					[99382634403006] = true,
					[86783510064589] = true,
					[86589420084208] = true,
					[102765565924889] = true,
					[133579806979721] = true,
					[99026842284463] = true,
					[109773957226586] = true,
					[135417353480586] = true,
					[125438339733688] = true,
					[134484976572653] = true,
					[120269887359321] = true,
					[121791689764143] = true,
					[82413189377307] = true,
					[84181957910464] = true,
					[82103960027260] = true,
					[87434268159000] = true,
					[90355655362328] = true,
					[102329983006446] = true,
					[103592476315193] = true,
					[120144629577072] = true,
					[84020834687601] = true,
					[79569619227538] = true,
					[99769219359297] = true,
					[118562056393454] = true,
					[123698367768788] = true,
					[122260680207209] = true,
					[108092224708647] = true,
					[138737996778070] = true,
					[79618064434477] = true,
					[92162040943589] = true,
					[131358112091157] = true,
					[117133124803747] = true,
					[105166894691027] = true,
					[114763311945259] = true,
					[137877653690370] = true,
					[81148045980280] = true,
					[95537646334614] = true,
					[140307685716031] = true,
					[139612166122421] = true,
					[122960294098710] = true,
					[85705688233470] = true,
					[124846100379271] = true,
					[90773034117257] = true,
					[88926980126853] = true,
					[126037773456240] = true,
					[74054939469235] = true,
					[99872418846237] = true,
					[108666948377765] = true,
					[108562093406025] = true,
					[73411006266154] = true,
					[95454091192549] = true,
					[112577812418885] = true,
					[98247621769748] = true,
					[99195327091888] = true,
					[119177471584977] = true,
					[96163997293092] = true,
					[74471432017749] = true,
					[87963130327219] = true,
					[111862099964874] = true,
					[106884223072637] = true,
					[82712022239311] = true,
					[112443092662473] = true,
					[86163373171837] = true,
					[132210685679703] = true,
					[105553413176895] = true,
					[120176289041563] = true,
					[118350440814972] = true,
					[96021292552142] = true,
					[119748818399549] = true,
					[95929885432431] = true,
					[110980919036136] = true,
					[83507945313310] = true,
					[89008537924871] = true,
					[127585685908588] = true,
					[130081881963891] = true,
					[76165947467682] = true,
					[74723144618437] = true,
					[99614027682043] = true,
					[72929416497118] = true,
					[116770235129877] = true,
					[79421618365844] = true,
					[93127508794485] = true,
					[93092528930633] = true,
					[95944691581999] = true,
					[126599399224485] = true,
					[121687513796271] = true,
					[102713710348080] = true,
					[74932476578150] = true,
					[135928273981948] = true,
					[107035267505065] = true,
					[113433986305565] = true,
					[123787348317011] = true,
					[129879611538538] = true,
					[140172296067727] = true,
					[103768468709610] = true,
					[113522621441604] = true,
					[113400167565890] = true,
					[81772444840888] = true,
					[91147562276326] = true,
					[136150680711101] = true,
					[126140547898474] = true,
					[74680283194704] = true,
					[130646438465243] = true,
					[134001682674459] = true,
					[103996610390710] = true,
					[100763701075399] = true,
					[81493987832464] = true,
					[10924531832] = true,
					[16516658091] = true,
					[16516718975] = true,
					[16516663035] = true,
					[16516666774] = true,
					[16516670462] = true,
				}

				local connection19 = nil

				local function fn60(arg)
					local num = tonumber((arg.Image or ""):match("%d+"))

					if num and tbl29[num] then
						pcall(function()
							arg.ImageTransparency = 1
						end)

						pcall(function()
							arg.BackgroundTransparency = 1
						end)
					end
				end

				local function fn61(arg)
					if tbl28[arg.Name] then
						arg.Enabled = false
						return
					end
				end

				v33:AddToggle("NoImpactFrames", { Text = "No Impact Frames", Default = false }):OnChanged(function()
					local playerGui = localPlayer3:FindFirstChild("PlayerGui")

					if toggles.NoImpactFrames.Value then
						local mobileJunk = playerGui and playerGui:FindFirstChild("MobileJunk")

						if mobileJunk then
							mobileJunk.Enabled = false
						end

						if playerGui then
							for _, child in ipairs(playerGui:GetChildren()) do
								if child:IsA("ScreenGui") then
									pcall(fn61, child)
								end
							end

							connection18 = playerGui.ChildAdded:Connect(function(child)
								if not child:IsA("ScreenGui") then
									return
								end

								if tbl28[child.Name] then
									child.Enabled = false
								end
							end)

							connection19 = playerGui.DescendantAdded:Connect(function(descendant)
								if not (descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")) then
									return
								end
								pcall(fn60, descendant)
							end)
						end
					else
						if connection18 then
							connection18:Disconnect()
							connection18 = nil
						end

						if connection19 then
							connection19:Disconnect()
							connection19 = nil
						end

						local mobileJunk = playerGui and playerGui:FindFirstChild("MobileJunk")

						if mobileJunk then
							mobileJunk.Enabled = true
						end

						if playerGui then
							for k in pairs(tbl28) do
								local v43 = playerGui:FindFirstChild(k)

								if v43 then
									v43.Enabled = true
								end
							end
						end
					end
				end)

				table.insert(tbl24, function()
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					pcall(function()
						toggles.NoImpactFrames:SetValue(false)
					end)
				end)
			end

			v33:AddToggle("AlwaysCanChat", { Text = "Always Can Chat", Default = false })
			local StarterGui = game:GetService("StarterGui")

			StarterGui.CoreGuiChangedSignal:Connect(function(arg, arg2)
				if arg2 then
					return
				end

				if not toggles.AlwaysCanChat.Value then
					return
				end

				if arg == Enum.CoreGuiType.Chat or arg == Enum.CoreGuiType.All then
					RunService.RenderStepped:Wait()
					StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
				end
			end)

			v33:AddDivider({ Text = "Desync" })
			v33:AddToggle("Visualizer", { Text = "Desync Visualizer", Default = false })
			v33:AddToggle("AlwaysVisualize", { Text = "Always Enabled", Default = false })

			table.insert(tbl24, function()
				if _fovRenderConn then
					_fovRenderConn:Disconnect()
					_fovRenderConn = nil
				end

				pcall(function()
					toggles.NoCameraAnimations:SetValue(false)
				end)

				pcall(function()
					toggles.FOVEnabled:SetValue(false)
				end)

				pcall(function()
					toggles.Visualizer:SetValue(false)
				end)

				pcall(function()
					toggles.AlwaysVisualize:SetValue(false)
				end)

				pcall(function()
					if getgenv()._vizClone then
						getgenv()._vizClone:Destroy()
						getgenv()._vizClone = nil
					end
				end)
			end)

			RevenantWhitelist = RevenantWhitelist or {}

			do
				local tbl28 = {
					Forward = "17124063826",
					Back = "17124067635",
					Left = "17124105294",
					Right = "17124112547",
					Idle = "17124061663",
				}

				local tbl29 = {}

				local function fn60()
					for _, v43 in pairs(tbl29) do
						pcall(function()
							if v43.IsPlaying then
								v43:Stop(0)
							end
						end)

						pcall(function()
							v43:Destroy()
						end)
					end

					tbl29 = {}
				end

				local function fn61(arg)
					for k, v43 in pairs(tbl29) do
						local flag17 = false

						for _, v44 in ipairs(arg) do
							if v44 == k then
								flag17 = true
								break
							end
						end

						if flag17 then
							if not v43.IsPlaying then
								pcall(function()
									v43:Play(0.1, 1, 1)
								end)
							end
						elseif v43.IsPlaying then
							pcall(function()
								v43:Stop(0.1)
							end)
						end
					end
				end

				Movement:AddToggle("SpeedHackEnabled", { Text = "CFrame Speed", Default = false })
				Movement:AddSlider("SpeedHack", { Text = "Speed", Default = 1, Min = 1, Max = 25000, Rounding = 1, Compact = true })
				Movement:AddDropdown("SpeedHackMethod", { Text = "Method", Values = { "CFrame", "Velocity" }, Default = 1, Multi = false })

				Movement:AddToggle("UpsideDown", {
					Text = "Upside Down",
					Default = false,
					Risky = true,
					Tooltip = "If used with invisibility will hide your chat bubble, might make your camera weird.",
					Callback = function(arg)
						tbl23["Upside Down"] = arg

						if not arg then
							local character = localPlayer3.Character

							if character then
								pcall(function()
									character:SetAttribute("NoHeadLerp", false)
								end)
							end
						end
					end,
				})

				task.spawn(function()
					while RunService.PreSimulation:Wait() do
						local value = options.SpeedHackMethod.Value
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")

						if character and humanoidRootPart2 and humanoid and toggles.SpeedHackEnabled.Value and not tbl23.Flying then
							if value == "CFrame" then
								humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + humanoid.MoveDirection * options.SpeedHack.Value / 10000
							elseif value == "Velocity" and humanoid.MoveDirection ~= Vector3.new() then
								while true do
									local n15 = humanoid.MoveDirection.Unit * options.SpeedHack.Value / 100
									humanoidRootPart2.Velocity = Vector3.new(n15.X, humanoidRootPart2.Velocity.Y, n15.Z)
									RunService.PreSimulation:Wait()
									if not (humanoid.MoveDirection == Vector3.new() or options.SpeedHackMethod.Value ~= value) then
										continue
									end
									break
								end

								humanoidRootPart2.Velocity = Vector3.new()
							end
						end
					end
				end)

				table.insert(tbl24, function()
					pcall(function()
						toggles.UpsideDown:SetValue(false)
					end)

					pcall(function()
						toggles.SpeedHackEnabled:SetValue(false)
					end)
				end)

				Keybinds:AddDivider({ Text = "Fly" })

				Keybinds:AddToggle("RevenantFly", {
					Text = "Fly",
					Default = false,
					Callback = function(arg)
						if not arg then
							if options.RevenantFlyBind then
								options.RevenantFlyBind.Toggled = false
							end

							tbl23.Flying = false
						end
					end,
				}):AddKeyPicker("RevenantFlyBind", {
					SyncToggleState = false,
					Mode = "Toggle",
					Default = "Y",
					Text = "Fly",
					Callback = function(arg)
						if tbl27.Fly then
							return
						end

						if arg and not toggles.RevenantFly.Value then
							RunService.RenderStepped:Wait()
							tbl27.Fly = true
							options.RevenantFlyBind.Toggled = false
							options.RevenantFlyBind:DoClick()
							tbl27.Fly = false
							return
						end

						if not toggles.RevenantFly.Value then
							return
						end
						tbl23.Flying = not tbl23.Flying
						v24:Notify({ Title = fn39("Fly"), Content = tbl23.Flying and "Toggled on ✅" or "Toggled off ❌", Time = 2 })
						local cFrame2 = nil
						local v43 = getChar(localPlayer3)
						local v44 = v43 and getHumanoid(v43)
						local v45 = v43 and getRoot(v43)

						if v43 and v45 and v44 then
							cFrame2 = v45.CFrame
						end

						if v44 then
							for _, v46 in pairs(v44:GetPlayingAnimationTracks()) do
								local match = v46.Animation and v46.Animation.AnimationId:match("%d+") or ""

								if match == "7815618175" or match == "507777826" or match == "507776043" or match == "616163682" then
									pcall(function()
										v46:Stop(0)
									end)
								end
							end
						end

						if tbl16[str8] then
							local humanoid = v43 and v43:FindFirstChildOfClass("Humanoid")
							humanoid = humanoid and humanoid:FindFirstChildOfClass("Animator")

							if v43 and humanoid then
								fn60()

								for k, v46 in pairs(tbl28) do
									local animation = Instance.new("Animation")
									animation.AnimationId = "rbxassetid://" .. v46
									local v47 = humanoid:LoadAnimation(animation)
									v47.Priority = Enum.AnimationPriority.Movement
									v47.Looped = true
									tbl29[k] = v47
								end
							end
						end

						local connection18 = RunService.Heartbeat:Connect(function()
							local v46 = getChar(localPlayer3)
							local v47 = v46 and getHumanoid(v46)
							local v48 = v46 and getRoot(v46)
							local currentCamera = workspace.CurrentCamera

							if v46 and v48 and v47 and currentCamera then
								local n15 = options.RevenantFlySpeed.Value / 100
								local cFrame3 = currentCamera.CFrame
								local lookVector = cFrame3.LookVector
								local rightVector = cFrame3.RightVector
								local cframe = CFrame.new(v48.Position, v48.Position + Vector3.new(lookVector.X, 0, lookVector.Z))
								local round = math.round
								local v49 = v47.MoveDirection:Dot(cframe.LookVector)
								local v50 = round(v49)
								local round2 = math.round
								local v51 = v47.MoveDirection:Dot(cframe.RightVector)
								local v52 = round2(v51)
								local vector = Vector3.zero

								if v50 == 1 then
									vector = Vector3.zero + lookVector * n15
								end

								if v50 == -1 then
									vector += lookVector * -n15
								end

								if v52 == -1 then
									vector += rightVector * -n15
								end

								if v52 == 1 then
									vector += rightVector * n15
								end

								if v50 == 0 and v52 == 0 then
									v48.Velocity = Vector3.new()
									v48.CFrame = cFrame2 or v48.CFrame
								else
									v48.Velocity = vector
									cFrame2 = v48.CFrame
								end

								v48.RotVelocity = Vector3.new()
								v48.CFrame = CFrame.new(v48.CFrame.Position, v48.CFrame.Position + cFrame3.LookVector)

								if tbl16[str8] then
									local tbl30 = {}

									if v50 == 1 then
										table.insert(tbl30, "Forward")
									elseif v50 == -1 then
										table.insert(tbl30, "Back")
									end

									if v52 == 1 then
										table.insert(tbl30, "Right")
									elseif v52 == -1 then
										table.insert(tbl30, "Left")
									end

									if #tbl30 == 0 then
										tbl30 = { "Idle" }
									end

									fn61(tbl30)
								end
							end
						end)

						repeat
							task.wait()
						until not tbl23.Flying

						tbl23.Flying = false
						connection18:Disconnect()
						fn60()
						local v46 = getChar(localPlayer3)
						local v47 = v46 and getRoot(v46)
						local v48 = v46 and getHumanoid(v46)

						if v48 then
							v48.AutoRotate = true
						end

						if v46 and v47 and v48 and not v48.SeatPart then
							local now2 = tick()
							v47.Velocity = Vector3.new()

							if not (v47.Velocity.Magnitude <= 5) then
								local flag17 = tick() >= now2 + 1
							end
						end

						if v48 then
						end

						local now2 = tick()

						while true do
							if v48 and v48.SeatPart then
								v48.SeatPart.Velocity = Vector3.new()
							end

							local flag17 = v48 and v48.SeatPart and v48.SeatPart.Velocity.Magnitude <= 5

							if not flag17 then
								flag17 = not (v48 and v48.SeatPart) or tick() >= now2 + 1
							end

							if not flag17 then
								continue
							end
							break
						end
					end,
				})

				Keybinds:AddSlider("RevenantFlySpeed", { Text = "Fly Speed", Default = 10000, Min = 1, Max = 50000, Rounding = 1 })

				table.insert(tbl24, function()
					tbl23.Flying = false
					fn60()

					pcall(function()
						toggles.RevenantFly:SetValue(false)
					end)
				end)
			end

			if tbl16[str8] then
				local tbl28 = { "rbxassetid://10480796021", "rbxassetid://10480793962" }

				Character:AddToggle("M1Reset", {
					Text = "M1 Reset / No Dash Debounce",
					Default = false,
					Tooltip = "Recommended with custom side dash speed set to 1.4.",
				})

				local connection18 = nil

				local function fn60(arg)
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					local humanoid = arg:WaitForChild("Humanoid", 10)
					if not humanoid then
						return
					end

					connection18 = humanoid.AnimationPlayed:Connect(function(arg2)
						if not toggles.M1Reset.Value then
							return
						end

						if not table.find(tbl28, arg2.Animation and arg2.Animation.AnimationId or "") then
							return
						end

						local connection19 = UserInputService.InputBegan:Once(function()
							while true do
								if UserInputService:IsKeyDown(Enum.KeyCode.Q) and not arg:FindFirstChild("RagdollCancel") then
									if UserInputService:IsKeyDown(Enum.KeyCode.A) or UserInputService:IsKeyDown(Enum.KeyCode.D) or UserInputService:IsKeyDown(Enum.KeyCode.S) then
										if workspace:GetAttribute("NoDashCooldown") then
											arg2:Stop()

											for _, child in pairs(arg:GetChildren()) do
												if child.Name == "UsedDash" or child.Name == "Freeze" then
													child:Destroy()
												end
											end
										end
									else
										arg.Communicate:FireServer({ Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress" })
									end

									return
								else
									RunService.RenderStepped:Wait()
									if arg2.IsPlaying then
										continue
									end
								end

								break
							end
						end)

						task.delay(1, function()
							connection19:Disconnect()
						end)
					end)
				end

				if localPlayer3.Character then
					task.spawn(fn60, localPlayer3.Character)
				end

				local connection19 = localPlayer3.CharacterAdded:Connect(function(character)
					task.spawn(fn60, character)
				end)

				table.insert(tbl24, function()
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					pcall(function()
						toggles.M1Reset:SetValue(false)
					end)
				end)

				local tbl29 = { "rbxassetid://10480796021", "rbxassetid://10480793962", "rbxassetid://10491993682" }
				Character:AddToggle("EmoteDash", { Text = "Emote Dash", Default = false })
				local tbl30 = {}

				local function fn61()
					local emotes = localPlayer3.PlayerGui:WaitForChild("Emotes", 15)
					if not emotes then
						return
					end
					local imageLabel = emotes:FindFirstChildWhichIsA("ImageLabel")

					if not imageLabel then
						local n15 = tick() + 5

						while true do
							local result = emotes.ChildAdded:Wait()

							if result:IsA("ImageLabel") then
								imageLabel = result
							end

							if not (imageLabel or tick() > n15) then
								continue
							end
							break
						end
					end

					if not imageLabel then
						return
					end

					local function fn62(arg)
						local button = arg:FindFirstChild("Button")
						if not (arg:IsA("Frame") and tonumber(arg.Name) and button) then
							return
						end

						local connection20 = button.MouseButton1Click:Connect(function()
							if not toggles.EmoteDash.Value then
								return
							end
							local v43 = getChar(localPlayer3)
							local v44 = v43 and getHumanoid(v43)
							if not (v43 and v44) or v43:FindFirstChild("Freeze") then
								return
							end

							local ok, result = pcall(function()
								return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
							end)

							task.wait(ok and result / 2 or 0)

							for _, v45 in pairs(v44:GetPlayingAnimationTracks()) do
								if table.find(tbl29, v45.Animation.AnimationId) then
									v45:AdjustSpeed(99)
								end
							end
						end)

						table.insert(tbl30, connection20)
					end

					for _, child in pairs(imageLabel:GetChildren()) do
						fn62(child)
					end

					local connection20 = imageLabel.ChildAdded:Connect(function(child)
						fn62(child)
					end)

					table.insert(tbl30, connection20)
				end

				task.spawn(fn61)

				localPlayer3.CharacterAdded:Connect(function()
					for _, v43 in pairs(tbl30) do
						v43:Disconnect()
					end

					tbl30 = {}
					task.spawn(fn61)
				end)

				table.insert(tbl24, function()
					for _, v43 in pairs(tbl30) do
						v43:Disconnect()
					end

					tbl30 = {}

					pcall(function()
						toggles.EmoteDash:SetValue(false)
					end)
				end)
			end

			do
				local connection18 = nil

				local function fn60()
					if connection18 then
						return
					end

					connection18 = RunService.Heartbeat:Connect(function()
						if not toggles.UltMirage or not toggles.UltMirage.Value then
							return
						end
						local character = localPlayer3.Character
						if not character then
							return
						end
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if not humanoid then
							return
						end

						if character:FindFirstChild("Freeze") or character:FindFirstChild("AntiMove") then
							return
						end

						if character:GetAttribute("Running") then
							humanoid.WalkSpeed = 32
						end
					end)
				end

				local function fn61()
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end
				end

				Character:AddToggle("UltMirage", {
					Text = "Ult Mirage",
					Default = false,
					Callback = function(arg)
						if arg then
							fn60()
						else
							fn61()
						end
					end,
				})

				table.insert(tbl24, function()
					fn61()

					pcall(function()
						toggles.UltMirage:SetValue(false)
					end)
				end)
			end

			if tbl17.Combat then
				Character:AddDropdown("CharacterExploits", {
					Values = {
						"No Dash Cooldown",
						"No Stun",
						"No Slow",
						"No Fatigue",
						"No Jump Bypass",
						"No Rotations Bypass",
						"Anti Ragdoll",
					},
					Default = {},
					Multi = true,
					AllowNull = true,
					Searchable = false,
					Text = "Character Exploits",
					Callback = function(arg)
						workspace:SetAttribute("NoDashCooldown", false)
						workspace:SetAttribute("NoFatigue", false)

						if rawget(arg, "No Dash Cooldown") then
							workspace:SetAttribute("NoDashCooldown", true)
						elseif rawget(arg, "No Fatigue") then
							workspace:SetAttribute("NoFatigue", true)
						elseif rawget(arg, "No Rotations Bypass") then
							local character = localPlayer3.Character

							if character then
								for _, descendant in pairs(character:GetDescendants()) do
									if descendant.Name == "NoRotate" or descendant.Name == "NoRotateUltimate" then
										pcall(function()
											descendant:Destroy()
										end)
									end
								end
							end
						end
					end,
				})

				Character:AddToggle("AutoRagdollCancel", { Text = "Auto Ragdoll Cancel", Default = false })
				Character:AddToggle("RagdollHide", { Text = "Ragdoll Hide", Default = false })
				Character:AddToggle("LaunchHide", { Text = "Launch Hide", Default = false })
				workspace:SetAttribute("EffectAffects", 1)

				local connection18 = workspace.AttributeChanged:Connect(function(attribute)
					if attribute == "NoDashCooldown" then
						workspace:SetAttribute(attribute, rawget(options.CharacterExploits.Value, "No Dash Cooldown") and true or false)
					elseif attribute == "NoFatigue" then
						workspace:SetAttribute(attribute, rawget(options.CharacterExploits.Value, "No Fatigue") and true or false)
					elseif attribute == "EffectsAffect" then
						workspace:SetAttribute("EffectAffects", 1)
					end
				end)

				table.insert(tbl24, function()
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					pcall(function()
						options.CharacterExploits:SetValue({})
					end)

					pcall(function()
						toggles.AutoRagdollCancel:SetValue(false)
					end)

					pcall(function()
						toggles.RagdollHide:SetValue(false)
					end)

					pcall(function()
						toggles.LaunchHide:SetValue(false)
					end)

					workspace:SetAttribute("NoDashCooldown", false)
					workspace:SetAttribute("NoFatigue", false)
				end)
			end

			if tbl17.Combat then
				local tbl28 = {
					["Atomic Slash"] = CFrame.new(-52, 1580, 25250) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					Arena = CFrame.new(-130, 440, -373) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					Baseplate = CFrame.new(-42, 1855, 25227) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Below Baseplate"] = CFrame.new(-42, 1469, 25227) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					Jail = CFrame.new(439, 440, -376) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Jail But Smaller"] = CFrame.new(20, 439, -460) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Bigger Jail"] = CFrame.new(290, 440, 465) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Even Bigger Jail"] = CFrame.new(378, 439, 457) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Dark Domain"] = CFrame.new(-80, 84, 20395) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Death Counter"] = CFrame.new(-66, 29, 20383) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					Middle = CFrame.new(155, 441, 45) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Mountain 1"] = CFrame.new(306, 671, 411) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Mountain 2"] = CFrame.new(-1, 653, -354) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					["Mountain Edge"] = CFrame.new(-297, 594, -336) * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0),
					Void = CFrame.new(169, 218, 102) * CFrame.new(0, 1.5, 0) * CFrame.Angles(1.5707963267948966, 0, 0),
				}

				local tbl29 = {
					["Atomic Slash"] = CFrame.new(-52, 1580, 25250),
					Arena = CFrame.new(-130, 440, -373),
					Baseplate = CFrame.new(-42, 1855, 25227),
					["Below Baseplate"] = CFrame.new(-42, 1469, 25227),
					Jail = CFrame.new(439, 440, -376),
					["Jail But Smaller"] = CFrame.new(20, 439, -460),
					["Bigger Jail"] = CFrame.new(290, 440, 465),
					["Even Bigger Jail"] = CFrame.new(378, 439, 457),
					["Dark Domain"] = CFrame.new(-80, 84, 20395),
					["Death Counter"] = CFrame.new(-66, 29, 20383),
					Middle = CFrame.new(150, 441, 32),
					["Mountain 1"] = CFrame.new(306, 671, 411),
					["Mountain 2"] = CFrame.new(-1, 653, -354),
					["Mountain Edge"] = CFrame.new(-297, 594, -336),
					Void = CFrame.new(0, -10000, 0),
				}

				local tbl30 = {}

				for k in pairs(tbl28) do
					tbl30[#tbl30 + 1] = k
				end

				table.sort(tbl30)
				local middle = tbl29.Middle
				local flag17 = false

				local function fn60(cFrame2)
					local character = localPlayer3.Character
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
					if not (character and humanoidRootPart2) then
						return
					end

					RunService.Heartbeat:Once(function()
						humanoidRootPart2.CFrame = cFrame2
					end)
				end

				local function fn61(arg, arg2)
					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://100933578899042"
					local v43 = arg:LoadAnimation(animation)
					animation.AnimationId = "rbxassetid://" .. arg2
					return v43
				end

				local function fn62()
					if getgenv()._wcDashOnCooldown then
						return true
					end

					if toggles.KibaTech and toggles.KibaTech.Value then
						return false
					end

					if toggles.SupaTech and toggles.SupaTech.Value then
						return false
					end

					if toggles.LoopDashV2 and toggles.LoopDashV2.Value then
						return false
					end

					if toggles.InstantTwisted and toggles.InstantTwisted.Value then
						local str9 = tostring(localPlayer3:GetAttribute("Character") or ""):lower()
						if str9:find("garou") or str9:find("hunter") or str9:find("child") then
							return false
						end
					end

					return true
				end

				local function fn63(arg)
					if not arg then
						return
					end
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 3)
					local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)
					if not humanoidRootPart2 or not humanoid then
						return
					end

					arg.AttributeChanged:Connect(function(attribute)
						if attribute ~= "Combo" then
							return
						end

						if arg:GetAttribute("Combo") ~= 5 then
							return
						end

						if not toggles.WallComboAnywhere.Value then
							return
						end
						local value = options.AutoWallCombo.Value
						if flag17 then
							return
						end

						task.spawn(function()
							task.wait()
							local flag18 = false

							pcall(function()
								for _, v43 in pairs(humanoid:GetPlayingAnimationTracks()) do
									if v43.Animation and v43.Animation.AnimationId:match("10470104242") then
										flag18 = true
										break
									end
								end
							end)

							local flag19 = false

							pcall(function()
								local tbl31 = {
									"10469643643",
									"13294471966",
									"17889290569",
									"13295936866",
									"13378708199",
									"14136436157",
									"15162694192",
									"16552234590",
									"17325537719",
									"134775406437626",
									"80601239139774",
								}

								for _, v43 in pairs(humanoid:GetPlayingAnimationTracks()) do
									if v43.Animation then
										local match = v43.Animation.AnimationId:match("%d+") or ""

										for _, v44 in ipairs(tbl31) do
											if match == v44 then
												flag19 = true
												break
											end
										end
									end

									if not flag19 then
										continue
									end
									break
								end
							end)

							if flag19 then
								local str9 = tostring(localPlayer3:GetAttribute("Character") or ""):lower()

								if (str9:find("garou") or str9:find("hunter") or str9:find("monster") or str9:find("child") or str9:find("tech")) and toggles.InstantTwisted and toggles.InstantTwisted.Value then
									flag19 = false
								end
							end

							if not flag18 and not flag19 and not fn62() then
								return
							end

							if value == "Auto Wall Combo + Bring" then
								flag17 = true
								local now2 = tick()

								repeat
									getgenv().flingDesync = { CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0) }
									task.wait()
								until tick() >= now2 + 0.225

								local cFrame2 = humanoidRootPart2.CFrame
								local flingDesync = { CFrame = tbl28[options.AutoWallComboArea.Value] }
								getgenv().flingDesync = flingDesync
								task.wait(0.2)

								pcall(function()
									arg.Communicate:FireServer({ Goal = "Wall Combo" })
								end)

								getgenv().flingDesync = nil
								flag17 = false
								task.wait(0.5)

								if arg:FindFirstChild("ForceField") and toggles.AutoWallComboTPBack.Value then
									pcall(function()
										for _, v43 in pairs(humanoid:GetPlayingAnimationTracks()) do
											v43:Stop()
										end
									end)

									fn60(cFrame2)
								end
							else
								flag17 = true
								local v43 = nil

								if not getgenv().InvisActive and not getgenv().FUCActive then
									local v44 = fn61(humanoid, "181525546")
									v44.Priority = Enum.AnimationPriority.Action3

									task.delay(0.1, function()
										v44:Play()
										v44.TimePosition = 1
										v44:AdjustWeight(999999)
										v44:AdjustSpeed(0)
									end)

									v43 = v44
								end

								local now2 = tick()

								repeat
									getgenv().flingDesync = { CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.5707963267948966, 0, 0) }
									task.wait()
								until now2 + 0.6 <= tick()

								getgenv().flingDesync = nil
								flag17 = false

								task.delay(0.1, function()
									if v43 then
										pcall(function()
											v43:Stop()
										end)
									end
								end)
							end
						end)
					end)

					arg.DescendantAdded:Connect(function(descendant)
						if not (descendant:IsA("ObjectValue") and descendant.Name:lower() == "wallcombo") then
							return
						end

						if not toggles.WallComboAnywhere.Value then
							return
						end
						local now2 = tick()

						while true do
							if options.AutoWallCombo.Value == "Auto Wall Combo" then
								pcall(function()
									arg.Communicate:FireServer({ Goal = "Wall Combo" })
								end)
							end

							task.wait()
							local flag18 = descendant.Parent ~= arg

							if not flag18 then
								flag18 = tick() >= now2 + (descendant:GetAttribute("DeleteMe") or 0.6)
							end

							if not flag18 then
								continue
							end
							break
						end
					end)
				end

				fn63(localPlayer3.Character)

				local connection18 = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(0.1)
					fn63(character)
				end)

				table.insert(tbl24, function()
					getgenv().flingDesync = nil
					flag17 = false

					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					pcall(function()
						toggles.WallComboAnywhere:SetValue(false)
					end)

					pcall(function()
						options.AutoWallCombo:SetValue("Manual")
					end)

					pcall(function()
						toggles.AutoWallComboTPBack:SetValue(false)
					end)
				end)

				v38:AddToggle("WallComboAnywhere", { Text = "Wall Combo Anywhere", Default = false })

				v38:AddDropdown("AutoWallCombo", {
					Text = "Auto Wall Combo",
					Values = { "Manual", "Auto Wall Combo", "Auto Wall Combo + Bring" },
					Multi = false,
					Default = 1,
				})

				v38:AddToggle("AutoWallComboTPBack", { Text = "Teleport Back", Default = false })

				v38:AddDropdown("AutoWallComboArea", {
					Text = "Area",
					Values = tbl30,
					Multi = false,
					Default = table.find(tbl30, "Death Counter"),
					Searchable = true,
				})

				v38:AddDivider({ Text = "Actions" })

				v38:AddButton({
					Text = "Teleport To Area",
					Func = function()
						local v43 = tbl29[options.AutoWallComboArea.Value]
						if not v43 then
							return
						end
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

						if character and humanoidRootPart2 then
							if (tbl29.Middle.Position - v43.Position).Magnitude >= 100 then
								middle = humanoidRootPart2.CFrame
							end
						end

						fn60(v43)
					end,
				})

				v38:AddButton({
					Text = "Teleport Back",
					Func = function()
						fn60(middle)
					end,
				})
			end

			if tbl16[str8] then
				Trashcan:AddToggle("TrashcanLaunch", { Text = "Trashcan Launch", Default = false })
				Trashcan:AddSlider("Trashcan_LaunchPower", { Text = "Launch Power", Default = 100, Min = 1, Max = 2500, Rounding = 1, Compact = true })

				Trashcan:AddToggle("NoTrashcanHold", {
					Text = "No Trashcan Hold",
					Default = false,
					Callback = function(arg)
						if not arg then
							return
						end
						local character = localPlayer3.Character
						character = character and character:FindFirstChildOfClass("Humanoid")
						if not character then
							return
						end

						for _, v43 in ipairs(character:GetPlayingAnimationTracks()) do
							local animationId = v43.Animation and v43.Animation.AnimationId or ""

							if animationId:match("13813450889") or animationId:match("13813448561") then
								v43:Stop()
							end
						end
					end,
				})

				task.spawn(function()
					local connection18 = nil

					local function fn60(arg)
						if connection18 then
							pcall(function()
								connection18:Disconnect()
							end)
						end

						if arg then
							arg = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 10)
						end

						if not arg then
							return
						end

						connection18 = arg.AnimationPlayed:Connect(function(arg2)
							if not (toggles.NoTrashcanHold and toggles.NoTrashcanHold.Value) then
								return
							end
							local animationId = arg2.Animation and arg2.Animation.AnimationId or ""

							if animationId:match("13814919604") or animationId:match("13813450889") or animationId:match("13813448561") or animationId:match("13813955149") then
								arg2:Stop()
							end
						end)
					end

					fn60(localPlayer3.Character)

					localPlayer3.CharacterAdded:Connect(function(character)
						task.wait(0.3)
						fn60(character)
					end)
				end)
			end

			if tbl16[str8] and tbl17.Combat then
				local tbl28 = {
					["Above Tunnel"] = CFrame.new(-301, 594, -322),
					Arena = CFrame.new(-130, 440, -373),
					["Atomic Slash"] = CFrame.new(-52, 1580, 25250),
					Baseplate = CFrame.new(-42, 1855, 25227),
					["Below Baseplate"] = CFrame.new(-42, 1469, 25227),
					["Bigger Jail"] = CFrame.new(290, 440, 465),
					["Black Domain"] = CFrame.new(1e12, 100000000, 1e11),
					["Even Bigger Jail"] = CFrame.new(378, 439, 457),
					["Dark Domain"] = CFrame.new(-80, 84, 20395),
					["Death Counter"] = CFrame.new(-66, 29, 20383),
					Jail = CFrame.new(439, 440, -376),
					["Jail But Smaller"] = CFrame.new(20, 439, -460),
					Middle = CFrame.new(150, 441, 32),
					["Mountain 1"] = CFrame.new(306, 671, 411),
					["Mountain 2"] = CFrame.new(-1, 653, -354),
					["Mountain Edge"] = CFrame.new(-297, 594, -336),
					Void = CFrame.new(0, -10000, 0),
				}

				local tbl29 = {}

				for k in pairs(tbl28) do
					tbl29[#tbl29 + 1] = k
				end

				table.sort(tbl29)
				local middle = tbl28.Middle

				local function fn60(cFrame2)
					local character = localPlayer3.Character
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
					if not (character and humanoidRootPart2) then
						return
					end

					RunService.Heartbeat:Once(function()
						humanoidRootPart2.CFrame = cFrame2
					end)
				end

				local function fn61(arg)
					if not arg then
						return
					end
					local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 3)
					if not humanoid or not humanoidRootPart2 then
						return
					end

					humanoid.AnimationPlayed:Connect(function(arg2)
						if not toggles.SkillBring.Value then
							return
						end
						local animationId = arg2.Animation.AnimationId
						local v43 = tbl28[options.SkillBringArea.Value]
						local value = toggles.SkillBringTPBack.Value
						local flag17 = options.SkillBringArea.Value == "Void"

						if animationId:match("12296113986") and _rawget(options.SkillBringMoves.Value, "Lethal Whirlwind Stream") then
							local cFrame2 = humanoidRootPart2.CFrame
							game:GetService("TweenService"):Create(humanoidRootPart2, TweenInfo.new(0.5, Enum.EasingStyle.Linear), { CFrame = v43 }):Play()

							if value then
								local now2 = tick()

								while true do
									task.wait()
									if not (not arg2.IsPlaying or tick() - now2 > 8) then
										continue
									end
									break
								end

								fn60(cFrame2)
							end
						elseif animationId:match("15145462680") and _rawget(options.SkillBringMoves.Value, "Atmos Cleave") then
							task.spawn(function()
								task.wait(1.6)

								for _, player in pairs(Players:GetPlayers()) do
									if player == localPlayer3 then
										continue
									end
									local character = player.Character
									local humanoidRootPart3 = character and character:FindFirstChild("HumanoidRootPart")
									character = character and character:FindFirstChildOfClass("Humanoid")
									if humanoidRootPart3 and character and (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude <= 15 and character.Health <= 20 then
										return
									end
								end

								local cFrame2 = humanoidRootPart2.CFrame
								local now2 = tick()

								repeat
									fn60(v43)
									task.wait()
								until now2 + 0.5 <= tick()

								if value then
									while true do
										task.wait()
										if not (not arg2.IsPlaying or tick() - now2 > 8) then
											continue
										end
										break
									end

									fn60(cFrame2)
								end
							end)
						elseif animationId:match("99798123383608") and _rawget(options.SkillBringMoves.Value, "Sonic Burst") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame
								task.wait(0.9)
								getgenv()._burstStop = true
								local now2 = tick()

								while true do
									fn60(v43)
									task.wait()
									if not (not arg2.IsPlaying or tick() >= now2 + 1) then
										continue
									end
									break
								end

								if value then
									fn60(cFrame2)
								end

								getgenv()._burstStop = nil
							end)
						elseif animationId:match("16139108718") and _rawget(options.SkillBringMoves.Value, "Crushing Pull") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame

								if not _rawget(options.SkillBringMoves.Value, "Crushing Pull Variant") then
									fn60(v43)
									local now2 = tick()

									while true do
										task.wait()
										if not (not arg2.IsPlaying or tick() - now2 > 8) then
											continue
										end
										break
									end

									if value then
										fn60(cFrame2)
									end

									return
								end

								if flag17 then
									local v44 = nil

									local connection18 = humanoid.AnimationPlayed:Connect(function(arg3)
										if arg3.Animation.AnimationId:match("16571461202") then
											local v45
											v44 = v45
										end
									end)

									keypress(32)

									while true do
										task.wait()
										if not (not arg2.IsPlaying or v44) then
											continue
										end
										break
									end

									keyrelease(32)
									connection18:Disconnect()
									if not v44 then
										return
									end
									fn60(v43)

									if value then
										local now2 = tick()

										while true do
											task.wait()
											if not (not v44.IsPlaying or tick() - now2 > 8) then
												continue
											end
											break
										end

										fn60(cFrame2)
									end

									return
								end

								local currentCamera = workspace.CurrentCamera
								local cFrame3 = currentCamera.CFrame
								currentCamera.CameraType = Enum.CameraType.Scriptable
								getgenv()._cpCamActive = true

								local connection18 = currentCamera:GetPropertyChangedSignal("CameraType"):Connect(function()
									if currentCamera.CameraType ~= Enum.CameraType.Scriptable then
										currentCamera.CameraType = Enum.CameraType.Scriptable
									end
								end)

								RunService:BindToRenderStep("_cpCamLock", Enum.RenderPriority.Camera.Value + 1, function()
									currentCamera.CFrame = cFrame3
								end)

								keypress(32)
								local v44 = nil

								local connection19 = humanoid.AnimationPlayed:Connect(function(arg3)
									if not v44 then
										v44 = arg3
									end
								end)

								local now2 = tick()

								while true do
									fn60(v43)
									task.wait()
									if not (v44 or tick() - now2 > 1.5) then
										continue
									end
									break
								end

								connection19:Disconnect()
								keyrelease(32)

								if v44 then
									local now3 = tick()

									while true do
										task.wait()
										if not (not v44.IsPlaying or tick() - now3 > 6) then
											continue
										end
										break
									end
								end

								connection18:Disconnect()
								RunService:UnbindFromRenderStep("_cpCamLock")
								getgenv()._cpCamActive = false
								currentCamera.CameraType = Enum.CameraType.Custom

								if value then
									fn60(cFrame2)
								end
							end)
						elseif animationId:match("18182425133") and _rawget(options.SkillBringMoves.Value, "Head First") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame

								while true do
									task.wait()
									if not (arg2.TimePosition >= 2.6 or not arg2.IsPlaying) then
										continue
									end
									break
								end

								if not arg2.IsPlaying then
									return
								end
								fn60(v43)

								if value then
									repeat
										task.wait()
									until not arg2.IsPlaying

									fn60(cFrame2)
								end
							end)
						elseif animationId:match("94638356008696") and _rawget(options.SkillBringMoves.Value, "Crowd Finisher") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame

								while true do
									task.wait()
									if not (arg2.TimePosition >= 1.5 or not arg2.IsPlaying) then
										continue
									end
									break
								end

								if not arg2.IsPlaying then
									return
								end

								repeat
									fn60(v43)
									task.wait()
								until not arg2.IsPlaying

								if value then
									fn60(cFrame2)
								end
							end)
						elseif animationId:match("95034083206292") and _rawget(options.SkillBringMoves.Value, "Binding Cloth") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame

								while true do
									task.wait()
									if not (arg2.TimePosition >= 1.7 or not arg2.IsPlaying) then
										continue
									end
									break
								end

								if not arg2.IsPlaying then
									return
								end
								fn60(v43)

								if value then
									repeat
										task.wait()
									until not arg2.IsPlaying

									fn60(cFrame2)
								end
							end)
						elseif animationId:match("115484690572880") and _rawget(options.SkillBringMoves.Value, "Crimson Whirl") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame

								while true do
									task.wait()
									if not (arg2.TimePosition >= 1 or not arg2.IsPlaying) then
										continue
									end
									break
								end

								if not arg2.IsPlaying then
									return
								end
								fn60(v43)

								if value then
									repeat
										task.wait()
									until not arg2.IsPlaying

									fn60(cFrame2)
								end
							end)
						elseif animationId:match("16571461202") and _rawget(options.SkillBringMoves.Value, "Crushing Pull Variant") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame
								fn60(v43)
								local now2 = tick()

								while true do
									task.wait()
									if not (not arg2.IsPlaying or tick() - now2 > 8) then
										continue
									end
									break
								end

								if value then
									fn60(cFrame2)
								end
							end)
						elseif animationId:match("119833661079663") and _rawget(options.SkillBringMoves.Value, "Grave Maker") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame

								while true do
									task.wait()
									if not (arg2.TimePosition >= 2.5 or not arg2.IsPlaying) then
										continue
									end
									break
								end

								if not arg2.IsPlaying then
									return
								end
								fn60(v43)

								if value then
									repeat
										task.wait()
									until not arg2.IsPlaying

									fn60(cFrame2)
								end
							end)
						elseif animationId:match("77509627104305") and _rawget(options.SkillBringMoves.Value, "Trinity Tear") then
							task.spawn(function()
								local cFrame2 = humanoidRootPart2.CFrame
								local v44 = nil

								local connection18 = humanoid.AnimationPlayed:Connect(function(arg3)
									if arg3.Animation.AnimationId:match("98542310119798") then
										local v45
										v44 = v45
									end
								end)

								while true do
									task.wait()
									if not (arg2.TimePosition >= 1.87 or v44 or not arg2.IsPlaying) then
										continue
									end
									break
								end

								if not v44 and not arg2.IsPlaying then
									local now2 = tick()

									while true do
										task.wait()
										if not (v44 or tick() - now2 > 0.2) then
											continue
										end
										break
									end
								end

								if not (v44 or arg2.IsPlaying) then
									connection18:Disconnect()
									return
								end
								fn60(v43)

								if value then
									local now2 = tick()

									while true do
										task.wait()
										if not (v44 or tick() - now2 > 1) then
											continue
										end
										break
									end

									if v44 then
										while true do
											task.wait()
											if not (not v44.IsPlaying or tick() - now2 > 8) then
												continue
											end
											break
										end
									end

									fn60(cFrame2)
								end

								connection18:Disconnect()
							end)
						end
					end)
				end

				fn61(localPlayer3.Character)

				local connection18 = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(0.1)
					fn61(character)
				end)

				local tbl30 = { "rbxassetid://12351854556", "rbxassetid://15311685628", "rbxassetid://15128849047" }
				local tbl31 = { "rbxassetid://13603396939", "rbxassetid://15334974550", "rbxassetid://15123665491" }
				local tbl32 = { "rbxassetid://10470389827", "rbxassetid://13380778193", "rbxassetid://13935548552" }
				local tbl33 = {}

				local function fn62(arg)
					if not arg then
						return
					end
					local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 3)
					if not humanoid or not humanoidRootPart2 then
						return
					end

					table.insert(tbl33, arg:GetAttributeChangedSignal("Blocking"):Connect(function()
						if arg:GetAttribute("Blocking") and toggles.InvisibleMoves_Block.Value then
							arg:SetAttribute("Blocking", false)
						end
					end))

					table.insert(tbl33, humanoid.AnimationPlayed:Connect(function(arg2)
						local animationId = arg2.Animation.AnimationId

						if animationId:match("11365563255") and _rawget(options.InvisibleMoves_Saitama.Value, "Invisible Table Flip") then
							arg2:Stop()

							task.delay(3, function()
								humanoid.HipHeight = 10
								task.wait(0.75)
								humanoid.HipHeight = 0
							end)
						elseif animationId:match("12983333733") then
							if _rawget(options.InvisibleMoves_Saitama.Value, "Invisible Serious Punch") then
								arg2:Stop()
							end
						elseif animationId:match("13927612951") and _rawget(options.InvisibleMoves_Saitama.Value, "Invisible Omni-Directional Punch") then
							arg2:Stop()
						elseif animationId:match("12447707844") and _rawget(options.InvisibleMoves_Saitama.Value, "Invisible Ult") then
							arg2:Stop()
							local now2 = tick()

							repeat
								getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
								task.wait()
							until now2 + 1 <= tick()

							getgenv().desync = nil
						elseif animationId:match("12342141464") and _rawget(options.InvisibleMoves_Garou.Value, "Invisible Ult") then
							arg2:Stop()
						elseif (animationId == "rbxassetid://13499771836" or animationId == "rbxassetid://13497875049") and _rawget(options.InvisibleMoves_Sonic.Value, "Invisible Ult") then
							arg2:Stop()
						elseif animationId:match("12772543293") and _rawget(options.InvisibleMoves_Genos.Value, "Invisible Ult") then
							arg2:Stop()
						elseif animationId:match("13146710762") and _rawget(options.InvisibleMoves_Genos.Value, "Invisible Incinerate") then
							arg2:Stop()
						elseif animationId:match("15145462680") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Atmos Cleave") then
							arg2:Stop()
						elseif animationId:match("15391323441") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Ult") then
							arg2:Stop()
						elseif (animationId:match("16139108718") or animationId:match("16139708727") or animationId:match("16139402582")) and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Crushing Pull") then
							arg2:Stop()
						elseif animationId:match("16515850153") and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Windstorm Fury") then
							arg2:Stop()
						elseif animationId:match("16431491215") and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Stone Grave") then
							arg2:Stop()
						elseif (animationId:match("16597322398") or animationId:match("16597912086")) and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Expulsive Push") then
							arg2:Stop()
						elseif animationId:match("16734584478") and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Ult") then
							arg2:Stop()
						elseif animationId:match("15520132233") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Sunset") then
							arg2:Stop()
						elseif animationId:match("15676072469") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Solar Cleave") then
							arg2:Stop()
						elseif animationId:match("16062410809") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Sunrise") then
							arg2:Stop()
						elseif animationId:match("16062712948") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Sunrise Finisher") then
							arg2:Stop()
						elseif animationId:match("16082123712") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Atomic Slash") then
							arg2:Stop()
						elseif animationId:match("16057411888") and _rawget(options.InvisibleMoves_AtomicSamurai.Value, "Invisible Atomic Slash Finisher") then
							arg2:Stop()
						elseif animationId:match("17799224866") and _rawget(options.InvisibleMoves_Suiryu.Value, "Bullet Barrage") then
							arg2:Stop()
						elseif animationId:match("17275150809") and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Terrible Tornado") then
							arg2:Stop()
						elseif animationId:match("17278415853") and _rawget(options.InvisibleMoves_Tatsumaki.Value, "Invisible Terrible Tornado Finisher") then
							arg2:Stop()
						elseif table.find(tbl30, animationId) and toggles.InvisibleMoves_Counter.Value then
							arg2:AdjustWeight(-999999)
						elseif table.find(tbl31, animationId) and toggles.InvisibleMoves_CounterHit.Value then
							arg2:Stop()
						elseif table.find(tbl32, animationId) and toggles.InvisibleMoves_Block.Value then
							arg2:AdjustWeight(-999999)
							local esperShield = arg:FindFirstChild("EsperShield", true)

							if esperShield then
								for _, descendant in pairs(esperShield:GetDescendants()) do
									if descendant:IsA("ParticleEmitter") and not descendant.Name:find("Impact") then
										task.spawn(function()
											local rate = descendant.Rate
											local color = descendant.Color
											descendant.Rate = 45

											if toggles.InvisibleMoves_BlockColor.Value then
												local v43 = descendant
												local colorSequence = ColorSequence.new
												local tbl34 = {}
												local v44 = ColorSequenceKeypoint.new(0, options.InvisibleMoves_BlockColor1.Value)
												local v45 = ColorSequenceKeypoint.new(0.5, options.InvisibleMoves_BlockColor2.Value)
												local new = ColorSequenceKeypoint.new
												local value = options.InvisibleMoves_BlockColor3.Value
												tbl34[1] = v44
												tbl34[2] = v45

												do
													local values = table.pack(new(1, value))
													table.move(values, 1, values.n, 3, tbl34)
												end

												v43.Color = colorSequence(tbl34)
											end

											descendant.Enabled = true

											repeat
												RunService.RenderStepped:Wait()
											until not arg2.IsPlaying

											descendant.Enabled = false
											descendant.Rate = rate

											if toggles.InvisibleMoves_BlockColor.Value then
												descendant.Color = color
											end
										end)
									end
								end
							end
						end
					end))
				end

				fn62(localPlayer3.Character)

				local connection19 = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(0.1)
					fn62(character)
				end)

				table.insert(tbl24, function()
					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					for _, v43 in ipairs(tbl33) do
						pcall(function()
							v43:Disconnect()
						end)
					end

					table.clear(tbl33)

					pcall(function()
						toggles.InvisibleMoves_Block:SetValue(false)
					end)

					pcall(function()
						toggles.InvisibleMoves_BlockColor:SetValue(false)
					end)

					pcall(function()
						toggles.InvisibleMoves_Counter:SetValue(false)
					end)

					pcall(function()
						toggles.InvisibleMoves_CounterHit:SetValue(false)
					end)
				end)

				table.insert(tbl24, function()
					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					pcall(function()
						toggles.SkillBring:SetValue(false)
					end)

					pcall(function()
						toggles.SkillBringTPBack:SetValue(false)
					end)
				end)

				Bring:AddToggle("SkillBring", { Text = "Skill Bring", Default = false })
				Bring:AddToggle("SkillBringTPBack", { Text = "Teleport Back", Default = false })

				Bring:AddDropdown("SkillBringMoves", {
					Text = "Skill Bring Moves",
					Values = {
						"Lethal Whirlwind Stream",
						"Atmos Cleave",
						"Sonic Burst",
						"Crushing Pull",
						"Crushing Pull Variant",
						"Head First",
						"Crowd Finisher",
						"Crimson Whirl",
						"Binding Cloth",
						"Grave Maker",
						"Trinity Tear",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = true,
				})

				Bring:AddDropdown("SkillBringArea", {
					Text = "Skill Bring Area",
					Values = tbl29,
					Multi = false,
					Default = table.find(tbl29, "Death Counter"),
					Searchable = true,
				})

				Bring:AddButton({
					Text = "Teleport To Area",
					Func = function()
						local v43 = tbl28[options.SkillBringArea.Value]
						if not v43 then
							return
						end
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

						if character and humanoidRootPart2 then
							middle = humanoidRootPart2.CFrame
						end

						fn60(v43)
					end,
				})

				Bring:AddButton({
					Text = "Teleport Back",
					Func = function()
						fn60(middle)
					end,
				})

				Bring:AddDivider({ Text = "Attack All" })
				Bring:AddToggle("AttackAll", { Text = "Attack All", Default = false })

				Bring:AddDropdown("AttackAllMoves", {
					Text = "Moves",
					Values = {
						"Savage Tornado",
						"Brutal Beatdown",
						"Crushed Rock Variant",
						"Twin Fangs",
						"Limit Breaker",
						"Burst",
					},
					Multi = true,
					AllowNull = true,
					Default = {},
					Searchable = false,
				})

				Bring:AddDivider({ Text = "Skill Throw" })
				Bring:AddToggle("SkillThrow", { Text = "Skill Throw", Default = false })
				Bring:AddDropdown("SkillThrowMoves", { Values = { "Hunters Grasp", "Homerun" }, Multi = true, AllowNull = true, Default = {} })
				Bring:AddDivider({ Text = "Bypasses" })
				Bring:AddToggle("NoBP_WindstormFury", { Text = "Windstorm Fury Bypass", Default = false })
				Bring:AddToggle("NoBP_TatsumakiUlt", { Text = "Tatsumaki Ult Bypass", Default = false })
				Bring:AddToggle("NoBP_PreysPeril", { Text = "Prey's Peril Bypass", Default = false })

				table.insert(tbl24, function()
					pcall(function()
						toggles.AttackAll:SetValue(false)
					end)

					pcall(function()
						toggles.SkillThrow:SetValue(false)
					end)

					pcall(function()
						toggles.NoBP_WindstormFury:SetValue(false)
					end)

					pcall(function()
						toggles.NoBP_TatsumakiUlt:SetValue(false)
					end)

					pcall(function()
						toggles.NoBP_PreysPeril:SetValue(false)
					end)
				end)
			end

			getgenv()._RevenantFeaturesReady = false

			task.spawn(function()
				local ok, result = xpcall(function()
					local mouse = localPlayer3:GetMouse()
					local Stats = game:GetService("Stats")
					local ReplicatedStorage = game:GetService("ReplicatedStorage")
					local Debris = game:GetService("Debris")

					tbl23 = {
						Flying = false,
						["Touch Fling"] = false,
						["Touch Fling Settings"] = Vector3.zero,
						["Trashcan Launch"] = false,
					}

					tbl27 = { Fly = false, ["Lock-on"] = false, ["Touch Fling"] = false }
					local tbl28 = {}
					local tbl29 = {}
					local v43 = nil
					local tbl30 = {}

					local function fn60(arg)
						if typeof(arg) == "Instance" then
							if arg:IsA("Player") then
								return arg.Character
							end

							if arg:IsA("Model") then
								return arg
							end
						end

						return nil
					end

					local function fn61(arg)
						return arg and arg:FindFirstChild("HumanoidRootPart") or nil
					end

					local function fn62(arg)
						return arg and arg:FindFirstChildOfClass("Humanoid") or nil
					end

					local function fn63()
						local players = Players:GetPlayers()
						local v44 = table.find(players, localPlayer3)

						if v44 then
							table.remove(players, v44)
						end

						return players
					end

					local function fn64(arg)
						return arg ~= nil and typeof(arg) == "Instance" and arg:IsA("Model")
					end

					local function fn65()
						local tbl31 = {}
						local live = workspace:FindFirstChild("Live")
						if not live then
							return tbl31
						end
						local v44 = fn60(localPlayer3)

						for _, child in ipairs(live:GetChildren()) do
							if child ~= v44 and not Players:GetPlayerFromCharacter(child) then
								local humanoid = child:FindFirstChildOfClass("Humanoid")

								if humanoid and humanoid.Health > 0 then
									tbl31[#tbl31 + 1] = child
								end
							end
						end

						return tbl31
					end

					local function fn66()
						return workspace:GetAttribute("VIPServer") ~= nil
					end

					local function fn67(arg, arg2)
						if not arg then
							return false
						end

						for _, v44 in pairs(arg:GetPlayingAnimationTracks()) do
							if v44.Animation.AnimationId:match(arg2) then
								return true
							end
						end

						return false
					end

					local function fn68(arg)
						local v44 = fn63()
						local tbl31 = {}

						for _, v45 in ipairs(v44) do
							if not table.find(RevenantWhitelist, v45) then
								table.insert(tbl31, v45)
							end
						end

						for _, v45 in ipairs(fn65()) do
							table.insert(tbl31, v45)
						end

						if #tbl31 == 0 then
							return
						end
						local v45 = tbl31[math.random(1, #tbl31)]
						if v45 == localPlayer3 then
							return
						end
						local v46 = fn60(localPlayer3)
						local v47 = v46 and fn61(v46)
						local v48 = fn60(v45)
						local v49 = v48 and fn61(v48)
						local v50 = v48 and fn62(v48)
						if not (v46 and v47 and v48 and v49 and v50) then
							return
						end

						if arg then
							if v48:GetAttribute("Ulted") and v48:GetAttribute("Character") == "Batter" then
								return
							end

							for _, child in pairs(v48:GetChildren()) do
								if child:IsA("Tool") and child.Name == "Death Blow" then
									return
								end
							end

							if fn67(v50, "15128849047") then
								return
							end

							for _, player in pairs(Players:GetPlayers()) do
								if player ~= localPlayer3 and player ~= v45 then
									local v51 = fn60(player)
									local v52 = v51 and fn61(v51)
									local v53 = v51 and fn62(v51)

									if v51 and v52 and v53 and (v52.Position - v49.Position).Magnitude <= 100 then
										if v51:GetAttribute("Ulted") and v51:GetAttribute("Character") == "Batter" then
											return
										end

										for _, child in pairs(v51:GetChildren()) do
											if child:IsA("Tool") and child.Name == "Death Blow" then
												return
											end
										end

										if fn67(v53, "15128849047") then
											return
										end
									end
								end
							end
						end

						RunService.Heartbeat:Once(function()
							v47.CFrame = v49.CFrame
						end)

						task.wait()

						RunService.Heartbeat:Once(function()
							v47.CFrame = CFrame.lookAt(v47.Position, v49.Position)
						end)
					end

					local function fn69(arg)
						local genv = getgenv()
						local revRealCF = (genv.desync or genv.desync2) and genv._revRealCF

						if revRealCF then
							revRealCF = os.clock() - (genv._revRealCFt or 0) < 0.2
						end

						if revRealCF then
							return genv._revRealCF
						end
						return arg.CFrame
					end

					local function fn70(revTPOverride)
						local v44 = fn60(localPlayer3)
						local v45 = v44 and fn61(v44) or v44

						if v44 and v45 then
							local genv = getgenv()

							if genv.desync or genv.desync2 then
								genv._revTPOverride = revTPOverride
							end

							task.spawn(function()
								RunService.RenderStepped:Once(function()
									v45.Velocity = Vector3.new()
									RunService.Heartbeat:Wait()
									v45.Velocity = Vector3.new()
								end)
							end)

							RunService.Heartbeat:Once(function()
								RunService.Heartbeat:Once(function()
									v45.CFrame = revTPOverride
								end)
							end)
						end
					end

					local function fn71(arg, arg2, arg3)
						if not (arg and arg2) then
							return nil
						end
						local animationId = "rbxassetid://" .. tostring(arg2):match("%d+")
						local animation = Instance.new("Animation")
						local v44

						if arg3 then
							if arg3 == "Server" then
								animation.AnimationId = "rbxassetid://100933578899042"
								v44 = arg:LoadAnimation(animation)
								animation.AnimationId = animationId
							else
								v44 = nil

								if arg3 == "Client" then
									animation.AnimationId = animationId
									v44 = arg:LoadAnimation(animation)
									animation.AnimationId = "rbxassetid://100933578899042"
								end
							end
						else
							animation.AnimationId = animationId
							v44 = arg:LoadAnimation(animation)
						end

						return v44
					end

					local function createSound(parent, arg)
						if not (parent and arg) then
							return nil
						end
						local sound = Instance.new("Sound")
						sound.Parent = parent
						sound.SoundId = "rbxassetid://" .. tostring(arg):match("%d+")
						return sound
					end

					local function fn72(arg, arg2)
						local flag17 = not arg and fn60(localPlayer3) and fn62(fn60(localPlayer3))

						if flag17 then
							if arg2 then
								for _, v44 in pairs(flag17:GetPlayingAnimationTracks()) do
									if typeof(arg2) ~= "table" then
										if v44.Animation.AnimationId:match(tostring(arg2):match("%d+")) then
											v44:Stop()
										end
									else
										for _, v45 in pairs(arg2) do
											if v44.Animation.AnimationId:match(tostring(v45):match("%d+")) then
												v44:Stop()
											end
										end
									end
								end
							else
								for _, v44 in pairs(flag17:GetPlayingAnimationTracks()) do
									v44:Stop()
								end
							end
						end
					end

					local function fn73()
						local v44 = fn60(localPlayer3)
						if not v44 then
							return nil
						end
						return (v44:WaitForChild("Communicate", 1))
					end

					local function fn74(arg)
						local v44 = fn73()

						if v44 then
							v44:FireServer(arg)
						end
					end

					local function fn75(arg, arg2)
						task.wait()
						local parent = arg.Parent
						arg:Destroy()

						if arg2 then
							warn("Instance removed, Name:", arg.Name, "ClassName:", arg.ClassName, "Parent:", parent)
						end
					end

					local function fn76(arg)
						local isModel = typeof(arg) == "Instance" and arg:IsA("Model") and arg or fn60(arg)
						local v44 = isModel and fn61(isModel) or isModel
						return isModel and v44 and v44.Velocity.Magnitude >= 2000 and true or false
					end

					local function fn77(arg, arg2)
						local v44 = fn60(localPlayer3)
						local v45 = v44 and fn61(v44) or v44
						v44 = v44 and v45
						local v46 = nil

						if v44 then
							local tbl31 = {}

							for _, player in pairs(Players:GetPlayers()) do
								table.insert(tbl31, player)
							end

							local live = workspace:FindFirstChild("Live")

							if live then
								for _, child in ipairs(live:GetChildren()) do
									if child:IsA("Model") and child:FindFirstChild("Humanoid") then
										table.insert(tbl31, child)
									end
								end
							end

							local huge = math.huge
							v46 = nil

							for _, v47 in ipairs(tbl31) do
								local flag17 = v47 == localPlayer3 or typeof(v47) == "Instance" and v47:IsA("Model") and v47 == localPlayer3.Character
								local isModel = typeof(v47) == "Instance" and v47:IsA("Model") and v47 or fn60(v47)

								if not flag17 and isModel then
									local v48 = isModel and fn61(isModel) or isModel
									local v49 = isModel and fn62(isModel) or isModel

									if isModel and v48 and v49 and v49.Health ~= 0 and workspace.CurrentCamera then
										local magnitude

										if arg then
											local v50 = workspace.CurrentCamera:WorldToViewportPoint(v48.Position)

											if v50.Z > 0 then
												magnitude = (Vector2.new(v50.X, v50.Y) - UserInputService:GetMouseLocation()).Magnitude
											else
												magnitude = nil
											end
										else
											magnitude = (v45.Position - v48.Position).Magnitude
										end

										if magnitude and magnitude < huge then
											if arg2 then
												if not fn76(v47) then
													huge = magnitude
													v46 = v47
												end
											else
												huge = magnitude
												v46 = v47
											end
										end
									end
								end
							end
						end

						return v46
					end

					Keybinds:AddDivider({ Text = "Teleportation" })

					Keybinds:AddToggle("AnimeTeleportation", {
						Text = "Anime Teleportation",
						Default = false,
						Callback = function()
						end,
					})

					Keybinds:AddLabel("Anime Teleportation Keybind"):AddKeyPicker("AnimeTPKeybind", {
						SyncToggleState = false,
						Mode = "Toggle",
						Default = "T",
						Text = "Anime Teleportation",
						Callback = function()
							options.AnimeTPKeybind.Toggled = false
							if not toggles.AnimeTeleportation or not toggles.AnimeTeleportation.Value then
								return
							end
							local v44 = fn60(localPlayer3)
							local v45 = v44 and fn61(v44) or v44
							local v46 = v44 and fn62(v44) or v44
							if not (v44 and v45 and v46) then
								return
							end
							local cframe

							if (getgenv()._revenantTPMode or options.AnimeTPMode and options.AnimeTPMode.Value or "Teleport to Mouse") == "Silent Lock" then
								local huge = math.huge
								local v47 = nil

								for _, player in pairs(Players:GetPlayers()) do
									if player ~= localPlayer3 then
										local character = player.Character
										local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
										local humanoid = character and character:FindFirstChildOfClass("Humanoid")

										if character and humanoidRootPart2 and humanoid and humanoid.Health > 0 then
											local v48, v49 = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart2.Position)

											if v49 then
												local mouseLocation = UserInputService:GetMouseLocation()
												local magnitude = (Vector2.new(v48.X, v48.Y) - mouseLocation).Magnitude

												if magnitude < huge then
													huge = magnitude
													v47 = humanoidRootPart2
												end
											end
										end
									end
								end

								cframe = nil

								if v47 then
									cframe = CFrame.new(v47.CFrame.Position - v47.CFrame.LookVector * 5, v47.CFrame.Position)
								end
							else
								cframe = nil

								if mouse.Target then
									local cFrame2 = v45.CFrame
									cframe = CFrame.new(mouse.Hit.Position, Vector3.new(cFrame2.Position.X, mouse.Hit.Position.Y, cFrame2.Position.Z)) * CFrame.Angles(0, 3.1415926535897931, 0)
								end
							end

							if not cframe then
								return
							end
							fn72(v46, { "15957361339" })

							if toggles.AnimeTPAnimation.Value then
								local v47 = fn71(v46, "15957361339")
								v47.Priority = Enum.AnimationPriority.Action2
								v47:Play()
								v47:AdjustSpeed(options.AnimeTPSpeed.Value)
							end

							fn70(cframe)
							local value = options.AnimeTPSound.Value

							if value == "Goku" then
								local v47 = createSound(v45, "4861638982")
								v47.Volume = options.AnimeTPVolume.Value / 10
								v47:Play()
							elseif value == "Goku Black" then
								local v47 = createSound(v45, "9010221848")
								v47.Volume = options.AnimeTPVolume.Value / 10
								v47:Play()
								v47.TimePosition = 0.4
							end

							pcall(function()
								local clone2 = ReplicatedStorage.Resources.KJEffects.tpthing:Clone()
								clone2.Parent = v45
								clone2:Emit(15)
								Debris:AddItem(clone2, 1)
							end)

							for _, descendant in pairs(v44:GetDescendants()) do
								if descendant:IsA("BasePart") and descendant ~= v45 and descendant.Transparency ~= 1 and not descendant.Name:lower():find("hitbox") then
									task.spawn(function()
										descendant.Transparency = 1

										task.delay(0.1, function()
											if getgenv().desync and not _revDesyncBlocked(v44) then
												descendant.Transparency = 0.5
											else
												descendant.Transparency = 0
											end
										end)

										local decal = descendant:FindFirstChildWhichIsA("Decal")

										if decal and decal.Transparency ~= 1 then
											local transparency = decal.Transparency
											decal.Transparency = 1
											task.wait(0.1)
											decal.Transparency = transparency
										end
									end)
								end
							end
						end,
					})

					Keybinds:AddToggle("AnimeTPAnimation", { Text = "Teleport Animation", Default = false })

					table.insert(tbl24, function()
						pcall(function()
							toggles.AnimeTeleportation:SetValue(false)
						end)

						pcall(function()
							toggles.AnimeTPAnimation:SetValue(false)
						end)

						pcall(function()
							toggles.TP1:SetValue(false)
						end)

						pcall(function()
							toggles.TP2:SetValue(false)
						end)
					end)

					Keybinds:AddDropdown("AnimeTPSound", { Values = { "None", "Goku", "Goku Black" }, Default = 1, Multi = false, Text = "Teleport Sound" })
					Keybinds:AddSlider("AnimeTPVolume", { Text = "Sound Volume", Default = 10, Min = 1, Max = 10, Rounding = 1 })
					Keybinds:AddSlider("AnimeTPSpeed", { Text = "Animation Speed", Default = 1, Min = 0.5, Max = 5, Rounding = 1 })

					if not (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled) then
						Keybinds:AddDropdown("AnimeTPMode", {
							Text = "TP Mode",
							Values = { "Teleport to Mouse", "Silent Lock" },
							Default = 1,
							Multi = false,
							Callback = function(revenantTPMode)
								getgenv()._revenantTPMode = revenantTPMode
							end,
						})

						Keybinds:AddLabel("Press F3 to quickly switch between teleport modes.", true)

						tbl28[#tbl28 + 1] = UserInputService.InputBegan:Connect(function(input, gameProcessed)
							if gameProcessed then
								return
							end

							if input.KeyCode == Enum.KeyCode.F3 then
								if (options.AnimeTPMode and options.AnimeTPMode.Value) == "Teleport to Mouse" then
									getgenv()._revenantTPMode = "Silent Lock"

									pcall(function()
										options.AnimeTPMode:SetValue("Silent Lock")
									end)

									v24:Notify({ Title = "Anime TP", Content = "Mode: Silent Lock", Time = 2 })
								else
									getgenv()._revenantTPMode = "Teleport to Mouse"

									pcall(function()
										options.AnimeTPMode:SetValue("Teleport to Mouse")
									end)

									v24:Notify({ Title = "Anime TP", Content = "Mode: Teleport to Mouse", Time = 2 })
								end
							end
						end)
					end

					if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
						Keybinds:AddButton({
							Text = "Anime Teleportation",
							Func = function()
								local character = localPlayer3.Character
								local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
								local humanoid = character and character:FindFirstChildOfClass("Humanoid")
								if not (character and humanoidRootPart2 and humanoid) then
									return
								end
								local vector2 = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
								local huge = math.huge
								local v44 = nil

								for _, player in pairs(Players:GetPlayers()) do
									if player ~= localPlayer3 then
										local character2 = player.Character
										local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
										local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")

										if character2 and humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 then
											local v45, v46 = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart3.Position)

											if v46 then
												local magnitude = (Vector2.new(v45.X, v45.Y) - vector2).Magnitude

												if magnitude < huge then
													huge = magnitude
													v44 = humanoidRootPart3
												end
											end
										end
									end
								end

								if v44 then
									fn72(humanoid, { "15957361339" })

									if toggles.AnimeTPAnimation.Value then
										local v45 = fn71(humanoid, "15957361339")
										v45.Priority = Enum.AnimationPriority.Action2
										v45:Play()
										v45:AdjustSpeed(options.AnimeTPSpeed.Value)
									end

									local cframe = CFrame.new(v44.CFrame.Position - v44.CFrame.LookVector * 5, v44.CFrame.Position)
									fn70(cframe)
								end
							end,
						})
					end

					local billboardGui = nil
					local textLabel2 = nil

					local function fn78(arg)
						return arg and "<font color=\"rgb(85,255,127)\">✅</font>" or "<font color=\"rgb(255,73,73)\">❌</font>"
					end

					local function fn79(arg)
						local n15 = math.clamp(arg, 0, 100)
						local color, color2, n16

						if n15 < 50 then
							color = Color3.fromRGB(255, 73, 73)
							color2 = Color3.fromRGB(255, 170, 0)
							n16 = n15 / 50
						else
							color = Color3.fromRGB(255, 170, 0)
							color2 = Color3.fromRGB(85, 255, 127)
							n16 = (n15 - 50) / 50
						end

						local v44 = color:Lerp(color2, n16)
						return string.format("rgb(%d,%d,%d)", v44.R * 255 + 0.5, v44.G * 255 + 0.5, v44.B * 255 + 0.5)
					end

					local function fn80(arg, arg2)
						return fn79(100 - math.clamp((arg or 0) / arg2, 0, 1) * 100)
					end

					local function fn81()
						if not (billboardGui and billboardGui.Parent) then
							local CoreGui2 = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")

							pcall(function()
								CoreGui2 = (gethui or get_hidden_gui or function()
								end)() or CoreGui2
							end)

							local revenantLockInfo = CoreGui2:FindFirstChild("RevenantLockInfo")

							if revenantLockInfo then
								pcall(function()
									revenantLockInfo:Destroy()
								end)
							end

							billboardGui = Instance.new("BillboardGui")
							billboardGui.Name = "RevenantLockInfo"
							billboardGui.AlwaysOnTop = true
							billboardGui.Size = UDim2.new(0, 520, 0, 54)
							billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 10, 0)

							pcall(function()
								(protectgui or syn and syn.protect_gui or function()
								end)(billboardGui)
							end)

							billboardGui.Parent = CoreGui2
							textLabel2 = Instance.new("TextLabel")
							textLabel2.BackgroundTransparency = 1
							textLabel2.Font = Enum.Font.GothamBold
							textLabel2.TextSize = 14
							textLabel2.RichText = true
							textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
							textLabel2.TextStrokeTransparency = 0
							textLabel2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
							textLabel2.Size = UDim2.new(1, 0, 1, 0)
							textLabel2.ZIndex = math.huge
							textLabel2.Text = ""
							textLabel2.Parent = billboardGui
						end

						billboardGui.Enabled = true
					end

					getgenv()._RevRankTiers = getgenv()._RevRankTiers or {
						["1v1s"] = {
							{ "God", 3700 },
							{ "Calamity", 3200 },
							{ "Cosmic Threat", 2600 },
							{ "Dragon", 1900 },
							{ "Demon", 1200 },
							{ "Tiger", 600 },
							{ "Wolf", 100 },
							{ "Unranked", 0 },
						},
						["2v2s"] = {
							{ "God", 3200 },
							{ "Calamity", 2700 },
							{ "Cosmic Threat", 2200 },
							{ "Dragon", 1600 },
							{ "Demon", 1000 },
							{ "Tiger", 500 },
							{ "Wolf", 100 },
							{ "Unranked", 0 },
						},
						["3v3s"] = {
							{ "God", 3000 },
							{ "Calamity", 2500 },
							{ "Cosmic Threat", 2000 },
							{ "Dragon", 1400 },
							{ "Demon", 800 },
							{ "Tiger", 400 },
							{ "Wolf", 100 },
							{ "Unranked", 0 },
						},
					}

					local function fn82(arg, arg2, arg3)
						if not (billboardGui and billboardGui.Enabled and textLabel2) then
							return
						end
						billboardGui.Adornee = arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("Head")
						local str9 = (arg3 and arg3.DisplayName or arg.Name):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
						local n15 = arg2 and arg2.MaxHealth > 0 and arg2.Health / arg2.MaxHealth * 100 or 0
						local text = string.format("%s | Health: <font color=\"%s\">%.1f%%</font>", str9, fn79(n15), n15)
						if not arg3 then
							textLabel2.Text = text
							return
						end
						local num = tonumber(arg:GetAttribute("JustEvasived"))
						num = num and math.max(0, 30.05 - workspace:GetServerTimeNow() - num) or 0
						local str10

						if num > 0 then
							str10 = fn78(false) .. string.format(" <font color=\"rgb(255,170,0)\">(%.0fs)</font>", num)
						else
							str10 = fn78(true)
						end

						local n16 = tonumber(arg:GetAttribute("CurrentStreak")) or 0
						local flag17 = arg:GetAttribute("Ulted") and true or false
						local n17

						if flag17 then
							local attribute = arg.PrimaryPart and arg.PrimaryPart:GetAttribute("fill")
							n17 = typeof(attribute) == "number" and math.clamp(attribute * 100, 0, 100) or 100
						else
							n17 = tonumber(arg3:GetAttribute("Ultimate")) or 0
						end

						local num2 = tonumber(arg3:GetAttribute("TotalKillsFrb")) or tonumber(arg3:GetAttribute("Kills"))
						local n18 = 0
						local str11 = "1v1s"

						pcall(function()
							local attribute = arg3:GetAttribute("RankDatas")
							if type(attribute) ~= "string" then
								return
							end
							local data = game:GetService("HttpService"):JSONDecode(attribute)
							if type(data) ~= "table" then
								return
							end

							for k, v44 in pairs(data) do
								local num3 = tonumber(v44)

								if num3 and num3 > n18 then
									n18 = num3
									str11 = k
								end
							end
						end)

						local v44 = ipairs
						local n1v1s = getgenv()._RevRankTiers[str11] or getgenv()._RevRankTiers["1v1s"]
						local str12 = "Unranked"

						for _, n1v1 in v44(n1v1s) do
							if n1v1[2] <= n18 then
								str12 = n1v1[1]
								break
							end
						end

						local v45 = textLabel2
						local concat = table.concat
						local tbl31 = {}
						local str13 = string.format("%s | Counter: %s | Ragdoll Cancel: %s", text, fn78(arg:FindFirstChild("Counter") ~= nil), str10)
						local str14 = string.format("Streak: <font color=\"%s\">%d</font> | Ultimate: <font color=\"%s\">%.1f</font>", fn80(n16, 30), n16, fn79(n17), n17)
						local str15 = string.format("Power Level: <font color=\"%s\">%s</font> | Total Kills: <font color=\"%s\">%s</font> | Ulted: %s", fn80(num2, 7000), num2 and string.format("%.1f", num2 * 0.4) or "?", fn80(num2, 7000), num2 and tostring(num2) or "?", fn78(flag17))
						local format = string.format
						local v46 = fn80(n18, 3700)
						local str16 = n18 > 0 and " (" .. str11 .. ")" or ""
						local v47 = table.pack(format("Rank: <font color=\"%s\">%s</font> %d%s", v46, str12, n18, str16))
						tbl31[1] = str13
						tbl31[2] = str14
						tbl31[3] = str15

						do
							local values = table.pack(table.unpack(v47, 1, v47.n))
							table.move(values, 1, values.n, 4, tbl31)
						end

						v45.Text = concat(tbl31, "\n")
					end

					local function fn83()
						if billboardGui then
							pcall(function()
								billboardGui.Enabled = false
								billboardGui.Adornee = nil
							end)
						end
					end

					table.insert(tbl24, function()
						if billboardGui then
							pcall(function()
								billboardGui:Destroy()
							end)

							billboardGui = nil
						end

						pcall(function()
							RunService:UnbindFromRenderStep("RevenantLockOnCam")
						end)

						pcall(function()
							local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

							if humanoid then
								humanoid.CameraOffset = Vector3.zero
							end
						end)
					end)

					Keybinds:AddDivider({ Text = "Lock-on" })

					Keybinds:AddToggle("Lock-on", {
						Text = "Lock-on",
						Default = false,
						Callback = function(arg)
							if not arg then
								if options["L-OnKeybind"]:GetState() == true then
									options["L-OnKeybind"].Toggled = false
									options["L-OnKeybind"]:DoClick()
								else
									options["L-OnKeybind"].Toggled = false
								end
							end
						end,
					}):AddKeyPicker("L-OnKeybind", {
						SyncToggleState = false,
						Mode = "Toggle",
						Default = "V",
						Text = "Lock-on",
						Callback = function(arg)
							if tbl27["Lock-on"] then
								return
							end

							if arg and not toggles["Lock-on"].Value then
								RunService.RenderStepped:Wait()
								tbl27["Lock-on"] = true
								options["L-OnKeybind"].Toggled = false
								options["L-OnKeybind"]:DoClick()
								tbl27["Lock-on"] = false
								return
							end

							local v44 = fn77(true)

							if v44 and arg and toggles["Lock-on"].Value then
								fn81()
								local flag17 = nil

								pcall(function()
									RunService:UnbindFromRenderStep("RevenantLockOnCam")
								end)

								RunService:BindToRenderStep("RevenantLockOnCam", Enum.RenderPriority.Camera.Value + 1, function()
									local v45 = flag17
									if not v45 or not v45.Parent then
										return
									end
									local currentCamera = workspace.CurrentCamera
									if not currentCamera then
										return
									end
									currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, v45.Position)
								end)

								while true do
									local v45 = fn60(localPlayer3)
									local v46 = v45 and fn61(v45) or v45
									local v47 = v45 and fn62(v45) or v45
									local v48 = v44 and fn60(v44) or v44
									local v49 = v48 and fn61(v48) or v48
									local v50 = v48 and fn62(v48) or v48

									pcall(function()
										flag17 = nil

										if v45 and v46 and v47 and v44 and v44.Parent and v48 and v49 and v50 and v47.Health > 0 then
											local str9 = options["Lock-onMode"] and options["Lock-onMode"].Value or "Silent"
											local revenantLockOnHL = v48:FindFirstChild("RevenantLockOnHL")

											if not revenantLockOnHL then
												revenantLockOnHL = Instance.new("Highlight", v48)
												revenantLockOnHL.Name = "RevenantLockOnHL"
											end

											revenantLockOnHL.FillTransparency = 0.8
											revenantLockOnHL.OutlineTransparency = 0
											revenantLockOnHL.DepthMode = "AlwaysOnTop"
											local color = str9 == "Camera" and Color3.fromRGB(255, 40, 40) or Color3.fromRGB(0, 150, 255)
											revenantLockOnHL.FillColor = color
											revenantLockOnHL.OutlineColor = color
											fn82(v48, v50, typeof(v44) == "Instance" and v44:IsA("Player") and v44 or Players:GetPlayerFromCharacter(v48))

											if str9 == "Camera" then
												local torso = v49 or v48:FindFirstChild("Torso")
												local beingGrabbed = v48:FindFirstChild("BeingGrabbed") or v48:GetAttribute("BeingGrabbed") or v48:FindFirstChild("AbsoluteImmortal") or v48:FindFirstChildOfClass("ForceField") ~= nil

												pcall(function()
													v47.CameraOffset = Vector3.zero
												end)

												flag17 = not beingGrabbed and torso or nil
											else
												flag17 = nil

												pcall(function()
													v47.CameraOffset = Vector3.zero
												end)

												v47.AutoRotate = false
												local position = v46.Position
												local position2 = v49.Position
												local n15

												if toggles["Auto_Lock-on_Prediction"].Value then
													n15 = math.clamp(Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000, 0.1, 1)
												else
													n15 = options["Lock-on_Prediction"].Value
												end

												local n16 = Vector3.new(position2.X, tbl23.Flying and position2.Y or position.Y, position2.Z) + v50.MoveDirection * v49.Velocity.Magnitude * n15

												if toggles["Auto_Lock-on_Prediction"].Value then
													options["Lock-on_Prediction"]:SetValue(tonumber(string.format("%.1f", n15)))
												end

												if not v45:FindFirstChild("Ragdoll") then
													v46.CFrame = CFrame.new(position, n16)
												end
											end
										end
									end)

									RunService.RenderStepped:Wait()
									local flag18 = (options["Lock-onMode"] and options["Lock-onMode"].Value or "Silent") == "Camera"
									local flag19 = false

									if flag18 then
										local v51 = v44 and fn60(v44) or nil
										local v52 = v51 and fn62(v51) or nil

										if v51 and (not v52 or v52.Health <= 0) then
											flag19 = true
										end
									end

									if not (v24.Unloaded or options["L-OnKeybind"]:GetState() == false or v44 and not v44.Parent or not v44 or flag19) then
										continue
									end
									break
								end

								local v45 = fn60(localPlayer3)
								local v46 = v45 and fn61(v45) or v45
								local v47 = v45 and fn62(v45) or v45
								flag17 = nil

								pcall(function()
									RunService:UnbindFromRenderStep("RevenantLockOnCam")
								end)

								if v45 and v46 and v47 then
									v47.AutoRotate = true

									pcall(function()
										v47.CameraOffset = Vector3.zero
									end)
								end

								local v48 = v44 and fn60(v44) or v44
								local revenantLockOnHL = v48 and v48:FindFirstChild("RevenantLockOnHL") or nil

								if revenantLockOnHL then
									pcall(function()
										revenantLockOnHL:Destroy()
									end)
								end

								fn83()

								pcall(function()
									options["L-OnKeybind"].Toggled = false
									options["L-OnKeybind"]:Update()
								end)

								return
							end

							pcall(function()
								options["L-OnKeybind"].Toggled = false
								options["L-OnKeybind"]:Update()
							end)
						end,
					})

					Keybinds:AddDropdown("Lock-onMode", { Values = { "Silent", "Camera" }, Default = "Silent", Text = "Lock-on Mode" })
					Keybinds:AddSlider("Lock-on_Prediction", { Text = "Prediction", Default = 0.1, Min = 0.1, Max = 1, Rounding = 1, Compact = true })
					Keybinds:AddToggle("Auto_Lock-on_Prediction", { Text = "Auto Prediction", Default = false })
					local tbl31 = {}
					local connection18 = nil

					local function fn84(arg)
						if not arg then
							return
						end

						for _, descendant in pairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.CanCollide then
								descendant.CanCollide = false
							end
						end

						local playerFromCharacter = Players:GetPlayerFromCharacter(arg)
						if not playerFromCharacter then
							return
						end
						local str9 = "desc_" .. playerFromCharacter.UserId
						local v44 = tbl31[str9]

						if v44 then
							v44:Disconnect()
						end

						tbl31[str9] = arg.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("BasePart") and descendant.CanCollide then
								descendant.CanCollide = false
							end
						end)
					end

					fn43 = function()
						for _, player in pairs(Players:GetPlayers()) do
							if player ~= localPlayer3 then
								fn84(player.Character)

								tbl31[player] = player.CharacterAdded:Connect(function(character)
									task.wait(0.1)
									fn84(character)
								end)
							end
						end

						tbl31._added = Players.PlayerAdded:Connect(function(player)
							task.wait(0.1)

							tbl31[player] = player.CharacterAdded:Connect(function(character)
								task.wait(0.1)
								fn84(character)
							end)
						end)

						local n15 = 0

						connection18 = RunService.Heartbeat:Connect(function(deltaTime)
							n15 += deltaTime
							if n15 < 0.5 then
								return
							end
							n15 = 0

							for _, player in pairs(Players:GetPlayers()) do
								if player ~= localPlayer3 and player.Character then
									fn84(player.Character)
								end
							end
						end)
					end

					fn44 = function()
						if connection18 then
							connection18:Disconnect()
							connection18 = nil
						end

						for _, v44 in pairs(tbl31) do
							pcall(function()
								v44:Disconnect()
							end)
						end

						table.clear(tbl31)

						for _, player in pairs(Players:GetPlayers()) do
							if player ~= localPlayer3 and player.Character then
								for _, descendant in pairs(player.Character:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.CanCollide = true
									end
								end
							end
						end
					end

					local v44 = nil
					local connection19 = nil
					local fn85 = nil
					Keybinds:AddDivider({ Text = "Touch Fling" })

					Keybinds:AddToggle("TouchFlingEnabled", {
						Text = "Touch Fling",
						Tooltip = "Better with Anti-Fling",
						Default = false,
						Callback = function(raknetSavedTF)
							if getgenv()._revenantRaknetActive then
								getgenv()._raknetSavedTF = raknetSavedTF
								return
							end

							if not raknetSavedTF then
								tbl23["Touch Fling"] = false

								if v44 then
									pcall(v44)
								end

								if connection19 then
									pcall(function()
										connection19:Disconnect()
									end)

									connection19 = nil
								end

								if options.TouchFlingBind:GetState() == true then
									options.TouchFlingBind.Toggled = false
									options.TouchFlingBind:DoClick()
								end
							elseif fn85 and not connection19 then
								pcall(fn85)
							end
						end,
					}):AddKeyPicker("TouchFlingBind", {
						SyncToggleState = false,
						Mode = "Toggle",
						Default = "X",
						Text = "Touch Fling",
						Callback = function(raknetSavedTF)
							if tbl26.TF then
								return
							end

							if raknetSavedTF and not toggles.TouchFlingEnabled.Value then
								RunService.RenderStepped:Wait()
								tbl26.TF = true
								options.TouchFlingBind.Toggled = false
								options.TouchFlingBind:DoClick()
								tbl26.TF = false
								return
							end

							if getgenv()._revenantRaknetActive then
								getgenv()._raknetSavedTF = raknetSavedTF
								local v45 = v24
								local notify2 = v45.Notify
								local tbl32 = { Title = "Touch Fling" }
								raknetSavedTF = raknetSavedTF and "Toggled on ✅" or "Toggled off ❌"
								tbl32.Content = raknetSavedTF
								tbl32.Time = 2
								notify2(v45, tbl32)
								return
							end

							if toggles.TouchFlingEnabled.Value then
								tbl23["Touch Fling"] = raknetSavedTF

								if not raknetSavedTF and v44 then
									pcall(v44)
								end

								v24:Notify({ Title = "Touch Fling", Content = raknetSavedTF and "Toggled on ✅" or "Toggled off ❌", Time = 2 })
							end
						end,
					})

					local function fn86(arg)
						for _, v45 in ipairs({
							"TouchFlingX",
							"TouchFlingY",
							"TouchFlingZ",
							"TouchFlingXInput",
							"TouchFlingYInput",
							"TouchFlingZInput",
						}) do
							pcall(function()
								if options[v45] and options[v45].SetVisible then
									options[v45]:SetVisible(arg)
								end
							end)
						end
					end

					Keybinds:AddDropdown("TouchFlingMethod", {
						Text = "Method",
						Values = flag11 and { "Normal", "Better One" } or { "Normal" },
						Default = 1,
						Multi = false,
						Callback = function(arg)
							fn86(arg == "Normal" or arg == "Better One")
						end,
					})

					local flag17 = false
					local connection20 = nil

					local function fn87(arg)
						if flag17 then
							return
						end

						if connection20 then
							pcall(function()
								connection20:Disconnect()
							end)

							connection20 = nil
						end

						arg = arg and arg:FindFirstChildOfClass("Humanoid")
						if not arg then
							return
						end

						connection20 = arg.Died:Connect(function()
							pcall(function()
								connection20:Disconnect()
							end)

							connection20 = nil
							local touchFling = tbl23["Touch Fling"]
							tbl23["Touch Fling"] = true
							task.wait(0.5)
							tbl23["Touch Fling"] = touchFling
						end)
					end

					fn87(localPlayer3.Character)

					localPlayer3.CharacterAdded:Connect(function()
						flag17 = true
					end)

					local v45 = nil
					local v46 = nil
					local flag18 = false

					local function fn88()
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

						if character then
							character:FindFirstChildOfClass("Humanoid")
						end

						local v47 = v46
						flag18 = false
						v46 = nil

						if humanoidRootPart2 and not flag13 then
							pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)
						end

						if v45 then
							pcall(sethiddenproperty, v45, "PhysicsRepRootPart", nil)

							pcall(function()
								v45.Anchored = true
							end)

							pcall(function()
								v45.AssemblyLinearVelocity = Vector3.zero
							end)

							pcall(function()
								v45.AssemblyAngularVelocity = Vector3.zero
							end)

							pcall(function()
								v45.Velocity = Vector3.zero
							end)

							pcall(function()
								v45.RotVelocity = Vector3.zero
							end)

							pcall(function()
								v45.CFrame = CFrame.new(0, -10000, 0)
							end)

							pcall(function()
								v45:Destroy()
							end)

							v45 = nil
						end

						if v47 and v47.Parent then
							pcall(sethiddenproperty, v47, "PhysicsRepRootPart", nil)

							pcall(function()
								v47.AssemblyLinearVelocity = Vector3.zero
							end)

							pcall(function()
								v47.AssemblyAngularVelocity = Vector3.zero
							end)

							pcall(function()
								v47.Velocity = Vector3.zero
							end)

							pcall(function()
								v47.RotVelocity = Vector3.zero
							end)
						end

						task.spawn(function()
							RunService.Heartbeat:Wait()
							if flag13 then
								return
							end
							local character2 = localPlayer3.Character
							local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
							local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")

							if humanoidRootPart3 then
								pcall(sethiddenproperty, humanoidRootPart3, "PhysicsRepRootPart", nil)
							end

							if humanoid then
								pcall(function()
									humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
								end)
							end

							if v47 and v47.Parent then
								pcall(sethiddenproperty, v47, "PhysicsRepRootPart", nil)

								pcall(function()
									v47.AssemblyLinearVelocity = Vector3.zero
								end)

								pcall(function()
									v47.AssemblyAngularVelocity = Vector3.zero
								end)

								pcall(function()
									v47.Velocity = Vector3.zero
								end)

								pcall(function()
									v47.RotVelocity = Vector3.zero
								end)
							end
						end)
					end

					v44 = fn88

					local function fn89(arg)
						local live = workspace:FindFirstChild("Live") or workspace
						local n15 = 5
						local v47 = nil

						for _, child in ipairs(live:GetChildren()) do
							if child ~= localPlayer3.Character then
								local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
								local humanoid = child:FindFirstChildOfClass("Humanoid")

								if humanoidRootPart2 and humanoidRootPart2.Parent and humanoid and humanoid.Health > 0 then
									local magnitude = (humanoidRootPart2.Position - arg.Position).Magnitude

									if magnitude <= n15 then
										n15 = magnitude
										v47 = humanoidRootPart2
									end
								end
							end
						end

						return v47
					end

					local function createPart()
						local part3 = Instance.new("Part")
						part3.Size = Vector3.new(8, 0.2, 8)
						part3.Transparency = 1
						part3.CanCollide = false
						part3.Name = game:GetService("HttpService"):GenerateGUID()
						part3.Parent = workspace
						return part3
					end

					local function fn90()
						if v24.Unloaded then
							fn88()

							if connection19 then
								connection19:Disconnect()
								connection19 = nil
							end

							return
						end

						local str9 = options.TouchFlingMethod and options.TouchFlingMethod.Value or "Normal"

						if not (tbl23["Touch Fling"] and (str9 == "Death" or str9 == "Better One")) then
							if flag18 then
								fn88()
								flag18 = false
							end

							return
						end

						if flag14 then
							if flag18 then
								fn88()
								flag18 = false
							end

							return
						end

						flag18 = true
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")
						if not (character and humanoidRootPart2 and humanoid) or humanoid.Health <= 0 then
							fn88()
							return
						end

						if str9 == "Death" and not v45 then
							v45 = createPart()
						end

						if str9 == "Death" then
							if not flag17 then
								local v47 = fn89(humanoidRootPart2)

								if v47 ~= v46 then
									if v46 and v46.Parent then
										pcall(sethiddenproperty, v46, "PhysicsRepRootPart", nil)

										pcall(function()
											v46.AssemblyLinearVelocity = Vector3.zero
										end)

										pcall(function()
											v46.AssemblyAngularVelocity = Vector3.zero
										end)

										pcall(function()
											v46.Velocity = Vector3.zero
										end)

										pcall(function()
											v46.RotVelocity = Vector3.zero
										end)
									end

									if not flag13 then
										pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)
									end

									v46 = v47
								end

								if v47 and v47.Parent then
									if not flag13 then
										pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", v47)
									end

									sethiddenproperty(humanoid, "MoveDirectionInternal", Vector3.new((0/0), (0/0), (0/0)))
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.new((0/0), (0/0), (0/0))
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.new((0/0), (0/0), (0/0))
								elseif v45 then
									pcall(sethiddenproperty, v45, "PhysicsRepRootPart", nil)

									pcall(function()
										v45.AssemblyLinearVelocity = Vector3.zero
									end)

									pcall(function()
										v45.AssemblyAngularVelocity = Vector3.zero
									end)

									v45.Anchored = true
									v45.CFrame = CFrame.new(0, -1000, 0)
								end
							else
								local v47 = fn89(humanoidRootPart2)

								if v47 ~= v46 then
									if v46 and v46.Parent then
										pcall(sethiddenproperty, v46, "PhysicsRepRootPart", nil)

										pcall(function()
											v46.AssemblyLinearVelocity = Vector3.zero
										end)

										pcall(function()
											v46.AssemblyAngularVelocity = Vector3.zero
										end)

										pcall(function()
											v46.Velocity = Vector3.zero
										end)

										pcall(function()
											v46.RotVelocity = Vector3.zero
										end)
									end

									if not flag13 then
										pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)
									end

									v46 = v47
								end

								if v47 and v47.Parent then
									v45.Anchored = false
									v45.CFrame = v47.CFrame * CFrame.new(0, -3.2, 0)

									if not flag13 then
										pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", v47)
									end

									sethiddenproperty(humanoid, "MoveDirectionInternal", Vector3.new((0/0), (0/0), (0/0)))
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.new((0/0), (0/0), (0/0))
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.new((0/0), (0/0), (0/0))
									v45.AssemblyLinearVelocity = Vector3.new((0/0), (0/0), (0/0))
									v45.AssemblyAngularVelocity = Vector3.new((0/0), (0/0), (0/0))
								else
									v45.Anchored = false
									v45.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -3.2, 0)

									if not flag13 then
										pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", v45)
									end

									sethiddenproperty(humanoid, "MoveDirectionInternal", Vector3.new((0/0), (0/0), (0/0)))
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.new((0/0), (0/0), (0/0))
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.new((0/0), (0/0), (0/0))
									v45.AssemblyLinearVelocity = Vector3.new((0/0), (0/0), (0/0))
									v45.AssemblyAngularVelocity = Vector3.new((0/0), (0/0), (0/0))
								end
							end
						elseif str9 == "Better One" then
							local v47 = fn89(humanoidRootPart2)

							if v47 ~= v46 then
								if not flag13 then
									pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)
								end

								v46 = v47
							end

							if not flag13 then
								pcall(function()
									sethiddenproperty(humanoidRootPart2, "PhysicsRepRootPart", v47 and v47.Parent and v47 or nil)
								end)
							end
						end
					end

					fn85 = function()
						if not v45 then
							v45 = createPart()
						end

						if not connection19 then
							connection19 = RunService.RenderStepped:Connect(fn90)
						end
					end

					table.insert(tbl24, function()
						fn88()

						if connection19 then
							connection19:Disconnect()
							connection19 = nil
						end

						if connection20 then
							pcall(function()
								connection20:Disconnect()
							end)

							connection20 = nil
						end
					end)

					Keybinds:AddInput("TouchFlingXInput", {
						Text = "X Value",
						Default = "0",
						Numeric = true,
						Finished = false,
						Callback = function(arg)
							local num = tonumber(arg)

							if num then
								tbl23["Touch Fling Settings"] = Vector3.new(num, tbl23["Touch Fling Settings"].Y, tbl23["Touch Fling Settings"].Z)

								if options.TouchFlingX and options.TouchFlingX.SetValue then
									pcall(function()
										options.TouchFlingX:SetValue(math.clamp(num, 0, 1e38))
									end)
								end
							end
						end,
					})

					Keybinds:AddSlider("TouchFlingX", {
						Text = "X",
						Default = 0,
						Min = 0,
						Max = 1e38,
						Rounding = 1,
						Compact = true,
						Callback = function(arg)
							tbl23["Touch Fling Settings"] = Vector3.new(arg, tbl23["Touch Fling Settings"].Y, tbl23["Touch Fling Settings"].Z)
						end,
					})

					Keybinds:AddInput("TouchFlingYInput", {
						Text = "Y Value",
						Default = "0",
						Numeric = true,
						Finished = false,
						Callback = function(arg)
							local num = tonumber(arg)

							if num then
								tbl23["Touch Fling Settings"] = Vector3.new(tbl23["Touch Fling Settings"].X, num, tbl23["Touch Fling Settings"].Z)

								if options.TouchFlingY and options.TouchFlingY.SetValue then
									pcall(function()
										options.TouchFlingY:SetValue(math.clamp(num, 0, 1e38))
									end)
								end
							end
						end,
					})

					Keybinds:AddSlider("TouchFlingY", {
						Text = "Y",
						Default = 0,
						Min = 0,
						Max = 1e38,
						Rounding = 1,
						Compact = true,
						Callback = function(arg)
							tbl23["Touch Fling Settings"] = Vector3.new(tbl23["Touch Fling Settings"].X, arg, tbl23["Touch Fling Settings"].Z)
						end,
					})

					Keybinds:AddInput("TouchFlingZInput", {
						Text = "Z Value",
						Default = "0",
						Numeric = true,
						Finished = false,
						Callback = function(arg)
							local num = tonumber(arg)

							if num then
								tbl23["Touch Fling Settings"] = Vector3.new(tbl23["Touch Fling Settings"].X, tbl23["Touch Fling Settings"].Y, num)

								if options.TouchFlingZ and options.TouchFlingZ.SetValue then
									pcall(function()
										options.TouchFlingZ:SetValue(math.clamp(num, 0, 1e38))
									end)
								end
							end
						end,
					})

					Keybinds:AddSlider("TouchFlingZ", {
						Text = "Z",
						Default = 0,
						Min = 0,
						Max = 1e38,
						Rounding = 1,
						Compact = true,
						Callback = function(arg)
							tbl23["Touch Fling Settings"] = Vector3.new(tbl23["Touch Fling Settings"].X, tbl23["Touch Fling Settings"].Y, arg)
						end,
					})

					task.defer(function()
						fn86(true)
					end)

					Keybinds:AddDivider({ Text = "Attach" })

					Keybinds:AddToggle("TogWeld", {
						Text = flag11 and "Attach" or "Orbit",
						Default = false,
						Callback = function(arg)
							if tbl27.Weld then
								return
							end

							if not arg then
								if options.KPWeld then
									options.KPWeld.Toggled = false
								end

								if flag13 then
									fn53()
								end
							end
						end,
					}):AddKeyPicker("KPWeld", {
						Default = "H",
						Text = flag11 and "Attach" or "Orbit",
						SyncToggleState = false,
						Mode = "Toggle",
						NoUI = false,
						Callback = function(arg)
							if tbl27.Weld then
								return
							end

							if arg and not toggles.TogWeld.Value then
								RunService.RenderStepped:Wait()
								tbl27.Weld = true
								options.KPWeld.Toggled = false
								options.KPWeld:DoClick()
								tbl27.Weld = false
								return
							end

							if not toggles.TogWeld.Value then
								return
							end

							if fn45() then
								return
							end
							fn53()
						end,
					})

					if flag11 then
						Keybinds:AddDropdown("AttachMethod", {
							Text = "Method",
							Values = { "Strength", "Hitbox Accurate", "Orbit" },
							Default = "Strength",
							Callback = function(arg)
								local flag19 = arg == "Orbit"

								pcall(function()
									options.WeldOffsetX:SetVisible(not flag19)
								end)

								pcall(function()
									options.WeldOffsetY:SetVisible(not flag19)
								end)

								pcall(function()
									options.WeldOffsetZ:SetVisible(not flag19)
								end)

								pcall(function()
									options.AttachOrbitSpeed:SetVisible(flag19)
								end)

								pcall(function()
									options.AttachOrbitDistance:SetVisible(flag19)
								end)
							end,
						})

						Keybinds:AddSlider("WeldOffsetX", { Text = "Attach X", Default = 0, Min = -25, Max = 25, Rounding = 0 })
						Keybinds:AddSlider("WeldOffsetY", { Text = "Attach Y", Default = 0, Min = -25, Max = 25, Rounding = 0 })
						Keybinds:AddSlider("WeldOffsetZ", { Text = "Attach Z", Default = 0, Min = -25, Max = 25, Rounding = 0 })
						Keybinds:AddSlider("AttachOrbitSpeed", { Text = "Orbit Speed", Default = 10, Min = 1, Max = 100, Rounding = 1 })
						Keybinds:AddSlider("AttachOrbitDistance", { Text = "Orbit Distance", Default = 3, Min = 1, Max = 100, Rounding = 1 })

						task.defer(function()
							pcall(function()
								options.AttachOrbitSpeed:SetVisible(false)
							end)

							pcall(function()
								options.AttachOrbitDistance:SetVisible(false)
							end)
						end)
					else
						Keybinds:AddSlider("OrbitSpeed", { Text = "Orbit Speed", Default = 10, Min = 1, Max = 100, Rounding = 1 })
						Keybinds:AddSlider("OrbitDistance", { Text = "Orbit Distance", Default = 3, Min = 1, Max = 100, Rounding = 1 })
					end

					Keybinds:AddDivider({ Text = "Teleport 1" })

					Keybinds:AddToggle("TP1", {
						Text = "Teleport 1",
						Default = false,
						Callback = function(arg)
							if not arg and options.TP1Bind:GetState() == true then
								options.TP1Bind.Toggled = false
								options.TP1Bind:DoClick()
							end

							pcall(function()
								options.TP1Bind.KeybindsToggle:SetVisibility(arg)
							end)
						end,
					}):AddKeyPicker("TP1Bind", {
						SyncToggleState = false,
						Mode = "Toggle",
						Default = "E",
						Text = "Teleport 1",
						Callback = function()
							options.TP1Bind.Toggled = false
							if not toggles.TP1 or not toggles.TP1.Value then
								return
							end
							local v47 = fn60(localPlayer3)
							local v48 = v47 and fn61(v47)
							local v49 = v47 and fn62(v47)

							if v47 and v48 and v49 and v49.Health > 0 then
								fn70(fn69(v48) * CFrame.new(options.TP1X.Value, options.TP1Y.Value, options.TP1Z.Value))
							end
						end,
					})

					Keybinds:AddSlider("TP1X", { Text = "X", Default = 0, Min = -25, Max = 25, Rounding = 1, Compact = true })
					Keybinds:AddSlider("TP1Y", { Text = "Y", Default = 0, Min = -25, Max = 25, Rounding = 1, Compact = true })
					Keybinds:AddSlider("TP1Z", { Text = "Z", Default = 20, Min = -25, Max = 25, Rounding = 1, Compact = true })
					Keybinds:AddDivider({ Text = "Teleport 2" })

					Keybinds:AddToggle("TP2", {
						Text = "Teleport 2",
						Default = false,
						Callback = function(arg)
							if not arg and options.TP2Bind:GetState() == true then
								options.TP2Bind.Toggled = false
								options.TP2Bind:DoClick()
							end

							pcall(function()
								options.TP2Bind.KeybindsToggle:SetVisibility(arg)
							end)
						end,
					}):AddKeyPicker("TP2Bind", {
						SyncToggleState = false,
						Mode = "Toggle",
						Default = "R",
						Text = "Teleport 2",
						Callback = function()
							options.TP2Bind.Toggled = false
							if not toggles.TP2 or not toggles.TP2.Value then
								return
							end

							if (tonumber(localPlayer3:GetAttribute("Burst")) or 0) >= 100 then
								return
							end
							local v47 = fn60(localPlayer3)
							local v48 = v47 and fn61(v47)
							local v49 = v47 and fn62(v47)

							if v47 and v48 and v49 and v49.Health > 0 then
								fn70(fn69(v48) * CFrame.new(options.TP2X.Value, options.TP2Y.Value, options.TP2Z.Value))
							end
						end,
					})

					Keybinds:AddSlider("TP2X", { Text = "X", Default = 0, Min = -25, Max = 25, Rounding = 1, Compact = true })
					Keybinds:AddSlider("TP2Y", { Text = "Y", Default = 0, Min = -25, Max = 25, Rounding = 1, Compact = true })
					Keybinds:AddSlider("TP2Z", { Text = "Z", Default = -20, Min = -25, Max = 25, Rounding = 1, Compact = true })

					task.defer(function()
						pcall(function()
							options.TP1Bind.KeybindsToggle:SetVisibility(false)
						end)

						pcall(function()
							options.TP2Bind.KeybindsToggle:SetVisibility(false)
						end)
					end)

					if flag10 then
						Dashes:AddToggle("CustomFrontDash", { Text = "Custom Front Dash", Default = false })
						Dashes:AddToggle("CustomSideDash", { Text = "Custom Side Dash", Default = false })
						Dashes:AddToggle("CustomBackDash", { Text = "Custom Back Dash", Default = false })
						local flag19 = type(getrawmetatable) == "function" and type(setreadonly) == "function" and type(newcclosure) == "function" and type(getnamecallmethod) == "function"
						local v47 = Dashes
						local addToggle = v47.AddToggle
						local flag20 = not flag19

						addToggle(v47, "ExtendedDashTime", {
							Text = "Extended Dash Time",
							Default = false,
							Disabled = flag20,
							Tooltip = flag20 and "your executor doesn't support this (needs metatable hooks)" or nil,
							Callback = function(dashRunOn)
								if not flag19 then
									getgenv()._dashRunOn = false

									pcall(function()
										toggles.ExtendedDashTime:SetValue(false)
									end)

									return
								end

								getgenv()._dashRunOn = dashRunOn
							end,
						})

						if flag19 and not getgenv()._edtNcHooked then
							pcall(function()
								local v48 = getrawmetatable(game)
								setreadonly(v48, false)
								local namecall = v48.__namecall

								v48.__namecall = newcclosure(function(arg, ...)
									local v49 = table.pack(...)

									if getgenv()._dashRunOn then
										local ok, result = pcall(getnamecallmethod)

										if ok and result == "FireServer" then
											local v50 = ...

											if type(v50) == "table" then
												if v50.Dash ~= nil then
													getgenv()._edtDashUntil = tick() + 1.5
												else
													local flag21 = v50.Goal == "delete bv"

													if flag21 then
														flag21 = tick() < (getgenv()._edtDashUntil or 0)
													end

													if flag21 then
														return
													end
												end
											end

											return namecall(arg, table.unpack(v49, 1, v49.n))
										end
									end

									return namecall(arg, ...)
								end)

								setreadonly(v48, true)
								getgenv()._edtNcHooked = true
							end)
						end

						local edtDashUntil = getgenv()._edtDashUntil or 0

						local connection21 = RunService.Heartbeat:Connect(function()
							local edtDashUntil2 = getgenv()._edtDashUntil or 0
							if edtDashUntil2 == edtDashUntil then
								return
							end
							edtDashUntil = edtDashUntil2
							local character = localPlayer3.Character
							if not character then
								return
							end

							for _, descendant in ipairs(character:GetDescendants()) do
								if descendant:IsA("BodyVelocity") and descendant.Name == "moveme" then
									pcall(function()
										descendant:Destroy()
									end)
								end
							end
						end)

						table.insert(tbl24, function()
							getgenv()._dashRunOn = false

							if connection21 then
								connection21:Disconnect()
								connection21 = nil
							end
						end)

						Dashes:AddDivider({ Text = "Config" })
						Dashes:AddSlider("FDDistance", { Text = "Front Dash Distance", Default = 165, Min = 0, Max = 500, Rounding = 1 })
						Dashes:AddSlider("SDDistance", { Text = "Side Dash Distance (Multiplier)", Default = 1, Min = 0.1, Max = 2, Rounding = 1 })
						Dashes:AddSlider("SDSpeed", { Text = "Side Dash Speed", Default = 1, Min = 0.1, Max = 2, Rounding = 1 })
						Dashes:AddSlider("BDDistance", { Text = "Back Dash Distance (Multiplier)", Default = 1, Min = 0.1, Max = 2, Rounding = 1 })

						Dashes:AddButton({
							Text = "Reset to Defaults",
							Func = function()
								options.FDDistance:SetValue(165)
								options.SDDistance:SetValue(1)
								options.SDSpeed:SetValue(1)
								options.BDDistance:SetValue(1)
							end,
						})

						local function fn91()
							for _, v48 in pairs(tbl29) do
								v48:Disconnect()
							end

							table.clear(tbl29)

							if v43 then
								v43:Destroy()
								v43 = nil
							end

							while true do
								task.wait()
								if not (fn60(localPlayer3) and fn61(fn60(localPlayer3)) and fn62(fn60(localPlayer3))) then
									continue
								end
								break
							end

							local v48 = fn60(localPlayer3)
							local v49 = v48 and fn61(v48) or v48
							local v50 = v48 and fn62(v48) or v48

							if v48 and v49 and v50 then
								tbl29[#tbl29 + 1] = v48.DescendantAdded:Connect(function(descendant)
									if descendant:IsA("Sound") and descendant.SoundId:match("16139753098") and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Crushing Pull") then
										local now2 = tick()

										repeat
											fn74({ Goal = "KeyPress", Key = Enum.KeyCode.F })
											RunService.RenderStepped:Wait()
										until now2 + 0.5 <= tick()

										fn74({ Goal = "KeyRelease", Key = Enum.KeyCode.F })
									elseif not (tbl23["Upside Down"] and v50 and v50.Health > 0) then
										if descendant:IsA("Accessory") then
											if table.find({ "Slowed", "StopRunning", "ComboStun" }, descendant.Name) and _rawget(options.CharacterExploits.Value, "No Slow") then
												if descendant.Name ~= "Slowed" then
													if descendant.Name == "StopRunning" or descendant.Name == "ComboStun" then
														fn75(descendant, false)
													end
												else
													local connection22 = v50:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
														local v51 = v50
														local attribute = v48:GetAttribute("Ulted")

														if attribute then
															attribute = v48:GetAttribute("Running") and 32 or 16
														end

														if not attribute then
															attribute = v48:GetAttribute("Running") and 25 or 16
														end

														v51.WalkSpeed = attribute
													end)

													v50.WalkSpeed = v48:GetAttribute("Ulted") and (v48:GetAttribute("Running") and 32 or 16) or v48:GetAttribute("Running") and 25 or 16

													repeat
														RunService.RenderStepped:Wait()
													until descendant.Parent ~= v48

													connection22:Disconnect()
												end
											elseif (descendant.Name == "Freeze" or descendant.Name == "AntiMove") and _rawget(options.CharacterExploits.Value, "No Stun") then
												local connection22 = v50:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
													local v51 = v50
													local n15 = v48:GetAttribute("Ulted") and (v48:GetAttribute("Running") and 32 or 16)
													local walkSpeed

													if n15 then
														walkSpeed = n15
													else
														walkSpeed = v48:GetAttribute("Running") and 25 or 16
													end

													v51.WalkSpeed = walkSpeed
												end)

												v50.WalkSpeed = v48:GetAttribute("Ulted") and (v48:GetAttribute("Running") and 32 or 16) or v48:GetAttribute("Running") and 25 or 16

												repeat
													RunService.RenderStepped:Wait()
												until descendant.Parent ~= v48

												connection22:Disconnect()
											elseif descendant.Name ~= "NoJump" or not _rawget(options.CharacterExploits.Value, "No Jump Bypass") then
												if (descendant.Name == "NoRotate" or desceame == "NoRotate" or descendant.Name == "NoRotateUltimate") and _rawget(options.CharacterExploits.Value, "No Rotations Bypass") then
													task.spawn(pcall, fn75, descendant, false)
												elseif descendant.Name ~= "Ragdoll" then
													if descendant.Name ~= "RagdollSim" then
														if descendant.Name ~= "BeingLaunched" then
															if descendant.Name == "ThrowTrashcan" then
																tbl23["Trashcan Launch"] = true
																task.wait(0.25)
																tbl23["Trashcan Launch"] = false
															end
														elseif toggles.LaunchHide.Value and v50.Health > 0 and not v48:FindFirstChild("ExtraHitbox") then
															local now2 = tick()

															while true do
																getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
																task.wait()
																if not (tick() >= now2 + 3 or v48:FindFirstChild("LaunchEnded") or v50.Health <= 0) then
																	continue
																end
																break
															end

															getgenv().desync = nil
														end
													elseif _rawget(options.CharacterExploits.Value, "Anti Ragdoll") then
														task.spawn(pcall, fn75, descendant, false)
													end
												else
													if _rawget(options.CharacterExploits.Value, "Anti Ragdoll") then
														descendant:Remove()
													end

													if toggles.RagdollHide.Value and v50.Health > 0 and not v48:FindFirstChild("ExtraHitbox") then
														task.spawn(function()
															while true do
																getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
																task.wait()
																if not (not toggles.RagdollHide.Value or descendant.Parent ~= v48 or v50.Health <= 0) then
																	continue
																end
																break
															end

															getgenv().desync = nil
														end)
													end

													if toggles.AutoRagdollCancel.Value then
														fn74({ Dash = Enum.KeyCode.S, Key = Enum.KeyCode.Q, Goal = "KeyPress" })
													end
												end
											else
												task.spawn(pcall, fn75, descendant, false)
											end
										end
									end

									if descendant:IsA("BodyVelocity") then
										local flag21 = descendant.Name ~= "moveme"

										if not flag21 then
											flag21 = (descendant:GetAttribute("Speed") or 0) ~= 165
										end

										if flag21 then
											if descendant.Name == "dodgevelocity" and not descendant:GetAttribute("Clone") then
												RunService.Stepped:Wait()

												for _, v51 in pairs(v50:GetPlayingAnimationTracks()) do
													if v51.Animation.AnimationId:match("10491993682") and v51.TimePosition <= 0.1 then
														if toggles.CustomBackDash.Value then
															local clone2 = descendant:Clone()
															clone2:SetAttribute("Clone", true)
															table.insert(tbl30, clone2)
															descendant.Parent = workspace

															while descendant and descendant.Parent do
																clone2.Parent = v49
																clone2.Velocity = descendant.Velocity * options.BDDistance.Value
																RunService.RenderStepped:Wait()
															end

															if clone2 and clone2.Parent then
																clone2:Destroy()
																local v52 = table.find(tbl30, clone2)

																if v52 then
																	table.remove(tbl30, v52)
																end
															end
														end

														return
													end
												end

												if toggles.CustomSideDash.Value then
													local clone2 = descendant:Clone()
													clone2:SetAttribute("Clone", true)
													table.insert(tbl30, clone2)
													descendant.Parent = workspace

													while descendant and descendant.Parent do
														clone2.Parent = v49
														clone2.Velocity = descendant.Velocity * options.SDDistance.Value
														RunService.RenderStepped:Wait()
													end

													if clone2 and clone2.Parent then
														clone2:Destroy()
														local v51 = table.find(tbl30, clone2)

														if v51 then
															table.remove(tbl30, v51)
														end
													end
												end
											end
										else
											if toggles.CustomFrontDash.Value then
												descendant:SetAttribute("Speed", options.FDDistance.Value)
											end

											for _, v51 in pairs(tbl30) do
												v51:Destroy()
											end

											table.clear(tbl30)
										end
									end

									if descendant:IsA("BodyPosition") then
										if descendant.Name ~= "AIRBP" or descendant.D ~= 800 or descendant.P ~= 10000 or descendant.MaxForce ~= Vector3.one * 40000 or not toggles.NoBP_WindstormFury.Value then
											if descendant.Name ~= "AIRBP" or descendant.D ~= 800 or descendant.P ~= 10000 or descendant.MaxForce ~= Vector3.one * 40000 or descendant:GetAttribute("SpinCenter") == nil or not toggles.NoBP_TatsumakiUlt.Value then
												if descendant.Name == "AIRBP" and descendant.D == 850 and descendant.P == 10000 and descendant.MaxForce == Vector3.one * 40000 and toggles.NoBP_PreysPeril.Value then
													task.spawn(pcall, fn75, descendant, false)
												end
											else
												task.spawn(pcall, fn75, descendant, false)
											end
										else
											task.spawn(pcall, fn75, descendant, false)
										end
									end

									if descendant.Name == "ThrowTrashcan" then
										tbl23["Trashcan Launch"] = true

										task.delay(0.25, function()
											tbl23["Trashcan Launch"] = false
										end)
									end

									if descendant:IsA("Accessory") then
										if descendant.Name == "Ragdoll" then
											if toggles.AutoRagdollCancel.Value then
												fn74({ Dash = Enum.KeyCode.S, Key = Enum.KeyCode.Q, Goal = "KeyPress" })
											end
										end
									end
								end)

								tbl29[#tbl29 + 1] = v50.AnimationPlayed:Connect(function(arg)
									local animationId = arg.Animation.AnimationId

									if animationId:match("10480796021") or animationId:match("10480793962") then
										if toggles.CustomSideDash.Value then
											arg:AdjustSpeed(options.SDSpeed.Value)
										end
									end
								end)

								tbl29[#tbl29 + 1] = v50.AnimationPlayed:Connect(function(arg)
									local animationId = arg.Animation.AnimationId
									if not toggles.AttackAll.Value then
										return
									end

									local function fn92(arg2)
										if not arg2 or not arg2:IsA("Player") then
											return false
										end
										local attribute = fn60(arg2)
										attribute = attribute and attribute:GetAttribute("Character")
										if type(attribute) ~= "string" then
											return false
										end
										local str9 = attribute:lower()
										return str9 == "hunter" or str9 == "blade" or str9:find("zombie", 1, true) ~= nil
									end

									local function fn93(arg2)
										local v51 = nil

										return (RunService.Heartbeat:Connect(function()
											if not arg2() then
												v51:Disconnect()
												return
											end
											local v52 = fn61(fn60(localPlayer3))

											if v52 then
												v52.AssemblyLinearVelocity = Vector3.new()
												v52.AssemblyAngularVelocity = Vector3.new()
											end
										end))
									end

									local connection22 = nil
									local connection23 = nil
									local v51 = nil
									local v52 = nil

									local function fn94()
										getgenv()._repDual.release()

										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end

										if connection23 then
											connection23:Disconnect()
											connection23 = nil
										end

										if sethiddenproperty then
											if v51 and v51.Parent then
												pcall(sethiddenproperty, v51, "PhysicsRepRootPart", nil)
											end

											if v52 and v52.Parent then
												pcall(sethiddenproperty, v52, "PhysicsRepRootPart", nil)
											end
										end

										if v51 and v51.Parent then
											v51.CFrame = CFrame.new(v51.Position)
											v51.AssemblyLinearVelocity = Vector3.zero
											v51.AssemblyAngularVelocity = Vector3.zero
											v51.Velocity = Vector3.zero
											v51.RotVelocity = Vector3.zero
											local humanoid = v51.Parent:FindFirstChildOfClass("Humanoid")

											if humanoid then
												pcall(function()
													humanoid.AutoRotate = true
												end)
											end
										end

										v51 = nil
										v52 = nil
									end

									local function fn95()
										fn94()
									end

									local function fn96(arg2, arg3, arg4)
										local function fn97(arg5)
											if arg4 then
												return arg4(arg5)
											end
											return arg5.CFrame * CFrame.new(0, 0, 5)
										end

										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end

										if v51 and v51.Parent then
											v51.AssemblyLinearVelocity = Vector3.zero
											v51.AssemblyAngularVelocity = Vector3.zero
											v51.Velocity = Vector3.zero
											v51.RotVelocity = Vector3.zero
										end

										if not arg2 or not arg3 then
											return
										end
										v51 = arg2
										v52 = arg3

										if connection23 then
											connection23:Disconnect()
											connection23 = nil
										end

										local humanoid = arg2.Parent and arg2.Parent:FindFirstChildOfClass("Humanoid")

										if humanoid then
											connection23 = RunService.RenderStepped:Connect(function()
												if humanoid and humanoid.Parent then
													pcall(function()
														humanoid.AutoRotate = false
													end)
												end
											end)
										end

										arg2.CFrame = fn97(arg3)
										arg2.AssemblyLinearVelocity = arg3.AssemblyLinearVelocity
										arg2.AssemblyAngularVelocity = arg3.AssemblyAngularVelocity

										if sethiddenproperty then
											pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", arg2)
											pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", arg3)
											getgenv()._repDual.follow(arg2, arg3)
										end

										local v53 = nil

										connection22 = RunService.Heartbeat:Connect(function()
											if not arg2 or not arg2.Parent or not arg3 or not arg3.Parent then
												v53:Disconnect()
												getgenv()._repDual.release()

												if connection22 == v53 then
													connection22 = nil
												end

												if sethiddenproperty then
													if arg2 and arg2.Parent then
														pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", nil)
													end

													if arg3 and arg3.Parent then
														pcall(sethiddenproperty, arg3, "PhysicsRepRootPart", nil)
													end
												end

												if arg2 and arg2.Parent then
													arg2.AssemblyLinearVelocity = Vector3.zero
													arg2.AssemblyAngularVelocity = Vector3.zero
													arg2.Velocity = Vector3.zero
													arg2.RotVelocity = Vector3.zero
												end

												return
											end

											arg2.CFrame = fn97(arg3)
											arg2.AssemblyLinearVelocity = arg3.AssemblyLinearVelocity
											arg2.AssemblyAngularVelocity = arg3.AssemblyAngularVelocity

											if sethiddenproperty then
												pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", arg3)
												getgenv()._repDual.follow(arg2, arg3)
											end
										end)
									end

									if animationId:match("14719290328") and _rawget(options.AttackAllMoves.Value, "Savage Tornado") then
										task.spawn(function()
											local v53 = fn60(localPlayer3)
											local v54 = v53 and fn61(v53)
											if not v54 then
												return
											end
											local cFrame2 = v54.CFrame

											RunService.Heartbeat:Once(function()
												v54.CFrame = CFrame.new(0, -10000, 0)
											end)

											task.wait(0.9)
											local now2 = tick()

											repeat
												fn68(true)
												task.wait(0.03)
											until now2 + 1.75 <= tick()

											fn70(CFrame.new(439, 440, -376))
											task.wait(1.5)

											RunService.Heartbeat:Once(function()
												v54.CFrame = cFrame2
											end)
										end)
									end

									if animationId:match("14701242661") and _rawget(options.AttackAllMoves.Value, "Brutal Beatdown") then
										task.spawn(function()
											local v53 = fn60(localPlayer3)
											local v54 = v53 and fn61(v53)
											if not v54 then
												return
											end

											task.spawn(function()
												task.wait(3.1)
												getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
												task.wait(0.9)
												getgenv().desync = nil
											end)

											RunService.Heartbeat:Once(function()
												v54.CFrame = CFrame.new(0, -10000, 0)
											end)

											task.wait(2)
											local now2 = tick()

											repeat
												fn68(true)
												task.wait(0.05)
											until now2 + 4.5 <= tick()

											local now3 = tick()

											repeat
												fn68(true)
												task.wait(0.05)
											until now3 + 1.3 <= tick()
										end)
									end

									if animationId:match("97401167464229") and _rawget(options.AttackAllMoves.Value, "Limit Breaker") then
										task.spawn(function()
											local v53 = fn60(localPlayer3)
											local v54 = v53 and fn61(v53)
											if not v54 then
												return
											end
											local cFrame2 = v54.CFrame
											task.wait(2.5)
											local now2 = tick()

											repeat
												fn68(true)
												task.wait(0.03)
											until tick() >= now2 + 5

											RunService.Heartbeat:Once(function()
												v54.CFrame = cFrame2
											end)
										end)
									end

									if (animationId:match("76676838298555") or animationId:match("81016048005396") or animationId:match("99798123383608") or animationId:match("127386796069137")) and _rawget(options.AttackAllMoves.Value, "Burst") then
										task.spawn(function()
											local v53 = fn60(localPlayer3)
											local v54 = v53 and fn61(v53)
											if not v54 then
												return
											end
											local cFrame2 = v54.CFrame

											local tbl32 = ({
												["76676838298555"] = { 0.04, nil, 0, 0.1 },
												["81016048005396"] = { 0.07, 2, 0, 0.7 },
												["99798123383608"] = { 0.07, nil, 0, 0.25 },
												["127386796069137"] = { 0.05, nil, 0, 1.1 },
											})[animationId:match("%d+") or ""] or { 0.07, nil, 0, 0 }

											local v55 = tbl32[1]
											local v56 = tbl32[2]
											local n15 = tbl32[3] or 0
											local n16 = tbl32[4] or 0
											local v57 = tbl32[5]
											local n17 = tbl32[6] or 0.5
											local v58 = tbl32[7]
											local n18 = tbl32[8] or 0.5
											local now2 = tick()
											local flag21 = false

											if v57 then
												task.spawn(function()
													task.wait(v57)
													getgenv().desync = { CFrame = CFrame.new(-3.4e38, -3.4e38, -3.4e38) }
													task.wait(n17)
													getgenv().desync = nil
												end)
											end

											if v58 then
												task.spawn(function()
													task.wait(v58)
													flag21 = true
													RunService.Heartbeat:Wait()
													local v59 = fn60(localPlayer3)
													v59 = v59 and fn61(v59)

													if v59 and sethiddenproperty then
														pcall(sethiddenproperty, v59, "PhysicsRepRootPart", nil)
													end

													fn70(CFrame.new(384.5, 439.5, 476))
													task.wait(n18)
													fn70(cFrame2)
												end)
											end

											if n16 > 0 then
												task.wait(n16)
											end

											if not v54.Parent then
												return
											end
											local tbl33 = {}

											for _, v59 in ipairs(fn63()) do
												if not table.find(RevenantWhitelist, v59) then
													local v60 = fn60(v59)
													local v61 = v60 and fn62(v60)
													v60 = v60 and fn61(v60)

													if v60 and v61 and v61.Health > 0 then
														tbl33[#tbl33 + 1] = v60
													end
												end
											end

											local live = workspace:FindFirstChild("Live")

											if live then
												for _, child in ipairs(live:GetChildren()) do
													if child ~= v53 and not Players:GetPlayerFromCharacter(child) then
														local humanoid = child:FindFirstChildOfClass("Humanoid")
														local v59 = humanoid and fn61(child)

														if v59 and humanoid.Health > 0 then
															tbl33[#tbl33 + 1] = v59
														end
													end
												end
											end

											if #tbl33 == 0 then
												return
											end
											local v59 = nil
											local flag22 = false
											local n19 = 0
											local tbl34 = {}

											live = live and live.DescendantAdded:Connect(function(descendant)
												if descendant:IsA("Sound") then
													if v59 and descendant:IsDescendantOf(v59) then
														local burstSounds = getgenv()._burstSounds
														local flag23 = not burstSounds
														local v60

														if flag23 then
															v60 = flag23
														else
															v60 = burstSounds[tostring(descendant.SoundId):match("%d+") or ""]
														end

														if v60 then
															flag22 = true
														end
													end
												elseif descendant.Name == "BeingGrabbed" then
													if descendant.Parent and not tbl34[descendant.Parent] then
														tbl34[descendant.Parent] = true
														n19 += 1
													end

													if v59 and descendant.Parent == v59 then
														flag22 = true
													end
												end
											end) or nil

											local n20 = now2 + (v56 or 10)

											local function fn97()
												if flag21 or getgenv()._burstStop then
													return false
												end

												if tick() >= n20 then
													return false
												end

												if #tbl33 <= n19 then
													return false
												end

												if not v56 and not arg.IsPlaying then
													return false
												end
												return true
											end

											local tbl35 = {}

											while fn97() do
												local position = v54.Position
												local huge = math.huge
												local v60 = nil
												local v61 = nil

												for i, v62 in ipairs(tbl33) do
													if not tbl35[i] and v62.Parent and not tbl34[v62.Parent] then
														local magnitude = (v62.Position - position).Magnitude

														if magnitude < huge then
															huge = magnitude
															v60 = v62
															v61 = i
														end
													end
												end

												if v60 then
													tbl35[v61] = true

													if v60.Parent and v54.Parent then
														local parent = v60.Parent
														flag22 = false
														v59 = parent
														local humanoid = parent:FindFirstChildOfClass("Humanoid")
														local connection24 = nil

														if humanoid then
															connection24 = humanoid.AnimationPlayed:Connect(function(arg2)
																if arg2.Priority == Enum.AnimationPriority.Action then
																	flag22 = true
																end
															end)
														end

														local connection25 = parent:GetAttributeChangedSignal("LastHit"):Connect(function()
															local name = localPlayer3.Name

															if parent:GetAttribute("LastHit") == name then
																flag22 = true
															end
														end)

														v54.CFrame = v60.CFrame * CFrame.new(0, 0, 2)
														v54.AssemblyLinearVelocity = v60.AssemblyLinearVelocity
														v54.AssemblyAngularVelocity = v60.AssemblyAngularVelocity

														if sethiddenproperty then
															pcall(sethiddenproperty, v54, "PhysicsRepRootPart", v60)
														end

														local now3 = tick()
														local n21 = now3 + v55
														local n22 = now3 + n15

														while true do
															if (tick() < n22 or not flag22) and tick() < n21 then
																RunService.Stepped:Wait()

																if v60.Parent and v54.Parent then
																	v54.CFrame = v60.CFrame * CFrame.new(0, 0, 2)
																	RunService.Heartbeat:Wait()

																	if v60.Parent and v54.Parent then
																		v54.CFrame = v60.CFrame * CFrame.new(0, 0, 2)
																		v54.AssemblyLinearVelocity = v60.AssemblyLinearVelocity
																		v54.AssemblyAngularVelocity = v60.AssemblyAngularVelocity

																		if sethiddenproperty then
																			pcall(sethiddenproperty, v54, "PhysicsRepRootPart", v60)
																		end

																		continue
																	end
																end
															end

															break
														end

														if connection24 then
															connection24:Disconnect()
														end

														if connection25 then
															connection25:Disconnect()
														end
													end

													continue
												end

												break
											end

											if live then
												live:Disconnect()
											end

											if v54.Parent then
												if sethiddenproperty then
													pcall(sethiddenproperty, v54, "PhysicsRepRootPart", nil)
												end

												v54.AssemblyLinearVelocity = Vector3.zero
												v54.AssemblyAngularVelocity = Vector3.zero

												if not v58 and not getgenv()._burstStop then
													RunService.Heartbeat:Once(function()
														if v54.Parent then
															v54.CFrame = cFrame2
														end
													end)
												end
											end
										end)
									end

									if animationId:match("18896229321") and _rawget(options.AttackAllMoves.Value, "Twin Fangs") then
										task.spawn(function()
											local state = 1
											local v53, flag21, flag22, n15, flag23, tbl32, v54, now2, v55, fn97, fn98, fn99, fn100, fn101, fn102, fn103, v56, isPlaying, now3, flag24, v57, flag25, v58, flag26, humanoid, animator, fn104, v59, flag27

											while true do
												if state == 1 then
													v53 = fn60(localPlayer3)

													if not v53 then
														state = 55
													else
														state = 2
													end
												elseif state == 2 then
													flag21 = not fn66()

													if flag21 then
														state = 4
													else
														state = 3
													end
												elseif state == 3 then
													flag22 = flag21
													state = 5
												elseif state == 4 then
													flag22 = v53:GetAttribute("Character") ~= "Purple"
													state = 5
												elseif state == 5 then
													if flag22 then
														state = 54
													else
														state = 6
													end
												elseif state == 6 then
													n15 = tick() + 3
													flag23 = true
													tick()

													fn93(function()
														return flag23
													end)

													tbl32 = {}
													v54 = nil
													now2 = tick()
													v55 = fn60(localPlayer3)

													if v55 then
														state = 7
													else
														state = 8
													end
												elseif state == 7 then
													v55 = fn61(v55)
													state = 8
												elseif state == 8 then
													if v55 then
														state = 9
													else
														state = 10
													end
												elseif state == 9 then
													state = 10
												elseif state == 10 then
													local function fn105(arg2)
														if not arg2 then
															return nil
														end

														if arg2:IsA("Player") then
															return fn60(arg2)
														end
														return arg2
													end

													local function fn106(arg2)
														return fn62(fn105(arg2))
													end

													local function fn107(arg2)
														return fn61(fn105(arg2))
													end

													local function fn108(arg2)
														if not arg2 then
															return false
														end

														if arg2:FindFirstChild("ForceField") then
															return true
														end

														if arg2:FindFirstChild("AbsoluteImmortal") then
															return true
														end

														if arg2:FindFirstChild("BeingGrabbed") then
															return true
														end

														if arg2:FindFirstChild("HunterCounter") then
															return true
														end

														if arg2:FindFirstChild("AtomicCounter") then
															return true
														end
														return false
													end

													fn97 = function(arg2)
														local v60 = fn105(arg2)
														local v61 = v60 and fn62(v60)
														if not v60 or not v61 then
															return true
														end

														if v61.Health <= 0 then
															return true
														end

														if arg2:IsA("Player") then
															if fn108(v60) then
																return true
															end

															if v60:FindFirstChild("Counter") then
																return true
															end

															if fn67(v61, "15128849047") then
																return true
															end

															if not fn66() and v60:GetAttribute("Ulted") and v60:GetAttribute("Character") == "Batter" then
																return true
															end
														end

														return false
													end

													local function fn109(arg2)
														local v60 = fn106(arg2)
														return v60 and (fn67(v60, "18896222853") or fn67(v60, "137434257516014"))
													end

													fn98 = function(arg2)
														if not arg2 or not arg2:IsA("Player") then
															return false
														end
														local v60 = fn60(arg2)
														local v61 = v60 and fn62(v60)
														if not v60 or not v61 then
															return false
														end

														if v61.Health <= 0 then
															return false
														end

														if fn67(v61, "15128849047") then
															return false
														end
														return fn108(v60)
													end

													fn99 = function(arg2)
														local tbl33 = {}

														for _, v60 in ipairs(fn65()) do
															if v60 ~= arg2 and not tbl32[v60] and not fn97(v60) and not fn109(v60) and not v60:FindFirstChild("BeingGrabbed") and not v60:FindFirstChild("Freeze") and not v60:FindFirstChild("HunterCounter") and not v60:FindFirstChild("AtomicCounter") and fn61(v60) then
																tbl33[#tbl33 + 1] = v60
															end
														end

														if #tbl33 == 0 then
															return nil
														end
														return tbl33[math.random(1, #tbl33)]
													end

													fn100 = function(arg2)
														local tbl33 = {}
														local tbl34 = {}

														for _, v60 in pairs(fn63()) do
															if not (v60 == arg2 or tbl32[v60]) then
																if not table.find(RevenantWhitelist, v60) then
																	local v61 = fn107(v60)

																	if not fn97(v60) and not fn109(v60) and v61 then
																		if fn92(v60) then
																			table.insert(tbl33, v60)
																		else
																			table.insert(tbl34, v60)
																		end
																	end
																end
															end
														end

														if #tbl33 > 0 then
															return tbl33[math.random(1, #tbl33)]
														end

														if #tbl34 > 0 then
															return tbl34[math.random(1, #tbl34)]
														end
														return fn99(arg2)
													end

													local connection24 = nil
													fn101 = nil
													fn102 = nil
													fn103 = nil

													fn103 = function(arg2)
														if connection24 then
															pcall(function()
																connection24:Disconnect()
															end)

															connection24 = nil
														end

														fn94()
														v54 = arg2
														now2 = tick()

														if arg2 then
															local v60 = fn60(localPlayer3)
															v60 = v60 and fn61(v60)
															local v61 = fn107(arg2)

															if v60 and v61 then
																fn96(v60, v61)
																local v62 = fn106(arg2)

																if v62 then
																	local animator2 = v62:FindFirstChildOfClass("Animator")

																	connection24 = (animator2 and animator2.AnimationPlayed or v62.AnimationPlayed):Connect(function(arg3)
																		local animationId2 = arg3.Animation.AnimationId

																		if animationId2:match("18896222853") or animationId2:match("137434257516014") then
																			if not flag23 then
																				return
																			end
																			local v63 = v54
																			if not v63 then
																				return
																			end
																			tbl32[v63] = true
																			fn94()
																			local v64 = fn100(v63)

																			if v64 then
																				fn103(v64)

																				if fn100(v64) == nil and not fn101() then
																					task.wait(0.1)
																					tbl32[v64] = true
																					_everybodyDone = true
																					fn102()
																				end
																			elseif fn101() then
																				fn94()
																				v54 = nil
																			else
																				_everybodyDone = true
																				fn102()
																			end
																		end
																	end)
																end
															end
														end
													end

													local function fn110()
														local v60 = fn60(localPlayer3)
														v60 = v60 and fn62(v60)

														if v60 then
															pcall(function()
																v60.AutoRotate = true
															end)
														end
													end

													local connection25 = workspace.Live.ChildAdded:Connect(function(child)
														if child.Name == "Weakest Dummy" then
															tbl32[child] = nil
														end
													end)

													local connection26 = RunService.RenderStepped:Connect(function()
														for _, v60 in pairs(fn63()) do
															if not table.find(RevenantWhitelist, v60) then
																if tbl32[v60] then
																	local v61 = fn60(v60)
																	local v62 = v61 and fn62(v61)

																	if v61 and v62 and v62.Health > 0 and not fn108(v61) then
																		tbl32[v60] = nil

																		if not v54 then
																			fn103(v60)
																		end
																	end
																end
															end
														end
													end)

													fn101 = function()
														for _, v60 in pairs(fn63()) do
															if tbl32[v60] then
																continue
															end

															if table.find(RevenantWhitelist, v60) then
																continue
															end

															if fn98(v60) then
																return true
															end
														end

														return false
													end

													local flag28 = false

													fn102 = function()
														if flag28 then
															return
														end
														flag28 = true
														fn94()
														fn110()

														if connection26 then
															pcall(function()
																connection26:Disconnect()
															end)
														end

														if connection25 then
															pcall(function()
																connection25:Disconnect()
															end)
														end

														if connection24 then
															pcall(function()
																connection24:Disconnect()
															end)

															connection24 = nil
														end

														flag23 = false
														fn95()
													end

													v56 = fn100(nil)

													if v56 then
														state = 11
													else
														state = 12
													end
												elseif state == 11 then
													fn103(v56)

													if fn100(v56) == nil then
														state = 53
													else
														state = 12
													end
												elseif state == 12 then
													isPlaying = arg.IsPlaying

													if isPlaying then
														state = 13
													else
														state = 14
													end
												elseif state == 13 then
													isPlaying = tick() < n15
													state = 14
												elseif state == 14 then
													if isPlaying then
														state = 15
													else
														state = 52
													end
												elseif state == 15 then
													RunService.Heartbeat:Wait()
													now3 = tick()

													if not v54 then
														state = 22
													else
														state = 16
													end
												elseif state == 16 then
													if fn97(v54) then
														state = 19
													else
														state = 17
													end
												elseif state == 17 then
													flag24 = false

													if now3 - now2 >= 0.8 then
														state = 18
													else
														state = 23
													end
												elseif state == 18 then
													tbl32[v54] = true
													flag24 = true
													state = 23
												elseif state == 19 then
													if not fn98(v54) then
														state = 20
													else
														state = 21
													end
												elseif state == 20 then
													tbl32[v54] = true
													state = 21
												elseif state == 21 then
													flag24 = true
													state = 23
												elseif state == 22 then
													flag24 = true
													state = 23
												elseif state == 23 then
													if flag24 then
														state = 24
													else
														state = 32
													end
												elseif state == 24 then
													v57 = fn100(v54)

													if not v57 then
														state = 29
													else
														state = 25
													end
												elseif state == 25 then
													fn103(v57)
													flag25 = fn100(v57) == nil

													if flag25 then
														state = 26
													else
														state = 27
													end
												elseif state == 26 then
													flag25 = not fn101()
													state = 27
												elseif state == 27 then
													if flag25 then
														state = 28
													else
														state = 32
													end
												elseif state == 28 then
													task.wait(0.1)
													tbl32[v57] = true
													fn102()
													state = 52
												elseif state == 29 then
													if fn101() then
														state = 31
													else
														state = 30
													end
												elseif state == 30 then
													fn102()
													state = 52
												elseif state == 31 then
													fn94()
													v54 = nil
													state = 32
												elseif state == 32 then
													v58 = fn99()

													if v58 then
														state = 34
													else
														state = 33
													end
												elseif state == 33 then
													flag26 = v58
													state = 35
												elseif state == 34 then
													flag26 = not tbl32[v58]
													state = 35
												elseif state == 35 then
													if flag26 then
														state = 36
													else
														state = 12
													end
												elseif state == 36 then
													humanoid = v58:FindFirstChild("Humanoid")

													if humanoid then
														state = 38
													else
														state = 37
													end
												elseif state == 37 then
													animator = humanoid
													state = 39
												elseif state == 38 then
													animator = humanoid:FindFirstChild("Animator")
													state = 39
												elseif state == 39 then
													fn104 = function(arg2)
														if not animator then
															return false
														end

														for _, v60 in pairs(animator:GetPlayingAnimationTracks()) do
															if v60.Animation.AnimationId:match(arg2) then
																return true
															end
														end

														return false
													end

													if humanoid then
														state = 40
													else
														state = 42
													end
												elseif state == 40 then
													humanoid = fn104("18896222853")

													if humanoid then
														state = 42
													else
														state = 41
													end
												elseif state == 41 then
													humanoid = fn104("137434257516014")
													state = 42
												elseif state == 42 then
													if humanoid then
														state = 43
													else
														state = 12
													end
												elseif state == 43 then
													tbl32[v58] = true

													if v54 ~= v58 then
														state = 12
													else
														state = 44
													end
												elseif state == 44 then
													fn94()
													v59 = fn100(v58)

													if v59 then
														state = 48
													else
														state = 45
													end
												elseif state == 45 then
													if fn101() then
														state = 47
													else
														state = 46
													end
												elseif state == 46 then
													fn102()
													state = 52
												elseif state == 47 then
													v54 = nil
													state = 12
												elseif state == 48 then
													fn103(v59)
													flag27 = fn100(v59) == nil

													if flag27 then
														state = 49
													else
														state = 50
													end
												elseif state == 49 then
													flag27 = not fn101()
													state = 50
												elseif state == 50 then
													if flag27 then
														state = 51
													else
														state = 12
													end
												elseif state == 51 then
													task.wait(0.1)
													tbl32[v59] = true
													fn102()
													state = 52
												elseif state == 52 then
													fn102()
													return
												elseif state == 53 then
													task.wait(0.1)
													tbl32[v56] = true
													fn102()
													return
												elseif state == 54 then
													return
												elseif state == 55 then
													return
												end
											end
										end)
									end

									if animationId:match("93546004428904") and _rawget(options.AttackAllMoves.Value, "Crushed Rock Variant") then
										n13 = 0
										flag6 = false

										task.spawn(function()
											local animator = fn60(localPlayer3)
											animator = animator and fn62(animator)
											animator = animator and animator:FindFirstChild("Animator")
											if not animator then
												return
											end

											while true do
												local flag21 = false

												for _, v53 in pairs(animator:GetPlayingAnimationTracks()) do
													if v53.Animation.AnimationId:match("93546004428904") then
														flag21 = true
														break
													end
												end

												if flag21 then
													for _, player in pairs(Players:GetPlayers()) do
														if player ~= localPlayer3 then
															local v53 = fn60(player)
															local v54 = v53 and fn62(v53)

															if v54 and v53 and not v53:GetAttribute("CrushedRockVariant") then
																if fn67(v54, "129945907044125") then
																	v53:SetAttribute("CrushedRockVariant", true)
																	n13 += 1
																end
															end
														end
													end

													for _, v53 in ipairs(fn65()) do
														local humanoid = v53:FindFirstChild("Humanoid")
														humanoid = humanoid and humanoid:FindFirstChild("Animator")

														if humanoid and not v53:GetAttribute("CrushedRockVariant") then
															for _, v54 in pairs(humanoid:GetPlayingAnimationTracks()) do
																if v54.Animation.AnimationId:match("129945907044125") then
																	v53:SetAttribute("CrushedRockVariant", true)
																end
															end
														end
													end

													task.wait()
													continue
												end

												break
											end

											n13 = 0
											flag6 = false
										end)
									end

									if animationId:match("72451715583225") and _rawget(options.AttackAllMoves.Value, "Crushed Rock Variant") then
										task.spawn(function()
											for _, player in pairs(Players:GetPlayers()) do
												if player ~= localPlayer3 then
													local v53 = fn60(player)

													if v53 then
														v53:SetAttribute("CrushedRockVariant", nil)
													end
												end
											end

											for _, v53 in ipairs(fn65()) do
												v53:SetAttribute("CrushedRockVariant", nil)
											end
										end)

										if flag5 then
											flag5 = false
										end
									end

									if animationId:match("131226430469931") and _rawget(options.AttackAllMoves.Value, "Crushed Rock Variant") then
										task.spawn(function()
											task.wait(1.2)
											local v53 = fn60(localPlayer3)
											if not (v53 and fn61(v53)) then
												return
											end

											if (tonumber(localPlayer3:GetAttribute("Ultimate")) or 0) >= 100 then
												return
											end
											getgenv().desync = { CFrame = CFrame.new(0, -29000, 0) }
											task.wait(0.65)
											getgenv().desync = nil
										end)
									end

									if animationId:match("135104210400610") and _rawget(options.AttackAllMoves.Value, "Crushed Rock Variant") then
										local flag21 = false
										local tbl32 = {}
										local connection24 = nil
										local connection25 = nil
										local v53 = nil
										local v54 = nil

										local function fn97()
											if connection24 then
												connection24:Disconnect()
												connection24 = nil
											end

											if connection25 then
												connection25:Disconnect()
												connection25 = nil
											end

											if sethiddenproperty then
												if v53 and v53.Parent then
													pcall(sethiddenproperty, v53, "PhysicsRepRootPart", nil)
												end

												if v54 and v54.Parent then
													pcall(sethiddenproperty, v54, "PhysicsRepRootPart", nil)
												end
											end

											if v53 and v53.Parent then
												v53.CFrame = CFrame.new(v53.Position)
												v53.AssemblyLinearVelocity = Vector3.zero
												v53.AssemblyAngularVelocity = Vector3.zero
												v53.Velocity = Vector3.zero
												v53.RotVelocity = Vector3.zero
												local humanoid = v53.Parent:FindFirstChildOfClass("Humanoid")

												if humanoid then
													pcall(function()
														humanoid.AutoRotate = true
													end)
												end
											end

											v53 = nil
											v54 = nil
										end

										local function fn98(arg2, arg3)
											if connection24 then
												connection24:Disconnect()
												connection24 = nil
											end

											if v53 and v53.Parent then
												v53.AssemblyLinearVelocity = Vector3.zero
												v53.AssemblyAngularVelocity = Vector3.zero
												v53.Velocity = Vector3.zero
												v53.RotVelocity = Vector3.zero
											end

											if not arg2 or not arg3 then
												return
											end
											v53 = arg2
											v54 = arg3

											if connection25 then
												connection25:Disconnect()
												connection25 = nil
											end

											local humanoid = arg2.Parent and arg2.Parent:FindFirstChildOfClass("Humanoid")

											if humanoid then
												connection25 = RunService.RenderStepped:Connect(function()
													if humanoid and humanoid.Parent then
														pcall(function()
															humanoid.AutoRotate = false
														end)
													end
												end)
											end

											arg2.CFrame = arg3.CFrame * CFrame.new(0, 0, 5)
											arg2.AssemblyLinearVelocity = arg3.AssemblyLinearVelocity
											arg2.AssemblyAngularVelocity = arg3.AssemblyAngularVelocity

											if sethiddenproperty then
												pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", arg2)
												pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", arg3)
												getgenv()._repDual.follow(arg2, arg3)
											end

											local v55 = nil

											connection24 = RunService.Heartbeat:Connect(function()
												if not arg2 or not arg2.Parent or not arg3 or not arg3.Parent then
													v55:Disconnect()
													getgenv()._repDual.release()

													if connection24 == v55 then
														connection24 = nil
													end

													if sethiddenproperty then
														if arg2 and arg2.Parent then
															pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", nil)
														end

														if arg3 and arg3.Parent then
															pcall(sethiddenproperty, arg3, "PhysicsRepRootPart", nil)
														end
													end

													if arg2 and arg2.Parent then
														arg2.AssemblyLinearVelocity = Vector3.zero
														arg2.AssemblyAngularVelocity = Vector3.zero
														arg2.Velocity = Vector3.zero
														arg2.RotVelocity = Vector3.zero
													end

													return
												end

												arg2.CFrame = arg3.CFrame * CFrame.new(0, 0, 5)
												arg2.AssemblyLinearVelocity = arg3.AssemblyLinearVelocity
												arg2.AssemblyAngularVelocity = arg3.AssemblyAngularVelocity

												if sethiddenproperty then
													pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", arg3)
													getgenv()._repDual.follow(arg2, arg3)
												end
											end)
										end

										local function fn99()
											fn97()
										end

										for _, player in pairs(Players:GetPlayers()) do
											if player ~= localPlayer3 then
												local humanoid = fn60(player)
												humanoid = humanoid and humanoid:FindFirstChildOfClass("Humanoid")

												if humanoid then
													local connection26 = humanoid.Died:Connect(function()
														local v55 = fn60(player)

														if v55 then
															v55:SetAttribute("CrushedRockVariant", nil)
														end
													end)

													table.insert(tbl32, connection26)
												end

												local connection26 = player.CharacterAdded:Connect(function(character)
													task.wait(0.1)

													if character then
														character:SetAttribute("CrushedRockVariant", nil)
													end
												end)

												table.insert(tbl32, connection26)
											end
										end

										task.spawn(function()
											for _, v55 in ipairs(fn65()) do
												local connection26 = v55.AncestryChanged:Connect(function()
													if not v55:IsDescendantOf(workspace) then
														pcall(function()
															v55:SetAttribute("CrushedRockVariant", nil)
														end)
													end
												end)

												table.insert(tbl32, connection26)
											end
										end)

										local function fn100()
											local tbl33 = {}
											local tbl34 = {}

											for _, v55 in pairs(fn63()) do
												if not table.find(RevenantWhitelist, v55) then
													local v56 = fn60(v55)
													local forceField

													if v56 then
														forceField = v56:FindFirstChild("ForceField") or v56:FindFirstChild("AbsoluteImmortal") or v56:FindFirstChild("BeingGrabbed") or v56:FindFirstChild("HunterCounter") or v56:FindFirstChild("AtomicCounter")
													else
														forceField = v56
													end

													if v56 and not forceField and not v56:GetAttribute("CrushedRockVariant") then
														local v57 = fn66()
														local flag22

														if v57 then
															flag22 = v57
														else
															flag22 = not (v56:GetAttribute("Ulted") and v56:GetAttribute("Character") == "Batter")
														end

														if flag22 then
															if fn92(v55) then
																table.insert(tbl33, v55)
															else
																table.insert(tbl34, v55)
															end
														end
													end
												end
											end

											if #tbl33 > 0 then
												return tbl33[math.random(1, #tbl33)]
											end

											if #tbl34 > 0 then
												return tbl34[math.random(1, #tbl34)]
											end
											local tbl35 = {}

											for _, v55 in ipairs(fn65()) do
												if (v55:FindFirstChild("HumanoidRootPart") or v55.PrimaryPart) and not v55:GetAttribute("CrushedRockVariant") and not v55:GetAttribute("Freeze") and not v55:FindFirstChild("BeingGrabbed") and not v55:FindFirstChild("HunterCounter") and not v55:FindFirstChild("AtomicCounter") then
													tbl35[#tbl35 + 1] = v55
												end
											end

											if #tbl35 > 0 then
												return tbl35[math.random(1, #tbl35)]
											end
											return nil
										end

										local v55 = fn100()
										local v56 = fn64(v55)
										local v57 = v56 and v55 or v55 and fn60(v55)
										local v58 = fn60(localPlayer3)
										v58 = v58 and fn61(v58)
										local humanoidRootPart2 = v57 and (v57:FindFirstChild("HumanoidRootPart") or fn61(v57))

										if v58 and humanoidRootPart2 then
											fn98(v58, humanoidRootPart2)
										end

										if v56 and v57 then
											v57:SetAttribute("CrushedRockVariant", true)
										end

										local function fn101(arg2, arg3)
											fn97()

											if arg3 and v57 then
												v57:SetAttribute("CrushedRockVariant", true)
											end

											flag21 = false
											local v59 = fn64(arg2)
											v55 = v59 and nil or arg2
											v57 = v59 and arg2 or arg2 and fn60(arg2)

											if v59 and v57 then
												v57:SetAttribute("CrushedRockVariant", true)
											end

											local v60 = fn60(localPlayer3)
											v60 = v60 and fn61(v60)
											local humanoidRootPart3 = v57 and (v57:FindFirstChild("HumanoidRootPart") or fn61(v57))

											if v60 and humanoidRootPart3 then
												fn98(v60, humanoidRootPart3)
											end
										end

										local flag22 = false
										local connection26 = nil

										connection26 = RunService.Heartbeat:Connect(function()
											if flag22 then
												connection26:Disconnect()
												fn99()

												for _, v59 in pairs(tbl32) do
													pcall(function()
														v59:Disconnect()
													end)
												end

												tbl32 = {}
												return
											end

											if not arg.IsPlaying then
												connection26:Disconnect()
												fn99()

												for _, v59 in pairs(tbl32) do
													pcall(function()
														v59:Disconnect()
													end)
												end

												tbl32 = {}

												if flag21 and v57 and not fn64(v57) then
													v57:SetAttribute("CrushedRockVariant", true)
												end

												return
											end

											if arg.TimePosition >= 1 then
												for _, player in pairs(Players:GetPlayers()) do
													if player ~= localPlayer3 then
														local v59 = fn60(player)

														if v59 then
															v59:SetAttribute("CrushedRockVariant", nil)
														end
													end
												end
											end

											local v59 = fn60(localPlayer3)
											local v60 = v59 and fn61(v59)
											v59 = v59 and fn62(v59)

											for _, player in pairs(Players:GetPlayers()) do
												if player ~= localPlayer3 then
													local v61 = fn60(player)
													local humanoid = v61 and v61:FindFirstChildOfClass("Humanoid")
													local humanoidRootPart3 = v61 and v61:FindFirstChild("HumanoidRootPart")

													if not (not humanoid or not humanoidRootPart3) then
														if not v61:GetAttribute("CrushedRockVariant") then
															if not (v61:FindFirstChild("AbsoluteImmortal") or v61:FindFirstChild("HunterCounter") or v61:FindFirstChild("AtomicCounter")) then
																if fn67(humanoid, "129945907044125") and v59 and fn67(v59, "131226430469931") then
																	if v55 == player then
																		flag21 = true
																		local v62 = fn100()

																		if v62 and v62 ~= v55 then
																			fn101(v62, true)
																		elseif not v62 then
																			fn97()

																			if v57 then
																				v57:SetAttribute("CrushedRockVariant", true)
																			end

																			flag22 = true
																		end
																	end
																end
															end
														end
													end
												end
											end

											for _, player in pairs(Players:GetPlayers()) do
												if player ~= localPlayer3 then
													local v61 = fn60(player)
													local humanoid = v61 and v61:FindFirstChildOfClass("Humanoid")
													local humanoidRootPart3 = v61 and v61:FindFirstChild("HumanoidRootPart")

													if not (not humanoid or not humanoidRootPart3) then
														if not v61:GetAttribute("CrushedRockVariant") then
															if not (v61:FindFirstChild("AbsoluteImmortal") or v61:FindFirstChild("HunterCounter") or v61:FindFirstChild("AtomicCounter")) then
																if fn67(humanoid, "80910065447206") then
																	if v60 and humanoidRootPart3 then
																		if fn64(v57) then
																			v57:SetAttribute("CrushedRockVariant", true)
																		end

																		fn98(v60, humanoidRootPart3)
																		v61:SetAttribute("CrushedRockVariant", true)
																		v55 = player
																		v57 = v61
																		flag21 = true
																	end
																end
															end
														end
													end
												end
											end

											for _, v61 in ipairs(fn65()) do
												local humanoid = v61:FindFirstChild("Humanoid")
												local animator = humanoid and humanoid:FindFirstChild("Animator")

												local function fn102(arg2)
													if not animator then
														return false
													end

													for _, v62 in pairs(animator:GetPlayingAnimationTracks()) do
														if v62.Animation.AnimationId:match(arg2) then
															return true
														end
													end

													return false
												end

												if humanoid and not v61:GetAttribute("CrushedRockVariant") then
													if fn102("129945907044125") or fn102("80910065447206") then
														v61:SetAttribute("CrushedRockVariant", true)

														if fn102("80910065447206") then
															local v62 = fn60(localPlayer3)
															v62 = v62 and fn62(v62)

															if v62 and fn67(v62, "131226430469931") then
																task.spawn(function()
																	task.wait(1.2)
																	local v63 = fn60(localPlayer3)
																	if not (v63 and fn61(v63)) then
																		return
																	end

																	if (tonumber(localPlayer3:GetAttribute("Ultimate")) or 0) >= 100 then
																		return
																	end
																	getgenv().desync = { CFrame = CFrame.new(0, -29000, 0) }
																	task.wait(0.65)
																	getgenv().desync = nil
																end)
															end
														end

														if v57 == v61 then
															fn97()
															local v62 = fn100()

															if v62 and v62 ~= v61 then
																fn101(v62, false)
															else
																flag22 = true
															end
														end
													end
												end
											end

											if v57 and not v57.Parent then
												pcall(function()
													v57:SetAttribute("CrushedRockVariant", nil)
												end)

												local v61 = fn100()

												if v61 then
													fn101(v61, false)
												else
													flag22 = true
												end
											end

											if v57 and (v57:FindFirstChild("ForceField") or v57:FindFirstChild("AbsoluteImmortal") or v57:FindFirstChild("BeingGrabbed") or v57:FindFirstChild("HunterCounter") or v57:FindFirstChild("AtomicCounter")) then
												local v61 = fn100()

												if v61 and v61 ~= v55 then
													fn101(v61, false)
												elseif not v61 then
													flag22 = true
												end
											end
										end)
									end
								end)

								tbl29[#tbl29 + 1] = v50.AnimationPlayed:Connect(function(arg)
									if not toggles.SkillThrow or not toggles.SkillThrow.Value then
										return
									end
									local animationId = arg.Animation.AnimationId
									local value = options.SkillThrowMoves and options.SkillThrowMoves.Value
									if not value then
										return
									end
									local v51 = fn60(localPlayer3)
									local v52 = v51 and fn61(v51)
									if not v52 then
										return
									end

									if animationId:match("12309835105") and rawget(value, "Hunters Grasp") then
										task.spawn(function()
											task.wait(0.3)
											local cFrame2 = v52.CFrame
											game:GetService("TweenService"):Create(v52, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), { CFrame = v52.CFrame * CFrame.new(0, 2500, 0) }):Play()
											task.wait(0.8)
											fn70(cFrame2)
										end)
									elseif animationId:match("14004235777") and rawget(value, "Homerun") then
										task.spawn(function()
											task.wait(0.4)
											local cFrame2 = v52.CFrame
											game:GetService("TweenService"):Create(v52, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), { CFrame = v52.CFrame * CFrame.new(0, 10000, 0) }):Play()
											task.wait(1)
											fn70(cFrame2)
										end)
									end
								end)

								local function fn92(arg)
									local function fn93(arg2)
										local v51 = arg2 and fn62(arg2)
										if not v51 then
											return
										end

										tbl29[#tbl29 + 1] = v51.AnimationPlayed:Connect(function(arg3)
											local animationId = arg3.Animation.AnimationId
											local v52 = fn60(localPlayer3)
											v52 = v52 and fn62(v52)

											if animationId:match("129945907044125") then
												if v52 and fn67(v52, "135104210400610") then
													if arg2 then
														arg2:SetAttribute("CrushedRockVariant", true)
													end
												end
											elseif animationId:match("80910065447206") then
												if v52 and fn67(v52, "135104210400610") then
													if arg2 then
														arg2:SetAttribute("CrushedRockVariant", true)
													end
												end
											end
										end)
									end

									local v51 = fn60(arg)

									if v51 then
										fn93(v51)
									end

									tbl28[#tbl28 + 1] = arg.CharacterAdded:Connect(function(character)
										task.wait(0.5)
										fn93(character)
									end)
								end

								for _, player in pairs(Players:GetPlayers()) do
									if player ~= localPlayer3 then
										fn92(player)
									end
								end

								tbl28[#tbl28 + 1] = Players.PlayerAdded:Connect(function(player)
									task.wait(1)
									fn92(player)
								end)
							end
						end

						task.spawn(fn91)

						tbl28[#tbl28 + 1] = localPlayer3.CharacterAdded:Connect(function()
							task.spawn(fn91, true)
						end)

						table.insert(tbl24, function()
							for _, v48 in pairs(tbl29) do
								v48:Disconnect()
							end

							table.clear(tbl29)

							for _, v48 in pairs(tbl28) do
								v48:Disconnect()
							end

							table.clear(tbl28)

							if v43 then
								v43:Destroy()
								v43 = nil
							end

							pcall(function()
								toggles["Auto_Lock-on_Prediction"]:SetValue(false)
							end)

							pcall(function()
								toggles.TouchFlingEnabled:SetValue(false)
							end)

							pcall(function()
								toggles.TogWeld:SetValue(false)
							end)

							pcall(function()
								toggles.CustomFrontDash:SetValue(false)
							end)

							pcall(function()
								toggles.CustomSideDash:SetValue(false)
							end)

							pcall(function()
								toggles.CustomBackDash:SetValue(false)
							end)

							tbl23["Touch Fling"] = false
							local character = localPlayer3.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")

							if humanoid then
								pcall(function()
									humanoid.AutoRotate = true
								end)
							end
						end)
					end

					if flag10 then
						task.spawn(function()
							pcall(function()
								_G.FreeEmotes = true
								localPlayer3:SetAttribute("EmoteSearchBar", true)
								localPlayer3:SetAttribute("ExtraSlots", true)
								localPlayer3:SetAttribute("EmotePages", true)
							end)
						end)
					end

					local flag19 = true

					if flag10 then
						flag19 = tbl17.Misc
					end

					if flag19 then
						game:GetService("ReplicatedStorage")
						game:GetService("TeleportService")
					end

					local str9 = "Unknown"

					pcall(function()
						local getServerType = game:GetService("ReplicatedStorage"):WaitForChild("GetServerType", 1)

						if getServerType then
							str9 = getServerType:InvokeServer()
						end
					end)

					local flag20 = true

					if flag10 then
						flag20 = tbl17.Misc
					end

					local Extra = nil
					local Leaderboard = nil
					local Scripts = nil
					local v47 = nil

					if flag20 then
						v47 = tbl17.Misc:AddLeftGroupbox("Staff Detector", "gavel")
						Scripts = tbl17.Misc:AddLeftGroupbox("Scripts", "parentheses")
						Extra = tbl17.Misc:AddRightGroupbox("Extra", "plus")
						Leaderboard = tbl17.Misc:AddRightGroupbox("Leaderboard", "podium")
					end

					if Extra then
						local n15 = 210
						local n16 = 8
						local n17 = 0.012
						local n18 = 0.03
						local n19 = 0.035
						local n20 = 120
						local n21 = 7
						local n22 = 0.05
						local n23 = 110
						local n24 = 6
						local n25 = 0.045
						local n26 = 130
						local n27 = 6

						local tbl32 = {
							Neck = Vector3.new(0, 1, 0),
							["Right Shoulder"] = Vector3.new(1, 0.5, 0),
							["Left Shoulder"] = Vector3.new(-1, 0.5, 0),
							["Right Hip"] = Vector3.new(1, -1, 0),
							["Left Hip"] = Vector3.new(-1, -1, 0),
						}

						local tbl33 = {
							Neck = Vector3.new(0, -0.5, 0),
							["Right Shoulder"] = Vector3.new(-0.5, 0.5, 0),
							["Left Shoulder"] = Vector3.new(0.5, 0.5, 0),
							["Right Hip"] = Vector3.new(0.5, 1, 0),
							["Left Hip"] = Vector3.new(-0.5, 1, 0),
						}

						local tbl34 = {
							Head = Vector3.new(2, 1, 1),
							Torso = Vector3.new(2, 2, 1),
							["Left Arm"] = Vector3.new(1, 2, 1),
							["Right Arm"] = Vector3.new(1, 2, 1),
							["Left Leg"] = Vector3.new(1, 2, 1),
							["Right Leg"] = Vector3.new(1, 2, 1),
						}

						local tbl35 = {}
						local tbl36 = {}
						local rootJoint = nil
						local c1 = nil
						local humanoidRootPart2 = nil
						local torso = nil
						local connection21 = nil
						local v48 = nil
						local v49 = nil
						local v50 = nil
						local n28 = 1
						local n29 = 0
						local n30 = 0
						local n31 = 0
						local tbl37 = {}
						local n32 = 0
						local n33 = 0
						local n34 = 0
						local n35 = 0
						local n36 = 0
						local n37 = 0
						local n38 = 0
						local n39 = 0
						local tbl38 = {}
						local tbl39 = {}
						local flag21 = false

						local function fn91()
							for _, v51 in ipairs(tbl35) do
								pcall(function()
									v51:Disconnect()
								end)
							end

							table.clear(tbl35)
						end

						local function fn92()
							for k, v51 in pairs(tbl36) do
								if k and k.Parent then
									pcall(function()
										k.Size = v51.Size
									end)

									if v51.Mesh and v51.Mesh.Parent then
										pcall(function()
											v51.Mesh.Scale = v51.MeshScale
										end)
									end

									if v51.Joint and v51.Joint.Parent and v51.C0 then
										pcall(function()
											v51.Joint.C0 = v51.C0
										end)

										if v51.C1 then
											pcall(function()
												v51.Joint.C1 = v51.C1
											end)
										end
									end
								end
							end

							table.clear(tbl36)

							if rootJoint and rootJoint.Parent and c1 then
								pcall(function()
									rootJoint.C1 = c1
								end)
							end

							if v48 and v48.Parent then
								pcall(function()
									local v51 = v48
									local v52 = v49
									local transparency

									if v49 then
										transparency = v52
									else
										transparency = 0
									end

									v51.Transparency = transparency
								end)

								if v50 then
									for k, v51 in pairs(v50) do
										if k and k.Parent then
											pcall(function()
												k.Transparency = v51
											end)
										end
									end
								end
							end

							rootJoint = nil
							c1 = nil
							humanoidRootPart2 = nil
							torso = nil
							v48 = nil
							v49 = nil
							v50 = nil
							n28 = 1
							n29 = 0
							n30 = 0
							n32 = 0
							n33 = 0
							n34 = 0
							n35 = 0
							n38 = 0
							n39 = 0
							table.clear(tbl38)
							table.clear(tbl39)
							table.clear(tbl37)
						end

						local function fn93()
							local genv = getgenv()
							return genv.desync ~= nil or genv.desync2 ~= nil or genv.flingDesync ~= nil or genv.InvisActive == true or genv.FUCActive == true
						end

						local function fn94()
							for k, v51 in pairs(tbl36) do
								if k and k.Parent then
									pcall(function()
										k.Size = v51.Size
									end)

									if v51.Mesh and v51.Mesh.Parent then
										pcall(function()
											v51.Mesh.Scale = v51.MeshScale
										end)
									end

									if v51.Joint and v51.Joint.Parent and v51.C0 then
										pcall(function()
											v51.Joint.C0 = v51.C0
										end)

										if v51.C1 then
											pcall(function()
												v51.Joint.C1 = v51.C1
											end)
										end
									end
								end
							end

							if rootJoint and rootJoint.Parent and c1 then
								pcall(function()
									rootJoint.C1 = c1
								end)
							end
						end

						local function fn95(arg)
							for _, descendant in ipairs(arg:GetDescendants()) do
								local flag22 = descendant:IsA("BasePart") and descendant.Parent == arg and descendant.Name ~= "HumanoidRootPart"
								local isAccessory = descendant:IsA("BasePart") and descendant.Name == "Handle" and descendant.Parent:IsA("Accessory")

								if (flag22 or isAccessory) and not tbl36[descendant] then
									local motor6D = nil

									pcall(function()
										if flag22 and torso then
											for _, child in ipairs(torso:GetChildren()) do
												if child:IsA("Motor6D") and child.Part1 == descendant then
													motor6D = child
													break
												end
											end
										end

										if not motor6D then
											motor6D = descendant:FindFirstChildOfClass("Motor6D") or descendant:FindFirstChildOfClass("Weld")
										end
									end)

									if descendant.Name == "Head" and not v48 then
										v48 = descendant
									end

									local specialMesh = descendant:FindFirstChildOfClass("SpecialMesh")
									local v51 = tbl36
									local tbl40 = { Size = tbl34[descendant.Name] or descendant.Size, Joint = motor6D }
									local c0

									if motor6D then
										c0 = tbl32[motor6D.Name]

										if c0 then
											local rotation = motor6D.C0.Rotation
											c0 = CFrame.new(tbl32[motor6D.Name]) * rotation
										end

										c0 = c0 or motor6D.C0
									else
										c0 = motor6D
									end

									c0 = c0 or nil
									tbl40.C0 = c0
									local c12

									if motor6D then
										local v52 = tbl33[motor6D.Name]

										if v52 then
											local rotation = motor6D.C1.Rotation
											c12 = CFrame.new(tbl33[motor6D.Name]) * rotation
										else
											c12 = v52
										end

										c12 = c12 or motor6D.C1
									else
										c12 = motor6D
									end

									tbl40.C1 = c12 or nil
									tbl40.Mesh = specialMesh
									tbl40.MeshScale = specialMesh and specialMesh.Scale or Vector3.one
									tbl40.Name = descendant.Name
									v51[descendant] = tbl40
								end
							end
						end

						local function fn96(arg)
							if not arg then
								return
							end
							local humanoid = arg:FindFirstChildOfClass("Humanoid")
							humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
							torso = arg:FindFirstChild("Torso")
							if not (humanoid and humanoidRootPart2 and torso) then
								return
							end
							rootJoint = humanoidRootPart2:FindFirstChild("RootJoint")
							if not rootJoint then
								return
							end
							local rotation = rootJoint.C1.Rotation
							c1 = CFrame.new(0, 0, 0) * rotation
							n31 = time()
							n28 = 1
							n29 = 0
							n30 = 0
							n32 = 0
							n33 = 0
							n34 = 0
							n35 = 0
							n38 = 0
							n39 = 0
							table.clear(tbl38)
							table.clear(tbl39)
							table.clear(tbl37)

							for _, child in ipairs(torso:GetChildren()) do
								if child:IsA("Motor6D") and child.Name ~= "Neck" then
									tbl37[child] = (child.Transform * CFrame.new(0, -1, 0)).Position
								end
							end

							fn95(arg)

							tbl35[#tbl35 + 1] = torso.Touched:Connect(function(hit)
								if not flag21 or getgenv()._revJGGen ~= n37 then
									return
								end

								pcall(function()
									if time() - n31 < 1.5 or fn93() then
										return
									end

									if hit:IsDescendantOf(arg) then
										return
									end

									if not hit.CanCollide then
										return
									end
									local n40 = hit.AssemblyLinearVelocity - humanoidRootPart2.AssemblyLinearVelocity

									if n40.Y < -14 then
										n29 -= math.abs(n40.Y) * 1.35
									end
								end)
							end)

							if v48 then
								tbl35[#tbl35 + 1] = v48.Touched:Connect(function(hit)
									if not flag21 or getgenv()._revJGGen ~= n37 then
										return
									end

									pcall(function()
										if time() - n31 < 1.5 or fn93() then
											return
										end

										if hit:IsDescendantOf(arg) then
											return
										end

										if not hit.CanCollide then
											return
										end
										n29 -= 15
									end)
								end)
							end

							tbl35[#tbl35 + 1] = humanoid.StateChanged:Connect(function(old, new)
								if not flag21 or getgenv()._revJGGen ~= n37 or fn93() then
									return
								end

								pcall(function()
									if new == Enum.HumanoidStateType.Jumping then
										n29 -= 3
									elseif new == Enum.HumanoidStateType.Landed then
										n29 -= 12
									end
								end)
							end)

							tbl35[#tbl35 + 1] = arg.DescendantAdded:Connect(function(descendant)
								if not flag21 or getgenv()._revJGGen ~= n37 then
									return
								end

								if not descendant:IsA("BasePart") then
									return
								end
								task.wait(0.1)

								if flag21 and localPlayer3.Character == arg then
									fn95(arg)
								end
							end)

							tbl35[#tbl35 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
								if not flag21 or getgenv()._revJGGen ~= n37 then
									return
								end

								pcall(function()
									deltaTime = math.min(deltaTime, 0.033)
									if not humanoidRootPart2 or not humanoidRootPart2.Parent then
										return
									end
									local flag22 = fn93() or arg:FindFirstChild("Ragdoll") ~= nil or arg:FindFirstChild("RagdollSim") ~= nil

									if flag22 then
										n36 = os.clock() + 0.25
									end

									if flag22 or os.clock() < n36 then
										for k in pairs(tbl37) do
											if k.Parent then
												tbl37[k] = (k.Transform * CFrame.new(0, -1, 0)).Position
											else
												tbl37[k] = nil
											end
										end

										n30 = 0

										if n28 ~= 1 or n29 ~= 0 or n32 ~= 0 or n34 ~= 0 then
											n28 = 1
											n29 = 0
											n32 = 0
											n33 = 0
											n34 = 0
											n35 = 0
											n38 = 0
											n39 = 0
											table.clear(tbl38)
											table.clear(tbl39)
											fn94()
										end

										return
									end

									local assemblyLinearVelocity = humanoidRootPart2.AssemblyLinearVelocity
									local n40 = options.WobbleIntensity and options.WobbleIntensity.Value or 1
									local n41 = math.min(0.35 * n40, 1.2)
									local n42 = math.min(0.5 * n40, 1.5)
									local n43 = math.max(0.7 - 0.05 * (n40 - 1), 0.45)
									local n44 = math.min(1.5 + 0.08 * (n40 - 1), 2.2)
									local n45 = 40 + 6 * (n40 - 1)
									local n46 = 0
									local n47 = 0
									local n48 = 0
									local n49 = 0

									for k, v51 in pairs(tbl37) do
										if k.Parent then
											local position = (k.Transform * CFrame.new(0, -1, 0)).Position
											local n50 = (position.Y - v51.Y) / deltaTime
											n46 += n50
											n47 += (position.X - v51.X) / deltaTime
											n48 += (position.Z - v51.Z) / deltaTime
											tbl37[k] = position
											n49 += 1
											local n51 = tbl38[k] or 0
											local n52 = tbl39[k] or 0
											local n53 = math.clamp(n52 + (-n26 * (n51 - math.clamp(-n50 * n25 * n40, -n41, n41)) - n27 * n52) * deltaTime, -14, 14)
											tbl38[k] = math.clamp(n51 + n53 * deltaTime, -n42, n42)
											tbl39[k] = n53
										else
											tbl37[k] = nil
											tbl38[k] = nil
											tbl39[k] = nil
										end
									end

									local n50 = n24 * n39
									n39 = math.clamp(n39 + (-n23 * (n38 - math.clamp(-math.clamp(humanoidRootPart2.AssemblyAngularVelocity.Y, -25, 25) * n22 * n40, -n41, n41)) - n50) * deltaTime, -14, 14)
									n38 = math.clamp(n38 + n39 * deltaTime, -n42, n42)
									local n51, n52, n53

									if n49 > 0 then
										n51 = math.clamp(n46 / n49, -30, 30)
										n52 = math.clamp(n47 / n49, -30, 30)
										n53 = math.clamp(n48 / n49, -30, 30)
									else
										n51 = 0
										n52 = 0
										n53 = 0
									end

									local n54 = -n20 * (n32 - math.clamp(n52 * n19 * n40, -n41, n41)) - n21 * n33
									local n55 = n21 * n35
									local n56 = -n20 * (n34 - math.clamp(n53 * n19 * n40, -n41, n41)) - n55
									n33 = math.clamp(n33 + n54 * deltaTime, -12, 12)
									n35 = math.clamp(n35 + n56 * deltaTime, -12, 12)
									n32 = math.clamp(n32 + n33 * deltaTime, -n42, n42)
									n34 = math.clamp(n34 + n35 * deltaTime, -n42, n42)
									local n57 = math.clamp(1 + assemblyLinearVelocity.Y * n17 + n51 * n18 * n40, n43, n44)

									if n30 < -10 and assemblyLinearVelocity.Y >= -1 then
										n29 -= math.abs(n30) * 0.35
									end

									n30 = assemblyLinearVelocity.Y
									local n58 = math.clamp(-n15 * (n28 - n57) - n16 * n29, -500, 500)

									if n28 < 0.88 then
										n58 *= 2
									end

									n29 = math.clamp(n29 + n58 * deltaTime, -n45, n45)
									n28 = math.clamp(n28 + n29 * deltaTime, n43, n44)
									local n59 = n28 < 1 and 1 + (1 - n28) * 0.45 or 1 - (n28 - 1) * 0.2
									local y = tbl36[torso] and tbl36[torso].Size.Y or 2

									for k, v51 in pairs(tbl36) do
										if k and k.Parent then
											local vector = Vector3.new(v51.Size.X * n59, v51.Size.Y * n28, v51.Size.Z * n59)

											if vector.X > 0 and vector.Y > 0 and vector.Z > 0 then
												k.Size = vector
											end

											if v51.Mesh and v51.Mesh.Parent then
												v51.Mesh.Scale = Vector3.new(v51.MeshScale.X * n59, v51.MeshScale.Y * n28, v51.MeshScale.Z * n59)
											end

											if v51.Joint and k ~= torso and v51.Joint.Parent and v51.C0 then
												local c0 = v51.C0
												local n60 = c0.Y * n28

												if v51.Name:find("Leg") then
													n60 += y * 0.5 * (1 - n28)
												elseif v51.Name:find("Arm") then
													n60 += y * 0.35 * (1 - n28)
												end

												local v52 = tbl38[v51.Joint]

												if v52 then
													local rotation2 = c0.Rotation
													v51.Joint.C0 = CFrame.new(c0.X, n60, c0.Z) * rotation2 * CFrame.Angles(v52, 0, 0)
												else
													v51.Joint.C0 = CFrame.new(c0.X, n60, c0.Z) * c0.Rotation
												end

												if v51.C1 then
													local c12 = v51.C1
													v51.Joint.C1 = CFrame.new(c12.X, c12.Y * n28, c12.Z) * c12.Rotation
												end
											end
										end
									end

									if tbl36[torso] and rootJoint and c1 then
										rootJoint.C1 = c1 * CFrame.new(0, (1 - n28) * tbl36[torso].Size.Y * 0.5, 0) * CFrame.Angles(n34, n38, -n32)
									end
								end)
							end)
						end

						local function fn97()
							flag21 = false
							getgenv()._revJGGen = (getgenv()._revJGGen or 0) + 1

							if connection21 then
								pcall(function()
									connection21:Disconnect()
								end)

								connection21 = nil
							end

							fn91()
							fn92()
						end

						local function fn98()
							fn97()
							getgenv()._revJGGen = (getgenv()._revJGGen or 0) + 1
							n37 = getgenv()._revJGGen
							flag21 = true
							fn96(localPlayer3.Character)

							connection21 = localPlayer3.CharacterAdded:Connect(function(character)
								if not flag21 or getgenv()._revJGGen ~= n37 then
									return
								end
								character:WaitForChild("Torso", 10)
								task.wait(0.6)
								if not flag21 or getgenv()._revJGGen ~= n37 then
									return
								end
								fn91()
								fn92()
								fn96(character)
							end)
						end

						Extra:AddDivider({ Text = "Character" })

						Extra:AddToggle("InvincibleEdits", {
							Text = "Invincible Wobbly Edit",
							Default = false,
							Callback = function(arg)
								if arg then
									fn98()
								else
									fn97()
								end
							end,
						})

						Extra:AddSlider("WobbleIntensity", { Text = "Wobble Intensity", Default = 2, Min = 1, Max = 10, Rounding = 0, Suffix = "x" })

						table.insert(tbl24, function()
							pcall(function()
								toggles.InvincibleEdits:SetValue(false)
							end)

							pcall(fn97)
						end)
					end

					local flag21 = true

					if flag10 then
						flag21 = tbl17.Misc
					end

					if flag21 then
						flag21 = game.PrivateServerOwnerId ~= 0 and localPlayer3.UserId == game.PrivateServerOwnerId

						if not flag21 then
							flag21 = workspace:GetAttribute("VIPServer")

							if flag21 then
								local userId = localPlayer3.UserId
								flag21 = tonumber(workspace:GetAttribute("VIPServer")) == userId
							end
						end

						if not flag21 then
							flag21 = workspace:GetAttribute("CustomServerOwnerId")

							if flag21 then
								local userId = localPlayer3.UserId
								flag21 = tonumber(workspace:GetAttribute("CustomServerOwnerId")) == userId
							end
						end
					end

					if flag21 then
						local v48 = tbl17.Misc:AddRightGroupbox("Unobtainable Skills", "wand-sparkles")

						local function fn91(arg)
							local character = localPlayer3.Character
							local communicate = character and character:FindFirstChild("Communicate")

							if communicate then
								pcall(function()
									communicate:FireServer({ Action = "GiveSkillToSelf", Goal = "Custom Character", SkillName = arg })
								end)
							end
						end

						local function fn92(arg, arg2)
							local character = localPlayer3.Character
							local communicate = character and character:FindFirstChild("Communicate")

							if communicate then
								pcall(function()
									communicate:FireServer({ Goal = "Custom Character", Action = "GiveSkillToPlayer", SkillName = arg, TargetUserIds = { arg2 } })
								end)
							end
						end

						local function fn93(arg)
							local character = localPlayer3.Character
							local communicate = character and character:FindFirstChild("Communicate")

							if communicate then
								pcall(function()
									communicate:FireServer({ Goal = "Custom Character", Action = "GiveSkillToAllPS", SkillName = arg })
								end)
							end
						end

						local function fn94(arg)
							local character = localPlayer3.Character
							local communicate = character and character:FindFirstChild("Communicate")

							if communicate then
								pcall(function()
									communicate:FireServer({ Goal = "Custom Character", Action = "RemoveSkillFromSelf", SkillName = arg })
								end)
							end
						end

						local function fn95()
							local value = options.VIPTargetPlayer and options.VIPTargetPlayer.Value
							if not value then
								return nil
							end

							if typeof(value) == "Instance" and value:IsA("Player") then
								return value.UserId
							end

							if type(value) == "string" and value ~= "" then
								for _, player in ipairs(Players:GetPlayers()) do
									local flag22 = player ~= localPlayer3
									local flag23

									if flag22 then
										flag23 = player.Name == value or player.DisplayName == value
									else
										flag23 = flag22
									end

									if flag23 then
										return player.UserId
									end
								end
							end

							return nil
						end

						v48:AddDivider({ Text = "Moves" })

						v48:AddDropdown("VIPCustomMoves", {
							Text = "Moves",
							Values = {
								"Freezing Path",
								"Frost Forge",
								"Multi Ice Slash",
								"Permafrost",
								"Judgement Chain",
								"Double Trouble",
								"Snowball",
								"Flame M1",
								"Downslam Finisher",
								"Forward Dash Attack",
								"Trashcan",
								"Seismic Fist",
								"Rising Fist",
								"Ice Hammer",
								"Ice HammerOld",
								"Pinpoint Cut Air Variation Finisher",
								"Railgun",
								"Crimson Whirl",
								"Airstrike",
								"Nuclear Fission",
								"Singularity",
								"Gamma Ray Burst",
							},
							Multi = true,
							Default = {},
							AllowNull = true,
						})

						v48:AddButton({
							Text = "Give Selected (Me)",
							Func = function()
								local tbl32 = options.VIPCustomMoves and options.VIPCustomMoves.Value or {}

								task.spawn(function()
									for k in pairs(tbl32) do
										fn91(k)
										task.wait(0.25)
									end
								end)
							end,
						})

						v48:AddButton({
							Text = "Remove Selected (Me)",
							Func = function()
								local tbl32 = options.VIPCustomMoves and options.VIPCustomMoves.Value or {}

								task.spawn(function()
									for k in pairs(tbl32) do
										fn94(k)
										task.wait(0.25)
									end
								end)
							end,
						})

						v48:AddButton({
							Text = "Remove ALL Equipped",
							Risky = true,
							Func = function()
								task.spawn(function()
									local tbl32 = {}
									local tbl33 = {}

									for _, v49 in ipairs({ localPlayer3.Backpack, localPlayer3.Character }) do
										if v49 then
											for _, child in ipairs(v49:GetChildren()) do
												if child:IsA("Tool") and not tbl33[child.Name] then
													tbl33[child.Name] = true
													tbl32[#tbl32 + 1] = child.Name
												end
											end
										end
									end

									for _, v49 in ipairs(tbl32) do
										fn94(v49)
										task.wait(0.25)
									end
								end)
							end,
						})

						local privOther = tbl17.PrivOther
						local addDivider = privOther.AddDivider
						getgenv()._revWbDivider = addDivider(privOther, { Text = "Whitebeard" })
						local privOther2 = tbl17.PrivOther
						local addButton = privOther2.AddButton

						getgenv()._revWbBtn = addButton(privOther2, {
							Text = "Get Whitebeard Lmaooo",
							Func = function()
								if (getgenv()._RCS_MyRank or 99) > 3 then
									return
								end

								task.spawn(function()
									local character = localPlayer3.Character
									local communicate = character and character:FindFirstChild("Communicate")
									if not communicate then
										return
									end
									local HttpService = game:GetService("HttpService")

									local function fn96()
										local attribute = localPlayer3:GetAttribute("CustomCharacters")
										if type(attribute) ~= "string" or attribute == "" then
											return nil
										end

										local ok, result = pcall(function()
											return HttpService:JSONDecode(attribute)
										end)

										if not ok or type(result) ~= "table" then
											return nil
										end

										for _, v49 in ipairs(result) do
											if tostring(v49.name) == "Whitebeard" then
												return tostring(v49.id)
											end
										end

										return nil
									end

									local v49 = fn96()

									if not v49 then
										pcall(function()
											communicate:FireServer({
												Goal = "Custom Character",
												Action = "Create",
												Name = "Whitebeard",
												AwakeningName = "YOU'RE ALL DOOMED!!",
												ImageId = 134261571085995,
												Config = {
													base1 = "Sweep",
													base2 = "Shatter",
													base3 = "Spine Splitter",
													base4 = "Tremmor",
													awaken1 = "Sweep",
													awaken2 = "Death Counter",
													awaken3 = "Blast Clutch",
													awaken4 = "Tremmor",
												},
												Tags = {},
											})
										end)

										for i = 1, 24 do
											task.wait(0.5)
											v49 = fn96()
											if not v49 then
												continue
											end
											break
										end
									end

									if v49 then
										pcall(function()
											communicate:FireServer({ Goal = "Custom Character", Action = "AddToSelection", CharacterId = v49 })
										end)
									end

									v24:Notify({ Title = fn39("Whitebeard"), Content = "check your character list ;)", Time = 5 })
								end)
							end,
						})

						fn54(getgenv()._revWbBtn, false)
						fn54(getgenv()._revWbDivider, false)

						task.spawn(function()
							local now2 = os.clock()

							while (not getgenv()._RCS_MyRank or not getgenv()._RevenantDoneLoading) and os.clock() - now2 < 20 do
								task.wait()
							end

							if (getgenv()._RCS_MyRank or 99) <= 3 then
								fn54(getgenv()._revWbBtn, true)
								fn54(getgenv()._revWbDivider, true)
							end
						end)

						v48:AddDivider({ Text = "Target" })
						v48:AddDropdown("VIPTargetPlayer", { Text = "Target Player", SpecialType = "Player", ExcludeLocalPlayer = true, Multi = false })

						v48:AddButton({
							Text = "Give Selected (Player)",
							Func = function()
								local v49 = fn95()
								if not v49 then
									return
								end
								local tbl32 = options.VIPCustomMoves and options.VIPCustomMoves.Value or {}

								task.spawn(function()
									for k in pairs(tbl32) do
										fn92(k, v49)
										task.wait(0.25)
									end
								end)
							end,
						})

						v48:AddButton({
							Text = "Give Selected (Everyone)",
							DoubleClick = true,
							Func = function()
								local tbl32 = options.VIPCustomMoves and options.VIPCustomMoves.Value or {}

								task.spawn(function()
									for k in pairs(tbl32) do
										fn93(k)
										task.wait(0.25)
									end
								end)
							end,
						})
					end

					local flag22 = true

					if flag10 then
						flag22 = tbl17.Misc
					end

					if flag22 then
						local tbl32 = {}

						pcall(function()
							local v48 = pairs
							local admins = require(game:GetService("ReplicatedStorage"):WaitForChild("Info", 5)).Admins or {}

							for _, admin in v48(admins) do
								local num = tonumber(admin)

								if num and num > 0 then
									table.insert(tbl32, num)
								end
							end
						end)

						local function fn91(arg)
							if arg == localPlayer3 then
								return
							end
							local str10 = arg.DisplayName .. "(@" .. arg.Name .. ")"
							local tbl33 = options.LeaveOnDropdown and options.LeaveOnDropdown.Value or {}

							local function fn92(arg2, arg3)
								if tbl33[arg2] then
									localPlayer3:Kick("\n[Revenant]\n" .. str10 .. " joined.\nThey're flagged as: " .. arg2 .. ".")
								else
									v24:Notify({ Title = fn39("Heads up"), Content = arg3, Time = 10 })
								end
							end

							local ok, result = pcall(function()
								return arg:IsInGroup(12013007)
							end)

							if ok and result then
								local ok2, result2 = pcall(function()
									return arg:GetRoleInGroup(12013007)
								end)

								local str11 = ok2 and result2 and result2 or "?"
								ok2 = ok2 and result2
								local flag23 = false

								if ok2 then
									local str12 = result2:lower()
									flag23 = str12:find("moderator") or str12:find("developer") or str12:find("contributor") or str12:find("tester") or str12:find("owner") or str12:find("anomaly player")
								end

								if flag23 then
									fn92("Staff", str10 .. " is a staff (" .. str11 .. "). heads up.")
									return
								end
							end

							for _, v48 in ipairs(tbl32) do
								if arg.UserId == v48 then
									fn92("Special People", str10 .. " is a possible mod.")
									return
								end
							end

							local tbl34 = {}

							for _, v48 in ipairs(tbl32) do
								local ok2, result2 = pcall(function()
									return arg:IsFriendsWith(v48)
								end)

								if ok2 and result2 then
									local ok3, result3 = pcall(function()
										return Players:GetNameFromUserIdAsync(v48)
									end)

									if ok3 then
										local displayName = result3

										pcall(function()
											local userInfosByUserIdsAsync = game:GetService("UserService"):GetUserInfosByUserIdsAsync({ v48 })

											if userInfosByUserIdsAsync and userInfosByUserIdsAsync[1] then
												displayName = userInfosByUserIdsAsync[1].DisplayName
											end
										end)

										tbl34[#tbl34 + 1] = displayName .. "(@" .. result3 .. ")"
									end
								end
							end

							if #tbl34 > 0 then
								fn92("Friends with Staff", str10 .. " is friends with " .. table.concat(tbl34, ", ") .. ".")
							end
						end

						v47:AddDropdown("LeaveOnDropdown", {
							Text = "Leave On",
							Multi = true,
							AllowNull = true,
							Default = {},
							Values = { "Staff", "Special People", "Friends with Staff" },
						})

						local connection21 = Players.PlayerAdded:Connect(function(player)
							task.spawn(pcall, fn91, player)
						end)

						for _, player in pairs(Players:GetPlayers()) do
							task.spawn(pcall, fn91, player)
						end

						table.insert(tbl24, function()
							if connection21 then
								connection21:Disconnect()
								connection21 = nil
							end
						end)

						local v48 = Scripts

						v48:AddButton({
							Text = "Infinite Yield",
							Func = function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
							end,
						})

						v48:AddButton({
							Text = "VEX Explorer",
							Func = function()
								loadstring(game:HttpGet("https://raw.githubusercontent.com/Vezise/2026/main/Vez/VexExplorer/VEXExplorer.lua"))()
							end,
						})

						v48:AddButton({
							Text = "Cobalt Remote Spy",
							Func = function()
								loadstring(game:HttpGet("https://gitlab.com/upio/cobalt/-/releases/permalink/latest/downloads/Cobalt.luau"))()
							end,
						})

						local tbl33 = {}
						local flag23 = false
						local flag24 = false

						v48:AddButton({
							Text = "Bypass Limited Emotes Timer",
							Tooltip = "Allows you to purchase any limited emote at any time.",
							Func = function()
								task.spawn(function()
									pcall(function()
										local MarketplaceService = game:GetService("MarketplaceService")
										local tbl34 = {}

										for _, v49 in require(game.ReplicatedStorage.Info).Limited, nil, nil do
											tbl34[v49.Name] = v49.ID
										end

										local tbl35 = {}

										pcall(function()
											local data = game:GetService("HttpService"):JSONDecode(localPlayer3:GetAttribute("Emotes"))

											for _, v49 in ipairs(data) do
												tbl35[tostring(v49)] = true
											end
										end)

										local ok, result = pcall(function()
											return MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()
										end)

										if ok then
											local str10 = "{\"items\":["
											local n15 = 1

											for _, v49 in ipairs(result) do
												if tbl34[v49.Name] then
													str10 ..= string.format("{\"Number\":%d,\"Image\":%d,\"Name\":\"%s\",\"Price\":%d,\"ID\":%d},", n15, v49.IconImageAssetId or 0, v49.Name, v49.PriceInRobux or 0, v49.ProductId)
													n15 += 1

													if not tbl35[v49.Name] then
														tbl33[v49.Name .. "  |  " .. tostring(v49.PriceInRobux or "?") .. " R$"] = { gamepassId = tbl34[v49.Name], name = v49.Name }
													end
												end
											end

											if str10:sub(-1) == "," then
												str10 = str10:sub(1, -2)
											end

											local str11 = str10 .. "],\"info\":{\"secondsInWeek\":604800,\"startOfYear\":1735732800,\"currentWeek\":23}}"

											if not getgenv()._revLimitedSaved then
												getgenv()._revLimitedSaved = true
												local v49 = workspace
												getgenv()._revLimitedOriginal = v49:GetAttribute("Limited")
											end

											workspace:SetAttribute("Limited", str11)
											local localPlayer4 = game.Players.LocalPlayer

											for _, child in ipairs(localPlayer4.PlayerGui.Emotes.ImageLabel.Limited.List:GetChildren()) do
												if child:IsA("ImageButton") then
													child.MouseButton1Click:Connect(function()
														local attribute = child:GetAttribute("ID")

														if attribute then
															local tbl36 = { { Goal = "Gift Gamepass", GiftData = { Receiver = localPlayer4.UserId, Gamepass = attribute } } }
															localPlayer4.Character:WaitForChild("Communicate"):FireServer(unpack(tbl36))
														end
													end)
												end
											end

											flag23 = true
											local tbl36 = {}

											for k in pairs(tbl33) do
												table.insert(tbl36, k)
											end

											table.sort(tbl36)

											if not flag24 then
												flag24 = true
												v48:AddLabel("Select an emote to purchase (use this if the emote is not visible in the default TSB UI):", true)
												v48:AddDropdown("LimitedEmoteDropdown", { Values = tbl36, Default = 1, Multi = false, Text = "Emote" })

												v48:AddButton({
													Text = "Buy",
													Func = function()
														local value = options.LimitedEmoteDropdown and options.LimitedEmoteDropdown.Value
														local v49 = value and tbl33[value]
														if not v49 then
															v24:Notify({ Title = fn39("Limited Emotes"), Content = "Emote not found.", Time = 3 })
															return
														end

														pcall(function()
															local tbl37 = { { Goal = "Gift Gamepass", GiftData = { Receiver = localPlayer3.UserId, Gamepass = v49.gamepassId } } }
															localPlayer3.Character:WaitForChild("Communicate"):FireServer(unpack(tbl37))
														end)
													end,
												})
											else
												pcall(function()
													options.LimitedEmoteDropdown:SetValues(tbl36)
												end)
											end

											if not getgenv()._revLimitedConn then
												getgenv()._revLimitedConn = localPlayer3:GetAttributeChangedSignal("Emotes"):Connect(function()
													pcall(function()
														local tbl37 = {}

														for _, v49 in ipairs(game:GetService("HttpService"):JSONDecode(localPlayer3:GetAttribute("Emotes"))) do
															tbl37[tostring(v49)] = true
														end

														local tbl38 = {}

														for k, v49 in pairs(tbl33) do
															if v49.name and tbl37[v49.name] then
																tbl33[k] = nil
															else
																tbl38[#tbl38 + 1] = k
															end
														end

														table.sort(tbl38)
														options.LimitedEmoteDropdown:SetValues(tbl38)
													end)
												end)
											end
										end
									end)
								end)
							end,
						})

						table.insert(tbl24, function()
							if getgenv()._revLimitedConn then
								pcall(function()
									getgenv()._revLimitedConn:Disconnect()
								end)

								getgenv()._revLimitedConn = nil
							end

							if getgenv()._revLimitedSaved then
								pcall(function()
									workspace:SetAttribute("Limited", getgenv()._revLimitedOriginal)
								end)

								getgenv()._revLimitedSaved = nil
								getgenv()._revLimitedOriginal = nil
							end
						end)

						local function fn92(arg)
							local TextChatService = game:GetService("TextChatService")

							if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
								local rbxGeneral = TextChatService.TextChannels:FindFirstChild("RBXGeneral")

								if rbxGeneral then
									pcall(function()
										rbxGeneral:SendAsync(arg)
									end)
								end
							else
								local defaultChatSystemChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
								local sayMessageRequest = defaultChatSystemChatEvents and defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")

								if defaultChatSystemChatEvents and sayMessageRequest then
									pcall(function()
										sayMessageRequest:FireServer(arg, "all")
									end)
								end
							end
						end

						local function fn93(arg)
							local n15 = arg or math.random(3, 20)
							local str10 = ""

							for i = 1, n15 do
								local n16 = math.random(1, 52)
								str10 ..= ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"):sub(n16, n16)
							end

							return str10
						end

						if Extra then
							local tbl34 = {}
							local connection22 = nil
							local tbl35 = {}
							local tbl36 = { "Kills", "Total Kills" }

							local function fn94(arg)
								if arg == localPlayer3 then
									return
								end

								task.spawn(function()
									local leaderstats = arg:FindFirstChild("leaderstats") or arg:WaitForChild("leaderstats", 10)
									if not leaderstats then
										return
									end

									if not tbl34[arg] then
										tbl34[arg] = {}
									end

									getgenv()._RevHiddenKillConns = getgenv()._RevHiddenKillConns or {}

									for _, v49 in ipairs(tbl36) do
										if not leaderstats:FindFirstChild(v49) then
											local v50 = arg:FindFirstChild(v49)

											if v50 then
												v50.Parent = leaderstats
												tbl34[arg][v49] = v50
											end
										end

										local v50 = leaderstats:FindFirstChild(v49)

										if v50 then
											local str10 = v49 == "Total Kills" and "TotalKillsFrb" or "Kills"
											local str11 = tostring(arg.UserId) .. "|" .. v49
											local value = tonumber(arg:GetAttribute(str10))

											if value then
												pcall(function()
													v50.Value = value
												end)
											end

											if getgenv()._RevHiddenKillConns[str11] then
												pcall(function()
													getgenv()._RevHiddenKillConns[str11]:Disconnect()
												end)
											end

											getgenv()._RevHiddenKillConns[str11] = arg:GetAttributeChangedSignal(str10):Connect(function()
												local value2 = tonumber(arg:GetAttribute(str10))

												if value2 then
													pcall(function()
														v50.Value = value2
													end)
												end
											end)
										end
									end
								end)
							end

							local function fn95(parent)
								local v49 = tbl34[parent]
								if not v49 then
									return
								end
								tbl34[parent] = nil

								for _, v50 in pairs(v49) do
									pcall(function()
										if v50 and v50.Parent then
											v50.Parent = parent
										end
									end)
								end
							end

							local function fn96(arg)
								if arg == localPlayer3 then
									return
								end

								if tbl35[arg] then
									pcall(function()
										tbl35[arg]:Disconnect()
									end)
								end

								tbl35[arg] = arg.CharacterAdded:Connect(function()
									task.wait(1)
									fn94(arg)
								end)
							end

							Extra:AddDivider({ Text = "Kills" })

							Extra:AddToggle("ShowHiddenKills", {
								Text = "Show Hidden Kills",
								Default = false,
								Callback = function(arg)
									if arg then
										for _, player in ipairs(Players:GetPlayers()) do
											fn94(player)
											fn96(player)
										end

										connection22 = Players.PlayerAdded:Connect(function(player)
											task.wait(1)
											fn94(player)
											fn96(player)
										end)
									else
										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end

										for k, v49 in pairs(tbl35) do
											pcall(function()
												v49:Disconnect()
											end)

											tbl35[k] = nil
										end

										if getgenv()._RevHiddenKillConns then
											for k, revHiddenKillConn in pairs(getgenv()._RevHiddenKillConns) do
												pcall(function()
													revHiddenKillConn:Disconnect()
												end)

												getgenv()._RevHiddenKillConns[k] = nil
											end
										end

										local tbl37 = {}

										for k in pairs(tbl34) do
											tbl37[#tbl37 + 1] = k
										end

										for _, v49 in ipairs(tbl37) do
											fn95(v49)
										end
									end
								end,
							})

							Extra:AddDivider({ Text = "Chat Flooder" })

							Extra:AddToggle("ChatFlooder", {
								Text = "Chat Flooder",
								Default = false,
								Callback = function(arg)
									if not arg then
										return
									end

									task.spawn(function()
										while toggles.ChatFlooder and toggles.ChatFlooder.Value do
											fn92(fn93(200))
											local now2 = tick()
											local n15 = options.ChatFlooderDelay and options.ChatFlooderDelay.Value or 3.5

											while true do
												task.wait()
												local flag25 = tick() >= now2 + n15

												if not flag25 then
													flag25 = not (toggles.ChatFlooder and toggles.ChatFlooder.Value)
												end

												if not flag25 then
													continue
												end
												break
											end
										end
									end)
								end,
							})

							Extra:AddSlider("ChatFlooderDelay", { Text = "Chat Flooder Delay", Default = 3.5, Min = 0.5, Max = 5, Rounding = 1 })

							table.insert(tbl24, function()
								pcall(function()
									toggles.ChatFlooder:SetValue(false)
								end)
							end)

							local position = nil
							local connection23 = nil
							local connection24 = nil

							local function fn97(arg)
								if connection23 then
									pcall(function()
										connection23:Disconnect()
									end)

									connection23 = nil
								end

								if not arg then
									return
								end
								local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart2 then
									return
								end
								local humanoid = arg:FindFirstChildOfClass("Humanoid")

								if humanoid then
									humanoid:GetPropertyChangedSignal("Health"):Connect(function()
										if humanoid.Health > 0 then
											return
										end

										if connection23 then
											pcall(function()
												connection23:Disconnect()
											end)

											connection23 = nil
										end

										local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart3 then
											position = humanoidRootPart3.Position
										end
									end)
								end

								connection23 = RunService.Heartbeat:Connect(function()
									if humanoidRootPart2.Parent then
										position = humanoidRootPart2.Position
									else
										pcall(function()
											connection23:Disconnect()
										end)

										connection23 = nil
									end
								end)
							end

							Extra:AddDivider({ Text = "Death" })

							Extra:AddToggle("SavePosOnDeath", {
								Text = "Save Position on Death",
								Default = false,
								Risky = true,
								Tooltip = "sometimes is unstable if you get killed high, but it's rare.",
								Callback = function(arg)
									if arg then
										fn97(localPlayer3.Character)

										connection24 = localPlayer3.CharacterAdded:Connect(function(character)
											local v49 = position

											task.spawn(function()
												local humanoidRootPart2 = character:WaitForChild("HumanoidRootPart", 10)
												local humanoid = character:WaitForChild("Humanoid", 10)
												if not humanoidRootPart2 or not humanoid then
													return
												end

												if v49 then
													while true do
														task.wait()
														local flag25 = humanoid.Health > 0

														if flag25 then
															local none = Enum.HumanoidStateType.None
															flag25 = humanoid:GetState() ~= none
														end

														if flag25 then
															local dead = Enum.HumanoidStateType.Dead
															flag25 = humanoid:GetState() ~= dead
														end

														if not flag25 then
															continue
														end
														break
													end

													pcall(function()
														humanoidRootPart2.CFrame = CFrame.new(v49)
													end)
												end

												fn97(character)
											end)
										end)
									else
										if connection23 then
											pcall(function()
												connection23:Disconnect()
											end)

											connection23 = nil
										end

										if connection24 then
											pcall(function()
												connection24:Disconnect()
											end)

											connection24 = nil
										end
									end
								end,
							})

							table.insert(tbl24, function()
								pcall(function()
									toggles.SavePosOnDeath:SetValue(false)
								end)

								if connection23 then
									pcall(function()
										connection23:Disconnect()
									end)

									connection23 = nil
								end

								if connection24 then
									pcall(function()
										connection24:Disconnect()
									end)

									connection24 = nil
								end
							end)

							local function fn98()
								local character = localPlayer3.Character
								local communicate = character and character:FindFirstChild("Communicate")

								if communicate then
									pcall(function()
										communicate:FireServer({ Goal = "FloorMaterial" })
									end)
								end
							end

							local function fn99(arg)
								local n15 = math.floor(tonumber(arg) or 1)

								if n15 < 1 then
									n15 = 1
								end

								task.spawn(function()
									for i = 1, n15 do
										if toggles.Take40Health and toggles.Take40Health.Value then
											fn98()

											if i % 250 == 0 then
												task.wait()
											end

											continue
										end

										break
									end
								end)
							end

							local privOther = tbl17.PrivOther
							local addDivider = privOther.AddDivider
							getgenv()._revT40Divider = addDivider(privOther, { Text = "Take 40%" })
							local privOther2 = tbl17.PrivOther
							local addToggle = privOther2.AddToggle

							getgenv()._revT40Toggle = addToggle(privOther2, "Take40Health", {
								Text = "take 40% health away",
								Default = false,
								Risky = true,
								DisabledTooltip = "not elevated permissions",
								Callback = function(arg)
									if not arg and options.Take40Bind then
										options.Take40Bind.Toggled = false
									end
								end,
							})

							getgenv()._revT40Toggle:AddKeyPicker("Take40Bind", {
								Default = "F7",
								Text = "take 40% health away",
								Mode = "Toggle",
								SyncToggleState = false,
								Callback = function()
									if getgenv()._RCS_MyRank > 3 or not toggles.Take40Health.Value then
										if options.Take40Bind then
											options.Take40Bind.Toggled = false
										end

										return
									end

									fn99(options.Take40Times and options.Take40Times.Value or 1)

									if options.Take40Bind then
										options.Take40Bind.Toggled = false
									end
								end,
							})

							tbl17.PrivOther:AddSlider("Take40Times", { Text = "times", Default = 1, Min = 1, Max = 10000, Rounding = 0, Compact = true })

							tbl17.PrivOther:AddInput("Take40TimesInput", {
								Text = "times (exact)",
								Default = "1",
								Placeholder = "1 - 10000",
								Numeric = true,
								Finished = true,
								Callback = function(arg)
									local num = tonumber(arg)
									if not num then
										return
									end
									local n15 = math.clamp(math.floor(num), 1, 10000)

									if options.Take40Times and options.Take40Times.SetValue then
										pcall(function()
											options.Take40Times:SetValue(n15)
										end)
									end
								end,
							})

							local function fn100()
								local flag25 = (toggles.Take40Health and toggles.Take40Health.Value) == true

								if flag25 then
									flag25 = (getgenv()._RCS_MyRank or 99) <= 3
								end

								fn54(options.Take40Times, flag25)
								fn54(options.Take40TimesInput, flag25)
							end

							pcall(function()
								toggles.Take40Health:OnChanged(fn100)
							end)

							task.defer(fn100)
							fn54(getgenv()._revT40Toggle, false)
							fn54(getgenv()._revT40Divider, false)

							if options.Take40Bind then
								options.Take40Bind.ForceListHidden = true

								pcall(function()
									options.Take40Bind:Update()
								end)
							end

							task.spawn(function()
								local now2 = os.clock()

								while (not getgenv()._RCS_MyRank or not getgenv()._RevenantDoneLoading) and os.clock() - now2 < 20 do
									task.wait()
								end

								if (getgenv()._RCS_MyRank or 99) <= 3 then
									fn54(getgenv()._revT40Toggle, true)
									fn54(getgenv()._revT40Divider, true)

									if options.Take40Bind then
										options.Take40Bind.ForceListHidden = false

										pcall(function()
											options.Take40Bind:Update()
										end)
									end
								else
									pcall(function()
										toggles.Take40Health:SetValue(false)
									end)
								end

								fn100()
							end)

							local v49 = tbl17.PrivOther:AddButton({
								Text = "GET KING MOVESET 999% OP REAL🔥🔥😭",
								Func = function()
									if (getgenv()._RCS_MyRank or 99) > 3 then
										return
									end

									task.spawn(function()
										local character = localPlayer3.Character
										if not (character and character:FindFirstChild("Communicate")) then
											return
										end

										if character:GetAttribute("Character") == "Royale" then
											return
										end

										if character:GetAttribute("DidDamage") or character:GetAttribute("GotDamage") then
											local humanoid = character:FindFirstChildOfClass("Humanoid")

											pcall(function()
												if humanoid then
													humanoid.Health = 0
												end
											end)

											local now2 = tick()

											while true do
												task.wait(0.05)

												local function fn101()
													local character2 = localPlayer3.Character
													local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
													return not humanoid2 or humanoid2.Health <= 0
												end

												if not (fn101() or tick() - now2 > 6) then
													continue
												end
												break
											end
										end

										local character2 = localPlayer3.Character
										local communicate = character2 and character2:FindFirstChild("Communicate")

										if communicate then
											pcall(function()
												communicate:FireServer({ Goal = "Change Character", Character = "Royale" })
											end)
										end
									end)
								end,
							})

							task.spawn(function()
								local now2 = os.clock()

								while (not getgenv()._RCS_MyRank or not getgenv()._RevenantDoneLoading) and os.clock() - now2 < 20 do
									task.wait()
								end

								if (getgenv()._RCS_MyRank or 99) > 3 then
									pcall(function()
										v49:SetVisible(false)
									end)
								end
							end)

							local n15 = 84.9
							local flag25 = type(getrawmetatable) == "function" and type(setreadonly) == "function" and type(newcclosure) == "function" and type(getnamecallmethod) == "function"

							getgenv()._resolveCrushTarget = function()
								if not (toggles.CrushPullAim and toggles.CrushPullAim.Value) then
									return nil
								end
								local str10 = options.CrushPullMode and options.CrushPullMode.Value or "Silent Aim"
								local flag26 = str10 == "Lock On"
								local flag27

								if flag26 then
									flag27 = not (toggles["Lock-on"] and toggles["Lock-on"].Value)
								else
									flag27 = flag26
								end

								if flag27 then
									return nil
								end
								local character = localPlayer3.Character
								local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart2 then
									return nil
								end
								local currentCamera = workspace.CurrentCamera
								local flag28 = str10 == "Looking" or str10 == "Lock On"
								local flag29 = str10 == "Silent Aim"

								if str10 == "Last Hit" and character then
									local attribute = character:GetAttribute("LastM1Hitted")
									local match = type(attribute) == "string" and attribute:match("^(.-);;") or nil

									if match and match ~= "" then
										local function fn101(arg)
											if not arg then
												return nil
											end
											local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("Torso")
											local humanoid = arg:FindFirstChildOfClass("Humanoid")
											if humanoidRootPart3 and humanoid and humanoid.Health > 0 and (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude <= n15 then
												return arg
											end
											return nil
										end

										local v50 = Players:FindFirstChild(match)
										local flag30 = v50 and v50 ~= localPlayer3
										local v51 = nil

										if flag30 then
											v51 = fn101(v50.Character)
										end

										if not v51 then
											local live = workspace:FindFirstChild("Live")
											live = live and live:FindFirstChild(match)

											if live and live ~= character then
												v51 = fn101(live)
											end
										end

										if v51 then
											return v51
										end
									end
								end

								local tbl37 = {}

								for _, player in ipairs(Players:GetPlayers()) do
									if player ~= localPlayer3 and player.Character then
										tbl37[player.Character] = true
									end
								end

								local live = workspace:FindFirstChild("Live")

								if live then
									for _, child in ipairs(live:GetChildren()) do
										if child:IsA("Model") and child ~= character and child:FindFirstChildOfClass("Humanoid") then
											tbl37[child] = true
										end
									end
								end

								local huge = math.huge
								local v50 = nil

								for k in pairs(tbl37) do
									local humanoidRootPart3 = k:FindFirstChild("HumanoidRootPart") or k:FindFirstChild("Torso")
									local humanoid = k:FindFirstChildOfClass("Humanoid")

									if humanoidRootPart3 and humanoid and humanoid.Health > 0 then
										local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude

										if magnitude <= n15 then
											if flag28 and currentCamera then
												local v51, v52 = currentCamera:WorldToViewportPoint(humanoidRootPart3.Position)

												if v52 then
													local vector2 = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2)
													local magnitude2 = (Vector2.new(v51.X, v51.Y) - vector2).Magnitude

													if magnitude2 < huge then
														huge = magnitude2
														v50 = k
													end
												end
											elseif flag29 then
												if humanoid.Health < huge then
													huge = humanoid.Health
													v50 = k
												end
											elseif not flag28 then
												if magnitude < huge then
													huge = magnitude
													v50 = k
												end
											end
										end
									end
								end

								return v50
							end

							if flag25 and not getgenv()._crushNcHooked then
								pcall(function()
									local v50 = getrawmetatable(game)
									setreadonly(v50, false)
									local namecall = v50.__namecall

									v50.__namecall = newcclosure(function(arg, ...)
										local v51 = table.pack(...)

										if getgenv()._crushAimOn then
											local ok, result = pcall(getnamecallmethod)

											if ok and result == "FireServer" then
												local v52 = ...
												local flag26 = type(v52) == "table" and v52.Goal == "Console Move"
												local flag27

												if flag26 then
													local flag28 = v52.ToolName == "Crushing Pull" or v52.CrushingPull ~= nil

													if flag28 then
														flag27 = flag28
													else
														flag27 = typeof(v52.Tool) == "Instance" and v52.Tool.Name == "Crushing Pull"
													end
												else
													flag27 = flag26
												end

												if flag27 then
													local crushTarget = getgenv()._crushTarget

													if crushTarget then
														v52.CrushingPull = crushTarget
													end
												end

												return namecall(arg, table.unpack(v51, 1, v51.n))
											end
										end

										return namecall(arg, ...)
									end)

									setreadonly(v50, true)
									getgenv()._crushNcHooked = true
								end)
							end

							getgenv()._crushTarget = nil

							if flag25 then
								local connection25 = RunService.Heartbeat:Connect(function()
									if not getgenv()._crushAimOn then
										if getgenv()._crushTarget ~= nil then
											getgenv()._crushTarget = nil
										end

										return
									end

									getgenv()._crushTarget = getgenv()._resolveCrushTarget()
								end)

								table.insert(tbl24, function()
									if connection25 then
										pcall(function()
											connection25:Disconnect()
										end)

										connection25 = nil
									end

									getgenv()._crushTarget = nil
								end)
							end

							Extra:AddDivider({ Text = "Crushing Pull" })
							local v50 = Extra
							local addToggle2 = v50.AddToggle
							local flag26 = not flag25

							addToggle2(v50, "CrushPullAim", {
								Text = "Crushing Pull Extender",
								Default = false,
								Disabled = flag26,
								Tooltip = flag26 and "your executor doesn't support this (needs metatable hooks)" or nil,
								Callback = function(crushAimOn)
									if not flag25 then
										getgenv()._crushAimOn = false

										pcall(function()
											toggles.CrushPullAim:SetValue(false)
										end)

										return
									end

									getgenv()._crushAimOn = crushAimOn
								end,
							})

							Extra:AddDropdown("CrushPullMode", {
								Values = { "Looking", "Silent Aim", "Lock On", "Last Hit" },
								Default = "Silent Aim",
								Text = "Crushing Pull Mode",
								Disabled = flag26,
								Tooltip = flag26 and "your executor doesn't support this (needs metatable hooks)" or "Looking = crosshair | Silent Aim = lowest health | Lock On = crosshair (needs Lock-on) | Last Hit = your last M1 target if in range, else closest",
								Callback = function()
								end,
							})

							table.insert(tbl24, function()
								getgenv()._crushAimOn = false

								pcall(function()
									if toggles.CrushPullAim then
										toggles.CrushPullAim:SetValue(false)
									end
								end)
							end)

							local flag27 = type(getrawmetatable) == "function" and type(setreadonly) == "function" and type(newcclosure) == "function" and type(getnamecallmethod) == "function"
							local flag28 = false
							local namecall = nil
							local v51 = nil

							local function fn101()
								if flag28 or not flag27 then
									return
								end

								pcall(function()
									v51 = getrawmetatable(game)
									setreadonly(v51, false)
									namecall = v51.__namecall

									v51.__namecall = newcclosure(function(arg, ...)
										local v52 = table.pack(...)
										if getnamecallmethod() ~= "FireServer" then
											return namecall(arg, ...)
										end
										local tbl37 = { ... }
										if type(tbl37[1]) == "table" and tbl37[1].Goal == "ReportPing" then
											tbl37[1].ms = tonumber(options.PingSpoofMs and options.PingSpoofMs.Value) or 0
											return namecall(arg, unpack(tbl37))
										end
										return namecall(arg, table.unpack(v52, 1, v52.n))
									end)

									setreadonly(v51, true)
									flag28 = true
								end)
							end

							local function fn102()
								if not flag28 or not v51 or not namecall then
									return
								end

								pcall(function()
									setreadonly(v51, false)
									v51.__namecall = namecall
									setreadonly(v51, true)
								end)

								flag28 = false
								namecall = nil
							end

							local v52 = Leaderboard
							local addToggle3 = v52.AddToggle
							local flag29 = not flag27

							addToggle3(v52, "PingSpoof", {
								Text = "Ping Spoofer",
								Default = false,
								Disabled = flag29,
								Tooltip = flag29 and "your executor doesn't support this" or nil,
								Callback = function(arg)
									if not flag27 then
										pcall(function()
											toggles.PingSpoof:SetValue(false)
										end)

										return
									end

									if arg then
										fn101()
									else
										fn102()
									end
								end,
							})

							Leaderboard:AddInput("PingSpoofMs", {
								Text = "Spoofed Ping (ms)",
								Default = "0",
								Placeholder = "Enter ms...",
								Numeric = true,
								Disabled = flag29,
								Tooltip = flag29 and "your executor doesn't support this" or nil,
							})

							table.insert(tbl24, function()
								pcall(function()
									toggles.PingSpoof:SetValue(false)
								end)

								fn102()
							end)
						end

						local tbl34 = {
							Bald = { "10469493270", "10469630950", "10469639222", "10469643643" },
							Hunter = { "13532562418", "13532600125", "13532604085", "13294471966" },
							Monster = { "122482492364036", "125882667406347", "134822631853770", "76602138940033" },
							ZombieAxe = { "125361499827663", "105701432344953", "104293439261333", "114460992057353" },
							ZombieDeagle = { "111644455066361", "112778933066374", "80488470577181", "117726521294150" },
							ZombieShotgun = { "97702234977209", "136834606687014", "137556620675474", "115406134600395" },
							Purple = { "17889458563", "17889461810", "17889471098", "17889290569" },
							Cyborg = { "13491635433", "13296577783", "13295919399", "13295936866" },
							Ninja = { "13370310513", "13390230973", "13378751717", "13378708199" },
							Batter = { "14004222985", "13997092940", "14001963401", "14136436157" },
							Blade = { "15259161390", "15240216931", "15240176873", "15162694192" },
							Esper = { "16515503507", "16515520431", "16515448089", "16552234590" },
							KJ = { "17325510002", "17325513870", "17325522388", "17325537719" },
							Tech = { "123005629431309", "100059874351664", "104895379416342", "134775406437626" },
							Lightning = { "89044067797964", "74334194837918", "94353845974131", "80601239139774" },
							Brother = { "105509665019040", "112557609215008", "91771160499452", "120026952948332" },
							Emerge = { "132868185794966", "116239885597558", "", "89443748022966" },
						}

						local tbl35 = {}

						for _, v49 in pairs(tbl34) do
							for i, v50 in ipairs(v49) do
								tbl35[v50] = i
							end
						end

						local tbl36 = {
							"Default",
							"Random",
							"Saitama",
							"Garou",
							"Suiryu",
							"Genos",
							"Sonic",
							"Metal Bat",
							"Atomic Samurai",
							"Tatsumaki",
							"KJ",
							"Child Emperor",
							"Lightning Max",
							"My Brother",
							"Monster Garou",
							"Zombie Man (Axe)",
							"Zombie Man (Deagle)",
							"Zombie Man (Shotgun)",
							"Emerge",
						}

						local tbl37 = {
							"Bald",
							"Hunter",
							"Purple",
							"Cyborg",
							"Ninja",
							"Batter",
							"Blade",
							"Esper",
							"KJ",
							"Tech",
							"Lightning",
						}

						local revLabelToAttr = {
							Saitama = "Bald",
							Garou = "Hunter",
							["Monster Garou"] = "Monster",
							Suiryu = "Purple",
							Genos = "Cyborg",
							Sonic = "Ninja",
							["Metal Bat"] = "Batter",
							["Atomic Samurai"] = "Blade",
							Tatsumaki = "Esper",
							KJ = "KJ",
							["Child Emperor"] = "Tech",
							["Lightning Max"] = "Lightning",
							["My Brother"] = "Brother",
							Emerge = "Emerge",
							["Zombie Man (Axe)"] = "ZombieAxe",
							["Zombie Man (Deagle)"] = "ZombieDeagle",
							["Zombie Man (Shotgun)"] = "ZombieShotgun",
						}

						getgenv()._RevLabelToAttr = revLabelToAttr
						v34:AddToggle("CustomM1Enabled", { Text = "Enable Custom M1's", Default = false })
						v34:AddDivider({ Text = "M1" })

						for i = 1, 4 do
							local tbl38

							if i ~= 3 then
								tbl38 = tbl36
							else
								tbl38 = {}

								for _, v49 in ipairs(tbl36) do
									if v49 ~= "Emerge" then
										table.insert(tbl38, v49)
									end
								end
							end

							v34:AddDropdown("CustomM1_Slot" .. i, { Text = "M" .. i, Values = tbl38, Default = 1, Multi = false, Searchable = false })
						end

						local flag25 = false
						local connection22 = nil
						local v49 = nil
						local v50 = nil
						local tbl38 = {}
						local connection23 = nil
						local n15 = 0

						local function fn94(arg)
							flag25 = (arg == "The Strongest" or arg == "The Fallen") and arg or false

							local function fn95(arg2)
								if not arg2 then
									return
								end

								for _, descendant in ipairs(arg2:GetDescendants()) do
									if descendant:GetAttribute("RevTS") then
										pcall(function()
											descendant:Destroy()
										end)
									end
								end
							end

							local function fn96()
								local sounds

								pcall(function()
									local SoundService = game:GetService("SoundService")
									sounds = SoundService:FindFirstChild("Sounds")

									if not sounds then
										for _, descendant in ipairs(SoundService:GetDescendants()) do
											if descendant:IsA("SoundGroup") and descendant.Name == "Sounds" then
												sounds = descendant
												break
											end
										end
									end
								end)

								return sounds
							end

							local function fn97(arg2)
								if not arg2 then
									return
								end
								fn95(arg2)
								local emotes = game:GetService("ReplicatedStorage"):FindFirstChild("Emotes")
								emotes = emotes and emotes:FindFirstChild("TheStrongestEmote")
								if not emotes then
									return
								end

								for _, child in ipairs(emotes:GetChildren()) do
									local v51 = arg2:FindFirstChild(child.Name)

									if v51 and v51:IsA("BasePart") then
										for _, child2 in ipairs(child:GetChildren()) do
											pcall(function()
												local clone2 = child2:Clone()
												clone2:SetAttribute("RevTS", true)

												for _, descendant in ipairs(clone2:GetDescendants()) do
													descendant:SetAttribute("RevTS", true)
												end

												clone2.Parent = v51
											end)
										end
									end
								end

								local v51 = fn96()

								for _, v52 in ipairs({ "Right Arm", "Left Arm" }) do
									local v53 = arg2:FindFirstChild(v52)

									if v53 then
										pcall(function()
											local sound = Instance.new("Sound")
											sound.Name = "Sound"
											sound.SoundId = "rbxassetid://85969902040488"
											sound.Looped = true
											sound.Volume = 0.1
											sound.RollOffMode = Enum.RollOffMode.Inverse
											sound.RollOffMinDistance = 10
											sound.RollOffMaxDistance = 300
											sound.PlaybackSpeed = 0.92 + math.random() * 0.09
											sound.SoundGroup = v51
											sound:SetAttribute("RevTS", true)
											sound.Parent = v53
											sound:Play()
										end)
									end
								end
							end

							local function fn98()
								local attachment = Instance.new("Attachment")
								attachment.Name = "Divergence"
								local particleEmitter = Instance.new("ParticleEmitter")
								particleEmitter.Name = "3"
								particleEmitter.Texture = "rbxassetid://120113319582099"
								particleEmitter.Rate = 20
								particleEmitter.Enabled = false
								particleEmitter.Lifetime = NumberRange.new(0.1, 0.3)
								particleEmitter.Speed = NumberRange.new(5, 25)
								particleEmitter.Rotation = NumberRange.new(-180, 180)
								particleEmitter.RotSpeed = NumberRange.new(0, 0)
								particleEmitter.SpreadAngle = Vector2.new(360, 360)
								particleEmitter.Drag = 10
								particleEmitter.LightEmission = 0.75
								particleEmitter.LightInfluence = 0
								particleEmitter.ZOffset = 0
								local new = NumberSequenceKeypoint.new
								particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0.625), new(1, 2.25, 0.625) })
								local new2 = NumberSequenceKeypoint.new
								particleEmitter.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new2(1, 0, 0) })
								local new3 = ColorSequenceKeypoint.new
								local color = Color3.new
								particleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.341176, 0.768627, 1)), new3(1, color(0, 0, 0)) })
								particleEmitter.Acceleration = Vector3.zero
								particleEmitter.EmissionDirection = Enum.NormalId.Top
								particleEmitter.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera
								particleEmitter.TimeScale = 1
								local new4 = NumberSequenceKeypoint.new
								particleEmitter.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new4(1, 0, 0) })
								particleEmitter.Brightness = 13
								particleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
								particleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter.FlipbookStartRandom = false
								particleEmitter.VelocityInheritance = 0
								particleEmitter.WindAffectsDrag = false
								particleEmitter.LockedToPart = false
								particleEmitter.Parent = attachment
								local particleEmitter2 = Instance.new("ParticleEmitter")
								particleEmitter2.Name = "2"
								particleEmitter2.Texture = "rbxassetid://11846119288"
								particleEmitter2.Rate = 20
								particleEmitter2.Enabled = false
								particleEmitter2.Lifetime = NumberRange.new(0.1, 0.3)
								particleEmitter2.Speed = NumberRange.new(30, 40)
								particleEmitter2.Rotation = NumberRange.new(0, 0)
								particleEmitter2.RotSpeed = NumberRange.new(0, 0)
								particleEmitter2.SpreadAngle = Vector2.new(360, 360)
								particleEmitter2.Drag = 10
								particleEmitter2.LightEmission = 0
								particleEmitter2.LightInfluence = 0
								particleEmitter2.ZOffset = 0.5
								local new5 = NumberSequenceKeypoint.new
								particleEmitter2.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0.625), new5(1, 2.25, 0.625) })
								local new6 = NumberSequenceKeypoint.new
								particleEmitter2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new6(1, 0, 0) })
								local new7 = ColorSequenceKeypoint.new
								local color2 = Color3.new
								particleEmitter2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.482353, 0.792157, 1)), new7(1, color2(0, 0, 0)) })
								particleEmitter2.Acceleration = Vector3.zero
								particleEmitter2.EmissionDirection = Enum.NormalId.Top
								particleEmitter2.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter2.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter2.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter2.Orientation = Enum.ParticleOrientation.VelocityParallel
								particleEmitter2.TimeScale = 1
								local new8 = NumberSequenceKeypoint.new
								particleEmitter2.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, -0.45, 0.4125), new8(1, -0.525, 0.3375) })
								particleEmitter2.Brightness = 13
								particleEmitter2.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
								particleEmitter2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter2.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter2.FlipbookStartRandom = false
								particleEmitter2.VelocityInheritance = 0
								particleEmitter2.WindAffectsDrag = false
								particleEmitter2.LockedToPart = false
								particleEmitter2.Parent = attachment
								local particleEmitter3 = Instance.new("ParticleEmitter")
								particleEmitter3.Name = "3"
								particleEmitter3.Texture = "rbxassetid://17705152037"
								particleEmitter3.Rate = 20
								particleEmitter3.Enabled = false
								particleEmitter3.Lifetime = NumberRange.new(0.1, 0.3)
								particleEmitter3.Speed = NumberRange.new(5, 25)
								particleEmitter3.Rotation = NumberRange.new(-180, 180)
								particleEmitter3.RotSpeed = NumberRange.new(0, 0)
								particleEmitter3.SpreadAngle = Vector2.new(360, 360)
								particleEmitter3.Drag = 10
								particleEmitter3.LightEmission = 0
								particleEmitter3.LightInfluence = 0
								particleEmitter3.ZOffset = 0
								local new9 = NumberSequenceKeypoint.new
								particleEmitter3.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0.625), new9(1, 2.25, 0.625) })
								local new10 = NumberSequenceKeypoint.new
								particleEmitter3.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new10(1, 0, 0) })
								local new11 = ColorSequenceKeypoint.new
								local color3 = Color3.new
								particleEmitter3.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), new11(1, color3(0, 0, 0)) })
								particleEmitter3.Acceleration = Vector3.zero
								particleEmitter3.EmissionDirection = Enum.NormalId.Top
								particleEmitter3.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter3.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter3.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter3.Orientation = Enum.ParticleOrientation.FacingCamera
								particleEmitter3.TimeScale = 1
								local new12 = NumberSequenceKeypoint.new
								particleEmitter3.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new12(1, 0, 0) })
								particleEmitter3.Brightness = 13
								particleEmitter3.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
								particleEmitter3.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter3.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter3.FlipbookStartRandom = false
								particleEmitter3.VelocityInheritance = 0
								particleEmitter3.WindAffectsDrag = false
								particleEmitter3.LockedToPart = false
								particleEmitter3.Parent = attachment
								local particleEmitter4 = Instance.new("ParticleEmitter")
								particleEmitter4.Name = "1"
								particleEmitter4.Texture = "rbxassetid://106157690415710"
								particleEmitter4.Rate = 20
								particleEmitter4.Enabled = false
								particleEmitter4.Lifetime = NumberRange.new(0.1, 0.3)
								particleEmitter4.Speed = NumberRange.new(5, 10)
								particleEmitter4.Rotation = NumberRange.new(-180, 180)
								particleEmitter4.RotSpeed = NumberRange.new(0, 0)
								particleEmitter4.SpreadAngle = Vector2.new(360, 360)
								particleEmitter4.Drag = 10
								particleEmitter4.LightEmission = 0
								particleEmitter4.LightInfluence = 0
								particleEmitter4.ZOffset = 0
								local numberSequence = NumberSequence.new
								local tbl39 = {}
								local v51 = NumberSequenceKeypoint.new(0, 1, 0.625)
								local v52 = NumberSequenceKeypoint.new(0.119701, 1.75, 0.625)
								local v53 = NumberSequenceKeypoint.new(0.488778, 3.25, 0.625)
								local new13 = NumberSequenceKeypoint.new
								tbl39[1] = v51
								tbl39[2] = v52
								tbl39[3] = v53

								do
									local values = table.pack(new13(1, 4.6875, 0.625))
									table.move(values, 1, values.n, 4, tbl39)
								end

								particleEmitter4.Size = numberSequence(tbl39)
								local new14 = NumberSequenceKeypoint.new
								particleEmitter4.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.36875, 0), new14(1, 1, 0) })
								local new15 = ColorSequenceKeypoint.new
								local color4 = Color3.new
								particleEmitter4.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), new15(1, color4(0, 0, 0)) })
								particleEmitter4.Acceleration = Vector3.zero
								particleEmitter4.EmissionDirection = Enum.NormalId.Top
								particleEmitter4.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter4.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter4.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter4.Orientation = Enum.ParticleOrientation.FacingCamera
								particleEmitter4.TimeScale = 1
								local new16 = NumberSequenceKeypoint.new
								particleEmitter4.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new16(1, 0, 0) })
								particleEmitter4.Brightness = 13
								particleEmitter4.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
								particleEmitter4.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter4.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter4.FlipbookStartRandom = false
								particleEmitter4.VelocityInheritance = 0
								particleEmitter4.WindAffectsDrag = false
								particleEmitter4.LockedToPart = false
								particleEmitter4.Parent = attachment
								local particleEmitter5 = Instance.new("ParticleEmitter")
								particleEmitter5.Name = "1"
								particleEmitter5.Texture = "rbxassetid://106157690415710"
								particleEmitter5.Rate = 20
								particleEmitter5.Enabled = false
								particleEmitter5.Lifetime = NumberRange.new(0.1, 0.3)
								particleEmitter5.Speed = NumberRange.new(5, 10)
								particleEmitter5.Rotation = NumberRange.new(-180, 180)
								particleEmitter5.RotSpeed = NumberRange.new(0, 0)
								particleEmitter5.SpreadAngle = Vector2.new(360, 360)
								particleEmitter5.Drag = 10
								particleEmitter5.LightEmission = 1
								particleEmitter5.LightInfluence = 0
								particleEmitter5.ZOffset = 0
								local numberSequence2 = NumberSequence.new
								local tbl40 = {}
								local v54 = NumberSequenceKeypoint.new(0, 1, 0.625)
								local v55 = NumberSequenceKeypoint.new(0.119701, 1.75, 0.625)
								local v56 = NumberSequenceKeypoint.new(0.488778, 3.25, 0.625)
								local new17 = NumberSequenceKeypoint.new
								tbl40[1] = v54
								tbl40[2] = v55
								tbl40[3] = v56

								do
									local values = table.pack(new17(1, 4.6875, 0.625))
									table.move(values, 1, values.n, 4, tbl40)
								end

								particleEmitter5.Size = numberSequence2(tbl40)
								local new18 = NumberSequenceKeypoint.new
								particleEmitter5.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.8875, 0), new18(1, 1, 0) })
								local new19 = ColorSequenceKeypoint.new
								local color5 = Color3.new

								particleEmitter5.Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Color3.new(0.45098, 0.992157, 1)),
									new19(1, color5(0.45098, 0.992157, 1)),
								})

								particleEmitter5.Acceleration = Vector3.zero
								particleEmitter5.EmissionDirection = Enum.NormalId.Top
								particleEmitter5.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter5.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter5.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter5.Orientation = Enum.ParticleOrientation.FacingCamera
								particleEmitter5.TimeScale = 1
								local new20 = NumberSequenceKeypoint.new
								particleEmitter5.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new20(1, 0, 0) })
								particleEmitter5.Brightness = 13
								particleEmitter5.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
								particleEmitter5.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter5.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter5.FlipbookStartRandom = false
								particleEmitter5.VelocityInheritance = 0
								particleEmitter5.WindAffectsDrag = false
								particleEmitter5.LockedToPart = false
								particleEmitter5.Parent = attachment
								local particleEmitter6 = Instance.new("ParticleEmitter")
								particleEmitter6.Name = "2"
								particleEmitter6.Texture = "rbxassetid://15611030633"
								particleEmitter6.Rate = 20
								particleEmitter6.Enabled = false
								particleEmitter6.Lifetime = NumberRange.new(0.1, 0.3)
								particleEmitter6.Speed = NumberRange.new(10, 15)
								particleEmitter6.Rotation = NumberRange.new(0, 0)
								particleEmitter6.RotSpeed = NumberRange.new(0, 0)
								particleEmitter6.SpreadAngle = Vector2.new(360, 360)
								particleEmitter6.Drag = 5
								particleEmitter6.LightEmission = 0
								particleEmitter6.LightInfluence = 0
								particleEmitter6.ZOffset = 0
								local new21 = NumberSequenceKeypoint.new
								particleEmitter6.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0.625), new21(1, 2.25, 0.625) })
								local new22 = NumberSequenceKeypoint.new
								particleEmitter6.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new22(1, 0, 0) })
								local new23 = ColorSequenceKeypoint.new
								local color6 = Color3.new
								particleEmitter6.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.482353, 0.792157, 1)), new23(1, color6(0, 0, 0)) })
								particleEmitter6.Acceleration = Vector3.zero
								particleEmitter6.EmissionDirection = Enum.NormalId.Top
								particleEmitter6.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter6.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter6.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter6.Orientation = Enum.ParticleOrientation.FacingCameraWorldUp
								particleEmitter6.TimeScale = 1
								local new24 = NumberSequenceKeypoint.new
								particleEmitter6.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.225, 0.4125), new24(1, 0.1125, 0.3375) })
								particleEmitter6.Brightness = 13
								particleEmitter6.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
								particleEmitter6.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter6.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter6.FlipbookStartRandom = false
								particleEmitter6.VelocityInheritance = 0
								particleEmitter6.WindAffectsDrag = false
								particleEmitter6.LockedToPart = false
								particleEmitter6.Parent = attachment
								local particleEmitter7 = Instance.new("ParticleEmitter")
								particleEmitter7.Name = "1"
								particleEmitter7.Texture = "rbxassetid://8663278927"
								particleEmitter7.Rate = 20
								particleEmitter7.Enabled = false
								particleEmitter7.Lifetime = NumberRange.new(0.2, 0.2)
								particleEmitter7.Speed = NumberRange.new(0.001, 0.001)
								particleEmitter7.Rotation = NumberRange.new(-180, 180)
								particleEmitter7.RotSpeed = NumberRange.new(0, 0)
								particleEmitter7.SpreadAngle = Vector2.new(360, 360)
								particleEmitter7.Drag = 0
								particleEmitter7.LightEmission = 1
								particleEmitter7.LightInfluence = 0
								particleEmitter7.ZOffset = 1
								local numberSequence3 = NumberSequence.new
								local tbl41 = {}
								local v57 = NumberSequenceKeypoint.new(0, 1, 0.625)
								local v58 = NumberSequenceKeypoint.new(0.119701, 1.75, 0.625)
								local v59 = NumberSequenceKeypoint.new(0.488778, 3.25, 0.625)
								local new25 = NumberSequenceKeypoint.new
								tbl41[1] = v57
								tbl41[2] = v58
								tbl41[3] = v59

								do
									local values = table.pack(new25(1, 4.6875, 0.625))
									table.move(values, 1, values.n, 4, tbl41)
								end

								particleEmitter7.Size = numberSequence3(tbl41)
								local numberSequence4 = NumberSequence.new
								local tbl42 = {}
								local v60 = NumberSequenceKeypoint.new(0, 1, 0)
								local v61 = NumberSequenceKeypoint.new(0.223192, 0.89375, 0)
								local new26 = NumberSequenceKeypoint.new
								tbl42[1] = v60
								tbl42[2] = v61

								do
									local values = table.pack(new26(1, 1, 0))
									table.move(values, 1, values.n, 3, tbl42)
								end

								particleEmitter7.Transparency = numberSequence4(tbl42)
								local new27 = ColorSequenceKeypoint.new
								local color7 = Color3.new

								particleEmitter7.Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Color3.new(0.45098, 0.992157, 1)),
									new27(1, color7(0.45098, 0.992157, 1)),
								})

								particleEmitter7.Acceleration = Vector3.zero
								particleEmitter7.EmissionDirection = Enum.NormalId.Top
								particleEmitter7.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter7.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter7.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter7.Orientation = Enum.ParticleOrientation.FacingCamera
								particleEmitter7.TimeScale = 1
								local new28 = NumberSequenceKeypoint.new
								particleEmitter7.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new28(1, 0, 0) })
								particleEmitter7.Brightness = 15
								particleEmitter7.FlipbookLayout = Enum.ParticleFlipbookLayout.None
								particleEmitter7.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter7.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter7.FlipbookStartRandom = false
								particleEmitter7.VelocityInheritance = 0
								particleEmitter7.WindAffectsDrag = false
								particleEmitter7.LockedToPart = false
								particleEmitter7.Parent = attachment
								local particleEmitter8 = Instance.new("ParticleEmitter")
								particleEmitter8.Name = "1"
								particleEmitter8.Texture = "rbxassetid://12906276200"
								particleEmitter8.Rate = 20
								particleEmitter8.Enabled = false
								particleEmitter8.Lifetime = NumberRange.new(0.1, 0.2)
								particleEmitter8.Speed = NumberRange.new(5, 10)
								particleEmitter8.Rotation = NumberRange.new(-180, 180)
								particleEmitter8.RotSpeed = NumberRange.new(0, 0)
								particleEmitter8.SpreadAngle = Vector2.new(360, 360)
								particleEmitter8.Drag = 10
								particleEmitter8.LightEmission = 1
								particleEmitter8.LightInfluence = 0
								particleEmitter8.ZOffset = 0
								local numberSequence5 = NumberSequence.new
								local tbl43 = {}
								local v62 = NumberSequenceKeypoint.new(0, 1, 0.625)
								local v63 = NumberSequenceKeypoint.new(0.119701, 1.75, 0.625)
								local v64 = NumberSequenceKeypoint.new(0.488778, 3.25, 0.625)
								local new29 = NumberSequenceKeypoint.new
								tbl43[1] = v62
								tbl43[2] = v63
								tbl43[3] = v64

								do
									local values = table.pack(new29(1, 4.6875, 0.625))
									table.move(values, 1, values.n, 4, tbl43)
								end

								particleEmitter8.Size = numberSequence5(tbl43)
								local new30 = NumberSequenceKeypoint.new
								particleEmitter8.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new30(1, 1, 0) })
								local new31 = ColorSequenceKeypoint.new
								local color8 = Color3.new

								particleEmitter8.Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Color3.new(0.45098, 0.992157, 1)),
									new31(1, color8(0.45098, 0.992157, 1)),
								})

								particleEmitter8.Acceleration = Vector3.zero
								particleEmitter8.EmissionDirection = Enum.NormalId.Top
								particleEmitter8.Shape = Enum.ParticleEmitterShape.Box
								particleEmitter8.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
								particleEmitter8.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
								particleEmitter8.Orientation = Enum.ParticleOrientation.FacingCamera
								particleEmitter8.TimeScale = 1
								local new32 = NumberSequenceKeypoint.new
								particleEmitter8.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), new32(1, 0, 0) })
								particleEmitter8.Brightness = 15
								particleEmitter8.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
								particleEmitter8.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
								particleEmitter8.FlipbookFramerate = NumberRange.new(1, 1)
								particleEmitter8.FlipbookStartRandom = false
								particleEmitter8.VelocityInheritance = 0
								particleEmitter8.WindAffectsDrag = false
								particleEmitter8.LockedToPart = false
								particleEmitter8.Parent = attachment
								return attachment, 8
							end

							local function fn99(arg2, arg3)
								local match, v51 = arg2:match("^(.-);;(.+)$")
								local num = tonumber(v51)
								local live = workspace:FindFirstChild("Live")
								if not match or not live then
									return
								end
								local character = localPlayer3.Character
								local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
								local tbl39 = {}

								local function fn100(arg4)
									if tbl39[arg4] then
										return
									end
									tbl39[arg4] = true
									arg3(arg4)
								end

								local tbl40 = {}
								local tbl41 = {}

								for _, child in ipairs(live:GetChildren()) do
									if child ~= character then
										local flag26 = child.Name == match

										if flag26 then
											tbl40[#tbl40 + 1] = child
										end

										local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart")

										if flag26 or humanoidRootPart3 and humanoidRootPart2 and (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude <= 30 then
											tbl41[#tbl41 + 1] = child
										end
									end
								end

								if #tbl40 == 1 then
									fn100(tbl40[1])
								end

								if not num then
									return
								end

								local function fn101(arg4)
									local attribute = arg4:GetAttribute("LastDamage")
									local flag26 = type(attribute) == "number" and math.abs(attribute - num) < 0.02

									if flag26 then
										local name = localPlayer3.Name
										flag26 = arg4:GetAttribute("LastHit") == name
									end

									return flag26
								end

								local tbl42 = {}

								for _, v52 in ipairs(tbl41) do
									if fn101(v52) then
										fn100(v52)
									elseif not tbl39[v52] then
										tbl42[#tbl42 + 1] = v52.AttributeChanged:Connect(function(attribute)
											if (attribute == "LastDamage" or attribute == "LastHit") and fn101(v52) then
												fn100(v52)
											end
										end)
									end
								end

								task.delay(1, function()
									for _, v52 in ipairs(tbl42) do
										v52:Disconnect()
									end
								end)
							end

							local function fn100(arg2)
								local torso = arg2 and (arg2:FindFirstChild("Torso") or arg2:FindFirstChild("UpperTorso") or arg2:FindFirstChild("HumanoidRootPart"))
								if not torso then
									return
								end
								local ok, result = pcall(fn98)
								if not ok or not result then
									return
								end
								result:SetAttribute("RevTS", true)
								result.Position = Vector3.zero
								result.Parent = torso

								for _, child in ipairs(result:GetChildren()) do
									if child:IsA("ParticleEmitter") then
										child:Emit(5)
									end
								end

								game:GetService("Debris"):AddItem(result, 1)
								local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 then
									pcall(function()
										local tbl39 = { "rbxassetid://90480088521519", "rbxassetid://88293720607171" }
										local sound = Instance.new("Sound")
										sound.Name = "Sound"
										sound.SoundId = tbl39[math.random(1, #tbl39)]
										sound.Volume = 2
										sound.PlaybackSpeed = 0.95 + math.random() * 0.06
										sound.RollOffMode = Enum.RollOffMode.Inverse
										sound.RollOffMinDistance = 10
										sound.RollOffMaxDistance = 300
										sound.SoundGroup = fn96()
										sound:SetAttribute("RevTS", true)
										sound.Parent = humanoidRootPart2
										sound:Play()
										game:GetService("Debris"):AddItem(sound, 3)
									end)
								end
							end

							local function createPart2()
								local part3 = Instance.new("Part")
								part3.Name = "SlashPart"
								part3.Size = Vector3.new(8, 8, 8)
								part3.Transparency = 1
								part3.CanCollide = false
								part3.CanTouch = false
								part3.CanQuery = false
								part3.Massless = true
								local tbl39 = {}

								local tbl40 = {
									Texture = "rbxassetid://112652574879204",
									Lifetime = NumberRange.new(0.05, 0.08),
									Speed = NumberRange.new(0.01),
								}

								local numberSequence = NumberSequence.new
								local tbl41 = {}
								local v51 = NumberSequenceKeypoint.new(0, 0)
								local v52 = NumberSequenceKeypoint.new(0.1446, 4.5, 1.5)
								local new = NumberSequenceKeypoint.new
								tbl41[1] = v51
								tbl41[2] = v52

								do
									local values = table.pack(new(1, 0))
									table.move(values, 1, values.n, 3, tbl41)
								end

								tbl40.Size = numberSequence(tbl41)
								local numberSequence2 = NumberSequence.new
								local tbl42 = {}
								local v53 = NumberSequenceKeypoint.new(0, 0)
								local v54 = NumberSequenceKeypoint.new(0.3959, 1.7625, 0.6375)
								local new2 = NumberSequenceKeypoint.new
								tbl42[1] = v53
								tbl42[2] = v54

								do
									local values = table.pack(new2(1, 0))
									table.move(values, 1, values.n, 3, tbl42)
								end

								tbl40.Squash = numberSequence2(tbl42)
								tbl40.Orientation = Enum.ParticleOrientation.VelocityParallel
								tbl40.Brightness = 25

								local tbl43 = {
									Texture = "rbxassetid://111208514446630",
									Lifetime = NumberRange.new(0.06),
									Speed = NumberRange.new(0.01),
									LightEmission = 0.5,
								}

								local numberSequence3 = NumberSequence.new
								local tbl44 = {}
								local v55 = NumberSequenceKeypoint.new(0, 0)
								local v56 = NumberSequenceKeypoint.new(0.1194, 3.5)
								local new3 = NumberSequenceKeypoint.new
								tbl44[1] = v55
								tbl44[2] = v56

								do
									local values = table.pack(new3(1, 0))
									table.move(values, 1, values.n, 3, tbl44)
								end

								tbl43.Size = numberSequence3(tbl44)
								local numberSequence4 = NumberSequence.new
								local tbl45 = {}
								local v57 = NumberSequenceKeypoint.new(0, 0)
								local v58 = NumberSequenceKeypoint.new(0.1306, 1.9125, 1.0875)
								local new4 = NumberSequenceKeypoint.new
								tbl45[1] = v57
								tbl45[2] = v58

								do
									local values = table.pack(new4(1, -1.2375))
									table.move(values, 1, values.n, 3, tbl45)
								end

								tbl43.Squash = numberSequence4(tbl45)
								tbl43.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
								tbl43.Brightness = 6
								local new5 = NumberSequenceKeypoint.new
								local new6 = NumberSequenceKeypoint.new

								local tbl46 = {
									Texture = "rbxassetid://14007518610",
									Lifetime = NumberRange.new(0.08, 0.38),
									Speed = NumberRange.new(25, 50),
									RotSpeed = NumberRange.new(-340, 340),
									Drag = 12,
									LightEmission = -4,
									Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.1875, 0.4375), new5(1, 0) }),
									Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new6(1, 0, 0.975) }),
									Brightness = 8,
								}

								local tbl47 = {
									Texture = "rbxassetid://122940175232612",
									Lifetime = NumberRange.new(0.06),
									Speed = NumberRange.new(0.01),
									LightEmission = -1,
								}

								local numberSequence5 = NumberSequence.new
								local tbl48 = {}
								local v59 = NumberSequenceKeypoint.new(0, 0)
								local v60 = NumberSequenceKeypoint.new(0.1194, 3.5)
								local new7 = NumberSequenceKeypoint.new
								tbl48[1] = v59
								tbl48[2] = v60

								do
									local values = table.pack(new7(1, 0))
									table.move(values, 1, values.n, 3, tbl48)
								end

								tbl47.Size = numberSequence5(tbl48)
								local numberSequence6 = NumberSequence.new
								local tbl49 = {}
								local v61 = NumberSequenceKeypoint.new(0, 0)
								local v62 = NumberSequenceKeypoint.new(0.13, -1.725, 1.0875)
								local new8 = NumberSequenceKeypoint.new
								tbl49[1] = v61
								tbl49[2] = v62

								do
									local values = table.pack(new8(1, -1.2375))
									table.move(values, 1, values.n, 3, tbl49)
								end

								tbl47.Squash = numberSequence6(tbl49)
								tbl47.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
								tbl47.Brightness = 5
								local new9 = NumberSequenceKeypoint.new

								local tbl50 = {
									Texture = "rbxassetid://76513104877614",
									Lifetime = NumberRange.new(0.3, 0.54),
									Speed = NumberRange.new(27, 45),
									RotSpeed = NumberRange.new(-240, 240),
									Drag = 6,
									LightEmission = -4,
									Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), new9(1, 0) }),
									Acceleration = Vector3.new(0, 10, 0),
									Brightness = 5,
									FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
									FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
								}

								tbl39[1] = tbl40
								tbl39[2] = tbl43
								tbl39[3] = tbl46
								tbl39[4] = tbl47
								tbl39[5] = tbl50

								for _, v63 in ipairs(tbl39) do
									local particleEmitter = Instance.new("ParticleEmitter")
									particleEmitter.Enabled = false
									particleEmitter.Rotation = NumberRange.new(-180, 180)
									particleEmitter.SpreadAngle = Vector2.new(360, 360)
									particleEmitter.LightInfluence = 0

									for k, v64 in pairs(v63) do
										particleEmitter[k] = v64
									end

									particleEmitter.Parent = part3
								end

								return part3
							end

							local function createParticleEmitter()
								local particleEmitter = Instance.new("ParticleEmitter")
								particleEmitter.Name = "Dismantle1"
								particleEmitter.Enabled = false
								particleEmitter.Texture = "rbxassetid://6820236400"
								particleEmitter.Lifetime = NumberRange.new(0.2)
								particleEmitter.Speed = NumberRange.new(0.625)
								particleEmitter.Rotation = NumberRange.new(0, 360)
								particleEmitter.LightEmission = 1
								particleEmitter.LightInfluence = 0
								particleEmitter.ZOffset = 1
								local new = NumberSequenceKeypoint.new
								particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 24.1875), new(1, 0) })
								particleEmitter.Transparency = NumberSequence.new(0.7)
								particleEmitter.Brightness = 2
								particleEmitter.LockedToPart = true
								return particleEmitter
							end

							local function fn101(arg2)
								local humanoidRootPart2 = arg2 and arg2:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart2 then
									return
								end

								pcall(function()
									local v51 = createPart2()
									v51:SetAttribute("RevTS", true)
									v51.CFrame = humanoidRootPart2.CFrame
									local weld = Instance.new("Weld")
									weld.Part0 = humanoidRootPart2
									weld.Part1 = v51
									weld.Parent = v51
									v51.Parent = workspace:FindFirstChild("Thrown") or workspace

									for _, child in ipairs(v51:GetChildren()) do
										if child:IsA("ParticleEmitter") then
											child:Emit(5)
										end
									end

									game:GetService("Debris"):AddItem(v51, 1)
								end)

								pcall(function()
									local v51 = nil

									for _, child in ipairs(humanoidRootPart2:GetChildren()) do
										if child.Name == "Dismantle1" and child:GetAttribute("RevTS") then
											v51 = child
											break
										else
											v51 = nil
										end
									end

									if not v51 then
										v51 = createParticleEmitter()
										v51:SetAttribute("RevTS", true)
										v51.Parent = humanoidRootPart2
									end

									v51:Emit(1)
								end)

								pcall(function()
									local tbl39 = { "rbxassetid://119802649482906", "rbxassetid://115867552885289", "rbxassetid://92843195815645" }
									local sound = Instance.new("Sound")
									sound.Name = "Sound"
									sound.SoundId = tbl39[math.random(1, #tbl39)]
									sound.Volume = 1.75
									sound.PlaybackSpeed = 0.95 + math.random() * 0.1
									sound.RollOffMode = Enum.RollOffMode.Inverse
									sound.RollOffMinDistance = 10
									sound.RollOffMaxDistance = 300
									sound.SoundGroup = fn96()
									sound:SetAttribute("RevTS", true)
									sound.Parent = humanoidRootPart2
									sound:Play()
									game:GetService("Debris"):AddItem(sound, 3)
								end)
							end

							local function fn102(arg2, arg3)
								if not arg2 then
									return
								end

								return arg2.AttributeChanged:Connect(function(attribute)
									if getgenv()._revTSGen ~= arg3 then
										return
									end

									if attribute ~= "LastM1Hitted" then
										return
									end

									if not flag25 then
										return
									end
									local attribute2 = arg2:GetAttribute(attribute)
									if type(attribute2) ~= "string" then
										return
									end

									if v50 == attribute2 then
										return
									end
									v50 = attribute2

									fn99(attribute2, function(arg4)
										if getgenv()._revTSGen ~= arg3 or not flag25 then
											return
										end

										if flag25 == "The Fallen" then
											fn101(arg4)
										else
											fn100(arg4)
										end
									end)
								end)
							end

							local function fn103(arg2)
								local v51 = tbl38[arg2]
								if not v51 or v51.released then
									return
								end
								v51.released = true

								if arg2.Parent then
									arg2.AssemblyLinearVelocity = Vector3.zero
									arg2.CanCollide = v51.collide
								end
							end

							local function fn104()
								for k, v51 in pairs(tbl38) do
									if k.Parent and not v51.released then
										k.AssemblyLinearVelocity = Vector3.zero
										k.CanCollide = v51.collide
									end

									tbl38[k] = nil
								end
							end

							local tbl39 = { Debris = true, SmallDebris = true, Stadium = true, Part = true }

							local tbl40 = {
								"rbxassetid://9125583990",
								"rbxassetid://9125584629",
								"rbxassetid://9125584634",
								"rbxassetid://9125584747",
							}

							local function fn105(arg2)
								if tbl39[arg2.Name] ~= true then
									return false
								end
								local assemblyRootPart = arg2.AssemblyRootPart

								if assemblyRootPart and assemblyRootPart ~= arg2 then
									local model = assemblyRootPart:FindFirstAncestorWhichIsA("Model")
									if model and model:FindFirstChildOfClass("Humanoid") then
										return false
									end
								end

								return true
							end

							local function fn106(parent)
								pcall(function()
									local sound = Instance.new("Sound")
									sound.Name = "Sound"
									sound.SoundId = tbl40[math.random(1, #tbl40)]
									sound.Volume = 0.8
									sound.PlaybackSpeed = 0.7 + math.random() * 0.3
									sound.RollOffMode = Enum.RollOffMode.Inverse
									sound.RollOffMinDistance = 10
									sound.RollOffMaxDistance = 85
									sound.SoundGroup = fn96()
									sound:SetAttribute("RevTS", true)
									sound.Parent = parent
									sound:Play()
									game:GetService("Debris"):AddItem(sound, 3)
								end)
							end

							local function fn107()
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								local thrown = workspace:FindFirstChild("Thrown")
								if not character or not thrown then
									return
								end
								local position = character.Position
								local now2 = os.clock()

								for _, descendant in ipairs(thrown:GetDescendants()) do
									local v51 = tbl38[descendant]

									if v51 and v51.released and now2 - v51.born > 7 then
										tbl38[descendant] = nil
										v51 = nil
									end

									if descendant:IsA("BasePart") and not descendant.Anchored and not v51 and not descendant:GetAttribute("RevTS") and fn105(descendant) and (descendant.Position - position).Magnitude <= 15 then
										tbl38[descendant] = {
											base = descendant.Position,
											rot = descendant.CFrame - descendant.CFrame.Position,
											height = 6 + math.random() * 4,
											phase = math.random() * 6.2832,
											spin = (math.random() - 0.5) * 2,
											t = 0,
											born = os.clock(),
											collide = descendant.CanCollide,
										}

										descendant.CanCollide = false
										fn106(descendant)
									end
								end
							end

							local function fn108(arg2)
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								local now2 = os.clock()

								for k, v51 in pairs(tbl38) do
									if not k.Parent then
										tbl38[k] = nil
									elseif not v51.released then
										if now2 - v51.born > 4 then
											fn103(k)
										elseif character and (v51.base - character.Position).Magnitude > 28 then
											fn103(k)
										else
											v51.t = math.min(v51.t + arg2 * 1.6, 1)
											local n16 = v51.base.Y + v51.height * (1 - (1 - v51.t) * (1 - v51.t)) + math.sin(now2 * 1.4 + v51.phase) * 0.5
											k.AssemblyLinearVelocity = Vector3.zero
											k.AssemblyAngularVelocity = Vector3.zero
											local rot = v51.rot
											k.CFrame = CFrame.new(v51.base.X, n16, v51.base.Z) * rot * CFrame.Angles(0, now2 * v51.spin, 0)
										end
									end
								end
							end

							local function fn109()
								if connection23 then
									pcall(function()
										connection23:Disconnect()
									end)

									connection23 = nil
								end

								fn104()

								if connection22 then
									pcall(function()
										connection22:Disconnect()
									end)

									connection22 = nil
								end

								if v49 then
									pcall(function()
										v49:Disconnect()
									end)

									v49 = nil
								end
							end

							if flag25 then
								fn109()
								getgenv()._revTSGen = (getgenv()._revTSGen or 0) + 1
								local revTSGen = getgenv()._revTSGen
								local flag26 = flag25 == "The Strongest"

								if flag26 then
									fn97(localPlayer3.Character)
								else
									fn95(localPlayer3.Character)
								end

								v49 = fn102(localPlayer3.Character, revTSGen)
								n15 = 0

								if flag26 then
									connection23 = RunService.Heartbeat:Connect(function(deltaTime)
										if getgenv()._revTSGen ~= revTSGen then
											return
										end

										if not flag25 then
											return
										end
										n15 += deltaTime

										if n15 >= 0.25 then
											n15 = 0
											fn107()
										end

										fn108(deltaTime)
									end)
								end

								if not connection22 then
									connection22 = localPlayer3.CharacterAdded:Connect(function(character)
										if getgenv()._revTSGen ~= revTSGen then
											return
										end

										if not flag25 then
											return
										end
										character:WaitForChild("Torso", 10)
										task.wait(0.6)

										if getgenv()._revTSGen == revTSGen and flag25 then
											if flag26 then
												fn97(character)
											end

											if v49 then
												pcall(function()
													v49:Disconnect()
												end)
											end

											v49 = fn102(character, revTSGen)
										end
									end)
								end
							else
								fn109()
								getgenv()._revTSGen = (getgenv()._revTSGen or 0) + 1
								fn95(localPlayer3.Character)
								v50 = nil
								local v51 = ipairs
								local children = workspace:FindFirstChild("Live") and workspace.Live:GetChildren() or {}

								for _, child in v51(children) do
									fn95(child)
								end
							end
						end

						v34:AddDropdown("QOLEffects", {
							Text = "QOL Effects",
							Values = { "None", "The Strongest", "The Fallen" },
							Default = 1,
							Multi = false,
							Callback = function(arg)
								fn94(arg)
							end,
						})

						table.insert(tbl24, function()
							pcall(function()
								fn94(false)
							end)
						end)

						local function fn95(arg)
							local v51 = options["CustomM1_Slot" .. arg]
							if not v51 or v51.Value == "Default" then
								return nil, nil
							end
							local v52

							if v51.Value == "Random" then
								v52 = tbl37[math.random(1, #tbl37)]
							else
								v52 = revLabelToAttr[v51.Value]
							end

							if not v52 then
								return nil, nil
							end
							local v53 = tbl34[v52]
							return v53 and v53[arg], v52
						end

						local connection24 = nil
						local v51 = nil
						local tbl39 = {}

						local function fn96()
							for _, v52 in pairs(tbl39) do
								pcall(function()
									if v52.IsPlaying then
										v52:Stop()
									end
								end)
							end

							table.clear(tbl39)
						end

						local function fn97(arg)
							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end

							fn96()
							v51 = arg
							if not arg then
								return
							end

							connection24 = arg.AnimationPlayed:Connect(function(arg2)
								if not toggles.CustomM1Enabled.Value then
									return
								end
								local match = (arg2.Animation and arg2.Animation.AnimationId or ""):match("%d+")
								if not match then
									return
								end
								local v52 = tbl35[match]
								if not v52 then
									return
								end
								local v53 = fn95(v52)
								if not v53 then
									return
								end

								if v53 == match then
									return
								end
								fn96()
								arg2:AdjustSpeed(0)
								arg2:AdjustWeight(-9999999, false)
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. v53
								local v54 = arg:LoadAnimation(animation)
								tbl39[#tbl39 + 1] = v54
								v54.Priority = Enum.AnimationPriority.Action3
								v54:Play(0)
							end)
						end

						local connection25 = RunService.Heartbeat:Connect(function()
							local character = localPlayer3.Character
							if not character then
								return
							end
							local humanoid = character:FindFirstChildOfClass("Humanoid")

							if humanoid ~= v51 then
								fn97(humanoid)
							end
						end)

						table.insert(tbl24, function()
							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end

							if connection25 then
								connection25:Disconnect()
								connection25 = nil
							end

							fn96()
							v51 = nil

							pcall(function()
								toggles.CustomM1Enabled:SetValue(false)
							end)
						end)

						v34:AddDivider({ Text = "Downslam" })
						v34:AddToggle("CustomDownslamEnabled", { Text = "Enable Custom Downslam", Default = false })

						v34:AddDropdown("CustomDownslam_Anim", {
							Text = "Custom Downslam",
							Values = { "Default", "Random", "Flip", "Down Fall", "Hard Press", "Useless" },
							Default = 1,
							Multi = false,
							Searchable = false,
						})

						local connection26 = nil
						local v52 = nil

						local tbl40 = {
							Flip = { id = "17859055671", timePos = 0.1, speed = 2 },
							["Down Fall"] = { id = "17858878027", timePos = 0.25, speed = nil },
							["Hard Press"] = { id = "18464356233", timePos = 0.5, speed = 3 },
							Useless = { id = "16571909908", timePos = 2.25, speed = 0.75 },
						}

						local function fn98(arg)
							if connection26 then
								connection26:Disconnect()
								connection26 = nil
							end

							v52 = arg
							if not arg then
								return
							end

							connection26 = arg.AnimationPlayed:Connect(function(arg2)
								if not toggles.CustomDownslamEnabled.Value then
									return
								end

								if not (arg2.Animation and arg2.Animation.AnimationId or ""):match("10470104242") then
									return
								end
								local str10 = options.CustomDownslam_Anim and options.CustomDownslam_Anim.Value or "Default"

								if str10 == "Random" then
									local tbl41 = { "Flip", "Down Fall", "Hard Press", "Useless" }
									str10 = tbl41[math.random(1, #tbl41)]
								end

								local v53 = tbl40[str10]
								if not v53 then
									return
								end
								arg2:AdjustWeight(-9999999, false)
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. v53.id
								local v54 = arg:LoadAnimation(animation)
								v54.Priority = Enum.AnimationPriority.Action3
								v54:Play(0.1)

								if v53.speed then
									v54:AdjustSpeed(v53.speed)
								end

								if v53.timePos then
									v54.TimePosition = v53.timePos
								end

								arg2.Stopped:Connect(function()
									pcall(function()
										v54:Stop(0.25)
									end)
								end)
							end)
						end

						local flag26 = false

						local function fn99(arg)
							if not arg then
								return
							end
							flag26 = false

							task.spawn(function()
								local character = localPlayer3.Character
								if not character then
									return
								end

								if not (arg:FindFirstChildOfClass("Animator") or arg:WaitForChild("Animator", 5)) then
									return
								end

								local function fn100(descendant)
									if descendant:IsA("BodyVelocity") then
										descendant.Velocity = Vector3.new(descendant.Velocity.X, 0, descendant.Velocity.Z)
									end
								end

								local connection27 = character.DescendantAdded:Connect(fn100)

								for _, descendant in pairs(character:GetDescendants()) do
									fn100(descendant)
								end

								if connection27 then
									connection27:Disconnect()
								end

								flag26 = true
							end)
						end

						local connection27 = RunService.Heartbeat:Connect(function()
							local character = localPlayer3.Character
							if not character then
								return
							end
							local humanoid = character:FindFirstChildOfClass("Humanoid")

							if humanoid ~= v52 then
								fn98(humanoid)
								fn99(humanoid)
							end
						end)

						task.spawn(function()
							local character = localPlayer3.Character or localPlayer3.CharacterAdded:Wait()

							if character then
								character = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 3)
							end

							if character then
								fn99(character)
							end
						end)

						table.insert(tbl24, function()
							if connection26 then
								connection26:Disconnect()
								connection26 = nil
							end

							if connection27 then
								connection27:Disconnect()
								connection27 = nil
							end

							v52 = nil

							pcall(function()
								toggles.CustomDownslamEnabled:SetValue(false)
							end)
						end)

						v34:AddDivider({ Text = "Uppercut" })
						v34:AddToggle("CustomUppercutEnabled", { Text = "Enable Custom Uppercut", Default = false })

						local tbl41 = {
							{
								name = "Throw",
								id = "136370737633649",
								timePos = 1,
								speed = 1.2,
								stopAfter = 0.3,
								stopFade = 1,
							},
							{ name = "Heavy", id = "14900168720", timePos = 1.3, speed = 1, stopAfter = nil },
							{
								name = "Simple",
								id = "129123960742438",
								timePos = 2.8,
								speed = nil,
								stopAfter = nil,
								stopFade = 0.2,
							},
							{
								name = "Ball Might",
								id = "125265459886863",
								timePos = 5.2,
								speed = 1.3,
								stopAfter = nil,
								stopTrigger = 6.15,
								stopFade = 0.2,
							},
						}

						local tbl42 = { "Default", "Random" }

						for _, v53 in ipairs(tbl41) do
							table.insert(tbl42, v53.name)
						end

						v34:AddDropdown("CustomUppercut_Anim", { Text = "Custom Uppercut", Values = tbl42, Default = 1, Multi = false, Searchable = false })
						local connection28 = nil
						local v53 = nil

						local function fn100(arg)
							if connection28 then
								connection28:Disconnect()
								connection28 = nil
							end

							v53 = arg
							if not arg then
								return
							end

							connection28 = arg.AnimationPlayed:Connect(function(arg2)
								if (arg2.Animation and arg2.Animation.AnimationId:match("%d+") or "") ~= "10503381238" then
									return
								end
								local value = options.M1EffectsStyle and options.M1EffectsStyle.Value

								if value and value ~= "Off" then
									task.spawn(function()
										local character = localPlayer3.Character
										if not character then
											return
										end
										local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart2 then
											return
										end
										local overlapParams = OverlapParams.new()
										overlapParams.FilterType = Enum.RaycastFilterType.Exclude
										overlapParams.FilterDescendantsInstances = { character }
										local partBoundsInRadius = workspace:GetPartBoundsInRadius((humanoidRootPart2.CFrame * CFrame.new(0, 0, -2.5)).Position, 6, overlapParams)
										local parent = nil

										for _, partBoundsInRadiu in pairs(partBoundsInRadius) do
											if partBoundsInRadiu.Parent:FindFirstChildOfClass("Humanoid") and partBoundsInRadiu.Parent.Name ~= localPlayer3.Name then
												parent = partBoundsInRadiu.Parent
											end
										end

										if not parent then
											return
										end
										local humanoid = parent:FindFirstChildOfClass("Humanoid")
										if not humanoid then
											return
										end
										local health = humanoid.Health
										local connection29 = nil

										connection29 = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
											if humanoid.Health < health then
												if connection29 then
													connection29:Disconnect()
													connection29 = nil
												end

												local torso = parent:FindFirstChild("Torso")
												if not torso then
													return
												end
												local resources = game:GetService("ReplicatedStorage"):FindFirstChild("Resources")
												if not resources then
													return
												end
												local sound = Instance.new("Sound", torso)
												sound.SoundId = "rbxassetid://13064223399"
												sound.Volume = _m1FxVol()
												sound.PlayOnRemove = true
												sound:Destroy()
												local clone2 = resources.KJEffects.DropkickExtra.firstHit:Clone()

												for _, descendant in pairs(clone2:GetDescendants()) do
													if descendant:IsA("BasePart") then
														descendant.CanCollide = false
														descendant.Anchored = true
														descendant.Massless = true
													end
												end

												if clone2:IsA("BasePart") then
													clone2.CanCollide = false
													clone2.Anchored = true
													clone2.Massless = true
												end

												clone2.Parent = workspace
												clone2.CFrame = torso.CFrame
												local parent2 = nil

												for _, descendant in pairs(clone2:GetDescendants()) do
													if descendant.Name == "Wind" then
														parent2 = descendant.Parent
													end
												end

												if parent2 then
													parent2.Wind:Emit(30)
												end

												game:GetService("Debris"):AddItem(clone2, 2)
											end

											health = humanoid.Health
										end)

										task.delay(1, function()
											if connection29 then
												connection29:Disconnect()
												connection29 = nil
											end
										end)
									end)
								end

								if not toggles.CustomUppercutEnabled.Value then
									return
								end
								local str10 = options.CustomUppercut_Anim and options.CustomUppercut_Anim.Value or "Default"
								if str10 == "Default" then
									return
								end
								local v54 = nil

								if str10 == "Random" then
									v54 = tbl41[math.random(1, #tbl41)]
								else
									for _, v55 in ipairs(tbl41) do
										if v55.name == str10 then
											v54 = v55
											break
										end
									end
								end

								if not v54 then
									return
								end
								arg2:AdjustWeight(-9999999, false)
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. v54.id
								local v55 = arg:LoadAnimation(animation)
								v55.Priority = Enum.AnimationPriority.Action3
								v55:Play(0.1)

								if v54.speed then
									v55:AdjustSpeed(v54.speed)
								end

								if v54.timePos then
									v55.TimePosition = v54.timePos
								end

								if v54.stopTrigger then
									local connection29 = nil

									connection29 = RunService.Heartbeat:Connect(function()
										if not v55.IsPlaying or v55.TimePosition >= v54.stopTrigger then
											if connection29 then
												connection29:Disconnect()
												connection29 = nil
											end

											pcall(function()
												v55:Stop(v54.stopFade or 0)
											end)
										end
									end)
								elseif v54.stopAfter then
									task.delay(v54.stopAfter, function()
										pcall(function()
											v55:Stop(v54.stopFade or 0)
										end)
									end)
								else
									arg2.Stopped:Once(function()
										pcall(function()
											v55:Stop(v54.stopFade or 0)
										end)
									end)
								end
							end)
						end

						local connection29 = RunService.Heartbeat:Connect(function()
							local character = localPlayer3.Character
							if not character then
								return
							end
							local humanoid = character:FindFirstChildOfClass("Humanoid")

							if humanoid ~= v53 then
								fn100(humanoid)
							end
						end)

						table.insert(tbl24, function()
							if connection28 then
								connection28:Disconnect()
								connection28 = nil
							end

							if connection29 then
								connection29:Disconnect()
								connection29 = nil
							end

							v53 = nil

							pcall(function()
								toggles.CustomUppercutEnabled:SetValue(false)
							end)
						end)

						local TweenService = game:GetService("TweenService")
						v36:AddDivider({ Text = "Idle" })

						v36:AddDropdown("IdleAnimation", {
							Values = {
								"Normal",
								"Random",
								"[DEF] Watch",
								"[DEF] Casual",
								"[DEF] Confident",
								"[DEF] Fent Master",
								"[DEF] Fly Idle",
								"[DEF] Aura",
								"[DEF] Serious",
								"[DEF] Rework",
								"[DEF] Preparing",
								"[DEF] Divine",
								"[DEF] God",
								"[DEF] I guess?",
								"[DEF] Stand User",
								"[SG] Mayhem",
								"[SG] Rainbow",
								"[SG] Zyledon",
								"[SG] Persistence",
								"[SG] Purity",
								"[SG] Euclidean",
								"[SG] Equinox",
								"[SG] Crazed",
								"[SG] The Big Black",
								"[SG] Contaminant",
							},
							Default = 1,
							Multi = false,
							Text = "Idle Animation",
							Searchable = true,
						})

						v36:AddSlider("IdleAnimationStartFadeTime", { Text = "Idle Animation Start Fade Time", Default = 0.2, Min = 0.1, Max = 1, Rounding = 2 })
						v36:AddSlider("IdleAnimationEndFadeTime", { Text = "Idle Animation End Fade Time", Default = 0.2, Min = 0.1, Max = 1, Rounding = 2 })
						local fn101 = nil

						v36:AddToggle("SGVFXToggle", {
							Text = "Enable SG VFX",
							Default = false,
							Callback = function()
								if fn101 then
									fn101()
								end
							end,
						})

						local v54 = nil
						local v55 = nil
						local v56 = nil
						local v57 = nil
						local v58 = nil
						local tween = nil
						local flag27 = false
						local n16 = 0
						local str10 = ""
						local str11 = ""
						local flag28 = false
						local n17 = 0
						local flag29 = false
						local connection30 = nil
						local connection31 = nil

						local function fn102()
							return getgenv().Enviroment and pcall(function()
								return getgenv().Enviroment.Parent
							end) and getgenv().Enviroment or workspace
						end

						local tbl43 = { MODE_NAME = true, Text = true }

						local function fn103(arg)
							if not arg then
								return
							end

							for _, descendant in pairs(arg:GetDescendants()) do
								if descendant:IsA("BillboardGui") and tbl43[descendant.Name] then
									pcall(function()
										descendant:Destroy()
									end)
								end
							end
						end

						local function fn104(arg)
							fn103(arg)

							if connection30 then
								connection30:Disconnect()
								connection30 = nil
							end

							if not arg then
								return
							end

							connection30 = arg.DescendantAdded:Connect(function(descendant)
								if descendant:IsA("BillboardGui") and tbl43[descendant.Name] then
									pcall(function()
										descendant:Destroy()
									end)
								end
							end)
						end

						local function fn105()
							return type(str11) == "string" and str11:sub(1, 4) == "[SG]"
						end

						local function fn106(arg, arg2)
							local TweenService2 = game:GetService("TweenService")
							local Debris2 = game:GetService("Debris")

							local function fn107()
								return n17 == arg2
							end

							local function fn108()
								local character = localPlayer3.Character
								return character, character and character:FindFirstChild("HumanoidRootPart")
							end

							if arg == "[SG] Persistence" then
								local n18 = 0
								local n19 = 0

								while fn107() do
									n19 += 1
									n18 += 0.5
									local v59, v60 = fn108()

									if not v59 or not v60 then
										task.wait(0.05)
									else
										local rightArm = v59:FindFirstChild("Right Arm")

										if not rightArm then
											task.wait(0.05)
										else
											spawn(function()
												local part3 = Instance.new("Part")
												part3.Parent = fn102()
												part3.Material = Enum.Material.Neon
												part3.Size = Vector3.one
												part3.Anchored = true
												part3.CanCollide = false
												local specialMesh = Instance.new("SpecialMesh", part3)
												specialMesh.MeshType = "Sphere"
												part3.CFrame = rightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, n19 / 5, 1.5707963267948966)
												part3.Color = Color3.new(0, 0, 1)
												specialMesh.Scale = Vector3.one
												Debris2:AddItem(part3, 1.5)
												TweenService2:Create(part3, TweenInfo.new(0.6), { CFrame = part3.CFrame * CFrame.new(0, 2, 0), Transparency = 1, Color = Color3.new(0, 0.3, 0.3) }):Play()
												TweenService2:Create(specialMesh, TweenInfo.new(0.6), { Scale = Vector3.new(0, 1, 0) }):Play()
												local part4 = Instance.new("Part")
												part4.Parent = fn102()
												part4.Material = Enum.Material.Neon
												part4.Size = Vector3.one
												part4.Anchored = true
												part4.CanCollide = false
												local specialMesh2 = Instance.new("SpecialMesh", part4)
												specialMesh2.MeshType = "Sphere"
												part4.CFrame = rightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, 3.1415926535897931 + n19 / 5, 1.5707963267948966)
												part4.Color = Color3.new(0, 0, 1)
												specialMesh2.Scale = Vector3.one
												Debris2:AddItem(part4, 1.5)
												TweenService2:Create(part4, TweenInfo.new(0.6), { CFrame = part4.CFrame * CFrame.new(0, 2, 0), Transparency = 1, Color = Color3.new(0, 0.3, 0.3) }):Play()
												TweenService2:Create(specialMesh2, TweenInfo.new(0.6), { Scale = Vector3.new(0, 1, 0) }):Play()

												if n18 >= 5 then
													n18 = 0
													local particleEmitter = Instance.new("ParticleEmitter", part4)
													particleEmitter.LightEmission = 15
													particleEmitter.LightInfluence = 1
													particleEmitter.Size = NumberSequence.new(2, 0)
													particleEmitter.Name = "_Rsmoke"
													particleEmitter.Transparency = NumberSequence.new(1, 0, 1)
													particleEmitter.Lifetime = NumberRange.new(1.4)
													local new = ColorSequenceKeypoint.new
													local color = Color3.fromRGB
													particleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 15, 255)), new(1, color(0, 0, 255)) })
													particleEmitter.Rate = 0
													particleEmitter.Speed = NumberRange.new(1)
													particleEmitter:Emit()
													particleEmitter.SpreadAngle = Vector2.new(30, 30)
													particleEmitter.Rotation = NumberRange.new(1, 360)
													particleEmitter.RotSpeed = NumberRange.new(-100, 100)
													particleEmitter.Texture = "rbxassetid://9470659899"
													particleEmitter.Brightness = 2555
													particleEmitter.LightEmission = 10
													particleEmitter.LightInfluence = 0
													particleEmitter.Orientation = "VelocityParallel"
													particleEmitter.FlipbookFramerate = NumberRange.new(66)
													particleEmitter.FlipbookLayout = "Grid8x8"
													particleEmitter.FlipbookMode = "Loop"
													particleEmitter.ZOffset = -2
												end

												local particleEmitter = Instance.new("ParticleEmitter", part4)
												particleEmitter.LightEmission = 55
												particleEmitter.Texture = "rbxassetid://284205403"
												particleEmitter.Color = ColorSequence.new(Color3.new(1, 1, 1))
												particleEmitter.Rate = 0
												particleEmitter:Emit(2)
												particleEmitter.Orientation = "VelocityParallel"
												particleEmitter.Lifetime = NumberRange.new(1)
												local numberSequence = NumberSequence.new
												local tbl44 = {}
												local v61 = NumberSequenceKeypoint.new(0, 0)
												local v62 = NumberSequenceKeypoint.new(0.5, 1)
												local new = NumberSequenceKeypoint.new
												tbl44[1] = v61
												tbl44[2] = v62

												do
													local values = table.pack(new(1, 0))
													table.move(values, 1, values.n, 3, tbl44)
												end

												particleEmitter.Size = numberSequence(tbl44)
												local new2 = NumberSequenceKeypoint.new
												particleEmitter.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), new2(1, 0) })
												local numberSequence2 = NumberSequence.new
												local tbl45 = {}
												local v63 = NumberSequenceKeypoint.new(0, 0)
												local v64 = NumberSequenceKeypoint.new(0.1, 0.9)
												local new3 = NumberSequenceKeypoint.new
												tbl45[1] = v63
												tbl45[2] = v64

												do
													local values = table.pack(new3(1, 1))
													table.move(values, 1, values.n, 3, tbl45)
												end

												particleEmitter.Transparency = numberSequence2(tbl45)
												local new4 = ColorSequenceKeypoint.new
												local color = Color3.fromRGB
												particleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)), new4(1, color(0, 0, 255)) })
												particleEmitter.Speed = NumberRange.new(0.01)
												particleEmitter.VelocitySpread = 0
												particleEmitter.ZOffset = 5
												particleEmitter.LockedToPart = true
												particleEmitter.Rotation = NumberRange.new(90)
												particleEmitter.RotSpeed = NumberRange.new(0)

												task.delay(0.5, function()
													particleEmitter.Rate = 0
												end)
											end)

											task.wait(0.05)
										end
									end
								end
							elseif arg == "[SG] Purity" then
								while fn107() do
									local v59, v60 = fn108()

									if not v59 or not v60 then
										task.wait(0.05)
									else
										local part3 = Instance.new("Part")
										Debris2:AddItem(part3, 1.5)
										part3.Material = Enum.Material.Neon
										part3.Size = Vector3.one
										part3.Anchored = true
										part3.CanCollide = false
										part3.Color = Color3.new(0, 1, 1)
										part3.Parent = fn102()
										Instance.new("SpecialMesh", part3).MeshType = "Sphere"
										local particleEmitter = Instance.new("ParticleEmitter", part3)
										particleEmitter.LightEmission = 15
										particleEmitter.Brightness = 1
										particleEmitter.Texture = "rbxassetid://6673021984"
										particleEmitter.Rate = 155
										particleEmitter.Lifetime = NumberRange.new(1.5)
										local new = NumberSequenceKeypoint.new
										particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5), new(1, 0) })
										local numberSequence = NumberSequence.new
										local tbl44 = {}
										local v61 = NumberSequenceKeypoint.new(0, 1)
										local v62 = NumberSequenceKeypoint.new(0.1, 0.9)
										local new2 = NumberSequenceKeypoint.new
										tbl44[1] = v61
										tbl44[2] = v62

										do
											local values = table.pack(new2(1, 1))
											table.move(values, 1, values.n, 3, tbl44)
										end

										particleEmitter.Transparency = numberSequence(tbl44)
										local new3 = ColorSequenceKeypoint.new
										local color = Color3.fromRGB

										particleEmitter.Color = ColorSequence.new({
											ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
											new3(1, color(0, 255, 255)),
										})

										particleEmitter.Speed = NumberRange.new(1)
										particleEmitter.Acceleration = Vector3.new(0, 0, 0.1)
										particleEmitter.VelocitySpread = 0
										particleEmitter.ZOffset = 0
										particleEmitter.Rotation = NumberRange.new(0)
										particleEmitter:Emit(1)
										particleEmitter.LockedToPart = true

										task.delay(0.1, function()
											particleEmitter.Rate = 0
										end)

										local random = math.random
										part3.CFrame = v59.Torso.CFrame * CFrame.new(math.random(-25, 25), -5, random(-25, 25))
										local random2 = math.random

										TweenService2:Create(part3, TweenInfo.new(1.5), {
											Size = Vector3.zero,
											CFrame = part3.CFrame * CFrame.new(math.random(-5, 5), 15 + math.random(2, 8), random2(-5, 5)),
										}):Play()

										task.wait(0.05)
									end
								end
							elseif arg == "[SG] Euclidean" then
								local n18 = 0

								while fn107() do
									n18 += 1
									local v59, v60 = fn108()

									if not v59 or not v60 then
										task.wait(0.01)
									else
										local leftArm = v59:FindFirstChild("Left Arm")

										if not leftArm then
											task.wait(0.01)
										else
											local n19 = math.random(0, 1)
											local color = n19 == 1 and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
											local part3 = Instance.new("Part")
											part3.Parent = fn102()
											part3.Material = Enum.Material.Neon
											part3.Anchored = true
											part3.CanCollide = false
											part3.Color = color
											local specialMesh = Instance.new("SpecialMesh", part3)
											specialMesh.MeshType = "Sphere"
											specialMesh.Scale = Vector3.new(0.5, 0.5, 0.5)
											local cframe = CFrame.Angles
											local random = math.random
											part3.CFrame = leftArm.CFrame * CFrame.new(0, -1, 0) * cframe(math.random(-360, 360), math.random(-360, 360), random(-360, 360))
											Debris2:AddItem(part3, 2)
											TweenService2:Create(part3, TweenInfo.new(1), { CFrame = part3.CFrame * CFrame.new(0, 3, 0) }):Play()
											TweenService2:Create(specialMesh, TweenInfo.new(0.5), { Scale = Vector3.new(0, 2, 0) }):Play()
											local part4 = Instance.new("Part")
											part4.Parent = fn102()
											part4.Material = Enum.Material.Neon
											part4.Anchored = true
											part4.CanCollide = false
											part4.Size = Vector3.new(0.3, 0.3, 0.3)
											part4.Color = color
											Debris2:AddItem(part4, 0.8)

											if math.random(0, 1) == 0 then
												local random2 = math.random
												local cframe2 = CFrame.Angles
												local rad = math.rad
												local random3 = math.random
												part4.CFrame = v60.CFrame * CFrame.new(math.random(-15, 15), -3, random2(-15, 15)) * cframe2(math.rad(math.random(-15, 15)), math.rad(math.random(-15, 15)), rad(random3(-15, 15)))

												TweenService2:Create(part4, TweenInfo.new(0.8), {
													Size = Vector3.new(0, 2 + math.random(2, 4), 0),
													CFrame = part4.CFrame * CFrame.new(0, 2, 0),
												}):Play()

												local particleEmitter = Instance.new("ParticleEmitter", part4)
												particleEmitter.LightEmission = 1
												particleEmitter.Brightness = 1
												particleEmitter.Orientation = "FacingCameraWorldUp"
												particleEmitter.Texture = "rbxassetid://6673021984"
												particleEmitter.Rate = 255
												particleEmitter.Lifetime = NumberRange.new(0.6)
												local new = NumberSequenceKeypoint.new
												particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, math.random(1, 5)), new(1, 0) })
												local numberSequence = NumberSequence.new
												local tbl44 = {}
												local v61 = NumberSequenceKeypoint.new(0, 1)
												local v62 = NumberSequenceKeypoint.new(0.5, -1)
												local v63 = NumberSequenceKeypoint.new(0.5, 0)
												local new2 = NumberSequenceKeypoint.new
												tbl44[1] = v61
												tbl44[2] = v62
												tbl44[3] = v63

												do
													local values = table.pack(new2(1, 0))
													table.move(values, 1, values.n, 4, tbl44)
												end

												particleEmitter.Squash = numberSequence(tbl44)
												local numberSequence2 = NumberSequence.new
												local tbl45 = {}
												local v64 = NumberSequenceKeypoint.new(0, 1)
												local v65 = NumberSequenceKeypoint.new(0.1, 0.8)
												local new3 = NumberSequenceKeypoint.new
												tbl45[1] = v64
												tbl45[2] = v65

												do
													local values = table.pack(new3(1, 1))
													table.move(values, 1, values.n, 3, tbl45)
												end

												particleEmitter.Transparency = numberSequence2(tbl45)

												if n19 == 1 then
													local new4 = ColorSequenceKeypoint.new
													local color2 = Color3.fromRGB

													particleEmitter.Color = ColorSequence.new({
														ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
														new4(1, color2(127, 0, 0)),
													})
												else
													local new4 = ColorSequenceKeypoint.new
													local color2 = Color3.fromRGB

													particleEmitter.Color = ColorSequence.new({
														ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
														new4(1, color2(252, 255, 255)),
													})
												end

												particleEmitter.Speed = NumberRange.new(0)
												particleEmitter.VelocitySpread = 50000
												particleEmitter.ZOffset = 2
												particleEmitter.Rotation = NumberRange.new(90)
												particleEmitter:Emit(1)
												particleEmitter.LockedToPart = true

												task.delay(0.3, function()
													particleEmitter.Rate = 0
												end)
											else
												local random2 = math.random
												part4.CFrame = v60.CFrame * CFrame.new(math.random(-15, 15), math.random(-3, 15), random2(-15, 15)) * CFrame.Angles(n18, n18, -n18)
												TweenService2:Create(part4, TweenInfo.new(0.8), { Size = Vector3.zero, CFrame = part4.CFrame * CFrame.new(0, 2, 0) }):Play()
												local particleEmitter = Instance.new("ParticleEmitter", part4)
												particleEmitter.LightEmission = 1
												particleEmitter.Brightness = 1
												particleEmitter.Orientation = "FacingCameraWorldUp"
												particleEmitter.Texture = "rbxassetid://6673021984"
												particleEmitter.Rate = 77
												particleEmitter.Lifetime = NumberRange.new(0.3)
												local new = NumberSequenceKeypoint.new
												particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, math.random(1, 5)), new(1, 0) })
												local numberSequence = NumberSequence.new
												local tbl44 = {}
												local v61 = NumberSequenceKeypoint.new(0, 2)
												local v62 = NumberSequenceKeypoint.new(0.1, -2)
												local v63 = NumberSequenceKeypoint.new(0.2, 2)
												local v64 = NumberSequenceKeypoint.new(0.3, -2)
												local v65 = NumberSequenceKeypoint.new(0.4, 2)
												local v66 = NumberSequenceKeypoint.new(0.5, -2)
												local v67 = NumberSequenceKeypoint.new(0.5, 0)
												local new2 = NumberSequenceKeypoint.new
												tbl44[1] = v61
												tbl44[2] = v62
												tbl44[3] = v63
												tbl44[4] = v64
												tbl44[5] = v65
												tbl44[6] = v66
												tbl44[7] = v67

												do
													local values = table.pack(new2(1, 0))
													table.move(values, 1, values.n, 8, tbl44)
												end

												particleEmitter.Squash = numberSequence(tbl44)
												local numberSequence2 = NumberSequence.new
												local tbl45 = {}
												local v68 = NumberSequenceKeypoint.new(0, 1)
												local v69 = NumberSequenceKeypoint.new(0.1, 0.8)
												local new3 = NumberSequenceKeypoint.new
												tbl45[1] = v68
												tbl45[2] = v69

												do
													local values = table.pack(new3(1, 1))
													table.move(values, 1, values.n, 3, tbl45)
												end

												particleEmitter.Transparency = numberSequence2(tbl45)

												if n19 == 1 then
													local new4 = ColorSequenceKeypoint.new
													local color2 = Color3.fromRGB

													particleEmitter.Color = ColorSequence.new({
														ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
														new4(1, color2(252, 255, 255)),
													})
												else
													local new4 = ColorSequenceKeypoint.new
													local color2 = Color3.fromRGB

													particleEmitter.Color = ColorSequence.new({
														ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
														new4(1, color2(252, 255, 255)),
													})
												end

												particleEmitter.Speed = NumberRange.new(0)
												particleEmitter.VelocitySpread = 50000
												particleEmitter.ZOffset = 0
												particleEmitter.Rotation = NumberRange.new(90)
												particleEmitter:Emit(1)
												particleEmitter.LockedToPart = true

												task.delay(0.3, function()
													particleEmitter.Rate = 0
												end)
											end

											task.wait(0.01)
										end
									end
								end
							elseif arg == "[SG] Equinox" then
								while fn107() do
									local v59, v60 = fn108()

									if not v59 or not v60 then
										task.wait(0.1)
									else
										local n18 = math.random(0, 1)
										local part3 = Instance.new("Part")
										Debris2:AddItem(part3, 0.7)
										part3.Material = Enum.Material.Neon
										part3.Size = Vector3.one
										part3.Anchored = true
										part3.CanCollide = false
										part3.Color = Color3.new(n18, n18, n18)
										part3.Parent = fn102()
										local specialMesh = Instance.new("SpecialMesh", part3)
										specialMesh.MeshType = "Sphere"
										local n19 = v60.CFrame.Y - 3
										part3.CFrame = CFrame.new(v60.CFrame.X + math.random(-25, 25), n19, v60.CFrame.Z + math.random(-25, 25))
										local particleEmitter = Instance.new("ParticleEmitter", part3)
										particleEmitter.LightEmission = 155
										particleEmitter.Brightness = 1
										particleEmitter.Texture = "rbxassetid://6673021984"
										particleEmitter.Rate = 155
										particleEmitter.Lifetime = NumberRange.new(0.5)
										local new = NumberSequenceKeypoint.new
										particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, math.random(1, 5) * 5), new(1, 0) })
										particleEmitter.Orientation = "VelocityParallel"
										local numberSequence = NumberSequence.new
										local tbl44 = {}
										local v61 = NumberSequenceKeypoint.new(0, 0)
										local v62 = NumberSequenceKeypoint.new(0.3, -7)
										local new2 = NumberSequenceKeypoint.new
										tbl44[1] = v61
										tbl44[2] = v62

										do
											local values = table.pack(new2(1, 0))
											table.move(values, 1, values.n, 3, tbl44)
										end

										particleEmitter.Squash = numberSequence(tbl44)
										local numberSequence2 = NumberSequence.new
										local tbl45 = {}
										local v63 = NumberSequenceKeypoint.new(0, 1)
										local v64 = NumberSequenceKeypoint.new(0.1, 0.9)
										local new3 = NumberSequenceKeypoint.new
										tbl45[1] = v63
										tbl45[2] = v64

										do
											local values = table.pack(new3(1, 1))
											table.move(values, 1, values.n, 3, tbl45)
										end

										particleEmitter.Transparency = numberSequence2(tbl45)
										local new4 = ColorSequenceKeypoint.new
										local color = Color3.fromRGB

										particleEmitter.Color = ColorSequence.new({
											ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
											new4(1, color(0, 0, 0)),
										})

										particleEmitter.Speed = NumberRange.new(1)
										particleEmitter.Acceleration = Vector3.new(0, 0, 0.1)
										particleEmitter.VelocitySpread = 0
										particleEmitter.ZOffset = -2
										particleEmitter.Rotation = NumberRange.new(0)
										particleEmitter:Emit(1)

										task.delay(0.1, function()
											particleEmitter.Rate = 0
										end)

										specialMesh.Scale = Vector3.new(3, 3, 3)
										TweenService2:Create(specialMesh, TweenInfo.new(1), { Scale = Vector3.new(0, 45, 0) }):Play()
										TweenService2:Create(part3, TweenInfo.new(1.6), { Transparency = 1 }):Play()
										task.wait(0.1)
									end
								end
							elseif arg == "[SG] Crazed" then
								while fn107() do
									local v59, v60 = fn108()

									if not v59 or not v60 then
										task.wait(0.05)
									else
										spawn(function()
											local part3 = Instance.new("Part")
											Debris2:AddItem(part3, 1.5)
											part3.Material = Enum.Material.Neon
											part3.Anchored = true
											part3.CanCollide = false
											part3.Color = Color3.new(0, 0, 1)
											part3.Parent = fn102()
											Instance.new("SpecialMesh", part3).MeshType = "Sphere"
											local particleEmitter = Instance.new("ParticleEmitter", part3)
											particleEmitter.LightEmission = 15
											particleEmitter.Brightness = 1
											particleEmitter.Texture = "rbxassetid://6673021984"
											particleEmitter.Rate = 155
											particleEmitter.Lifetime = NumberRange.new(3.5)
											local new = NumberSequenceKeypoint.new
											particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5), new(1, 15) })
											local new2 = NumberSequenceKeypoint.new
											particleEmitter.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5), new2(1, 15) })
											local numberSequence = NumberSequence.new
											local tbl44 = {}
											local v61 = NumberSequenceKeypoint.new(0, 1)
											local v62 = NumberSequenceKeypoint.new(0.1, 0.9)
											local new3 = NumberSequenceKeypoint.new
											tbl44[1] = v61
											tbl44[2] = v62

											do
												local values = table.pack(new3(1, 1))
												table.move(values, 1, values.n, 3, tbl44)
											end

											particleEmitter.Transparency = numberSequence(tbl44)
											local new4 = ColorSequenceKeypoint.new
											local color = Color3.fromRGB
											particleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)), new4(1, color(0, 0, 255)) })
											particleEmitter.Speed = NumberRange.new(0)
											particleEmitter.Acceleration = Vector3.new(0, 5, 0)
											particleEmitter.VelocitySpread = 0
											particleEmitter.ZOffset = 0
											particleEmitter.Orientation = "VelocityParallel"
											particleEmitter.Rotation = NumberRange.new(90)
											particleEmitter:Emit(1)
											particleEmitter.LockedToPart = true

											task.delay(0.1, function()
												particleEmitter.Rate = 0
											end)

											spawn(function()
												for i = 1, 45 do
													part3.Color = Color3.fromRGB(0, 0, math.random(1, 155))
													task.wait(0.02)
												end
											end)

											part3.Size = Vector3.new(1, 0.1, 1)
											local random = math.random
											local cframe = CFrame.Angles
											part3.CFrame = v60.CFrame * CFrame.new(math.random(-77, 77), -2, random(-77, 77)) * cframe(math.rad(math.random(-15, 15)), 0, 0)
											TweenService2:Create(part3, TweenInfo.new(0.5), { Size = Vector3.new(2, 0.2, 2) }):Play()
											task.wait(0.5)

											TweenService2:Create(part3, TweenInfo.new(1.5), {
												CFrame = part3.CFrame * CFrame.new(math.random(-5, 5) / 5, 15 + math.random(2, 8), math.random(-5, 5) / 5),
												Size = Vector3.new(0, 155, 0),
											}):Play()

											local part4 = Instance.new("Part")
											Debris2:AddItem(part4, 1.5)
											part4.Material = Enum.Material.Neon
											part4.Anchored = true
											part4.CanCollide = false
											part4.Color = Color3.new(0, 0, 1)
											part4.Parent = fn102()
											Instance.new("SpecialMesh", part4).MeshType = "Sphere"
											local particleEmitter2 = Instance.new("ParticleEmitter", part4)
											particleEmitter2.LightEmission = 15
											particleEmitter2.Brightness = 1
											particleEmitter2.Texture = "rbxassetid://6673021984"
											particleEmitter2.Rate = 155
											particleEmitter2.Lifetime = NumberRange.new(0.5)
											local new5 = NumberSequenceKeypoint.new
											particleEmitter2.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2), new5(1, 2) })
											local new6 = NumberSequenceKeypoint.new
											particleEmitter2.Squash = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2), new6(1, 2) })
											local numberSequence2 = NumberSequence.new
											local tbl45 = {}
											local v63 = NumberSequenceKeypoint.new(0, 1)
											local v64 = NumberSequenceKeypoint.new(0.1, 0.9)
											local new7 = NumberSequenceKeypoint.new
											tbl45[1] = v63
											tbl45[2] = v64

											do
												local values = table.pack(new7(1, 1))
												table.move(values, 1, values.n, 3, tbl45)
											end

											particleEmitter2.Transparency = numberSequence2(tbl45)
											local new8 = ColorSequenceKeypoint.new
											local color2 = Color3.fromRGB
											particleEmitter2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)), new8(1, color2(0, 0, 255)) })
											particleEmitter2.Speed = NumberRange.new(0)
											particleEmitter2.Acceleration = Vector3.new(0, 0.3, 0)
											particleEmitter2.VelocitySpread = 0
											particleEmitter2.ZOffset = 0
											particleEmitter2.Orientation = "VelocityParallel"
											particleEmitter2.Rotation = NumberRange.new(0)
											particleEmitter2:Emit(1)
											particleEmitter2.LockedToPart = true

											task.delay(0.1, function()
												particleEmitter2.Rate = 0
											end)

											spawn(function()
												for i = 1, 45 do
													part4.Color = Color3.fromRGB(0, 0, math.random(1, 155))
													task.wait(0.02)
												end
											end)

											part4.Size = Vector3.new(3, 0.5, 3)
											part4.CFrame = v59.Torso.CFrame * CFrame.new(0, 0, 7)
											TweenService2:Create(part4, TweenInfo.new(0.2), { Size = Vector3.new(0, 0, 25) }):Play()
										end)

										task.wait(0.05)
									end
								end
							elseif arg == "[SG] Contaminant" then
								local n18 = 999
								local color = Color3.new(1, 0.7, 0)

								while fn107() do
									n18 += 0.1
									local v59, v60 = fn108()

									if not v59 or not v60 then
										task.wait(0.02)
									else
										local rightArm = v59:FindFirstChild("Right Arm")
										local leftArm = v59:FindFirstChild("Left Arm")

										if not rightArm or not leftArm then
											task.wait(0.02)
										else
											local function fn109(arg3)
												local part3 = Instance.new("Part")
												part3.Parent = fn102()
												part3.Material = Enum.Material.Neon
												part3.Anchored = true
												part3.CanCollide = false
												local specialMesh = Instance.new("SpecialMesh", part3)
												specialMesh.MeshType = "Sphere"
												part3.Color = color
												specialMesh.Scale = Vector3.new(0.5, 0.5, 0.5)
												local cframe = CFrame.Angles
												local random = math.random
												part3.CFrame = arg3.CFrame * CFrame.new(0, -1, 0) * cframe(math.random(-360, 360), math.random(-360, 360), random(-360, 360))
												Debris2:AddItem(part3, 2)
												TweenService2:Create(part3, TweenInfo.new(1), { CFrame = part3.CFrame * CFrame.new(0, 3, 0) }):Play()
												TweenService2:Create(specialMesh, TweenInfo.new(0.5), { Scale = Vector3.new(0, 2, 0) }):Play()

												if n18 >= 1 then
													local particleEmitter = Instance.new("ParticleEmitter", part3)
													particleEmitter.LightEmission = 15
													particleEmitter.LightInfluence = 1
													local new = NumberSequenceKeypoint.new
													particleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2), new(1, 1) })
													particleEmitter.LockedToPart = true
													particleEmitter.Name = "_Lsmoke"
													local numberSequence = NumberSequence.new
													local tbl44 = {}
													local v61 = NumberSequenceKeypoint.new(0, 1)
													local v62 = NumberSequenceKeypoint.new(0.5, 0)
													local new2 = NumberSequenceKeypoint.new
													tbl44[1] = v61
													tbl44[2] = v62

													do
														local values = table.pack(new2(1, 1))
														table.move(values, 1, values.n, 3, tbl44)
													end

													particleEmitter.Transparency = numberSequence(tbl44)
													particleEmitter.Lifetime = NumberRange.new(1)
													local new3 = ColorSequenceKeypoint.new
													local color2 = Color3.fromRGB
													particleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)), new3(1, color2(255, 200, 0)) })
													particleEmitter.Rate = 0
													particleEmitter.Speed = NumberRange.new(-3)
													particleEmitter:Emit(1)
													particleEmitter.SpreadAngle = Vector2.new(30, 30)
													particleEmitter.Rotation = NumberRange.new(1, 360)
													particleEmitter.RotSpeed = NumberRange.new(-100, 100)
													particleEmitter.Texture = "rbxassetid://9470659899"
													particleEmitter.Brightness = 5
													particleEmitter.LightEmission = 10
													particleEmitter.LightInfluence = 0
													particleEmitter.FlipbookFramerate = NumberRange.new(66)
													particleEmitter.FlipbookLayout = "Grid8x8"
													particleEmitter.FlipbookMode = "Loop"
													particleEmitter.ZOffset = 0
													local particleEmitter2 = Instance.new("ParticleEmitter", part3)
													particleEmitter2.LightEmission = 155
													particleEmitter2.Texture = "rbxassetid://6673021984"
													particleEmitter2.Rate = 155
													particleEmitter2:Emit(5)
													particleEmitter2.LockedToPart = true
													particleEmitter2.Lifetime = NumberRange.new(1)
													local new4 = NumberSequenceKeypoint.new
													particleEmitter2.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3), new4(1, 0) })
													local numberSequence2 = NumberSequence.new
													local tbl45 = {}
													local v63 = NumberSequenceKeypoint.new(0, math.random(-15, 15) / 35)
													local v64 = NumberSequenceKeypoint.new(0.1, math.random(-15, 15) / 35)
													local new5 = NumberSequenceKeypoint.new
													tbl45[1] = v63
													tbl45[2] = v64

													do
														local values = table.pack(new5(1, 0))
														table.move(values, 1, values.n, 3, tbl45)
													end

													particleEmitter2.Squash = numberSequence2(tbl45)
													local numberSequence3 = NumberSequence.new
													local tbl46 = {}
													local v65 = NumberSequenceKeypoint.new(0, 1)
													local v66 = NumberSequenceKeypoint.new(0.1, 0.8)
													local new6 = NumberSequenceKeypoint.new
													tbl46[1] = v65
													tbl46[2] = v66

													do
														local values = table.pack(new6(1, 1))
														table.move(values, 1, values.n, 3, tbl46)
													end

													particleEmitter2.Transparency = numberSequence3(tbl46)
													local new7 = ColorSequenceKeypoint.new
													particleEmitter2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, color), new7(1, color) })
													particleEmitter2.Speed = NumberRange.new(0)
													particleEmitter2.VelocitySpread = 50000
													particleEmitter2.Rotation = NumberRange.new(-500, 500)
													particleEmitter2.RotSpeed = NumberRange.new(-500, 500)
													particleEmitter2.ZOffset = 2

													task.delay(0.5, function()
														particleEmitter2.Rate = 0
													end)
												end
											end

											fn109(rightArm)
											fn109(leftArm)

											if n18 >= 1 then
												n18 = 0
											end

											task.wait(0.02)
										end
									end
								end
							else
								while fn107() do
									task.wait(0.5)
								end
							end
						end

						local function fn107()
							if not flag29 then
								return
							end
							flag29 = false
							n17 += 1

							if getgenv()._sgOrigSetDecal ~= nil then
								pcall(function()
									if _G then
										_G.SetDecal = getgenv()._sgOrigSetDecal
									end
								end)

								getgenv()._sgOrigSetDecal = nil
							end

							if connection30 then
								connection30:Disconnect()
								connection30 = nil
							end

							if connection31 then
								connection31:Disconnect()
								connection31 = nil
							end

							pcall(function()
								local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

								if humanoid then
									humanoid.CameraOffset = Vector3.new()
								end
							end)
						end

						local function fn108(arg)
							n17 += 1
							local v59 = n17
							fn104(localPlayer3.Character)
							task.spawn(fn106, arg, v59)
						end

						local function fn109(arg)
							flag29 = true

							if _G and type(_G.SetDecal) == "function" and getgenv()._sgOrigSetDecal == nil then
								local setDecal = _G.SetDecal
								getgenv()._sgOrigSetDecal = setDecal

								_G.SetDecal = function()
								end
							end

							if connection31 then
								connection31:Disconnect()
							end

							connection31 = localPlayer3.CharacterAdded:Connect(function()
								task.wait(0.1)

								if flag29 then
									fn108(str11)
								end
							end)

							fn108(arg)
						end

						fn101 = function()
							if toggles.SGVFXToggle and toggles.SGVFXToggle.Value and fn105() then
								if not flag29 then
									fn109(str11)
								else
									fn108(str11)
								end
							else
								fn107()
							end
						end

						local function fn110(arg)
							local character = localPlayer3.Character
							character = character and character:FindFirstChildOfClass("Humanoid")
							if not character then
								return nil
							end
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://" .. arg
							return character:LoadAnimation(animation)
						end

						local function fn111(arg)
							n16 += 1
							flag27 = false
							local n18 = arg and 0 or options.IdleAnimationEndFadeTime and options.IdleAnimationEndFadeTime.Value or 0.2

							if tween then
								pcall(function()
									tween:Cancel()
								end)

								tween = nil
							end

							if v54 then
								pcall(function()
									v54:Stop(n18)
								end)

								v54 = nil
							end

							if v55 then
								pcall(function()
									v55:Stop(n18)
								end)

								v55 = nil
							end

							if v56 then
								pcall(function()
									v56:Stop(n18)
								end)

								v56 = nil
							end

							if v57 then
								pcall(function()
									v57:Stop(n18)
								end)

								v57 = nil
							end

							if v58 then
								pcall(function()
									v58:Stop(n18)
								end)

								v58 = nil
							end

							pcall(function()
								local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

								if humanoid then
									humanoid.HipHeight = 0
								end
							end)
						end

						local function fn112(arg, arg2)
							flag28 = true

							if arg2 then
								local n18 = options.IdleAnimationEndFadeTime and options.IdleAnimationEndFadeTime.Value or 0.2
								fn111(false)
								task.wait(n18)
							else
								fn111(true)
							end

							local character = localPlayer3.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if not character or character.MoveDirection ~= Vector3.new() then
								str10 = ""
								str11 = ""
								flag28 = false
								task.defer(fn101)
								return
							end

							local str12 = options.IdleAnimation and options.IdleAnimation.Value or "Normal"

							if str12 == "Normal" then
								str10 = ""
								str11 = ""
								flag28 = false
								task.defer(fn101)
								return
							end

							if str12 ~= arg then
								str10 = ""
								str11 = ""
								flag28 = false
								task.defer(fn101)
								return
							end

							if arg == "Random" then
								local tbl44 = {
									"[DEF] Watch",
									"[DEF] Casual",
									"[DEF] Confident",
									"[DEF] Fent Master",
									"[DEF] Fly Idle",
									"[DEF] Aura",
									"[DEF] Serious",
									"[DEF] Rework",
									"[DEF] Preparing",
									"[DEF] Divine",
									"[DEF] God",
									"[DEF] I guess?",
									"[DEF] Stand User",
									"[SG] Mayhem",
									"[SG] Rainbow",
									"[SG] Zyledon",
									"[SG] Persistence",
									"[SG] Purity",
									"[SG] Euclidean",
									"[SG] Equinox",
									"[SG] Crazed",
									"[SG] The Big Black",
									"[SG] Contaminant",
								}

								arg = tbl44[math.random(1, #tbl44)]
							end

							str11 = arg
							local n18 = options.IdleAnimationStartFadeTime and options.IdleAnimationStartFadeTime.Value or 0.1

							if arg == "[DEF] Watch" then
								v54 = fn110("18897733312")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
							elseif arg == "[DEF] Casual" then
								v54 = fn110("13736115009")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v55 = fn110("18253570434")

								if v55 then
									v55.Priority = Enum.AnimationPriority.Idle
									v55:Play(n18)
									v55:AdjustSpeed(0)
									v55.TimePosition = 0.3
								end
							elseif arg == "[DEF] Confident" then
								v54 = fn110("18450406917")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)
								tween = TweenService:Create(v54, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true, 0), { TimePosition = 0.1 })
								tween:Play()
							elseif arg == "[DEF] Fent Master" then
								v54 = fn110("17086333563")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54.TimePosition = 1.5
								tween = TweenService:Create(v54, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true, 0), { TimePosition = 2 })
								tween:Play()
							elseif arg == "[DEF] Fly Idle" then
								v54 = fn110("17124061663")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
							elseif arg == "[SG] Mayhem" then
								v54 = fn110("17097712387")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0.1)
								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 0.5 + math.cos(i / 35) / 15
											task.wait(0.02)
											continue
										end

										break
									end
								end)
							elseif arg == "[SG] Ultrasonic" then
								v54 = fn110("17106169665")
								v58 = fn110("313762630")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Action4
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54:AdjustWeight(100000000)

								if v58 then
									v58.Priority = Enum.AnimationPriority.Action4
									v58:Play(n18)
									v58:AdjustWeight(100000000)
								end

								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 1.2 + math.sin(i / 15) / 35
											local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

											if humanoid then
												humanoid.HipHeight = 2 + math.sin(i / 15) * 2
											end

											task.wait(0.02)
											continue
										end

										break
									end

									local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

									if humanoid then
										humanoid.HipHeight = 0
									end
								end)
							elseif arg == "[SG] Rainbow" then
								v54 = fn110("18464372850")
								v57 = fn110("14357943487")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)

								if v57 then
									v57.Priority = Enum.AnimationPriority.Movement
									v57:Play(n18)
									v57:AdjustSpeed(0)
								end

								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not flag27 or n16 ~= v59 then
											return
										end
										v54.TimePosition = 2.75 + math.cos(i / 35) / 45
										task.wait(0.05)
									end
								end)
							elseif arg == "[SG] Zyledon" then
								v55 = fn110("15957376722")
								v54 = fn110("72042024")
								if not v55 then
									flag28 = false
									return
								end
								v55.Priority = Enum.AnimationPriority.Idle
								v55:Play(n18)
								v55:AdjustSpeed(0)
								v55.Looped = true

								if v54 then
									v54.Priority = Enum.AnimationPriority.Movement
									v54:Play(n18)
									v54:AdjustSpeed(0)
									v54.TimePosition = 0.1
									v54.Looped = true
								end

								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 15150 do
										if not (not flag27 or n16 ~= v59) then
											v55.TimePosition = 3.2 + math.cos(i / 25) / 255
											task.wait(0.01)
											continue
										end

										break
									end
								end)
							elseif arg == "[SG] Persistence" then
								v54 = fn110("129295156336675")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)
								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not flag27 or n16 ~= v59 then
											return
										end
										v54.TimePosition = 0.5 + math.cos(i / 15) / 35
										task.wait(0.05)
									end
								end)
							elseif arg == "[SG] Purity" then
								v54 = fn110("17121695329")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(1)
							elseif arg == "[SG] Euclidean" then
								v54 = fn110("14527229510")
								v55 = fn110("99277885325374")
								v56 = fn110("15146348738")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54.Looped = true

								if v55 then
									v55.Priority = Enum.AnimationPriority.Idle
									v55:Play(n18)
									v55:AdjustSpeed(0.8)
									v55.Looped = true
								end

								if v56 then
									v56.Priority = Enum.AnimationPriority.Movement
									v56:Play(n18)
									v56:AdjustSpeed(0.1)
									v56.Looped = true
								end

								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 15150 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 0.9 + math.cos(i / 15) / 155
											task.wait(0.01)
											continue
										end

										break
									end
								end)
							elseif arg == "[SG] Equinox" then
								v54 = fn110("15503060232")
								v57 = fn110("88016955")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)

								if v57 then
									v57.Priority = Enum.AnimationPriority.Idle
									v57:Play(n18)
									v57:AdjustSpeed(0)
								end

								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 4.8 + math.cos(i / 5) / 10
											task.wait(0.1)
											continue
										end

										break
									end
								end)
							elseif arg == "[SG] Crazed" then
								v54 = fn110("75318228407422")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0.1)
								flag27 = true
								local v59 = n16
								local v60 = v54

								task.spawn(function()
									for i = 1, 999999 do
										if not (not flag27 or n16 ~= v59) then
											if not (not v60 or not v60.IsPlaying) then
												if math.random(1, 15) == 15 then
													for i2 = 1, math.random(2, 7) do
														if not (not flag27 or n16 ~= v59) then
															if not (not v60 or not v60.IsPlaying) then
																v60.TimePosition = 0.7 + math.random(-15, 15) / 55
																task.wait(0.01)
																continue
															end
														end

														break
													end
												end

												if not (not flag27 or n16 ~= v59) then
													v60.TimePosition = 0.7 + math.cos(i / 35) / 7
													task.wait(0.02)
													continue
												end
											end
										end

										break
									end
								end)
							elseif arg == "[SG] The Big Black" then
								v54 = fn110("15018219692")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0.1)
								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 0.4 + math.cos(i / 35) / 15
											task.wait(0.02)
											continue
										end

										break
									end
								end)
							elseif arg == "[SG] Contaminant" then
								v54 = fn110("16719107050")
								v57 = fn110("15146348738")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)

								if v57 then
									v57.Priority = Enum.AnimationPriority.Idle
									v57:Play(n18)
									v57:AdjustSpeed(0)
								end

								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 999999 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 2.5 + math.cos(i / 15) / 15
											task.wait(0.02)
											continue
										end

										break
									end
								end)
							elseif arg == "[SG] Divinity" then
								v54 = fn110("17464644182")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Action4
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54:AdjustWeight(100000000)
								v54.Looped = true
								flag27 = true
								local v59 = n16

								task.spawn(function()
									for i = 1, 15150 do
										if not (not flag27 or n16 ~= v59) then
											v54.TimePosition = 0.3 + math.cos(i / 5) / 45
											task.wait(0.1)
											continue
										end

										break
									end
								end)
							elseif arg == "[DEF] Aura" then
								v54 = fn110("104862750267967")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = true
								v54:Play(n18)
								v54:AdjustSpeed(0.6)
							elseif arg == "[DEF] Serious" then
								v54 = fn110("140164642047188")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = true
								v54:Play(n18)
								v54.TimePosition = 1
								v54:AdjustSpeed(0)
								tween = TweenService:Create(v54, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true, 0), { TimePosition = 1.1 })
								tween:Play()
							elseif arg == "[DEF] Rework" then
								v54 = fn110("15963602367")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54.TimePosition = 0
								tween = TweenService:Create(v54, TweenInfo.new(4.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 0), { TimePosition = 1.7 })
								tween:Play()
							elseif arg == "[DEF] Preparing" then
								v54 = fn110("87060298208284")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = true
								v54:Play(n18)
								v54:AdjustSpeed(1)
							elseif arg == "[DEF] Divine" then
								v54 = fn110("116187503451999")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = false
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54.TimePosition = 10.1
								tween = TweenService:Create(v54, TweenInfo.new(11.900000000000002, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, true, 0), { TimePosition = 13.67 })
								tween:Play()
							elseif arg == "[DEF] I guess?" then
								v54 = fn110("92593946371649")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = false
								v54:Play(n18)
								v54:AdjustSpeed(0)
								v54.TimePosition = 1.47
							elseif arg == "[DEF] Stand User" then
								v54 = fn110("94105258532295")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = false
								v54:Play(n18)
								v54:AdjustSpeed(0.4)
								v54.TimePosition = 6.5
								flag27 = true
								local v59 = n16

								task.spawn(function()
									while flag27 and n16 == v59 do
										if v54.TimePosition >= 13 then
											v54.TimePosition = 6.5
										end

										task.wait()
									end
								end)
							elseif arg == "[DEF] God" then
								v54 = fn110("72460660015095")

								if not v54 then
									flag28 = false
									task.defer(fn101)
									return
								end

								v54.Priority = Enum.AnimationPriority.Idle
								v54.Looped = false
								v54:Play(n18)
								v54:AdjustSpeed(1)
								v54.TimePosition = 3.35
								flag27 = true
								local v59 = n16

								task.spawn(function()
									while true do
										if flag27 and n16 == v59 then
											if v54.TimePosition >= 4.6 then
												v54:AdjustSpeed(0.2)
												local flag30 = true

												while flag27 and n16 == v59 do
													local timePosition = v54.TimePosition

													if flag30 then
														if timePosition >= 4.9 then
															v54:AdjustSpeed(-0.2)
															flag30 = false
														end
													elseif timePosition <= 4.6 then
														v54:AdjustSpeed(0.2)
														flag30 = true
													end

													task.wait()
												end

												return
											else
												task.wait()
												continue
											end
										end

										break
									end
								end)
							end

							flag28 = false
							task.defer(fn101)
						end

						local connection32 = RunService.Heartbeat:Connect(function()
							if flag28 then
								return
							end
							local character = localPlayer3.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if not character then
								if str10 ~= "" then
									fn111(false)
									str10 = ""
									str11 = ""
								end

								return
							end

							local str12 = options.IdleAnimation and options.IdleAnimation.Value or "Normal"

							if options.WalkAnimation then
							end

							if str12 == "Normal" or character.MoveDirection ~= Vector3.new() then
								if str12 == "Normal" and character.MoveDirection ~= Vector3.new() then
									return
								end

								if str10 ~= "" then
									fn111(false)
									str10 = ""
									str11 = ""
									fn101()
								end

								return
							end

							if not (str12 ~= str10) then
								if v54 and v54.IsPlaying then
									return
								end

								if v55 and v55.IsPlaying then
									return
								end
							end

							local flag30 = str10 ~= ""
							str10 = str12
							task.spawn(fn112, str12, flag30)
						end)

						table.insert(tbl24, function()
							if connection32 then
								connection32:Disconnect()
								connection32 = nil
							end

							flag28 = false
							str10 = ""
							str11 = ""
							fn111(true)
							fn107()

							pcall(function()
								toggles.SGVFXToggle:SetValue(false)
							end)

							pcall(function()
								options.IdleAnimation:SetValue("Normal")
							end)
						end)

						v36:AddDivider({ Text = "Walk" })

						local tbl44 = {
							["Gojo Run"] = "18897115785",
							["Girly Walk"] = "17861862787",
							["Steve Walk"] = "17861872519",
							["Sassy Walk"] = "17861893094",
							["Yandere Walk"] = "17086054994",
							["Sword Walk"] = "17120635926",
							March = "15962443652",
							Hunter = "15962326593",
							Goofy = "18897664299",
							["Officer Earl"] = "18897700236",
							["Kazotsky Kick"] = "17861870996",
							["In Charge"] = "132132848099103",
						}

						v36:AddDropdown("WalkAnimation", {
							Values = {
								"Normal",
								"Gojo Run",
								"Girly Walk",
								"Steve Walk",
								"Sassy Walk",
								"Yandere Walk",
								"Sword Walk",
								"March",
								"Hunter",
								"Goofy",
								"Officer Earl",
								"Kazotsky Kick",
								"In Charge",
								"Flying",
							},
							Default = 1,
							Multi = false,
							Text = "Walk Animation",
							Searchable = true,
						})

						v36:AddSlider("WalkAnimSpeed", { Text = "Walk Animation Speed", Default = 1, Min = 0.25, Max = 3, Rounding = 1 })
						v36:AddDropdown("LoopedAnimation", { Values = { "None", "Spin", "Crazy" }, Default = 1, Multi = false, Text = "Looped Animation" })
						v36:AddSlider("LoopedAnimationSpeed", { Text = "Looped Animation Speed", Default = 1, Min = 0.1, Max = 10, Rounding = 1 })
						local v59 = nil
						local str12 = ""
						local tbl45 = { Forward = "17124063826", Back = "17124067635", Left = "17124105294", Right = "17124112547" }
						local tbl46 = {}

						options.WalkAnimSpeed:OnChanged(function(arg)
							if v59 then
								pcall(function()
									v59:AdjustSpeed(arg)
								end)
							end

							for _, v60 in pairs(tbl46) do
								if v60.IsPlaying then
									pcall(function()
										v60:AdjustSpeed(arg)
									end)
								end
							end
						end)

						local function fn113()
							for _, v60 in pairs(tbl46) do
								pcall(function()
									if v60.IsPlaying then
										v60:Stop(0)
									end
								end)

								pcall(function()
									v60:Destroy()
								end)
							end

							tbl46 = {}
						end

						local function fn114(arg)
							for k, v60 in pairs(tbl46) do
								local flag30 = false

								if arg then
									for _, v61 in ipairs(arg) do
										if v61 == k then
											flag30 = true
											break
										end
									end
								end

								if flag30 then
									if not v60.IsPlaying then
										pcall(function()
											v60:Play(0.1)
										end)
									end
								elseif v60.IsPlaying then
									pcall(function()
										v60:Stop(0.1)
									end)
								end
							end
						end

						local function fn115()
							fn113()
							local character = localPlayer3.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")
							humanoid = humanoid and humanoid:FindFirstChildOfClass("Animator")
							if not humanoid then
								return
							end

							for k, v60 in pairs(tbl45) do
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. v60
								local v61 = humanoid:LoadAnimation(animation)
								v61.Priority = Enum.AnimationPriority.Movement
								v61.Looped = true
								tbl46[k] = v61
							end
						end

						local TweenService2 = game:GetService("TweenService")
						local tween2 = nil

						local function fn116()
							if tween2 then
								tween2:Cancel()
								tween2 = nil
							end

							if v59 then
								pcall(function()
									v59:Stop(0.1)
								end)

								v59 = nil
								str12 = ""
							end

							fn113()
						end

						local function fn117(arg)
							fn116()
							local character = localPlayer3.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")
							humanoid = humanoid and humanoid:FindFirstChildOfClass("Animator")
							if not humanoid then
								return
							end
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://" .. arg
							local v60 = humanoid:LoadAnimation(animation)

							if localPlayer3.Character ~= character then
								pcall(function()
									v60:Destroy()
								end)

								return
							end

							v60.Priority = Enum.AnimationPriority.Movement
							v60.Looped = true
							v59 = v60
							str12 = arg
						end

						local connection33 = nil

						local function fn118(arg)
							if connection33 then
								connection33:Disconnect()
								connection33 = nil
							end

							if not arg then
								return
							end

							connection33 = arg.AnimationPlayed:Connect(function(arg2)
								local str13 = options.WalkAnimation and options.WalkAnimation.Value or "Normal"
								local flying = tbl23 and tbl23.Flying
								local match = arg2.Animation and arg2.Animation.AnimationId:match("%d+") or ""
								if str13 == "Normal" and not flying then
									return
								end

								if match == "7815618175" then
									local character = localPlayer3.Character
									character = character and character:FindFirstChildOfClass("Humanoid")

									if character and character.MoveDirection ~= Vector3.new() then
										arg2:Stop()
									end
								end
							end)
						end

						fn118(localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid"))

						localPlayer3.CharacterAdded:Connect(function(character)
							if v59 then
								pcall(function()
									v59:Stop(0)
								end)
							end

							v59 = nil
							str12 = ""

							task.spawn(function()
								local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 5)
								if not humanoid then
									return
								end

								if not (humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)) then
									return
								end

								if not character:FindFirstChild("HumanoidRootPart") then
									character:WaitForChild("HumanoidRootPart", 5)
								end

								fn118(humanoid)
								local str13 = options.WalkAnimation and options.WalkAnimation.Value or "Normal"

								if str13 ~= "Normal" and str13 ~= "Flying" then
									local str14 = tbl44[str13] or ""

									if str14 ~= "" then
										fn117(str14)
									end
								end
							end)
						end)

						options.WalkAnimation:OnChanged(function(arg)
							fn116()

							if arg ~= "Normal" and arg ~= "Flying" then
								local str13 = tbl44[arg] or ""

								if str13 ~= "" then
									task.spawn(function()
										fn117(str13)
										local character = localPlayer3.Character
										character = character and character:FindFirstChildOfClass("Humanoid")
										if not (v59 and character and character.MoveDirection ~= Vector3.new()) then
											return
										end

										pcall(function()
											v59:Play(0.1)
										end)

										pcall(function()
											v59:AdjustSpeed(options.WalkAnimSpeed and options.WalkAnimSpeed.Value or 1)
										end)
									end)
								end
							end
						end)

						local connection34 = RunService.Heartbeat:Connect(function()
							local str13 = options.WalkAnimation and options.WalkAnimation.Value or "Normal"
							if str13 == "Normal" then
								fn116()
								return
							end
							local character = localPlayer3.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")
							if not (character and humanoid) then
								fn116()
								return
							end
							local flag30 = humanoid.Health <= 0

							if not flag30 then
								local dead = Enum.HumanoidStateType.Dead
								flag30 = humanoid:GetState() == dead
							end

							if flag30 then
								fn116()
								return
							end

							if str13 == "Flying" then
								if v59 then
									pcall(function()
										v59:Stop(0.1)
									end)

									v59 = nil
									str12 = ""
								end

								if not next(tbl46) then
									task.spawn(fn115)
									return
								end
								local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
								if not humanoidRootPart2 then
									return
								end

								if humanoid.MoveDirection == Vector3.new() then
									fn114(nil)
									return
								end
								local flag31 = UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter
								local v60 = math.round(humanoid.MoveDirection:Dot(humanoidRootPart2.CFrame.LookVector))
								local v61 = math.round(humanoid.MoveDirection:Dot(humanoidRootPart2.CFrame.RightVector))
								local tbl47

								if flag31 then
									tbl47 = {}

									if v60 == 1 then
										table.insert(tbl47, "Forward")
									elseif v60 == -1 then
										table.insert(tbl47, "Back")
									end

									if v61 == 1 then
										table.insert(tbl47, "Right")
									elseif v61 == -1 then
										table.insert(tbl47, "Left")
									end

									if #tbl47 == 0 then
										tbl47 = nil
									end
								else
									tbl47 = { "Forward" }
								end

								fn114(tbl47)

								for _, v62 in pairs(tbl46) do
									if v62.IsPlaying then
										pcall(v62.AdjustSpeed, v62, options.WalkAnimSpeed and options.WalkAnimSpeed.Value or 1)
									end
								end

								return
							end

							if next(tbl46) then
								fn113()
							end

							local str14 = tbl44[str13] or ""
							if str14 == "" then
								fn116()
								return
							end

							if str12 ~= str14 then
								task.spawn(fn117, str14)
								return
							end

							if humanoid.MoveDirection == Vector3.new() then
								if v59 and v59.IsPlaying then
									pcall(function()
										v59:Stop(0.1)
									end)

									if tween2 then
										tween2:Cancel()
										tween2 = nil
									end

									if (options.IdleAnimation and options.IdleAnimation.Value or "Normal") == "Normal" then
										task.spawn(function()
											RunService.RenderStepped:Wait()
										end)
									end
								end

								return
							end

							if v59 and not v59.IsPlaying then
								pcall(function()
									v59:Play(0.1)
								end)

								if str14 == "17860467628" then
									pcall(function()
										v59:AdjustSpeed(0)
									end)

									pcall(function()
										v59.TimePosition = 1.25
									end)

									if tween2 then
										tween2:Cancel()
										tween2 = nil
									end

									tween2 = TweenService2:Create(v59, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true, 0), { TimePosition = 1.5 })
									tween2:Play()
								end
							end

							if v59 and str14 ~= "17860467628" then
								pcall(function()
									v59:AdjustSpeed(options.WalkAnimSpeed and options.WalkAnimSpeed.Value or 1)
								end)
							end
						end)

						table.insert(tbl24, function()
							if connection33 then
								connection33:Disconnect()
								connection33 = nil
							end

							if connection34 then
								connection34:Disconnect()
								connection34 = nil
							end

							if tween2 then
								tween2:Cancel()
								tween2 = nil
							end

							fn116()

							pcall(function()
								options.WalkAnimation:SetValue("Normal")
							end)
						end)

						task.spawn(function()
							local str13 = options.WalkAnimation and options.WalkAnimation.Value or "Normal"
							if str13 == "Normal" then
								return
							end
							local character = localPlayer3.Character
							character = character and character:FindFirstChildOfClass("Humanoid")
							character = character and character:FindFirstChildOfClass("Animator")

							if character then
								local tbl47 = { ["7815618175"] = true, ["14516273501"] = true, ["13935548552"] = true }

								for _, v60 in ipairs(character:GetPlayingAnimationTracks()) do
									if tbl47[v60.Animation and v60.Animation.AnimationId:match("%d+") or ""] then
										v60:Stop(0)
									end
								end
							end

							if str13 ~= "Flying" then
								local str14 = tbl44[str13] or ""

								if str14 ~= "" then
									fn117(str14)
									local character2 = localPlayer3.Character
									character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

									if v59 and character2 and character2.MoveDirection ~= Vector3.new() then
										pcall(function()
											v59:Play(0.1)
										end)

										pcall(function()
											v59:AdjustSpeed(options.WalkAnimSpeed and options.WalkAnimSpeed.Value or 1)
										end)
									end
								end
							else
								fn115()
							end
						end)
					end

					local v48 = nil
					local v49 = nil
					local connection21 = nil
					local connection22 = nil
					local tbl32 = { Spin = "188632011", Crazy = "68339848" }
					local tbl33 = { "68339848", "283545583" }

					local function fn91()
						if v48 then
							pcall(function()
								v48:Stop(0)
							end)

							v48 = nil
						end
					end

					local function fn92()
						if v49 then
							pcall(function()
								v49:Stop(0)
							end)

							v49 = nil
						end
					end

					local function fn93()
						if connection21 then
							connection21:Disconnect()
							connection21 = nil
						end

						if connection22 then
							connection22:Disconnect()
							connection22 = nil
						end

						fn91()
						fn92()
						local n15 = math.random() * 0.15 + 0.05
						local n16 = -1
						local flag23 = false
						local flag24 = false

						local function fn94(arg, arg2)
							local animation = Instance.new("Animation")
							animation.AnimationId = "rbxassetid://" .. arg2

							local ok, result = pcall(function()
								return arg:LoadAnimation(animation)
							end)

							if ok and result then
								result.Priority = Enum.AnimationPriority.Action3
								result.Looped = false
								return result
							end
						end

						connection22 = RunService.RenderStepped:Connect(function()
							if getgenv().InvisActive then
								return
							end

							if (options.LoopedAnimation and options.LoopedAnimation.Value or "None") ~= "Crazy" then
								return
							end

							if flag23 and v48 then
								if not v48.IsPlaying then
									pcall(v48.Play, v48)
								end

								pcall(v48.AdjustWeight, v48, 1e9)
							end

							if flag24 and v49 then
								if not v49.IsPlaying then
									pcall(v49.Play, v49)
								end

								pcall(v49.AdjustWeight, v49, 1e9)
							end
						end)

						connection21 = RunService.Heartbeat:Connect(function(deltaTime)
							if getgenv().InvisActive then
								if flag23 or flag24 then
									flag23 = false
									flag24 = false

									pcall(function()
										if v48 then
											v48:Stop(0)
										end
									end)

									pcall(function()
										if v49 then
											v49:Stop(0)
										end
									end)
								end

								return
							end

							local str10 = options.LoopedAnimation and options.LoopedAnimation.Value or "None"
							local v50 = tbl32[str10]
							local character = localPlayer3.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")
							local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
							if not (character and humanoid and animator) then
								fn91()
								return
							end

							if not v50 then
								if v48 and v48.IsPlaying then
									fn91()
								end

								return
							end

							if not v48 or not v48.Animation.AnimationId:match(v50) then
								fn91()
								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. v50

								local ok, result = pcall(function()
									return animator:LoadAnimation(animation)
								end)

								if ok and result then
									v48 = result
									v48.Priority = Enum.AnimationPriority.Action3
									v48.Looped = str10 ~= "Crazy"
								end

								n15 = math.random() * 0.15 + 0.05
								n16 = -1
							end

							if str10 == "Crazy" then
								local n17 = options.LoopedAnimationSpeed and options.LoopedAnimationSpeed.Value or 1

								if n16 >= 0 then
									n16 -= deltaTime

									if n16 <= 0 then
										n16 = -1
										n15 = math.random() * 0.6 + 0.4
									end
								elseif not flag23 and not flag24 then
									n15 -= deltaTime

									if n15 <= 0 then
										local flag25 = math.random(1, 10) <= 6

										if (v49 and v49.Animation and v49.Animation.AnimationId:match("%d+") or "") ~= tbl33[2] then
											fn92()
											v49 = fn94(animator, tbl33[2])
										end

										flag24 = true
										pcall(v49.Play, v49)

										pcall(function()
											v49:AdjustSpeed(n17 * 2)
										end)

										if flag25 then
											if (v48 and v48.Animation and v48.Animation.AnimationId:match("%d+") or "") ~= tbl33[1] then
												fn91()
												v48 = fn94(animator, tbl33[1])
											end

											flag23 = true
											pcall(v48.Play, v48)

											pcall(function()
												v48:AdjustSpeed(n17 * 3)
											end)

											task.delay(math.random() * 0.03 + 0.03, function()
												if str10 ~= "Crazy" then
													return
												end
												flag23 = false

												pcall(function()
													if v48 then
														v48:Stop(0)
													end
												end)
											end)
										end

										task.delay(math.random() * 0.04 + 0.04, function()
											if str10 ~= "Crazy" then
												return
											end
											flag24 = false

											pcall(function()
												if v49 then
													v49:Stop(0)
												end
											end)

											n16 = math.random() * 0.05
										end)
									end
								end
							elseif v48 then
								v48.Looped = true

								if not v48.IsPlaying then
									v48:Play()
								end

								pcall(function()
									v48:AdjustSpeed(options.LoopedAnimationSpeed and options.LoopedAnimationSpeed.Value or 1)
								end)
							end
						end)
					end

					fn93()

					localPlayer3.CharacterAdded:Connect(function(character)
						local humanoid = character:WaitForChild("Humanoid", 10)
						if not humanoid then
							return
						end

						if not humanoid:WaitForChild("Animator", 10) then
							return
						end
						task.wait(0.1)
						fn93()
					end)

					table.insert(tbl24, function()
						if connection21 then
							connection21:Disconnect()
							connection21 = nil
						end

						if connection22 then
							connection22:Disconnect()
							connection22 = nil
						end

						fn91()
						fn92()

						pcall(function()
							options.LoopedAnimation:SetValue("None")
						end)
					end)

					local flag23 = true

					if flag10 then
						flag23 = v36
					end

					if flag23 then
						v36:AddDivider({ Text = "Block" })

						v36:AddDropdown("CustomBlockAnimation", {
							Values = { "Normal", "One Hand", "Gojo", "Infinity", "Boxer" },
							Default = 1,
							Multi = false,
							Text = "Block Animation",
						})

						v36:AddDivider({ Text = "UI React" })
						v36:AddToggle("UIReactEnabled", { Text = "Ultra Instinct Reaction", Default = false })
						v36:AddSlider("UIReactVolume", { Text = "Volume", Default = 1, Min = 0, Max = 1, Rounding = 1 })
						local connection23 = nil
						local connection24 = nil
						local flag24 = true

						local function fn94()
							if connection23 then
								connection23:Disconnect()
								connection23 = nil
							end

							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end

							_isBlocking = false
							_suppressNext = false
							local character = localPlayer3.Character
							if not character then
								return
							end
							local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 10)
							if not (character and humanoid) then
								return
							end

							connection23 = humanoid.AnimationPlayed:Connect(function(arg)
								local value = options.CustomBlockAnimation.Value
								local animationId = arg.Animation.AnimationId

								if (animationId:match("10470389827") or animationId:match("13380778193") or animationId:match("13935548552")) and value ~= "Normal" then
									if toggles.InvisibleMoves_Block.Value then
										arg:AdjustWeight(-999999)
									else
										arg:Stop()
									end
								end
							end)

							local tbl34 = {
								"133094662049155",
								"134711731729986",
								"76963965406296",
								"92546791251633",
								"128188725134114",
								"109088632860488",
								"78339272602733",
								"127015697036075",
							}

							local tbl35 = { "72555434288985", "91067294642442", "104124534923268" }
							local n15 = 0
							local v50 = nil
							local n16 = 1
							local v51 = nil

							local function fn95()
								if v50 and v50.IsPlaying then
									v50:Stop()
								end

								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. tbl34[n16]
								v50 = humanoid:LoadAnimation(animation)
								v50.Priority = Enum.AnimationPriority.Action4
								v50:Play(0.05)
								v50.TimePosition = 0.2
								v50:AdjustSpeed(1.2)
								n16 += 1

								if #tbl34 < n16 then
									n16 = 1
								end

								local sound = Instance.new("Sound", character:FindFirstChild("HumanoidRootPart") or character)
								sound.SoundId = "rbxassetid://" .. tbl35[math.random(1, #tbl35)]
								sound.Volume = options.UIReactVolume.Value
								sound:Play()

								task.delay(sound.TimeLength + 4, function()
									pcall(function()
										sound:Destroy()
									end)
								end)
							end

							connection24 = character:GetAttributeChangedSignal("BlockReact"):Connect(function()
								if not toggles.UIReactEnabled.Value then
									return
								end
								local n17 = math.abs(character:GetAttribute("BlockReact") or 0)

								if n15 < n17 or math.abs(n17 - n15) > 1 then
									fn95()
								end

								n15 = n17
							end)

							task.spawn(function()
								local str10

								while flag24 and localPlayer3.Character == character do
									while true do
										task.wait()
										if not flag24 or localPlayer3.Character ~= character then
											return
										end

										if character:GetAttribute("Blocking") ~= true then
											continue
										end
										local value = options.CustomBlockAnimation.Value
										local str11 = value == "Normal" and ""

										if str11 then
											str10 = str11
										else
											local str12 = value == "One Hand" and "17097146599"

											if str12 then
												str10 = str12
											else
												local str13 = value == "Gojo" and "18459178353"

												if str13 then
													str10 = str13
												else
													local str14 = value == "Infinity" and "15020965094"

													if str14 then
														str10 = str14
													else
														str10 = value == "Boxer" and "14616272668" or ""
													end
												end
											end
										end

										if not str10:match("^%s*$") then
											break
										end
									end

									if not flag24 or localPlayer3.Character ~= character then
										return
									end
									local v52 = nil

									pcall(function()
										local animation = Instance.new("Animation")
										animation.AnimationId = "rbxassetid://" .. str10
										v52 = humanoid:LoadAnimation(animation)
									end)

									if not v52 then
										task.wait(0.1)
									else
										v51 = v52

										pcall(function()
											if not v52.IsPlaying then
												v52.Looped = true
												v52:Play()

												if str10 == "17097146599" then
													v52.TimePosition = 1
													v52:AdjustSpeed(0)
												elseif str10 == "18459178353" then
													v52.TimePosition = 0.5
													v52:AdjustSpeed(0)
												elseif str10 == "15020965094" then
													v52.TimePosition = 1
													v52:AdjustSpeed(0)
												elseif str10 == "14616272668" then
													v52.TimePosition = 0.25
													v52:AdjustSpeed(0)
													game:GetService("TweenService"):Create(v52, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true, 0), { TimePosition = 0.4 }):Play()
												end
											end
										end)

										while true do
											task.wait()
											if not (character:GetAttribute("Blocking") ~= true or not flag24 or localPlayer3.Character ~= character) then
												continue
											end
											break
										end

										pcall(function()
											if v52 then
												v52:Stop(0.1)
											end
										end)

										v51 = nil
									end
								end
							end)
						end

						if localPlayer3.Character then
							task.spawn(fn94)
						end

						local connection25 = localPlayer3.CharacterAdded:Connect(function(character)
							character:WaitForChild("Humanoid", 10)
							task.spawn(fn94)
						end)

						table.insert(tbl24, function()
							flag24 = false

							if connection23 then
								connection23:Disconnect()
								connection23 = nil
							end

							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end

							if connection25 then
								connection25:Disconnect()
								connection25 = nil
							end

							pcall(function()
								toggles.UIReactEnabled:SetValue(false)
							end)

							pcall(function()
								options.CustomBlockAnimation:SetValue("Normal")
							end)
						end)
					end

					local flag24 = true

					if flag10 then
						flag24 = tbl17.Misc
					end

					if flag24 and v35 then
						local tbl34 = {
							{ trigger = "10468665991", label = "Normal Punch", key = "NP" },
							{ trigger = "10466974800", label = "Consecutive Punches", key = "CP" },
							{ trigger = "10471336737", label = "Shove", key = "SH" },
							{ trigger = "12510170988", label = "Uppercut", key = "UC" },
						}

						local tbl35 = {
							NP = {
								{
									name = "Open",
									id = "18903642853",
									timePos = 3.3,
									speed = nil,
									stopAfter = 1,
									stopFade = 0.2,
								},
								{ name = "Kick", id = "18897648446", timePos = 3.1, speed = 1.5, stopAfter = nil },
								{
									name = "Point",
									id = "14498295360",
									timePos = nil,
									speed = 2,
									stopAfter = 1,
									stopFade = 0.4,
								},
								{
									name = "Ravaging Kick",
									id = "16945550029",
									timePos = 4,
									speed = 1.8,
									stopAfter = nil,
									speed2 = 1.2,
									speed2trigger = 5.1,
								},
								{
									name = "Strengthness",
									id = "140164642047188",
									timePos = 6.9,
									speed = nil,
									stopAfter = 0.4,
									stopFade = 0.2,
									id2 = "79761806706382",
									timePos2 = 3,
								},
								{
									name = "God's Fear",
									id = "129123960742438",
									timePos = 11.48,
									speed = 1.5,
									stopAfter = nil,
									stopFade = 0.1,
								},
								{
									name = "The Right Way",
									id = "125265459886863",
									timePos = 8,
									speed = 1.8,
									stopAfter = nil,
									stopFade = 0.2,
								},
							},
							CP = {
								{ name = "Blue", id = "13560306510", timePos = nil, speed = 2.7, stopAfter = nil },
								{
									name = "Barrage",
									id = "16945550029",
									timePos = 2,
									speed = nil,
									stopAfter = nil,
									stopTrigger = 3.6,
									stopFade = 0.5,
								},
								{
									name = "Fury",
									id = "12273188754",
									timePos = nil,
									speed = 2,
									stopAfter = nil,
									cpLoop = true,
								},
								{
									name = "God Slayer",
									id = "129123960742438",
									timePos = 9.2,
									speed = nil,
									stopAfter = nil,
									stopTrigger = 10.8,
									stopFade = 0.1,
								},
								{
									name = "Fission",
									id = "71181015443030",
									timePos = 4.9,
									speed = nil,
									stopAfter = nil,
									stopFade = 0.1,
								},
								{
									name = "Ripping Fist",
									id = "125265459886863",
									timePos = 1.65,
									speed = 1.5,
									stopAfter = nil,
									stopTrigger = 4.25,
									stopFade = 0.2,
								},
								{
									name = "Finishin'",
									id = "75127576841159",
									timePos = 1.1,
									speed = 2,
									stopAfter = nil,
									stopFade = 0.2,
								},
							},
							SH = {
								{
									name = "Slap",
									id = "18440389930",
									timePos = 1.2,
									speed = nil,
									stopAfter = 0.6,
									stopFade = 0.4,
								},
								{ name = "Kick", id = "18181348446", timePos = nil, speed = nil, stopAfter = nil },
								{
									name = "Vanishing",
									id = "18897118507",
									timePos = 2.2,
									speed = 1,
									stopAfter = nil,
									id2 = "17838619895",
									timePos2 = 0.45,
								},
								{
									name = "Sweep",
									randIds = { "16944265635", "16944345619" },
									timePos = nil,
									speed = nil,
									stopAfter = nil,
								},
								{ name = "Rage", id = "79761806706382", timePos = 2.7, speed = nil, stopAfter = nil },
								{ name = "Reverse", id = "15124762088", timePos = nil, speed = nil, stopAfter = nil },
							},
							UC = {
								{
									name = "Neck Destroyer",
									id = "18179181663",
									timePos = nil,
									speed = nil,
									stopAfter = nil,
								},
								{
									name = "Throw",
									id = "136370737633649",
									timePos = 1,
									speed = nil,
									stopAfter = 1,
									stopFade = 0.45,
								},
								{
									name = "Jaw Breaker",
									id = "97347443597947",
									timePos = 3.6,
									speed = 0.9,
									stopAfter = nil,
									stopFade = 0.1,
								},
							},
						}

						v35:AddToggle("CustomSaitamaEnabled", { Text = "Enable Custom Saitama Anims", Default = false })
						v35:AddDivider({ Text = "Moves" })

						for _, v50 in ipairs(tbl34) do
							local tbl36 = { "Default", "Random" }

							for _, v51 in ipairs(tbl35[v50.key]) do
								table.insert(tbl36, v51.name)
							end

							v35:AddDropdown("CSA_" .. v50.key, { Text = v50.label, Values = tbl36, Default = 1, Multi = false, Searchable = false })

							if v50.key == "CP" then
								v35:AddToggle("NoBarrageArms", { Text = "Remove Barrage Arms", Default = false })
							end
						end

						local connection23 = nil
						local v50 = nil
						local connection24 = nil

						local function fn94(arg)
							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end

							if not arg then
								return
							end

							connection24 = arg.ChildAdded:Connect(function(child)
								if not toggles.NoBarrageArms.Value then
									return
								end

								if localPlayer3:GetAttribute("Character") ~= "Bald" then
									return
								end

								if child.Name ~= "BarrageBind" then
									return
								end

								pcall(function()
									child:SetAttribute("Times", nil)
								end)

								task.defer(function()
									pcall(function()
										child:Destroy()
									end)
								end)
							end)

							for _, child in pairs(arg:GetChildren()) do
								if child.Name ~= "BarrageBind" then
									continue
								elseif localPlayer3:GetAttribute("Character") == "Bald" then
									pcall(function()
										child:SetAttribute("Times", nil)
									end)

									task.defer(function()
										pcall(function()
											child:Destroy()
										end)
									end)

									continue
								end

								break
							end
						end

						local function fn95(arg)
							local function fn96(descendant)
								if descendant:IsA("BodyVelocity") then
									descendant.Velocity = Vector3.new(descendant.Velocity.X, 0, descendant.Velocity.Z)
								end
							end

							local connection25 = arg.DescendantAdded:Connect(fn96)

							for _, descendant in pairs(arg:GetDescendants()) do
								fn96(descendant)
							end

							return connection25
						end

						local function fn96(arg)
							if connection23 then
								connection23:Disconnect()
								connection23 = nil
							end

							v50 = arg
							if not arg then
								return
							end

							connection23 = arg.AnimationPlayed:Connect(function(arg2)
								if not toggles.CustomSaitamaEnabled.Value then
									return
								end
								local match = (arg2.Animation and arg2.Animation.AnimationId or ""):match("%d+")
								if not match then
									return
								end
								local v51 = nil

								for _, v52 in ipairs(tbl34) do
									if match == v52.trigger then
										v51 = v52
										break
									else
										v51 = nil
									end
								end

								if not v51 then
									return
								end
								local str10 = options["CSA_" .. v51.key] and options["CSA_" .. v51.key].Value or "Default"
								if str10 == "Default" then
									return
								end
								local v52 = tbl35[v51.key]
								local v53 = nil

								if str10 == "Random" then
									v53 = v52[math.random(1, #v52)]
								else
									for _, v54 in ipairs(v52) do
										if v54.name == str10 then
											v53 = v54
											break
										end
									end
								end

								if not v53 then
									return
								end
								arg2:AdjustWeight(-9999999, 0)
								local character = localPlayer3.Character
								local bv = character and v53.bv and fn95(character) or nil
								local id = v53.id

								if v53.randIds then
									id = v53.randIds[math.random(1, #v53.randIds)]
								end

								local animation = Instance.new("Animation")
								animation.AnimationId = "rbxassetid://" .. id
								local v54 = arg:LoadAnimation(animation)
								v54.Priority = Enum.AnimationPriority.Action3
								v54:Play(0.1)

								if v53.speed then
									v54:AdjustSpeed(v53.speed)
								end

								if v53.timePos then
									v54.TimePosition = v53.timePos
								end

								arg2.Stopped:Connect(function()
									pcall(function()
										v54:Stop(v53.stopFade or 0.25)
									end)
								end)

								if v53.id2 then
									task.spawn(function()
										local function fn97()
											local animation2 = Instance.new("Animation")
											animation2.AnimationId = "rbxassetid://" .. v53.id2
											local v55 = arg:LoadAnimation(animation2)
											v55.Priority = Enum.AnimationPriority.Action3
											v55:Play(v53.stopFade or 0.1)

											if v53.timePos2 then
												v55.TimePosition = v53.timePos2
											end

											v55.Stopped:Connect(function()
												if bv then
													bv:Disconnect()
													bv = nil
												end
											end)
										end

										if v53.stopAfter then
											task.wait(v53.stopAfter)

											if v54.IsPlaying then
												pcall(function()
													v54:Stop(v53.stopFade or 0)
												end)
											end

											fn97()
										else
											while true do
												task.wait()
												if not (v54.TimePosition >= 2.25 or not v54.IsPlaying) then
													continue
												end
												break
											end

											v54:Stop(0)
											fn97()
										end
									end)
								else
									if v53.speed2 and v53.speed2trigger then
										task.spawn(function()
											while true do
												task.wait()
												if not (v54.TimePosition >= v53.speed2trigger or not v54.IsPlaying) then
													continue
												end
												break
											end

											if v54.IsPlaying then
												v54:AdjustSpeed(v53.speed2)
											end
										end)
									end

									if v53.stopTrigger then
										task.spawn(function()
											while true do
												task.wait()
												if not (v54.TimePosition >= v53.stopTrigger or not v54.IsPlaying) then
													continue
												end
												break
											end

											pcall(function()
												v54:Stop(v53.stopFade or 0)
											end)
										end)
									elseif v53.stopAfter then
										task.delay(v53.stopAfter, function()
											pcall(function()
												v54:Stop(v53.stopFade or 1)
											end)
										end)
									end

									if v53.cpLoop then
										task.spawn(function()
											for i = 1, 4 do
												while true do
													task.wait()
													if not (v54.TimePosition >= 0.9 or not v54.IsPlaying) then
														continue
													end
													break
												end

												if v54.IsPlaying then
													v54.TimePosition = 0.6
													continue
												end
												break
											end
										end)
									end

									v54.Stopped:Connect(function()
										if bv then
											bv:Disconnect()
											bv = nil
										end
									end)
								end
							end)
						end

						local connection25 = RunService.Heartbeat:Connect(function()
							local character = localPlayer3.Character
							if not character then
								return
							end
							local humanoid = character:FindFirstChildOfClass("Humanoid")

							if humanoid ~= v50 then
								fn96(humanoid)
								fn94(character)
							end
						end)

						table.insert(tbl24, function()
							if connection23 then
								connection23:Disconnect()
								connection23 = nil
							end

							if connection25 then
								connection25:Disconnect()
								connection25 = nil
							end

							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end

							v50 = nil

							pcall(function()
								toggles.CustomSaitamaEnabled:SetValue(false)
							end)

							pcall(function()
								toggles.NoBarrageArms:SetValue(false)
							end)
						end)
					end

					local flag25 = false
					local flag26 = false
					getgenv()._revenantDashCooldown = false
					getgenv()._revenantDashCooldownUntil = nil
					getgenv()._revenantTechActive = false
					getgenv()._wcDashOnCooldown = false
					getgenv()._revenantTechFiring = false
					local tbl34 = {}

					local function fn94(arg)
						for _, v50 in ipairs(tbl34) do
							pcall(function()
								v50:Disconnect()
							end)
						end

						tbl34 = {}
						if not arg then
							return
						end
						local humanoid = arg:FindFirstChildOfClass("Humanoid")
						if not humanoid then
							return
						end

						local function fn95(arg2)
							if not arg2 or not arg2.Animation then
								return
							end
							local str10 = tostring(arg2.Animation.AnimationId or "")

							if str10:find("10479335397", 1, true) or str10:find("14357943487", 1, true) or str10:find("13380255751", 1, true) or str10:find("10491993682", 1, true) then
								flag25 = true
								flag26 = true
								getgenv()._wcDashOnCooldown = true

								task.delay(6, function()
									flag25 = false
									flag26 = false
									getgenv()._wcDashOnCooldown = false
								end)
							end
						end

						table.insert(tbl34, humanoid.AnimationPlayed:Connect(fn95))
						local animator = humanoid:FindFirstChildOfClass("Animator")

						if animator then
							table.insert(tbl34, animator.AnimationPlayed:Connect(fn95))
						end
					end

					task.spawn(function()
						fn94(localPlayer3.Character)
					end)

					localPlayer3.CharacterAdded:Connect(function(character)
						task.spawn(function()
							task.wait(0.1)
							fn94(character)
						end)
					end)

					table.insert(tbl24, function()
						for _, v50 in ipairs(tbl34) do
							pcall(function()
								v50:Disconnect()
							end)
						end

						tbl34 = {}
						flag25 = false
						flag26 = false
						getgenv()._revenantDashCooldown = false
						getgenv()._revenantDashCooldownUntil = nil
					end)

					local flag27 = false
					local connection23 = nil
					local flag28 = nil

					local function fn95()
						local tbl35 = {}
						local live = workspace:FindFirstChild("Live")
						if not live then
							return tbl35
						end
						local character = localPlayer3.Character

						for _, child in pairs(live:GetChildren()) do
							if child ~= character and child:FindFirstChild("Ok") then
								table.insert(tbl35, child)
							end
						end

						return tbl35
					end

					Automation:AddToggle("AutoGodslayerTP", {
						Text = "Auto Cosmic Garou",
						Tooltip = "If you mark someone using Hunters Mark and use Godslayer this will automatically teleport to someone that is marked",
						Default = false,
						Callback = function(arg)
							flag27 = arg

							if arg then
								if connection23 then
									connection23:Disconnect()
								end

								connection23 = RunService.Heartbeat:Connect(function()
									local character = localPlayer3.Character
									if not character then
										return
									end

									if character:GetAttribute("AbsoluteImmortal") then
										return
									end
									local humanoid = character:FindFirstChildOfClass("Humanoid")
									if not humanoid or humanoid.Health <= 0 then
										return
									end
									local animator = humanoid:FindFirstChildOfClass("Animator")
									if not animator then
										return
									end

									for _, v50 in pairs(animator:GetPlayingAnimationTracks()) do
										if v50.Animation and v50.Animation.AnimationId:match("107484339495811") and v50.TimePosition >= 0.3 then
											local live = workspace:FindFirstChild("Live")
											local v51 = flag28 and live
											local flag29 = false

											if v51 then
												flag29 = flag28.Parent == live and flag28:FindFirstChild("Ok") ~= nil
											end

											if not flag29 then
												local v52 = fn95()
												flag28 = #v52 > 0 and v52[1] or nil
											end

											if not flag28 then
												return
											end
											local humanoidRootPart2 = flag28:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart2 then
												local cFrame2 = humanoidRootPart2.CFrame * CFrame.new(0, 0, 2)
												local humanoidRootPart3 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

												if flag11 and humanoidRootPart3 then
													humanoidRootPart3.CFrame = cFrame2
													humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
													humanoidRootPart3.AssemblyAngularVelocity = Vector3.zero
													pcall(sethiddenproperty, humanoidRootPart3, "PhysicsRepRootPart", humanoidRootPart2)

													RunService.Heartbeat:Once(function()
														pcall(sethiddenproperty, humanoidRootPart3, "PhysicsRepRootPart", nil)
													end)
												else
													RunService.Heartbeat:Once(function()
														RunService.Heartbeat:Once(function()
															local humanoidRootPart4 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

															if humanoidRootPart4 then
																humanoidRootPart4.CFrame = cFrame2
															end
														end)
													end)
												end
											end

											return
										end
									end
								end)
							else
								if connection23 then
									connection23:Disconnect()
									connection23 = nil
								end

								flag28 = nil
							end
						end,
					})

					table.insert(tbl24, function()
						flag27 = false
						flag28 = nil

						if connection23 then
							connection23:Disconnect()
							connection23 = nil
						end

						pcall(function()
							toggles.AutoGodslayerTP:SetValue(false)
						end)
					end)

					if flag10 then
						Automation:AddButton({
							Text = "Free Stargazer / Nightchild",
							Func = function()
								local character = localPlayer3.Character
								character = character and character:FindFirstChild("Communicate")

								if character then
									character:FireServer({ Goal = "Gaze" })
								end
							end,
						})
					end
				end, tostring)

				if not ok then
					warn("[Revenant FEATURES ERROR]: " .. tostring(result))
				end

				local tbl28 = {
					{ "RevenantFlyBind", "RevenantFly" },
					{ "AnimeTPKeybind", "AnimeTeleportation" },
					{ "L-OnKeybind", "Lock-on" },
					{ "KPInvis", "TogInvis" },
					{ "KPHeadFloat", "TogHeadFloat" },
					{ "KPJerk", "TogJerk" },
					{ "KPBang", "TogBang" },
					{ "KPTPose", "TogTPose" },
					{ "KPFUC", "TogFUC" },
					{ "TouchFlingBind", "TouchFlingEnabled" },
					{ "KPWeld", "TogWeld" },
					{ "TP1Bind", "TP1" },
					{ "TP2Bind", "TP2" },
					{ "Take40Bind", "Take40Health" },
				}

				local connection18 = nil

				connection18 = RunService.RenderStepped:Connect(function()
					if v24.Unloaded then
						if connection18 then
							connection18:Disconnect()
							connection18 = nil
						end

						return
					end

					for _, v43 in ipairs(tbl28) do
						local v44 = toggles[v43[2]]
						local v45 = options[v43[1]]

						if v44 and v45 and type(v45.KeybindsToggle) == "table" then
							local flag17 = v44.Value == true
							v45.ForceListHidden = not flag17
							v45.KeybindsToggle:SetVisibility(flag17)
						end
					end
				end)

				if getgenv()._disguiseAutoApply then
					getgenv()._disguiseAutoApply()
				end

				getgenv()._RevenantFeaturesReady = true
			end)

			if tbl16[str8] then
				local folder = Instance.new("Folder")
				folder.Name = "RemovedTrees"
				folder.Parent = game:GetService("CoreGui")
				local folder2 = Instance.new("Folder")
				folder2.Name = "RemovedWalls"
				folder2.Parent = game:GetService("CoreGui")
				local connection18 = nil
				local Lighting = game:GetService("Lighting")
				World:AddDivider({ Text = "Removers" })

				World:AddToggle("NoWalls", {
					Text = "No Walls",
					Default = false,
					Callback = function(arg)
						local map = workspace:FindFirstChild("Map")
						if not map then
							return
						end

						if arg then
							for _, child in pairs(map:GetChildren()) do
								if table.find({ "Walls", "GrassTop", "Tunnel", "Part" }, child.Name) then
									child.Parent = folder2
								end
							end
						else
							for _, child in pairs(folder2:GetChildren()) do
								child.Parent = workspace.Map
							end
						end
					end,
				})

				local folder3 = nil
				local CoreGui2 = game:GetService("CoreGui")
				local map = workspace:FindFirstChild("Map")

				for _, child in ipairs(CoreGui2:GetChildren()) do
					if child:IsA("Folder") and child.Name == "RemovedMapParts" then
						if map then
							for _, child2 in ipairs(child:GetChildren()) do
								local v43 = map:FindFirstChild(child2.Name)

								if v43 then
									for _, child3 in ipairs(child2:GetChildren()) do
										child3.Parent = v43
									end

									pcall(function()
										child2:Destroy()
									end)
								else
									child2.Parent = map
								end
							end
						end

						if folder3 then
							pcall(function()
								child:Destroy()
							end)
						else
							folder3 = child
						end
					end
				end

				if not folder3 then
					folder3 = Instance.new("Folder")
					folder3.Name = "RemovedMapParts"
					folder3.Parent = CoreGui2
				end

				local function fn60(name, arg)
					local map2 = workspace:FindFirstChild("Map")
					if not map2 then
						return
					end
					local v43 = map2:FindFirstChild(name)
					local folder4 = folder3:FindFirstChild(name)

					if arg then
						if not v43 then
							return
						end

						if not folder4 then
							folder4 = Instance.new("Folder")
							folder4.Name = name
							folder4.Parent = folder3
						end

						for _, child in ipairs(v43:GetChildren()) do
							child.Parent = folder4
						end
					elseif v43 and folder4 then
						for _, child in ipairs(folder4:GetChildren()) do
							child.Parent = v43
						end
					end
				end

				World:AddToggle("NoBenches", {
					Text = "Remove Benches",
					Default = false,
					Callback = function(arg)
						fn60("Benchs", arg)
					end,
				})

				World:AddToggle("NoFloor", {
					Text = "Remove Floor",
					Default = false,
					Callback = function(arg)
						if not workspace:FindFirstChild("Map") then
							return
						end

						for _, v43 in ipairs({ "Grass", "GrassTop", "GrassBottom", "Floor/Roads", "Stuff" }) do
							fn60(v43, arg)
						end
					end,
				})

				World:AddToggle("NoTrees", {
					Text = "No Trees",
					Default = false,
					Callback = function(arg)
						local trees = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Trees")
						if not trees then
							return
						end

						if arg then
							for _, child in pairs(trees:GetChildren()) do
								child.Parent = folder
							end
						else
							for _, child in pairs(folder:GetChildren()) do
								child.Parent = workspace.Map.Trees
							end
						end
					end,
				})

				if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Trees") then
					connection18 = workspace.Map.Trees.ChildAdded:Connect(function(child)
						if toggles.NoTrees.Value then
							RunService.RenderStepped:Wait()
							child.Parent = folder
						end
					end)
				end

				local function fn61(arg, arg2)
					task.wait()
					local parent = arg.Parent
					arg:Destroy()

					if arg2 then
						warn("Instance removed, Name:", arg.Name, "ClassName:", arg.ClassName, "Parent:", parent)
					end
				end

				local function fn62(arg)
					if not arg then
						return false
					end

					if arg.Name == "ExploFx" then
						return true
					end

					if arg.Name == "Part" and arg:IsA("Part") then
						if pcall(function()
							return arg.Shape
						end) and arg.Shape == Enum.PartType.Ball and math.abs(arg.Size.X - 60) <= 0.5 then
							return true
						end
					end

					return false
				end

				World:AddToggle("NoDebris", {
					Text = "No Debris",
					Default = false,
					Callback = function(arg)
						if arg then
							local thrown = workspace:FindFirstChild("Thrown")

							if thrown then
								for _, child in pairs(thrown:GetChildren()) do
									if (child.Name:lower():find("debris") or child.Name:lower() == "part") and not fn62(child) then
										task.spawn(pcall, fn61, child)
									end
								end
							end
						end
					end,
				})

				World:AddToggle("NoSmoke", {
					Text = "No Smoke",
					Default = false,
					Callback = function(arg)
						if arg then
							local thrown = workspace:FindFirstChild("Thrown")

							if thrown then
								for _, child in pairs(thrown:GetChildren()) do
									if child.Name:lower():find("smoke") then
										task.spawn(pcall, fn61, child)
									end
								end
							end
						end
					end,
				})

				World:AddToggle("NoExplosions", {
					Text = "No Explosions",
					Default = false,
					Callback = function(arg)
						if arg then
							local thrown = workspace:FindFirstChild("Thrown")

							if thrown then
								for _, child in pairs(thrown:GetChildren()) do
									if child.Name:lower():find("explo") and not fn62(child) then
										task.spawn(pcall, fn61, child)
									end
								end
							end
						end
					end,
				})

				workspace.ChildAdded:Connect(function(child)
					if child.Name:lower() == "adjustedhb" and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Stone Coffin") then
						task.spawn(pcall, fn61, child, false)
					end
				end)

				local function fn63(arg)
					arg.ChildAdded:Connect(function(child)
						if fn62(child) then
							return
						end

						if (child.Name:lower():find("debris") or child.Name:lower() == "part") and toggles.NoDebris.Value then
							task.spawn(pcall, fn61, child, false)
						elseif child.Name:lower():find("tree") and toggles.NoTrees.Value then
							task.spawn(pcall, fn61, child, false)
						elseif child.Name:lower():find("smoke") and toggles.NoSmoke.Value then
							task.spawn(pcall, fn61, child, false)
						elseif child.Name:lower():find("explo") and toggles.NoExplosions.Value then
							task.spawn(pcall, fn61, child, false)
						elseif table.find({ "beamed", "adjusted" }, child.Name:lower()) then
							if _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Stone Coffin") then
								for _, descendant in pairs(child:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Transparency = 0.8
										descendant.CollisionGroup = "untouchable"
										descendant.Massless = true
										descendant.CanCollide = false
										descendant.CanTouch = false
										descendant.CanQuery = false
									end
								end
							end
						elseif child:IsA("Part") and child.Size == Vector3.new(20, 20, 20) and child.Shape == Enum.PartType.Ball and _rawget(options.AntiMoves_Tatsumaki.Value, "Anti Stone Coffin") then
							task.spawn(pcall, fn61, child, false)
						end
					end)
				end

				local thrown = workspace:FindFirstChild("Thrown")

				if thrown then
					fn63(thrown)
				else
					workspace.ChildAdded:Connect(function(child)
						if child.Name == "Thrown" then
							fn63(child)
						end
					end)
				end

				World:AddDivider({ Text = "Ambient" })

				World:AddToggle("AmbientEnabled", {
					Text = "Ambient Enabled",
					Default = false,
					Callback = function(arg)
						if arg then
							local ambient = Lighting.Ambient
							Lighting.Ambient = options.AmbientColor.Value

							repeat
								task.wait()
							until not toggles.AmbientEnabled.Value

							Lighting.Ambient = ambient
						end
					end,
				}):AddColorPicker("AmbientColor", {
					Default = Color3.fromRGB(255, 255, 255),
					Title = "Ambient",
					Callback = function(ambient)
						if toggles.AmbientEnabled.Value then
							Lighting.Ambient = ambient
						end
					end,
				})

				World:AddToggle("RainbowAmbient", {
					Text = "Rainbow Ambient",
					Default = false,
					Callback = function(arg)
						if arg then
							repeat
								local n15 = tick() * 2
								options.AmbientColor:SetValueRGB(Color3.fromRGB(math.abs(math.sin(n15)) * 255, math.abs(math.sin(n15 + 1.0471975511965976)) * 255, math.abs(math.sin(n15 + 2.0943951023931953)) * 255))
								options.AmbientColor:Update()
								task.wait(0.03)
							until not toggles.RainbowAmbient.Value

							options.AmbientColor:SetValueRGB(Color3.fromRGB(255, 255, 255))
							options.AmbientColor:Update()
						end
					end,
				})

				World:AddDivider({ Text = "Lighting" })

				World:AddDropdown("LightingPreset", {
					Text = "Lighting Preset",
					Values = { "None", "Warm", "Night", "Sunrising", "Auto-Sky" },
					Default = "None",
					Callback = function(arg)
						local function fn64()
							if getgenv()._lightingPresetOrig then
								return
							end

							local lightingPresetOrig = {
								ClockTime = Lighting.ClockTime,
								Brightness = Lighting.Brightness,
								ExposureCompensation = Lighting.ExposureCompensation,
								Ambient = Lighting.Ambient,
								OutdoorAmbient = Lighting.OutdoorAmbient,
								FogColor = Lighting.FogColor,
								FogStart = Lighting.FogStart,
								FogEnd = Lighting.FogEnd,
								GeographicLatitude = Lighting.GeographicLatitude,
								ShadowSoftness = Lighting.ShadowSoftness,
								GlobalShadows = Lighting.GlobalShadows,
								EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
								EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
								Technology = Lighting.Technology,
							}

							getgenv()._lightingPresetOrig = lightingPresetOrig
							local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

							if atmosphere then
								local atmo = {
									Density = atmosphere.Density,
									Offset = atmosphere.Offset,
									Color = atmosphere.Color,
									Decay = atmosphere.Decay,
									Glare = atmosphere.Glare,
									Haze = atmosphere.Haze,
								}

								getgenv()._lightingPresetOrig.Atmo = atmo
							end

							local sunRaysEffect = Lighting:FindFirstChildOfClass("SunRaysEffect")

							if sunRaysEffect then
								local sunRays = { Intensity = sunRaysEffect.Intensity, Spread = sunRaysEffect.Spread }
								getgenv()._lightingPresetOrig.SunRays = sunRays
							end

							local bloomEffect = Lighting:FindFirstChildOfClass("BloomEffect")

							if bloomEffect then
								local bloom = {
									Intensity = bloomEffect.Intensity,
									Size = bloomEffect.Size,
									Threshold = bloomEffect.Threshold,
									Enabled = bloomEffect.Enabled,
								}

								getgenv()._lightingPresetOrig.Bloom = bloom
							else
								getgenv()._lightingPresetOrig.Bloom = false
							end

							local colorCorrectionEffect = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")

							if colorCorrectionEffect then
								local colorCorrection = {
									Brightness = colorCorrectionEffect.Brightness,
									Contrast = colorCorrectionEffect.Contrast,
									Saturation = colorCorrectionEffect.Saturation,
									TintColor = colorCorrectionEffect.TintColor,
									Enabled = colorCorrectionEffect.Enabled,
								}

								getgenv()._lightingPresetOrig.ColorCorrection = colorCorrection
							else
								getgenv()._lightingPresetOrig.ColorCorrection = false
							end

							local sky = Lighting:FindFirstChildOfClass("Sky")

							if sky then
								local moonAngularSize = sky.MoonAngularSize
								getgenv()._lightingPresetOrig.MoonAngularSize = moonAngularSize
								local sunAngularSize = sky.SunAngularSize
								getgenv()._lightingPresetOrig.SunAngularSize = sunAngularSize
							end
						end

						local function fn65()
							local lightingPresetOrig = getgenv()._lightingPresetOrig
							if not lightingPresetOrig then
								return
							end
							Lighting.ClockTime = lightingPresetOrig.ClockTime
							Lighting.Brightness = lightingPresetOrig.Brightness
							Lighting.ExposureCompensation = lightingPresetOrig.ExposureCompensation
							Lighting.Ambient = lightingPresetOrig.Ambient
							Lighting.OutdoorAmbient = lightingPresetOrig.OutdoorAmbient
							Lighting.FogColor = lightingPresetOrig.FogColor
							Lighting.FogStart = lightingPresetOrig.FogStart
							Lighting.FogEnd = lightingPresetOrig.FogEnd
							Lighting.GeographicLatitude = lightingPresetOrig.GeographicLatitude
							Lighting.ShadowSoftness = lightingPresetOrig.ShadowSoftness
							Lighting.GlobalShadows = lightingPresetOrig.GlobalShadows
							Lighting.EnvironmentDiffuseScale = lightingPresetOrig.EnvironmentDiffuseScale
							Lighting.EnvironmentSpecularScale = lightingPresetOrig.EnvironmentSpecularScale
							Lighting.Technology = lightingPresetOrig.Technology
							local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

							if atmosphere and lightingPresetOrig.Atmo then
								atmosphere.Density = lightingPresetOrig.Atmo.Density
								atmosphere.Offset = lightingPresetOrig.Atmo.Offset
								atmosphere.Color = lightingPresetOrig.Atmo.Color
								atmosphere.Decay = lightingPresetOrig.Atmo.Decay
								atmosphere.Glare = lightingPresetOrig.Atmo.Glare
								atmosphere.Haze = lightingPresetOrig.Atmo.Haze
							end

							local sunRaysEffect = Lighting:FindFirstChildOfClass("SunRaysEffect")

							if sunRaysEffect and lightingPresetOrig.SunRays then
								sunRaysEffect.Intensity = lightingPresetOrig.SunRays.Intensity
								sunRaysEffect.Spread = lightingPresetOrig.SunRays.Spread
							end

							local bloomEffect = Lighting:FindFirstChildOfClass("BloomEffect")

							if lightingPresetOrig.Bloom == false then
								if bloomEffect then
									pcall(function()
										bloomEffect:Destroy()
									end)
								end
							elseif lightingPresetOrig.Bloom and bloomEffect then
								bloomEffect.Intensity = lightingPresetOrig.Bloom.Intensity
								bloomEffect.Size = lightingPresetOrig.Bloom.Size
								bloomEffect.Threshold = lightingPresetOrig.Bloom.Threshold
								bloomEffect.Enabled = lightingPresetOrig.Bloom.Enabled
							end

							local colorCorrectionEffect = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")

							if lightingPresetOrig.ColorCorrection == false then
								if colorCorrectionEffect then
									pcall(function()
										colorCorrectionEffect:Destroy()
									end)
								end
							elseif lightingPresetOrig.ColorCorrection and colorCorrectionEffect then
								colorCorrectionEffect.Brightness = lightingPresetOrig.ColorCorrection.Brightness
								colorCorrectionEffect.Contrast = lightingPresetOrig.ColorCorrection.Contrast
								colorCorrectionEffect.Saturation = lightingPresetOrig.ColorCorrection.Saturation
								colorCorrectionEffect.TintColor = lightingPresetOrig.ColorCorrection.TintColor
								colorCorrectionEffect.Enabled = lightingPresetOrig.ColorCorrection.Enabled
							end

							if lightingPresetOrig.SkyRef and lightingPresetOrig.SkyRef.Parent then
								lightingPresetOrig.SkyRef.Parent = Lighting
							end

							local sky = Lighting:FindFirstChildOfClass("Sky")

							if sky and lightingPresetOrig.MoonAngularSize then
								sky.MoonAngularSize = lightingPresetOrig.MoonAngularSize
							end

							if sky and lightingPresetOrig.SunAngularSize then
								sky.SunAngularSize = lightingPresetOrig.SunAngularSize
							end

							getgenv()._lightingPresetOrig = nil
						end

						local function fn66()
							local lightingPresetOrig = getgenv()._lightingPresetOrig

							if lightingPresetOrig and lightingPresetOrig.SkyRef then
								local skyRef = lightingPresetOrig.SkyRef

								if skyRef and skyRef.Parent ~= Lighting then
									skyRef.Parent = Lighting
								end

								lightingPresetOrig.SkyRef = nil
							end
						end

						local tbl28 = {
							Unified = Enum.Technology.Unified,
							Future = Enum.Technology.Future,
							ShadowMap = Enum.Technology.ShadowMap,
							Voxel = Enum.Technology.Voxel,
							Compatibility = Enum.Technology.Compatibility,
						}

						local function fn67()
							return tbl28[options.LightingTechnology and options.LightingTechnology.Value] or Enum.Technology.Unified
						end

						local tbl29 = {}

						local tbl30 = {
							clock = 0,
							Br = 3.6,
							EC = 1.05,
							Amb = Color3.fromRGB(72, 80, 162),
							OA = Color3.fromRGB(58, 68, 148),
							Fog = Color3.fromRGB(48, 54, 122),
							FE = 4000,
							ED = 0.65,
							ES = 0.55,
							SR = 0.14,
							AD = 0.22,
							AO = 0,
							AC = Color3.fromRGB(18, 12, 72),
							Adc = Color3.fromRGB(8, 5, 48),
							AG = 0,
							AH = 0.05,
							SI = 0,
							SS = 0.02,
							BlI = 0.3,
							BlS = 24,
							BlT = 0.8,
							CCB = 0.02,
							CCC = 0.1,
							CCS = 0.08,
							CCT = Color3.fromRGB(185, 178, 245),
						}

						local tbl31 = {
							clock = 2.5,
							Br = 3.55,
							EC = 1.02,
							Amb = Color3.fromRGB(66, 72, 152),
							OA = Color3.fromRGB(52, 60, 138),
							Fog = Color3.fromRGB(42, 48, 118),
							FE = 3800,
							ED = 0.62,
							ES = 0.52,
							SR = 0.13,
							AD = 0.24,
							AO = 0,
							AC = Color3.fromRGB(14, 10, 64),
							Adc = Color3.fromRGB(6, 4, 42),
							AG = 0,
							AH = 0.04,
							SI = 0,
							SS = 0.02,
							BlI = 0.28,
							BlS = 22,
							BlT = 0.82,
							CCB = 0.01,
							CCC = 0.1,
							CCS = 0.05,
							CCT = Color3.fromRGB(182, 174, 242),
						}

						local tbl32 = {
							clock = 4.5,
							Br = 2.2,
							EC = 0.65,
							Amb = Color3.fromRGB(55, 40, 120),
							OA = Color3.fromRGB(45, 30, 108),
							Fog = Color3.fromRGB(48, 34, 112),
							FE = 3800,
							ED = 0.6,
							ES = 0.5,
							SR = 0.16,
							AD = 0.2,
							AO = 0,
							AC = Color3.fromRGB(22, 10, 80),
							Adc = Color3.fromRGB(12, 5, 55),
							AG = 0.02,
							AH = 0.08,
							SI = 0.2,
							SS = 0.022,
							BlI = 0.24,
							BlS = 24,
							BlT = 0.78,
							CCB = 0,
							CCC = 0.1,
							CCS = 0.1,
							CCT = Color3.fromRGB(178, 165, 228),
						}

						local tbl33 = {
							clock = 5.5,
							Br = 0.8,
							EC = 0.22,
							Amb = Color3.fromRGB(118, 80, 148),
							OA = Color3.fromRGB(135, 88, 162),
							Fog = Color3.fromRGB(148, 94, 158),
							FE = 4400,
							ED = 0.73,
							ES = 0.62,
							SR = 0.2,
							AD = 0.17,
							AO = 0.01,
							AC = Color3.fromRGB(82, 42, 115),
							Adc = Color3.fromRGB(55, 22, 82),
							AG = 0.08,
							AH = 0.12,
							SI = 0.35,
							SS = 0.035,
							BlI = 0.36,
							BlS = 30,
							BlT = 0.68,
							CCB = 0.02,
							CCC = 0.14,
							CCS = 0.2,
							CCT = Color3.fromRGB(225, 185, 215),
						}

						local tbl34 = {
							clock = 6.33,
							Br = 0,
							EC = 0,
							Amb = Color3.fromRGB(0, 0, 0),
							OA = Color3.fromRGB(25, 25, 25),
							Fog = Color3.fromRGB(192, 192, 192),
							FE = 5000,
							ED = 1,
							ES = 1,
							SR = 0.2,
							AD = 0.213,
							AO = 0,
							AC = Color3.fromRGB(2, 2, 2),
							Adc = Color3.fromRGB(0, 0, 0),
							AG = 0,
							AH = 0,
							SI = 0.72,
							SS = 0.049,
							BlI = 0.18,
							BlS = 18,
							BlT = 0.68,
							CCB = 0,
							CCC = 0.12,
							CCS = 0.18,
							CCT = Color3.fromRGB(245, 215, 178),
						}

						local tbl35 = {
							clock = 7.5,
							Br = 0,
							EC = 0.4,
							Amb = Color3.fromRGB(163, 172, 143),
							OA = Color3.fromRGB(202, 180, 113),
							Fog = Color3.fromRGB(192, 192, 192),
							FE = 5000,
							ED = 0.756,
							ES = 0.585,
							SR = 0.18,
							AD = 0.213,
							AO = 0,
							AC = Color3.fromRGB(2, 2, 2),
							Adc = Color3.fromRGB(0, 0, 0),
							AG = 0,
							AH = 0,
							SI = 0.95,
							SS = 0.14,
							BlI = 0.22,
							BlS = 20,
							BlT = 0.7,
							CCB = 0.01,
							CCC = 0.1,
							CCS = 0.16,
							CCT = Color3.fromRGB(245, 230, 205),
						}

						local tbl36 = {
							clock = 9,
							Br = 0,
							EC = 0.12,
							Amb = Color3.fromRGB(138, 152, 168),
							OA = Color3.fromRGB(148, 160, 175),
							Fog = Color3.fromRGB(185, 190, 200),
							FE = 7400,
							ED = 0.88,
							ES = 0.85,
							SR = 0.1,
							AD = 0.09,
							AO = 0.05,
							AC = Color3.fromRGB(20, 42, 68),
							Adc = Color3.fromRGB(10, 24, 48),
							AG = 0.02,
							AH = 0.08,
							SI = 0.25,
							SS = 0.022,
							BlI = 0.14,
							BlS = 18,
							BlT = 0.88,
							CCB = 0,
							CCC = 0.07,
							CCS = 0.08,
							CCT = Color3.fromRGB(235, 240, 252),
						}

						local tbl37 = {
							clock = 12,
							Br = 0,
							EC = 0,
							Amb = Color3.fromRGB(148, 160, 175),
							OA = Color3.fromRGB(158, 168, 182),
							Fog = Color3.fromRGB(192, 192, 192),
							FE = 9500,
							ED = 0.92,
							ES = 0.9,
							SR = 0.08,
							AD = 0.05,
							AO = 0.08,
							AC = Color3.fromRGB(15, 42, 82),
							Adc = Color3.fromRGB(8, 25, 60),
							AG = 0.01,
							AH = 0.05,
							SI = 0.15,
							SS = 0.018,
							BlI = 0.08,
							BlS = 16,
							BlT = 0.92,
							CCB = -0.02,
							CCC = 0.06,
							CCS = 0.06,
							CCT = Color3.fromRGB(232, 238, 252),
						}

						local tbl38 = {
							clock = 15,
							Br = 0,
							EC = 0.1,
							Amb = Color3.fromRGB(160, 156, 142),
							OA = Color3.fromRGB(172, 158, 135),
							Fog = Color3.fromRGB(188, 182, 170),
							FE = 7600,
							ED = 0.88,
							ES = 0.85,
							SR = 0.12,
							AD = 0.09,
							AO = 0.04,
							AC = Color3.fromRGB(28, 40, 58),
							Adc = Color3.fromRGB(15, 22, 38),
							AG = 0.03,
							AH = 0.12,
							SI = 0.3,
							SS = 0.025,
							BlI = 0.15,
							BlS = 18,
							BlT = 0.82,
							CCB = 0,
							CCC = 0.07,
							CCS = 0.08,
							CCT = Color3.fromRGB(245, 238, 218),
						}

						local tbl39 = {
							clock = 16.5,
							Br = 0,
							EC = 0.28,
							Amb = Color3.fromRGB(195, 178, 148),
							OA = Color3.fromRGB(210, 182, 138),
							Fog = Color3.fromRGB(200, 182, 158),
							FE = 6200,
							ED = 0.94,
							ES = 0.9,
							SR = 0.18,
							AD = 0.09,
							AO = 0.03,
							AC = Color3.fromRGB(68, 52, 22),
							Adc = Color3.fromRGB(42, 28, 8),
							AG = 0.1,
							AH = 0.2,
							SI = 0.55,
							SS = 0.032,
							BlI = 0.35,
							BlS = 16,
							BlT = 0.65,
							CCB = 0.02,
							CCC = 0.11,
							CCS = 0.16,
							CCT = Color3.fromRGB(248, 235, 210),
						}

						local tbl40 = {
							clock = 17.5,
							Br = 0,
							EC = 0.28,
							Amb = Color3.fromRGB(210, 175, 128),
							OA = Color3.fromRGB(222, 180, 118),
							Fog = Color3.fromRGB(215, 172, 138),
							FE = 5600,
							ED = 0.92,
							ES = 0.87,
							SR = 0.2,
							AD = 0.1,
							AO = 0.03,
							AC = Color3.fromRGB(88, 58, 22),
							Adc = Color3.fromRGB(58, 32, 8),
							AG = 0.18,
							AH = 0.25,
							SI = 0.8,
							SS = 0.06,
							BlI = 0.55,
							BlS = 18,
							BlT = 0.55,
							CCB = 0.02,
							CCC = 0.13,
							CCS = 0.18,
							CCT = Color3.fromRGB(252, 230, 200),
						}

						local tbl41 = {
							clock = 18.5,
							Br = 0.3,
							EC = 0.38,
							Amb = Color3.fromRGB(175, 128, 108),
							OA = Color3.fromRGB(192, 132, 112),
							Fog = Color3.fromRGB(182, 122, 118),
							FE = 5000,
							ED = 0.88,
							ES = 0.83,
							SR = 0.2,
							AD = 0.12,
							AO = 0.02,
							AC = Color3.fromRGB(105, 48, 28),
							Adc = Color3.fromRGB(75, 22, 12),
							AG = 0.12,
							AH = 0.28,
							SI = 0.65,
							SS = 0.034,
							BlI = 0.5,
							BlS = 18,
							BlT = 0.58,
							CCB = 0.02,
							CCC = 0.12,
							CCS = 0.14,
							CCT = Color3.fromRGB(242, 208, 195),
						}

						local tbl42 = {
							clock = 19.5,
							Br = 1.6,
							EC = 0.72,
							Amb = Color3.fromRGB(88, 68, 158),
							OA = Color3.fromRGB(75, 58, 145),
							Fog = Color3.fromRGB(80, 62, 148),
							FE = 4200,
							ED = 0.72,
							ES = 0.62,
							SR = 0.18,
							AD = 0.18,
							AO = 0.01,
							AC = Color3.fromRGB(45, 20, 105),
							Adc = Color3.fromRGB(28, 10, 75),
							AG = 0.04,
							AH = 0.12,
							SI = 0.18,
							SS = 0.022,
							BlI = 0.34,
							BlS = 28,
							BlT = 0.68,
							CCB = 0.02,
							CCC = 0.12,
							CCS = 0.12,
							CCT = Color3.fromRGB(195, 180, 240),
						}

						local tbl43 = {
							clock = 21,
							Br = 3.6,
							EC = 1.05,
							Amb = Color3.fromRGB(72, 85, 164),
							OA = Color3.fromRGB(58, 72, 150),
							Fog = Color3.fromRGB(45, 55, 100),
							FE = 4000,
							ED = 0.65,
							ES = 0.55,
							SR = 0.15,
							AD = 0.21,
							AO = 0,
							AC = Color3.fromRGB(12, 20, 72),
							Adc = Color3.fromRGB(5, 10, 40),
							AG = 0,
							AH = 0.06,
							SI = 0,
							SS = 0.02,
							BlI = 0.32,
							BlS = 24,
							BlT = 0.76,
							CCB = 0.02,
							CCC = 0.1,
							CCS = 0.08,
							CCT = Color3.fromRGB(188, 180, 245),
						}

						local tbl44 = {
							clock = 22.5,
							Br = 3.65,
							EC = 1.08,
							Amb = Color3.fromRGB(72, 85, 164),
							OA = Color3.fromRGB(58, 72, 150),
							Fog = Color3.fromRGB(45, 55, 100),
							FE = 4000,
							ED = 0.65,
							ES = 0.55,
							SR = 0.14,
							AD = 0.22,
							AO = 0,
							AC = Color3.fromRGB(12, 20, 72),
							Adc = Color3.fromRGB(5, 10, 40),
							AG = 0,
							AH = 0.04,
							SI = 0,
							SS = 0.02,
							BlI = 0.3,
							BlS = 24,
							BlT = 0.8,
							CCB = 0.02,
							CCC = 0.1,
							CCS = 0.08,
							CCT = Color3.fromRGB(185, 178, 245),
						}

						local tbl45 = {
							clock = 24,
							Br = 3.6,
							EC = 1.05,
							Amb = Color3.fromRGB(72, 80, 162),
							OA = Color3.fromRGB(58, 68, 148),
							Fog = Color3.fromRGB(48, 54, 122),
							FE = 4000,
							ED = 0.65,
							ES = 0.55,
							SR = 0.14,
							AD = 0.22,
							AO = 0,
							AC = Color3.fromRGB(18, 12, 72),
							Adc = Color3.fromRGB(8, 5, 48),
							AG = 0,
							AH = 0.04,
							SI = 0,
							SS = 0.02,
							BlI = 0.3,
							BlS = 24,
							BlT = 0.8,
							CCB = 0.02,
							CCC = 0.1,
							CCS = 0.08,
							CCT = Color3.fromRGB(185, 178, 245),
						}

						tbl29[1] = tbl30
						tbl29[2] = tbl31
						tbl29[3] = tbl32
						tbl29[4] = tbl33
						tbl29[5] = tbl34
						tbl29[6] = tbl35
						tbl29[7] = tbl36
						tbl29[8] = tbl37
						tbl29[9] = tbl38
						tbl29[10] = tbl39
						tbl29[11] = tbl40
						tbl29[12] = tbl41
						tbl29[13] = tbl42
						tbl29[14] = tbl43
						tbl29[15] = tbl44
						tbl29[16] = tbl45

						local function fn68(arg2)
							if arg2 == "Warm" then
								fn66()
								Lighting.ClockTime = 6.581944465637207
								Lighting.Brightness = 0
								Lighting.ExposureCompensation = 0.4
								Lighting.Ambient = Color3.fromRGB(163, 172, 143)
								Lighting.OutdoorAmbient = Color3.fromRGB(202, 180, 113)
								Lighting.FogColor = Color3.fromRGB(192, 192, 192)
								Lighting.FogStart = 0
								Lighting.FogEnd = 5000
								Lighting.GeographicLatitude = 314.80410766601562
								Lighting.ShadowSoftness = 0.2
								Lighting.GlobalShadows = true
								Lighting.EnvironmentDiffuseScale = 0.756
								Lighting.EnvironmentSpecularScale = 0.585
								Lighting.Technology = fn67()
								local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
								atmosphere.Density = 0.213
								atmosphere.Offset = 0
								atmosphere.Color = Color3.fromRGB(2, 2, 2)
								atmosphere.Decay = Color3.fromRGB(0, 0, 0)
								atmosphere.Glare = 0
								atmosphere.Haze = 0
								local sunRaysEffect = Lighting:FindFirstChildOfClass("SunRaysEffect") or Instance.new("SunRaysEffect", Lighting)
								sunRaysEffect.Intensity = 0.95
								sunRaysEffect.Spread = 0.14
							elseif arg2 == "Night" then
								local lightingPresetOrig = getgenv()._lightingPresetOrig

								if lightingPresetOrig and not lightingPresetOrig.SkyRef then
									local sky = Lighting:FindFirstChildOfClass("Sky")

									if sky then
										lightingPresetOrig.SkyRef = sky
										sky.Parent = game:GetService("ReplicatedStorage")
									end
								end

								Lighting.ClockTime = 0
								Lighting.Brightness = 3.5
								Lighting.ExposureCompensation = 1.1
								Lighting.Ambient = Color3.fromRGB(52, 65, 138)
								Lighting.OutdoorAmbient = Color3.fromRGB(42, 55, 125)
								Lighting.FogColor = Color3.fromRGB(35, 45, 85)
								Lighting.FogStart = 0
								Lighting.FogEnd = 4000
								Lighting.GeographicLatitude = 314.80410766601562
								Lighting.ShadowSoftness = 0.2
								Lighting.GlobalShadows = true
								Lighting.EnvironmentDiffuseScale = 0.65
								Lighting.EnvironmentSpecularScale = 0.55
								Lighting.Technology = fn67()
								local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
								atmosphere.Density = 0.25
								atmosphere.Offset = 0
								atmosphere.Color = Color3.fromRGB(12, 20, 72)
								atmosphere.Decay = Color3.fromRGB(5, 10, 40)
								atmosphere.Glare = 0
								atmosphere.Haze = 0
								local sunRaysEffect = Lighting:FindFirstChildOfClass("SunRaysEffect") or Instance.new("SunRaysEffect", Lighting)
								sunRaysEffect.Intensity = 0.88
								sunRaysEffect.Spread = 0.049
							elseif arg2 == "Sunrising" then
								fn66()
								Lighting.ClockTime = 6.4000000953674316
								Lighting.Brightness = 0
								Lighting.ExposureCompensation = 0
								Lighting.Ambient = Color3.fromRGB(0, 0, 0)
								Lighting.OutdoorAmbient = Color3.fromRGB(25, 25, 25)
								Lighting.FogColor = Color3.fromRGB(192, 192, 192)
								Lighting.FogStart = 0
								Lighting.FogEnd = 5000
								Lighting.GeographicLatitude = 314.80410766601562
								Lighting.ShadowSoftness = 0.2
								Lighting.GlobalShadows = true
								Lighting.EnvironmentDiffuseScale = 1
								Lighting.EnvironmentSpecularScale = 1
								Lighting.Technology = fn67()
								local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
								atmosphere.Density = 0.213
								atmosphere.Offset = 0
								atmosphere.Color = Color3.fromRGB(2, 2, 2)
								atmosphere.Decay = Color3.fromRGB(0, 0, 0)
								atmosphere.Glare = 0
								atmosphere.Haze = 0
								local sunRaysEffect = Lighting:FindFirstChildOfClass("SunRaysEffect") or Instance.new("SunRaysEffect", Lighting)
								sunRaysEffect.Intensity = 0.72
								sunRaysEffect.Spread = 0.049
							elseif arg2 == "Auto-Sky" then
								fn66()
								local v43 = os.date("*t")
								local clockTime = v43.hour + v43.min / 60 + v43.sec / 3600
								local v44 = nil
								local v45 = nil
								local n15 = nil

								for i = 1, #tbl29 - 1 do
									if clockTime >= tbl29[i].clock and clockTime < tbl29[i + 1].clock then
										v44 = tbl29[i]
										v45 = tbl29[i + 1]
										n15 = (clockTime - v44.clock) / (v45.clock - v44.clock)
										break
									else
										v44 = nil
										v45 = nil
										n15 = nil
									end
								end

								if not v44 then
									v44 = tbl29[#tbl29 - 1]
									v45 = tbl29[#tbl29]
									n15 = 1
								end

								local function fn69(arg3, arg4, arg5)
									return arg3 + (arg4 - arg3) * arg5
								end

								Lighting.ClockTime = clockTime
								Lighting.Brightness = fn69(v44.Br, v45.Br, n15)
								Lighting.ExposureCompensation = fn69(v44.EC, v45.EC, n15)
								Lighting.Ambient = v44.Amb:Lerp(v45.Amb, n15)
								Lighting.OutdoorAmbient = v44.OA:Lerp(v45.OA, n15)
								Lighting.FogColor = v44.Fog:Lerp(v45.Fog, n15)
								Lighting.FogStart = 0
								Lighting.FogEnd = fn69(v44.FE, v45.FE, n15)
								Lighting.GeographicLatitude = 314.80410766601562
								Lighting.ShadowSoftness = fn69(v44.SR, v45.SR, n15)
								Lighting.GlobalShadows = true
								Lighting.EnvironmentDiffuseScale = fn69(v44.ED, v45.ED, n15)
								Lighting.EnvironmentSpecularScale = fn69(v44.ES, v45.ES, n15)
								Lighting.Technology = fn67()
								local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
								atmosphere.Density = fn69(v44.AD, v45.AD, n15)
								atmosphere.Offset = fn69(v44.AO, v45.AO, n15)
								atmosphere.Color = v44.AC:Lerp(v45.AC, n15)
								atmosphere.Decay = v44.Adc:Lerp(v45.Adc, n15)
								atmosphere.Glare = fn69(v44.AG, v45.AG, n15)
								atmosphere.Haze = fn69(v44.AH, v45.AH, n15)
								local sunRaysEffect = Lighting:FindFirstChildOfClass("SunRaysEffect") or Instance.new("SunRaysEffect", Lighting)
								sunRaysEffect.Intensity = fn69(v44.SI, v45.SI, n15)
								sunRaysEffect.Spread = fn69(v44.SS, v45.SS, n15)
								local autoSkyBloom = Lighting:FindFirstChild("AutoSkyBloom")

								if autoSkyBloom then
									pcall(function()
										autoSkyBloom:Destroy()
									end)
								end

								local colorCorrectionEffect = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")

								if not colorCorrectionEffect then
									colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
									colorCorrectionEffect.Name = "AutoSkyCC"
									colorCorrectionEffect.Parent = Lighting
								end

								colorCorrectionEffect.Brightness = fn69(v44.CCB, v45.CCB, n15)
								colorCorrectionEffect.Contrast = fn69(v44.CCC, v45.CCC, n15)
								colorCorrectionEffect.Saturation = fn69(v44.CCS, v45.CCS, n15)
								colorCorrectionEffect.TintColor = v44.CCT:Lerp(v45.CCT, n15)
								colorCorrectionEffect.Enabled = true
								local sky = Lighting:FindFirstChildOfClass("Sky")

								if sky then
									local lightingPresetOrig = getgenv()._lightingPresetOrig

									if lightingPresetOrig and lightingPresetOrig.MoonAngularSize then
										sky.MoonAngularSize = lightingPresetOrig.MoonAngularSize
									end

									if lightingPresetOrig and lightingPresetOrig.SunAngularSize then
										sky.SunAngularSize = lightingPresetOrig.SunAngularSize
									end
								end
							end
						end

						if arg == "None" then
							getgenv()._lightingPresetLoop = false
							getgenv()._tzLoopActive = false

							if getgenv()._lightingPresetConns then
								for _, lightingPresetConn in ipairs(getgenv()._lightingPresetConns) do
									pcall(function()
										lightingPresetConn:Disconnect()
									end)
								end

								getgenv()._lightingPresetConns = {}
							end

							fn65()

							pcall(function()
								workspace.Terrain.Clouds.Enabled = true
							end)
						else
							fn64()

							pcall(function()
								workspace.Terrain.Clouds.Enabled = false
							end)

							fn68(arg)

							if not getgenv()._lightingPresetLoop then
								getgenv()._lightingPresetLoop = true
								getgenv()._lightingPresetConns = {}
								local flag17 = false

								local function fn69()
									if flag17 or not getgenv()._lightingPresetLoop then
										return
									end
									local value = options.LightingPreset.Value
									if value == "None" then
										return
									end
									flag17 = true
									fn68(value)
									flag17 = false
								end

								local tbl46 = {
									ClockTime = true,
									Brightness = true,
									ExposureCompensation = true,
									Ambient = true,
									OutdoorAmbient = true,
									FogColor = true,
									FogStart = true,
									FogEnd = true,
									GeographicLatitude = true,
									ShadowSoftness = true,
									GlobalShadows = true,
									EnvironmentDiffuseScale = true,
									EnvironmentSpecularScale = true,
									Technology = true,
								}

								local changed = Lighting.Changed
								local connect = changed.Connect

								table.insert(getgenv()._lightingPresetConns, connect(changed, function(arg2)
									if tbl46[arg2] then
										fn69()
									end
								end))

								local function fn70(arg2)
									if not arg2 then
										return
									end
									local changed2 = arg2.Changed
									local connect2 = changed2.Connect

									table.insert(getgenv()._lightingPresetConns, connect2(changed2, function()
										fn69()
									end))
								end

								fn70(Lighting:FindFirstChildOfClass("Atmosphere"))
								local childAdded = Lighting.ChildAdded
								local connect2 = childAdded.Connect

								table.insert(getgenv()._lightingPresetConns, connect2(childAdded, function(arg2)
									if arg2:IsA("Atmosphere") then
										fn70(arg2)
									end
								end))

								table.insert(getgenv()._lightingPresetConns, game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
									task.wait(0)
									fn69()
								end))
							end

							if arg == "Auto-Sky" then
								getgenv()._tzLoopActive = true

								task.spawn(function()
									while true do
										if getgenv()._tzLoopActive and getgenv()._lightingPresetLoop and not v24.Unloaded then
											if options.LightingPreset and options.LightingPreset.Value == "Auto-Sky" then
												_presetApplying = true
												pcall(fn68, "Auto-Sky")
												_presetApplying = false
												task.wait(1)
												continue
											end
										end

										break
									end

									getgenv()._tzLoopActive = false
								end)
							end
						end
					end,
				})

				World:AddDropdown("LightingTechnology", {
					Text = "Lighting Technology",
					Values = { "Unified", "Future", "ShadowMap", "Voxel", "Compatibility" },
					Default = "Unified",
					Callback = function(arg)
						local tbl28 = {
							Unified = Enum.Technology.Unified,
							Future = Enum.Technology.Future,
							ShadowMap = Enum.Technology.ShadowMap,
							Voxel = Enum.Technology.Voxel,
							Compatibility = Enum.Technology.Compatibility,
						}

						pcall(function()
							Lighting.Technology = tbl28[arg] or Enum.Technology.Unified
						end)
					end,
				})

				table.insert(tbl24, function()
					pcall(function()
						toggles.NoWalls:SetValue(false)
					end)

					pcall(function()
						toggles.NoTrees:SetValue(false)
					end)

					pcall(function()
						toggles.NoDebris:SetValue(false)
					end)

					pcall(function()
						toggles.NoBenches:SetValue(false)
					end)

					pcall(function()
						toggles.NoFloor:SetValue(false)
					end)

					pcall(function()
						toggles.NoSmoke:SetValue(false)
					end)

					pcall(function()
						toggles.NoExplosions:SetValue(false)
					end)

					pcall(function()
						toggles.AmbientEnabled:SetValue(false)
					end)

					pcall(function()
						toggles.RainbowAmbient:SetValue(false)
					end)

					pcall(function()
						options.LightingPreset:SetValue("None")
					end)

					getgenv()._lightingPresetLoop = false
					local map2 = workspace:FindFirstChild("Map")

					if map2 then
						for _, child in pairs(folder2:GetChildren()) do
							pcall(function()
								child.Parent = map2
							end)
						end

						local trees = map2:FindFirstChild("Trees")

						if trees then
							for _, child in pairs(folder:GetChildren()) do
								pcall(function()
									child.Parent = trees
								end)
							end
						end
					end

					if connection18 then
						pcall(function()
							connection18:Disconnect()
						end)

						connection18 = nil
					end

					pcall(function()
						if #folder:GetChildren() == 0 then
							folder:Destroy()
						end
					end)

					pcall(function()
						if #folder2:GetChildren() == 0 then
							folder2:Destroy()
						end
					end)
				end)
			end

			local connection18, connection19

			do
				local tbl28 = {
					["Above Tunnel"] = CFrame.new(-301, 594, -322),
					Arena = CFrame.new(-130, 440, -373),
					["Atomic Slash"] = CFrame.new(-52, 1580, 25250),
					Baseplate = CFrame.new(-42, 1855, 25227),
					["Below Baseplate"] = CFrame.new(-42, 1469, 25227),
					["Bigger Jail"] = CFrame.new(290, 440, 465),
					["Even Bigger Jail"] = CFrame.new(378, 439, 457),
					["Dark Domain"] = CFrame.new(-80, 84, 20395),
					["Death Counter"] = CFrame.new(-66, 29, 20383),
					Jail = CFrame.new(439, 440, -376),
					["Jail But Smaller"] = CFrame.new(20, 439, -460),
					Middle = CFrame.new(150, 441, 32),
					["Mountain 1"] = CFrame.new(306, 671, 411),
					["Mountain 2"] = CFrame.new(-1, 653, -354),
					["Mountain Edge"] = CFrame.new(-297, 594, -336),
					Void = CFrame.new(0, -10000, 0),
				}

				local tbl29 = {}

				for k in pairs(tbl28) do
					tbl29[#tbl29 + 1] = k
				end

				table.sort(tbl29)

				local function fn60(cFrame2)
					local character = localPlayer3.Character
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
					if not (character and humanoidRootPart2) then
						return
					end

					task.spawn(function()
						RunService.RenderStepped:Once(function()
							humanoidRootPart2.Velocity = Vector3.new()
							RunService.Heartbeat:Wait()
							humanoidRootPart2.Velocity = Vector3.new()
						end)

						RunService.Heartbeat:Once(function()
							humanoidRootPart2.CFrame = cFrame2
						end)
					end)
				end

				local Teleports = tbl17.Map:AddLeftGroupbox("Teleports", "map-pin")
				local Players2 = tbl17.Map:AddRightGroupbox("Players", "users")

				if tbl16[str8] then
					for _, v43 in ipairs(tbl29) do
						Teleports:AddButton({
							Text = v43,
							Func = function()
								fn60(tbl28[v43])
							end,
						})

						if v43 == "Middle" then
							Teleports:AddButton({
								Text = "Weakest Dummy",
								Func = function()
									local live = workspace:FindFirstChild("Live")
									live = live and live:FindFirstChild("Weakest Dummy")

									if live then
										live = live:FindFirstChild("HumanoidRootPart") or live.PrimaryPart
									end

									if live then
										fn60(live.CFrame)
									end
								end,
							})
						end
					end
				else
					Teleports:AddButton({
						Text = "Void",
						Func = function()
							fn60(tbl28.Void)
						end,
					})
				end

				local v43 = nil

				local function fn61()
					local tbl30 = {}

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer3 then
							tbl30[#tbl30 + 1] = fn41(player)
						end
					end

					return tbl30
				end

				local MapTargetPlayer = Players2:AddDropdown("MapTargetPlayer", { Values = fn61(), Text = "Target Player", Default = "", Searchable = true, AllowNull = true })

				local v44 = Players2:AddButton({
					Text = "Goto",
					Func = function()
						if not v43 then
							return
						end
						local character = v43.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

						if character and humanoidRootPart2 then
							fn60(humanoidRootPart2.CFrame)
						end
					end,
				})

				pcall(function()
					v44:SetVisible(false)
				end)

				local v45 = Players2:AddButton({
					Text = "Fling",
					Func = function()
						if not v43 then
							return
						end

						if flag14 then
							return
						end
						local v45 = v43

						if options.CmdFlingMethod then
						end

						task.spawn(function()
							flag14 = true

							if not flag16 then
								fn49(v45)
							end

							fn56(v45)
							flag14 = false

							if not flag16 then
								fn50()
							end
						end)
					end,
				})

				pcall(function()
					v45:SetVisible(false)
				end)

				local flag17 = false

				local function fn62()
					if flag17 then
						return
					end
					flag17 = true

					task.defer(function()
						pcall(function()
							MapTargetPlayer:SetValues(fn61())
						end)

						flag17 = false
					end)
				end

				connection18 = Players.PlayerAdded:Connect(fn62)

				connection19 = Players.PlayerRemoving:Connect(function()
					task.wait()
					fn62()
				end)

				local str9 = ""

				MapTargetPlayer:OnChanged(function(arg)
					if arg ~= "" and arg == str9 then
						pcall(function()
							MapTargetPlayer:SetValue("")
						end)

						str9 = ""
						v43 = nil

						pcall(function()
							v44:SetVisible(false)
						end)

						pcall(function()
							v45:SetVisible(false)
						end)

						return
					end

					str9 = arg or ""

					if not arg or arg == "" then
						v43 = nil

						pcall(function()
							v44:SetVisible(false)
						end)

						pcall(function()
							v45:SetVisible(false)
						end)

						return
					end

					v43 = fn47(arg)

					pcall(function()
						v44:SetVisible(v43 ~= nil)
					end)

					pcall(function()
						v45:SetVisible(v43 ~= nil)
					end)
				end)
			end

			getgenv().ChromosomeActive = false

			local function fn60()
				local localPlayer4 = game:GetService("Players").LocalPlayer

				local function fn61()
					return (localPlayer4.Character or localPlayer4.CharacterAdded:Wait()):WaitForChild("Communicate", 5)
				end

				local v43 = fn61()

				if v43 and typeof(hookfunction) == "function" then
					local v44 = nil

					local function fn62(arg, ...)
						local v45 = table.pack(...)
						local tbl28 = { ... }
						if getgenv().ChromosomeActive and type(tbl28[1]) == "table" and tbl28[1].Goal == "LeftClickRelease" then
							return nil
						end
						return v44(arg, table.unpack(v45, 1, v45.n))
					end

					v44 = hookfunction
					v44 = v44(v43.FireServer, fn62)
				end
			end

			fn60()

			getgenv().addchromosome = function()
				getgenv().ChromosomeActive = true
			end

			getgenv().removechromosome = function()
				getgenv().ChromosomeActive = false
			end

			local Credits = tbl17.Home:AddLeftGroupbox("Credits", "crown")
			Credits:AddLabel("Owner &amp; Solo Developer", true)
			Credits:AddLabel("<b><font color=\"#ffffff\">Aristooey</font></b>", true)
			Credits:AddDivider({ Text = "Thanks to" })
			Credits:AddLabel("<b><font color=\"#8B4513\">baconbaconed</font></b>" .. string.char(10) .. "Tester", true)
			Credits:AddLabel("<b><font color=\"#1A4FBF\">secretxv.</font></b>" .. string.char(10) .. "Phantasm source, used with permission", true)
			Credits:AddLabel("<b><font color=\"#FFD700\">mm.</font></b>" .. string.char(10) .. "Financial support", true)
			getgenv()._disguiseAutoApply = nil
			flag7 = false
			flag8 = false
			flag9 = false
			tbl8 = {}
			tbl9 = {}
			tbl10 = {}
			v27 = nil
			connection = nil
			v28 = nil
			connection2 = nil
			connection3 = nil

			tbl11 = {
				289438135,
				1707711223,
				188732,
				2298753899,
				9119588309,
				5254879171,
				8595350470,
				6007609888,
				124751865,
				5019714978,
				5007631110,
				9088628683,
				7223875998,
				2474943274,
				3104949425,
				3335871296,
				203030608,
				2596305840,
				201124389,
				1981724228,
				3731169417,
				205419201,
				7422492329,
				406436524,
				1803380,
				9406742928,
				1359861204,
				3012958642,
				2260118449,
				188829949,
				2261820401,
				8094705681,
				9894023718,
				6077615334,
				2281971469,
				1946404863,
				660132420,
				1125262365,
				3018607207,
				144018186,
				3577671250,
				2017401176,
				3473976672,
				9122248242,
				1667867130,
				9294642379,
				5366504429,
				8264800124,
				283156132,
				1630540916,
				4416918097,
				344091683,
				6538096,
				7623744992,
				1099702304,
				1199088309,
				1369842558,
				3624257547,
				145740081,
				215710487,
				2255861564,
				7330109199,
				524749295,
				272574783,
				4100936320,
				4863227235,
				1132340350,
				5210946332,
				3331434198,
				2618555079,
				4201687597,
				147198435,
				704071723,
				465771760,
				254829155,
				8069027498,
				2646550793,
				366768658,
				2885260147,
			}

			do
				local v43 = tbl17.Disguise:AddLeftGroupbox("Avatar Disguise", "user-round-cog")
				str5 = "Revenant/TSB/disguise_favs.json"
				tbl12 = {}

				pcall(function()
					if not isfolder("Revenant/TSB") then
						makefolder("Revenant/TSB")
					end

					if isfile(str5) then
						local ok, result = pcall(function()
							return game:GetService("HttpService"):JSONDecode(readfile(str5))
						end)

						if ok and type(result) == "table" then
							tbl12 = result
						end
					end
				end)

				fn31 = function()
					pcall(function()
						if not isfolder("Revenant/TSB") then
							makefolder("Revenant/TSB")
						end

						writefile(str5, game:GetService("HttpService"):JSONEncode(tbl12))
					end)
				end

				fn32 = function()
					local tbl28 = {}

					for _, v44 in ipairs(tbl12) do
						table.insert(tbl28, v44.name)
					end

					if #tbl28 == 0 then
						tbl28 = { "(no favorites)" }
					end

					pcall(function()
						options.DisguiseFavList:SetValues(tbl28)
					end)
				end

				fn21 = function(arg)
					local match = arg:match("^%s*(.-)%s*$")
					if match == "" then
						return nil, "Enter a username or user ID first."
					end
					local num = tonumber(match)
					if num then
						return num
					end

					local ok, result = pcall(function()
						return Players:GetUserIdFromNameAsync(match)
					end)

					if ok and result then
						return result
					end
					return nil, "User not found: " .. match
				end

				fn22 = function(arg)
					local tbl28 = {}
					local backpack = arg.Parent and arg.Parent:FindFirstChild("Backpack")

					for _, child in ipairs(arg:GetChildren()) do
						if child:IsA("Tool") or child:IsA("HopperBin") then
							table.insert(tbl28, child)
						end
					end

					if backpack then
						for _, child in ipairs(backpack:GetChildren()) do
							if child:IsA("Tool") or child:IsA("HopperBin") then
								table.insert(tbl28, child)
							end
						end
					end

					return tbl28, backpack
				end

				fn23 = function(arg, parent, parent2)
					for _, v44 in ipairs(arg) do
						if v44 and v44.Parent == nil then
							if parent then
								v44.Parent = parent
							else
								v44.Parent = parent2
							end
						end
					end
				end

				fn24 = function(arg)
					local ok, result = pcall(function()
						return Players:GetCharacterAppearanceAsync(arg)
					end)

					if not ok or not result then
						return nil
					end
					local tbl28 = {}
					local shirtTemplate = nil
					local pantsTemplate = nil
					local graphic = nil

					for _, child in ipairs(result:GetChildren()) do
						if child:IsA("Accessory") then
							tbl28[child.Name] = true
						elseif child:IsA("Shirt") then
							shirtTemplate = child.ShirtTemplate
						elseif child:IsA("Pants") then
							pantsTemplate = child.PantsTemplate
						elseif child:IsA("ShirtGraphic") then
							graphic = child.Graphic
						end
					end

					result:Destroy()
					return { Accessories = tbl28, Shirt = shirtTemplate, Pants = pantsTemplate, Graphic = graphic }
				end

				local function fn61(arg)
					return (arg:IsA("Accessory") or arg:IsA("Hat")) and arg:FindFirstChild("Handle") ~= nil
				end

				fn25 = function(arg, arg2)
					for _, descendant in ipairs(arg:GetDescendants()) do
						if fn61(descendant) then
							if not arg2.Accessories[descendant.Name] then
								pcall(function()
									descendant:Destroy()
								end)
							end
						elseif descendant:IsA("Shirt") then
							if not arg2.Shirt or descendant.ShirtTemplate ~= arg2.Shirt then
								descendant:Destroy()
							end
						elseif descendant:IsA("Pants") then
							if not arg2.Pants or descendant.PantsTemplate ~= arg2.Pants then
								descendant:Destroy()
							end
						elseif descendant:IsA("ShirtGraphic") then
							if not arg2.Graphic or descendant.Graphic ~= arg2.Graphic then
								descendant:Destroy()
							end
						end
					end
				end

				fn26 = function(arg)
					local tbl28 = { Shirt = true, Pants = true, CharacterMesh = true, BodyColors = true, ShirtGraphic = true }

					local function fn62(arg2)
						if not arg2 then
							return
						end

						for _, child in ipairs(arg2:GetChildren()) do
							if tbl28[child.ClassName] or fn61(child) then
								pcall(function()
									child:Destroy()
								end)
							end
						end
					end

					fn62(arg)
					fn62(arg:FindFirstChild("FakeHead"))
				end

				local tbl28 = {}
				local obj2 = setmetatable({}, { __mode = "k" })

				local function fn62(arg)
					if tbl28[arg] ~= nil then
						return tbl28[arg]
					end
					local flag17 = false

					pcall(function()
						local r62 = Enum.HumanoidRigType.R6
						local v44 = Players:CreateHumanoidModelFromDescription(Players:GetHumanoidDescriptionFromUserId(arg), r62)
						local head = v44:FindFirstChild("Head")
						local specialMesh = head and head:FindFirstChildOfClass("SpecialMesh")

						if specialMesh then
							flag17 = {
								MeshId = specialMesh.MeshId,
								TextureId = specialMesh.TextureId,
								Scale = specialMesh.Scale,
								Offset = specialMesh.Offset,
								VertexColor = specialMesh.VertexColor,
							}

							local face = head:FindFirstChild("face")

							if face and (face:IsA("Decal") or face:IsA("Texture")) then
								flag17.Face = face.Texture
							end
						end

						v44:Destroy()
					end)

					tbl28[arg] = flag17
					return flag17
				end

				local function fn63(arg, arg2)
					if not arg2 then
						return
					end
					local head = arg and arg:FindFirstChild("Head")
					local specialMesh = head and head:FindFirstChildOfClass("SpecialMesh")
					if not specialMesh then
						return
					end
					local face = head:FindFirstChild("face")

					if not obj2[arg] then
						obj2[arg] = {
							MeshId = specialMesh.MeshId,
							TextureId = specialMesh.TextureId,
							Scale = specialMesh.Scale,
							Offset = specialMesh.Offset,
							VertexColor = specialMesh.VertexColor,
							Face = face and face.Texture or nil,
						}
					end

					pcall(function()
						specialMesh.MeshId = arg2.MeshId
						specialMesh.TextureId = arg2.TextureId
						specialMesh.Scale = arg2.Scale
						specialMesh.Offset = arg2.Offset
						specialMesh.VertexColor = arg2.VertexColor

						if face and arg2.Face then
							face.Texture = arg2.Face
						end
					end)
				end

				local function fn64(arg)
					local v44 = arg and obj2[arg]
					if not v44 then
						return
					end
					local head = arg:FindFirstChild("Head")
					local specialMesh = head and head:FindFirstChildOfClass("SpecialMesh")

					if specialMesh then
						pcall(function()
							specialMesh.MeshId = v44.MeshId
							specialMesh.TextureId = v44.TextureId
							specialMesh.Scale = v44.Scale
							specialMesh.Offset = v44.Offset
							specialMesh.VertexColor = v44.VertexColor
						end)
					end

					local face = head and head:FindFirstChild("face")

					if face and v44.Face then
						pcall(function()
							face.Texture = v44.Face
						end)
					end

					obj2[arg] = nil
				end

				local function fn65(parent, arg)
					local handle = arg:FindFirstChild("Handle")
					if not handle then
						return
					end

					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.CanCollide = false
							descendant.Massless = true
							descendant.CanQuery = false
							descendant.CanTouch = false
						end
					end

					local attachment = handle:FindFirstChildWhichIsA("Attachment")
					if not attachment then
						arg.Parent = parent
						return
					end
					local v44 = nil
					local v45 = nil

					for _, child in ipairs(parent:GetChildren()) do
						if child:IsA("BasePart") then
							v45 = child:FindFirstChild(attachment.Name)

							if v45 and v45:IsA("Attachment") then
								v44 = child
								break
							else
								v44 = nil
								v45 = nil
							end
						else
							v44 = nil
							v45 = nil
						end
					end

					if not v44 then
						arg.Parent = parent
						return
					end

					for _, child in ipairs(handle:GetChildren()) do
						if child:IsA("Weld") or child:IsA("Motor6D") then
							child:Destroy()
						end
					end

					handle.Anchored = false
					local weld = Instance.new("Weld")
					weld.Name = "AccessoryWeld"
					weld.Part0 = handle
					weld.Part1 = v44
					weld.C0 = attachment.CFrame
					weld.C1 = v45.CFrame
					weld.Parent = handle
					arg.Parent = parent
				end

				fn27 = function(parent, arg, arg2)
					if not (parent and arg) then
						return false
					end
					local humanoid = parent:FindFirstChildOfClass("Humanoid")
					if not humanoid then
						return false
					end
					local v44, v45 = fn22(parent)
					fn26(parent)
					local str9 = humanoid.RigType == Enum.HumanoidRigType.R6 and "R6" or "R15"
					local clone2 = arg:Clone()

					for _, child in ipairs(clone2:GetChildren()) do
						if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("BodyColors") or child:IsA("ShirtGraphic") then
							child.Parent = parent
						elseif child:IsA("Accessory") then
							fn65(parent, child)
						elseif child.Name == str9 then
							local characterMesh = child:FindFirstChildOfClass("CharacterMesh")

							if characterMesh then
								characterMesh.Parent = parent
							end
						end
					end

					pcall(function()
						clone2:Destroy()
					end)

					fn63(parent, arg2 and tbl28[arg2])
					fn23(v44, v45, parent)
					return true
				end

				fn28 = function(arg, arg2, arg3)
					if not arg or not arg.Parent then
						return
					end
					local humanoid = arg:FindFirstChild("Humanoid") or arg:WaitForChild("Humanoid", 8)
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 8)
					if not humanoid or not humanoidRootPart2 then
						return
					end

					if not humanoid:IsDescendantOf(workspace) then
						humanoid.AncestryChanged:Wait()
						if not humanoid:IsDescendantOf(workspace) then
							return
						end
					end

					local now2 = tick()

					while arg:FindFirstChildOfClass("ForceField") and tick() - now2 < 8 do
						RunService.Heartbeat:Wait()
					end

					if not arg.Parent then
						return
					end
					fn27(arg, arg3, arg2)
					if not arg.Parent then
						return
					end
					task.wait(0.5)
					if not arg.Parent then
						return
					end
					fn27(arg, arg3, arg2)
					task.wait(1)
					if not arg.Parent then
						return
					end
					fn27(arg, arg3, arg2)
					task.wait(2.5)
					if not arg.Parent then
						return
					end
					fn27(arg, arg3, arg2)
				end

				fn29 = function(arg)
					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					if not arg then
						return
					end

					connection2 = arg:GetAttributeChangedSignal("Character"):Connect(function()
						if not v27 then
							return
						end
						local v44 = v27
						local v45 = tbl9[v44]
						if not v45 then
							return
						end

						task.delay(0.9, function()
							if v27 ~= v44 then
								return
							end
							local character = localPlayer3.Character
							if not (character and character.Parent) then
								return
							end
							fn27(character, v45, v44)

							task.delay(0.9, function()
								character = localPlayer3.Character

								if character and character.Parent and v27 == v44 then
									fn27(character, v45, v44)
								end
							end)
						end)
					end)
				end

				fn30 = function(arg, arg2)
					if flag8 then
						return
					end
					flag8 = true

					task.spawn(function()
						local v44 = fn21(tostring(arg))
						if not v44 then
							flag8 = false
							return
						end
						local character = localPlayer3.Character
						if not character or not character:FindFirstChild("HumanoidRootPart") then
							flag8 = false
							return
						end

						if v27 == v44 and not arg2 then
							flag8 = false
							return
						end
						local clone2 = tbl9[v44]

						if not clone2 then
							local ok, result = pcall(function()
								return Players:GetCharacterAppearanceAsync(v44)
							end)

							if ok and result then
								clone2 = result:Clone()

								pcall(function()
									result:Destroy()
								end)

								tbl9[v44] = clone2
							end
						end

						if not clone2 then
							flag8 = false
							return
						end
						fn62(v44)
						fn27(character, clone2, v44)
						v27 = v44

						task.delay(0.4, function()
							local character2 = localPlayer3.Character

							if character2 and character2.Parent and v27 == v44 then
								fn27(character2, clone2, v44)
							end
						end)

						flag8 = false
						fn29(character)
					end)
				end

				local heartbeat2 = RunService.Heartbeat
				local connect = heartbeat2.Connect

				local function fn66()
					local now2 = tick()
					local n15 = 6

					return function()
						if v24.Unloaded then
							return
						end

						if not v27 then
							return
						end

						if tick() - now2 < n15 then
							return
						end
						now2 = tick()
						local v44 = v27
						local v45 = tbl9[v44]
						if not v45 then
							return
						end
						local character = localPlayer3.Character

						if character and character.Parent then
							pcall(fn27, character, v45, v44)
						end
					end
				end

				local v44 = fn66()
				v28 = connect(heartbeat2, v44)

				connection = localPlayer3.CharacterAdded:Connect(function(character)
					if v24.Unloaded then
						return
					end

					if not v27 then
						return
					end
					local v45 = v27
					local v46 = tbl9[v45]
					if not v46 then
						return
					end
					fn26(character)
					local flag17 = false

					local function fn67()
						if flag17 then
							return
						end
						flag17 = true
						fn28(character, v45, v46)
						fn29(character)
					end

					if character:FindFirstChild("Animator", true) then
						task.spawn(fn67)
					else
						local connection20 = nil

						connection20 = character.DescendantAdded:Connect(function(descendant)
							if descendant.Name == "Animator" then
								connection20:Disconnect()
								task.spawn(fn67)
							end
						end)
					end
				end)

				connection3 = localPlayer3.CharacterAdded:Connect(function(character)
					task.wait(1)
					if v24.Unloaded then
						return
					end
					fn29(character)
				end)

				if localPlayer3.Character then
					fn29(localPlayer3.Character)
				end

				getgenv()._disguiseAutoApply = function()
					if flag7 then
						return
					end
					local v45 = fn21(options.DisguiseUserInput and options.DisguiseUserInput.Value or "")

					if v45 then
						flag7 = true
						task.spawn(fn30, v45)
					end
				end

				v43:AddInput("DisguiseUserInput", {
					Text = "Username / User ID",
					Default = "",
					Placeholder = "Enter username or user ID...",
					Numeric = false,
					Callback = function(arg)
						if not flag7 and arg and arg ~= "" then
							flag7 = true
							local v45 = fn21(arg)

							if v45 then
								task.spawn(fn30, v45)
							end
						end
					end,
				})

				v43:AddButton({
					Text = "Apply",
					Func = function()
						local v45 = fn21(options.DisguiseUserInput and options.DisguiseUserInput.Value or "")
						if not v45 then
							return
						end

						task.spawn(function()
							fn30(v45, true)
						end)
					end,
				}):AddButton({
					Text = "Random",
					Func = function()
						if flag8 or flag9 then
							return
						end
						flag9 = true
						local tbl29 = {}

						for _, v45 in ipairs(tbl11) do
							if not table.find(tbl8, v45) then
								table.insert(tbl29, v45)
							end
						end

						if #tbl29 == 0 then
							tbl8 = {}
							tbl29 = tbl11
						end

						local v45 = tbl29[math.random(#tbl29)]
						table.insert(tbl8, v45)

						pcall(function()
							options.DisguiseUserInput:SetValue(tostring(v45))
						end)

						task.spawn(fn30, v45)

						task.delay(0.3, function()
							flag9 = false
						end)
					end,
				})

				v43:AddButton({
					Text = "Restore Original",
					Func = function()
						if flag8 then
							return
						end
						flag8 = true

						task.spawn(function()
							local character = localPlayer3.Character
							if not character or not character:FindFirstChild("HumanoidRootPart") then
								flag8 = false
								return
							end

							local ok, result = pcall(function()
								return Players:GetCharacterAppearanceAsync(localPlayer3.UserId)
							end)

							if not ok or not result then
								flag8 = false
								return
							end
							local clone2 = result:Clone()

							pcall(function()
								result:Destroy()
							end)

							fn27(character, clone2, localPlayer3.UserId)

							pcall(function()
								clone2:Destroy()
							end)

							fn64(character)
							v27 = nil

							if connection2 then
								connection2:Disconnect()
								connection2 = nil
							end

							flag8 = false
						end)
					end,
				})

				v43:AddDivider({ Text = "Favorites" })
				local tbl29 = {}

				for _, v45 in ipairs(tbl12) do
					table.insert(tbl29, v45.name)
				end

				if #tbl29 == 0 then
					tbl29 = { "(no favorites)" }
				end

				v43:AddDropdown("DisguiseFavList", { Text = "Saved Favorites", Values = tbl29, Default = tbl29[1] })

				v43:AddButton({
					Text = "Apply Selected",
					Func = function()
						local value = options.DisguiseFavList and options.DisguiseFavList.Value
						if not value or value == "(no favorites)" then
							return
						end
						local id = nil

						for _, v45 in ipairs(tbl12) do
							if v45.name == value then
								id = v45.id
								break
							end
						end

						if not id then
							return
						end

						pcall(function()
							options.DisguiseUserInput:SetValue(tostring(id))
						end)

						task.spawn(function()
							fn30(id, true)
						end)
					end,
				}):AddButton({
					Text = "Remove",
					Func = function()
						local value = options.DisguiseFavList and options.DisguiseFavList.Value
						if not value or value == "(no favorites)" then
							return
						end

						for i, v45 in ipairs(tbl12) do
							if v45.name == value then
								table.remove(tbl12, i)
								break
							end
						end

						fn31()
						fn32()
					end,
				})

				v43:AddButton({
					Text = "Add Current to Favorite",
					Func = function()
						local v45 = fn21(options.DisguiseUserInput and options.DisguiseUserInput.Value or "")
						if not v45 then
							return
						end

						for _, v46 in ipairs(tbl12) do
							if v46.id == v45 then
								return
							end
						end

						task.spawn(function()
							local str9 = tostring(v45)

							pcall(function()
								str9 = game:GetService("Players"):GetNameFromUserIdAsync(v45)
							end)

							table.insert(tbl12, { id = v45, name = str9 })
							fn31()
							fn32()
						end)
					end,
				})
			end

			table.insert(tbl24, function()
				pcall(function()
					options.DisguiseUserInput:SetValue("")
				end)

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if v28 then
					v28:Disconnect()
					v28 = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				v27 = nil
				flag8 = false
				tbl9 = {}
				tbl10 = {}

				task.spawn(function()
					local character = localPlayer3.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if not humanoid then
						return
					end

					local ok, result = pcall(function()
						return Players:GetCharacterAppearanceAsync(localPlayer3.UserId)
					end)

					if not ok or not result then
						return
					end
					local tbl28 = { Shirt = true, Pants = true, CharacterMesh = true, BodyColors = true, ShirtGraphic = true }

					local function fn61(arg)
						if not arg then
							return
						end

						for _, child in ipairs(arg:GetChildren()) do
							if tbl28[child.ClassName] or _isGameAccessory(child) then
								pcall(function()
									child:Destroy()
								end)
							end
						end
					end

					fn61(character)
					fn61(character:FindFirstChild("FakeHead"))
					_disguiseRestoreHead(character)
					local str9 = humanoid.RigType == Enum.HumanoidRigType.R6 and "R6" or "R15"
					local clone2 = result:Clone()

					pcall(function()
						result:Destroy()
					end)

					for _, child in ipairs(clone2:GetChildren()) do
						if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("BodyColors") or child:IsA("ShirtGraphic") then
							child.Parent = character
						elseif child:IsA("Accessory") then
							_disguiseAttach(character, child)
						elseif child.Name == str9 then
							local characterMesh = child:FindFirstChildOfClass("CharacterMesh")

							if characterMesh then
								characterMesh.Parent = character
							end
						end
					end

					pcall(function()
						clone2:Destroy()
					end)
				end)
			end)

			do
				local Info = tbl17.Home:AddRightGroupbox("Info", "info")
				Info:AddLabel("version: <b>v23/09/2026</b> <font color=\"rgb(0,200,120)\">[clean]</font>", true)
				local v43 = Info:AddLabel("rank: ...", true)

				getgenv()._RCS_SetRankLabel = function(arg)
					pcall(function()
						v43:SetText("rank: <b>" .. tostring(arg) .. "</b>")
					end)
				end

				Info:AddDivider({ Text = "Support" })
				Info:AddLabel("To report issues, reach out via Discord.", true)

				Info:AddButton({
					Text = "Copy Discord Server",
					Func = function()
						pcall(function()
							setclipboard("https://discord.gg/TYdSMmQaF9")
						end)

						v24:Notify({ Title = fn39("discord server"), Content = "copied to clipboard!!", Time = 4 })
					end,
				})
			end

			local Menu
			local Settings = tbl17.Settings:AddLeftGroupbox("Settings", "sliders-horizontal")

			do
				local zh = getgenv()._revI18N

				if zh then
					local zhToggle = Settings:AddToggle("RevChinese", {
						Text = "Choose to Chinese",
						Default = false,
						Tooltip = "把界面文字切换为中文 / Switch the UI to Chinese",
						Callback = function(on)
							if zh then
								zh:SetEnabled(on == true)
							end
						end,
					})

					if zh.Want and not zh.Enable then
						task.defer(function()
							pcall(function()
								zhToggle:SetValue(true)
							end)

							if not zh.Enable then
								pcall(function()
									zh:SetEnabled(true)
								end)
							end
						end)
					end
				end
			end

			Menu = tbl17.Settings:AddRightGroupbox("Menu", "layout-dashboard")

			Settings:AddDropdown("NotificationSide", {
				Values = { "Left", "Right" },
				Default = "Right",
				Text = "Notification Side",
				Callback = function(arg)
					v24:SetNotifySide(arg)
				end,
			})

			Menu:AddLabel("Menu Bind"):AddKeyPicker("MenuKeybind", { Default = "LeftAlt", NoUI = true, Text = "Toggle Menu" })
			v24.ToggleKeybind = options.MenuKeybind
			Settings:AddDivider({ Text = "Keybind Menu" })

			Settings:AddToggle("KeybindMenuOpen", {
				Text = "Show Keybinds",
				Default = v24.KeybindFrame.Visible,
				Tooltip = "Shows on-screen keybind buttons. Useful for mobile.",
				Callback = function(visible)
					v24.KeybindFrame.Visible = visible
				end,
			})

			task.spawn(function()
				if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
					if v24.KeybindFrame then
						v24.KeybindFrame.Visible = true
					end

					pcall(function()
						toggles.KeybindMenuOpen:SetValue(true)
					end)

					task.wait(8)

					v24:Notify({
						Title = "Revenant",
						Content = "Mobile device detected. To hide on-screen keybinds, navigate to Settings and disable \"Show Keybinds\".",
						Time = 12,
					})
				end
			end)

			local tbl28
			tbl28 = {}
			local tbl29
			tbl29 = {}
			local fn61

			fn61 = function(arg)
				if not arg then
					return nil
				end

				for _, player in pairs(Players:GetPlayers()) do
					if (player.Name:lower():find("^" .. arg:lower()) or player.DisplayName:lower():find("^" .. arg:lower())) and player ~= localPlayer3 then
						return player
					end
				end

				return nil
			end

			local revRunCmd, flag17, connection20

			local function fn62(arg, arg2, arg3)
				tbl28[arg] = arg3

				if arg2 then
					for _, v43 in ipairs(arg2) do
						tbl29[v43] = arg3
					end
				end
			end

			revRunCmd = function(arg, arg2)
				local v43 = tbl28[arg] or tbl29[arg]

				if v43 then
					v43(arg2)
				end
			end

			getgenv().__RevRunCmd = revRunCmd
			flag17 = false

			fn62("goto", { "tp", "to" }, function(arg)
				local v43 = fn61(arg[1])

				if not v43 and arg[1] and arg[1]:lower() == "random" then
					local players = Players:GetPlayers()

					for i = #players, 1, -1 do
						if players[i] == localPlayer3 then
							table.remove(players, i)
						end
					end

					v43 = players[math.random(1, #players)]
				end

				if v43 then
					local character = v43.Character
					local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

					if character and humanoidRootPart2 then
						local character2 = localPlayer3.Character
						local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart3 then
							local function fn63(arg2)
								if typeof(sethiddenproperty) == "function" then
									pcall(sethiddenproperty, arg2, "PhysicsRepRootPart", nil)
								end

								pcall(function()
									arg2.AssemblyLinearVelocity = Vector3.zero
								end)

								pcall(function()
									arg2.AssemblyAngularVelocity = Vector3.zero
								end)

								pcall(function()
									arg2.Velocity = Vector3.zero
								end)

								pcall(function()
									arg2.RotVelocity = Vector3.zero
								end)
							end

							RunService.Heartbeat:Wait()

							RunService.Heartbeat:Once(function()
								fn63(humanoidRootPart3)
								humanoidRootPart3.CFrame = humanoidRootPart2.CFrame
								fn63(humanoidRootPart3)

								task.spawn(function()
									for i = 1, 4 do
										RunService.Heartbeat:Wait()
										local humanoidRootPart4 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart4 then
											fn63(humanoidRootPart4)
										end
									end
								end)
							end)
						end
					end
				end
			end)

			connection20 = nil

			fn62("view", { "spectate" }, function(arg)
				local v43 = fn61(arg[1])

				if not v43 and arg[1] and arg[1]:lower() == "random" then
					local players = Players:GetPlayers()

					for i = #players, 1, -1 do
						if players[i] == localPlayer3 then
							table.remove(players, i)
						end
					end

					v43 = players[math.random(1, #players)]
				end

				if v43 then
					v24:Notify({ Title = "Viewing", Content = v43.DisplayName, Time = 3 })
					flag16 = true
					fn49(v43)

					if connection20 then
						connection20:Disconnect()
						connection20 = nil
					end

					connection20 = Players.PlayerRemoving:Connect(function(player)
						if player == v43 then
							v24:Notify({ Title = "Command Bar", Content = "Unviewing..", Time = 3 })

							if connection20 then
								connection20:Disconnect()
								connection20 = nil
							end

							flag16 = false
							flag15 = false
							fn50()
						end
					end)
				end
			end)

			fn62("unview", { "unspectate" }, function()
				v24:Notify({ Title = "Command Bar", Content = "Unviewing..", Time = 3 })
				flag16 = false
				fn50()

				if connection20 then
					connection20:Disconnect()
					connection20 = nil
				end
			end)

			fn62("rejoin", { "rj" }, function()
				local TeleportService = game:GetService("TeleportService")

				if game.PrivateServerId ~= "" or #Players:GetPlayers() <= 1 then
					localPlayer3:Kick("Rejoining....")
					task.wait()

					pcall(function()
						TeleportService:Teleport(game.PlaceId, localPlayer3)
					end)
				else
					localPlayer3:Kick("Rejoining....")

					task.delay(0.1, function()
						pcall(function()
							TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer3)
						end)
					end)
				end
			end)

			fn62("join", { "joinjob", "jobid" }, function(arg)
				arg = arg and arg[1]
				if not arg or arg == "" then
					v24:Notify({ Title = "Revenant", Content = "Usage: join <jobid>", Time = 3 })
					return
				end
				local str9 = tostring(arg):gsub("[{}]", ""):gsub("%s", "")
				if not str9:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
					v24:Notify({ Title = "Revenant", Content = "That is not a valid Job ID", Time = 3 })
					return
				end

				if str9 == tostring(game.JobId) then
					v24:Notify({ Title = "Revenant", Content = "You are already in that server", Time = 3 })
					return
				end
				v24:Notify({ Title = "Revenant", Content = "Joining server...", Time = 3 })

				task.spawn(function()
					if not pcall(function()
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, str9, localPlayer3)
					end) then
						v24:Notify({ Title = "Revenant", Content = "Could not join that server", Time = 4 })
					end
				end)
			end)

			fn62("fling", { "void" }, function(arg)
				if not arg[1] then
					return
				end

				if flag14 then
					return
				end
				local str9 = arg[1]:lower()
				local tbl30 = {}

				if str9 == "all" or str9 == "others" then
					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer3 then
							table.insert(tbl30, player)
						end
					end
				else
					local v43 = fn61(arg[1])

					if v43 then
						table.insert(tbl30, v43)
					end
				end

				if #tbl30 == 0 then
					return
				end

				if options.CmdFlingMethod then
				end

				task.spawn(function()
					for _, v43 in ipairs(tbl30) do
						if not (not v43 or not v43.Parent) then
							flag14 = true

							if not flag16 then
								fn49(v43)
							end

							fn56(v43)
							flag14 = false

							if not flag16 then
								fn50()
							end
						end
					end
				end)
			end)

			fn62("loopfling", { "loopvoid" }, function(arg)
				if not arg[1] then
					return
				end
				local str9 = arg[1]:lower()

				if str9 == "all" then
					str4 = "all"

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer3 and fn55(player) then
							tbl22[fn46(player)] = player
						end
					end
				elseif str9 == "others" then
					str4 = "others"

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= localPlayer3 and fn55(player) then
							tbl22[fn46(player)] = player
						end
					end
				else
					str4 = "single"
					local v43 = fn61(arg[1])
					if not v43 then
						return
					end

					if not fn55(v43) then
						v24:Notify({ Title = "Fling", Content = v43.DisplayName .. " is not in the map.", Time = 3 })
						return
					end
					tbl22[fn46(v43)] = v43
				end

				if not flag14 then
					fn57()
				end
			end)

			fn62("unfling", { "unvoid", "unloopfling", "unloopvoid" }, function(arg)
				if not arg[1] then
					str4 = nil
					tbl22 = {}
					fn58()
					return
				end

				local str9 = arg[1]:lower()

				if str9 == "all" or str9 == "others" then
					str4 = nil
					tbl22 = {}
					fn58()
				else
					local v43 = fn61(arg[1])

					if v43 then
						tbl22[fn46(v43)] = nil
					end

					if not next(tbl22) then
						str4 = nil
						fn58()
					end
				end
			end)

			fn62("reset", nil, function()
				pcall(function()
					replicatesignal(game.Players.LocalPlayer.Kill)
				end)
			end)

			fn62("fixcam", nil, function()
				if getgenv()._RevenantFixCam then
					getgenv()._RevenantFixCam()
					return
				end
				local character = localPlayer3.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if character and humanoid and workspace.CurrentCamera then
					local cFrame2 = workspace.CurrentCamera.CFrame
					workspace.CurrentCamera:Destroy()
					local camera = Instance.new("Camera", workspace)
					camera.CameraType = Enum.CameraType.Custom
					camera.CameraSubject = humanoid
					camera.CFrame = cFrame2
					localPlayer3.CameraMode = Enum.CameraMode.Classic
				end
			end)

			RevenantWhitelist = RevenantWhitelist or {}

			fn62("whitelist", { "addwhitelist" }, function(arg)
				local v43 = fn61(arg[1])
				if not v43 then
					return
				end

				if table.find(RevenantWhitelist, v43) then
					v24:Notify({ Title = "Whitelist", Content = v43.DisplayName .. " is already whitelisted.", Time = 3 })
				else
					table.insert(RevenantWhitelist, v43)
					v24:Notify({ Title = "Whitelist", Content = "Whitelisted " .. v43.DisplayName, Time = 3 })
				end
			end)

			fn62("unwhitelist", { "removewhitelist" }, function(arg)
				local v43 = fn61(arg[1])
				if not v43 then
					return
				end
				local v44 = table.find(RevenantWhitelist, v43)

				if v44 then
					table.remove(RevenantWhitelist, v44)
					v24:Notify({ Title = "Whitelist", Content = "Unwhitelisted " .. v43.DisplayName, Time = 3 })
				end
			end)

			tbl13 = {}
			rcsMyRank = 99
			str6 = "RCS_"
			_RCS_OrigTitles = ""
			_RCS_Marker = "RVN1:"

			_RCS_FireTitles = function(arg)

				if true then return false end
				local character = localPlayer3.Character
				local communicate = character and character:FindFirstChild("Communicate")
				if not communicate then
					return false
				end

				return (pcall(function()
					communicate:FireServer({ Emote = arg, Goal = "EmoteLoadout", Loadout = getgenv()._revRCSSlot or -1 })
				end))
			end

			tbl14 = {}
			tbl15 = {}

			fn33 = function(arg)
				return tbl14[arg:lower()] or 99
			end

			rcsMyHWID = ""
			rcsMyRank = 99
			getgenv()._RCS_MyRank = 99
			getgenv()._RCS_MyHWID = ""

			if getgenv()._RCS_SetRankLabel then
				pcall(getgenv()._RCS_SetRankLabel, "None")
			end
			str7 = tostring(math.random(100000, 999999))

			_RCS_toHex = function(arg)
				return (arg:gsub(".", function(arg2)
					return string.format("%02x", arg2:byte())
				end))
			end

			_RCS_fromHex = function(arg)
				return (arg:gsub("%x%x", function(arg2)
					return string.char(tonumber(arg2, 16))
				end))
			end

			_RCS_BlinkTime = 0.5
			_RCS_SendQueue = {}
			_RCS_Pumping = false

			_RCS_Pump = function()
				if _RCS_Pumping then
					return
				end
				_RCS_Pumping = true

				task.spawn(function()
					local n15 = 0

					while #_RCS_SendQueue > 0 do
						local v43 = table.remove(_RCS_SendQueue, 1)

						if _RCS_FireTitles(v43) then
							task.wait(_RCS_BlinkTime)
							_RCS_FireTitles(nil)
							task.wait(0.15)
							n15 = 0
						else
							n15 += 1

							if n15 <= 10 then
								table.insert(_RCS_SendQueue, 1, v43)
								task.wait(0.5)
							end
						end
					end

					_RCS_Pumping = false
				end)
			end

			fn34 = function(arg, arg2)

				if true then return end
				table.insert(_RCS_SendQueue, _RCS_Marker .. _RCS_toHex(str6 .. arg .. "|" .. rcsMyHWID .. "|" .. str7 .. "|" .. (arg2 or "")))
				_RCS_Pump()
			end

			connection4 = nil

			fn35 = function(arg, arg2)

				if true then return end
				local character = localPlayer3.Character
				local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if arg == "bring" then
					if humanoidRootPart2 and arg2 ~= "" then
						local match, v43, v44, v45, v46, v47 = arg2:match("^(%-?[%d%.]+),(%-?[%d%.]+),(%-?[%d%.]+),(%-?[%d%.]+),(%-?[%d%.]+),(%-?[%d%.]+)$")

						if match then
							local vector = Vector3.new
							local num = tonumber(match)
							local v48 = tonumber
							local v49 = vector(num, tonumber(v43), v48(v44))
							local v50 = tonumber
							local vector2 = Vector3.new(tonumber(v45), tonumber(v46), v50(v47))
							humanoidRootPart2.CFrame = CFrame.lookAt(v49, vector2)
						else
							local match2, v48, v49 = arg2:match("^(%-?[%d%.]+),(%-?[%d%.]+),(%-?[%d%.]+)$")

							if match2 then
								local v50 = tonumber
								humanoidRootPart2.CFrame = CFrame.new(tonumber(match2), tonumber(v48), v50(v49))
							end
						end
					end
				elseif arg == "kill" then
					if typeof(replicatesignal) == "function" then
						pcall(function()
							replicatesignal(localPlayer3.Kill)
						end)
					elseif humanoid then
						humanoid.Health = 0
					end
				elseif arg == "anchor" then
					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					local cFrame2 = humanoidRootPart2 and humanoidRootPart2.CFrame or CFrame.new(0, 5, 0)

					connection4 = RunService.Heartbeat:Connect(function()
						local character2 = localPlayer3.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if character2 then
							character2.CFrame = cFrame2
							character2.AssemblyLinearVelocity = Vector3.zero
							character2.AssemblyAngularVelocity = Vector3.zero
							character2.Velocity = Vector3.zero
							character2.RotVelocity = Vector3.zero
						end
					end)
				elseif arg == "unanchor" then
					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end
				elseif arg == "sonic" then
					if not getgenv().RevenantSonicExecuted then
						getgenv().RevenantSonicExecuted = true

						pcall(function()

						end)
					end

					pcall(function()
						if getgenv().RevenantCleanup then
							getgenv().RevenantCleanup()
						elseif v24 then
							v24:Unload()
						end

						getgenv().RevenantLoaded = false
						getgenv().RevenantCleanup = nil
					end)
				elseif arg == "monochrome" then
					if not getgenv()._RevenantMonochromeExecuted then
						getgenv()._RevenantMonochromeExecuted = true

						pcall(function()

						end)
					end
				elseif arg == "ban" then
					if character then
						pcall(function()

						end)

						pcall(function()

						end)

						pcall(function()

						end)

						pcall(function()

						end)

						local communicate = character:FindFirstChild("Communicate") or character:WaitForChild("Communicate", 1)

						if communicate then
							pcall(function()

							end)
						end
					end
				elseif arg == "kick" then
					local v43 = localPlayer3
					local kick = v43.Kick
					arg2 = arg2 ~= "" and arg2 or "[RCS] You were kicked."
					kick(v43, arg2)
				elseif arg == "unload" then
					pcall(function()
						if getgenv().RevenantCleanup then
							getgenv().RevenantCleanup()
						else
							v24:Unload()
						end
					end)
				elseif arg == "say" then
					pcall(function()
						local rbxGeneral = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")

						if rbxGeneral then
							rbxGeneral:SendAsync(arg2)
						end
					end)
				elseif arg == "notify" then
					v24:Notify({ Title = fn39("..."), Content = arg2, Time = 6 })
				elseif arg == "jumpscare" then
					task.spawn(function()
						local CoreGui2 = game:GetService("CoreGui")
						local sound = Instance.new("Sound", CoreGui2)
						sound.SoundId = "rbxassetid://5332146653"
						sound.Volume = 10
						sound.PlaybackSpeed = 3
						sound:Play()
						sound.Ended:Wait()
						sound:Destroy()
						local screenGui2 = Instance.new("ScreenGui", CoreGui2)
						screenGui2.IgnoreGuiInset = true
						screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						local imageLabel = Instance.new("ImageLabel", screenGui2)
						imageLabel.BackgroundTransparency = 1
						imageLabel.BorderSizePixel = 0
						imageLabel.Position = UDim2.new(0, 0, 0, 0)
						imageLabel.Size = UDim2.new(1, 0, 1, 0)
						imageLabel.Image = "rbxassetid://17006455825"
						local sound2 = Instance.new("Sound", CoreGui2)
						sound2.SoundId = "rbxassetid://1332644289"
						sound2.Volume = 10
						sound2:Play()
						sound2.Ended:Wait()
						screenGui2:Destroy()
						sound2:Destroy()
					end)
				elseif arg == "bemystand" then
					if arg2 ~= "" then
						local v43 = nil

						for _, player in pairs(Players:GetPlayers()) do
							if player.Name == arg2 or player.DisplayName == arg2 then
								v43 = player
								break
							else
								v43 = nil
							end
						end

						if v43 and getgenv()._standActivateFn then
							getgenv()._standActivateFn(v43)

							pcall(function()
								options.StandTargetDropdown:SetDisabled(true)
							end)

							pcall(function()
								options.StandMethodDropdown:SetDisabled(true)
							end)
						end
					end
				elseif arg == "stopbeingmystand" then
					if getgenv()._standDeactivateFn then
						getgenv()._standDeactivateFn()
					end

					pcall(function()
						options.StandTargetDropdown:SetDisabled(false)
					end)

					pcall(function()
						options.StandMethodDropdown:SetDisabled(false)
					end)
				elseif arg == "yowtf" then
					local communicate = character and character:FindFirstChild("Communicate")

					if communicate then
						for i = 1, 1200 do
							pcall(function()
								communicate:FireServer({ Goal = "FloorMaterial" })
							end)
						end
					end
				elseif arg == "char" then
					if arg2 ~= "" then
						task.spawn(function()
							local character2 = localPlayer3.Character
							local attribute

							if character2 then
								attribute = character2:GetAttribute("GotDamage") or character2:GetAttribute("DidDamage")
							else
								attribute = character2
							end

							if attribute then
								if typeof(replicatesignal) == "function" then
									pcall(function()
										replicatesignal(localPlayer3.Kill)
									end)
								else
									local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

									if humanoid2 then
										humanoid2.Health = 0
									end
								end

								local now2 = os.clock()

								while true do
									task.wait(0.1)
									local humanoid2 = localPlayer3.Character and localPlayer3.Character:FindFirstChildOfClass("Humanoid")

									if not (humanoid2 and humanoid2.Health <= 0) then
										if not (os.clock() - now2 > 3) then
											continue
										end
									end

									break
								end
							end

							local character3 = localPlayer3.Character
							local communicate = character3 and character3:FindFirstChild("Communicate")

							if communicate then
								pcall(function()
									communicate:FireServer({ Goal = "Change Character", Character = arg2 })
								end)
							end
						end)
					end
				end
			end

			fn36 = function(cmd, arg)

				if true then return end
				if rcsMyRank == 99 then
					return
				end
				local str9 = tostring(arg.UserId)

				if cmd == "bring" then
					local humanoidRootPart2 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart2 then
						local n15 = humanoidRootPart2.CFrame * CFrame.new(0, 0, -3)
						str9 ..= "," .. string.format("%.3f,%.3f,%.3f,%.3f,%.3f,%.3f", n15.X, n15.Y, n15.Z, humanoidRootPart2.Position.X, humanoidRootPart2.Position.Y, humanoidRootPart2.Position.Z)
					end
				end

				fn34("CMD:" .. cmd, str9)
			end

			_RCS_HandlePacket = function(arg, arg2)

				if true then return end
				if not arg or not arg2 then
					return
				end
				local tbl30 = { UserId = arg.UserId }
				if tbl30.UserId == localPlayer3.UserId then
					return
				end

				if arg2:sub(1, #str6) ~= str6 then
					return
				end
				local match, v43, v44, v45 = arg2:sub(#str6 + 1):match("^([^|]+)|([^|]*)|([^|]*)|?(.*)$")
				if not match or not v43 then
					return
				end
				local v46 = fn33(v43)
				if match == "rvcf_here" then
					fn34("rvcf_nothere")
					return
				end

				if match == "discon" then
					if tbl13[tbl30.UserId] and rcsMyRank <= 3 then
						v24:Notify({
							Title = fn39("Command bar"),
							Content = arg.DisplayName .. " (@" .. arg.Name .. ") unloaded Revenant, you can no longer run commands on them.",
							Time = 6,
						})
					end

					tbl13[tbl30.UserId] = nil
					return
				end

				if match == "init i support hooks" or match == "init i dont support hooks" then
					local flag18 = match == "init i support hooks"
					local lastAck = tbl13[tbl30.UserId]
					local flag19 = not lastAck or lastAck.token ~= v44
					lastAck = lastAck and lastAck.lastAck
					tbl13[tbl30.UserId] = { player = arg, hwid = v43, rank = v46, token = v44, supportsHooks = flag18, lastAck = lastAck }

					if flag19 and (not lastAck or tick() - lastAck > 5) then
						tbl13[tbl30.UserId].lastAck = tick()

						if typeof(hookfunction) == "function" then
							fn34("init i support hooks")
						else
							fn34("init i dont support hooks")
						end

						if rcsMyRank <= 3 then
							v24:Notify({
								Title = fn39("Command bar"),
								Content = "Privileged connected with " .. arg.DisplayName .. " (@" .. arg.Name .. "), extra commands are available, if you are higher than him.",
								Time = 6,
							})
						end
					end

					return
				end

				if match:sub(1, 4) == "CMD:" then
					local str9 = match:sub(5)
					local parts = v45:split(",")
					local v47 = parts[1]
					if tostring(localPlayer3.UserId) ~= v47 then
						return
					end

					if v46 == 99 then
						return
					end

					if str9 == "ban" and v46 ~= 1 then
						fn34("CMD:notify", tostring(tbl30.UserId) .. ",No permissions.")
						return
					end

					if str9 == "yowtf" and v46 > 3 then
						fn34("CMD:notify", tostring(tbl30.UserId) .. ",No permissions.")
						return
					end

					if str9 ~= "notify" and v46 >= rcsMyRank then
						fn34("CMD:notify", tostring(tbl30.UserId) .. ",No permissions.")
						return
					end
					local str10

					if str9 == "bring" and #parts >= 7 then
						str10 = parts[2] .. "," .. parts[3] .. "," .. parts[4] .. "," .. parts[5] .. "," .. parts[6] .. "," .. parts[7]
					elseif str9 == "kick" and #parts >= 2 then
						str10 = table.concat(parts, ",", 2)
					elseif str9 == "say" and #parts >= 2 then
						str10 = table.concat(parts, ",", 2)
					elseif str9 == "notify" and #parts >= 2 then
						str10 = table.concat(parts, ",", 2)
					elseif str9 == "char" and #parts >= 2 then
						str10 = table.concat(parts, ",", 2)
					else
						str10 = ""

						if str9 == "bemystand" then
							str10 = arg.Name
						end
					end

					fn35(str9, str10)
				end
			end

			_RCS_AttrConns = {}

			_RCS_watchPlayer = function(arg)

				if true then return end
				if arg == localPlayer3 or _RCS_AttrConns[arg] then
					return
				end

				_RCS_AttrConns[arg] = arg:GetAttributeChangedSignal("EmoteLoadout"):Connect(function()
					local attribute = arg:GetAttribute("EmoteLoadout")
					if type(attribute) ~= "string" then
						return
					end
					local match = attribute:match("\"%-?%d+\":\"" .. _RCS_Marker .. "(%x+)\"")
					if not match then
						return
					end
					local ok, result = pcall(_RCS_fromHex, match)

					if ok and result then
						_RCS_HandlePacket(arg, result)
					end
				end)
			end

			for _, player in ipairs(Players:GetPlayers()) do
				_RCS_watchPlayer(player)
			end

			_RCS_PlayerAddedConn = Players.PlayerAdded:Connect(_RCS_watchPlayer)

			getgenv()._tsb_getRevTargets = function(arg)
				local str9 = arg:lower()

				if str9 == "all" or str9 == "others" then
					local tbl30 = {}

					for _, v43 in pairs(tbl13) do
						if v43.player and v43.player.Parent then
							table.insert(tbl30, v43.player)
						end
					end

					return tbl30
				end

				for _, v43 in pairs(tbl13) do
					local player = v43.player

					if player and player.Parent then
						if player.Name:lower():sub(1, #str9) == str9 or player.DisplayName:lower():sub(1, #str9) == str9 then
							return { player }
						end
					end
				end

				return nil
			end

			getgenv()._tsb_resolveChar = function(arg)
				local match = tostring(arg or ""):lower():match("^%s*(.-)%s*$")
				if match == "" then
					return nil
				end
				local tbl30 = {}
				local tbl31 = {}
				local tbl32 = {}

				local function fn63(arg2, arg3)
					if not arg2 or not arg3 then
						return
					end
					local str9 = tostring(arg2)
					local str10 = tostring(arg3)
					local str11 = str9:lower() .. "|" .. str10
					if tbl31[str11] then
						return
					end
					tbl31[str11] = true
					tbl30[#tbl30 + 1] = { label = str9, attr = str10 }
				end

				pcall(function()
					local v43 = pairs
					local skillsets = require(game:GetService("ReplicatedStorage").Info).Skillsets or {}

					for k, skillset in v43(skillsets) do
						local flag18 = type(k) == "string"

						if flag18 then
							flag18 = not (type(skillset) == "table" and skillset.Exclude)
						end

						if flag18 then
							tbl32[k] = true
							fn63(k, k)

							if type(skillset) == "table" and type(skillset.Name) == "string" then
								fn63(skillset.Name, k)
							end
						end
					end
				end)

				local flag18 = next(tbl32) ~= nil
				local v43 = pairs
				local revLabelToAttr = getgenv()._RevLabelToAttr or {}

				for k, v44 in v43(revLabelToAttr) do
					if not flag18 or tbl32[v44] then
						fn63(k, v44)
					end
				end

				for k, v44 in pairs({ ["The Crab"] = "Crab Boss", ["Zombie Man"] = "Zombie", King = "KJ" }) do
					if not flag18 or tbl32[v44] then
						fn63(k, v44)
					end
				end

				local function fn64(arg2)
					local v44 = nil

					for _, v45 in ipairs(tbl30) do
						if arg2(v45.label:lower()) or arg2(v45.attr:lower()) then
							if not v44 or #v45.label < #v44.label then
								v44 = v45
							end
						end
					end

					return v44
				end

				local v44 = fn64(function(arg2)
					return arg2 == match
				end) or fn64(function(arg2)
					return arg2:sub(1, #match) == match
				end) or fn64(function(arg2)
					return arg2:find(match, 1, true) ~= nil
				end)

				return v44 and v44.attr or nil
			end

			getgenv()._tsb_RCS_Cmd = function(cmd, arg, arg2)
				fn62(cmd, arg, function(arg3)
					local v43 = getgenv()._tsb_getRevTargets(arg3[1] or "")
					if not v43 or #v43 == 0 then
						v24:Notify({ Title = fn39("Command bar"), Content = "Theres no revenant user here.", Time = 3 })
						return
					end

					for _, v44 in ipairs(v43) do
						if arg2 then
							local v45 = arg2(v44, arg3)

							if v45 ~= nil then
								fn34("CMD:" .. cmd, v45)
							end
						else
							fn36(cmd, v44)
						end
					end
				end)
			end

			if rcsMyRank <= 3 then
				getgenv()._tsb_RCS_Cmd("bring")
				getgenv()._tsb_RCS_Cmd("kill")
				getgenv()._tsb_RCS_Cmd("anchor")
				getgenv()._tsb_RCS_Cmd("unanchor")
				getgenv()._tsb_RCS_Cmd("sonic")
				getgenv()._tsb_RCS_Cmd("monochrome")
				getgenv()._tsb_RCS_Cmd("unload")
				getgenv()._tsb_RCS_Cmd("yowtf")

				if rcsMyRank == 1 then
					getgenv()._tsb_RCS_Cmd("ban")
				end

				getgenv()._tsb_RCS_Cmd("kick", nil, function(arg, arg2)
					local str9 = #arg2 > 1 and table.concat(arg2, " ", 2) or ""
					return tostring(arg.UserId) .. (str9 ~= "" and "," .. str9 or "")
				end)

				getgenv()._tsb_RCS_Cmd("say", nil, function(arg, arg2)
					local str9 = #arg2 > 1 and table.concat(arg2, " ", 2) or ""
					return tostring(arg.UserId) .. "," .. str9
				end)

				getgenv()._tsb_RCS_Cmd("notify", nil, function(arg, arg2)
					local str9 = #arg2 > 1 and table.concat(arg2, " ", 2) or ""
					return tostring(arg.UserId) .. "," .. str9
				end)

				getgenv()._tsb_RCS_Cmd("jumpscare")
				getgenv()._tsb_RCS_Cmd("bemystand")
				getgenv()._tsb_RCS_Cmd("stopbeingmystand")

				getgenv()._tsb_RCS_Cmd("char", { "changechar", "setchar" }, function(arg, arg2)
					local str9 = #arg2 > 1 and table.concat(arg2, " ", 2) or ""
					if str9 == "" then
						return nil
					end
					local str10

					if str9:sub(1, 1) == "=" then
						str10 = str9:sub(2)
					else
						str10 = getgenv()._tsb_resolveChar(str9)
					end

					if not str10 or str10 == "" then
						if os.clock() - (getgenv()._tsb_charWarnAt or 0) > 1 then
							getgenv()._tsb_charWarnAt = os.clock()

							v24:Notify({
								Title = fn39("Command bar"),
								Content = "Character \"" .. str9 .. "\" not found.",
								Time = 4,
							})
						end

						return nil
					end

					return tostring(arg.UserId) .. "," .. str10
				end)
			end

			if rcsMyRank > 3 then
				task.spawn(function()
					local now2 = os.clock()

					while (not rawget(toggles, "Take40Health") or not getgenv()._RevenantDoneLoading) and os.clock() - now2 < 20 do
						task.wait()
					end

					local value = rawget(toggles, "Take40Health")
					if not value then
						return
					end

					pcall(function()
						value:SetValue(false)
					end)

					pcall(function()
						value:SetDisabled(true)
					end)

					pcall(function()
						value:SetVisible(false)
					end)

					pcall(function()
						if options.Take40Bind then
							options.Take40Bind.ForceListHidden = true
							options.Take40Bind:Update()
						end
					end)
				end)
			end

			Players.PlayerRemoving:Connect(function(player)
				if tbl13[player.UserId] and rcsMyRank <= 3 then
					v24:Notify({
						Title = fn39("Command bar"),
						Content = player.DisplayName .. " (@" .. player.Name .. ") left the server, Revenant user gone.",
						Time = 5,
					})
				end

				tbl13[player.UserId] = nil
			end)

			fn62("listrevenantusers", { "listrev" }, function()
				local tbl30 = {}

				for _, v43 in pairs(tbl13) do
					local player = v43.player

					if player and player.Parent then
						table.insert(tbl30, player.DisplayName .. " (@" .. player.Name .. ")")
					end
				end

				if #tbl30 == 0 then
					v24:Notify({ Title = fn39("Command bar"), Content = "No Revenant users in this server.", Time = 4 })
				else
					v24:Notify({ Title = fn39("Command bar"), Content = table.concat(tbl30, ", "), Time = 6 })
				end
			end)

			table.insert(tbl24, function()
				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				if _RCS_PlayerAddedConn then
					_RCS_PlayerAddedConn:Disconnect()
					_RCS_PlayerAddedConn = nil
				end

				if _RCS_ReprobeConn then
					_RCS_ReprobeConn:Disconnect()
					_RCS_ReprobeConn = nil
				end

				if _RCS_BeaconThread then
					pcall(task.cancel, _RCS_BeaconThread)
					_RCS_BeaconThread = nil
				end

				if _RCS_DecoyThread then
					pcall(task.cancel, _RCS_DecoyThread)
					_RCS_DecoyThread = nil
				end

				if _RCS_AttrConns then
					for _, v43 in pairs(_RCS_AttrConns) do
						pcall(function()
							v43:Disconnect()
						end)
					end

					_RCS_AttrConns = {}
				end

				pcall(_RCS_FireTitles, nil)
			end)

			_RCS_InitPacket = function()
				return typeof(hookfunction) == "function" and "init i support hooks" or "init i dont support hooks"
			end

			_RCS_WaitComm = function(arg)
				local now2 = os.clock()

				while true do
					local character = localPlayer3.Character
					local communicate = character and character:FindFirstChild("Communicate")
					if communicate and character:FindFirstChildOfClass("Humanoid") then
						return communicate
					end
					task.wait(0.2)
					if not (arg <= os.clock() - now2) then
						continue
					end
					break
				end

				return nil
			end

			_RCS_ProbeSlot = function()

				if true then return false, 0 end
				local str9 = _RCS_Marker .. _RCS_toHex(str6 .. "slotprobe" .. tostring(math.random(100000, 999999)) .. "||")
				local n15 = 0

				for _, v43 in ipairs({ -1, -2, -3, -5, 0 }) do
					local v44 = _RCS_WaitComm(n15 == 0 and 15 or 5)

					if v44 then
						if pcall(function()
							v44:FireServer({ Emote = str9, Goal = "EmoteLoadout", Loadout = v43 })
						end) then
							n15 += 1
							local flag18 = false

							for i = 1, 25 do
								task.wait(0.1)
								local attribute = localPlayer3:GetAttribute("EmoteLoadout")
								if type(attribute) == "string" and attribute:find(str9, 1, true) then
									flag18 = true
									break
								end
							end

							pcall(function()
								v44:FireServer({ Emote = nil, Goal = "EmoteLoadout", Loadout = v43 })
							end)

							if flag18 then
								getgenv()._revRCSSlot = v43
								getgenv()._revRCSSlotFailed = nil
								return true, n15
							end
						end
					end
				end

				return false, n15
			end

			_RCS_BeaconThread = task.spawn(function()
				task.wait(2)

				if not getgenv()._revRCSSlot then
					local v43, v44 = _RCS_ProbeSlot()

					if not v43 then
						getgenv()._revRCSSlotFailed = true

						if rcsMyRank <= 3 then
							v24:Notify({
								Title = fn39("Command bar"),
								Content = v44 == 0 and "Your commands are NOT going out: the Communicate remote was never reachable, so nothing was sent. Retrying on respawn." or "Your commands are NOT going out: the server refused all " .. v44 .. " emote slots that were tried. Receiving still works. Report this to ari.",
								Time = 12,
							})
						end
					end
				end

				for i = 1, 3 do
					fn34(_RCS_InitPacket())
					task.wait(1)
				end
			end)

			_RCS_ReprobeConn = localPlayer3.CharacterAdded:Connect(function()
				if getgenv()._revRCSSlot or not getgenv()._revRCSSlotFailed then
					return
				end
				task.wait(3)
				if getgenv()._revRCSSlot then
					return
				end

				if _RCS_ProbeSlot() and rcsMyRank <= 3 then
					v24:Notify({
						Title = fn39("Command bar"),
						Content = "Command transport recovered on emote slot " .. tostring(getgenv()._revRCSSlot) .. ".",
						Time = 6,
					})
				end
			end)

			do
				local Settings2 = tbl17.Commands:AddLeftGroupbox("Settings", "settings-2")
				local Commands = tbl17.Commands:AddRightGroupbox("Commands", "terminal")
				Settings2:AddDivider({ Text = "Command Bar" })

				Settings2:AddToggle("CommandBar", { Text = "Command Bar", Default = false }):AddKeyPicker("CommandBind", {
					SyncToggleState = false,
					Mode = "Toggle",
					Default = "Semicolon",
					Text = "Command Bar Keybind",
					NoUI = true,
				})

				Settings2:AddToggle("UseCommandsinChat", { Text = "Use Commands in Chat", Default = false })
				Settings2:AddToggle("SendCommandInChat", { Text = "Send Command In Chat", Default = false })
				Settings2:AddDivider({ Text = "Fling" })
				Settings2:AddDropdown("CmdFlingMethod", { Text = "Fling Type", Values = { "Anti-Fling", "Normal", "Void" }, Default = 3, Multi = false })
				Settings2:AddSlider("FlingSpeed", { Text = "Fling Speed", Default = 15, Min = 15, Max = 90, Rounding = 0, Compact = true })
				Settings2:AddSlider("FlingTimeout", { Text = "Fling Timeout", Default = 3, Min = 1, Max = 5, Rounding = 0, Compact = true })
				fn59()

				local tbl30 = {
					"goto",
					"fling",
					"loopfling",
					"unfling",
					"view",
					"unview",
					"whitelist",
					"unwhitelist",
					"rejoin",
					"reset",
					"fixcam",
				}

				local tbl31 = {
					"bring",
					"kill",
					"anchor",
					"unanchor",
					"sonic",
					"monochrome",
					"yowtf",
					"kick",
					"unload",
					"bemystand",
					"stopbeingmystand",
					"char",
					"say",
					"notify",
					"jumpscare",
					"listrevenantusers",
				}

				local tbl32 = { "ban" }

				local tbl33 = {
					unview = true,
					unspectate = true,
					rejoin = true,
					rj = true,
					reset = true,
					fixcam = true,
					listrevenantusers = true,
					listrev = true,
				}

				local tbl34 = { say = true, notify = true, kick = true }

				local function fn63()
					local str9 = options.CmdBarMethod and options.CmdBarMethod.Value or "Default"
					local tbl35 = {}

					if str9 == "Default" then
						for _, v43 in ipairs(tbl30) do
							tbl35[#tbl35 + 1] = v43
						end
					elseif rcsMyRank <= 3 then
						for _, v43 in ipairs(tbl31) do
							tbl35[#tbl35 + 1] = v43
						end

						if rcsMyRank == 1 then
							for _, v43 in ipairs(tbl32) do
								tbl35[#tbl35 + 1] = v43
							end
						end
					end

					return tbl35
				end

				local function fn64()
					local str9 = options.CmdBarMethod and options.CmdBarMethod.Value or "Default"
					local tbl35 = { "[All]" }

					if str9 == "Default" then
						for _, player in pairs(Players:GetPlayers()) do
							if player ~= localPlayer3 then
								tbl35[#tbl35 + 1] = fn41(player)
							end
						end
					else
						for _, v43 in pairs(tbl13) do
							local player = v43.player

							if player and player.Parent and player ~= localPlayer3 then
								tbl35[#tbl35 + 1] = fn41(player)
							end
						end
					end

					return tbl35
				end

				local v43 = Settings2:AddDependencyGroupbox()

				v43:AddDropdown("CmdBarMethod", {
					Text = "Method",
					Values = rcsMyRank <= 3 and { "Default", "Privileged" } or { "Default" },
					Default = "Default",
					Callback = function()
						pcall(function()
							options.CmdBarCommand:SetValues(fn63())
						end)

						pcall(function()
							options.CmdBarPlayer:SetValues(fn64())
						end)
					end,
				})

				v43:AddDropdown("CmdBarCommand", {
					Text = "Command",
					Values = fn63(),
					Default = 1,
					Searchable = true,
					Callback = function(arg)
						local flag18 = tbl34[arg and arg:lower() or ""] or false

						pcall(function()
							options.CmdBarMessage:SetVisible(flag18)
						end)
					end,
				})

				v43:AddInput("CmdBarMessage", { Text = "Message", Default = "", Placeholder = "Put the message here", Visible = false })
				local CmdBarPlayer = v43:AddDropdown("CmdBarPlayer", { Text = "Player", Values = fn64(), Default = "", Searchable = true, AllowNull = true })

				task.spawn(function()
					task.wait(0.5)

					pcall(function()
						options.CmdBarCommand:SetValues(fn63())
					end)

					pcall(function()
						options.CmdBarPlayer:SetValues(fn64())
					end)
				end)

				v43:AddButton({
					Text = "Run Command",
					Func = function()
						local value = options.CmdBarCommand and options.CmdBarCommand.Value
						if not value or value == "" then
							return
						end
						local str9 = value:lower()
						local tbl35 = {}

						if not tbl33[str9] then
							local str10 = tostring(options.CmdBarPlayer and options.CmdBarPlayer.Value or "")
							if str10 == "" then
								v24:Notify({ Title = fn39("Command Bar"), Content = "Pick a player or [All].", Time = 3 })
								return
							end

							if str10 == "[All]" then
								tbl35[1] = "all"
							else
								local v44 = fn42(str10)
								if not v44 then
									v24:Notify({ Title = fn39("Command Bar"), Content = "Invalid player.", Time = 3 })
									return
								end
								tbl35[1] = v44.Name
							end
						end

						if tbl34[str9] then
							local str10 = options.CmdBarMessage and options.CmdBarMessage.Value or ""

							if str9 == "kick" and (str10 == "" or str10 == nil) then
								str10 = "Exploiting"
							end

							if (str9 == "say" or str9 == "notify") and (str10 == "" or str10 == nil) then
								v24:Notify({ Title = fn39("Command Bar"), Content = "Type a message first.", Time = 3 })
								return
							end
							tbl35[2] = str10
						end

						if tbl28[str9] or tbl29[str9] then
							task.spawn(revRunCmd, str9, tbl35)
						else
							v24:Notify({ Title = fn39("Command Bar"), Content = "Unknown command.", Time = 3 })
						end
					end,
				})

				v43:SetupDependencies({ { toggles.CommandBar, true } })

				Players.PlayerAdded:Connect(function()
					pcall(function()
						CmdBarPlayer:SetValues(fn64())
					end)
				end)

				Players.PlayerRemoving:Connect(function()
					pcall(function()
						CmdBarPlayer:SetValues(fn64())
					end)
				end)

				Commands:AddDivider({ Text = "Movement" })
				Commands:AddLabel(";goto/tp/to {player}", true)
				Commands:AddDivider({ Text = "Fling" })
				Commands:AddLabel(";fling/void {player,all,others}" .. string.char(10) .. ";loopfling/loopvoid {player,all,others}" .. string.char(10) .. ";unfling/unvoid {player,all}", true)
				Commands:AddDivider({ Text = "Spectate" })
				Commands:AddLabel(";view/spectate {player}" .. string.char(10) .. ";unview/unspectate", true)
				Commands:AddDivider({ Text = "Whitelist" })
				Commands:AddLabel(";whitelist/addwhitelist {player}" .. string.char(10) .. ";unwhitelist/removewhitelist {player}", true)
				Commands:AddDivider({ Text = "Server" })
				Commands:AddLabel(";rejoin/rj" .. string.char(10) .. ";join/joinjob/jobid {jobid}", true)
				Commands:AddDivider({ Text = "Utility" })
				Commands:AddLabel(";reset" .. string.char(10) .. ";fixcam", true)

				if rcsMyRank <= 3 then
					local Privileged = tbl17.Commands:AddRightGroupbox("Privileged", "shield")
					Privileged:AddLabel("Only works if the target is a Revenant user.", true)
					Privileged:AddDivider({ Text = "Movement" })
					Privileged:AddLabel(";bring {player,all}" .. string.char(10) .. ";anchor/unanchor {player,all}", true)
					Privileged:AddDivider({ Text = "Character" })
					Privileged:AddLabel(";kill {player,all}" .. string.char(10) .. ";char/changechar/setchar {player,all} {character}" .. string.char(10) .. ";bemystand/stopbeingmystand {player,all}", true)
					Privileged:AddDivider({ Text = "Chat" })
					Privileged:AddLabel(";say {player,all} {message}" .. string.char(10) .. ";notify {player,all} {message}", true)
					Privileged:AddDivider({ Text = "Troll" })
					Privileged:AddLabel(";sonic {player,all}" .. string.char(10) .. ";monochrome {player,all}" .. string.char(10) .. ";jumpscare {player,all,others}" .. string.char(10) .. ";yowtf {player,all}", true)
					Privileged:AddDivider({ Text = "Moderation" })
					Privileged:AddLabel(";kick {player,all} {reason}" .. string.char(10) .. ";unload {player,all}" .. (rcsMyRank == 1 and string.char(10) .. ";ban {player,all}" or ""), true)
					Privileged:AddDivider({ Text = "Info" })
					Privileged:AddLabel(";listrevenantusers/listrev", true)
				end

				if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
					Commands:AddDivider({ Text = "Mobile" })
					Commands:AddLabel("if youre a mobile user and want to use commands turn on \"use commands in chat\" and type \";(command that you wish)\" so you can use the command bar", true)
				end
			end

			task.spawn(function()
				local robloxGui

				if get_hidden_gui or gethui then
					robloxGui = (get_hidden_gui or gethui)()
				elseif game:GetService("CoreGui"):FindFirstChild("RobloxGui") then
					robloxGui = game:GetService("CoreGui").RobloxGui
				else
					robloxGui = game:GetService("CoreGui")
				end

				local screenGui2 = Instance.new("ScreenGui")
				screenGui2.Enabled = false
				screenGui2.ResetOnSpawn = false
				screenGui2.DisplayOrder = 100000

				pcall(function()
					screenGui2.Parent = robloxGui
				end)

				local frame = Instance.new("Frame", screenGui2)
				frame.BackgroundColor3 = Color3.new(0, 0, 0)
				frame.BorderColor3 = Color3.new(0, 0, 0)
				frame.Size = UDim2.new(1, -4, 0, 20)
				frame.ZIndex = 5
				local frame2 = Instance.new("Frame", frame)
				frame2.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
				frame2.BorderColor3 = Color3.fromRGB(50, 50, 50)
				frame2.BorderMode = Enum.BorderMode.Inset
				frame2.Size = UDim2.new(1, 0, 1, 0)
				frame2.ZIndex = 6
				local uiGradient = Instance.new("UIGradient", frame2)
				local new = ColorSequenceKeypoint.new
				local color = Color3.fromRGB
				uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), new(1, color(212, 212, 212)) })
				uiGradient.Rotation = 90
				local frame3 = Instance.new("Frame", frame2)
				frame3.BackgroundTransparency = 1
				frame3.ClipsDescendants = true
				frame3.Position = UDim2.new(0, 5, 0, 0)
				frame3.Size = UDim2.new(1, -5, 1, 0)
				frame3.ZIndex = 7
				local textLabel2 = Instance.new("TextLabel", frame3)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.fromOffset(0, 0)
				textLabel2.Size = UDim2.fromScale(5, 1)
				textLabel2.Font = Enum.Font.Code
				textLabel2.Text = ""
				textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel2.TextTransparency = 0.5
				textLabel2.TextSize = 14
				textLabel2.TextStrokeTransparency = 0.7
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.ZIndex = 7
				local textBox = Instance.new("TextBox", frame3)
				textBox.BackgroundTransparency = 1
				textBox.Position = UDim2.fromOffset(0, 0)
				textBox.Size = UDim2.fromScale(5, 1)
				textBox.Font = Enum.Font.Code
				textBox.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
				textBox.PlaceholderText = ""
				textBox.Text = ""
				textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				textBox.TextSize = 14
				textBox.TextStrokeTransparency = 0
				textBox.TextXAlignment = Enum.TextXAlignment.Left
				textBox.ClearTextOnFocus = true
				textBox.ZIndex = 8

				textBox:GetPropertyChangedSignal("Text"):Connect(function()
					if textBox.Text:match("^%s*$") then
						textLabel2.Text = ""
					else
						local parts = textBox.Text:split(" ")
						local str9 = parts[1] and parts[1]:lower() or ""
						local v43 = parts[2]
						textLabel2.Text = ""

						local function fn63(arg)
							if not arg then
								return nil
							end

							for _, v44 in pairs(tbl13) do
								local player = v44.player

								if player and player.Parent and player ~= localPlayer3 then
									local str10 = arg:lower()
									if player.Name:lower():find("^" .. str10) or player.DisplayName:lower():find("^" .. str10) then
										return player
									end
								end
							end

							return nil
						end

						local tbl30 = {
							bring = true,
							kill = true,
							anchor = true,
							unanchor = true,
							sonic = true,
							kick = true,
							unload = true,
							say = true,
							notify = true,
							listrevenantusers = true,
							listrev = true,
						}

						local tbl31 = { all = true, others = true, random = true }

						if str9 ~= "" then
							for k in pairs(tbl28) do
								if k:find("^" .. str9) then
									local flag18 = v43 and not tbl31[v43:lower()]
									local v44 = nil

									if flag18 then
										if tbl30[k] then
											v44 = fn63(v43)
										else
											v44 = fn61(v43)
										end
									end

									if v44 then
										textLabel2.Text = textBox.Text .. (k .. " " .. v44.DisplayName):sub(#textBox.Text + 1)
									else
										textLabel2.Text = textBox.Text .. k:sub(#str9 + 1)
									end

									return
								end
							end

							for k in pairs(tbl29) do
								if k:find("^" .. str9) then
									local flag18 = v43 and not tbl31[v43:lower()]
									local v44 = nil

									if flag18 then
										if tbl30[k] then
											v44 = fn63(v43)
										else
											v44 = fn61(v43)
										end
									end

									if v44 then
										textLabel2.Text = textBox.Text .. (k .. " " .. v44.DisplayName):sub(#textBox.Text + 1)
									else
										textLabel2.Text = textBox.Text .. k:sub(#str9 + 1)
									end

									return
								end
							end
						end
					end
				end)

				textBox.FocusLost:Connect(function(enterPressed)
					if enterPressed and toggles.CommandBar.Value and not textBox.Text:match("^%s*$") then
						textLabel2.Text = ""
						local text = textBox.Text
						local parts = text:split(" ")

						if parts then
							local str9 = parts[1] and parts[1]:lower()

							if str9 and (tbl28[str9] or tbl29[str9]) then
								table.remove(parts, 1)
								task.spawn(revRunCmd, str9, parts)

								if toggles.SendCommandInChat.Value then
									if tbl28[str9] or tbl29[str9] then
										flag17 = true

										pcall(function()
											local rbxGeneral = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")

											if rbxGeneral then
												rbxGeneral:SendAsync(";" .. text)
											end
										end)
									end
								end
							end
						end
					end

					screenGui2.Enabled = false
				end)

				UserInputService.InputBegan:Connect(function(input)
					local value = options.CommandBind and options.CommandBind.Value
					if type(value) ~= "string" or value == "" then
						return
					end
					local v43 = nil

					pcall(function()
						v43 = Enum.KeyCode[value]
					end)

					if not v43 then
						return
					end

					if not UserInputService:GetFocusedTextBox() and input.KeyCode == v43 and toggles.CommandBar.Value then
						screenGui2.Enabled = true
						textBox:CaptureFocus()

						task.spawn(function()
							while true do
								textBox.Text = ""
								textLabel2.Text = ""
								RunService.RenderStepped:Wait()
								if not (textBox.Text == "" and textLabel2.Text == "") then
									continue
								end
								break
							end
						end)
					end
				end)

				local connection21 = nil

				local function fn63()
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					if not toggles.UseCommandsinChat.Value then
						return
					end

					connection21 = localPlayer3.Chatted:Connect(function(message)
						if flag17 then
							flag17 = false
							return
						end

						if message and message:find("^%s*;") then
							local parts = message:sub(message:find(";") + 1):split(" ")
							local str9 = parts[1] and parts[1]:lower() or ""

							if tbl28[str9] or tbl29[str9] then
								table.remove(parts, 1)
								task.spawn(revRunCmd, str9, parts)
							end
						end
					end)
				end

				toggles.UseCommandsinChat:OnChanged(function()
					fn63()
				end)

				fn63()

				table.insert(tbl24, function()
					if connection20 then
						connection20:Disconnect()
						connection20 = nil
					end

					pcall(function()
						screenGui2:Destroy()
					end)

					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					pcall(function()
						toggles.CommandBar:SetValue(false)
					end)

					pcall(function()
						toggles.UseCommandsinChat:SetValue(false)
					end)

					pcall(function()
						toggles.SendCommandInChat:SetValue(false)
					end)
				end)
			end)

			local function revenantCleanup()
				pcall(function()
					if getgenv()._standDeactivateFn then
						getgenv()._standDeactivateFn()
					end
				end)

				flag14 = false

				if connection12 then
					connection12:Disconnect()
					connection12 = nil
				end

				fn48()

				if connection5 then
					connection5:Disconnect()
					connection5 = nil
				end

				if connection6 then
					connection6:Disconnect()
					connection6 = nil
				end

				if connection7 then
					connection7:Disconnect()
					connection7 = nil
				end

				tPoseActive = false
				v41 = nil

				for _, v43 in pairs(tbl18) do
					if v43.Track then
						pcall(function()
							if v43.Track.IsPlaying then
								v43.Track:Stop()
							end
						end)

						pcall(function()
							v43.Track:Destroy()
						end)

						v43.Track = nil
					end

					if v43.IsActive ~= nil then
						v43.IsActive = false
					end
				end

				if v40 then
					pcall(function()
						v40:Stop()
					end)

					pcall(function()
						v40:Destroy()
					end)

					v40 = nil
				end

				flag12 = false
				SwitcherActive = false

				pcall(function()
					if connection9 then
						connection9:Disconnect()
						connection9 = nil
					end

					if connection10 then
						connection10:Disconnect()
						connection10 = nil
					end

					if connection11 then
						connection11:Disconnect()
						connection11 = nil
					end

					if part2 and part2.Parent then
						part2:Destroy()
						part2 = nil
					end

					if getgenv().FPDH then
						workspace.FallenPartsDestroyHeight = getgenv().FPDH
					end
				end)

				pcall(function()
					local character = localPlayer3.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character then
						workspace.CurrentCamera.CameraSubject = character
					end
				end)

				for _, v43 in ipairs(tbl24) do
					pcall(v43)
				end

				getgenv().InvisActive = false
				getgenv().FUCActive = false
				getgenv().TrashcanIsRunning = false
				getgenv().TrashcanAlreadyExecuted = false
				getgenv().TrashcanActiveHookSet = false
				getgenv().TrashcanDied = false
				getgenv().postTrashLoopActive = false
				getgenv().OldPos = nil
				getgenv().desync = nil
				getgenv().desync2 = nil
				getgenv()._revTPOverride = nil
				getgenv()._revRealCF = nil
				getgenv()._revRealCFt = nil
				getgenv()._revTSGen = (getgenv()._revTSGen or 0) + 1
				getgenv()._revJGGen = (getgenv()._revJGGen or 0) + 1
				getgenv().flingDesync = nil
				getgenv().FPDH = nil
				getgenv()._invisSavedTPose = nil
				getgenv().stopInvisibilityFn = nil
				getgenv()._revenantAntiFlingBuild = nil
				getgenv()._revenantTPMode = nil
				getgenv().morph = nil
				getgenv().Moveset_Settings = nil
				getgenv()._sgOrigSetDecal = nil
				getgenv()._revenantDashCooldown = false
				getgenv()._revenantDashCooldownUntil = nil
				getgenv()._revenantTechActive = false
				getgenv()._wcDashOnCooldown = false
				getgenv()._revenantTechFiring = false

				pcall(function()
					if connection14 then
						connection14:Disconnect()
						connection14 = nil
					end

					if connection15 then
						connection15:Disconnect()
						connection15 = nil
					end

					if connection16 then
						connection16:Disconnect()
						connection16 = nil
					end

					if connection17 then
						connection17:Disconnect()
						connection17 = nil
					end

					if _desyncCharConn then
						_desyncCharConn:Disconnect()
						_desyncCharConn = nil
					end

					if _antiMovesPlayerRemovingConn then
						_antiMovesPlayerRemovingConn:Disconnect()
						_antiMovesPlayerRemovingConn = nil
					end

					if _invisDesyncHeartbeatConn then
						_invisDesyncHeartbeatConn:Disconnect()
						_invisDesyncHeartbeatConn = nil
					end

					pcall(function()
						if InvisibleModel and InvisibleModel.Parent then
							InvisibleModel:Destroy()
						end
					end)

					getgenv().InvisHumanoid = nil
					getgenv().InvisPart30 = nil

					if _invisCharConn then
						_invisCharConn:Disconnect()
						_invisCharConn = nil
					end

					if _walkCharConn then
						_walkCharConn:Disconnect()
						_walkCharConn = nil
					end

					if connection18 then
						connection18:Disconnect()
						connection18 = nil
					end

					if connection19 then
						connection19:Disconnect()
						connection19 = nil
					end

					if _fucCharConn then
						_fucCharConn:Disconnect()
						_fucCharConn = nil
					end

					if _fucRenderConn then
						_fucRenderConn:Disconnect()
						_fucRenderConn = nil
					end

					if connection8 then
						connection8:Disconnect()
						connection8 = nil
					end

					if tbl21.stepConn then
						tbl21.stepConn:Disconnect()
						tbl21.stepConn = nil
					end

					if tbl21.repConn then
						tbl21.repConn:Disconnect()
						tbl21.repConn = nil
					end

					if connection13 then
						connection13:Disconnect()
						connection13 = nil
					end

					pcall(function()
						local repDual = getgenv()._repDual
						repDual.relConn:Disconnect()
						repDual.backConn:Disconnect()
						RunService:UnbindFromRenderStep("RevRepRel")

						if repDual.worldCF and repDual.relRoot.Parent then
							repDual.relRoot.CFrame = repDual.worldCF
						end

						repDual.worldCF = nil

						if repDual.shp then
							sethiddenproperty = repDual.shp
						end
					end)

					if flag13 then
						flag13 = false
						local character = localPlayer3.Character
						local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart2 and sethiddenproperty then
							pcall(sethiddenproperty, humanoidRootPart2, "PhysicsRepRootPart", nil)
						end

						if tbl21.target and tbl21.target.Parent then
							pcall(function()
								sethiddenproperty(tbl21.target, "PhysicsRepRootPart", nil)
							end)

							pcall(function()
								tbl21.target.AssemblyLinearVelocity = Vector3.zero
							end)

							pcall(function()
								tbl21.target.AssemblyAngularVelocity = Vector3.zero
							end)
						end

						tbl21.target = nil
						tbl21.player = nil
					end
				end)

				v24:Unload()
				pcall(fn34, "discon")
				getgenv().RevenantLoaded = false
				getgenv().RevenantCleanup = nil
			end

			Menu:AddButton({
				Text = "Unload Script",
				Func = function()
					v31:AddDialog("RevenantUnloadConfirm", {
						Title = "Unload Script",
						Description = "Are you sure you want to unload Revenant? All active features will be disabled and the script will be terminated.",
						AutoDismiss = true,
						OutsideClickDismiss = true,
						FooterButtons = {
							Cancel = {
								Title = "Cancel",
								Variant = "Ghost",
								Order = 1,
								Callback = function()
								end,
							},
							Unload = {
								Title = "Unload",
								Variant = "Destructive",
								Order = 2,
								Callback = function()
									task.defer(revenantCleanup)
								end,
							},
						},
					})
				end,
			})

			getgenv().RevenantCleanup = revenantCleanup
			v25:SetLibrary(v24)
			v26:SetLibrary(v24)

			if not (localPlayer3.DisplayName ~= "" and localPlayer3.DisplayName) then
			end

			v26:IgnoreThemeSettings()
			v25:SetFolder("Revenant")
			v26:SetFolder("Revenant/TSB/configs")
			v26:BuildConfigSection(tbl17.Settings)
			v25:ApplyToTab(tbl17.Settings)
			local now2 = os.clock()

			while not getgenv()._RevenantFeaturesReady and os.clock() - now2 < 10 do
				task.wait()
			end

			pcall(function()
				v26:LoadAutoloadConfig()
			end)

			pcall(function()
				v24:Notify({ Title = fn39("Revenant"), Content = "Script loaded successfully!", Time = 4 })
			end)

			getgenv()._RevenantDoneLoading = true

			if fn37 then
				task.spawn(fn37)
			end

			do
				local connection21 = nil

				local function fn63()
					local character = localPlayer3.Character

					if character and character.Parent then
						local communicate = character:FindFirstChild("Communicate")

						if communicate then
							pcall(function()
								communicate:FireServer({ Goal = "Emote Spin" })
							end)
						end
					end
				end

				local function fn64()
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					connection21 = localPlayer3:GetAttributeChangedSignal("TotalKillsFrb"):Connect(function()
						fn63()
					end)
				end

				fn64()

				task.spawn(function()
					(localPlayer3.Character or localPlayer3.CharacterAdded:Wait()):WaitForChild("Communicate", 10)
					fn63()
				end)

				localPlayer3.CharacterAdded:Connect(function()
					task.wait(1)
					fn64()
				end)

				table.insert(tbl24, function()
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end
				end)
			end

			do
				local v43 = nil
				local v44 = nil

				local connection21 = RunService.RenderStepped:Connect(function()
					if v24.Unloaded then
						return
					end

					if not toggles.TogHandOffset or not toggles.TogHandOffset.Value then
						return
					end
					local character = localPlayer3.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if not humanoid then
						return
					end
					local animator = humanoid:FindFirstChildOfClass("Animator")
					if not animator then
						return
					end

					if v44 ~= humanoid then
						if v43 then
							pcall(function()
								if v43.IsPlaying then
									v43:Stop()
								end
							end)

							v43 = nil
						end

						v44 = humanoid
					end

					if not v43 or v43.Parent == nil then
						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://131081420344204"
						v43 = animator:LoadAnimation(animation)
						v43.Priority = Enum.AnimationPriority.Action4
					end

					v43:Play()
					v43.TimePosition = 0.7
					v43:AdjustSpeed(0)
					v43:AdjustWeight(2e9)
					RunService.RenderStepped:Wait()

					if v43 and v43.IsPlaying then
						pcall(function()
							v43:Stop()
						end)
					end
				end)

				table.insert(tbl24, function()
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					if v43 and v43.IsPlaying then
						pcall(function()
							v43:Stop()
						end)
					end

					v43 = nil

					pcall(function()
						if toggles.TogHandOffset then
							toggles.TogHandOffset:SetValue(false)
						end
					end)
				end)
			end

			local function fn63(arg)
				local flag18 = false
				local connection21 = nil
				local v43 = nil
				local connection22 = nil
				local connection23 = nil

				local function fn64(arg2)
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					v43 = arg2
					if not arg2 then
						return
					end

					connection21 = arg2.AnimationPlayed:Connect(function(arg3)
						local animationId = arg3.Animation and arg3.Animation.AnimationId or ""
						if not getgenv().InvisActive then
							return
						end

						if arg.mechGuard and getgenv().MechInvisHandled then
							pcall(function()
								arg3:Stop()
							end)

							return
						end

						if not animationId:find(arg.animId, 1, true) then
							return
						end

						if not flag18 then
							flag18 = true

							if arg.onFire then
								pcall(arg.onFire)
							end

							task.spawn(function()
								local character = localPlayer3.Character
								if not (character and character:FindFirstChild("HumanoidRootPart")) then
									flag18 = false
									return
								end

								if arg.guardCheck and not arg.guardCheck(character) then
									flag18 = false
									return
								end
								local cFrame2 = nil

								if connection22 then
									connection22:Disconnect()
									connection22 = nil
								end

								connection22 = RunService.RenderStepped:Connect(function()
									if v24.Unloaded or not arg3.IsPlaying then
										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end

										return
									end

									if cFrame2 then
										return
									end
									local length = arg3.Length

									if length > 0 and length - arg3.TimePosition <= 1.5 then
										local character2 = localPlayer3.Character
										character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

										if character2 then
											cFrame2 = character2.CFrame
										end

										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end
									end
								end)

								arg3.Stopped:Wait()

								if connection22 then
									connection22:Disconnect()
									connection22 = nil
								end

								if not cFrame2 then
									local character2 = localPlayer3.Character
									character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
									cFrame2 = character2 and character2.CFrame
								end

								if cFrame2 then
									local n15 = 0

									if connection23 then
										connection23:Disconnect()
										connection23 = nil
									end

									connection23 = RunService.Heartbeat:Connect(function(deltaTime)
										if v24.Unloaded then
											if connection23 then
												connection23:Disconnect()
												connection23 = nil
											end

											flag18 = false
											return
										end

										local character2 = localPlayer3.Character
										local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

										if not humanoidRootPart2 then
											if connection23 then
												connection23:Disconnect()
												connection23 = nil
											end

											flag18 = false
											return
										end

										pcall(function()
											humanoidRootPart2.CFrame = cFrame2
										end)

										n15 += deltaTime

										if n15 >= 0.4 then
											if connection23 then
												connection23:Disconnect()
												connection23 = nil
											end

											flag18 = false
										end
									end)
								else
									flag18 = false
								end
							end)
						end
					end)
				end

				local connection24 = RunService.Heartbeat:Connect(function()
					if v24.Unloaded then
						return
					end
					local character = localPlayer3.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character ~= v43 then
						fn64(character)
					end
				end)

				table.insert(tbl24, function()
					if connection22 then
						connection22:Disconnect()
						connection22 = nil
					end

					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					if connection24 then
						connection24:Disconnect()
						connection24 = nil
					end

					if connection23 then
						connection23:Disconnect()
						connection23 = nil
					end

					flag18 = false
					v43 = nil
				end)
			end

			fn63({ animId = "140153723843649", timeThreshold = 0.5, holdAfter = 0.4 })
			fn63({ animId = "77891041839483", timeThreshold = 1, holdAfter = 0.3 })
			fn63({ animId = "133207489574364", timeThreshold = 5, holdAfter = 0.2 })

			do
				local v43 = nil
				local connection21 = nil
				local connection22 = nil
				local connection23 = nil
				local connection24 = nil
				local v44 = nil
				local flag18 = false
				local cFrame2 = nil
				local connection25 = nil

				local function fn64(arg)
					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								if descendant.Transparency == 0 then
									descendant.Transparency = 0.5
									descendant.LocalTransparencyModifier = 0.5
									descendant.CastShadow = false
								end
							end)
						end
					end
				end

				local function fn65(arg)
					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								if descendant.Transparency == 0.5 then
									descendant.Transparency = 0
									descendant.LocalTransparencyModifier = 0
									descendant.CastShadow = true
								end
							end)
						end
					end
				end

				local function revenantStopMechTrack()
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					if v43 then
						pcall(function()
							v43:Stop()
						end)

						v43 = nil
					end

					getgenv()._mechInvisTrack = nil
				end

				getgenv()._revenantStopMechTrack = revenantStopMechTrack

				local function fn66()
					if connection25 then
						connection25:Disconnect()
						connection25 = nil
					end

					cFrame2 = nil
				end

				local function fn67(arg)
					return arg.PrimaryPart or arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChildWhichIsA("BasePart")
				end

				local function fn68(arg, arg2)
					local n15 = tick() + (arg2 or 5)

					while tick() < n15 do
						if not arg:IsDescendantOf(workspace) then
							return nil
						end
						local animationController = arg:FindFirstChildOfClass("AnimationController")

						if animationController then
							local animator = animationController:FindFirstChildOfClass("Animator")
							if animator then
								return animator
							end
						end

						task.wait(0.05)
					end

					return nil
				end

				local function fn69(arg)
					if not getgenv().InvisActive then
						getgenv().MechInvisHandled = false
						return
					end
					local v45 = fn68(arg, 5)
					if not v45 then
						getgenv().MechInvisHandled = false
						return
					end

					if not arg:IsDescendantOf(workspace) then
						getgenv().MechInvisHandled = false
						return
					end

					if not getgenv().InvisActive then
						getgenv().MechInvisHandled = false
						return
					end
					getgenv().MechInvisHandled = true
					revenantStopMechTrack()
					fn66()
					local v46 = fn67(arg)

					if v46 then
						cFrame2 = v46.CFrame
					end

					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://98093529031758"

					local ok, mechInvisTrack = pcall(function()
						return v45:LoadAnimation(animation)
					end)

					if not ok or not mechInvisTrack then
						getgenv().MechInvisHandled = false
						cFrame2 = nil
						return
					end

					v43 = mechInvisTrack
					mechInvisTrack.Priority = Enum.AnimationPriority.Action4

					pcall(function()
						mechInvisTrack:Play()
						mechInvisTrack.TimePosition = 0.01
					end)

					RunService.RenderStepped:Wait()

					pcall(function()
						mechInvisTrack:Stop()
					end)

					fn64(arg)
					local animationController = arg:FindFirstChildOfClass("AnimationController")

					if animationController then
						local connection26 = nil

						connection26 = animationController.AnimationPlayed:Connect(function(arg2)
							if not (arg2.Animation and arg2.Animation.AnimationId or ""):find("85662656113434", 1, true) then
								return
							end

							if connection26 then
								connection26:Disconnect()
								connection26 = nil
							end

							local connection27 = nil
							local flag19 = false

							connection27 = RunService.RenderStepped:Connect(function()
								if v24.Unloaded or not arg2.IsPlaying then
									if connection27 then
										connection27:Disconnect()
										connection27 = nil
									end

									return
								end

								if flag19 then
									return
								end
								local length = arg2.Length

								if length > 0 and length - arg2.TimePosition <= 1.5 then
									local v47 = fn67(arg)

									if v47 then
										cFrame2 = v47.CFrame
										flag19 = true
									end

									if connection27 then
										connection27:Disconnect()
										connection27 = nil
									end
								end
							end)

							arg2.Stopped:Wait()

							if connection27 then
								connection27:Disconnect()
								connection27 = nil
							end

							if not flag19 then
								local v47 = fn67(arg)

								if v47 then
									cFrame2 = v47.CFrame
								end
							end

							if cFrame2 then
								local v47 = cFrame2
								cFrame2 = nil
								local n15 = 0

								if connection25 then
									connection25:Disconnect()
									connection25 = nil
								end

								connection25 = RunService.Heartbeat:Connect(function(deltaTime)
									if v24.Unloaded then
										if connection25 then
											connection25:Disconnect()
											connection25 = nil
										end

										return
									end

									local v48 = fn67(arg)

									if not v48 then
										if connection25 then
											connection25:Disconnect()
											connection25 = nil
										end

										return
									end

									pcall(function()
										v48.CFrame = v47
									end)

									n15 += deltaTime

									if n15 >= 0.4 then
										if connection25 then
											connection25:Disconnect()
											connection25 = nil
										end
									end
								end)
							end
						end)
					end

					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					connection21 = RunService.Heartbeat:Connect(function()
						if v24.Unloaded or not getgenv().InvisActive or not arg:IsDescendantOf(workspace) then
							if connection21 then
								connection21:Disconnect()
								connection21 = nil
							end

							return
						end

						fn64(arg)
					end)

					getgenv()._mechInvisTrack = mechInvisTrack
				end

				local function fn70(arg)
					v44 = arg

					if connection24 then
						connection24:Disconnect()
						connection24 = nil
					end

					connection24 = arg.AncestryChanged:Connect(function()
						if not arg:IsDescendantOf(workspace) then
							v44 = nil
							getgenv().MechInvisHandled = false
							revenantStopMechTrack()
							fn66()

							if connection24 then
								connection24:Disconnect()
								connection24 = nil
							end
						end
					end)

					if getgenv().InvisActive then
						task.spawn(function()
							fn69(arg)
						end)
					end
				end

				local function fn71(arg)
					if connection22 then
						connection22:Disconnect()
						connection22 = nil
					end

					local mech = arg:FindFirstChild("Mech")

					if mech then
						task.spawn(function()
							fn70(mech)
						end)
					end

					connection22 = arg.ChildAdded:Connect(function(child)
						if child.Name == "Mech" then
							fn70(child)
						end
					end)
				end

				task.spawn(function()
					local live = workspace:FindFirstChild("Live") or workspace:WaitForChild("Live", 10)
					if not live then
						return
					end
					local v45 = live:FindFirstChild(localPlayer3.Name)

					if v45 then
						fn71(v45)
					end

					if connection23 then
						connection23:Disconnect()
						connection23 = nil
					end

					connection23 = live.ChildAdded:Connect(function(child)
						if child.Name == localPlayer3.Name then
							fn71(child)
						end
					end)
				end)

				local connection26 = RunService.Heartbeat:Connect(function()
					if v24.Unloaded then
						return
					end
					local flag19 = getgenv().InvisActive == true

					if flag19 and v44 and v44:IsDescendantOf(workspace) then
						if not v43 and not getgenv()._mechInvisSpawning then
							getgenv()._mechInvisSpawning = true

							task.spawn(function()
								fn69(v44)
								getgenv()._mechInvisSpawning = false
							end)
						end
					end

					if flag19 == flag18 then
						return
					end
					flag18 = flag19

					if not flag19 then
						getgenv().MechInvisHandled = false
						getgenv()._mechInvisSpawning = false

						if v44 then
							fn65(v44)
						end

						revenantStopMechTrack()

						if cFrame2 and v44 and v44:IsDescendantOf(workspace) then
							local v45 = cFrame2
							cFrame2 = nil
							local n15 = 0

							if connection25 then
								connection25:Disconnect()
								connection25 = nil
							end

							connection25 = RunService.Heartbeat:Connect(function(deltaTime)
								if v24.Unloaded then
									if connection25 then
										connection25:Disconnect()
										connection25 = nil
									end

									return
								end

								local v46 = v44
								local v47

								if v44 then
									v47 = fn67(v44)
								else
									v47 = v46
								end

								if not v47 then
									if connection25 then
										connection25:Disconnect()
										connection25 = nil
									end

									return
								end

								pcall(function()
									v47.CFrame = v45
								end)

								n15 += deltaTime

								if n15 >= 0.4 then
									if connection25 then
										connection25:Disconnect()
										connection25 = nil
									end
								end
							end)
						end

						return
					end

					if v44 then
						task.spawn(function()
							fn69(v44)
						end)
					end
				end)

				table.insert(tbl24, function()
					if connection26 then
						connection26:Disconnect()
						connection26 = nil
					end

					if connection22 then
						connection22:Disconnect()
						connection22 = nil
					end

					if connection23 then
						connection23:Disconnect()
						connection23 = nil
					end

					if connection24 then
						connection24:Disconnect()
						connection24 = nil
					end

					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					if connection25 then
						connection25:Disconnect()
						connection25 = nil
					end

					revenantStopMechTrack()

					if v44 and v44:IsDescendantOf(workspace) then
						pcall(fn65, v44)
					end

					getgenv().MechInvisHandled = false
					getgenv()._mechInvisSpawning = false
					getgenv()._revenantStopMechTrack = nil
					flag18 = false
					v44 = nil
					cFrame2 = nil
				end)
			end

			do
				local connection21 = nil
				local connection22 = nil
				local connection23 = nil
				local flag18 = false
				local v43 = nil

				local function fn64(arg)
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					v43 = arg
					if not arg then
						return
					end

					connection21 = arg.AnimationPlayed:Connect(function(arg2)
						local animationId = arg2.Animation and arg2.Animation.AnimationId or ""
						if not getgenv().InvisActive then
							return
						end

						if not animationId:find("85662656113434", 1, true) then
							return
						end

						if not flag18 then
							flag18 = true

							task.spawn(function()
								local character = localPlayer3.Character
								if not (character and character:FindFirstChild("HumanoidRootPart")) then
									flag18 = false
									return
								end
								local cFrame2 = nil

								if connection22 then
									connection22:Disconnect()
									connection22 = nil
								end

								connection22 = RunService.RenderStepped:Connect(function()
									if v24.Unloaded or not arg2.IsPlaying then
										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end

										return
									end

									if cFrame2 then
										return
									end
									local length = arg2.Length

									if length > 0 and length - arg2.TimePosition <= 1.5 then
										local character2 = localPlayer3.Character
										character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

										if character2 then
											cFrame2 = character2.CFrame
										end

										if connection22 then
											connection22:Disconnect()
											connection22 = nil
										end
									end
								end)

								arg2.Stopped:Wait()

								if connection22 then
									connection22:Disconnect()
									connection22 = nil
								end

								if not cFrame2 then
									local character2 = localPlayer3.Character
									character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
									cFrame2 = character2 and character2.CFrame
								end

								if cFrame2 then
									local n15 = 0

									if connection23 then
										connection23:Disconnect()
										connection23 = nil
									end

									connection23 = RunService.Heartbeat:Connect(function(deltaTime)
										if v24.Unloaded then
											if connection23 then
												connection23:Disconnect()
												connection23 = nil
											end

											flag18 = false
											return
										end

										local character2 = localPlayer3.Character
										local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

										if not humanoidRootPart2 then
											if connection23 then
												connection23:Disconnect()
												connection23 = nil
											end

											flag18 = false
											return
										end

										pcall(function()
											humanoidRootPart2.CFrame = cFrame2
										end)

										n15 += deltaTime

										if n15 >= 0.4 then
											if connection23 then
												connection23:Disconnect()
												connection23 = nil
											end

											flag18 = false
										end
									end)
								else
									flag18 = false
								end
							end)
						end
					end)
				end

				local connection24 = RunService.Heartbeat:Connect(function()
					if v24.Unloaded then
						return
					end
					local character = localPlayer3.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if character ~= v43 then
						fn64(character)
					end
				end)

				table.insert(tbl24, function()
					if connection22 then
						connection22:Disconnect()
						connection22 = nil
					end

					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end

					if connection24 then
						connection24:Disconnect()
						connection24 = nil
					end

					if connection23 then
						connection23:Disconnect()
						connection23 = nil
					end

					flag18 = false
					v43 = nil
				end)
			end

			pcall(function()
				if getconnections then
					for _, v43 in ipairs(getconnections(localPlayer3.Idled)) do
						pcall(function()
							v43:Disable()
						end)
					end
				end

				local VirtualInputManager = game:GetService("VirtualInputManager")

				local connection21 = localPlayer3.Idled:Connect(function()
					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F13, false, game)
					task.wait(0.05)
					VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F13, false, game)
				end)

				table.insert(tbl24, function()
					if connection21 then
						connection21:Disconnect()
						connection21 = nil
					end
				end)
			end)
		end, tostring)

		if not ok then
			warn("[Something is wrong with Revenant]: " .. tostring(result))
			print("[Revenant ERROR DETAIL]: " .. tostring(result))

			pcall(function()
				local bindableFunction = Instance.new("BindableFunction")
				bindableFunction.Parent = game:GetService("CoreGui")

				bindableFunction.OnInvoke = function(arg)
					if arg == "unload" then
						if getgenv().RevenantCleanup then
							pcall(getgenv().RevenantCleanup)
						else
							pcall(function()
								v24:Unload()
							end)
						end

						getgenv().RevenantLoaded = false

						pcall(function()
							setclipboard("https://discord.gg/TYdSMmQaF9")
						end)

						task.delay(0.1, function()
							pcall(function()
								game:GetService("StarterGui"):SetCore("SendNotification", {
									Title = "Revenant",
									Text = "Discord link copied to clipboard. Please report this issue.",
									Time = 6,
								})
							end)
						end)
					end
				end
			end)
		end
	end)