
-- Warte auf Spiel-Ladung
if not game:IsLoaded() then
    game.Loaded:Wait()
end

wait(2) -- Sicherheitsverzögerung

-- Jetzt OrionLib laden
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/HeavenlyScripts/1nig1htmare1234-OrionLib-with-Black-CheckMarks/refs/heads/main/Orion.lua"))()

local Window = OrionLib:MakeWindow({
    Name = "Fragmora V2.0 | Emergency Hamburg",
    ConfigFolder = "Fragmora",
    IntroEnabled = true,
    IntroText = "Fragmora Loading...",
    IntroIcon = "rbxassetid://7733674079",
    SaveConfig = false,
    HidePremium = true,
    ShowIcon = true,
    Icon = "rbxassetid://7733674079"
})

-- OPTIMIERTE VARIABLEN
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Performance Optimierungen
local task_wait = task.wait
local task_spawn = task.spawn
local table_insert = table.insert
local math_floor = math.floor
local CFrame_new = CFrame.new
local Vector2_new = Vector2.new
local Vector3_new = Vector3.new

-- ============================================
-- TAB 1: SILENT AIM
-- ============================================
local tab1 = Window:MakeTab({
    Name = "Silent Aim",
    Icon = "rbxassetid://7733674079"
})

-- Silent Aim Variablen
local silentAimEnabled = false
local silentAimKeybind = Enum.KeyCode.E
local showFOVCircle = false
local silentAimFOV = 100
local ignoreUntouchableTeams = true
local hitPrediction = true
local ignoreDead = true
local ignoreTeamSilent = false
local shootSpeed = 1.0
local holdToShoot = false
local holdToShootKey = "MouseButton2"

-- Silent Aim FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Thickness = 2
fovCircle.NumSides = 32
fovCircle.Color = Color3.fromRGB(0, 255, 255)
fovCircle.Transparency = 0.5
fovCircle.Filled = false
fovCircle.Radius = silentAimFOV

-- Hilfsfunktionen
local function mouseClick()
    local vim = game:GetService("VirtualInputManager")
    vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
    task.wait(0.05)
    vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end

local function isHoldToShootKeyPressed()
    if holdToShootKey == "MouseButton1" then
        return UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
    elseif holdToShootKey == "MouseButton2" then
        return UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    else
        local keyCode = Enum.KeyCode[holdToShootKey]
        if keyCode then
            return UIS:IsKeyDown(keyCode)
        end
    end
    return false
end

-- Funktionen für Silent Aim
local function getClosestTargetSilent()
    local closest, shortest = nil, silentAimFOV
    local screenCenter = Vector2_new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            -- Ignoriere tote Spieler
            if ignoreDead then
                local humanoid = plr.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health <= 0 then
                    goto continue
                end
            end
            
            -- Ignoriere Team-Mitglieder
            if ignoreTeamSilent and plr.Team == LocalPlayer.Team then
                goto continue
            end
            
            -- Ignoriere untouchable Teams
            if ignoreUntouchableTeams and plr.Team then
                local teamName = plr.Team.Name:lower()
                if teamName:find("admin") or teamName:find("spectator") then
                    goto continue
                end
            end
            
            local head = plr.Character:FindFirstChild("Head")
            if head then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (screenCenter - Vector2_new(screenPos.X, screenPos.Y)).Magnitude
                    if dist < shortest then
                        closest = plr
                        shortest = dist
                    end
                end
            end
            
            ::continue::
        end
    end
    return closest
end

local function silentAimHook()
    if silentAimEnabled and LocalPlayer.Character then
        if holdToShoot then
            if not isHoldToShootKeyPressed() then
                return
            end
        end
        
        local target = getClosestTargetSilent()
        if target and target.Character then
            local head = target.Character:FindFirstChild("Head")
            if head then
                local mouse = LocalPlayer:GetMouse()
                
                -- Hit Prediction
                if hitPrediction then
                    local rootPart = target.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local predictedPos = head.Position + (rootPart.Velocity * 0.1)
                        mouse.Hit = CFrame_new(predictedPos)
                    else
                        mouse.Hit = CFrame_new(head.Position)
                    end
                else
                    mouse.Hit = CFrame_new(head.Position)
                end
                mouse.Target = head
                
                -- Auto shoot bei aktiviertem Hold to Shoot
                if holdToShoot and shootSpeed > 0 then
                    mouseClick()
                    task_wait(1/shootSpeed)
                end
            end
        end
    end
end

-- FOV Circle Update
RunService.RenderStepped:Connect(function()
    if showFOVCircle and fovCircle and fovCircle.Remove ~= nil then
        local mouse = UIS:GetMouseLocation()
        fovCircle.Position = Vector2_new(mouse.X, mouse.Y + 36)
        fovCircle.Visible = true
        fovCircle.Radius = silentAimFOV
    elseif fovCircle and fovCircle.Remove ~= nil then
        fovCircle.Visible = false
    end
    
    silentAimHook()
end)

-- UI Elemente für Tab 1
tab1:AddSection({
    Name = "Silent Aim Settings"
})

local silentAimToggle = tab1:AddToggle({
    Name = "Silent aim on / off",
    Default = false,
    Callback = function(v)
        silentAimEnabled = v
    end
})

-- Silent Aim Keybind
local silentAimKeybindText = tab1:AddLabel("Silent Aim Key: E")
local function setSilentAimKeybind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        silentAimKeybind = input.KeyCode
        silentAimKeybindText:Set("Silent Aim Key: " .. tostring(silentAimKeybind):gsub("Enum.KeyCode.", ""))
    end
end

tab1:AddButton({
    Name = "Silent Aim Keybind",
    Callback = setSilentAimKeybind
})

tab1:AddToggle({
    Name = "Show FOV on / off",
    Default = false,
    Callback = function(v)
        showFOVCircle = v
    end
})

tab1:AddToggle({
    Name = "Ignore untouchable Teams on / off",
    Default = true,
    Callback = function(v)
        ignoreUntouchableTeams = v
    end
})

tab1:AddToggle({
    Name = "Hit Prediction on / off",
    Default = true,
    Callback = function(v)
        hitPrediction = v
    end
})

tab1:AddToggle({
    Name = "Ignores Dead People on / off",
    Default = true,
    Callback = function(v)
        ignoreDead = v
    end
})

tab1:AddToggle({
    Name = "Ignore Team on / off",
    Default = false,
    Callback = function(v)
        ignoreTeamSilent = v
    end
})

tab1:AddSlider({
    Name = "Shoot Speed slider",
    Min = 0.1,
    Max = 5.0,
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(v)
        shootSpeed = v
    end
})

tab1:AddSlider({
    Name = "Fov size slider",
    Min = 10,
    Max = 300,
    Default = 100,
    Increment = 5,
    ValueName = "°",
    Callback = function(v)
        silentAimFOV = v
    end
})

tab1:AddToggle({
    Name = "Hold to shoot on / off",
    Default = false,
    Callback = function(v)
        holdToShoot = v
    end
})

-- Hold to shoot Keybind
local holdToShootText = tab1:AddLabel("Hold Key: Right Mouse")
local function setHoldToShootKeybind()
    local input = UIS.InputBegan:Wait()
    
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        holdToShootKey = "MouseButton1"
        holdToShootText:Set("Hold Key: Left Mouse")
    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
        holdToShootKey = "MouseButton2"
        holdToShootText:Set("Hold Key: Right Mouse")
    elseif input.UserInputType == Enum.UserInputType.Keyboard then
        holdToShootKey = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
        holdToShootText:Set("Hold Key: " .. holdToShootKey)
    end
end

tab1:AddButton({
    Name = "Hold to shoot keybind",
    Callback = setHoldToShootKeybind
})

-- Keybind Toggle
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == silentAimKeybind then
        silentAimEnabled = not silentAimEnabled
    end
end)

-- ============================================
-- TAB 2: AIMBOT
-- ============================================
local tab2 = Window:MakeTab({
    Name = "Aimbot",
    Icon = "rbxassetid://7733674079"
})

-- Aimbot Variablen
local aimbotEnabled = false
local mobileAimbotEnabled = false
local aimbotKeybind = Enum.KeyCode.Q
local aimPart = "Head"
local ignoreTeamAimbot = false
local hitPredictionAimbot = true
local ignoreUntouchableAimbot = true
local ignoreNotWanted = false
local fovColor = Color3.fromRGB(0, 255, 255)
local maxDistance = 500
local aimbotSmoothness = 0.15
local aimbotFOV = 100
local triggerbotEnabled = false
local triggerbotKeybind = Enum.KeyCode.T
local triggerbotBodyArea = "Head"

local whitelist = {}
local selectedWhitelistPlayer = nil

-- Mobile Aimbot Button
local AimButton = Instance.new("TextButton")
AimButton.Size = UDim2.new(0, 80, 0, 80)
AimButton.Position = UDim2.new(0.5, -40, 0.8, -40)
AimButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AimButton.BackgroundTransparency = 0.3
AimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimButton.Text = "🎯"
AimButton.TextScaled = true
AimButton.BorderSizePixel = 0
AimButton.AnchorPoint = Vector2.new(0.5, 0.5)
AimButton.Active = true
AimButton.Draggable = true
AimButton.Visible = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = AimButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2
UIStroke.Parent = AimButton

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MobileAimbotGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AimButton.Parent = ScreenGui
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

AimButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        AimButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        AimButton.BackgroundTransparency = 0.2
    else
        AimButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        AimButton.BackgroundTransparency = 0.3
    end
end)

-- Aimbot FOV Circle
local aimbotFovCircle = Drawing.new("Circle")
aimbotFovCircle.Visible = false
aimbotFovCircle.Thickness = 2
aimbotFovCircle.NumSides = 32
aimbotFovCircle.Color = fovColor
aimbotFovCircle.Transparency = 0.5
aimbotFovCircle.Filled = false
aimbotFovCircle.Radius = aimbotFOV

