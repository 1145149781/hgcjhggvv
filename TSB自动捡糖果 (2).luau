local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local localPlayer = Players.LocalPlayer
local workspaceService = game:GetService("Workspace")

local moveSpeed = 200
local autoCandy = true
local autoDoor = true
local autoTrash = false

local LIFT_DELAY = 0.35
local THROW_DELAY = 0.15
local RESULT_DELAY = 1
local CAN_COOLDOWN = 1
local FAIL_COOLDOWN = 20
local CANDY_STABLE = 1.5
local DOOR_STABLE = 1
local SCAN_INTERVAL = 1
local ATTACK_INTERVAL = 0.35
local MONSTER_RANGE = 8
local MONSTER_TIMEOUT = 30

local phase = "idle"
local phaseList = {}
local phaseIndex = 0
local candyStableTimer = 0

local doorQueue = {}
local doorIndex = 0
local doorStage = ""
local doorTimer = 0
local doorAttempts = 0
local doorCutscene = false
local doorStableTimer = 0

local trashCans = {}
local trashStage = "idle"
local trashCan = nil
local trashAttempts = 0
local trashTimer = 0
local trashCooldown = 0
local failedCans = {}

local monster = nil
local lastMonsterSeen = 0
local lastAttack = 0
local lastScan = 0

local function getCharacter()
    local character = localPlayer.Character
    if not character then
        return nil
    end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    local comm = character:FindFirstChild("Communicate")
    if not humanoid or not root or not head or not comm or humanoid.Health <= 0 then
        return nil
    end
    return character, humanoid, root, head, comm
end

