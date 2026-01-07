local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local LocalPlayer = Player

local RemoteEvents = {
    rob = ReplicatedStorage:WaitForChild("WvO"):WaitForChild("7a985dd7-2744-4a3e-a4cd-7904f9a36418"),
    sell = ReplicatedStorage:WaitForChild("WvO"):WaitForChild("67993222-e592-4017-9bdb-5e29e21caa9b"),
    equip = ReplicatedStorage:WaitForChild("WvO"):WaitForChild("6f1bcb4a-5f97-40b7-9cfd-f18a2b49dc88"),
    buy = ReplicatedStorage:WaitForChild("WvO"):WaitForChild("64084741-be8f-4afd-8a31-b0bc1c709bee"),
    bomb = ReplicatedStorage:WaitForChild("WvO"):WaitForChild("13b18c39-ae98-4b46-b8f3-eca379d3b7fc")
}

local Codes = {
    money = "EbZ",
    items = "yvo"
}

local Config = {
    range = 200,
    proximityPromptTime = 2.5,
    vehicleSpeed = 140, 
    playerSpeed = 25, 
    policeCheckRange = 40,
    lowHealthThreshold = 35,
    tweenDelay = 0.05, 
    maxSpeedReduction = 0.7 
}

local State = {
    autorobToggle = true,
    autoSellToggle = true,
    collected = {},
    teleportActive = false,
    isSpecialTeleport = false
}

local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Locations = {
    start = Vector3.new(-1370.972412109375, 5.499999046325684, 3127.154541015625),
    club = {
        position = Vector3.new(-1738.0706787109375, 10.973498344421387, 3040.90673828125),
        stand = Vector3.new(-1744.1258544921875, 11.098498344421387, 3015.169677734375),
        safe = Vector3.new(-1744.370361328125, 10.97349739074707, 3038.049072265625)
    },
    bank = Vector3.new(-1275.029541015625, 5.377415657043457, 3167.11767578125),
    jeweler = Vector3.new(-464.14019775390625, 39.09627151489258, 3556.745849609375),
    container = Vector3.new(1096.401, 57.31, 2226.765),
    rejoin = Vector3.new(1656.3526611328125, -25.936052322387695, 2821.137451171875)
}

local function loadOrionLib()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Fragmora/fragmora.script/refs/heads/main/orion.lua"))()
end

local OrionLib = loadOrionLib()