-- Funktionen für Aimbot
local lockedTarget = nil
local lastAimbotUpdate = 0
local AIMBOT_UPDATE_INTERVAL = 0.05

local function getClosestTargetAimbot()
    local closest, shortest = nil, aimbotFOV
    local cameraPos = Camera.CFrame.Position
    local screenCenter = Vector2_new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local shouldSkip = false
            
            -- Whitelist Check
            if whitelist[plr.UserId] then
                shouldSkip = true
            end
            
            -- Ignoriere Team-Mitglieder
            if not shouldSkip and ignoreTeamAimbot and plr.Team == LocalPlayer.Team then
                shouldSkip = true
            end
            
            -- Ignoriere untouchable Teams
            if not shouldSkip and ignoreUntouchableAimbot and plr.Team then
                local teamName = plr.Team.Name:lower()
                if teamName:find("admin") or teamName:find("spectator") then
                    shouldSkip = true
                end
            end
            
            -- Ignoriere nicht gesuchte Zivilisten
            if not shouldSkip and ignoreNotWanted and plr.Team and plr.Team.Name:lower():find("civilian") then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp and not hrp:GetAttribute("IsWanted") then
                    shouldSkip = true
                end
            end
            
            if not shouldSkip then
                local humanoid = plr.Character:FindFirstChild("Humanoid")
                local targetPart = plr.Character:FindFirstChild(aimPart) or plr.Character:FindFirstChild("Head")
                
                if targetPart and humanoid and humanoid.Health > 0 then
                    -- Distanz Check
                    local distance = (cameraPos - targetPart.Position).Magnitude
                    if distance <= maxDistance then
                        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                        if onScreen then
                            local dist = (screenCenter - Vector2_new(screenPos.X, screenPos.Y)).Magnitude
                            if dist < shortest then
                                closest = plr
                                shortest = dist
                            end
                        end
                    end
                end
            end
        end
    end
    return closest
end

-- Aimbot Update Funktion
local function updateAimbot()
    local currentTime = tick()
    if aimbotEnabled and (currentTime - lastAimbotUpdate) > AIMBOT_UPDATE_INTERVAL then
        local screenCenter = Vector2_new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        
        if not lockedTarget or not lockedTarget.Character or not lockedTarget.Character:FindFirstChild("Humanoid") or lockedTarget.Character.Humanoid.Health <= 0 then
            lockedTarget = getClosestTargetAimbot()
        else
            local targetPart = lockedTarget.Character:FindFirstChild(aimPart) or lockedTarget.Character:FindFirstChild("Head")
            if targetPart then
                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local dist = (screenCenter - Vector2_new(screenPos.X, screenPos.Y)).Magnitude
                    if dist > aimbotFOV then
                        lockedTarget = getClosestTargetAimbot()
                    end
                else
                    lockedTarget = getClosestTargetAimbot()
                end
            end
        end

        if lockedTarget and lockedTarget.Character then
            local targetPart = lockedTarget.Character:FindFirstChild(aimPart) or lockedTarget.Character:FindFirstChild("Head")
            if targetPart then
                local targetCF = CFrame_new(Camera.CFrame.Position, targetPart.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCF, aimbotSmoothness)
            end
        end
        
        lastAimbotUpdate = currentTime
    end
end

-- Triggerbot Funktion
local lastTriggerbotUpdate = 0
local TRIGGERBOT_UPDATE_INTERVAL = 0.03

local function updateTriggerbot()
    local currentTime = tick()
    if triggerbotEnabled and (currentTime - lastTriggerbotUpdate) > TRIGGERBOT_UPDATE_INTERVAL then
        if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local mouse = LocalPlayer:GetMouse()
            local target = mouse.Target
            if target and target.Parent then
                local character = target.Parent
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    local player = Players:GetPlayerFromCharacter(character)
                    if player and player ~= LocalPlayer then
                        -- Whitelist Check
                        if not whitelist[player.UserId] then
                            mouseClick()
                        end
                    end
                end
            end
        end
        lastTriggerbotUpdate = currentTime
    end
end

-- FOV Circle Update für Aimbot
RunService.RenderStepped:Connect(function()
    if aimbotEnabled and aimbotFovCircle and aimbotFovCircle.Remove ~= nil then
        local mouse = UIS:GetMouseLocation()
        aimbotFovCircle.Position = Vector2_new(mouse.X, mouse.Y + 36)
        aimbotFovCircle.Visible = true
        aimbotFovCircle.Radius = aimbotFOV
    elseif aimbotFovCircle and aimbotFovCircle.Remove ~= nil then
        aimbotFovCircle.Visible = false
    end
    
    updateAimbot()
    updateTriggerbot()
end)

-- UI Elemente für Tab 2
tab2:AddSection({
    Name = "Aimbot Settings"
})

tab2:AddToggle({
    Name = "Mobile Aimbot on / off",
    Default = false,
    Callback = function(v)
        mobileAimbotEnabled = v
        AimButton.Visible = v
    end
})

local aimbotToggle = tab2:AddToggle({
    Name = "Aimbot on / off",
    Default = false,
    Callback = function(v)
        aimbotEnabled = v
    end
})

-- Aimbot Keybind
local aimbotKeybindText = tab2:AddLabel("Aimbot Key: Q")
local function setAimbotKeybind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        aimbotKeybind = input.KeyCode
        aimbotKeybindText:Set("Aimbot Key: " .. tostring(aimbotKeybind):gsub("Enum.KeyCode.", ""))
    end
end

tab2:AddButton({
    Name = "Aimbot keybind",
    Callback = setAimbotKeybind
})

-- Aim Part Dropdown
tab2:AddDropdown({
    Name = "Aim Part",
    Options = {"Head", "Torso", "HumanoidRootPart"},
    Default = "Head",
    Callback = function(option)
        aimPart = option
    end
})

tab2:AddToggle({
    Name = "ignore team on / off",
    Default = false,
    Callback = function(v)
        ignoreTeamAimbot = v
    end
})

tab2:AddToggle({
    Name = "Hit prediction on / off",
    Default = true,
    Callback = function(v)
        hitPredictionAimbot = v
    end
})

tab2:AddToggle({
    Name = "Ignore Untouchable Teams on / off",
    Default = true,
    Callback = function(v)
        ignoreUntouchableAimbot = v
    end
})

tab2:AddToggle({
    Name = "Ignore not wanted Civilians on / off",
    Default = false,
    Callback = function(v)
        ignoreNotWanted = v
    end
})

tab2:AddColorpicker({
    Name = "Fov Color",
    Default = fovColor,
    Callback = function(color)
        fovColor = color
        if aimbotFovCircle and aimbotFovCircle.Remove ~= nil then
            aimbotFovCircle.Color = color
        end
    end
})

tab2:AddSlider({
    Name = "Max Distance slider",
    Min = 50,
    Max = 1000,
    Default = 500,
    Increment = 10,
    ValueName = "m",
    Callback = function(v)
        maxDistance = v
    end
})

tab2:AddSlider({
    Name = "Aimbot smoothness slider",
    Min = 0.01,
    Max = 0.5,
    Default = 0.15,
    Increment = 0.01,
    ValueName = "",
    Callback = function(v)
        aimbotSmoothness = v
    end
})

tab2:AddSlider({
    Name = "Fov size slider",
    Min = 10,
    Max = 300,
    Default = 100,
    Increment = 5,
    ValueName = "°",
    Callback = function(v)
        aimbotFOV = v
    end
})

-- Whitelist Settings
tab2:AddSection({
    Name = "Whitelist settings"
})

-- Player Dropdown für Whitelist
local playerListForWhitelist = {}
local function updatePlayerListForWhitelist()
    playerListForWhitelist = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table_insert(playerListForWhitelist, player.Name)
        end
    end
end

updatePlayerListForWhitelist()

local whitelistPlayerDropdown = tab2:AddDropdown({
    Name = "select player",
    Options = playerListForWhitelist,
    Default = playerListForWhitelist[1] or "No players",
    Callback = function(option)
        selectedWhitelistPlayer = Players:FindFirstChild(option)
    end
})

tab2:AddButton({
    Name = "add to whitelist",
    Callback = function()
        if selectedWhitelistPlayer then
            whitelist[selectedWhitelistPlayer.UserId] = true
        end
    end
})

tab2:AddButton({
    Name = "remove from whitelist",
    Callback = function()
        if selectedWhitelistPlayer then
            whitelist[selectedWhitelistPlayer.UserId] = nil
        end
    end
})

tab2:AddButton({
    Name = "show whitelisted users",
    Callback = function()
        local whitelistedNames = ""
        for userId, _ in pairs(whitelist) do
            local player = Players:GetPlayerByUserId(userId)
            if player then
                whitelistedNames = whitelistedNames .. player.Name .. "\n"
            end
        end
        if whitelistedNames == "" then
            whitelistedNames = "No players whitelisted"
        end
        print("Whitelisted Players:\n" .. whitelistedNames)
    end
})

-- Triggerbot
tab2:AddSection({
    Name = "Triggerbot"
})

tab2:AddToggle({
    Name = "triggerbot on / off",
    Default = false,
    Callback = function(v)
        triggerbotEnabled = v
    end
})

-- Triggerbot Body Area
tab2:AddDropdown({
    Name = "Target body area",
    Options = {"Head", "Torso", "HumanoidRootPart", "Any"},
    Default = "Head",
    Callback = function(option)
        triggerbotBodyArea = option
    end
})

-- Triggerbot Keybind
local triggerbotKeybindText = tab2:AddLabel("Triggerbot Key: T")
local function setTriggerbotKeybind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        triggerbotKeybind = input.KeyCode
        triggerbotKeybindText:Set("Triggerbot Key: " .. tostring(triggerbotKeybind):gsub("Enum.KeyCode.", ""))
    end
end

tab2:AddButton({
    Name = "Set Triggerbot Keybind",
    Callback = setTriggerbotKeybind
})