local function escapeHiding(root, humanoid)
    if root:GetAttribute("Hiding") or root:GetAttribute("HideInside") then
        for _, obj in ipairs(root.Parent:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and obj.Name == "Get Out" then
                local duration = obj.HoldDuration
                obj.HoldDuration = 0
                fireproximityprompt(obj)
                obj.HoldDuration = duration
                break
            end
        end
        root.Anchored = false
        root.Transparency = 0
        humanoid.WalkSpeed = moveSpeed
    elseif not root.Anchored and humanoid.WalkSpeed == 0 then
        humanoid.WalkSpeed = moveSpeed
    end
end

local function teleportTo(root, target, lookAt)
    if lookAt then
        root.CFrame = CFrame.new(target, lookAt)
    else
        root.CFrame = CFrame.new(target)
    end
end

local function findCandyTarget()
    local folder = workspaceService:FindFirstChild("HalloweenCandy")
    if not folder then
        return nil
    end
    for _, candy in ipairs(folder:GetChildren()) do
        if candy.Name == "Candy" then
            local rest = candy:GetAttribute("Rest")
            if rest then
                return rest.Position + Vector3.new(0, 3, 0)
            end
        end
    end
    return nil
end

local function buildDoorQueue()
    doorQueue = {}
    local trees = workspaceService:FindFirstChild("HalloweenDoorTrees")
    if not trees then
        return
    end
    for _, prompt in ipairs(trees:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") and prompt.Name == "TrickOrTreat" then
            table.insert(doorQueue, prompt)
        end
    end
end

local function advancePhase()
    candyStableTimer = 0
    doorStableTimer = 0
    doorStage = ""
    doorIndex = 0
    doorCutscene = false
    trashStage = "idle"
    trashCooldown = 0
    phaseIndex = phaseIndex + 1
    if phaseIndex > #phaseList then
        phaseIndex = 1
    end
    phase = phaseList[phaseIndex]
    if phase == "Door" then
        buildDoorQueue()
    elseif phase == "Trash" then
        lastScan = 0
    end
end

local function buildPhaseList()
    phaseList = {}
    if autoCandy then
        table.insert(phaseList, "Candy")
    end
    if autoDoor then
        table.insert(phaseList, "Door")
    end
    if autoTrash then
        table.insert(phaseList, "Trash")
    end
    phaseIndex = 0
    if #phaseList > 0 then
        advancePhase()
    else
        phase = "idle"
    end
end

local function collectCandyPhase(root, deltaTime)
    local target = findCandyTarget()
    if target then
        candyStableTimer = 0
        teleportTo(root, target)
        return
    end
    candyStableTimer = candyStableTimer + deltaTime
    if candyStableTimer >= CANDY_STABLE then
        advancePhase()
    end
end

local function processDoorPhase(character, humanoid, root, now, deltaTime)
    if doorStage == "" then
        if doorIndex >= #doorQueue then
            advancePhase()
            return
        end
        local prompt = doorQueue[doorIndex + 1]
        if not prompt or not prompt.Parent then
            doorIndex = doorIndex + 1
            return
        end
        local position = prompt.Parent.Position
        teleportTo(root, position + Vector3.new(0, 3, 0), position)
        doorStage = "fire"
        doorTimer = now + 0.4
        doorAttempts = 0
        doorCutscene = false
        doorStableTimer = 0
        return
    end

    if doorStage == "fire" then
        if now < doorTimer then
            return
        end
        local prompt = doorQueue[doorIndex + 1]
        if prompt and prompt.Parent then
            local duration = prompt.HoldDuration
            prompt.HoldDuration = 0
            pcall(fireproximityprompt, prompt)
            prompt.HoldDuration = duration
        end
        doorStage = "wait"
        doorTimer = now + 0.5
        doorStableTimer = 0
        return
    end

    if doorStage == "wait" then
        local prompt = doorQueue[doorIndex + 1]
        if not prompt or not prompt.Parent then
            doorIndex = doorIndex + 1
            doorStage = ""
            return
        end

        local open = prompt:GetAttribute("Open")
        local frozen = root.Anchored or humanoid.WalkSpeed == 0

        if frozen then
            doorCutscene = true
            doorStableTimer = 0
            return
        end

        if doorCutscene then
            doorStableTimer = doorStableTimer + deltaTime
            if doorStableTimer >= DOOR_STABLE then
                doorIndex = doorIndex + 1
                doorStage = ""
            end
            return
        end

        if open == false then
            doorIndex = doorIndex + 1
            doorStage = ""
            return
        end

        if now - doorTimer >= 2.5 then
            doorAttempts = doorAttempts + 1
            if doorAttempts >= 3 then
                doorIndex = doorIndex + 1
                doorStage = ""
            else
                teleportTo(root, prompt.Parent.Position + Vector3.new(0, 3, 0), prompt.Parent.Position)
                doorStage = "fire"
                doorTimer = now + 0.4
            end
        end
        return
    end
end

local function refreshTrashCans(now)
    if now - lastScan < SCAN_INTERVAL then
        return
    end
    lastScan = now
    trashCans = {}
    local map = workspaceService:FindFirstChild("Map")
    local trash = map and map:FindFirstChild("Trash")
    if trash then
        for _, obj in ipairs(trash:GetDescendants()) do
            if obj:IsA("MeshPart") and obj.Name == "Trashcan" then
                table.insert(trashCans, obj)
            end
        end
    end
    if monster == nil then
        monster = findMonster()
    end
end

local function canHeld(can)
    if not can.Parent then
        return false
    end
    if can.Anchored then
        return true
    end
    for _, obj in ipairs(can:GetChildren()) do
        if obj:IsA("Weld") or obj:IsA("WeldConstraint") or obj:IsA("Motor6D") then
            return true
        end
    end
    return false
end

local function clickCan(root, head, comm, can)
    comm:FireServer({
        MousePos = CFrame.lookAt(head.Position, can.Position),
        Goal = "LeftClick",
        Tick = 1,
    })
end

local function findMonster()
    local live = workspaceService:FindFirstChild("Live")
    if not live then
        return nil
    end
    for _, model in ipairs(live:GetChildren()) do
        if model:IsA("Model") and model:GetAttribute("TrashGuy") then
            local hp = model:GetAttribute("TrashGuyHP")
            if hp == nil or hp > 0 then
                return model
            end
        end
    end
    return nil
end

local function ensureSkillTool(character, humanoid)
    local tool = character:FindFirstChildOfClass("Tool")
    if tool then
        return tool
    end
    local backpack = localPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then
        return nil
    end
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item:GetAttribute("Skill") then
            humanoid:EquipTool(item)
            return character:FindFirstChildOfClass("Tool")
        end
    end
    return nil
end

local function updateMonster(character, humanoid, root, deltaTime, now)
    if not monster or not monster.Parent then
        monster = nil
        return false
    end
    local hp = monster:GetAttribute("TrashGuyHP")
    if hp ~= nil and hp <= 0 then
        monster = nil
        return false
    end
    if now - lastMonsterSeen > MONSTER_TIMEOUT then
        monster = nil
        return false
    end
    lastMonsterSeen = now

    local position = monster:GetPivot().Position
    if (position - root.Position).Magnitude > MONSTER_RANGE then
        teleportTo(root, position + Vector3.new(0, 3, 0))
    else
        root.CFrame = CFrame.lookAt(root.Position, Vector3.new(position.X, root.Position.Y, position.Z))
        if now - lastAttack >= ATTACK_INTERVAL then
            lastAttack = now
            local tool = ensureSkillTool(character, humanoid)
            if tool then
                tool:Activate()
            end
        end
    end
    return true
end

local function resetTrash()
    trashStage = "idle"
    trashCan = nil
    trashAttempts = 0
    trashCooldown = os.clock() + CAN_COOLDOWN
end

local function processTrashPhase(character, humanoid, root, head, comm, now)
    if trashStage == "idle" then
        if now < trashCooldown then
            return
        end
        local can
        for _, candidate in ipairs(trashCans) do
            if candidate.Parent and not candidate.Parent:GetAttribute("Broken") then
                local failedUntil = failedCans[candidate]
                if not failedUntil or now >= failedUntil then
                    can = candidate
                    break
                end
            end
        end
        if not can then
            advancePhase()
            return
        end
        trashCan = can
        trashAttempts = 1
        teleportTo(root, can.Position + Vector3.new(0, 2, 3))
        clickCan(root, head, comm, can)
        trashTimer = now + LIFT_DELAY
        trashStage = "lift"
        return
    end

    if now < trashTimer then
        return
    end

    local can = trashCan
    if not can or not can.Parent then
        resetTrash()
        return
    end

    if trashStage == "lift" then
        if canHeld(can) then
            keypress(70)
            trashTimer = now + THROW_DELAY
            trashStage = "throw"
        elseif trashAttempts < 2 then
            trashAttempts = trashAttempts + 1
            clickCan(root, head, comm, can)
            trashTimer = now + LIFT_DELAY
        else
            failedCans[can] = now + FAIL_COOLDOWN
            resetTrash()
        end
        return
    end

    if trashStage == "throw" then
        keyrelease(70)
        trashTimer = now + RESULT_DELAY
        trashStage = "result"
        return
    end

    if trashStage == "result" then
        monster = findMonster()
        resetTrash()
    end
end

RunService.Heartbeat:Connect(function(deltaTime)
    local character, humanoid, root, head, comm = getCharacter()
    if not character then
        return
    end

    local now = os.clock()
    escapeHiding(root, humanoid)
    refreshTrashCans(now)

    if monster and updateMonster(character, humanoid, root, deltaTime, now) then
        return
    end

    if phase == "Candy" then
        collectCandyPhase(root, deltaTime)
    elseif phase == "Door" then
        processDoorPhase(character, humanoid, root, now, deltaTime)
    elseif phase == "Trash" then
        processTrashPhase(character, humanoid, root, head, comm, now)
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "最强战斗场 万圣节糖果",
    LoadingTitle = "最强战斗场",
    LoadingSubtitle = "自动捡糖",
})

local Tab = Window:CreateTab("自动捡糖")

Tab:CreateToggle({
    Name = "自动捡糖",
    CurrentValue = true,
    Callback = function(value)
        autoCandy = value
        buildPhaseList()
    end,
})

Tab:CreateToggle({
    Name = "自动敲门",
    CurrentValue = true,
    Callback = function(value)
        autoDoor = value
        buildPhaseList()
    end,
})

Tab:CreateToggle({
    Name = "自动翻垃圾桶",
    CurrentValue = false,
    Callback = function(value)
        autoTrash = value
        buildPhaseList()
    end,
})

Tab:CreateSlider({
    Name = "移动速度",
    Range = {100, 300},
    Increment = 10,
    Suffix = "",
    CurrentValue = moveSpeed,
    Callback = function(value)
        moveSpeed = value
    end,
})

buildPhaseList()

localPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
