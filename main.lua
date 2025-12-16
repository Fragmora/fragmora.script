-- main2.lua - Komplette All-in-One Version
local function MainAllInOne(Window)
    -- ========== GLOBALE VARIABLEN ==========
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
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

    -- ========== COMBAT TAB ==========
    local tab1 = Window:Tab({ Title = "Combat", Icon = "target" })

    -- AIMBOT SYSTEM
    local aimbotEnabled = false
    local triggerbotEnabled = false
    local aimbotFOV = 100
    local smoothness = 0.15
    local lockedTarget = nil
    local lastAimbotUpdate = 0
    local AIMBOT_UPDATE_INTERVAL = 0.05

    function getClosestTarget()
        local closest, shortest = nil, aimbotFOV
        local cameraPos = Camera.CFrame.Position
        local screenCenter = Vector2_new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local head = plr.Character:FindFirstChild("Head")
                local humanoid = plr.Character:FindFirstChild("Humanoid")
                
                if head and humanoid and humanoid.Health > 0 then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
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
        return closest
    end
    
    tab1:Section({ Title = "Aimbot Settings" })
    
    -- OPTIMIERTER AIMBOT CODE
    local lastRenderTime = 0
    local RENDER_THROTTLE = 0.03
    
    RunService.RenderStepped:Connect(function()
        local currentTime = tick()
        
        if aimbotEnabled and (currentTime - lastAimbotUpdate) > AIMBOT_UPDATE_INTERVAL then
            local screenCenter = Vector2_new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            
            if not lockedTarget or not lockedTarget.Character or not lockedTarget.Character:FindFirstChild("Humanoid") or lockedTarget.Character.Humanoid.Health <= 0 then
                lockedTarget = getClosestTarget()
            else
                local head = lockedTarget.Character.Head
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (screenCenter - Vector2_new(screenPos.X, screenPos.Y)).Magnitude
                    if dist > aimbotFOV then
                        lockedTarget = getClosestTarget()
                    end
                else
                    lockedTarget = getClosestTarget()
                end
            end

            if lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild("Head") then
                local head = lockedTarget.Character.Head
                local targetCF = CFrame_new(Camera.CFrame.Position, head.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCF, smoothness)
            end
            
            lastAimbotUpdate = currentTime
        end

        if triggerbotEnabled and (currentTime - lastRenderTime) > RENDER_THROTTLE then
            if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local mouse = LocalPlayer:GetMouse()
                local target = mouse.Target
                if target and target.Parent and target.Parent:FindFirstChild("Humanoid") then
                    mouse1click()
                end
            end
            lastRenderTime = currentTime
        end
    end)
    
    tab1:Toggle({
        Title = "Aimbot (Right mouse button)",
        Default = false,
        Callback = function(v) aimbotEnabled = v end,
    })
    
    tab1:Slider({
        Title = "Aimbot Strength",
        Step = 10,
        Value = {
            Min = 20,
            Max = 300,
            Default = 100,
        },
        Callback = function(v) aimbotFOV = v end,
    })
    
    local showFOV = false
    local fovRadius = 100
    local fovCircle = Drawing.new("Circle")
    fovCircle.Visible = false
    fovCircle.Thickness = 2
    fovCircle.NumSides = 32
    fovCircle.Color = Color3.fromRGB(0, 255, 255)
    fovCircle.Transparency = 0.5
    fovCircle.Filled = false
    
    tab1:Toggle({
        Title = "Show FOV Circle",
        Default = false,
        Callback = function(val)
            showFOV = val
            fovCircle.Visible = val
        end,
    })
    
    tab1:Slider({
        Title = "FOV Radius",
        Step = 10,
        Value = {
            Min = 50,
            Max = 300,
            Default = 100,
        },
        Callback = function(v)
            fovRadius = v
            fovCircle.Radius = v
        end,
    })
    
    local lastFOVUpdate = 0
    local FOV_UPDATE_INTERVAL = 0.1
    RunService.RenderStepped:Connect(function()
        local currentTime = tick()
        if showFOV and (currentTime - lastFOVUpdate) > FOV_UPDATE_INTERVAL then
            local mouse = UIS:GetMouseLocation()
            fovCircle.Position = Vector2_new(mouse.X, mouse.Y + 36)
            lastFOVUpdate = currentTime
        end
    end)
    
    tab1:Toggle({
        Title = "Triggerbot",
        Default = false,
        Callback = function(v) triggerbotEnabled = v end,
    })
    
    -- Mobile Aimbot Menu
    local aimbotMenuVisible = false
    local AimButton = Instance.new("TextButton")
    AimButton.Size = UDim2.new(0, 80, 0, 80)
    AimButton.Position = UDim2.new(0.5, -40, 0.8, -40)
    AimButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    AimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AimButton.Text = "🎯"
    AimButton.TextScaled = true
    AimButton.BorderSizePixel = 0
    AimButton.AnchorPoint = Vector2.new(0.5, 0.5)
    AimButton.Active = true
    AimButton.Draggable = true
    AimButton.Visible = false
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 20)
    UICorner.Parent = AimButton
    
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
        else
            AimButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end
    end)
    
    tab1:Toggle({
        Title = "Mobile Aimbot Menu",
        Default = false,
        Callback = function(state)
            aimbotMenuVisible = state
            AimButton.Visible = state
        end
    })
    
    -- Weapon Settings
    tab1:Section({ Title = "Weapon Settings" })
    
    local weaponAttributes = {
        aimFOVEnabled = false,
        autoRefillEnabled = false,
        crosshairActive = false,
        rapidFireEnabled = false,
        noRecoilEnabled = false
    }
    
    local lastWeaponUpdate = 0
    local WEAPON_UPDATE_INTERVAL = 0.2
    
    local function updateWeaponAttributes()
        local currentTime = tick()
        if (currentTime - lastWeaponUpdate) < WEAPON_UPDATE_INTERVAL then return end
        
        local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if not tool then
            lastWeaponUpdate = currentTime
            return
        end

        if weaponAttributes.aimFOVEnabled then
            tool:SetAttribute("AimFieldOfView", 70)
        end

        if weaponAttributes.autoRefillEnabled then
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

        if weaponAttributes.crosshairActive then
            tool:SetAttribute("CrosshairSize", 1)
        end

        if weaponAttributes.rapidFireEnabled then
            tool:SetAttribute("ShootDelay", 0)
            tool:SetAttribute("Automatic", true)
        end

        if weaponAttributes.noRecoilEnabled then
            tool:SetAttribute("Recoil", 0)
            tool:SetAttribute("Instability", 0)
        end
        
        lastWeaponUpdate = currentTime
    end
    
    task_spawn(function()
        while true do
            updateWeaponAttributes()
            task_wait(WEAPON_UPDATE_INTERVAL)
        end
    end)
    
    tab1:Toggle({
        Title = "Aim FOV",
        Default = false,
        Callback = function(v)
            weaponAttributes.aimFOVEnabled = v
        end
    })
    
    tab1:Toggle({
        Title = "Auto Reload",
        Default = false,
        Callback = function(Value)
            weaponAttributes.autoRefillEnabled = Value
        end
    })
    
    tab1:Toggle({
        Title = "Small Crosshair",
        Default = false,
        Callback = function(Value)
            weaponAttributes.crosshairActive = Value
        end
    })
    
    tab1:Toggle({
        Title = "Rapid Fire",
        Default = false,
        Callback = function(Value)
            weaponAttributes.rapidFireEnabled = Value
        end
    })
    
    tab1:Toggle({
        Title = "No Recoil",
        Default = false,
        Callback = function(Value)
            weaponAttributes.noRecoilEnabled = Value
        end
    })
    
    -- ========== VISUALS TAB ==========
    local tab2 = Window:Tab({ Title = "Visuals", Icon = "eye" })
    
    tab2:Section({ Title = "Visuals Settings" })
    
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
    
    tab2:Toggle({
        Title = "Player ESP",
        Default = false,
        Callback = function(v)
            state.espEnabled = v
            if not v then
                for _,e in pairs(state.espObjects) do
                    e.billboard:Destroy()
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
    
    tab2:Toggle({Title = "Show Wanted", Default = true, Callback = function(v) state.showWanted = v end})
    tab2:Toggle({Title = "Show Names", Default = true, Callback = function(v) state.showNames = v end})
    tab2:Toggle({Title = "Show Teams", Default = true, Callback = function(v) state.showTeams = v end})
    tab2:Toggle({Title = "Show Distance", Default = true, Callback = function(v) state.showDistance = v end})
    tab2:Toggle({Title = "Show Health", Default = true, Callback = function(v) state.showHealth = v end})
    tab2:Toggle({Title = "Show Equipped", Default = true, Callback = function(v) state.showEquipped = v end})
    
    tab2:Slider({
        Title = "ESP Distance",
        Step = 50,
        Value = {
            Min = 100,
            Max = 2000,
            Default = 1000,
        },
        Callback = function(value)
            state.espDistance = value
        end
    })
    
    -- Car ESP
    local carESPEnabled = false
    local highlights = {}
    local lastCarESPUpdate = 0
    local CAR_ESP_UPDATE_INTERVAL = 1
    
    function toggleCarESP(state)
        carESPEnabled = state

        for _, h in pairs(highlights) do
            if h and h.Parent then
                h:Destroy()
            end
        end
        highlights = {}

        if not carESPEnabled then return end

        task_spawn(function()
            while carESPEnabled do
                local currentTime = tick()
                if (currentTime - lastCarESPUpdate) > CAR_ESP_UPDATE_INTERVAL then
                    local vehicles = workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        for _, vehicle in pairs(vehicles:GetChildren()) do
                            if vehicle:IsA("Model") and vehicle:FindFirstChildWhichIsA("BasePart") then
                                local existingHighlight = vehicle:FindFirstChildOfClass("Highlight")
                                if not existingHighlight then
                                    local highlight = Instance.new("Highlight")
                                    highlight.Adornee = vehicle
                                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                                    highlight.FillTransparency = 0.5
                                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    highlight.OutlineTransparency = 0
                                    highlight.Parent = vehicle
                                    table_insert(highlights, highlight)
                                end
                            end
                        end
                    end
                    lastCarESPUpdate = currentTime
                end
                task_wait(CAR_ESP_UPDATE_INTERVAL)
            end
        end)
    end
    
    tab2:Toggle({
        Title = "Car ESP",
        Default = false,
        Callback = function(Value)
            toggleCarESP(Value)
        end
    })
    
    -- ========== TELEPORT TAB ==========
    local tab3 = Window:Tab({ Title = "Teleport", Icon = "map-pin" })
    
    tab3:Section({ Title = "Teleport Settings" })
    
    local teleportActive = false
    local mouse = LocalPlayer:GetMouse()
    
    tab3:Toggle({
        Title = "Left-Click Teleport",
        Default = false,
        Callback = function(v) teleportActive = v end,
    })
    
    mouse.Button1Down:Connect(function()
        if teleportActive and mouse.Hit then
            local char = LocalPlayer.Character
            if char then
                char:MoveTo(mouse.Hit.Position + Vector3_new(0, 3, 0))
            end
        end
    end)
    
    local VehiclesFolder = workspace:WaitForChild("Vehicles")
    
    local function tweenTo(destination)
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if not car then return false end

        if not car.PrimaryPart then
            car.PrimaryPart = car:FindFirstChild("DriveSeat", true) or car:FindFirstChildWhichIsA("BasePart")
        end

        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            local driveSeat = car:FindFirstChild("DriveSeat", true)
            if driveSeat then
                if char.Humanoid.Sit then
                    char.Humanoid.Sit = false
                    task_wait(0.1)
                end
                driveSeat:Sit(char.Humanoid)
                task_wait(0.2)
            end
        end

        if typeof(destination) == "CFrame" then
            destination = destination.Position
        end

        local startPosition = car.PrimaryPart.Position
        local steps = { startPosition + Vector3_new(0, -5, 0), destination + Vector3_new(0, -5, 0), destination }

        for _, targetPos in ipairs(steps) do
            local distance = (car.PrimaryPart.Position - targetPos).Magnitude
            local duration = distance / 175
            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

            local value = Instance.new("CFrameValue")
            value.Value = car:GetPivot()

            value.Changed:Connect(function(newCFrame)
                car:PivotTo(newCFrame)
                if car.PrimaryPart then
                    car.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
                    car.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
                end
            end)

            local tween = TweenService:Create(value, tweenInfo, { Value = CFrame_new(targetPos) })
            tween:Play()
            tween.Completed:Wait()
            value:Destroy()
        end
        
        task_wait(0.5)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") and not char.Humanoid.Sit then
            local driveSeat = car:FindFirstChild("DriveSeat", true)
            if driveSeat then
                driveSeat:Sit(char.Humanoid)
            end
        end
        
        return true
    end
    
    -- Nearest Dealer
    local function teleportToNearestDealer()
        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if not car then return end

        if not car.PrimaryPart then
            car.PrimaryPart = car:FindFirstChild("DriveSeat", true) or car:FindFirstChildWhichIsA("BasePart")
        end

        local closest, dist = nil, math.huge
        for _, dealer in pairs(workspace:WaitForChild("Dealers"):GetChildren()) do
            if dealer:IsA("Model") and dealer.PrimaryPart then
                local d = (LocalPlayer.Character.PrimaryPart.Position - dealer.PrimaryPart.Position).Magnitude
                if d < dist then
                    dist = d
                    closest = dealer
                end
            end
        end

        if not closest then return end

        local dealerPos = closest.PrimaryPart.Position
        local dealerCFrame = closest.PrimaryPart.CFrame
        local tpCFrame = CFrame_new(dealerPos - dealerCFrame.LookVector * -10, dealerPos)

        tweenTo(tpCFrame)
    end
    
    tab3:Button({
        Title = "Nearest Dealer",
        Callback = function()
            teleportToNearestDealer()
        end
    })
    
    -- Work Places
    tab3:Section({ Title = "Work Places" })
    
    local WorkLocations = {
        ["Police Station"] = CFrame.new(-1658.55, 5.619, 2735.71),
        ["Fire Station"] = CFrame.new(-963.32, 5.865, 3895.37),
        ["Bus Company"] = CFrame.new(-1695.80, 5.882, -1274.29),
        ["Truck Company"] = CFrame.new(652.55, 5.638, 1510.85),
    }
    
    local workNames = {}
    for name, _ in pairs(WorkLocations) do table_insert(workNames, name) end
    
    local selectedWork = workNames[1]
    local workDropdown = tab3:Dropdown({
        Title = "Work Places",
        Values = workNames,
        Value = selectedWork,
        Callback = function(option)
            selectedWork = option
        end
    })
    
    tab3:Button({
        Title = "Teleport to Work Place",
        Callback = function()
            if selectedWork and WorkLocations[selectedWork] then
                tweenTo(WorkLocations[selectedWork])
            end
        end
    })
    
    -- Robbable Places
    tab3:Section({ Title = "Robbable Places" })
    
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
    
    local robNames = {}
    for name, _ in pairs(RobbableLocations) do table_insert(robNames, name) end
    
    local selectedRob = robNames[1]
    local robDropdown = tab3:Dropdown({
        Title = "Robbable Places",
        Values = robNames,
        Value = selectedRob,
        Callback = function(option)
            selectedRob = option
        end
    })
    
    tab3:Button({
        Title = "Teleport to Robbable Place",
        Callback = function()
            if selectedRob and RobbableLocations[selectedRob] then
                tweenTo(RobbableLocations[selectedRob])
            end
        end
    })
    
    -- Usable Places
    tab3:Section({ Title = "Usable Places" })
    
    local UsableLocations = {
        ["Tuning Garage"] = CFrame.new(-1429.04, 5.57, 143.96),
        ["Car Dealership"] = CFrame.new(-1454.02, 5.615, 940.83),
        ["Hospital"] = CFrame.new(-293.16, 5.627, 1053.98),
        ["Prison"] = CFrame.new(-514.34, 5.615, 2795.94),
    }
    
    local useNames = {}
    for name, _ in pairs(UsableLocations) do table_insert(useNames, name) end
    
    local selectedUse = useNames[1]
    local useDropdown = tab3:Dropdown({
        Title = "Usable Places",
        Values = useNames,
        Value = selectedUse,
        Callback = function(option)
            selectedUse = option
        end
    })
    
    tab3:Button({
        Title = "Teleport to Usable Place",
        Callback = function()
            if selectedUse and UsableLocations[selectedUse] then
                tweenTo(UsableLocations[selectedUse])
            end
        end
    })
    
    -- Player Teleport
    tab3:Section({ Title = "Player Teleport" })
    
    local selectedPlayer = nil
    local trackingEnabled = false
    
    local function getPlayerList()
        local list = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                table_insert(list, p.Name)
            end
        end
        if #list == 0 then
            table_insert(list, "No players found")
        end
        return list
    end
    
    local selectedPlayerName = nil
    
    local playerDropdown = tab3:Dropdown({
        Title = "Select target player",
        Values = getPlayerList(),
        Value = "Select Player",
        Callback = function(option)
            selectedPlayerName = option
            if selectedPlayerName and selectedPlayerName ~= "No players found" and selectedPlayerName ~= "Select Player" then
                selectedPlayer = Players:FindFirstChild(selectedPlayerName)
            else
                selectedPlayer = nil
            end
        end
    })
    
    local function updatePlayerList()
        local newList = getPlayerList()
        playerDropdown:Refresh(newList, "Select Player")
    end
    
    task_spawn(function()
        while true do
            updatePlayerList()
            task_wait(5)
        end
    end)
    
    local function TweenCarToPlayer(targetPlayer)
        if not targetPlayer then return end

        local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if not car then return end

        local driveSeat = car:FindFirstChild("DriveSeat", true)
        if not driveSeat then return end
        
        car.PrimaryPart = driveSeat

        if not (targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            return
        end

        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            if hum.Sit then
                hum.Sit = false
                task_wait(0.2)
            end
            driveSeat:Sit(hum)
            task_wait(0.3)
        else
            return
        end

        local targetPos = targetPlayer.Character.HumanoidRootPart.Position + Vector3_new(0, 3, 0)
        local distance = (car.PrimaryPart.Position - targetPos).Magnitude
        local duration = math.clamp(distance / 120, 1, 8)

        local cfValue = Instance.new("CFrameValue")
        cfValue.Value = car:GetPivot()

        local connection
        connection = cfValue.Changed:Connect(function(cframe)
            if car and car.Parent then
                car:PivotTo(cframe)
                pcall(function()
                    if driveSeat then
                        driveSeat.AssemblyLinearVelocity = Vector3.zero
                        driveSeat.AssemblyAngularVelocity = Vector3.zero
                    end
                end)
            end
        end)

        local tween = TweenService:Create(cfValue, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Value = CFrame_new(targetPos)
        })

        tween:Play()
        tween.Completed:Connect(function()
            connection:Disconnect()
            cfValue:Destroy()
            
            task_wait(0.5)
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and not char.Humanoid.Sit then
                driveSeat:Sit(char.Humanoid)
            end
        end)
    end
    
    tab3:Button({
        Title = "Teleport to player",
        Callback = function()
            if selectedPlayer then
                TweenCarToPlayer(selectedPlayer)
            end
        end
    })
    
    tab3:Toggle({
        Title = "Auto follow player",
        Default = false,
        Callback = function(v)
            trackingEnabled = v
            if v then
                if not selectedPlayer then
                    trackingEnabled = false
                    return
                end
                task_spawn(function()
                    while trackingEnabled and selectedPlayer and selectedPlayer.Character do
                        TweenCarToPlayer(selectedPlayer)
                        task_wait(5)
                    end
                end)
            end
        end
    })
    
    Players.PlayerRemoving:Connect(function(player)
        if player == selectedPlayer then
            selectedPlayer = nil
            selectedPlayerName = nil
            if trackingEnabled then
                trackingEnabled = false
            end
        end
    end)
    
    -- ========== MISC TAB ==========
    local tab4 = Window:Tab({ Title = "Misc", Icon = "settings" })
    
    tab4:Section({ Title = "Misc Settings" })
    
    -- Self Revive
    local function checkHealthAndTeleport()
        local car = workspace:FindFirstChild("Vehicles") and workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not car then return end

        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local hospital = CFrame.new(-120.30, 5.61, 1077.29)

        if humanoid.Health <= humanoid.MaxHealth * 0.27 then
            -- Tween Funktion hier einfügen
        end
    end
    
    tab4:Button({
        Title = "Self Revive",
        Callback = function()
            checkHealthAndTeleport()
        end
    })
    
    tab4:Button({
        Title = "Change Job",
        Callback = function()
            local player = game.Players.LocalPlayer
            if player and player.Team then
                local teams = game:GetService("Teams")
                local newTeam = teams:GetChildren()[math.random(1, #teams:GetChildren())]
                player.Team = newTeam
            end
        end
    })
    
    -- FreeCam
    local flying = false
    local camCFrame = Camera.CFrame
    local speed = 2
    
    local function toggleFreeCam(state)
        flying = state
        if flying then
            Camera.CameraType = Enum.CameraType.Scriptable
            camCFrame = Camera.CFrame
        else
            Camera.CameraType = Enum.CameraType.Custom
        end
    end
    
    tab4:Toggle({
        Title = "FreeCam",
        Default = false,
        Callback = function(state)
            toggleFreeCam(state)
        end
    })
    
    tab4:Slider({
        Title = "FreeCam Speed",
        Step = 0.1,
        Value = {
            Min = 1,
            Max = 10,
            Default = 2,
        },
        Callback = function(value)
            speed = value
        end
    })
    
    -- Noclip
    local noclip = false
    tab4:Toggle({
        Title = "Noclip",
        Default = false,
        Callback = function(state)
            noclip = state
        end
    })
    
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    
    -- Character Section
    tab4:Section({ Title = "Character" })
    
    tab4:Paragraph({
        Title = "Fly",
        Content = "Press [V] to activate/deactivate fly."
    })
    
    -- FLY SYSTEM
    local flyingSpeed = 50
    local isFlying = false
    local attachment, alignPosition, alignOrientation
    local lastFlyUpdate = 0
    local FLY_UPDATE_INTERVAL = 0.033
    
    local function enableFly()
        local character = LocalPlayer.Character
        if not character then return end
        local root = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        if not (root and humanoid) then return end

        attachment = Instance.new("Attachment", root)

        alignPosition = Instance.new("AlignPosition")
        alignPosition.Attachment0 = attachment
        alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
        alignPosition.MaxForce = 5000
        alignPosition.Responsiveness = 45
        alignPosition.Parent = root

        alignOrientation = Instance.new("AlignOrientation")
        alignOrientation.Attachment0 = attachment
        alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
        alignOrientation.MaxTorque = 5000
        alignOrientation.Responsiveness = 45
        alignOrientation.Parent = root

        humanoid.PlatformStand = true
        isFlying = true

        local lastPosition = root.Position
        alignPosition.Position = lastPosition

        task_spawn(function()
            while isFlying and root and humanoid do
                local currentTime = tick()
                if (currentTime - lastFlyUpdate) > FLY_UPDATE_INTERVAL then
                    local moveDir = Vector3.zero
                    local camCFrame = workspace.CurrentCamera.CFrame

                    if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir += camCFrame.LookVector end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir -= camCFrame.LookVector end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir -= camCFrame.RightVector end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir += camCFrame.RightVector end

                    if moveDir.Magnitude > 0 then
                        moveDir = moveDir.Unit
                        local newPos = lastPosition + (moveDir * flyingSpeed * FLY_UPDATE_INTERVAL)
                        alignPosition.Position = newPos
                        lastPosition = newPos
                    end

                    alignOrientation.CFrame = CFrame.new(Vector3.zero, camCFrame.LookVector)
                    lastFlyUpdate = currentTime
                end
                task_wait(FLY_UPDATE_INTERVAL)
            end
        end)
    end
    
    local function disableFly()
        isFlying = false
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then humanoid.PlatformStand = false end
        if attachment then attachment:Destroy() end
        if alignPosition then alignPosition:Destroy() end
        if alignOrientation then alignOrientation:Destroy() end
    end
    
    tab4:Toggle({
        Title = "Fly",
        Default = false,
        Callback = function(v)
            if v then
                enableFly()
            else
                disableFly()
            end
        end
    })
    
    tab4:Slider({
        Title = "Fly Speed",
        Step = 1,
        Value = {
            Min = 10,
            Max = 150,
            Default = 50,
        },
        Callback = function(v)
            flyingSpeed = v
        end
    })
    
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.V then
            if isFlying then
                disableFly()
            else
                enableFly()
            end
        end
    end)
    
    -- Spinbot
    local spinOn = false
    tab4:Toggle({
        Title = "Spinbot",
        Default = false,
        Callback = function(val)
            spinOn = val
        end
    })
    
    RunService.Stepped:Connect(function()
        if spinOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(60), 0)
        end
    end)
    
    tab4:Button({
        Title = "Instant Respawn",
        Callback = function()
            local player = game.Players.LocalPlayer
            if player.Character then
                player.Character:BreakJoints()
                task_wait(0.1)
                player:LoadCharacter()
            end
        end
    })
    
    -- SPEED BOOST
    local boostEnabled = false
    local boostConnection = nil
    local speedValue = 250
    local lastBoostUpdate = 0
    local BOOST_UPDATE_INTERVAL = 0.05
    
    function getCharacterParts()
        if not LocalPlayer.Character then return nil end
        local char = LocalPlayer.Character
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso")
        return char, humanoid, hrp
    end
    
    function startBoostEnforcer()
        if boostConnection then return end
        boostConnection = RunService.RenderStepped:Connect(function()
            local currentTime = tick()
            if not boostEnabled or (currentTime - lastBoostUpdate) < BOOST_UPDATE_INTERVAL then return end
            
            local char, humanoid, hrp = getCharacterParts()
            if hrp and hrp.Parent and boostEnabled then
                local forward = hrp.CFrame.LookVector
                local currentY = 0
                local ok, av = pcall(function() return hrp.AssemblyLinearVelocity end)
                if ok and type(av) == "Vector3" then currentY = av.Y else currentY = hrp.Velocity.Y end

                local desired = Vector3_new(forward.X * speedValue, currentY, forward.Z * speedValue)
                pcall(function()
                    if hrp and hrp.Parent then
                        hrp.AssemblyLinearVelocity = desired
                    else
                        hrp.Velocity = desired
                    end
                end)
            end
            lastBoostUpdate = currentTime
        end)
    end
    
    function stopBoostEnforcer()
        if boostConnection then
            pcall(function() boostConnection:Disconnect() end)
            boostConnection = nil
        end
    end
    
    tab4:Slider({
        Title = "Boost Speed",
        Step = 5,
        Value = {
            Min = 0,
            Max = 300,
            Default = 250,
        },
        Callback = function(value)
            speedValue = math_floor(tonumber(value) or speedValue)
        end
    })
    
    tab4:Toggle({
        Title = "Speed Boost",
        Default = false,
        Callback = function(Value)
            boostEnabled = Value
            if Value then
                startBoostEnforcer()
            else
                stopBoostEnforcer()
            end
        end
    })
    
    -- ========== CAR TAB ==========
    local tab5 = Window:Tab({ Title = "Car", Icon = "car" })
    
    tab5:Section({ Title = "Car Tuning" })
    
    -- Car Tuning
    local VEHICLE_FOLDER_NAME = "Vehicles"
    local maxLevel = 6
    local attrArmor = 0
    local attrBrakes = 0
    local attrEngine = 0
    
    tab5:Slider({
        Title = "Engine",
        Step = 1,
        Value = {
            Min = 0,
            Max = maxLevel,
            Default = 0,
        },
        Callback = function(value)
            attrEngine = math_floor(tonumber(value) or 0)
        end
    })
    
    tab5:Slider({
        Title = "Brakes",
        Step = 1,
        Value = {
            Min = 0,
            Max = maxLevel,
            Default = 0,
        },
        Callback = function(value)
            attrBrakes = math_floor(tonumber(value) or 0)
        end
    })
    
    tab5:Slider({
        Title = "Armor",
        Step = 1,
        Value = {
            Min = 0,
            Max = maxLevel,
            Default = 0,
        },
        Callback = function(value)
            attrArmor = math_floor(tonumber(value) or 0)
        end
    })
    
    -- Car Colors
    local mainColor = Color3.fromRGB(255, 255, 255)
    local rimColor = Color3.fromRGB(120, 120, 120)
    
    local function updateCarColors(mainColor, rimColor)
        pcall(function()
            local vehicles = workspace:FindFirstChild("Vehicles")
            if not vehicles then return end
    
            local car = vehicles:FindFirstChild(LocalPlayer.Name)
            if not car then return end
    
            for _, part in ipairs(car:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("UnionOperation") or part:IsA("MeshPart") then
                    if part.Name:lower():find("body") or part.Name:lower():find("chassis") then
                        part.Color = mainColor
                    end
    
                    local name = part.Name:lower()
                    if name:find("rim") or name:find("wheel") or name:find("reifen") or name:find("felge") then
                        part.Color = rimColor
                        part.Material = Enum.Material.Metal
                    end
                end
            end
        end)
    end
    
    tab5:Colorpicker({
        Title = "Body Color",
        Default = mainColor,
        Callback = function(c)
            mainColor = c
            updateCarColors(mainColor, rimColor)
        end
    })
    
    tab5:Colorpicker({
        Title = "Wheel Color",
        Default = rimColor,
        Callback = function(c)
            rimColor = c
            updateCarColors(mainColor, rimColor)
        end
    })
    
    -- License Plate
    local function setPlateText(text)
        pcall(function()
            local vehicles = workspace:FindFirstChild("Vehicles")
            if not vehicles then return end
    
            local car = vehicles:FindFirstChild(LocalPlayer.Name)
            if not car then return end
    
            local body = car:FindFirstChild("Body", true)
            if not body then return end
    
            local plates = body:FindFirstChild("LicensePlates")
            if not plates then return end
    
            for _, plate in ipairs(plates:GetChildren()) do
                if plate:FindFirstChild("Gui") and plate.Gui:FindFirstChild("TextLabel") then
                    plate.Gui.TextLabel.Text = text
                    plate.Gui.TextLabel.TextColor3 = Color3.fromRGB(29, 53, 53)
                end
                if plate:FindFirstChild("Decal") then
                    plate.Decal.Color3 = Color3.fromRGB(255, 255, 255)
                end
            end
        end)
    end
    
    tab5:Input({
        Title = "Custom Plate",
        PlaceholderText = "Fragmora",
        Callback = function(value)
            setPlateText(value)
        end
    })
    
    -- Car Fly
    tab5:Section({ Title = "Car Fly Options" })
    
    tab5:Paragraph({
        Title = "Car Fly", 
        Content = "Press [X] to activate/deactivate car fly."
    })
    
    local carFlyEnabled = false
    local flightSpeed = 50
    local lastCarFlyUpdate = 0
    local CAR_FLY_UPDATE_INTERVAL = 0.033
    
    tab5:Toggle({
        Title = "Car Fly",
        Default = false,
        Callback = function(v)
            carFlyEnabled = v
        end
    })
    
    tab5:Slider({
        Title = "Car Fly Speed",
        Step = 5,
        Value = {
            Min = 10,
            Max = 100,
            Default = 50,
        },
        Callback = function(v)
            flightSpeed = v
        end
    })
    
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.X then
            carFlyEnabled = not carFlyEnabled
        end
    end)
    
    RunService.RenderStepped:Connect(function()
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
                                    ((UIS:IsKeyDown(Enum.KeyCode.D) and flightSpeed or 0) -
                                    (UIS:IsKeyDown(Enum.KeyCode.A) and flightSpeed or 0)) * 0.1,
                                    ((UIS:IsKeyDown(Enum.KeyCode.E) and flightSpeed / 2 or 0) -
                                    (UIS:IsKeyDown(Enum.KeyCode.Q) and flightSpeed / 2 or 0)) * 0.1,
                                    ((UIS:IsKeyDown(Enum.KeyCode.S) and flightSpeed or 0) -
                                    (UIS:IsKeyDown(Enum.KeyCode.W) and flightSpeed or 0)) * 0.1
                                )
                            )
                            SeatPart.AssemblyLinearVelocity = Vector3.zero
                            SeatPart.AssemblyAngularVelocity = Vector3.zero
                        end
                    end
                end
            end
            lastCarFlyUpdate = currentTime
        end
    end)
    
    -- Car Mods
    tab5:Section({ Title = "Car Mods" })
    
    function bringCarToPlayer()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart", 2)
        local car = workspace:FindFirstChild("Vehicles") and workspace.Vehicles:FindFirstChild(player.Name)
    
        if car and root then
            local seat = car:FindFirstChild("DriveSeat", true)
            if not seat then return end
    
            car.PrimaryPart = seat
            local forward = root.CFrame.LookVector * 10
            local targetCFrame = CFrame.new(root.Position + forward, root.Position)
    
            car:SetPrimaryPartCFrame(targetCFrame)
    
            task_wait(0.5)
    
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then seat:Sit(humanoid) end
        end
    end
    
    tab5:Button({
        Title = "Bring Car",
        Callback = function()
            bringCarToPlayer()
        end
    })
    
    function exitCar()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
    
    tab5:Button({
        Title = "Exit Car",
        Callback = function()
            exitCar()
        end
    })
    
    -- Car Godmode
    local vehicleGodMode = false
    local lastVehicle = nil
    
    RunService.Heartbeat:Connect(function()
        if not vehicleGodMode then return end
    
        if not lastVehicle or not lastVehicle.Parent then
            local vehiclesFolder = workspace:FindFirstChild("Vehicles")
            lastVehicle = vehiclesFolder and vehiclesFolder:FindFirstChild(LocalPlayer.Name)
        end
    
        if lastVehicle then
            lastVehicle:SetAttribute("IsOn", true)
            lastVehicle:SetAttribute("currentHealth", 500)
            lastVehicle:SetAttribute("currentFuel", math.huge)
        end
    end)
    
    tab5:Toggle({
        Title = "Car Godmode",
        Default = false,
        Callback = function(Value)
            vehicleGodMode = Value
            if not Value then lastVehicle = nil end
        end
    })
    
    -- Car Ghost
    local STATE = "normal"
    local firstColor = nil
    
    function changeCarToForceField(NEWSTATE)
        local car = workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name)
        if car and car:FindFirstChild("Body") then
            local targetPart = car.Body:FindFirstChild("Body") or car.Body:FindFirstChild("Main")
            if targetPart and targetPart:IsA("MeshPart") then
                if NEWSTATE == "force" then
                    firstColor = targetPart.Color
                    targetPart.Material = Enum.Material.ForceField
                    targetPart.Color = Color3.fromRGB(29, 53, 53)
                else
                    targetPart.Material = Enum.Material.SmoothPlastic
                    targetPart.Color = firstColor or Color3.fromRGB(255, 255, 255)
                end
            end
        end
    end
    
    tab5:Toggle({
        Title = "Car Ghost",
        Default = false,
        Callback = function(Value)
            if Value then
                STATE = "force"
                changeCarToForceField("force")
            else
                STATE = "normal"
                changeCarToForceField("normal")
            end
        end
    })
    
    -- ========== POLICE TAB ==========
    local tab6 = Window:Tab({ Title = "Police", Icon = "shield" })
    
    tab6:Section({ Title = "Police Settings" })
    
    -- Anti Taser
    local antiTaserActive = false
    local antiTaserConnection = nil
    
    function toggleAntiTaser(state)
        antiTaserActive = state
    
        if antiTaserActive then
            local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
            char:SetAttribute("Tased", false)
    
            antiTaserConnection = char:GetAttributeChangedSignal("Tased"):Connect(function()
                if antiTaserActive then
                    char:SetAttribute("Tased", false)
                end
            end)
        else
            if antiTaserConnection then
                antiTaserConnection:Disconnect()
                antiTaserConnection = nil
            end
        end
    end
    
    tab6:Toggle({
        Title = "Anti-Taser",
        Default = false,
        Callback = function(state)
            toggleAntiTaser(state)
        end
    })
    
    -- Anti Arrest
    local AntiArrestToggle = false
    
    tab6:Toggle({
        Title = "Anti Arrest",
        Default = false,
        Callback = function(state)
            AntiArrestToggle = state
        end
    })
    
    task_spawn(function()
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {character}
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    
        local function isPositionSafe(position)
            local region = Region3.new(position - Vector3.new(1,1,1), position + Vector3.new(1,1,1))
            local parts = workspace:FindPartsInRegion3(region, character, 100)
            for _, part in ipairs(parts) do
                if part.CanCollide then return false end
            end
            return true
        end
    
        local function findSafeTeleportPosition(fromPosition, awayFromPosition)
            local directions = {
                Vector3.new(1, 0, 0),
                Vector3.new(-1, 0, 0),
                Vector3.new(0, 0, 1),
                Vector3.new(0, 0, -1),
                Vector3.new(0, 1, 0),
                Vector3.new(0, -1, 0),
                Vector3.new(1, 1, 0).Unit,
                Vector3.new(-1, 1, 0).Unit,
                Vector3.new(0, 1, 1).Unit,
                Vector3.new(0, 1, -1).Unit
            }
            table_insert(directions, 1, (fromPosition - awayFromPosition).Unit)
    
            for _, dir in ipairs(directions) do
                local testPosition = fromPosition + (dir * 8)
                local ray = workspace:Raycast(fromPosition, dir * 8, raycastParams)
                if not ray or (ray.Instance and not ray.Instance.CanCollide) then
                    if isPositionSafe(testPosition) then
                        return testPosition
                    end
                end
            end
            return fromPosition + Vector3.new(0, 5, 0)
        end
    
        while true do
            task_wait(0.2)
            if AntiArrestToggle then
                character = player.Character or player.CharacterAdded:Wait()
                rootPart = character:FindFirstChild("HumanoidRootPart")
                raycastParams.FilterDescendantsInstances = {character}
    
                if rootPart and not character.Humanoid.Sit then
                    for _, otherPlayer in ipairs(Players:GetPlayers()) do
                        if otherPlayer ~= player and otherPlayer.Team and otherPlayer.Team.Name:lower() == "police" then
                            local otherRoot = otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if otherRoot then
                                local distance = (otherRoot.Position - rootPart.Position).Magnitude
                                if distance <= 10 then
                                    local safePos = findSafeTeleportPosition(rootPart.Position, otherRoot.Position)
                                    rootPart.CFrame = CFrame.new(safePos)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    -- Anti Fall Damage
    local antiFallEnabled = false
    local antiFallConnection = nil
    
    tab6:Toggle({
        Title = "Anti Fall Damage",
        Default = false,
        Callback = function(enabled)
            antiFallEnabled = enabled
            if antiFallConnection then
                antiFallConnection:Disconnect()
                antiFallConnection = nil
            end
    
            if enabled then
                antiFallConnection = RunService.RenderStepped:Connect(function()
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and humanoid then
                        if hrp.Velocity.Y < -80 then
                            hrp.Velocity = Vector3.new(hrp.Velocity.X, -10, hrp.Velocity.Z)
                        end
                    end
                end)
            end
        end
    })
    
    -- Anti Down
    local antiDownEnabled = false
    
    tab6:Toggle({
        Title = "Anti Down",
        Default = false,
        Callback = function(Value)
            antiDownEnabled = Value
            while antiDownEnabled do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Health = 100
                end
                task_wait()
            end
        end
    })
    
    -- ========== SERVER TAB ==========
    local tab7 = Window:Tab({ Title = "Server", Icon = "server" })
    
    tab7:Section({ Title = "Server Settings" })
    
    tab7:Button({
        Title = "Rejoin",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
        end
    })
    
    tab7:Button({
        Title = "Leave",
        Callback = function()
            game:GetService("Players").LocalPlayer:Kick("You have left the game.")
        end
    })
    
    function RejoinToNewLobby()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local Player = game.Players.LocalPlayer
    
        local success, response = pcall(function()
            return HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
            )
        end)
    
        if success and response and response.data then
            for _, server in pairs(response.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(PlaceId, server.id, Player)
                    return
                end
            end
        end
    end
    
    tab7:Button({
        Title = "Server Hop",
        Callback = function()
            RejoinToNewLobby()
        end
    })
    
    tab7:Section({ Title = "More FPS" })
    
    -- XRay
    function toggleXRay(enabled)
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") 
            and obj.Transparency < 1 
            and not obj:IsDescendantOf(game.Players.LocalPlayer.Character) then
                obj.LocalTransparencyModifier = enabled and 0.8 or 0
            end
        end
    end
    
    tab7:Toggle({
        Title = "XRay",
        Default = false,
        Callback = function(Value)
            toggleXRay(Value)
        end
    })
    
    -- Night Vision
    function enableNightVision(val)
        local lighting = game:GetService("Lighting")
        local existing = lighting:FindFirstChild("NightVision")
        if val and not existing then
            local cc = Instance.new("ColorCorrectionEffect", lighting)
            cc.Name = "NightVision"
            cc.TintColor = Color3.fromRGB(128, 255, 128)
            cc.Contrast = 0.1
            cc.Saturation = 1
        elseif not val and existing then
            existing:Destroy()
        end
    end
    
    tab7:Toggle({
        Title = "Night Vision",
        Default = false,
        Callback = function(Value)
            enableNightVision(Value)
        end
    })
    
    -- Fullbright
    local fullbrightOn = false
    function enableFullbright(val)
        fullbrightOn = val
        local lighting = game:GetService("Lighting")
        if val then
            lighting.Ambient = Color3.new(1,1,1)
            lighting.OutdoorAmbient = Color3.new(1,1,1)
            lighting.Brightness = 3
            lighting.FogEnd = 1000000
        else
            lighting.Ambient = Color3.fromRGB(112, 112, 112)
            lighting.OutdoorAmbient = Color3.fromRGB(112, 112, 112)
            lighting.Brightness = 1
            lighting.FogEnd = 1000
        end
    end
    
    tab7:Toggle({
        Title = "Fullbright",
        Default = false,
        Callback = function(Value)
            enableFullbright(Value)
        end
    })
    
    tab7:Button({
        Title = "FPS Booster",
        Callback = function()
            game.Lighting.GlobalShadows = false
            game.Lighting.FogEnd = 1000
            game.Lighting.Brightness = 1
            game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
            if workspace:FindFirstChildOfClass("Terrain") then
                local terrain = workspace:FindFirstChildOfClass("Terrain")
                terrain.WaterWaveSize = 0
                terrain.WaterWaveSpeed = 0
                terrain.WaterReflectance = 0
                terrain.WaterTransparency = 1
            end
            for _, v in pairs(game:GetService("StarterGui"):GetDescendants()) do
                if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
                    v.Enabled = false
                end
            end
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end
    })
    
    tab7:Button({
        Title = "Remove Sky",
        Callback = function()
            game.Lighting.Sky:Destroy()
        end
    })
    
    -- ========== INFO TAB ==========
    local tab8 = Window:Tab({ Title = "Info", Icon = "info" })
    
    tab8:Section({ Title = "About Me" })
    
    tab8:Label("Hello! I'm Jonas, the creator of Fragmora.")
    tab8:Label("This script is designed to enhance your")
    tab8:Label("Emergency Hamburg experience with")
    tab8:Label("various features and utilities.")
    tab8:Label("")
    tab8:Label("If you have any questions or need help,")
    tab8:Label("feel free to join my Discord server!")
    tab8:Label("")
    tab8:Label("Special thanks to:")
    tab8:Label("Zero and Mark for their contributions")
    
    tab8:Section({ Title = "Discord & Information" })
    
    tab8:Button({
        Title = "Copy Discord Link",
        Callback = function()
            setclipboard("https://discord.gg/jonasfragmora")
        end
    })
    
    tab8:Button({
        Title = "Join My Discord Server",
        Callback = function()
            setclipboard("https://discord.gg/jonasfragmora")
        end
    })
    
    tab8:Label("")
    tab8:Label("Authors: Jonas, Zero, Mark")
    tab8:Label("Version: 1.8")
    tab8:Label("UI Library: WindUI")
    tab8:Label("Game: Emergency Hamburg")
    
    -- ========== FINALE EINSTELLUNGEN ==========
    
    -- Set default tab to Combat
    Window:SetDefaultTab(tab1)
    Window:SetToggleKey(Enum.KeyCode.RightControl)
    
    -- Anti-AFK
    function EnableAntiAFK()
        for _, conn in ipairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
            conn:Disable()
        end
    end
    
    -- FPS Counter
    task_spawn(function()
        local Drawing = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls().MouseIcon
        local fpsText = Drawing.new("Text")
        fpsText.Size = 30
        fpsText.Position = Vector2.new(10, 10)
        fpsText.Color = Color3.fromRGB(0, 255, 255)
        fpsText.Outline = true
        fpsText.Visible = true
        
        local lastTime, fps, frameCount, fpsUpdateTime = tick(), 0, 0, 0
    
        RunService.RenderStepped:Connect(function()
            frameCount = frameCount + 1
            local now = tick()
            
            if now - fpsUpdateTime >= 0.5 then
                fps = math.floor(frameCount / (now - fpsUpdateTime))
                frameCount = 0
                fpsUpdateTime = now
                fpsText.Text = "FPS: " .. tostring(fps)
            end
        end)
    end)
    
    print([[
                Fragmora
              Made by Jonas 
              Version 1.8 - ALL-IN-ONE
              Complete script in one file
    ]])
end

return MainAllInOne