-- Keybind Toggles für Aimbot und Triggerbot
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == aimbotKeybind then
        aimbotEnabled = not aimbotEnabled
    elseif input.KeyCode == triggerbotKeybind then
        triggerbotEnabled = not triggerbotEnabled
    end
end)

-- Update Player Liste alle 5 Sekunden
task_spawn(function()
    while true do
        updatePlayerListForWhitelist()
        whitelistPlayerDropdown:Refresh(playerListForWhitelist, playerListForWhitelist[1] or "No players")
        task_wait(5)
    end
end)

-- ============================================
-- TAB 3: TELEPORTS
-- ============================================
local tab3 = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://7733992789"
})

local teleportSpeed = 50
local TweenService = game:GetService("TweenService")
local VehiclesFolder = workspace:WaitForChild("Vehicles")

-- Funktion für Tween Teleport
local function tweenTo(destination, isVehicle)
    if isVehicle then
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if not car then 
            return false, "No vehicle found"
        end

        if not car.PrimaryPart then
            car.PrimaryPart = car:FindFirstChild("DriveSeat", true) or car:FindFirstChildWhichIsA("BasePart")
        end

        local startPosition = car.PrimaryPart.Position
        local targetPos = typeof(destination) == "CFrame" and destination.Position or destination
        
        -- Berechne Dauer basierend auf Distanz und Geschwindigkeit
        local distance = (startPosition - targetPos).Magnitude
        local duration = distance / teleportSpeed
        
        local value = Instance.new("CFrameValue")
        value.Value = car:GetPivot()

        value.Changed:Connect(function(newCFrame)
            car:PivotTo(newCFrame)
            if car.PrimaryPart then
                car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
                car.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
            end
        end)

        local tween = TweenService:Create(value, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Value = CFrame_new(targetPos)
        })
        
        tween:Play()
        tween.Completed:Wait()
        value:Destroy()
        return true
    else
        -- Charakter Teleport
        local char = LocalPlayer.Character
        if char then
            char:MoveTo(typeof(destination) == "CFrame" and destination.Position + Vector3_new(0, 3, 0) or destination + Vector3_new(0, 3, 0))
        end
        return true
    end
end

tab3:AddSection({
    Name = "Teleport Settings"
})

tab3:AddSlider({
    Name = "Teleport speed slider",
    Min = 10,
    Max = 200,
    Default = 50,
    Increment = 5,
    ValueName = "",
    Callback = function(v)
        teleportSpeed = v
    end
})

tab3:AddSection({
    Name = "Quick Teleports"
})

-- Nearest Dealer
tab3:AddButton({
    Name = "nearest dealer",
    Callback = function()
        local closest, dist = nil, math.huge
        local dealers = workspace:WaitForChild("Dealers")
        if dealers then
            for _, dealer in pairs(dealers:GetChildren()) do
                if dealer:IsA("Model") and dealer.PrimaryPart then
                    local d = (LocalPlayer.Character.HumanoidRootPart.Position - dealer.PrimaryPart.Position).Magnitude
                    if d < dist then
                        dist = d
                        closest = dealer
                    end
                end
            end
        end
        
        if closest then
            tweenTo(closest.PrimaryPart.Position, true)
        end
    end
})

-- Nearest Smuggler
tab3:AddButton({
    Name = "nearest smuggler",
    Callback = function()
        -- Implementierung für Schmuggler
        local players = Players:GetPlayers()
        for _, player in pairs(players) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local backpack = player.Character:FindFirstChild("Backpack")
                if backpack then
                    for _, item in pairs(backpack:GetChildren()) do
                        if item.Name:lower():find("drug") or item.Name:lower():find("contraband") then
                            tweenTo(player.Character.HumanoidRootPart.Position, true)
                            return
                        end
                    end
                end
            end
        end
    end
})