local function sendNotification(title, content)
    OrionLib:MakeNotification({
        Name = title,
        Content = content,
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

OrionLib:MakeNotification({
    Name = "Starting Autorob",
    Content = "If you need support reach us via discord",
    Image = "rbxassetid://4483345998",
    Time = 5
})

wait(5)

local function getSafeSpeed(distance, targetPosition)
    
    local baseSpeed = Config.vehicleSpeed
    
    
    local nearbyPlayers = 0
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Player and plr.Character then
            local plrHRP = plr.Character:FindFirstChild("HumanoidRootPart")
            if plrHRP and HumanoidRootPart and (plrHRP.Position - HumanoidRootPart.Position).Magnitude <= 100 then
                nearbyPlayers = nearbyPlayers + 1
            end
        end
    end
    
    
    local speedMultiplier = 1.0
    if nearbyPlayers > 0 then
        speedMultiplier = math.max(Config.maxSpeedReduction, 1.0 - (nearbyPlayers * 0.1))
    end
    
    
    if distance < 50 then
        speedMultiplier = speedMultiplier * 0.8
    end
    
    return baseSpeed * speedMultiplier
end

local function isPoliceNearby()
    local policeTeam = game:GetService("Teams"):FindFirstChild("Police")
    if not policeTeam then return false end
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Player and plr.Team == policeTeam and plr.Character then
            local policeHRP = plr.Character:FindFirstChild("HumanoidRootPart")
            if policeHRP and HumanoidRootPart and (policeHRP.Position - HumanoidRootPart.Position).Magnitude <= Config.policeCheckRange then
                sendNotification("Police Nearby", "Aborting collect and fleeing!")
                return true
            end
        end
    end
    return false
end

local function isPlayerHurt()
    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health <= Config.lowHealthThreshold
end

local function lootVisibleMeshParts(folder)
    if not folder then return end
    
    if isPoliceNearby() or isPlayerHurt() then
        return
    end
    
    local meshParts = {}
    for _, meshPart in ipairs(folder:GetDescendants()) do
        if meshPart:IsA("MeshPart") and meshPart.Transparency == 0 and not State.collected[meshPart] then
            table.insert(meshParts, meshPart)
        end
    end
    
    table.sort(meshParts, function(a, b)
        local distA = (a.Position - HumanoidRootPart.Position).Magnitude
        local distB = (b.Position - HumanoidRootPart.Position).Magnitude
        return distA < distB
    end)
    
    for _, meshPart in ipairs(meshParts) do
        if not Character or not HumanoidRootPart then break end
        
        if isPoliceNearby() or isPlayerHurt() then
            break
        end
        
        if meshPart.Transparency == 0 and (meshPart.Position - HumanoidRootPart.Position).Magnitude <= Config.range then
            State.collected[meshPart] = true
            
            task.spawn(function()
                local code = meshPart.Parent and meshPart.Parent.Name == "Money" and Codes.money or Codes.items
                local args = {meshPart, code, true}
                RemoteEvents.rob:FireServer(unpack(args))
                task.wait(Config.proximityPromptTime)
                args[3] = false
                RemoteEvents.rob:FireServer(unpack(args))
                if meshPart and meshPart.Parent then
                    State.collected[meshPart] = nil
                end
            end)
            
            task.wait(0.05)
        end
    end
end

local function interactWithVisibleMeshParts(folder)
    if not folder then return end
    if isPoliceNearby() or isPlayerHurt() then return end

    local meshParts = {}
    for _, meshPart in ipairs(folder:GetChildren()) do
        if meshPart:IsA("MeshPart") and meshPart.Transparency == 0 then
            table.insert(meshParts, meshPart)
        end
    end

    table.sort(meshParts, function(a, b)
        local aDist = (a.Position - HumanoidRootPart.Position).Magnitude
        local bDist = (b.Position - HumanoidRootPart.Position).Magnitude
        return aDist < bDist
    end)

    for _, meshPart in ipairs(meshParts) do
        if isPoliceNearby() or isPlayerHurt() then return end
        if meshPart.Transparency == 1 then continue end

        local code = meshPart.Parent.Name == "Money" and Codes.money or Codes.items
        local args = {meshPart, code, true}
        RemoteEvents.rob:FireServer(unpack(args))
        task.wait(Config.proximityPromptTime)
        args[3] = false
        RemoteEvents.rob:FireServer(unpack(args))
    end
end

local function interactWithVisibleMeshParts2(container)
    if not container then return end
    if isPoliceNearby() or isPlayerHurt() then return end

    local meshParts = {}
    for _, descendant in ipairs(container:GetDescendants()) do
        if descendant:IsA("MeshPart") and descendant.Transparency == 0 then
            table.insert(meshParts, descendant)
        end
    end

    table.sort(meshParts, function(a, b)
        local aDist = (a.Position - HumanoidRootPart.Position).Magnitude
        local bDist = (b.Position - HumanoidRootPart.Position).Magnitude
        return aDist < bDist
    end)

    for i, meshPart in ipairs(meshParts) do
        if isPoliceNearby() or isPlayerHurt() then return end
        if meshPart.Transparency == 1 then return end

        local function plrTween(destination)
            local char = Player.Character
            if not char or not char.PrimaryPart then return end

            local distance = (char.PrimaryPart.Position - destination).Magnitude
            local tweenDuration = distance / Config.playerSpeed

            local TweenInfoToUse = TweenInfo.new(
                tweenDuration,
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.Out
            )

            local TweenValue = Instance.new("CFrameValue")
            TweenValue.Value = char:GetPivot()

            TweenValue.Changed:Connect(function(newCFrame)
                char:PivotTo(newCFrame)
            end)

            local targetCFrame = CFrame.new(destination)
            local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
            tween:Play()
            tween.Completed:Wait()
            TweenValue:Destroy()
        end

        plrTween(meshPart.Position)
        local code = meshPart.Parent.Name == "-manage" and Codes.money or Codes.items
        local args = {meshPart, code, true}
        RemoteEvents.rob:FireServer(unpack(args))
        task.wait(Config.proximityPromptTime)
        args[3] = false
        RemoteEvents.rob:FireServer(unpack(args))
        task.wait(0.1)
    end
end

game:GetService("CoreGui").DescendantAdded:Connect(function(descendant)
    if descendant.Name == "ErrorPrompt" or descendant.Name == "ErrorTitle" then
        task.wait(0.5)
        local scriptURL = ""
        
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport('loadstring(game:HttpGet("' .. scriptURL .. '"))()')
        elseif queue_on_teleport then
            queue_on_teleport('loadstring(game:HttpGet("' .. scriptURL .. '"))()')
        elseif queueonteleport then
            queueonteleport('loadstring(game:HttpGet("' .. scriptURL .. '"))()')
        end
        
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == LocalPlayer then
        local scriptURL = "https://pastebin.com/raw/XXXXXX"
        
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport('loadstring(game:HttpGet("' .. scriptURL .. '"))()')
        elseif queue_on_teleport then
            queue_on_teleport('loadstring(game:HttpGet("' .. scriptURL .. '"))()')
        elseif queueonteleport then
            queueonteleport('loadstring(game:HttpGet("' .. scriptURL .. '"))()')
        end
    end
end)

while true do
    local team = Player.Team
    local teamName = team and team.Name or "None"

    if teamName == "Prisoner" then
        sendNotification("Arrested", "Waiting to be released")
        wait(5)
    else
        local Window = OrionLib:MakeWindow({
            Name = "Heavenly | https://discord.gg/dwrFAZRhGt ",
            HidePremium = false, 
            SaveConfig = true, 
            ConfigFolder = "Heavenly",
            IntroEnabled = false,
            IntroText = "Loading Autorob",
            IntroIcon = "rbxassetid://140458594132153",
            Icon = "rbxassetid://140458594132153"
        })

        local AutoRobTab = Window:MakeTab({
            Name = "AutoRob",
            Icon = "rbxassetid://10747364031",
            PremiumOnly = false,
        })

        local SettingsTab = Window:MakeTab({
            Name = "Settings",
            Icon = "rbxassetid://10734950309",
            PremiumOnly = false
        })

        AutoRobTab:AddSection({Name = "AutoRob"})   
        AutoRobTab:AddParagraph("How It Works","Automatically robs bank, club, jeweler and containers.")

        local configFileName = "Heavenly odersoConfigRob.json"

        local function loadConfig()
            if isfile(configFileName) then
                local data = readfile(configFileName)
                local success, config = pcall(function() return HttpService:JSONDecode(data) end)
                if success and config then
                    State.autorobToggle = config.autorobToggle or false
                    State.autoSellToggle = config.autoSellToggle or false
                    Config.vehicleSpeed = config.vehicleSpeed or 140 
                    Config.playerSpeed = config.playerSpeed or 25
                end
            end
        end

        local function saveConfig()
            local config = {
                autorobToggle = State.autorobToggle,
                autoSellToggle = State.autoSellToggle,
                vehicleSpeed = Config.vehicleSpeed,
                playerSpeed = Config.playerSpeed
            }
            local json = HttpService:JSONEncode(config)
            writefile(configFileName, json)
        end

        loadConfig()

        SettingsTab:AddSlider({
            Name = "Vehicle Speed",
            Min = 80, 
            Max = 140, 
            Default = Config.vehicleSpeed,
            Color = Color3.fromRGB(85,170,255),
            Increment = 5,
            ValueName = "speed",
            Callback = function(Value)
                Config.vehicleSpeed = Value
                saveConfig()
            end    
        })

        SettingsTab:AddSlider({
            Name = "Player Speed",
            Min = 16, 
            Max = 30, 
            Default = Config.playerSpeed,
            Color = Color3.fromRGB(85,170,255),
            Increment = 2,
            ValueName = "speed",
            Callback = function(Value)
                Config.playerSpeed = Value
                saveConfig()
            end    
        })

        SettingsTab:AddButton({
            Name = "Reset Config",
            Callback = function()
                if isfile(configFileName) then
                    delfile(configFileName)
                end
                State.autorobToggle = false
                State.autoSellToggle = false
                Config.vehicleSpeed = 140
                Config.playerSpeed = 25
                saveConfig()
                sendNotification("Settings Reset", "All settings reset to default")
            end
        })

        local autorobToggleUI = AutoRobTab:AddToggle({
            Name = "Autorob",
            Default = true,
            Callback = function(Value)
                State.autorobToggle = Value
                saveConfig()
            end    
        })

        local autoSellToggleUI = AutoRobTab:AddToggle({
            Name = "Auto-Sell",
            Default = true,
            Callback = function(Value)
                State.autoSellToggle = Value
                saveConfig()
            end    
        })

        autorobToggleUI:Set(State.autorobToggle)
        autoSellToggleUI:Set(State.autoSellToggle)

        local args = {"Bomb", "Dealer"}
        RemoteEvents.sell:FireServer(unpack(args))

        local function SpawnBomb()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
            task.wait(0.5)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.1)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end

        local function JumpOut()
            local character = Player.Character or Player.CharacterAdded:Wait()
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid and humanoid.SeatPart then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end

        local function ensurePlayerInVehicle()
            local vehicle = workspace:FindFirstChild("Vehicles") and workspace.Vehicles:FindFirstChild(Player.Name)
            local character = Player.Character or Player.CharacterAdded:Wait()

            if vehicle and character then
                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                local driveSeat = vehicle:FindFirstChild("DriveSeat")

                if humanoid and driveSeat and humanoid.SeatPart ~= driveSeat then
                    driveSeat:Sit(humanoid)
                end
            end
        end

        local function clickAtCoordinates(scaleX, scaleY, duration)
            local camera = Workspace.CurrentCamera
            local screenWidth = camera.ViewportSize.X
            local screenHeight = camera.ViewportSize.Y
            local absoluteX = screenWidth * scaleX
            local absoluteY = screenHeight * scaleY
                    
            VirtualInputManager:SendMouseButtonEvent(absoluteX, absoluteY, 0, true, game, 0)  
                    
            if duration and duration > 0 then
                task.wait(duration)  
            end
                    
            VirtualInputManager:SendMouseButtonEvent(absoluteX, absoluteY, 0, false, game, 0) 
        end

        local function plrTween(destination)
            local char = Player.Character
            if not char or not char.PrimaryPart then return end

            local distance = (char.PrimaryPart.Position - destination).Magnitude
            local tweenDuration = distance / Config.playerSpeed

            local TweenInfoToUse = TweenInfo.new(
                tweenDuration,
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.Out
            )

            local TweenValue = Instance.new("CFrameValue")
            TweenValue.Value = char:GetPivot()

            TweenValue.Changed:Connect(function(newCFrame)
                char:PivotTo(newCFrame)
            end)

            local targetCFrame = CFrame.new(destination)
            local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
            tween:Play()
            tween.Completed:Wait()
            TweenValue:Destroy()
        end

        local teleportActive = false
        local customCamConnection = nil
        local overlayGuis = {}
        local targetPosition = nil
        local isSpecialTeleport = false
        local seatCheckConnection = nil
        local lastSafeFlyTime = 0  
        local SAFEFLY_COOLDOWN = 5 
        local SAFEFLY_DISTANCE = 700

        local function inCar()
            local v = workspace.Vehicles:FindFirstChild(Player.Name)
            local h = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
            if v and h and not h.SeatPart then 
                local s = v:FindFirstChild("DriveSeat")
                if s then 
                    s:Sit(h)
                    task.wait(0.3)
                end 
            end
        end

        local function startSeatCheck()
            if seatCheckConnection then seatCheckConnection:Disconnect() end
            seatCheckConnection = RunService.Heartbeat:Connect(function()
                local v = workspace.Vehicles:FindFirstChild(Player.Name)
                local h = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
                if v and h and not h.SeatPart then 
                    local s = v:FindFirstChild("DriveSeat")
                    if s then s:Sit(h) end 
                end
            end)
        end

        local function stopSeatCheck()
            if seatCheckConnection then 
                seatCheckConnection:Disconnect()
                seatCheckConnection = nil 
            end
        end

        local function makeInvisible(character)
            for _, obj in ipairs(character:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Transparency = 1
                    obj.LocalTransparencyModifier = 1
                elseif obj:IsA("MeshPart") then
                    obj.Transparency = 1
                    obj.LocalTransparencyModifier = 1
                elseif obj:IsA("SpecialMesh") then
                    if obj.Parent and obj.Parent:IsA("BasePart") then
                        obj.Parent.Transparency = 1
                        obj.Parent.LocalTransparencyModifier = 1
                    end
                elseif obj:IsA("Accessory") and obj:FindFirstChild("Handle") then
                    obj.Handle.Transparency = 1
                    obj.Handle.LocalTransparencyModifier = 1
                elseif obj:IsA("Decal") then
                    obj.Transparency = 1
                end
            end
        end

        local function makeVisible(character)
            for _, obj in ipairs(character:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
                    obj.Transparency = 0
                    obj.LocalTransparencyModifier = 0
                elseif obj:IsA("MeshPart") and obj.Name ~= "HumanoidRootPart" then
                    obj.Transparency = 0
                    obj.LocalTransparencyModifier = 0
                elseif obj:IsA("SpecialMesh") then
                    if obj.Parent and obj.Parent:IsA("BasePart") and obj.Parent.Name ~= "HumanoidRootPart" then
                        obj.Parent.Transparency = 0
                        obj.Parent.LocalTransparencyModifier = 0
                    end
                elseif obj:IsA("Accessory") and obj:FindFirstChild("Handle") then
                    obj.Handle.Transparency = 0
                    obj.Handle.LocalTransparencyModifier = 0
                elseif obj:IsA("Decal") then
                    obj.Transparency = 0
                end
            end
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Transparency = 1
                hrp.LocalTransparencyModifier = 1
            end
        end

        local visibilityConnection
        if visibilityConnection then visibilityConnection:Disconnect() end
        visibilityConnection = RunService.RenderStepped:Connect(function()
            local char = Player.Character
            if not char then return end
            
            local hum = char:FindFirstChildOfClass("Humanoid")
            local inDriveSeat = (hum and hum.SeatPart and hum.SeatPart.Name == "DriveSeat")
            
            if inDriveSeat or State.teleportActive then
                makeInvisible(char)
            else
                makeVisible(char)
            end
        end)

        local function smoothTweenModel(v, targetCF, dur, onComplete)
            if not v.PrimaryPart then return end
            
            
            local currentCF = v:GetPrimaryPartCFrame()
            local startPos = currentCF.Position
            local targetPos = targetCF.Position
            local distance = (targetPos - startPos).Magnitude
            
            
            local segments = math.ceil(distance / 100)
            if segments > 1 then
                local segmentDuration = dur / segments
                
                for i = 1, segments do
                    local progress = i / segments
                    local intermediatePos = startPos:Lerp(targetPos, progress)
                    
                    
                    local heightOffset = math.min(distance * 0.1, 15) 
                    local height = -heightOffset * math.sin(math.pi * progress)
                    
                    intermediatePos = intermediatePos + Vector3.new(0, height, 0)
                    
                    local intermediateCF = CFrame.new(intermediatePos) * (targetCF - targetCF.Position)
                    
                    local cv = Instance.new("CFrameValue")
                    cv.Value = v:GetPrimaryPartCFrame()
                    
                    cv:GetPropertyChangedSignal("Value"):Connect(function()
                        if v and v.PrimaryPart then
                            v:SetPrimaryPartCFrame(cv.Value)
                            
                            for _, p in pairs(v:GetDescendants()) do
                                if p:IsA("BasePart") then
                                    p.AssemblyLinearVelocity = Vector3.zero
                                    p.AssemblyAngularVelocity = Vector3.zero
                                    p.Velocity = Vector3.zero
                                    p.RotVelocity = Vector3.zero
                                end
                            end
                        end
                    end)
                    
                    local tw = TweenService:Create(cv, TweenInfo.new(segmentDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Value = intermediateCF})
                    tw:Play()
                    tw.Completed:Wait()
                    cv:Destroy()
                    
                    
                    if i < segments then
                        task.wait(Config.tweenDelay)
                    end
                end
            else
                
                local cv = Instance.new("CFrameValue")
                cv.Value = v:GetPrimaryPartCFrame()
                
                cv:GetPropertyChangedSignal("Value"):Connect(function()
                    if v and v.PrimaryPart then
                        v:SetPrimaryPartCFrame(cv.Value)
                        for _, p in pairs(v:GetDescendants()) do
                            if p:IsA("BasePart") then
                                p.AssemblyLinearVelocity = Vector3.zero
                                p.AssemblyAngularVelocity = Vector3.zero
                                p.Velocity = Vector3.zero
                                p.RotVelocity = Vector3.zero
                            end
                        end
                    end
                end)
                
                local tw = TweenService:Create(cv, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Value = targetCF})
                tw:Play()
                tw.Completed:Wait()
                cv:Destroy()
            end
            
            if onComplete then onComplete() end
        end

        local function tweenTo(destination)
            local targetCF
            if typeof(destination) == "CFrame" then
                targetCF = destination
            elseif typeof(destination) == "Vector3" then
                targetCF = CFrame.new(destination)
            else
                return
            end

            local v = workspace.Vehicles:FindFirstChild(Player.Name)
            if not v or not v.PrimaryPart then 
                return 
            end
            
            local skipSafeFly = false

            local currentPos = v.PrimaryPart.Position
            local targetPos = targetCF.Position
            local distance = (targetPos - currentPos).Magnitude

            if distance < SAFEFLY_DISTANCE then
                skipSafeFly = true
            end

            State.teleportActive = true
            State.isSpecialTeleport = false
            
            inCar()
            task.wait(1)
            
            local char = Player.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum or not hum.SeatPart or hum.SeatPart.Name ~= "DriveSeat" then
                    return
                end
            end
            
            startSeatCheck()

            
            local safeSpeed = getSafeSpeed(distance, targetPos)
            local totalDur = distance / safeSpeed
            
            smoothTweenModel(v, targetCF, totalDur, function()
                stopSeatCheck()
                State.teleportActive = false
                targetPosition = nil
            end)
        end

        local function MoveToDealer()
            local vehicle = workspace.Vehicles:FindFirstChild(Player.Name)
            if not vehicle then
                sendNotification("Error", "No vehicle found.")
                return
            end

            local dealers = workspace:FindFirstChild("Dealers")
            if not dealers then
                sendNotification("Error", "Dealers not found.")
                tweenTo(Locations.rejoin)
                Player:Kick("Heavenly oderso Autorob - CRACKED BY VOIDHUB")
                return
            end

            local closest, shortest = nil, math.huge
            for _, dealer in pairs(dealers:GetChildren()) do
                if dealer:FindFirstChild("Head") then
                    local dist = (Character.HumanoidRootPart.Position - dealer.Head.Position).Magnitude
                    if dist < shortest then
                        shortest = dist
                        closest = dealer.Head
                    end
                end
            end

            if not closest then
                sendNotification("Error", "Dealers not found.")
                tweenTo(Locations.rejoin)
                Player:Kick("Heavenly oderso Autorob - CRACKED BY VOIDHUB")
                return
            end

            local destination1 = closest.Position + Vector3.new(0, 5, 0)
            tweenTo(destination1)
        end

        local function checkContainer(container)
            for _, item in ipairs(container:GetChildren()) do
                if item:IsA("Tool") and item.Name == "Bomb" then
                    return true
                end
            end
            return false
        end

        local function hasBomb()
            return checkContainer(Player.Backpack) or checkContainer(Player.Character)
        end

        local function checkSafeRobStatus()
            local robberiesFolder = Workspace:FindFirstChild("Robberies")
            if not robberiesFolder then return false end

            local jewelerSafeFolder = robberiesFolder:FindFirstChild("Jeweler Safe Robbery")
            if not jewelerSafeFolder then return false end

            local jewelerFolder = jewelerSafeFolder:FindFirstChild("Jeweler")
            if not jewelerFolder then return false end

            local doorFolder = jewelerFolder:FindFirstChild("Door")
            if not doorFolder then return false end

            local targetPart
            for _, v in ipairs(doorFolder:GetDescendants()) do
                if v:IsA("BasePart") then
                    targetPart = v
                    break
                end
            end

            if not targetPart then return false end

            local _, y, _ = targetPart.CFrame:ToEulerAnglesYXZ()
            y = math.deg(y) % 360

            return math.abs(y - 90) < 10 or math.abs(y - 270) < 10
        end

        while task.wait() do
            if State.autorobToggle == true then
                local character = Player.Character or Player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local camera = Workspace.CurrentCamera

                local function lockCamera()
                    local rootPart = character.HumanoidRootPart
                    local backOffset = rootPart.CFrame.LookVector * -6
                    local cameraPosition = rootPart.Position + backOffset + Vector3.new(0, 5, 0) 
                    local lookAtPosition = rootPart.Position + Vector3.new(0, 2, 0) 
                    camera.CFrame = CFrame.new(cameraPosition, lookAtPosition)
                end

                RunService.Heartbeat:Connect(lockCamera)
                
                ensurePlayerInVehicle()
                task.wait(.5)
                clickAtCoordinates(0.5, 0.9)
                task.wait(.5)
                tweenTo(Locations.start)
                
                local musikPart = Workspace.Robberies["Club Robbery"].Club.Door.Accessory.Black
                local bankPart = Workspace.Robberies.BankRobbery.VaultDoor["Meshes/Tresor_Plane (2)"]
                local bankLight = Workspace.Robberies.BankRobbery.LightGreen.Light
                local bankLight2 = Workspace.Robberies.BankRobbery.LightRed.Light
                
                if musikPart.Rotation == Vector3.new(180, 0, 180) then
                    clickAtCoordinates(0.5, 0.9)
                    sendNotification("Safe is open", "Starting Robbery")
                    
                    if not hasBomb() then
                        ensurePlayerInVehicle()
                        MoveToDealer()
                        task.wait(0.5)
                        local args = {"Bomb", "Dealer"}
                        RemoteEvents.buy:FireServer(unpack(args))
                        task.wait(0.5)
                    end

                    ensurePlayerInVehicle()
                    task.wait(0.5)
                    tweenTo(Locations.club.position)
                    task.wait(0.5)
                    JumpOut()
                    task.wait(0.5)

                    local args = {"Bomb"}
                    RemoteEvents.equip:FireServer(unpack(args))
                    task.wait(0.5)

                    plrTween(Locations.club.stand)
                    task.wait(0.5)
                    local tool = Player.Character:FindFirstChild("Bomb")
                    if tool then
                        SpawnBomb()
                    end
                    task.wait(0.5)
                    RemoteEvents.bomb:FireServer()
                    plrTween(Locations.club.safe)
                    task.wait(1.8)
                    plrTween(Locations.club.stand)

                    local safeFolder = Workspace.Robberies["Club Robbery"].Club
                    local itemsFolder = safeFolder:FindFirstChild("Items")
                    local moneyFolder = safeFolder:FindFirstChild("Money")
                    
                    for i = 1, 25 do
                        if isPoliceNearby() then 
                            ensurePlayerInVehicle()
                            break 
                        end
                        lootVisibleMeshParts(itemsFolder)
                        lootVisibleMeshParts(moneyFolder)
                        task.wait(0.25)
                    end

                    ensurePlayerInVehicle()

                    if State.autoSellToggle == true then
                        ensurePlayerInVehicle()
                        MoveToDealer()
                        task.wait(0.5)

                        local sellItems = {"MP5", "Glock 17", "Machete", "Gold"}
                        for _, item in ipairs(sellItems) do
                            local args = {item, "Dealer"}
                            RemoteEvents.sell:FireServer(unpack(args))
                        end

                        tweenTo(Locations.start)
                    end

                    ensurePlayerInVehicle()
                    tweenTo(Locations.start)

                else
                    sendNotification("Safe is not open", "Going to Bank")
                end

                if bankLight2.Enabled == false and bankLight.Enabled == true then
                    clickAtCoordinates(0.5, 0.9)
                    sendNotification("Bank is open", "Starting Robbery")
                    
                    ensurePlayerInVehicle()
                    if not hasBomb() then
                        ensurePlayerInVehicle()
                        MoveToDealer()
                        task.wait(0.5)
                        local args = {"Bomb", "Dealer"}
                        RemoteEvents.buy:FireServer(unpack(args))
                        task.wait(0.5)
                    end
                    
                    tweenTo(Locations.bank)
                    tweenTo(Locations.bank)
                    JumpOut()
                    task.wait(1.5)
                    plrTween(Vector3.new(-1242.367919921875, 7.749999046325684, 3144.705322265625))
                    task.wait(.5)
                    local args = {"Bomb"}
                    RemoteEvents.equip:FireServer(unpack(args))
                    task.wait(.5)
                    local tool = Player.Character:FindFirstChild("Bomb")
                    if tool then
                        SpawnBomb()
                    end
                    RemoteEvents.bomb:FireServer()
                    plrTween(Vector3.new(-1246.291015625, 7.749999046325684, 3120.8505859375))
                    task.wait(2.9)
                    local bankCollectPositions = {
                        Vector3.new(-1251.5240478515625, 7.723498821258545, 3127.464111328125),
                        Vector3.new(-1247.194091796875, 7.723498821258545, 3102.603271484375),
                        Vector3.new(-1231.880859375, 7.723498821258545, 3123.473876953125),
                        Vector3.new(-1236.9227294921875, 7.723498821258545, 3099.447509765625)
                    }
                    
                    local bankRobberyFolder = Workspace.Robberies.BankRobbery
                    
                    for _, position in ipairs(bankCollectPositions) do
                        if isPoliceNearby() then 
                            ensurePlayerInVehicle()
                            break 
                        end
                        if Character and Character.PrimaryPart then
                            Character:SetPrimaryPartCFrame(CFrame.new(position))
                        end
                        
                        local collectStartTime = tick()
                        while tick() - collectStartTime < 4.5 do
                            if isPoliceNearby() then 
                                ensurePlayerInVehicle()
                                break 
                            end
                            lootVisibleMeshParts(bankRobberyFolder)
                            task.wait(0.5)
                        end
                    end
                    ensurePlayerInVehicle() 
                    if State.autoSellToggle == true then
                        task.wait(.5)
                        MoveToDealer()
                        task.wait(.5)
                        MoveToDealer()
                        task.wait(.5)
                        local args = {"Gold", "Dealer"}
                        RemoteEvents.sell:FireServer(unpack(args))
                        RemoteEvents.sell:FireServer(unpack(args))
                        RemoteEvents.sell:FireServer(unpack(args))
                        task.wait(.5)
                    end
                else
                    sendNotification("Bank is not open", "Going to Jeweler Safe")
                end
                tweenTo(Locations.jeweler)
                task.wait(0.5)

                if checkSafeRobStatus() then
                    sendNotification("Jeweler is open", "Starting Robbery")
                    ensurePlayerInVehicle()
                    task.wait(0.5)
                    MoveToDealer()
                    task.wait(0.5)
                    local args = {"Bomb", "Dealer"}
                    RemoteEvents.buy:FireServer(unpack(args))
                    task.wait(0.5)
                    tweenTo(Vector3.new(-464.14019775390625, 39.09627151489258, 3556.745849609375))
                    task.wait(0.5)
                    JumpOut()
                    task.wait(0.5)
                    plrTween(Vector3.new(-432.54534912109375, 21.248910903930664, 3553.118896484375))
                    task.wait(0.5)
                    local args = {"Bomb"}
                    RemoteEvents.equip:FireServer(unpack(args))
                    task.wait(0.5)
                    local character = Player.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local hrp = character.HumanoidRootPart
                        local currentCFrame = hrp.CFrame
                        local rotation = CFrame.Angles(0, math.rad(90), 0)
                        hrp.CFrame = currentCFrame * rotation
                    end
                    task.wait(0.5)
                    local tool = Player.Character:FindFirstChild("Bomb")
                    if tool then
                        SpawnBomb()
                        task.wait(0.5)
                        RemoteEvents.bomb:FireServer()
                    end

                    task.wait(0.5)
                    plrTween(Vector3.new(-414.9098205566406, 21.223400115966797, 3555.1474609375))
                    task.wait(2.1)
                    plrTween(Vector3.new(-438.992919921875, 21.223411560058594, 3553.45166015625))         
                    
                    local jewelerSafeFolder = Workspace.Robberies:FindFirstChild("Jeweler Safe Robbery")
                    if jewelerSafeFolder then
                        local jewelerFolder = jewelerSafeFolder:FindFirstChild("Jeweler")
                        if jewelerFolder then
                            local itemsFolder = jewelerFolder:FindFirstChild("Items")
                            local moneyFolder = jewelerFolder:FindFirstChild("Money")
                            for i = 1, 25 do
                                if isPoliceNearby() then 
                                    ensurePlayerInVehicle()
                                    break 
                                end
                                lootVisibleMeshParts(itemsFolder)
                                lootVisibleMeshParts(moneyFolder)
                                task.wait(0.25)
                            end
                        end
                    end
                    
                    if State.autoSellToggle == true then
                        ensurePlayerInVehicle()
                        task.wait(0.5)
                        MoveToDealer()
                        task.wait(0.5)
                        local args = {"Gold", "Dealer"}
                        RemoteEvents.sell:FireServer(unpack(args))
                        RemoteEvents.sell:FireServer(unpack(args))
                        RemoteEvents.sell:FireServer(unpack(args))
                    end
                    ensurePlayerInVehicle()
                    task.wait(0.2)
                    tweenTo(Locations.container)
                else
                    sendNotification("Jeweler not open", "Checking Containers")
                    ensurePlayerInVehicle()
                    task.wait(0.2)
                    tweenTo(Locations.container)
                end
                
                tweenTo(Vector3.new(1058.7470703125, 5.733738899230957, 2218.6943359375))
                task.wait(.5)
                
                local containerFolder = Workspace.Robberies:WaitForChild("ContainerRobberies")
                local containers = {}

                local function getContainerRobberies(folder)
                    local result = {}
                    for _, spawn in ipairs(folder:GetChildren()) do
                        if spawn:FindFirstChild("ContainerRobbery") then
                            table.insert(result, spawn.ContainerRobbery)
                        end
                    end
                    return result
                end

                containers = getContainerRobberies(containerFolder)
                local container1 = containers[1]
                local container2 = containers[2]

                local con1Planks = container1:FindFirstChild("WoodPlanks", true)
                local con2Planks = container2:FindFirstChild("WoodPlanks", true)

                if con1Planks.Transparency == 1 then
                    ensurePlayerInVehicle()
                    task.wait(.5)
                    MoveToDealer()
                    task.wait(.5)
                    local args = {"Bomb", "Dealer"}
                    RemoteEvents.buy:FireServer(unpack(args))
                    task.wait(0.5)
                    tweenTo(Vector3.new(1189.2611083984375, 28.834312438964844, 2169.53857421875))
                    tweenTo(Vector3.new(1189.2611083984375, 28.834312438964844, 2169.53857421875))
                    task.wait(0.5)
                    JumpOut()
                    task.wait(0.5)
                    plrTween(con1Planks.Position)
                    task.wait(0.5)
                    local args = {"Bomb"}
                    RemoteEvents.equip:FireServer(unpack(args))
                    task.wait(0.5)
                    local tool = Player.Character:FindFirstChild("Bomb")
                    if tool then
                        SpawnBomb()
                    end
                    task.wait(.5)
                    RemoteEvents.bomb:FireServer()
                    ensurePlayerInVehicle()
                    tweenTo(Locations.container)
                    task.wait(2)
                    tweenTo(Vector3.new(1189.2611083984375, 28.834312438964844, 2169.53857421875))
                    JumpOut()
                    task.wait(.5)
                    plrTween(con1Planks.Position)
                    for i = 1, 4 do
                        if isPoliceNearby() then 
                            ensurePlayerInVehicle()
                            break 
                        end
                        interactWithVisibleMeshParts2(container1:FindFirstChild("Items"))
                        interactWithVisibleMeshParts2(container1:FindFirstChild("Money"))
                        task.wait(0.2)
                    end
                    task.wait(.2)
                    ensurePlayerInVehicle()
                    task.wait(.2)
                    tweenTo(Locations.container)
                else
                    sendNotification("Container 1 not open", "Going to Container 2")
                end

                if con2Planks.Transparency == 1 then
                    ensurePlayerInVehicle()
                    task.wait(.5)
                    MoveToDealer()
                    task.wait(.5)
                    local args = {"Bomb", "Dealer"}
                    RemoteEvents.buy:FireServer(unpack(args))
                    task.wait(0.5)
                    tweenTo(Vector3.new(1105.1708984375, 28.8126277923584, 2183.989013671875))
                    task.wait(0.5)
                    JumpOut()
                    task.wait(0.5)
                    plrTween(con2Planks.Position)
                    task.wait(0.5)
                    local args = {"Bomb"}
                    RemoteEvents.equip:FireServer(unpack(args))
                    task.wait(0.5)
                    local tool = Player.Character:FindFirstChild("Bomb")
                    if tool then
                        SpawnBomb()
                    end
                    task.wait(.5)
                    RemoteEvents.bomb:FireServer()
                    ensurePlayerInVehicle()
                    tweenTo(Locations.container)
                    task.wait(2)
                    tweenTo(Vector3.new(1105.1708984375, 28.8126277923584, 2183.989013671875))
                    JumpOut()
                    task.wait(.5)
                    plrTween(con2Planks.Position)
                    for i = 1, 4 do
                        if isPoliceNearby() then 
                            ensurePlayerInVehicle()
                            break 
                        end
                        interactWithVisibleMeshParts2(container2:FindFirstChild("Items"))
                        interactWithVisibleMeshParts2(container2:FindFirstChild("Money"))
                        task.wait(0.2)
                    end
                    task.wait(.5)
                    ensurePlayerInVehicle()
                    tweenTo(Locations.rejoin)
                    Player:Kick("Heavenly oderso Autorob - CRACKED BY VOIDHUB")
                else
                    sendNotification("Container 2 not open", "Hopping Server")
                end

                ensurePlayerInVehicle()
                tweenTo(Locations.rejoin)
                Player:Kick("Heavenly oderso Autorob - CRACKED BY VOIDHUB")
            end
        end

        OrionLib:Init()
    end
    wait(1)
end

local function bypassAC()
    pcall(function()
        for i,v in pairs(getgc(true)) do
            if type(v) == "function" and getfenv(v).script and getfenv(v).script.Name == "Code" then
                hookfunction(v, function() end)
            end
        end
    end)
end

bypassAC()