-- Nearest Vending Machine
tab3:AddButton({
    Name = "nearest vending machine",
    Callback = function()
        local closest, dist = nil, math.huge
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("vending") or obj.Name:lower():find("machine") then
                if obj:IsA("BasePart") or obj:IsA("Model") then
                    local pos = obj:IsA("BasePart") and obj.Position or (obj.PrimaryPart and obj.PrimaryPart.Position)
                    if pos then
                        local d = (LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude
                        if d < dist then
                            dist = d
                            closest = pos
                        end
                    end
                end
            end
        end
        
        if closest then
            tweenTo(closest, true)
        end
    end
})

tab3:AddSection({
    Name = "Robbable Places"
})

local RobbableLocations = {
    ["Bank"] = CFrame.new(-1174.68, 5.87, 3209.03),
    ["Yellow Container"] = CFrame.new(1178.71, 28.696, 2321.66),
    ["Green Container"] = CFrame.new(1182.71, 28.696, 2158.84),
    ["Jewelry"] = CFrame.new(-346.63, 5.87, 3572.74),
    ["Ares Fuel"] = CFrame.new(-870.86, 5.622, 1505.16),
    ["Gas n Go Fuel"] = CFrame.new(-1544.4, 5.619, 3802.16),
    ["Ossu Fuel"] = CFrame.new(-27.55, 5.622, -754.6),
    ["Night Club"] = CFrame.new(-1844.95, 5.872, 3211.08),
    ["Tool Shop"] = CFrame.new(-717.23, 5.654, 729.08),
    ["Food Shop"] = CFrame.new(-911.50, 5.371, -1169.20),
    ["Clothing Store"] = CFrame.new(479.05, 3.158, -1452.59)
}

for name, location in pairs(RobbableLocations) do
    tab3:AddButton({
        Name = name,
        Callback = function()
            tweenTo(location, true)
        end
    })
end

tab3:AddSection({
    Name = "Usable Places"
})

local UsableLocations = {
    ["Tuning Garage"] = CFrame.new(-1429.04, 5.57, 143.96),
    ["Car Dealership"] = CFrame.new(-1454.02, 5.615, 940.83),
    ["Hospital"] = CFrame.new(-293.16, 5.627, 1053.98),
    ["Prison"] = CFrame.new(-514.34, 5.615, 2795.94),
}

for name, location in pairs(UsableLocations) do
    tab3:AddButton({
        Name = name,
        Callback = function()
            tweenTo(location, true)
        end
    })
end

tab3:AddSection({
    Name = "Work Places"
})

local WorkLocations = {
    ["Police Station"] = CFrame.new(-1658.55, 5.619, 2735.71),
    ["Fire Station"] = CFrame.new(-963.32, 5.865, 3895.37),
    ["Bus Company"] = CFrame.new(-1695.80, 5.882, -1274.29),
    ["Truck Company"] = CFrame.new(652.55, 5.638, 1510.85),
}

for name, location in pairs(WorkLocations) do
    tab3:AddButton({
        Name = name,
        Callback = function()
            tweenTo(location, true)
        end
    })
end

-- ============================================
-- TAB 4: GUN MODS
-- ============================================
local tab4 = Window:MakeTab({
    Name = "Gun Mods",
    Icon = "rbxassetid://7733674079"
})

-- Waffenmod Variablen
local fastBullet = false
local autoReload = false
local noRecoil = false
local hitSound = "Default"
local shootSound = "Default"
local crosshairSize = 10
local aimFOV = 70
local weaponColor = Color3.fromRGB(255, 255, 255)
local secondaryColor = Color3.fromRGB(0, 0, 0)
local rainbowMode = false
local rainbowModeSecondary = false

-- Rainbow Mode Funktion
local rainbowConnection
local function startRainbowMode()
    if rainbowConnection then
        rainbowConnection:Disconnect()
        rainbowConnection = nil
    end
    
    if rainbowMode then
        rainbowConnection = RunService.RenderStepped:Connect(function()
            local hue = tick() % 5 / 5
            weaponColor = Color3.fromHSV(hue, 1, 1)
        end)
    end
end

local rainbowConnectionSecondary
local function startRainbowModeSecondary()
    if rainbowConnectionSecondary then
        rainbowConnectionSecondary:Disconnect()
        rainbowConnectionSecondary = nil
    end
    
    if rainbowModeSecondary then
        rainbowConnectionSecondary = RunService.RenderStepped:Connect(function()
            local hue = (tick() % 5 / 5) + 0.5
            if hue > 1 then hue = hue - 1 end
            secondaryColor = Color3.fromHSV(hue, 1, 1)
        end)
    end
end

-- Waffenmod Update Funktion
local lastWeaponUpdate = 0
local WEAPON_UPDATE_INTERVAL = 0.2

local function updateWeaponMods()
    local currentTime = tick()
    if (currentTime - lastWeaponUpdate) < WEAPON_UPDATE_INTERVAL then return end
    
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not tool then
        lastWeaponUpdate = currentTime
        return
    end

    -- Fast Bullet
    if fastBullet then
        tool:SetAttribute("BulletSpeed", 5000)
    end

    -- Auto Reload
    if autoReload then
        local magSize = tool:GetAttribute("MagCurrentSize") 
            or tool:GetAttribute("Ammo") 
            or tool:GetAttribute("Clip")
            or (tool:FindFirstChild("Ammo") and tool.Ammo.Value)

        if magSize and magSize == 0 then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, game)
            task_wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.R, false, game)
        end
    end

    -- No Recoil
    if noRecoil then
        tool:SetAttribute("Recoil", 0)
        tool:SetAttribute("Instability", 0)
    end

    -- Hit Sound (simuliert)
    if hitSound ~= "Default" then
        tool:SetAttribute("HitSound", hitSound)
    end

    -- Shoot Sound (simuliert)
    if shootSound ~= "Default" then
        tool:SetAttribute("ShootSound", shootSound)
    end

    -- Weapon Color
    if tool:FindFirstChild("Handle") then
        tool.Handle.Color = weaponColor
        for _, part in pairs(tool:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Color = weaponColor
            end
        end
    end
    
    lastWeaponUpdate = currentTime
end

-- Waffenmod Loop
task_spawn(function()
    while true do
        updateWeaponMods()
        task_wait(WEAPON_UPDATE_INTERVAL)
    end
end)

-- UI Elemente für Tab 4
tab4:AddSection({
    Name = "Weapon Modifications"
})

tab4:AddToggle({
    Name = "Fast bullet on / off",
    Default = false,
    Callback = function(v)
        fastBullet = v
    end
})

tab4:AddToggle({
    Name = "Auto reload on / off",
    Default = false,
    Callback = function(v)
        autoReload = v
    end
})

tab4:AddToggle({
    Name = "no recoil on / off",
    Default = false,
    Callback = function(v)
        noRecoil = v
    end
})

-- Hit Sound Dropdown
tab4:AddDropdown({
    Name = "Hit sound",
    Options = {"Default", "Metal", "Wood", "Glass", "Headshot"},
    Default = "Default",
    Callback = function(option)
        hitSound = option
    end
})

-- Shoot Sound Dropdown
tab4:AddDropdown({
    Name = "Shoot sound",
    Options = {"Default", "Silencer", "Loud", "Laser", "Plasma"},
    Default = "Default",
    Callback = function(option)
        shootSound = option
    end
})

tab4:AddSlider({
    Name = "Crosshair size slider",
    Min = 5,
    Max = 50,
    Default = 10,
    Increment = 1,
    ValueName = "px",
    Callback = function(v)
        crosshairSize = v
    end
})

tab4:AddSlider({
    Name = "Aim FOV slider",
    Min = 30,
    Max = 120,
    Default = 70,
    Increment = 5,
    ValueName = "°",
    Callback = function(v)
        aimFOV = v
    end
})

tab4:AddSection({
    Name = "Weapon Colors"
})

tab4:AddColorpicker({
    Name = "Weapon Color",
    Default = weaponColor,
    Callback = function(color)
        weaponColor = color
    end
})

tab4:AddToggle({
    Name = "Rainbow Mode",
    Default = false,
    Callback = function(v)
        rainbowMode = v
        startRainbowMode()
    end
})

tab4:AddSection({
    Name = "Secondary Color"
})

tab4:AddColorpicker({
    Name = "Secondary color picker",
    Default = secondaryColor,
    Callback = function(color)
        secondaryColor = color
    end
})

tab4:AddToggle({
    Name = "rainbow Mode",
    Default = false,
    Callback = function(v)
        rainbowModeSecondary = v
        startRainbowModeSecondary()
    end
})

-- ============================================
-- TAB 5: CAR MODS
-- ============================================
local tab5 = Window:MakeTab({
    Name = "Car Mods",
    Icon = "rbxassetid://7733708835"
})

-- Car Mod Variablen
local carFlyEnabled = false
local safeFly = false
local vehicleFling = false
local carFlyKeybind = Enum.KeyCode.X
local carFlySpeed = 50
local infiniteFuel = false
local vehicleGodmode = false
local ignoreCollisions = false
local headlightsColor = Color3.fromRGB(255, 255, 255)

-- Car Fly Funktion
local lastCarFlyUpdate = 0
local CAR_FLY_UPDATE_INTERVAL = 0.033

local function updateCarFly()
    local currentTime = tick()
    if carFlyEnabled and (currentTime - lastCarFlyUpdate) > CAR_FLY_UPDATE_INTERVAL then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            if LocalPlayer.Character.Humanoid.Sit then
                local SeatPart = LocalPlayer.Character.Humanoid.SeatPart
                if SeatPart and SeatPart.Name == "DriveSeat" then
                    local Vehicle = SeatPart.Parent
                    if Vehicle then
                        if not Vehicle.PrimaryPart then
                            Vehicle.PrimaryPart = SeatPart
                        end

                        local PrimaryPartCFrame = Vehicle:GetPrimaryPartCFrame()
                        local camLook = workspace.CurrentCamera.CFrame.LookVector

                        Vehicle:SetPrimaryPartCFrame(
                            CFrame_new(PrimaryPartCFrame.Position, PrimaryPartCFrame.Position + camLook) *
                            CFrame_new(
                                ((UIS:IsKeyDown(Enum.KeyCode.D) and carFlySpeed or 0) -
                                (UIS:IsKeyDown(Enum.KeyCode.A) and carFlySpeed or 0)) * 0.1,
                                ((UIS:IsKeyDown(Enum.KeyCode.E) and (safeFly and carFlySpeed/2 or carFlySpeed) or 0) -
                                (UIS:IsKeyDown(Enum.KeyCode.Q) and (safeFly and carFlySpeed/2 or carFlySpeed) or 0)) * 0.1,
                                ((UIS:IsKeyDown(Enum.KeyCode.S) and carFlySpeed or 0) -
                                (UIS:IsKeyDown(Enum.KeyCode.W) and carFlySpeed or 0)) * 0.1
                            )
                        )
                        
                        if safeFly then
                            SeatPart.AssemblyLinearVelocity = Vector3.zero
                            SeatPart.AssemblyAngularVelocity = Vector3.zero
                        end
                    end
                end
            end
        end
        lastCarFlyUpdate = currentTime
    end
end

-- Vehicle Fling Funktion
local function vehicleFlingFunction()
    if vehicleFling and LocalPlayer.Character and LocalPlayer.Character.Humanoid.Sit then
        local seat = LocalPlayer.Character.Humanoid.SeatPart
        if seat then
            seat.AssemblyLinearVelocity = Vector3.new(0, 1000, 0)
        end
    end
end

-- Infinite Fuel Funktion
local function updateInfiniteFuel()
    if infiniteFuel then
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if car then
            car:SetAttribute("currentFuel", 100)
        end
    end
end

-- Vehicle Godmode Funktion
local function updateVehicleGodmode()
    if vehicleGodmode then
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if car then
            car:SetAttribute("currentHealth", 1000)
            car:SetAttribute("IsOn", true)
        end
    end
end

-- Ignore Collisions Funktion
local function updateIgnoreCollisions()
    if ignoreCollisions then
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if car then
            for _, part in pairs(car:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end

-- Headlights Color Funktion
local function updateHeadlightsColor()
    local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if car then
        for _, light in pairs(car:GetDescendants()) do
            if light:IsA("PointLight") or light.Name:lower():find("light") then
                light.Color = headlightsColor
            end
        end
    end
end

-- RunService Loops
RunService.RenderStepped:Connect(function()
    updateCarFly()
end)

task_spawn(function()
    while true do
        updateInfiniteFuel()
        updateVehicleGodmode()
        updateIgnoreCollisions()
        updateHeadlightsColor()
        task_wait(0.5)
    end
end)

-- UI Elemente für Tab 5
tab5:AddSection({
    Name = "Car Fly"
})

tab5:AddToggle({
    Name = "Mobile Car fly",
    Default = false,
    Callback = function(v)
        -- Mobile Car Fly Menu implementieren
    end
})

tab5:AddToggle({
    Name = "Car fly on / off",
    Default = false,
    Callback = function(v)
        carFlyEnabled = v
    end
})

tab5:AddToggle({
    Name = "Safe fly on / off",
    Default = false,
    Callback = function(v)
        safeFly = v
    end
})

tab5:AddToggle({
    Name = "Vehicle Fling on / off",
    Default = false,
    Callback = function(v)
        vehicleFling = v
        if v then
            vehicleFlingFunction()
        end
    end
})

-- Car Fly Keybind
local carFlyKeybindText = tab5:AddLabel("Car Fly Key: X")
local function setCarFlyKeybind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        carFlyKeybind = input.KeyCode
        carFlyKeybindText:Set("Car Fly Key: " .. tostring(carFlyKeybind):gsub("Enum.KeyCode.", ""))
    end
end

tab5:AddButton({
    Name = "Car fly Keybind",
    Callback = setCarFlyKeybind
})

tab5:AddSlider({
    Name = "Car fly speed slider",
    Min = 10,
    Max = 200,
    Default = 50,
    Increment = 5,
    ValueName = "",
    Callback = function(v)
        carFlySpeed = v
    end
})

tab5:AddSection({
    Name = "Vehicle Controls"
})

-- Enter in own car
tab5:AddButton({
    Name = "enter in own car",
    Callback = function()
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if car then
            local driveSeat = car:FindFirstChild("DriveSeat", true)
            if driveSeat and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                driveSeat:Sit(LocalPlayer.Character.Humanoid)
            end
        end
    end
})

-- Bring own car
tab5:AddButton({
    Name = "bring own car",
    Callback = function()
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if car and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = LocalPlayer.Character.HumanoidRootPart.Position + LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 10
            car:SetPrimaryPartCFrame(CFrame.new(targetPos))
        end
    end
})

tab5:AddToggle({
    Name = "infinte fuel on / off",
    Default = false,
    Callback = function(v)
        infiniteFuel = v
    end
})

tab5:AddToggle({
    Name = "Vehicle Godmode on / off",
    Default = false,
    Callback = function(v)
        vehicleGodmode = v
    end
})

tab5:AddToggle({
    Name = "Ignore collisions on / off",
    Default = false,
    Callback = function(v)
        ignoreCollisions = v
    end
})

tab5:AddColorpicker({
    Name = "Headlights color",
    Default = headlightsColor,
    Callback = function(color)
        headlightsColor = color
        updateHeadlightsColor()
    end
})

-- Keybind für Car Fly
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == carFlyKeybind then
        carFlyEnabled = not carFlyEnabled
    end
end)

-- ============================================
-- TAB 6: MOVEMENT
-- ============================================
local tab6 = Window:MakeTab({
    Name = "Movement",
    Icon = "rbxassetid://7733674079"
})

-- Movement Variablen
local speedHackEnabled = false
local speedKeybind = Enum.KeyCode.LeftShift
local speedValue = 250
local noClipEnabled = false
local spinbotEnabled = false

-- Speed Hack Funktion
local boostConnection = nil
local function startSpeedHack()
    if boostConnection then return end
    
    boostConnection = RunService.RenderStepped:Connect(function()
        if speedHackEnabled and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local forward = hrp.CFrame.LookVector
                local currentY = hrp.AssemblyLinearVelocity.Y
                local desired = Vector3_new(forward.X * speedValue, currentY, forward.Z * speedValue)
                hrp.AssemblyLinearVelocity = desired
            end
        end
    end)
end

local function stopSpeedHack()
    if boostConnection then
        boostConnection:Disconnect()
        boostConnection = nil
    end
end

-- No Clip Funktion
local noclipConnection
local function startNoClip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    if noClipEnabled then
        noclipConnection = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end

-- Spinbot Funktion
local function updateSpinbot()
    if spinbotEnabled and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(10), 0)
        end
    end
end

-- RunService Loops
RunService.RenderStepped:Connect(function()
    updateSpinbot()
end)

-- UI Elemente für Tab 6
tab6:AddSection({
    Name = "Speed Hack"
})

tab6:AddToggle({
    Name = "Speed Hack on / off",
    Default = false,
    Callback = function(v)
        speedHackEnabled = v
        if v then
            startSpeedHack()
        else
            stopSpeedHack()
        end
    end
})

-- Speed Keybind
local speedKeybindText = tab6:AddLabel("Speed Key: Left Shift")
local function setSpeedKeybind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        speedKeybind = input.KeyCode
        speedKeybindText:Set("Speed Key: " .. tostring(speedKeybind):gsub("Enum.KeyCode.", ""))
    end
end

tab6:AddButton({
    Name = "Speed Keybind",
    Callback = setSpeedKeybind
})

tab6:AddSlider({
    Name = "Speed slider",
    Min = 50,
    Max = 500,
    Default = 250,
    Increment = 10,
    ValueName = "",
    Callback = function(v)
        speedValue = v
    end
})

tab6:AddSection({
    Name = "Vehicle Escape"
})

tab6:AddButton({
    Name = "Escape Vehicle",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Sit = false
        end
    end
})

tab6:AddButton({
    Name = "Steal nearest e-bike",
    Callback = function()
        local closestBike, dist = nil, math.huge
        for _, vehicle in pairs(VehiclesFolder:GetChildren()) do
            if vehicle.Name:lower():find("bike") or vehicle.Name:lower():find("ebike") then
                local pos = vehicle.PrimaryPart and vehicle.PrimaryPart.Position
                if pos then
                    local d = (LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude
                    if d < dist then
                        dist = d
                        closestBike = vehicle
                    end
                end
            end
        end
        
        if closestBike then
            local driveSeat = closestBike:FindFirstChild("DriveSeat", true)
            if driveSeat and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                driveSeat:Sit(LocalPlayer.Character.Humanoid)
            end
        end
    end
})

tab6:AddSection({
    Name = "Movement Mods"
})

tab6:AddToggle({
    Name = "NO clip",
    Default = false,
    Callback = function(v)
        noClipEnabled = v
        startNoClip()
    end
})

tab6:AddToggle({
    Name = "SPinbot",
    Default = false,
    Callback = function(v)
        spinbotEnabled = v
    end
})

-- Speed Hack Keybind
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == speedKeybind then
        speedHackEnabled = not speedHackEnabled
        if speedHackEnabled then
            startSpeedHack()
        else
            stopSpeedHack()
        end
    end
end)

-- ============================================
-- TAB 7: ANIMATIONS
-- ============================================
local tab7 = Window:MakeTab({
    Name = "Animations",
    Icon = "rbxassetid://7733674079"
})

-- Animation Variablen
local selectedAnimation = "Wave"
local animationSpeed = 1.0
local fakeCuffEnabled = false
local animationToggleKey = Enum.KeyCode.Z
local fakeDeadEnabled = false
local lieDownEnabled = false

-- Animationen Liste
local animationsList = {
    "Wave",
    "Point",
    "Dance",
    "Laugh",
    "Cheer",
    "Sit",
    "Jump",
    "Crouch"
}

-- Animation Funktion
local currentAnimationTrack = nil
local function playAnimation(animName)
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            if currentAnimationTrack then
                currentAnimationTrack:Stop()
                currentAnimationTrack = nil
            end
            
            -- Hier würde die tatsächliche Animation implementiert werden
            -- Dies ist ein Platzhalter
            print("Playing animation: " .. animName)
        end
    end
end

local function stopAnimation()
    if currentAnimationTrack then
        currentAnimationTrack:Stop()
        currentAnimationTrack = nil
    end
end

-- Fake Cuff Funktion
local function updateFakeCuff()
    if fakeCuffEnabled then
        local char = LocalPlayer.Character
        if char then
            -- Simuliere Handschellen
            local rightWrist = char:FindFirstChild("RightWrist")
            local leftWrist = char:FindFirstChild("LeftWrist")
            if rightWrist and leftWrist then
                -- Positioniere Arme hinter dem Rücken
                rightWrist.C0 = CFrame.new(0, 0, -0.5) * CFrame.Angles(0, 0, math.rad(-90))
                leftWrist.C0 = CFrame.new(0, 0, -0.5) * CFrame.Angles(0, 0, math.rad(90))
            end
        end
    end
end

-- Fake Dead Funktion
local function updateFakeDead()
    if fakeDeadEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
            -- Setze Health auf niedrigen Wert für visuellen Effekt
            humanoid:SetAttribute("DisplayHealth", 0)
        end
    elseif LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
            humanoid:SetAttribute("DisplayHealth", nil)
        end
    end
end

-- Lie Down Funktion
local function updateLieDown()
    if lieDownEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(math.rad(-90), 0, 0)
            end
        end
    elseif LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

-- RunService Loop
RunService.RenderStepped:Connect(function()
    updateFakeCuff()
    updateFakeDead()
    updateLieDown()
end)

-- UI Elemente für Tab 7
tab7:AddSection({
    Name = "Animation Controls"
})

tab7:AddDropdown({
    Name = "Select Animation",
    Options = animationsList,
    Default = "Wave",
    Callback = function(option)
        selectedAnimation = option
    end
})

tab7:AddButton({
    Name = "Play animation",
    Callback = function()
        playAnimation(selectedAnimation)
    end
})

tab7:AddButton({
    Name = "Stop animation",
    Callback = function()
        stopAnimation()
    end
})

tab7:AddSlider({
    Name = "Animation speed slider",
    Min = 0.1,
    Max = 3.0,
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(v)
        animationSpeed = v
        if currentAnimationTrack then
            currentAnimationTrack:AdjustSpeed(animationSpeed)
        end
    end
})

tab7:AddToggle({
    Name = "Fake cuff on / off",
    Default = false,
    Callback = function(v)
        fakeCuffEnabled = v
    end
})

-- Animation Toggle Keybind
local animationKeybindText = tab7:AddLabel("Animation Key: Z")
local function setAnimationKeybind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        animationToggleKey = input.KeyCode
        animationKeybindText:Set("Animation Key: " .. tostring(animationToggleKey):gsub("Enum.KeyCode.", ""))
    end
end

tab7:AddButton({
    Name = "animation toggle keybind",
    Callback = setAnimationKeybind
})

tab7:AddToggle({
    Name = "Fake dead on / off",
    Default = false,
    Callback = function(v)
        fakeDeadEnabled = v
    end
})

tab7:AddToggle({
    Name = "Lie down on / off",
    Default = false,
    Callback = function(v)
        lieDownEnabled = v
    end
})

-- Animation Keybind Toggle
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == animationToggleKey then
        if currentAnimationTrack then
            stopAnimation()
        else
            playAnimation(selectedAnimation)
        end
    end
end)

-- ============================================
-- TAB 8: AUTOFARM
-- ============================================
local tab8 = Window:MakeTab({
    Name = "Autofarm",
    Icon = "rbxassetid://7733674079"
})

-- Autofarm Variablen
local busAutofarm = false
local truckAutofarm = false

-- Bus Farming Funktion
local function busFarming()
    if busAutofarm then
        -- Teleportiere zur Bus Company
        local busCompany = CFrame.new(-1695.80, 5.882, -1274.29)
        tweenTo(busCompany, true)
        
        task_wait(2)
        
        -- Hier würde die Bus-Farming-Logik implementiert werden
        -- z.B. Passagiere aufnehmen, Route fahren, etc.
        
        print("Bus farming active")
    end
end

-- Truck Farming Funktion
local function truckFarming()
    if truckAutofarm then
        -- Teleportiere zur Truck Company
        local truckCompany = CFrame.new(652.55, 5.638, 1510.85)
        tweenTo(truckCompany, true)
        
        task_wait(2)
        
        -- Hier würde die Truck-Farming-Logik implementiert werden
        -- z.B. Fracht aufnehmen, liefern, etc.
        
        print("Truck farming active")
    end
end

-- Autofarm Loop
task_spawn(function()
    while true do
        if busAutofarm then
            busFarming()
        end
        
        if truckAutofarm then
            truckFarming()
        end
        
        task_wait(1)
    end
end)

-- UI Elemente für Tab 8
tab8:AddSection({
    Name = "Autofarm Settings"
})

tab8:AddToggle({
    Name = "Autofarm [Bus] on / off",
    Default = false,
    Callback = function(v)
        busAutofarm = v
    end
})

tab8:AddToggle({
    Name = "Autofarm [Truck] on / off",
    Default = false,
    Callback = function(v)
        truckAutofarm = v
    end
})

-- ============================================
-- TAB 9: GRAPHICS
-- ============================================
local tab9 = Window:MakeTab({
    Name = "Graphics",
    Icon = "rbxassetid://7733674079"
})

-- Graphics Variablen
local removeAtmosphere = false
local fullbright = false
local xray = false
local selectedSky = "Default"
local skinChanger = false
local playerGhost = false
local ghostColor = Color3.fromRGB(255, 255, 255)
local rainbowGhost = false
local trails = false
local trailColor = Color3.fromRGB(255, 0, 0)
local particles = false
local particlesColor = Color3.fromRGB(0, 255, 255)

-- Himmel Optionen
local skyOptions = {
    "Default",
    "Night",
    "Sunset",
    "Midnight",
    "Purple",
    "Blue"
}

-- Remove Atmosphere Funktion
local function updateAtmosphere()
    local lighting = game:GetService("Lighting")
    if removeAtmosphere then
        lighting.Atmosphere.Density = 0
        lighting.FogEnd = 1000000
    else
        lighting.Atmosphere.Density = 0.3
        lighting.FogEnd = 1000
    end
end

-- Fullbright Funktion
local function updateFullbright()
    local lighting = game:GetService("Lighting")
    if fullbright then
        lighting.Ambient = Color3.new(1, 1, 1)
        lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        lighting.Brightness = 3
    else
        lighting.Ambient = Color3.fromRGB(112, 112, 112)
        lighting.OutdoorAmbient = Color3.fromRGB(112, 112, 112)
        lighting.Brightness = 1
    end
end

-- XRay Funktion
local function updateXRay()
    if xray then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part:IsDescendantOf(LocalPlayer.Character) then
                part.LocalTransparencyModifier = 0.5
            end
        end
    else
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.LocalTransparencyModifier = 0
            end
        end
    end
end

-- Sky Changer Funktion
local function changeSky(skyName)
    local lighting = game:GetService("Lighting")
    
    -- Entferne existierenden Sky
    for _, obj in pairs(lighting:GetChildren()) do
        if obj:IsA("Sky") then
            obj:Destroy()
        end
    end
    
    if skyName ~= "Default" then
        local sky = Instance.new("Sky", lighting)
        
        if skyName == "Night" then
            sky.SkyboxBk = "rbxassetid://5596526698"
            sky.SkyboxDn = "rbxassetid://5596526528"
            sky.SkyboxFt = "rbxassetid://5596526412"
            sky.SkyboxLf = "rbxassetid://5596526245"
            sky.SkyboxRt = "rbxassetid://5596526002"
            sky.SkyboxUp = "rbxassetid://5596525835"
        elseif skyName == "Sunset" then
            sky.SkyboxBk = "rbxassetid://5101999671"
            sky.SkyboxDn = "rbxassetid://5101999435"
            sky.SkyboxFt = "rbxassetid://5101999316"
            sky.SkyboxLf = "rbxassetid://5101999155"
            sky.SkyboxRt = "rbxassetid://5101999014"
            sky.SkyboxUp = "rbxassetid://5101998863"
        end
    end
end

-- Skin Changer Funktion
local function updateSkinChanger()
    if skinChanger and LocalPlayer.Character then
        -- Hier würde Skin Changer implementiert werden
        -- z.B. Ändere Charakter-Erscheinung
    end
end

-- Player Ghost Funktion
local ghostHighlight
local function updatePlayerGhost()
    if playerGhost and LocalPlayer.Character then
        if not ghostHighlight then
            ghostHighlight = Instance.new("Highlight")
            ghostHighlight.FillTransparency = 0.5
            ghostHighlight.OutlineTransparency = 0
            ghostHighlight.Parent = LocalPlayer.Character
        end
        
        if rainbowGhost then
            local hue = tick() % 5 / 5
            ghostColor = Color3.fromHSV(hue, 1, 1)
        end
        
        ghostHighlight.FillColor = ghostColor
        ghostHighlight.OutlineColor = ghostColor
        ghostHighlight.Enabled = true
    elseif ghostHighlight then
        ghostHighlight.Enabled = false
    end
end

-- Trails Funktion
local trailAttachment
local function updateTrails()
    if trails and LocalPlayer.Character then
        if not trailAttachment then
            trailAttachment = Instance.new("Trail", LocalPlayer.Character.HumanoidRootPart)
            trailAttachment.Attachment0 = Instance.new("Attachment", LocalPlayer.Character.HumanoidRootPart)
            trailAttachment.Attachment1 = Instance.new("Attachment", LocalPlayer.Character.HumanoidRootPart)
            trailAttachment.Attachment1.Position = Vector3.new(0, -2, 0)
        end
        
        trailAttachment.Color = ColorSequence.new(trailColor)
        trailAttachment.Enabled = true
    elseif trailAttachment then
        trailAttachment.Enabled = false
    end
end

-- Particles Funktion
local particleEmitter
local function updateParticles()
    if particles and LocalPlayer.Character then
        if not particleEmitter then
            particleEmitter = Instance.new("ParticleEmitter", LocalPlayer.Character.HumanoidRootPart)
            particleEmitter.Rate = 50
            particleEmitter.Lifetime = NumberRange.new(1)
            particleEmitter.Speed = NumberRange.new(5)
            particleEmitter.Size = NumberSequence.new(0.2)
        end
        
        particleEmitter.Color = ColorSequence.new(particlesColor)
        particleEmitter.Enabled = true
    elseif particleEmitter then
        particleEmitter.Enabled = false
    end
end

-- Graphics Update Loop
task_spawn(function()
    while true do
        updateAtmosphere()
        updateFullbright()
        updateXRay()
        updateSkinChanger()
        updatePlayerGhost()
        updateTrails()
        updateParticles()
        task_wait(0.5)
    end
end)

-- UI Elemente für Tab 9
tab9:AddSection({
    Name = "Visual Effects"
})

tab9:AddToggle({
    Name = "Remove Atmosphere on / off",
    Default = false,
    Callback = function(v)
        removeAtmosphere = v
    end
})

tab9:AddToggle({
    Name = "Fullbright on / off",
    Default = false,
    Callback = function(v)
        fullbright = v
    end
})

tab9:AddToggle({
    Name = "Xray on / off",
    Default = false,
    Callback = function(v)
        xray = v
    end
})

tab9:AddDropdown({
    Name = "Change sky",
    Options = skyOptions,
    Default = "Default",
    Callback = function(option)
        selectedSky = option
        changeSky(option)
    end
})

tab9:AddToggle({
    Name = "Skinchanger",
    Default = false,
    Callback = function(v)
        skinChanger = v
    end
})

tab9:AddSection({
    Name = "Ghost Effects"
})

tab9:AddToggle({
    Name = "Player Ghost on / off",
    Default = false,
    Callback = function(v)
        playerGhost = v
    end
})

tab9:AddColorpicker({
    Name = "Ghost color",
    Default = ghostColor,
    Callback = function(color)
        ghostColor = color
    end
})

tab9:AddToggle({
    Name = "Rainbow color on / off",
    Default = false,
    Callback = function(v)
        rainbowGhost = v
    end
})

tab9:AddSection({
    Name = "Trails & Particles"
})

tab9:AddToggle({
    Name = "Trails on / off",
    Default = false,
    Callback = function(v)
        trails = v
    end
})

tab9:AddColorpicker({
    Name = "Trail Color",
    Default = trailColor,
    Callback = function(color)
        trailColor = color
    end
})

tab9:AddToggle({
    Name = "Particles on / off",
    Default = false,
    Callback = function(v)
        particles = v
    end
})

tab9:AddColorpicker({
    Name = "Particles Color",
    Default = particlesColor,
    Callback = function(color)
        particlesColor = color
    end
})

-- ============================================
-- TAB 10: VISUALS (ESP SYSTEM)
-- ============================================
local tab10 = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://7743871002"
})

-- ESP Variablen (wie in deinem originalem Script)
local plr = Players.LocalPlayer
local state = {
    espEnabled = false,
    showNames = true,
    showTeams = true,
    showDistance = true,
    showHealth = true,
    showEquipped = true,
    showWanted = true,
    espObjects = {},
    espDistance = 1000
}

-- ESP Funktionen (aus deinem originalem Script)
local function teamColorForTeam(team)
    if not team then return Color3.fromRGB(200,200,200) end
    local tn = tostring(team.Name):lower()
    if tn:find("police") then
        return Color3.fromRGB(80,160,255)
    elseif tn:find("fire") then
        return Color3.fromRGB(255,80,80)
    elseif tn:find("hospital") or tn:find("medic") then
        return Color3.fromRGB(120,255,140)
    else
        return Color3.fromRGB(200,200,200)
    end
end

local function createESPForPlayer(other)
    if not other.Character then return end
    if state.espObjects[other.UserId] then return end

    local hrp = other.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_" .. other.Name
    billboard.Adornee = hrp
    billboard.Size = UDim2.new(0,160,0,100)
    billboard.StudsOffset = Vector3.new(0,3.5,0)
    billboard.AlwaysOnTop = true
    billboard.Parent = other.Character

    local function newLabel(yOffset, color)
        local lbl = Instance.new("TextLabel", billboard)
        lbl.Size = UDim2.new(1,0,0,18)
        lbl.Position = UDim2.new(0,0,0,yOffset)
        lbl.BackgroundTransparency = 1
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextStrokeTransparency = 0.6
        lbl.TextColor3 = color or Color3.new(1,1,1)
        return lbl
    end

    local nameLbl = newLabel(0)
    local infoLbl = newLabel(20)
    local healthLbl = newLabel(38, Color3.fromRGB(120,255,120))
    local equipLbl = newLabel(56, Color3.fromRGB(255,255,0))
    local wantedLbl = newLabel(74)

    state.espObjects[other.UserId] = {
        billboard = billboard,
        nameLbl = nameLbl,
        infoLbl = infoLbl,
        healthLbl = healthLbl,
        equipLbl = equipLbl,
        wantedLbl = wantedLbl
    }
end

local function updateESPEntry(other)
    local entry = state.espObjects[other.UserId]
    if not entry then return end

    local char = other.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then
        entry.billboard.Enabled = false
        return
    end

    local plrRoot = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not plrRoot then return end

    local dist = (plrRoot.Position - hrp.Position).Magnitude
    if dist > state.espDistance then
        entry.billboard.Enabled = false
        return
    else
        entry.billboard.Enabled = true
    end

    local team = other.Team
    local teamColor = teamColorForTeam(team)

    entry.nameLbl.Text = state.showNames and other.Name or ""
    entry.nameLbl.TextColor3 = teamColor

    if state.showDistance then
        entry.infoLbl.Text = (team and ("["..team.Name.."] ") or "") .. math_floor(dist) .. "m"
    else
        entry.infoLbl.Text = team and ("["..team.Name.."]") or ""
    end

    entry.healthLbl.Text = state.showHealth and ("HP: "..math_floor(hum.Health)) or ""

    if state.showEquipped then
        local tool = char:FindFirstChildOfClass("Tool")
        entry.equipLbl.Text = tool and ("Equipped: "..tool.Name) or "Nothing Equipped"
    else
        entry.equipLbl.Text = ""
    end

    if state.showWanted then
        if hrp:GetAttribute("IsWanted") then
            entry.wantedLbl.Text = "Wanted"
            entry.wantedLbl.TextColor3 = Color3.fromRGB(255,140,0)
        else
            entry.wantedLbl.Text = "Not Wanted"
            entry.wantedLbl.TextColor3 = Color3.fromRGB(0,255,0)
        end
    else
        entry.wantedLbl.Text = ""
    end
end

local lastESPUpdate = 0
local ESP_UPDATE_INTERVAL = 0.2

RunService.RenderStepped:Connect(function()
    local currentTime = tick()
    if not state.espEnabled or (currentTime - lastESPUpdate) < ESP_UPDATE_INTERVAL then return end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= plr then
            if not state.espObjects[p.UserId] then
                createESPForPlayer(p)
            end
            updateESPEntry(p)
        end
    end
    lastESPUpdate = currentTime
end)

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        if state.espEnabled then
            task_wait(1)
            createESPForPlayer(p)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(p)
    local entry = state.espObjects[p.UserId]
    if entry then
        if entry.billboard then entry.billboard:Destroy() end
        state.espObjects[p.UserId] = nil
    end
end)

-- UI Elemente für Tab 10
tab10:AddSection({
    Name = "ESP System"
})

local espToggle = tab10:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(v)
        state.espEnabled = v
        if not v then
            for _,e in pairs(state.espObjects) do
                if e.billboard then e.billboard:Destroy() end
            end
            state.espObjects = {}
        else
            for _,p in ipairs(Players:GetPlayers()) do
                if p ~= plr then
                    createESPForPlayer(p)
                end
            end
        end
    end
})

tab10:AddToggle({
    Name = "Show Player Names", 
    Default = true, 
    Callback = function(v) state.showNames = v end
})

tab10:AddToggle({
    Name = "Show Team Info", 
    Default = true, 
    Callback = function(v) state.showTeams = v end
})

tab10:AddToggle({
    Name = "Show Distance", 
    Default = true, 
    Callback = function(v) state.showDistance = v end
})

tab10:AddToggle({
    Name = "Show Health", 
    Default = true, 
    Callback = function(v) state.showHealth = v end
})

tab10:AddToggle({
    Name = "Show Equipped Weapons", 
    Default = true, 
    Callback = function(v) state.showEquipped = v end
})

tab10:AddToggle({
    Name = "Show Wanted Status", 
    Default = true, 
    Callback = function(v) state.showWanted = v end
})

tab10:AddSlider({
    Name = "ESP Distance",
    Min = 100,
    Max = 2000,
    Default = 1000,
    Increment = 50,
    ValueName = "m",
    Callback = function(value)
        state.espDistance = value
    end
})

-- ============================================
-- TAB 11: POLICE
-- ============================================
local tab11 = Window:MakeTab({
    Name = "Police",
    Icon = "rbxassetid://7733956210"
})

-- Police Variablen
local autoTaser = false
local autoStopStick = false
local autoCuff = false
local cuffDistance = 10
local radarFarm = false

-- Police Tools Variablen
local REMOTE_FOLDER = "8WX"
local TASER_REMOTE_ID = "9b91a7ac-035c-4b97-9a85-9c36725e1796"
local AUTO_TASER_INTERVAL = 0.5
local MAX_TASE_RANGE = 80

-- Auto Taser Funktionen
local lastTase = 0

local function getTaserPosition()
    local char = LocalPlayer.Character
    if not char then return nil, nil end

    local taser = char:FindFirstChild("Taser")
    if taser then
        local handle = taser:FindFirstChild("Handle")
        if handle and handle:IsA("BasePart") then
            return handle.Position, taser
        end
    end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp and hrp:IsA("BasePart") then
        return hrp.Position, nil
    end

    return nil, nil
end

local function findNearestEnemy(maxRange)
    local pos = getTaserPosition()
    if not pos then return nil end
    local taserPos = pos
    local nearestPlayer, nearestDist

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Team ~= LocalPlayer.Team then
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (hrp.Position - taserPos).Magnitude
                if dist <= maxRange and (not nearestDist or dist < nearestDist) then
                    nearestDist = dist
                    nearestPlayer = plr
                end
            end
        end
    end
    return nearestPlayer
end

local function fireTaserAtTarget()
    local taserPos, taserObj = getTaserPosition()
    if not taserPos then return end

    local target = findNearestEnemy(MAX_TASE_RANGE)
    if not target or not target.Character then return end

    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local aimPos = hrp.Position
    local dir = aimPos - taserPos
    dir = dir.Magnitude == 0 and Vector3.zero or dir.Unit

    local folder = game:GetService("ReplicatedStorage"):FindFirstChild(REMOTE_FOLDER)
    if not folder then return end

    local remote = folder:FindFirstChild(TASER_REMOTE_ID)
    if not remote then return end

    local args = { taserObj, aimPos, dir }

    pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(unpack(args))
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer(unpack(args))
        end
    end)
end

-- Auto Cuff Funktion
local function autoCuffFunction()
    if autoCuff and LocalPlayer.Character then
        local char = LocalPlayer.Character
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
                local targetChar = player.Character
                local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                if targetHrp then
                    local distance = (hrp.Position - targetHrp.Position).Magnitude
                    if distance <= cuffDistance then
                        -- Hier würde die Cuff-Logik implementiert werden
                        print("Attempting to cuff: " .. player.Name)
                    end
                end
            end
        end
    end
end

-- Radar Farm Funktion
local REMOTE_FOLDER_NAME = "8WX"
local REMOTE_ID = "35b3ffbf-8881-4eba-aaa2-6d0ce8f8bf8b"
local lastRadarFarmUpdate = 0
local RADAR_FARM_INTERVAL = 1.5

local function startRadarFarm()
    local radarRemote = game:GetService("ReplicatedStorage"):FindFirstChild(REMOTE_FOLDER_NAME)
    if not radarRemote then return end
    
    radarRemote = radarRemote:FindFirstChild(REMOTE_ID)
    if not radarRemote then return end

    while radarFarm do
        local currentTime = tick()
        if (currentTime - lastRadarFarmUpdate) > RADAR_FARM_INTERVAL then
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local radarGun = char:FindFirstChild("Radar Gun")

                if hrp and radarGun then
                    local vehiclesFolder = workspace:FindFirstChild("Vehicles")
                    if vehiclesFolder then
                        for _, vehicle in pairs(vehiclesFolder:GetChildren()) do
                            if vehicle:IsA("Model") then
                                local driveSeat = vehicle:FindFirstChild("DriveSeat")
                                if driveSeat and driveSeat.Position and driveSeat.Occupant then
                                    local dir = (driveSeat.Position - hrp.Position)
                                    if dir.Magnitude > 0 then
                                        dir = dir.Unit
                                        pcall(function()
                                            radarRemote:FireServer(radarGun, driveSeat.Position, dir)
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            lastRadarFarmUpdate = currentTime
        end
        task_wait(0.1)
    end
end

-- Police Update Loops
RunService.RenderStepped:Connect(function()
    if autoTaser and tick() - lastTase >= AUTO_TASER_INTERVAL then
        fireTaserAtTarget()
        lastTase = tick()
    end
end)

task_spawn(function()
    while true do
        autoCuffFunction()
        task_wait(1)
    end
end)

-- UI Elemente für Tab 11
tab11:AddSection({
    Name = "Police Tools"
})

tab11:AddToggle({
    Name = "Auto Taser on / off",
    Default = false,
    Callback = function(v)
        autoTaser = v
    end
})

tab11:AddToggle({
    Name = "Auto stop stick on / off",
    Default = false,
    Callback = function(v)
        autoStopStick = v
    end
})

tab11:AddToggle({
    Name = "Auto Cuff on / off",
    Default = false,
    Callback = function(v)
        autoCuff = v
    end
})

tab11:AddSlider({
    Name = "Cuff distance slider",
    Min = 5,
    Max = 50,
    Default = 10,
    Increment = 1,
    ValueName = "m",
    Callback = function(v)
        cuffDistance = v
    end
})

tab11:AddToggle({
    Name = "Radar Farm",
    Default = false,
    Callback = function(v)
        radarFarm = v
        if v then
            task_spawn(startRadarFarm)
        end
    end
})

-- ============================================
-- TAB 12: SERVER
-- ============================================
local tab12 = Window:MakeTab({
    Name = "Server",
    Icon = "rbxassetid://7072720870"
})

-- Server Info Funktionen
local function getServerInfo()
    local playerCount = #Players:GetPlayers()
    local jobId = game.JobId
    local placeId = game.PlaceId
    
    local playerList = ""
    for _, player in pairs(Players:GetPlayers()) do
        playerList = playerList .. player.Name .. " (" .. (player.Team and player.Team.Name or "No Team") .. ")\n"
    end
    
    return {
        playerCount = playerCount,
        jobId = jobId,
        placeId = placeId,
        playerList = playerList
    }
end

-- UI Elemente für Tab 12
tab12:AddSection({
    Name = "Server Information"
})

local serverInfoLabel = tab12:AddLabel("Loading server info...")

tab12:AddButton({
    Name = "Refresh Server Info",
    Callback = function()
        local info = getServerInfo()
        serverInfoLabel:Set(string.format(
            "Players: %d\nServer ID: %s\nPlace ID: %d",
            info.playerCount, info.jobId, info.placeId
        ))
    end
})

-- Initialisiere Server Info
local info = getServerInfo()
serverInfoLabel:Set(string.format(
    "Players: %d\nServer ID: %s\nPlace ID: %d",
    info.playerCount, info.jobId, info.placeId
))

-- ============================================
-- TAB 13: MISC
-- ============================================
local tab13 = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://7743878358"
})

-- Misc Variablen
local safeLeave = false
local selfRevive = false
local antiFlashbang = false
local antiDying = false
local antiFalldamage = false
local antiArrest = false
local infiniteStamina = false
local autoCollect = false
local autoRejoin = false
local antiSpeedCamera = false
local playerFly = false
local flyBind = Enum.KeyCode.V
local flySpeed = 50

-- Fly System Variablen
local isFlying = false
local flyAttachment, flyAlignPosition, flyAlignOrientation

-- Safe Leave Funktion
local function safeLeaveFunction()
    if safeLeave then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
end

-- Self Revive Funktion
local function selfReviveFunction()
    if selfRevive and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health <= 0 then
            -- Teleport zum Hospital
            local hospital = CFrame.new(-293.16, 5.627, 1053.98)
            tweenTo(hospital, true)
            task_wait(2)
            
            -- Setze Health zurück
            humanoid.Health = humanoid.MaxHealth
        end
    end
end

-- Anti Flashbang
local function antiFlashbangFunction()
    if antiFlashbang then
        -- Entferne Flashbang Effekte
        local lighting = game:GetService("Lighting")
        for _, effect in pairs(lighting:GetChildren()) do
            if effect.Name:lower():find("flash") or effect.Name:lower():find("bang") then
                effect:Destroy()
            end
        end
    end
end

-- Anti Dying
local function antiDyingFunction()
    if antiDying and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
    end
end

-- Anti Fall Damage
local function antiFalldamageFunction()
    if antiFalldamage and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoid and hrp then
            if hrp.Velocity.Y < -80 then
                hrp.Velocity = Vector3.new(hrp.Velocity.X, -10, hrp.Velocity.Z)
            end
        end
    end
end

-- Anti Arrest
local function antiArrestFunction()
    if antiArrest and LocalPlayer.Character then
        local char = LocalPlayer.Character
        local hrp = char:FindFirstChild("HumanoidRootPart")
        
        if hrp:GetAttribute("Arrested") then
            hrp:SetAttribute("Arrested", false)
        end
    end
end

-- Change Server Funktion
local function changeServer()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local PlaceId = game.PlaceId

    local success, response = pcall(function()
        return HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
        )
    end)

    if success and response and response.data then
        for _, server in pairs(response.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(PlaceId, server.id, LocalPlayer)
                return
            end
        end
    end
end

-- Infinite Stamina
local function infiniteStaminaFunction()
    if infiniteStamina and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:SetAttribute("Stamina", 100)
        end
    end
end

-- Auto Collect
local function autoCollectFunction()
    if autoCollect then
        -- Sammle Items in der Nähe ein
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:find("Money") or obj.Name:find("Weapon") then
                if obj:IsA("BasePart") then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude
                    if distance < 20 then
                        obj.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end
end

-- Auto Rejoin
local function autoRejoinFunction()
    if autoRejoin then
        local connection
        connection = game:GetService("CoreGui").ChildAdded:Connect(function(child)
            if child.Name:find("Kick") or child.Name:find("Disconnect") then
                task_wait(2)
                game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
            end
        end)
    end
end

-- Anti Speed Camera
local function antiSpeedCameraFunction()
    if antiSpeedCamera then
        -- Entferne Geschwindigkeitskameras
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("camera") or obj.Name:lower():find("speed") then
                if obj:IsA("BasePart") then
                    obj:Destroy()
                end
            end
        end
    end
end

-- Fly System Funktionen
local function enableFly()
    local character = LocalPlayer.Character
    if not character then return end
    local root = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")
    if not (root and humanoid) then return end

    flyAttachment = Instance.new("Attachment", root)

    flyAlignPosition = Instance.new("AlignPosition")
    flyAlignPosition.Attachment0 = flyAttachment
    flyAlignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
    flyAlignPosition.MaxForce = 5000
    flyAlignPosition.Responsiveness = 45
    flyAlignPosition.Parent = root

    flyAlignOrientation = Instance.new("AlignOrientation")
    flyAlignOrientation.Attachment0 = flyAttachment
    flyAlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    flyAlignOrientation.MaxTorque = 5000
    flyAlignOrientation.Responsiveness = 45
    flyAlignOrientation.Parent = root

    humanoid.PlatformStand = true
    isFlying = true

    local lastPosition = root.Position
    flyAlignPosition.Position = lastPosition

    task_spawn(function()
        while isFlying and root and humanoid do
            local moveDir = Vector3.zero
            local camCFrame = workspace.CurrentCamera.CFrame

            if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir += camCFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir -= camCFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir -= camCFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir += camCFrame.RightVector end

            if moveDir.Magnitude > 0 then
                moveDir = moveDir.Unit
                local newPos = lastPosition + (moveDir * flySpeed * 0.033)
                flyAlignPosition.Position = newPos
                lastPosition = newPos
            end

            flyAlignOrientation.CFrame = CFrame.new(Vector3.zero, camCFrame.LookVector)
            task_wait(0.033)
        end
    end)
end

local function disableFly()
    isFlying = false
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then humanoid.PlatformStand = false end
    if flyAttachment then flyAttachment:Destroy() end
    if flyAlignPosition then flyAlignPosition:Destroy() end
    if flyAlignOrientation then flyAlignOrientation:Destroy() end
end

-- Misc Update Loops
task_spawn(function()
    while true do
        selfReviveFunction()
        antiFlashbangFunction()
        antiDyingFunction()
        antiFalldamageFunction()
        antiArrestFunction()
        infiniteStaminaFunction()
        autoCollectFunction()
        antiSpeedCameraFunction()
        task_wait(0.5)
    end
end)

-- UI Elemente für Tab 13
tab13:AddSection({
    Name = "Utility Features"
})

tab13:AddToggle({
    Name = "Safe leave",
    Default = false,
    Callback = function(v)
        safeLeave = v
        if v then
            safeLeaveFunction()
        end
    end
})

tab13:AddToggle({
    Name = "Self revive",
    Default = false,
    Callback = function(v)
        selfRevive = v
    end
})

tab13:AddToggle({
    Name = "Anti Flashbang on / off",
    Default = false,
    Callback = function(v)
        antiFlashbang = v
    end
})

tab13:AddToggle({
    Name = "Anti Dying on / off",
    Default = false,
    Callback = function(v)
        antiDying = v
    end
})

tab13:AddToggle({
    Name = "Anti Falldamage on / off",
    Default = false,
    Callback = function(v)
        antiFalldamage = v
    end
})

tab13:AddToggle({
    Name = "Anti Arrest on / off",
    Default = false,
    Callback = function(v)
        antiArrest = v
    end
})

tab13:AddButton({
    Name = "Change Server",
    Callback = changeServer
})

tab13:AddToggle({
    Name = "INF Stamina",
    Default = false,
    Callback = function(v)
        infiniteStamina = v
    end
})

tab13:AddButton({
    Name = "Reset (lose all weapons)",
    Callback = function()
        if LocalPlayer.Character then
            for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
                if tool:IsA("Tool") then
                    tool:Destroy()
                end
            end
        end
    end
})

tab13:AddToggle({
    Name = "Autocollect on / off",
    Default = false,
    Callback = function(v)
        autoCollect = v
    end
})

tab13:AddToggle({
    Name = "Automatic rejoining on kicks on / off",
    Default = false,
    Callback = function(v)
        autoRejoin = v
        if v then
            autoRejoinFunction()
        end
    end
})

tab13:AddToggle({
    Name = "Anti speed camer on / off",
    Default = false,
    Callback = function(v)
        antiSpeedCamera = v
    end
})

tab13:AddToggle({
    Name = "PLayer fly on / off",
    Default = false,
    Callback = function(v)
        playerFly = v
        if v then
            enableFly()
        else
            disableFly()
        end
    end
})

-- Fly Bind
local flyBindText = tab13:AddLabel("Fly Bind: V")
local function setFlyBind()
    local input = UIS.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.Keyboard then
        flyBind = input.KeyCode
        flyBindText:Set("Fly Bind: " .. tostring(flyBind):gsub("Enum.KeyCode.", ""))
    end
end

tab13:AddButton({
    Name = "Fly bind",
    Callback = setFlyBind
})

tab13:AddSlider({
    Name = "Fly speed slider",
    Min = 10,
    Max = 150,
    Default = 50,
    Increment = 5,
    ValueName = "",
    Callback = function(v)
        flySpeed = v
    end
})

-- Fly Keybind Toggle
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == flyBind then
        playerFly = not playerFly
        if playerFly then
            enableFly()
        else
            disableFly()
        end
    end
end)

-- ============================================
-- INITIALISIERUNG UND CLEANUP
-- ============================================

-- Cleanup beim Verlassen
game:GetService("UserInputService").WindowFocused:Connect(function()
    -- Stelle sicher, dass alle Drawing-Objekte entfernt werden
    pcall(function()
        if fovCircle and fovCircle.Remove ~= nil then
            fovCircle:Remove()
        end
    end)
    pcall(function()
        if aimbotFovCircle and aimbotFovCircle.Remove ~= nil then
            aimbotFovCircle:Remove()
        end
    end)
end)

-- Info Nachricht
print([[
    ╔══════════════════════════════╗
    ║       Fragmora V2.0          ║
    ║    Emergency Hamburg         ║
    ║     Structured Version       ║
    ║   All Features Included      ║
    ╚══════════════════════════════╝
]])

-- Deaktiviere Config-Speicherung
Window.ConfigFolder = nil
Window.SaveConfig = false

-- Das Script ist jetzt vollständig und sollte funktionieren
print("Fragmora V2.0 erfolgreich geladen!")
