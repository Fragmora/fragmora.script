
-- Settings Module
local Settings = {
    FileName = "HeavenlyEHcfg.txt"
}

local UserSettings = {}

function Settings:Save(data)
    if writefile then
        local success, errorMsg = pcall(function()
            writefile(self.FileName, game:GetService("HttpService"):JSONEncode(data))
        end)

        if success then
            print("Settings Saved")
        else
            warn("Could not save:", errorMsg)
        end
    end
end

function Settings:Load()
    local loadedSettings = {}

    if isfile and isfile(self.FileName) then
        local success, data = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile(self.FileName))
        end)

        if success and data then
            loadedSettings = data
        end
    end
    
    return loadedSettings
end

UserSettings = Settings:Load() or {}

local function AutoSave()
    task.wait(0.5)
    Settings:Save(UserSettings)
end

local function GetSetting(key, defaultValue)
    if UserSettings[key] ~= nil then
        return UserSettings[key]
    end
    return defaultValue
end

local function SaveSetting(key, value)
    UserSettings[key] = value
    task.spawn(AutoSave)
end

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local ContextActionService = game:GetService("ContextActionService")

-- Local Player
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Load Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fragmora/fragmora.script/refs/heads/main/orion.lua"))()

-- Create Window
local Window = OrionLib:MakeWindow({
    Name = ".gg/MERzRQ2UHn | Heavenly | Emergency Hamburg",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "HvnlyEH",
    IntroEnabled = true,
    IntroText = "Access Granted... Welcome to Heavenly"
})

-- Create Tabs
local TabCredits = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://123810491451954"
})

local AimbotTab = Window:MakeTab({
    Name = "Aimbot",
    Icon = "rbxassetid://121615146959714",
    PremiumOnly = false
})

local GunModsTab = Window:MakeTab({
    Name = "Gun Mods",
    Icon = "rbxassetid://98732304151282",
    PremiumOnly = false
})

local TeleportsTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://112398672404328",
    PremiumOnly = false
})

local ESPTab = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://78678714479511",
    PremiumOnly = false
})

local VehicleModsTab = Window:MakeTab({
    Name = "Vehicle Mods",
    Icon = "rbxassetid://106736790731856",
    PremiumOnly = false
})

local VehicleModsTab2 = Window:MakeTab({
    Name = "Vehicle Misc",
    Icon = "rbxassetid://90284918615637",
    PremiumOnly = false
})

local PoliceTab = Window:MakeTab({
    Name = "Police",
    Icon = "rbxassetid://97578883834004"
})

local PlayerTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://110701632373035"
})

local AnimTab = Window:MakeTab({
    Name = "Animations",
    Icon = "rbxassetid://82823113185452",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://128593575467422",
    PremiumOnly = false
})

-- Credits Tab
TabCredits:AddParagraph("2025 Heavenly", "Made by the Team of Heavenly")
TabCredits:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/MERzRQ2UHn")
        OrionLib:MakeNotification({
            Name = "Discord",
            Content = "Link Copied",
            Image = "rbxassetid://123810491451954",
            Time = 5
        })
    end    
})
TabCredits:AddParagraph("Ver 1.7.60")

-- Aimbot System
AimbotTab:AddSection({Name = "Aimbot"})

local AimbotEnabled = false
local AimbotKey = Enum.KeyCode.B
local AimPart = "HumanoidRootPart"
local TeamCheck = true
local AimbotSmoothness = 0.2
local Prediction = false
local KnockedHealthThreshold = 24

AimbotTab:AddToggle({
    Name = "Aimbot",
    Default = GetSetting("AimbotEnabled", false),
    Callback = function(val)
        AimbotEnabled = val
        SaveSetting("AimbotEnabled", val)
    end
})

AimbotTab:AddBind({
    Name = "Aimbot Keybind",
    Default = Enum.KeyCode.B,
    Hold = false,
    Callback = function()
        AimbotEnabled = not AimbotEnabled
    end
})

AimbotTab:AddDropdown({
    Name = "Aim Part",
    Default = GetSetting("AimPart", "HumanoidRootPart"),
    Options = { "Head", "HumanoidRootPart" },
    Callback = function(val)
        AimPart = val
        SaveSetting("AimPart", val)
    end
})

AimbotTab:AddSlider({
    Name = "Aimbot Strength",
    Min = 0.1,
    Max = 1,
    Default = GetSetting("AimbotSmoothness", 0.25),
    Increment = 0.01,
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(val)
        AimbotSmoothness = val
        SaveSetting("AimbotSmoothness", val)
    end
})

AimbotTab:AddSection({Name = "Checks"})

AimbotTab:AddToggle({
    Name = "Team Check",
    Default = GetSetting("TeamCheck", true),
    Callback = function(val)
        TeamCheck = val
        SaveSetting("TeamCheck", val)
    end
})

AimbotTab:AddSection({Name = "Prediction"})

AimbotTab:AddToggle({
    Name = "Enable Prediction",
    Default = GetSetting("Prediction", false),
    Callback = function(val)
        Prediction = val
        SaveSetting("Prediction", val)
    end
})

-- Aimbot Logic
local function getPredictedPosition(player, offset)
    return player.Character[AimPart].Position + player.Character[AimPart].Velocity * offset
end

local function getBestTarget()
    local bestTarget = nil
    local closestDistance = math.huge
    local LocalPlayerTeam = LocalPlayer.Team

    local function isEnemy(player)
        if not player.Team then return true end
        if LocalPlayerTeam.Name == "Citizen" then
            return player.Team.Name == "Police"
        elseif LocalPlayerTeam.Name == "Police" then
            return player.Team.Name == "Citizen"
        end
        return false
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(AimPart) and (not TeamCheck or isEnemy(player)) then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health > KnockedHealthThreshold then
                local screenPos, onScreen = Camera:WorldToScreenPoint(player.Character[AimPart].Position)
                if onScreen then
                    local magnitude = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                    if magnitude < closestDistance then
                        closestDistance = magnitude
                        bestTarget = player
                    end
                end
            end
        end
    end
    return bestTarget
end

RunService.RenderStepped:Connect(function()
    if AimbotEnabled and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getBestTarget()
        if target and target.Character and target.Character:FindFirstChild(AimPart) then
            local targetPosition = target.Character[AimPart].Position
            if Prediction then
                targetPosition = getPredictedPosition(target, 0.2)
            end

            local currentLookVector = Camera.CFrame.LookVector
            local targetLookVector = (targetPosition - Camera.CFrame.Position).Unit
            
            local smoothnessFactor = math.clamp(1 - AimbotSmoothness, 0.01, 0.99)
            
            local newLookVector = currentLookVector:Lerp(targetLookVector, smoothnessFactor)
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + newLookVector)
        end
    end
end)

-- Gun Mods System
GunModsTab:AddSection({Name = "Weapon Mods"})

local WeaponData = {
    weaponList = { "G36", "M4 Carbine", "M58B Shotgun", "MP5", "Glock 17", "Sniper" },
    mods = {
        { name = "Fast Fire", attribute = "ShootDelay", saved = {}, active = false },
        { name = "No Recoil", attribute = "Recoil", saved = {}, active = false },
        { name = "Small Crosshair", attribute = "CrosshairSize", saved = {}, active = false }
    }
}

local function applyMod(gun, mod)
    if gun and gun:GetAttribute(mod.attribute) then
        if not mod.saved[gun.Name] then
            mod.saved[gun.Name] = gun:GetAttribute(mod.attribute)
        end
        if mod.active then
            pcall(function()
                gun:SetAttribute(mod.attribute, 0)
            end)
        end
        gun:GetAttributeChangedSignal(mod.attribute):Connect(function()
            if mod.active then
                pcall(function()
                    gun:SetAttribute(mod.attribute, 0)
                end)
            end
        end)
    end
end

local function setupForCharacter(char, mod)
    mod.saved = {}
    for _, weaponName in ipairs(WeaponData.weaponList) do
        local weapon = char:FindFirstChild(weaponName)
        if weapon then
            applyMod(weapon, mod)
        end
    end
    char.ChildAdded:Connect(function(child)
        if table.find(WeaponData.weaponList, child.Name) then
            applyMod(child, mod)
        end
    end)
end

for _, mod in ipairs(WeaponData.mods) do
    LocalPlayer.CharacterAdded:Connect(function(char)
        setupForCharacter(char, mod)
    end)
    if LocalPlayer.Character then
        setupForCharacter(LocalPlayer.Character, mod)
    end

    GunModsTab:AddToggle({
        Name = mod.name,
        Default = false,
        Callback = function(val)
            mod.active = val
            if val and LocalPlayer.Character then
                for _, weaponName in ipairs(WeaponData.weaponList) do
                    local weapon = LocalPlayer.Character:FindFirstChild(weaponName)
                    if weapon then
                        applyMod(weapon, mod)
                    end
                end
            else
                for weaponName, originalValue in pairs(mod.saved) do
                    local weapon = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(weaponName)
                    if weapon then
                        pcall(function()
                            weapon:SetAttribute(mod.attribute, originalValue)
                        end)
                    end
                end
            end
        end
    })
end

-- Bullet Tracers
local BulletTracerSettings = {
    Enabled = false,
    Color = Color3.fromRGB(255, 255, 0),
    Thickness = 0.1,
    Lifetime = 0.5,
    FadeOut = true,
    Rainbow = false,
    ShowImpact = true,
    ImpactSize = 0.5
}

local ActiveTracers = {}

local function CreateBulletTracer(startPos, endPos)
    if not BulletTracerSettings.Enabled then return end

    local beam = Instance.new("Part")
    beam.Name = "BulletTracer"
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.Neon
    beam.Color = BulletTracerSettings.Rainbow and Color3.fromHSV(tick() % 1, 1, 1) or BulletTracerSettings.Color
    beam.Size = Vector3.new(BulletTracerSettings.Thickness, BulletTracerSettings.Thickness, (startPos - endPos).Magnitude)
    beam.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -beam.Size.Z / 2)
    beam.Parent = workspace

    if BulletTracerSettings.ShowImpact then
        local impact = Instance.new("Part")
        impact.Name = "ImpactEffect"
        impact.Shape = Enum.PartType.Ball
        impact.Anchored = true
        impact.CanCollide = false
        impact.Material = Enum.Material.Neon
        impact.Color = beam.Color
        impact.Size = Vector3.new(BulletTracerSettings.ImpactSize, BulletTracerSettings.ImpactSize, BulletTracerSettings.ImpactSize)
        impact.Position = endPos
        impact.Parent = workspace

        table.insert(ActiveTracers, impact)
    end

    table.insert(ActiveTracers, beam)

    if BulletTracerSettings.FadeOut then
        task.spawn(function()
            local startTime = tick()
            local duration = BulletTracerSettings.Lifetime

            while tick() - startTime < duration do
                local alpha = 1 - ((tick() - startTime) / duration)
                beam.Transparency = 1 - alpha
                task.wait()
            end

            beam:Destroy()
        end)
    else
        task.delay(BulletTracerSettings.Lifetime, function()
            beam:Destroy()
        end)
    end
end

local function getCurrentGun(char)
    if not char then return end

    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local tool = humanoid:FindFirstChildOfClass("Tool")
        if tool and table.find(WeaponData.weaponList, tool.Name) then 
            return tool
        end
    end

    for _, weaponName in ipairs(WeaponData.weaponList) do
        local weapon = char:FindFirstChild(weaponName)
        if weapon then
            return weapon
        end
    end
end

local function HookBulletTracers()
    local GunShotRemote = ReplicatedStorage.WvO:WaitForChild("5ce26a5c-fea4-476b-8e93-0246aa5d6729")

    local oldFireServer = GunShotRemote.FireServer
    GunShotRemote.FireServer = function(self, ...)
        local args = {...}

        if args[2] and args[3] then
            local char = LocalPlayer.Character
            if char then
                local gun = getCurrentGun(char)
                if gun and gun:FindFirstChild("Handle") then
                    local startPos = gun.Handle.Position
                    local endPos = args[2]

                    CreateBulletTracer(startPos, endPos)
                end
            end
        end

        return oldFireServer(self, ...)
    end
end

HookBulletTracers()

-- Gun Customization
GunModsTab:AddSection({Name = "Weapon Customization"})

local selectedGunColor = Color3.fromRGB(255, 255, 255)
local selectedGunMaterial = "SmoothPlastic"

GunModsTab:AddColorpicker({
    Name = "Gun Color",
    Default = selectedGunColor,
    Callback = function(color)
        selectedGunColor = color
    end
})

GunModsTab:AddDropdown({
    Name = "Gun Material",
    Default = "SmoothPlastic",
    Options = {
        "Plastic", "SmoothPlastic", "Neon", "Metal", "DiamondPlate", 
        "Marble", "Granite", "ForceField", "Glass", "Ice", "Foil"
    },
    Callback = function(material)
        selectedGunMaterial = material
    end
})

GunModsTab:AddButton({
    Name = "Apply to Current Gun",
    Callback = function()
        local character = LocalPlayer.Character
        if character then
            for _, tool in pairs(character:GetChildren()) do
                if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                    for _, part in pairs(tool:GetDescendants()) do
                        if part:IsA("BasePart") and part.Name ~= "Handle" then
                            part.Color = selectedGunColor
                            pcall(function()
                                part.Material = Enum.Material[selectedGunMaterial]
                            end)
                        end
                    end
                    OrionLib:MakeNotification({
                        Name = "Gun Customized",
                        Content = "Applied color and material to " .. tool.Name,
                        Time = 3
                    })
                    return
                end
            end
            
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            if backpack then
                for _, tool in pairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                        for _, part in pairs(tool:GetDescendants()) do
                            if part:IsA("BasePart") and part.Name ~= "Handle" then
                                part.Color = selectedGunColor
                                pcall(function()
                                    part.Material = Enum.Material[selectedGunMaterial]
                                end)
                            end
                        end
                        OrionLib:MakeNotification({
                            Name = "Gun Customized",
                            Content = "Applied color and material to " .. tool.Name,
                            Time = 3
                        })
                        return
                    end
                end
            end
            
            OrionLib:MakeNotification({
                Name = "No Gun Found",
                Content = "Equip or have a gun in inventory",
                Time = 3
            })
        end
    end
})

-- Flashlight System
GunModsTab:AddSection({Name = "Flashlight Color"})

local selectedFlashlightColor = Color3.fromRGB(255, 255, 255)
local rgbFlashlight = false
local flashlightBrightness = 1

GunModsTab:AddColorpicker({
    Name = "Flashlight Color",
    Default = selectedFlashlightColor,
    Callback = function(color)
        selectedFlashlightColor = color
        rgbFlashlight = false
    end
})

GunModsTab:AddSlider({
    Name = "Flashlight Brightness",
    Min = 0.5,
    Max = 500,
    Default = 1,
    Increment = 0.1,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "x",
    Callback = function(val)
        flashlightBrightness = val
    end
})

GunModsTab:AddButton({
    Name = "Apply Flashlight Color",
    Callback = function()
        local character = LocalPlayer.Character
        local gunsFound = 0
        
        if character then
            for _, tool in pairs(character:GetChildren()) do
                if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                    local flashlight = tool:FindFirstChild("Flashlight")
                    if flashlight then
                        local light = flashlight:FindFirstChild("Light")
                        if light and (light:IsA("SpotLight") or light:IsA("PointLight") or light:IsA("SurfaceLight")) then
                            light.Color = selectedFlashlightColor
                            light.Brightness = flashlightBrightness
                            gunsFound = gunsFound + 1
                        end
                    end
                end
            end
        end
        
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                    local flashlight = tool:FindFirstChild("Flashlight")
                    if flashlight then
                        local light = flashlight:FindFirstChild("Light")
                        if light and (light:IsA("SpotLight") or light:IsA("PointLight") or light:IsA("SurfaceLight")) then
                            light.Color = selectedFlashlightColor
                            light.Brightness = flashlightBrightness
                            gunsFound = gunsFound + 1
                        end
                    end
                end
            end
        end
        
        if gunsFound > 0 then
            OrionLib:MakeNotification({
                Name = "Flashlight Color Applied",
                Content = "Applied to " .. gunsFound .. " gun(s)",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "No Flashlights Found",
                Content = "No guns with flashlights found",
                Time = 3
            })
        end
    end
})

GunModsTab:AddToggle({
    Name = "Rainbow Flashlight",
    Default = false,
    Callback = function(val)
        rgbFlashlight = val
        if val then
            task.spawn(function()
                while rgbFlashlight do
                    local hue = (tick() % 5) / 5
                    local color = Color3.fromHSV(hue, 1, 1)
                    
                    local character = LocalPlayer.Character
                    
                    if character then
                        for _, tool in pairs(character:GetChildren()) do
                            if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                                local flashlight = tool:FindFirstChild("Flashlight")
                                if flashlight then
                                    local light = flashlight:FindFirstChild("Light")
                                    if light and (light:IsA("SpotLight") or light:IsA("PointLight") or light:IsA("SurfaceLight")) then
                                        light.Color = color
                                        light.Brightness = flashlightBrightness
                                    end
                                end
                            end
                        end
                    end
                    
                    local backpack = LocalPlayer:FindFirstChild("Backpack")
                    if backpack then
                        for _, tool in pairs(backpack:GetChildren()) do
                            if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                                local flashlight = tool:FindFirstChild("Flashlight")
                                if flashlight then
                                    local light = flashlight:FindFirstChild("Light")
                                    if light and (light:IsA("SpotLight") or light:IsA("PointLight") or light:IsA("SurfaceLight")) then
                                        light.Color = color
                                        light.Brightness = flashlightBrightness
                                    end
                                end
                            end
                        end
                    end
                    
                    task.wait(0.05)
                end
            end)
        end
    end
})

GunModsTab:AddButton({
    Name = "Reset Flashlight to Default",
    Callback = function()
        local character = LocalPlayer.Character
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local resetCount = 0
        
        if character then
            for _, tool in pairs(character:GetChildren()) do
                if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                    local flashlight = tool:FindFirstChild("Flashlight")
                    if flashlight then
                        local light = flashlight:FindFirstChild("Light")
                        if light and (light:IsA("SpotLight") or light:IsA("PointLight") or light:IsA("SurfaceLight")) then
                            light.Color = Color3.fromRGB(255, 255, 255)
                            light.Brightness = 1
                            resetCount = resetCount + 1
                        end
                    end
                end
            end
        end
        
        if backpack then
            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") and table.find(WeaponData.weaponList, tool.Name) then
                    local flashlight = tool:FindFirstChild("Flashlight")
                    if flashlight then
                        local light = flashlight:FindFirstChild("Light")
                        if light and (light:IsA("SpotLight") or light:IsA("PointLight") or light:IsA("SurfaceLight")) then
                            light.Color = Color3.fromRGB(255, 255, 255)
                            if light:GetAttribute("Brightness") then
                                light:SetAttribute("Brightness", 1)
                            else
                                light.Brightness = 1
                            end
                            resetCount = resetCount + 1
                        end
                    end
                end
            end
        end
        
        OrionLib:MakeNotification({
            Name = "Flashlight Reset",
            Content = "Reset " .. resetCount .. " flashlight(s) to default",
            Time = 3
        })
    end
})

-- Self Revive System
local selfReviveEnabled = false
local selfReviveKey = Enum.KeyCode.P

local function checkPlayerDown()
    if not LocalPlayer.Character then
        return true
    end
    local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    return not humanoid and true or humanoid.Health < 30
end

local function enterVehicle()
    local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    local character = LocalPlayer.Character
    if vehicle and character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local driveSeat = vehicle:FindFirstChild("DriveSeat")
        if humanoid and hrp and driveSeat then
            hrp.CFrame = driveSeat.CFrame + Vector3.new(0, 3, 0)
            wait(0.2)
            driveSeat:Sit(humanoid)
        end
    end
end

local function exitVehicle()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.Sit = false
        end
    end
end

local function goToHospital()
    local hospitalBed = workspace.Buildings and workspace.Buildings:FindFirstChild("Hospital") and 
                       workspace.Buildings.Hospital:FindFirstChild("HospitalBed")
    if hospitalBed then
        hospitalBed = workspace.Buildings.Hospital.HospitalBed:FindFirstChild("Seat")
    end
    local character = LocalPlayer.Character
    if hospitalBed and character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if humanoid and hrp then
            hrp.CFrame = hospitalBed.CFrame + Vector3.new(0, 3, 0)
            wait(0.2)
            if humanoid.SeatPart ~= hospitalBed then
                hospitalBed:Sit(humanoid)
                wait(0.3)
            end
        end
    end
end

local function tweenObjectToPosition(obj, targetPos, speed)
    if not obj or not obj.PrimaryPart then return false end
    
    local startPosition = obj.PrimaryPart.Position
    local distance = (startPosition - targetPos).Magnitude
    local duration = distance / speed
    
    local value = Instance.new("CFrameValue")
    value.Value = obj:GetPivot()

    value.Changed:Connect(function(newCFrame)
        obj:PivotTo(newCFrame)
        if obj.PrimaryPart then
            obj.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
            obj.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    local tween = TweenService:Create(value, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Value = CFrame.new(targetPos)
    })
    
    tween:Play()
    tween.Completed:Wait()
    value:Destroy()
    return true
end

local function selfReviveSequence()
    if checkPlayerDown() then
        local character = LocalPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not (humanoid and hrp) then return end
        
        local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not vehicle then return end
        
        local originalPosition = hrp.CFrame
        enterVehicle()
        wait(0.5)
        tweenObjectToPosition(vehicle, Vector3.new(-84, 5.6, 1109.3), 200)
        exitVehicle()
        wait(0.3)
        goToHospital()
        
        repeat
            wait(0.2)
        until humanoid and humanoid.Health >= 50
        
        humanoid.Sit = false
        wait(0.3)
        enterVehicle()
        wait(0.3)
        tweenObjectToPosition(vehicle, originalPosition.Position, 200)
        wait(0.3)
        enterVehicle()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Self Revive",
            Text = "You are not dead, you cant perform a self revive!",
            Duration = 5
        })
    end
end

local function checkAndRevive()
    if selfReviveEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health <= 0 then
            wait(3)
            selfReviveSequence()
        end
    end
end

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == selfReviveKey then
        selfReviveSequence()
    end
end)

task.spawn(function()
    while true do
        checkAndRevive()
        wait(0.5)
    end
end)

-- Teleport System
local teleportSpeed = 50
local VehiclesFolder = workspace:WaitForChild("Vehicles")

local locationCoordinates = {
    ["Bank"] = CFrame.new(-1174.68, 5.87, 3209.03),
    ["Jewelry"] = CFrame.new(-346.63, 5.87, 3572.74),
    ["Ares Fuel"] = CFrame.new(-870.86, 5.622, 1505.16),
    ["Gas n Go Fuel"] = CFrame.new(-1544.4, 5.619, 3802.16),
    ["Ossu Fuel"] = CFrame.new(-27.55, 5.622, -754.6),
    ["Night Club"] = CFrame.new(-1844.95, 5.872, 3211.08),
    ["Tool Shop"] = CFrame.new(-717.23, 5.654, 729.08),
    ["Food Shop"] = CFrame.new(-911.50, 5.371, -1169.20),
    ["Clothing Store"] = CFrame.new(479.05, 3.158, -1452.59),
    ["Tuning Garage"] = CFrame.new(-1429.04, 5.57, 143.96),
    ["Car Dealership"] = CFrame.new(-1454.02, 5.615, 940.83),
    ["Hospital"] = CFrame.new(-293.16, 5.627, 1053.98),
    ["Prison"] = CFrame.new(-514.34, 5.615, 2795.94),
    ["Police Station"] = CFrame.new(-1658.55, 5.619, 2735.71),
    ["Fire Station"] = CFrame.new(-963.32, 5.865, 3895.37),
    ["Bus Company"] = CFrame.new(-1695.80, 5.882, -1274.29),
    ["Truck Company"] = CFrame.new(652.55, 5.638, 1510.85)
}

local function bringCarToMe()
    local vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if vehicle and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local targetPos = hrp.Position + hrp.CFrame.LookVector * 10
            vehicle:SetPrimaryPartCFrame(CFrame.new(targetPos))
            return true
        end
    end
    return false
end

local function enterVehicleSeat()
    local vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if vehicle then
        local driveSeat = vehicle:FindFirstChild("DriveSeat", true)
        if driveSeat and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                driveSeat:Sit(humanoid)
                wait(0.5)
                return true
            end
        end
    end
    return false
end

local function tweenVehicleToPosition(vehicle, targetPos, speed)
    if not vehicle or not vehicle.PrimaryPart then return false end
    
    local startPosition = vehicle.PrimaryPart.Position
    local distance = (startPosition - targetPos).Magnitude
    local duration = distance / speed
    
    local value = Instance.new("CFrameValue")
    value.Value = vehicle:GetPivot()

    value.Changed:Connect(function(newCFrame)
        vehicle:PivotTo(newCFrame)
        if vehicle.PrimaryPart then
            vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
            vehicle.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    local tween = TweenService:Create(value, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Value = CFrame.new(targetPos)
    })
    
    tween:Play()
    tween.Completed:Wait()
    value:Destroy()
    return true
end

local function teleportToLocation(locationName)
    local location = locationCoordinates[locationName]
    if not location then return end
    
    if bringCarToMe() then
        wait(0.3)
        
        if enterVehicleSeat() then
            local vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
            if vehicle then
                tweenVehicleToPosition(vehicle, location.Position, teleportSpeed)
            end
        end
    end
end

TeleportsTab:AddSection({Name = "Teleport Settings"})

TeleportsTab:AddSlider({
    Name = "Teleport Speed",
    Min = 10,
    Max = 200,
    Color = Color3.fromRGB(255, 255, 255),
    Default = GetSetting("TeleportSpeed", 50),
    Increment = 5,
    ValueName = "",
    Callback = function(v)
        teleportSpeed = v
        SaveSetting("TeleportSpeed", v)
    end
})

TeleportsTab:AddSection({Name = "Robbable Places"})

local robbableDropdown = TeleportsTab:AddDropdown({
    Name = "Select Robbable Place",
    Options = {"Bank", "Jewelry", "Ares Fuel", "Gas n Go Fuel", "Ossu Fuel", "Night Club", "Tool Shop", "Food Shop", "Clothing Store"},
    Default = "Bank",
    Callback = function(v) end
})

TeleportsTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        local selected = robbableDropdown.Value
        if selected then
            teleportToLocation(selected)
        end
    end
})

TeleportsTab:AddSection({Name = "Usable Places"})

local usableDropdown = TeleportsTab:AddDropdown({
    Name = "Select Usable Place",
    Options = {"Tuning Garage", "Car Dealership", "Hospital", "Prison"},
    Default = "Tuning Garage",
    Callback = function(v) end
})

TeleportsTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        local selected = usableDropdown.Value
        if selected then
            teleportToLocation(selected)
        end
    end
})

TeleportsTab:AddSection({Name = "Work Places"})

local workDropdown = TeleportsTab:AddDropdown({
    Name = "Select Work Place",
    Options = {"Police Station", "Fire Station", "Bus Company", "Truck Company"},
    Default = "Police Station",
    Callback = function(v) end
})

TeleportsTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        local selected = workDropdown.Value
        if selected then
            teleportToLocation(selected)
        end
    end
})

TeleportsTab:AddSection({Name = "Self Revive"})

TeleportsTab:AddButton({
    Name = "Manual Revive / Bind : P",
    Callback = function()
        selfReviveSequence()
    end
})

-- ESP System
ESPTab:AddSection({Name = "ESP Settings"})

local espState = {
    espEnabled = false,
    showNames = true,
    showTeams = true,
    showDistance = true,
    showHealth = true,
    showEquipped = true,
    showWanted = true,
    showSkeleton = false,
    skeletonThickness = 3,
    espObjects = {},
    espDistance = 1000
}

local SkeletonBones = {
    {"Head","UpperTorso"},
    {"UpperTorso","LowerTorso"},
    {"UpperTorso","LeftUpperArm"},
    {"LeftUpperArm","LeftLowerArm"},
    {"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"},
    {"RightUpperArm","RightLowerArm"},
    {"RightLowerArm","RightHand"},
    {"LowerTorso","LeftUpperLeg"},
    {"LeftUpperLeg","LeftLowerLeg"},
    {"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"},
    {"RightUpperLeg","RightLowerLeg"},
    {"RightLowerLeg","RightFoot"},
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

local function createSkeleton()
    local t = {}
    for i = 1, #SkeletonBones do
        local l = Drawing.new("Line")
        l.Thickness = 1.5
        l.Transparency = 1
        l.Visible = false
        t[i] = l
    end
    return t
end

local function createESPForPlayer(other)
    if not other.Character then return end
    if espState.espObjects[other.UserId] then return end

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

    espState.espObjects[other.UserId] = {
        billboard = billboard,
        nameLbl = newLabel(0),
        infoLbl = newLabel(20),
        healthLbl = newLabel(38, Color3.fromRGB(120,255,120)),
        equipLbl = newLabel(56, Color3.fromRGB(255,255,0)),
        wantedLbl = newLabel(74),
        skeleton = createSkeleton()
    }
end

local function updateESPEntry(other)
    local entry = espState.espObjects[other.UserId]
    if not entry then return end

    local char = other.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then
        entry.billboard.Enabled = false
        return
    end

    local plrRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not plrRoot then return end

    local dist = (plrRoot.Position - hrp.Position).Magnitude
    if dist > espState.espDistance then
        entry.billboard.Enabled = false
        return
    end

    entry.billboard.Enabled = true
    local teamColor = teamColorForTeam(other.Team)

    entry.nameLbl.Text = espState.showNames and other.Name or ""
    entry.nameLbl.TextColor3 = teamColor

    entry.infoLbl.Text = espState.showDistance and ((other.Team and ("["..other.Team.Name.."] ") or "") .. math.floor(dist) .. "m") or (other.Team and ("["..other.Team.Name.."]") or "")
    entry.healthLbl.Text = espState.showHealth and ("HP: "..math.floor(hum.Health)) or ""

    if espState.showEquipped then
        local tool = char:FindFirstChildOfClass("Tool")
        entry.equipLbl.Text = tool and ("Equipped: "..tool.Name) or "Nothing Equipped"
    else
        entry.equipLbl.Text = ""
    end

    if espState.showWanted then
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

local function updateSkeleton(other)
    local entry = espState.espObjects[other.UserId]
    if not entry or not espState.showSkeleton or not espState.espEnabled then
        if entry and entry.skeleton then
            for _,l in ipairs(entry.skeleton) do l.Visible = false end
        end
        return
    end

    local char = other.Character
    local cam = workspace.CurrentCamera
    if not char then return end

    for i,b in ipairs(SkeletonBones) do
        local a = char:FindFirstChild(b[1])
        local c = char:FindFirstChild(b[2])
        local l = entry.skeleton[i]
        if a and c then
            local p1,v1 = cam:WorldToViewportPoint(a.Position)
            local p2,v2 = cam:WorldToViewportPoint(c.Position)
            if v1 and v2 then
                l.From = Vector2.new(p1.X,p1.Y)
                l.To = Vector2.new(p2.X,p2.Y)
                l.Color = teamColorForTeam(other.Team)
                l.Visible = true
            else
                l.Visible = false
            end
        else
            l.Visible = false
        end
    end
end

local lastESPUpdate = 0
local lastSkelUpdate = 0
local ESP_UPDATE_INTERVAL = 0.2
local SKEL_INTERVAL = 1/120

RunService.RenderStepped:Connect(function()
    local t = tick()

    if espState.espEnabled and t - lastESPUpdate >= ESP_UPDATE_INTERVAL then
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                if not espState.espObjects[p.UserId] then
                    createESPForPlayer(p)
                end
                updateESPEntry(p)
            end
        end
        lastESPUpdate = t
    end

    if t - lastSkelUpdate >= SKEL_INTERVAL then
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and espState.espObjects[p.UserId] then
                updateSkeleton(p)
            end
        end
        lastSkelUpdate = t
    end
end)

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        if espState.espEnabled then
            task.wait(1)
            createESPForPlayer(p)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(p)
    local entry = espState.espObjects[p.UserId]
    if entry then
        if entry.billboard then entry.billboard:Destroy() end
        if entry.skeleton then
            for _,l in ipairs(entry.skeleton) do
                l:Remove()
            end
        end
        espState.espObjects[p.UserId] = nil
    end
end)

ESPTab:AddToggle({
    Name = "Enable ESP",
    Default = GetSetting("ESPEnabled", false),
    Callback = function(v)
        espState.espEnabled = v
        SaveSetting("ESPEnabled", v)
        if not v then
            for _,e in pairs(espState.espObjects) do
                e.billboard:Destroy()
            end
            espState.espObjects = {}
        else
            for _,p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    createESPForPlayer(p)
                end
            end
        end
    end
})

ESPTab:AddToggle({
    Name = "Show Skeleton",
    Default = GetSetting("SkeletonESP", false),
    Save = true,
    Callback = function(Value)
        espState.showSkeleton = Value
        SaveSetting("SkeletonESP", Value)
        for _, entry in pairs(espState.espObjects) do
            if entry.skeleton then
                for _, line in ipairs(entry.skeleton) do
                    line.Visible = Value
                end
            end
        end
    end
})

ESPTab:AddToggle({
    Name = "Show Names", 
    Default = GetSetting("ESPShowNames", true), 
    Callback = function(v) 
        espState.showNames = v
        SaveSetting("ESPShowNames", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Health", 
    Default = GetSetting("ESPShowHealth", true), 
    Callback = function(v) 
        espState.showHealth = v
        SaveSetting("ESPShowHealth", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Distance",
    Default = GetSetting("ShowDistance", true),
    Callback = function(v)
        espState.showDistance = v
        SaveSetting("ShowDistance", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Team",
    Default = GetSetting("ShowTeam", true),
    Callback = function(v)
        espState.showTeams = v
        SaveSetting("ShowTeam", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Wanteds",
    Default = GetSetting("ShowWanteds", true),
    Callback = function(v)
        espState.showWanted = v
        SaveSetting("ShowWanteds", v)
    end
})

ESPTab:AddSlider({
    Name = "ESP Distance",
    Min = 100,
    Max = 700,
    Color = Color3.fromRGB(255, 255, 255),
    Default = GetSetting("ESPDistance", 1000),
    Increment = 50,
    ValueName = "m",
    Callback = function(value)
        espState.espDistance = value
        SaveSetting("ESPDistance", value)
    end
})

ESPTab:AddSlider({
    Name = "Skeleton Thickness",
    Min = 1,
    Max = 6,
    Default = GetSetting("SkeletonThickness", espState.skeletonThickness),
    Increment = 1,
    ValueName = "px",
    Color = Color3.fromRGB(255,255,255),
    Save = true,
    Callback = function(Value)
        espState.skeletonThickness = Value
        SaveSetting("SkeletonThickness", Value)
        for _, entry in pairs(espState.espObjects) do
            if entry.skeleton then
                for _, line in ipairs(entry.skeleton) do
                    line.Thickness = Value
                end
            end
        end
    end
})

-- Chams System
ESPTab:AddSection({Name = "Chams"})

local ChamsSettings = {
    Enabled = false,
    PlayersEnabled = true,
    VehiclesEnabled = true,
    PlayerColor = Color3.fromRGB(255, 0, 0),
    VehicleColor = Color3.fromRGB(0, 255, 255),
    TeamCheck = true,
    Transparency = 0.5,
    ActiveHighlights = {}
}

local function createHighlight(object, color, transparency)
    if object:FindFirstChild("ChamsHighlight") then
        object.ChamsHighlight:Destroy()
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "ChamsHighlight"
    highlight.FillColor = color
    highlight.OutlineColor = color
    highlight.FillTransparency = transparency
    highlight.OutlineTransparency = 0.5
    highlight.Parent = object
    
    return highlight
end

local function updatePlayerChams()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            
            if ChamsSettings.Enabled and ChamsSettings.PlayersEnabled then
                if ChamsSettings.TeamCheck and player.Team == LocalPlayer.Team then
                    if char:FindFirstChild("ChamsHighlight") then
                        char.ChamsHighlight:Destroy()
                    end
                else
                    local color = ChamsSettings.PlayerColor
                    if player.Team then
                        if player.Team.Name == "Police" then
                            color = Color3.fromRGB(0, 100, 255)
                        elseif player.Team.Name == "Citizen" then
                            local hrp = char:FindFirstChild("HumanoidRootPart")
                            if hrp and hrp:GetAttribute("IsWanted") then
                                color = Color3.fromRGB(255, 0, 0)
                            else
                                color = Color3.fromRGB(0, 255, 0)
                            end
                        end
                    end
                    
                    createHighlight(char, color, ChamsSettings.Transparency)
                    ChamsSettings.ActiveHighlights[char] = true
                end
            else
                if char:FindFirstChild("ChamsHighlight") then
                    char.ChamsHighlight:Destroy()
                    ChamsSettings.ActiveHighlights[char] = nil
                end
            end
        end
    end
end

local function updateVehicleChams()
    for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
        if vehicle:IsA("Model") then
            if ChamsSettings.Enabled and ChamsSettings.VehiclesEnabled then
                createHighlight(vehicle, ChamsSettings.VehicleColor, ChamsSettings.Transparency)
                ChamsSettings.ActiveHighlights[vehicle] = true
            else
                if vehicle:FindFirstChild("ChamsHighlight") then
                    vehicle.ChamsHighlight:Destroy()
                    ChamsSettings.ActiveHighlights[vehicle] = nil
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.5) do
        if ChamsSettings.Enabled then
            updatePlayerChams()
            updateVehicleChams()
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        updatePlayerChams()
    end)
end)

workspace.Vehicles.ChildAdded:Connect(function()
    task.wait(0.5)
    updateVehicleChams()
end)

ESPTab:AddToggle({
    Name = "Enable Chams",
    Default = GetSetting("EnableChams", false),
    Callback = function(val)
        ChamsSettings.Enabled = val
        SaveSetting("EnableChams", val)
        
        if val then
            updatePlayerChams()
            updateVehicleChams()
            OrionLib:MakeNotification({
                Name = "Chams",
                Content = "Chams enabled. Players & vehicles highlighted",
                Time = 3
            })
        else
            for object, _ in pairs(ChamsSettings.ActiveHighlights) do
                if object and object:FindFirstChild("ChamsHighlight") then
                    object.ChamsHighlight:Destroy()
                end
            end
            ChamsSettings.ActiveHighlights = {}
        end
    end
})

ESPTab:AddToggle({
    Name = "Highlight Players",
    Default = GetSetting("HighlightPlayers", true),
    Callback = function(val)
        ChamsSettings.PlayersEnabled = val
        SaveSetting("HighlightPlayers", val)
        updatePlayerChams()
    end
})

ESPTab:AddToggle({
    Name = "Highlight Vehicles",
    Default = GetSetting("HighlightVehicles", true),
    Callback = function(val)
        ChamsSettings.VehiclesEnabled = val
        SaveSetting("HighlightVehicles", val)
        updateVehicleChams()
    end
})

ESPTab:AddToggle({
    Name = "Team Check",
    Default = true,
    Callback = function(val)
        ChamsSettings.TeamCheck = val
        updatePlayerChams()
    end
})

ESPTab:AddSlider({
    Name = "Chams Transparency",
    Min = 0,
    Max = 1,
    Default = GetSetting("ChamsTransparency", 0.5),
    Increment = 0.1,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "",
    Callback = function(val)
        ChamsSettings.Transparency = val
        SaveSetting("ChamsTransparency", val)
        updatePlayerChams()
        updateVehicleChams()
    end
})

ESPTab:AddColorpicker({
    Name = "Vehicle Chams Color",
    Default = GetSetting("VehicleChamsColor", Color3.fromRGB(0, 255, 255)),
    Callback = function(color)
        ChamsSettings.VehicleColor = color
        SaveSetting("VehicleChamsColor", color)
        updateVehicleChams()
    end
})

-- Visual Effects
ESPTab:AddSection({Name = "Visual Stuff"})

local fullBrightEnabled = false
local xrayEnabled = false

local originalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

local originalPartProperties = {}
local originalAtmosphere

ESPTab:AddToggle({
    Name = "Remove Atmosphere",
    Default = false,
    Callback = function(val)
        if val then
            local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
            if atmosphere then
                originalAtmosphere = atmosphere:Clone()
                atmosphere:Destroy()
            end
        elseif originalAtmosphere then
            local currentAtmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
            if currentAtmosphere then
                currentAtmosphere:Destroy()
            end
            originalAtmosphere.Parent = Lighting
            originalAtmosphere = nil
        end
    end
})

ESPTab:AddToggle({
    Name = "Full Bright",
    Default = false,
    Callback = function(state)
        fullBrightEnabled = state
        if state then 
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
        else
            Lighting.Brightness = originalLighting.Brightness
            Lighting.ClockTime = originalLighting.ClockTime
            Lighting.FogEnd = originalLighting.FogEnd
            Lighting.GlobalShadows = originalLighting.GlobalShadows
            Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
        end
    end
})

ESPTab:AddToggle({
    Name = "X-Ray",
    Default = false,
    Callback = function(state)
        xrayEnabled = state
        
        if state then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Parent and not v.Parent:FindFirstChild("Humanoid") and v.Parent ~= LocalPlayer.Character then
                    originalPartProperties[v] = {
                        Transparency = v.Transparency,
                        Material = v.Material
                    }
                    
                    v.Transparency = 0.7
                    v.Material = Enum.Material.ForceField
                end
            end
        else
            for part, props in pairs(originalPartProperties) do
                if part and part.Parent then
                    part.Transparency = props.Transparency
                    part.Material = props.Material
                end
            end
            originalPartProperties = {}
        end
    end
})

-- Car Fly System
VehicleModsTab:AddSection({Name = "Car Fly"})

local CarFlySettings = {
    flightEnabled = false,
    safeFlyEnabled = false,
    safeFlyUsed = false,
    flightSpeed = 1,
    flightGuiEnabled = false,
    flightGui = nil,
    guiFlightDirection = Vector3.new(0, 0, 0),
    buttonDirections = {
        W = Vector3.new(0, 0, -1),
        A = Vector3.new(-1, 0, 0),
        S = Vector3.new(0, 0, 1),
        D = Vector3.new(1, 0, 0)
    },
    defaultCharacterParent = nil
}

local function createFlightGui()
    local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    screenGui.Name = "FlightControlGui"
    screenGui.Enabled = false

    local frame = Instance.new("Frame", screenGui)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.new(0.5, 0, 0.8, 0)
    frame.Size = UDim2.new(0, 200, 0, 200)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.BackgroundTransparency = 0.2
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0.1, 0)

    local dragging = false
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    local buttonSize = UDim2.new(0, 60, 0, 60)
    local buttonPositions = {
        W = UDim2.new(0.5, -30, 0, 0),
        A = UDim2.new(0, 0, 0.5, -30),
        S = UDim2.new(0.5, -30, 1, -60),
        D = UDim2.new(1, -60, 0.5, -30)
    }
    local buttonRotations = { W = 0, A = -90, S = 180, D = 90 }

    for key, direction in pairs(CarFlySettings.buttonDirections) do
        local button = Instance.new("ImageButton", frame)
        button.Name = key .. "Button"
        button.Position = buttonPositions[key]
        button.Size = buttonSize
        button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        button.BackgroundTransparency = 0.1

        frame.Active = true
        frame.Draggable = true
        button.Image = "rbxassetid://11432834725"
        button.Rotation = buttonRotations[key]
        Instance.new("UICorner", button).CornerRadius = UDim.new(0.1, 0)

        button.MouseButton1Down:Connect(function()
            CarFlySettings.guiFlightDirection = CarFlySettings.guiFlightDirection + direction
        end)
        button.MouseButton1Up:Connect(function()
            CarFlySettings.guiFlightDirection = CarFlySettings.guiFlightDirection - direction
        end)
    end
    return screenGui
end

task.spawn(function()
    task.wait(0.5)
    CarFlySettings.flightGui = createFlightGui()
end)

local function setFlightGuiEnabled(enabled)
    if not CarFlySettings.flightGui then
        CarFlySettings.flightGui = createFlightGui()
    end
    CarFlySettings.guiFlightDirection = Vector3.zero
    CarFlySettings.flightGui.Enabled = enabled
    CarFlySettings.flightGuiEnabled = enabled
end

VehicleModsTab:AddToggle({
    Name = "Car Fly",
    Default = false,
    Callback = function(val)
        CarFlySettings.flightEnabled = val
        if val then
            CarFlySettings.safeFlyEnabled = true
            CarFlySettings.safeFlyUsed = false
        end
    end
})

VehicleModsTab:AddBind({
    Name = "Car Fly Keybind",
    Default = Enum.KeyCode.X,
    Hold = false,
    Callback = function()
        CarFlySettings.flightEnabled = not CarFlySettings.flightEnabled
        if CarFlySettings.flightEnabled then
            CarFlySettings.safeFlyEnabled = true
            CarFlySettings.safeFlyUsed = false
        end
    end
})

VehicleModsTab:AddSlider({
    Name = "Car Fly Speed",
    Min = 10,
    Max = 300,
    Color = Color3.fromRGB(255, 255, 255),
    Default = GetSetting("CarFlySpeed", 130),
    Increment = 1,
    Callback = function(val)
        CarFlySettings.flightSpeed = val / 50
        SaveSetting("CarFlySpeed", val)
    end
})

VehicleModsTab:AddToggle({
    Name = "Mobile Flight Menu",
    Default = false,
    Callback = function(val)
        setFlightGuiEnabled(val)
    end
})

local function forceEnterCar()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    local vehiclesFolder = workspace:FindFirstChild("Vehicles")
    local car = vehiclesFolder and vehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if car and car:IsA("Model") then
        local driveSeat = car:FindFirstChild("DriveSeat")
        if driveSeat then
            driveSeat:Sit(humanoid)
        end
    end
end

task.spawn(function()
    while task.wait(0.5) do
        if CarFlySettings.flightEnabled and not CarFlySettings.safeFlyEnabled then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and (not humanoid.SeatPart or humanoid.SeatPart.Name ~= "DriveSeat") then
                    forceEnterCar()
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if CarFlySettings.flightEnabled and CarFlySettings.safeFlyEnabled then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.SeatPart and humanoid.SeatPart.Name == "DriveSeat" then
                    humanoid.Sit = false
                    if not CarFlySettings.safeFlyUsed then
                        CarFlySettings.safeFlyUsed = true
                        task.wait(1)
                        CarFlySettings.safeFlyEnabled = false
                    end
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end

    if CarFlySettings.flightEnabled then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local inDriveSeat = humanoid and humanoid.SeatPart and humanoid.SeatPart.Name == "DriveSeat"
            if not inDriveSeat and humanoid then
                local driveSeat = car:FindFirstChild("DriveSeat")
                if driveSeat then
                    driveSeat:Sit(humanoid)
                end
            end

            local driveSeat = car:FindFirstChild("DriveSeat")
            if driveSeat then
                car.PrimaryPart = car.PrimaryPart or driveSeat
                if not CarFlySettings.defaultCharacterParent then
                    CarFlySettings.defaultCharacterParent = character.Parent
                end
                character.Parent = car

                local carCFrame = car:GetPrimaryPartCFrame()
                local camLookVector = workspace.CurrentCamera.CFrame.LookVector
                local moveDirection = Vector3.new(
                    (UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0) + CarFlySettings.guiFlightDirection.X,
                    (UIS:IsKeyDown(Enum.KeyCode.E) and 0.5 or 0) - (UIS:IsKeyDown(Enum.KeyCode.Q) and 0.5 or 0) + CarFlySettings.guiFlightDirection.Y,
                    (UIS:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UIS:IsKeyDown(Enum.KeyCode.W) and 1 or 0) + CarFlySettings.guiFlightDirection.Z
                ) * CarFlySettings.flightSpeed

                car:SetPrimaryPartCFrame(CFrame.new(carCFrame.Position, carCFrame.Position + camLookVector) * CFrame.new(moveDirection))
                driveSeat.AssemblyLinearVelocity = Vector3.zero
                driveSeat.AssemblyAngularVelocity = Vector3.zero

                for _, part in pairs(car:GetDescendants()) do
                    if part:IsA("BasePart") and part ~= driveSeat then
                        part.AssemblyLinearVelocity = Vector3.zero
                        part.AssemblyAngularVelocity = Vector3.zero
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            else
                if character.Parent ~= CarFlySettings.defaultCharacterParent and CarFlySettings.defaultCharacterParent then
                    character.Parent = CarFlySettings.defaultCharacterParent
                    CarFlySettings.defaultCharacterParent = nil
                end
            end
        else
            if character.Parent ~= CarFlySettings.defaultCharacterParent and CarFlySettings.defaultCharacterParent then
                character.Parent = CarFlySettings.defaultCharacterParent
                CarFlySettings.defaultCharacterParent = nil
            end
        end
    else
        if character.Parent ~= CarFlySettings.defaultCharacterParent and CarFlySettings.defaultCharacterParent then
            character.Parent = CarFlySettings.defaultCharacterParent
            CarFlySettings.defaultCharacterParent = nil
        end
    end
end)

-- Fling System
VehicleModsTab:AddSection({Name = "Fling"})

local flingEnabled = false
local flingCooldowns = {}

VehicleModsTab:AddToggle({
    Name = "Enable Fling",
    Default = false,
    Callback = function(val)
        flingEnabled = val
        if val then
            OrionLib:MakeNotification({
                Name = "Fling",
                Content = "Fling enabled!",
                Time = 3
            })
        end
    end
})

RunService.Heartbeat:Connect(function()
    if not flingEnabled then return end
    
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then return end
    
    local driveSeat = car:FindFirstChild("DriveSeat")
    if not driveSeat then return end
    
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.SeatPart ~= driveSeat then return end
    
    for _, part in pairs(driveSeat:GetTouchingParts()) do
        if part:IsA("BasePart") and part.Parent ~= car then
            local otherChar = part.Parent
            if otherChar and otherChar:FindFirstChild("Humanoid") then
                local otherHRP = otherChar:FindFirstChild("HumanoidRootPart")
                if otherHRP then
                    local currentTime = tick()
                    if not flingCooldowns[otherChar] or currentTime - flingCooldowns[otherChar] > 0.3 then
                        local direction = (otherHRP.Position - driveSeat.Position).Unit
                        
                        for _, carPart in pairs(car:GetDescendants()) do
                            if carPart:IsA("BasePart") then
                                carPart.AssemblyLinearVelocity = -direction * 99999999
                            end
                        end
                        
                        flingCooldowns[otherChar] = currentTime
                        break
                    end
                end
            end
        end
    end
end)

VehicleModsTab:AddBind({
    Name = "Fling Hotkey",
    Default = Enum.KeyCode.Z,
    Hold = false,
    Callback = function()
        flingEnabled = not flingEnabled
    end
})

-- Suspension System
VehicleModsTab:AddSection({Name = "Suspension"})

VehicleModsTab:AddSlider({ 
    Name = "Suspension Height",
    Min = 0.5,
    Max = 35,
    Default = 1.5, 
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "",
    Callback = function(Value)
        pcall(function()
            local vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
            if not vehicle then return end

            local driveSeat = vehicle:FindFirstChild("DriveSeat", true)
            if not driveSeat then return end

            for _, v in pairs(driveSeat:GetChildren()) do
                if v:IsA("SpringConstraint") then
                    v.LimitsEnabled = true
                    v.MinLength = Value
                    v.MaxLength = Value
                elseif v:IsA("RopeConstraint") then
                    v.Length = Value
                end
            end
        end)
    end    
})

-- Car Control System
VehicleModsTab:AddSection({Name = "Car Control"})

local accelerationMultiplier = 1
local accelerationEnabled = false
local maxSpeedUncapped = false
local currentMaxSpeed = 250
local stabilizationEnabled = false
local stabilizationStrength = 1

VehicleModsTab:AddSlider({
    Name = "Max Speed Limit",
    Min = 50,
    Max = 500,
    Default = 250,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 5,
    ValueName = "MPH",
    Callback = function(val)
        currentMaxSpeed = val
    end
})

VehicleModsTab:AddToggle({
    Name = "Enable Speed Control",
    Default = false,
    Callback = function(val)
        accelerationEnabled = val
        if val then
            OrionLib:MakeNotification({
                Name = "Speed Control",
                Content = "Vehicle speed control enabled!",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Speed Control",
                Content = "Vehicle speed control disabled!",
                Time = 3
            })
        end
    end
})

VehicleModsTab:AddToggle({
    Name = "Uncap Max Speed",
    Default = false,
    Callback = function(val)
        maxSpeedUncapped = val
        if val then
            OrionLib:MakeNotification({
                Name = "Max Speed",
                Content = "Max speed uncapped!",
                Time = 3
            })
        end
    end
}) 

VehicleModsTab:AddToggle({
    Name = "Speed Stabilization",
    Default = false,
    Callback = function(val)
        stabilizationEnabled = val
        if val then
            OrionLib:MakeNotification({
                Name = "Stabilization",
                Content = "Speed stabilization enabled! Helps break speed barriers.",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Stabilization",
                Content = "Speed stabilization disabled!",
                Time = 3
            })
        end
    end
})

VehicleModsTab:AddSlider({
    Name = "Stabilization Strength",
    Min = 1,
    Max = 10,
    Default = 5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.5,
    ValueName = "x",
    Callback = function(val)
        stabilizationStrength = val
    end
})

VehicleModsTab:AddSlider({
    Name = "Acceleration Multiplier",
    Min = 0.1,
    Max = 5, 
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "x",
    Callback = function(val)
        accelerationMultiplier = val
    end
})

local function removeAllSpeedLimits()
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then return end
    
    pcall(function()
        car:SetAttribute("MaxSpeed", 9999)
        car:SetAttribute("TopSpeed", 9999)
        car:SetAttribute("SpeedLimit", 9999)
        
        for _, part in pairs(car:GetDescendants()) do
            if part:IsA("VectorForce") or part:IsA("LinearVelocity") then
                part:Destroy()
            end
            if part:IsA("BodyVelocity") then
                part.MaxForce = Vector3.new(0, 0, 0)
            end
        end
    end)
end

RunService.Heartbeat:Connect(function()
    if not accelerationEnabled then return end
    
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then return end
    
    local driveSeat = car:FindFirstChild("DriveSeat")
    if not driveSeat then return end
    
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.SeatPart == driveSeat then
        local isAccelerating = UIS:IsKeyDown(Enum.KeyCode.W) or 
                              UIS:IsKeyDown(Enum.KeyCode.Up)
        
        local currentVelocity = driveSeat.AssemblyLinearVelocity
        local carForward = driveSeat.CFrame.LookVector
        local horizontalForward = Vector3.new(carForward.X, 0, carForward.Z).Unit
        local horizontalVelocity = Vector3.new(currentVelocity.X, 0, currentVelocity.Z)
        local currentSpeed = horizontalVelocity.Magnitude
        
        if isAccelerating and accelerationMultiplier > 1 then
            local baseBoost = 5
            local velocityBoost = baseBoost * accelerationMultiplier
            
            local newVelocity = currentVelocity + (horizontalForward * velocityBoost)
            
            local newHorizontalVelocity = Vector3.new(newVelocity.X, 0, newVelocity.Z)
            if newHorizontalVelocity.Magnitude > currentMaxSpeed then
                newHorizontalVelocity = newHorizontalVelocity.Unit * currentMaxSpeed
                newVelocity = Vector3.new(newHorizontalVelocity.X, newVelocity.Y, newHorizontalVelocity.Z)
            end
            
            driveSeat.AssemblyLinearVelocity = newVelocity
        end
        
        if stabilizationEnabled and isAccelerating and currentSpeed > 20 then
            if currentSpeed < currentMaxSpeed - 10 then
                local speedDeficit = currentMaxSpeed - currentSpeed
                local forceMultiplier = math.clamp(speedDeficit / 100, 0.3, 1.5)
                local stabilizationForce = horizontalForward * (stabilizationStrength * 8 * forceMultiplier)
                
                local newVelocity = currentVelocity + stabilizationForce
                
                local newHorizontalVelocity = Vector3.new(newVelocity.X, 0, newVelocity.Z)
                if newHorizontalVelocity.Magnitude > currentMaxSpeed then
                    newHorizontalVelocity = newHorizontalVelocity.Unit * currentMaxSpeed
                    newVelocity = Vector3.new(newHorizontalVelocity.X, newVelocity.Y, newHorizontalVelocity.Z)
                end
                
                driveSeat.AssemblyLinearVelocity = newVelocity
            end
        end
        
        if accelerationEnabled or stabilizationEnabled then
            local finalHorizontalVelocity = Vector3.new(currentVelocity.X, 0, currentVelocity.Z)
            if finalHorizontalVelocity.Magnitude > currentMaxSpeed then
                finalHorizontalVelocity = finalHorizontalVelocity.Unit * currentMaxSpeed
                driveSeat.AssemblyLinearVelocity = Vector3.new(finalHorizontalVelocity.X, currentVelocity.Y, finalHorizontalVelocity.Z)
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if accelerationEnabled or maxSpeedUncapped or stabilizationEnabled then
            removeAllSpeedLimits()
        end
    end
end)

workspace.Vehicles.ChildAdded:Connect(function(child)
    if child.Name == LocalPlayer.Name then
        task.wait(0.5)
        if accelerationEnabled or maxSpeedUncapped or stabilizationEnabled then
            removeAllSpeedLimits()
        end
    end
end)

-- Brake & Reverse System
VehicleModsTab:AddSection({Name = "Brake & Reverse"})

local BrakeForceEnabled = false
local BrakePower = 500
local ReverseSpeedEnabled = false
local ReversePower = 500

VehicleModsTab:AddToggle({
    Name = "Enable Brake Force",
    Default = false,
    Callback = function(val)
        BrakeForceEnabled = val
    end
})

VehicleModsTab:AddSlider({
    Name = "Brake Power",
    Min = 10,
    Max = 2000,
    Default = 500,
    Increment = 10,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "Power",
    Callback = function(val)
        BrakePower = val
    end
})

VehicleModsTab:AddToggle({
    Name = "Reverse",
    Default = false,
    Callback = function(val)
        ReverseSpeedEnabled = val
    end
})

VehicleModsTab:AddSlider({
    Name = "Reverse Power",
    Min = 10,
    Max = 2000,
    Default = 500,
    Increment = 10,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "Power",
    Callback = function(val)
        ReversePower = val
    end
})

local lastVelocity = Vector3.new(0, 0, 0)
local smoothingFactor = 0.3

RunService.Heartbeat:Connect(function()
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then return end
    
    local driveSeat = car:FindFirstChild("DriveSeat")
    if not driveSeat then return end
    
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.SeatPart ~= driveSeat then return end
    
    local currentVelocity = driveSeat.AssemblyLinearVelocity
    local carForward = driveSeat.CFrame.LookVector
    local smoothVelocity = lastVelocity:Lerp(currentVelocity, smoothingFactor)
    
    if BrakeForceEnabled and UIS:IsKeyDown(Enum.KeyCode.S) then
        local brakeDirection = -carForward
        local currentSpeed = Vector3.new(smoothVelocity.X, 0, smoothVelocity.Z).Magnitude
        
        if currentSpeed > 5 then
            local brakeForce = math.min(currentSpeed * 1.5, BrakePower)
            local brakeDelta = brakeDirection * brakeForce * 0.05
            driveSeat.AssemblyLinearVelocity = smoothVelocity + brakeDelta
        end
    end
    
    if ReverseSpeedEnabled and UIS:IsKeyDown(Enum.KeyCode.S) then
        local reverseDirection = -carForward
        local reverseForce = ReversePower * 0.03
        
        if Vector3.new(smoothVelocity.X, 0, smoothVelocity.Z).Magnitude < 500 then
            driveSeat.AssemblyLinearVelocity = smoothVelocity + (reverseDirection * reverseForce)
        end
    end
    
    lastVelocity = driveSeat.AssemblyLinearVelocity
end)

VehicleModsTab:AddButton({
    Name = "Emergency Brake",
    Callback = function()
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not car then return end
        
        local driveSeat = car:FindFirstChild("DriveSeat")
        if not driveSeat then return end
        
        driveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        driveSeat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
})

VehicleModsTab:AddButton({
    Name = "Reset Speed Control",
    Callback = function()
        BrakeForceEnabled = false
        ReverseSpeedEnabled = false
        BrakePower = 500
        ReversePower = 500
    end
})

-- Car Boost System
VehicleModsTab:AddSection({Name = "Car Boost"})

local CarBoostSettings = {
    Enabled = false,
    BoostKey = Enum.KeyCode.LeftShift,
    BoostPower = 200,
    BoostSound = true
}

VehicleModsTab:AddToggle({
    Name = "Car Boost",
    Default = false,
    Callback = function(val)
        CarBoostSettings.Enabled = val
    end
})

VehicleModsTab:AddBind({
    Name = "Boost Keybind",
    Default = Enum.KeyCode.LeftShift,
    Hold = true,
    Callback = function() end
})

VehicleModsTab:AddSlider({
    Name = "Boost Power",
    Min = 50,
    Max = 500,
    Default = 200,
    Increment = 10,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "Power",
    Callback = function(val)
        CarBoostSettings.BoostPower = val
    end
})

RunService.Heartbeat:Connect(function()
    if CarBoostSettings.Enabled and UIS:IsKeyDown(CarBoostSettings.BoostKey) then
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local driveSeat = car:FindFirstChild("DriveSeat")
            if driveSeat then
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.SeatPart == driveSeat then
                    local boostDirection = driveSeat.CFrame.LookVector
                    driveSeat.AssemblyLinearVelocity = driveSeat.AssemblyLinearVelocity + (boostDirection * CarBoostSettings.BoostPower * 0.1)
                end
            end
        end
    end
end)

-- Vehicle Interaction
VehicleModsTab:AddSection({Name = "Interactables"})

VehicleModsTab:AddButton({
    Name = "Enter Car",
    Callback = function()
        local character = LocalPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not car then
            OrionLib:MakeNotification({
                Name = "No Car Found",
                Content = "You don't have a spawned vehicle",
                Time = 3
            })
            return
        end
        
        local driveSeat = car:FindFirstChild("DriveSeat")
        if not driveSeat then
            OrionLib:MakeNotification({
                Name = "No Drive Seat",
                Content = "Could not find drive seat in your vehicle",
                Time = 3
            })
            return
        end
        
        humanoid.Sit = false
        task.wait(0.1)
        driveSeat:Sit(humanoid)
        
        OrionLib:MakeNotification({
            Name = "Entered Car",
            Content = "Successfully entered your vehicle",
            Time = 3
        })
    end
})

VehicleModsTab:AddButton({
    Name = "Bring Car",
    Callback = function()
        bringCarToMe()
    end
})

VehicleModsTab:AddButton({
    Name = "Smart Enter/Bring",
    Callback = function()
        local character = LocalPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not humanoidRootPart then return end
        
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not car then
            OrionLib:MakeNotification({
                Name = "No Car Found",
                Content = "You don't have a spawned vehicle",
                Time = 3
            })
            return
        end
        
        local driveSeat = car:FindFirstChild("DriveSeat")
        if not driveSeat then return end
        
        local carPosition = driveSeat.Position
        local playerPosition = humanoidRootPart.Position
        local distance = (carPosition - playerPosition).Magnitude
        
        if distance > 50 then 
            local bringOffset = 8 
            local camera = workspace.CurrentCamera
            local bringPosition = playerPosition + (camera.CFrame.LookVector * bringOffset)
            
            car:SetPrimaryPartCFrame(CFrame.new(bringPosition) * CFrame.Angles(0, humanoidRootPart.Orientation.Y, 0))
            driveSeat.AssemblyLinearVelocity = Vector3.zero
            driveSeat.AssemblyAngularVelocity = Vector3.zero
            
            task.wait(0.5) 
        end
        
        humanoid.Sit = false
        task.wait(0.1)
        driveSeat:Sit(humanoid)
        
        OrionLib:MakeNotification({
            Name = "Smart Action",
            Content = distance > 50 and "Car brought and entered" or "Entered car",
            Time = 3
        })
    end
})

VehicleModsTab:AddButton({
    Name = "Force Exit Vehicle",
    Callback = function()
        local character = LocalPlayer.Character
        if not character then return end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        if humanoid.Sit then
            humanoid.Sit = false
            humanoid.PlatformStand = false

            OrionLib:MakeNotification({
                Name = "Exited Car",
                Content = "Successfully exited Vehicle",
                Time = 2
            })
        else
            OrionLib:MakeNotification({
                Name = "Not in a Vehicle",
                Content = "You're not currently sitting in a Vehicle",
                Time = 2
            })
        end
    end
})

-- Vehicle Overrides
VehicleModsTab:AddSection({Name = "Overrides"})

local infiniteFuelEnabled = false
local fuelAttributeName = "currentFuel"
local maxFuelValue = 9999999999999999999999

VehicleModsTab:AddToggle({
    Name = "Infinite Fuel",
    Default = GetSetting("InfiniteFuelEnabled", false),
    Callback = function(val)
        infiniteFuelEnabled = val
        SaveSetting("InfiniteFuelEnabled", val)

        if val then 
            task.spawn(function() 
                while infiniteFuelEnabled do 
                    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name) 
                    if car then 
                        car:SetAttribute(fuelAttributeName, maxFuelValue) 
                    end
                    task.wait(0.01) 
                end
            end)
        end
    end
})

local autoRepairEnabled = false

VehicleModsTab:AddToggle({
    Name = "Car GodMode",
    Default = GetSetting("CarGod", false),
    Callback = function(val)
        autoRepairEnabled = val
        SaveSetting("CarGod", val)

        if val then
            task.spawn(function()
                while autoRepairEnabled do
                    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
                    if car then
                        car:SetAttribute("currentHealth", 1000)
                        car:SetAttribute("IsOn", true)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Driver System
VehicleModsTab2:AddSection({Name = "Auto Driver"})

local SimpleAutoDriver = {
    enabled = false,
    cruiseSpeed = 40,
    currentWaypoint = nil,
    waypoints = {},
    state = "DRIVING",
    lastObstacleCheck = 0
}

local RouteLibrary = {
    ["City Loop"] = {
        Vector3.new(-219.6, 5.6, 3506.3),
        Vector3.new(-281.7, 5.6, 3507.1),
        Vector3.new(-304.3, 5.6, 3494.0),
        Vector3.new(-314.5, 5.6, 3462.0),
        Vector3.new(-305.9, 5.6, 2866.6),
        Vector3.new(-313.3, 5.6, 2824.9),
        Vector3.new(-331.6, 5.6, 2784.9),
        Vector3.new(-371.1, 5.6, 2743.8),
        Vector3.new(-422.6, 5.6, 2721.5),
        Vector3.new(-496.7, 5.6, 2718.8),
        Vector3.new(-994.2, 5.6, 2703.9),
        Vector3.new(-1024.3, 5.6, 2697.9),
        Vector3.new(-1038.5, 5.6, 2678.6),
        Vector3.new(-1073.9, 5.6, 2649.4),
        Vector3.new(-1106.0, 5.6, 2647.5),
        Vector3.new(-1159.3, 5.6, 2682.2),
        Vector3.new(-1182.1, 5.6, 2698.8),
        Vector3.new(-1238.4, 5.6, 2704.7),
        Vector3.new(-1833.2, 5.6, 2707.3),
        Vector3.new(-1886.6, 5.6, 2723.3),
        Vector3.new(-1886.5, 5.6, 2752.3),
        Vector3.new(-1883.2, 5.6, 3218.7),
        Vector3.new(-1882.5, 5.6, 3794.6),
        Vector3.new(-1838.4, 5.6, 3900.9),
        Vector3.new(-1769.5, 5.6, 3936.3),
        Vector3.new(-1626.2, 5.6, 3947.9),
        Vector3.new(-1136.1, 5.6, 3947.9),
        Vector3.new(-607.8, 5.6, 3945.9),
        Vector3.new(-413.7, 5.6, 3941.1),
        Vector3.new(-363.0, 5.6, 3910.7),
        Vector3.new(-331.5, 5.6, 3867.7),
        Vector3.new(-316.9, 5.6, 3818.1),
        Vector3.new(-315.1, 5.6, 3737.9),
        Vector3.new(-283.2, 5.6, 3719.1),
        Vector3.new(-215.3, 5.6, 3717.7)
    },
    
    ["Highway Run"] = {
        Vector3.new(-948.7, 5.6, 3292.6),
        Vector3.new(-390.9, -79.1, 3292.7),
        Vector3.new(-199.4, -91.7, 3290.9),
        Vector3.new(-159.4, -91.7, 3283.4),
        Vector3.new(-118.7, -91.7, 3269.6),
        Vector3.new(-19.3, -91.7, 3217.8),
        Vector3.new(37.7, -91.7, 3170.5),
        Vector3.new(99.6, -91.7, 3082.8),
        Vector3.new(142.0, -91.7, 2984.3),
        Vector3.new(152.3, -91.7, 2874.7),
        Vector3.new(155.0, -91.7, 2590.9),
        Vector3.new(154.3, -3.7, 1980.9),
        Vector3.new(153.1, 5.6, 1758.5),
        Vector3.new(152.3, 5.6, 1387.3),
        Vector3.new(155.6, 5.6, 734.0),
        Vector3.new(156.3, 5.6, 155.8),
        Vector3.new(154.1, 5.6, -430.3),
        Vector3.new(152.0, 5.6, -1073.6),
        Vector3.new(152.6, 5.6, -1486.0),
        Vector3.new(152.6, 5.6, -1557.7),
        Vector3.new(161.6, 5.6, -1729.3),
        Vector3.new(153.8, 5.6, -1760.2),
        Vector3.new(130.2, 5.7, -1766.5),
        Vector3.new(112.4, 5.6, -1735.5),
        Vector3.new(113.4, 5.6, -1593.6),
        Vector3.new(113.8, 5.6, -1484.9),
        Vector3.new(116.0, 5.6, -919.3),
        Vector3.new(118.1, 5.6, -371.0),
        Vector3.new(118.1, 5.6, 276.8),
        Vector3.new(118.4, 5.6, 988.5),
        Vector3.new(118.7, 5.6, 1649.0),
        Vector3.new(118.9, -2.6, 1968.2),
        Vector3.new(119.1, -81.4, 2423.5),
        Vector3.new(119.2, -91.7, 2652.5),
        Vector3.new(118.6, -91.7, 2893.5),
        Vector3.new(47.1, -91.7, 3097.3),
        Vector3.new(-33.1, -91.7, 3166.8),
        Vector3.new(-154.7, -91.7, 3235.3),
        Vector3.new(-370.6, -82.3, 3251.4)
    }, 

    ["Business District"] = {
        Vector3.new(-1874.1, 5.6, 2540.0),
        Vector3.new(-1874.9, 5.6, 1951.4),
        Vector3.new(-1875.0, 5.6, 1665.0),
        Vector3.new(-1873.6, 5.6, 1418.6),
        Vector3.new(-1871.8, 5.6, 981.4),
        Vector3.new(-1871.6, 5.6, 817.1),
        Vector3.new(-1871.7, 5.6, 479.0),
        Vector3.new(-1869.1, 5.6, 380.1),
        Vector3.new(-1851.1, 5.6, 327.6),
        Vector3.new(-1816.8, 5.6, 281.1),
        Vector3.new(-1745.7, 5.6, 257.3),
        Vector3.new(-1706.1, 5.6, 256.8),
        Vector3.new(-1455.2, 5.6, 254.2),
        Vector3.new(-1219.8, 5.6, 255.2),
        Vector3.new(-1131.6, 5.6, 256.0),
        Vector3.new(-1103.3, 5.6, 245.6),
        Vector3.new(-1090.0, 5.6, 215.2),
        Vector3.new(-1089.8, 5.6, 32.3),
        Vector3.new(-1089.8, 5.6, -311.5),
        Vector3.new(-1089.8, 5.6, -495.9),
        Vector3.new(-1084.7, 5.6, -888.8),
        Vector3.new(-1077.4, 5.6, -913.5),
        Vector3.new(-1052.1, 5.6, -930.0),
        Vector3.new(-1035.7, 5.6, -946.7),
        Vector3.new(-1026.2, 5.6, -978.8),
        Vector3.new(-1032.5, 5.6, -1009.9),
        Vector3.new(-1048.0, 5.6, -1031.1),
        Vector3.new(-1090.5, 5.6, -1051.2),
        Vector3.new(-1120.9, 5.6, -1045.2),
        Vector3.new(-1144.0, 5.6, -1030.1),
        Vector3.new(-1156.2, 5.6, -1011.2),
        Vector3.new(-1174.1, 5.6, -995.7),
        Vector3.new(-1209.6, 5.6, -992.2),
        Vector3.new(-1427.1, 5.6, -989.4),
        Vector3.new(-1575.2, 5.7, -1004.2),
        Vector3.new(-1636.4, 5.6, -1071.9),
        Vector3.new(-1648.0, 5.6, -1170.1),
        Vector3.new(-1649.7, 5.6, -1368.9),
        Vector3.new(-1637.1, 5.6, -1453.2),
        Vector3.new(-1603.7, 5.6, -1500.1),
        Vector3.new(-1557.1, 5.6, -1528.2),
        Vector3.new(-1436.0, 5.6, -1537.7),
        Vector3.new(-1295.2, 5.6, -1537.2),
        Vector3.new(-1043.1, 5.6, -1537.2),
        Vector3.new(-846.8, 5.6, -1537.1),
        Vector3.new(-521.8, 5.6, -1537.7),
        Vector3.new(-164.2, 5.6, -1537.9),
        Vector3.new(77.4, 5.6, -1537.2),
        Vector3.new(107.9, 5.6, -1532.0),
        Vector3.new(110.3, 5.6, -1514.1),
        Vector3.new(109.5, 5.6, -1048.8),
        Vector3.new(111.1, 5.6, -683.1),
        Vector3.new(110.2, 5.6, -353.1),
        Vector3.new(110.2, 5.6, 119.7),
        Vector3.new(109.2, 5.6, 450.9),
        Vector3.new(110.4, 5.6, 789.3),
        Vector3.new(105.6, 5.6, 800.8),
        Vector3.new(84.7, 5.6, 802.7),
        Vector3.new(-60.2, 5.6, 801.9),
        Vector3.new(-345.6, 5.6, 804.6),
        Vector3.new(-683.0, 5.6, 802.9),
        Vector3.new(-1001.4, 5.6, 798.6),
        Vector3.new(-1028.1, 14.2, 786.3),
        Vector3.new(-1049.1, 5.6, 760.6),
        Vector3.new(-1078.2, 5.6, 747.3),
        Vector3.new(-1126.5, 5.6, 747.6),
        Vector3.new(-1165.2, 5.6, 819.6),
        Vector3.new(-1133.0, 5.6, 866.1),
        Vector3.new(-1108.7, 5.6, 911.2),
        Vector3.new(-1102.1, 5.6, 1103.0),
        Vector3.new(-1101.1, 5.6, 1229.0),
        Vector3.new(-1101.9, 5.6, 1358.5),
        Vector3.new(-1100.7, 5.6, 1547.6),
        Vector3.new(-1099.2, 5.6, 1754.4),
        Vector3.new(-1099.8, 5.6, 2000.5),
        Vector3.new(-1100.9, 5.6, 2215.2),
        Vector3.new(-1103.4, 5.6, 2435.0),
        Vector3.new(-1106.5, 5.6, 2603.2),
    }
}


local function generateWaypoints()
    if RouteLibrary[selectedRoute] then
        SimpleAutoDriver.waypoints = RouteLibrary[selectedRoute]
        SimpleAutoDriver.currentWaypoint = 1
        
        OrionLib:MakeNotification({
            Name = "Auto Driver",
            Content = "Loaded route: " .. selectedRoute .. " (" .. #SimpleAutoDriver.waypoints .. " waypoints)",
            Time = 3
        })
    else
        SimpleAutoDriver.waypoints = RouteLibrary["City Loop"]
        SimpleAutoDriver.currentWaypoint = 1
    end
end

local function getNearestWaypoint()
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car or #SimpleAutoDriver.waypoints == 0 then return 1 end
    
    local carPosition = car:GetPivot().Position
    local nearestIndex = 1
    local nearestDistance = math.huge
    
    for i, waypoint in ipairs(SimpleAutoDriver.waypoints) do
        local distance = (waypoint - carPosition).Magnitude
        if distance < nearestDistance then
            nearestDistance = distance
            nearestIndex = i
        end
    end
    
    return nearestIndex
end

local function getNextWaypoint()
    if #SimpleAutoDriver.waypoints == 0 then
        generateWaypoints()
    end
    
    if not SimpleAutoDriver.currentWaypoint then
        SimpleAutoDriver.currentWaypoint = getNearestWaypoint()
    else
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local carPosition = car:GetPivot().Position
            local currentWaypoint = SimpleAutoDriver.waypoints[SimpleAutoDriver.currentWaypoint]
            
            if (currentWaypoint - carPosition).Magnitude < 25 then
                SimpleAutoDriver.currentWaypoint = (SimpleAutoDriver.currentWaypoint % #SimpleAutoDriver.waypoints) + 1
            end
        end
    end
    
    return SimpleAutoDriver.waypoints[SimpleAutoDriver.currentWaypoint]
end

VehicleModsTab2:AddButton({
    Name = "Start from Nearest Point",
    Callback = function()
        SimpleAutoDriver.currentWaypoint = nil
        if not SimpleAutoDriver.enabled then
            SimpleAutoDriver.enabled = true
        end
        OrionLib:MakeNotification({
            Name = "Auto Driver",
            Content = "Starting from nearest route point",
            Time = 3
        })
    end
})

VehicleModsTab2:AddToggle({
    Name = "Enable Auto Driver",
    Default = false,
    Callback = function(val)
        SimpleAutoDriver.enabled = val
        if val then
            generateWaypoints()
            SimpleAutoDriver.state = "DRIVING"
            OrionLib:MakeNotification({
                Name = "Auto Driver",
                Content = "Autopilot engaged! Following route: " .. selectedRoute,
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Auto Driver",
                Content = "Autopilot disengaged",
                Time = 3
            })
        end
    end
})

VehicleModsTab2:AddLabel("Keep Speed down in Curves or U-Turns")

VehicleModsTab2:AddSlider({
    Name = "Cruise Speed",
    Min = 20,
    Max = 80,
    Default = GetSetting("CruiseSpeed", 40),
    Increment = 5,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "Studs/s",
    Callback = function(val)
        SimpleAutoDriver.cruiseSpeed = val
        SaveSetting("CruiseSpeed", val)
    end
})

RunService.Heartbeat:Connect(function()
    if SimpleAutoDriver.enabled then
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local driveSeat = car:FindFirstChild("DriveSeat")
            if driveSeat then
                local carPosition = driveSeat.Position
                local currentVelocity = driveSeat.AssemblyLinearVelocity
                local currentSpeed = Vector3.new(currentVelocity.X, 0, currentVelocity.Z).Magnitude
                
                local targetWaypoint = SimpleAutoDriver.waypoints[SimpleAutoDriver.currentWaypoint]
                if not targetWaypoint or (targetWaypoint - carPosition).Magnitude < 15 then
                    targetWaypoint = getNextWaypoint()
                end
                
                local toWaypoint = (targetWaypoint - carPosition)
                toWaypoint = Vector3.new(toWaypoint.X, 0, toWaypoint.Z)
                local targetDirection = toWaypoint.Unit
                
                local currentForward = driveSeat.CFrame.LookVector
                local steerStrength = 0.1
                local smoothedDirection = currentForward:Lerp(targetDirection, steerStrength)
                
                local speedDifference = SimpleAutoDriver.cruiseSpeed - currentSpeed
                local acceleration = math.min(math.max(speedDifference * 0.3, -20), 15)
                
                local newVelocity = currentVelocity + (smoothedDirection * acceleration)
                
                if newVelocity.Magnitude > SimpleAutoDriver.cruiseSpeed then
                    newVelocity = newVelocity.Unit * SimpleAutoDriver.cruiseSpeed
                end
                
                driveSeat.AssemblyLinearVelocity = Vector3.new(
                    newVelocity.X,
                    currentVelocity.Y, 
                    newVelocity.Z
                )
                
                if smoothedDirection.Magnitude > 0.1 then
                    local newCFrame = CFrame.new(carPosition, carPosition + smoothedDirection)
                    driveSeat.CFrame = newCFrame
                end
            end
        else
            SimpleAutoDriver.state = "DRIVING"
        end
    end
end)

VehicleModsTab2:AddButton({
    Name = "Emergency Stop",
    Callback = function()
        SimpleAutoDriver.enabled = false
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local driveSeat = car:FindFirstChild("DriveSeat")
            if driveSeat then
                driveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        end
        OrionLib:MakeNotification({
            Name = "Auto Driver",
            Content = "Emergency stop!",
            Time = 3
        })
    end
})

local waypointMarkers = {}
local function visualizeWaypoints()
    for _, marker in pairs(waypointMarkers) do
        marker:Destroy()
    end
    waypointMarkers = {}
    
    for i, waypoint in pairs(SimpleAutoDriver.waypoints) do
        local part = Instance.new("Part")
        part.Name = "WaypointMarker"
        part.Size = Vector3.new(2, 2, 2)
        part.Position = waypoint + Vector3.new(0, 5, 0)
        part.Anchored = true
        part.CanCollide = false
        part.Material = Enum.Material.Neon
        part.BrickColor = i == SimpleAutoDriver.currentWaypoint and BrickColor.new("Bright green") or BrickColor.new("Bright blue")
        part.Parent = workspace
        table.insert(waypointMarkers, part)
    end
end

task.spawn(function()
    while task.wait(1) do
        if SimpleAutoDriver.enabled then
            visualizeWaypoints()
        else
            for _, marker in pairs(waypointMarkers) do
                marker:Destroy()
            end
            waypointMarkers = {}
        end
    end
end)

-- Vehicle Tuning
VehicleModsTab:AddSection({Name = "Vehicle Tuning"})

local function findCarByName(playerName)
    for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
        if vehicle.Name:find(playerName) then
            return vehicle
        end
    end
    return nil
end

local function setCarAttribute(attribute, value)
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name) or findCarByName(LocalPlayer.Name)
    if car then
        car:SetAttribute(attribute, value)
    end
end

VehicleModsTab:AddSlider({
    Name = "Armor",
    Min = 0,
    Max = 6,
    Default = GetSetting("ArmorLevel", 0),
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Callback = function(val)
        setCarAttribute("armorLevel", val)
        SaveSetting("ArmorLevel", val)
    end
})

VehicleModsTab:AddSlider({
    Name = "Brakes",
    Min = 0,
    Max = 6,
    Default = GetSetting("BrakesLevel", 0),
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Callback = function(val)
        setCarAttribute("brakesLevel", val)
        SaveSetting("BrakesLevel", val)
    end
})

VehicleModsTab:AddSlider({
    Name = "Engine",
    Min = 0,
    Max = 6,
    Default = GetSetting("EngineLevel", 0),
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Callback = function(val)
        setCarAttribute("engineLevel", val)
        SaveSetting("EngineLevel", val)
    end
})

-- Drone View System
VehicleModsTab2:AddSection({Name = "Drone View"})

local droneModeEnabled = false
local droneHeight = 30
local originalCFrame = nil
local smoothFactor = 0.1

VehicleModsTab2:AddToggle({
    Name = "Drone Camera",
    Default = false,
    Callback = function(val)
        droneModeEnabled = val
        
        if val then
            OrionLib:MakeNotification({
                Name = "Drone View",
                Content = "Drone camera enabled (Use WASD to move)",
                Time = 3
            })
            
            originalCFrame = workspace.CurrentCamera.CFrame
            
            task.spawn(function()
                local Camera = workspace.CurrentCamera
                local lastPosition = nil
                
                while droneModeEnabled do
                    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
                    local targetPosition
                    
                    if car then
                        targetPosition = car:GetPivot().Position + Vector3.new(0, droneHeight, 0)
                    else
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            targetPosition = character.HumanoidRootPart.Position + Vector3.new(0, droneHeight, 0)
                        else
                            targetPosition = Camera.CFrame.Position
                        end
                    end
                    
                    if lastPosition then
                        targetPosition = lastPosition:Lerp(targetPosition, smoothFactor)
                    end
                    
                    local moveVector = Vector3.new(0, 0, 0)
                    if UIS:IsKeyDown(Enum.KeyCode.W) then
                        moveVector = moveVector + Camera.CFrame.LookVector
                    end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then
                        moveVector = moveVector - Camera.CFrame.LookVector
                    end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then
                        moveVector = moveVector - Camera.CFrame.RightVector
                    end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then
                        moveVector = moveVector + Camera.CFrame.RightVector
                    end
                    
                    moveVector = moveVector * 0.5
                    targetPosition = targetPosition + moveVector
                    
                    local lookPosition
                    if car then
                        lookPosition = car:GetPivot().Position
                    else
                        lookPosition = targetPosition - Vector3.new(0, droneHeight - 5, 0)
                    end
                    
                    Camera.CFrame = CFrame.new(targetPosition, lookPosition)
                    lastPosition = targetPosition
                    
                    RunService.RenderStepped:Wait()
                end
                
                if originalCFrame then
                    Camera.CFrame = originalCFrame
                end
            end)
        end
    end
})

VehicleModsTab2:AddSlider({
    Name = "Drone Height",
    Min = 10,
    Max = 100,
    Default = GetSetting("DroneHeight", 30),
    Increment = 5,
    ValueName = "Studs",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(val)
        droneHeight = val
        SaveSetting("DroneHeight", val)
    end
})

-- Dashcam System
VehicleModsTab2:AddSection({Name = "Dashcam View"})

local dashcamEnabled = false
local dashcamOriginalCFrame = nil
local dashcamPosition = Vector3.new(0, 2, 1)
local dashcamLookOffset = Vector3.new(0, 0, 20)

VehicleModsTab2:AddToggle({
    Name = "Dashcam View",
    Default = false,
    Callback = function(val)
        dashcamEnabled = val
        
        if val then
            OrionLib:MakeNotification({
                Name = "Dashcam",
                Content = "Dashcam view enabled",
                Time = 3
            })
            
            dashcamOriginalCFrame = workspace.CurrentCamera.CFrame
            
            task.spawn(function()
                local Camera = workspace.CurrentCamera
                
                while dashcamEnabled do
                    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
                    
                    if car then
                        local driveSeat = car:FindFirstChild("DriveSeat")
                        
                        if driveSeat then
                            local carCFrame = car:GetPivot()
                            
                            local hoodPosition = carCFrame.Position + 
                                                  (carCFrame.RightVector * dashcamPosition.X) + 
                                                  (carCFrame.UpVector * dashcamPosition.Y) + 
                                                  (carCFrame.LookVector * dashcamPosition.Z)
                            
                            local lookPosition = hoodPosition + (carCFrame.LookVector * dashcamLookOffset.Z)
                            
                            Camera.CFrame = CFrame.new(hoodPosition, lookPosition)
                            
                            if driveSeat.AssemblyLinearVelocity.Magnitude > 10 then
                                local shakeAmount = 0.02 * (driveSeat.AssemblyLinearVelocity.Magnitude / 100)
                                local shake = Vector3.new(
                                    math.random(-shakeAmount, shakeAmount),
                                    math.random(-shakeAmount * 0.5, shakeAmount * 0.5),
                                    math.random(-shakeAmount, shakeAmount)
                                )
                                Camera.CFrame = Camera.CFrame + shake
                            end
                        else
                            local carPosition = car:GetPivot().Position
                            Camera.CFrame = CFrame.new(carPosition + Vector3.new(0, 5, 2), carPosition + Vector3.new(0, 0, 10))
                        end
                    else
                        local character = LocalPlayer.Character
                        if character then
                            local hrp = character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                Camera.CFrame = CFrame.new(
                                    hrp.Position + Vector3.new(0, 1, 1),
                                    hrp.Position + Vector3.new(0, 0, 10)
                                )
                            end
                        end
                    end
                    
                    RunService.RenderStepped:Wait()
                end
                
                if dashcamOriginalCFrame then
                    Camera.CFrame = dashcamOriginalCFrame
                end
            end)
        end
    end
})

VehicleModsTab2:AddSlider({
    Name = "X Position (Left/Right)",
    Min = -3,
    Max = 3,
    Default = 1,
    Increment = 0.1,
    ValueName = "Studs",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(val)
        dashcamPosition = Vector3.new(val, dashcamPosition.Y, dashcamPosition.Z)
    end
})

VehicleModsTab2:AddSlider({
    Name = "Y Position (Height)",
    Min = 0.5,
    Max = 5,
    Default = 2.7,
    Increment = 0.1,
    ValueName = "Studs",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(val)
        dashcamPosition = Vector3.new(dashcamPosition.X, val, dashcamPosition.Z)
    end
})

VehicleModsTab2:AddSlider({
    Name = "Z Position (Front/Back)",
    Min = -2,
    Max = 5,
    Default = 2.5,
    Increment = 0.1,
    ValueName = "Studs",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(val)
        dashcamPosition = Vector3.new(dashcamPosition.X, dashcamPosition.Y, val)
    end
})

VehicleModsTab2:AddButton({
    Name = "Reset Dashcam View",
    Callback = function()
        dashcamPosition = Vector3.new(0, 2, 1)
        dashcamLookOffset = Vector3.new(0, 0, 20)
        OrionLib:MakeNotification({
            Name = "Dashcam",
            Content = "Dashcam position reset",
            Time = 3
        })
    end
})

-- Car Duplicator
VehicleModsTab2:AddSection({Name = "Car Duplicator"})

VehicleModsTab2:AddButton({
    Name = "Duplicate Current Car",
    Callback = function()
        local originalCar = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not originalCar then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No car found!",
                Time = 3
            })
            return
        end
        
        local clone = originalCar:Clone()
        clone.Name = LocalPlayer.Name .. "_Clone_" .. math.random(1000, 9999)
        
        local offset = 10
        local newPosition = originalCar:GetPivot().Position + Vector3.new(offset, 0, 0)
        clone:PivotTo(CFrame.new(newPosition))
        
        clone.Parent = workspace.Vehicles
        
        OrionLib:MakeNotification({
            Name = "Success",
            Content = "Car duplicated!",
            Time = 3
        })
    end
})

VehicleModsTab2:AddButton({
    Name = "Duplicate Nearby Car",
    Callback = function()
        local playerCar = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if not playerCar then return end
        
        local playerPos = playerCar:GetPivot().Position
        local closestCar = nil
        local closestDistance = math.huge
        
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle:IsA("Model") and vehicle ~= playerCar then
                local distance = (vehicle:GetPivot().Position - playerPos).Magnitude
                if distance < closestDistance and distance < 50 then
                    closestDistance = distance
                    closestCar = vehicle
                end
            end
        end
        
        if closestCar then
            local clone = closestCar:Clone()
            clone.Name = "Stolen_" .. closestCar.Name
            clone:PivotTo(playerCar:GetPivot() * CFrame.new(15, 0, 0))
            clone.Parent = workspace.Vehicles
            
            OrionLib:MakeNotification({
                Name = "Success",
                Content = "Nearby car duplicated!",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No nearby car found!",
                Time = 3
            })
        end
    end
})

-- Vehicle Customization
VehicleModsTab2:AddSection({Name = "Vehicle Customization"})

local selectedColor = Color3.fromRGB(255, 255, 255)

VehicleModsTab2:AddColorpicker({
    Name = "Car Color Picker",
    Default = selectedColor,
    Callback = function(color)
        selectedColor = color
    end
})

local function getWheelColor()
    local vehiclesFolder = workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return Color3.fromRGB(255, 255, 255) end
    local car = vehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if not car then return Color3.fromRGB(255, 255, 255) end

    for _, part in pairs(car:GetDescendants()) do
        if part.Name == "FL" or part.Name == "FR" or part.Name == "RL" or part.Name == "RR" then
            local rim = part:FindFirstChild("Rim")
            if rim then
                local main = rim:FindFirstChild("Main")
                if main and main:IsA("BasePart") then
                    return main.Color
                end
            end
        end
    end
    return Color3.fromRGB(255, 255, 255)
end

VehicleModsTab2:AddColorpicker({
    Name = "Rim Color",
    Default = getWheelColor(),
    Callback = function(color)
        local vehiclesFolder = workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then return end
        local car = vehiclesFolder:FindFirstChild(LocalPlayer.Name)
        if not car then return end

        for _, part in pairs(car:GetDescendants()) do
            if part.Name == "FL" or part.Name == "FR" or part.Name == "RL" or part.Name == "RR" then
                local rim = part:FindFirstChild("Rim")
                if rim then
                    local main = rim:FindFirstChild("Main")
                    if main and main:IsA("BasePart") then
                        main.Color = color
                    end
                end
            end
        end
    end
})

VehicleModsTab2:AddButton({
    Name = "Apply Color to Car",
    Callback = function()
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local body = car:FindFirstChild("Body")
            if body then
                for _, part in pairs(body:GetDescendants()) do
                    if part:IsA("BasePart") then
                        local partName = part.Name
                        if partName ~= "Back Glass" and partName ~= "Glass" and partName ~= "Front Glass" then
                            part.Color = selectedColor
                        end
                    end
                end
                OrionLib:MakeNotification({
                    Name = "Color Applied!",
                    Content = "Car color has been changed.",
                    Time = 3
                })
            end
        else
            OrionLib:MakeNotification({
                Name = "No Car Found!",
                Content = "Spawn a vehicle first.",
                Time = 3
            })
        end
    end
})

local selectedMaterial = "SmoothPlastic"

VehicleModsTab2:AddDropdown({
    Name = "Car Material Picker",
    Default = "SmoothPlastic",
    Options = {
        "Plastic", "SmoothPlastic", "Neon", "Metal", "DiamondPlate", "Marble", "Granite", "Brick", 
        "Pebble", "Cobblestone", "Concrete", "CorrodedMetal", "Wood", "WoodPlanks", "Fabric", 
        "Glass", "ForceField", "Ice", "Foil"
    },
    Callback = function(material)
        selectedMaterial = material
    end
})

VehicleModsTab2:AddButton({
    Name = "Apply Material to Car",
    Callback = function()
        local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        if car then
            local body = car:FindFirstChild("Body")
            if body then
                for _, part in pairs(body:GetDescendants()) do
                    if part:IsA("BasePart") then
                        pcall(function()
                            part.Material = Enum.Material[selectedMaterial]
                        end)
                    end
                end
                OrionLib:MakeNotification({
                    Name = "Material Applied!",
                    Content = "Car material has been changed.",
                    Time = 3
                })
            end
        else
            OrionLib:MakeNotification({
                Name = "No Car Found!",
                Content = "Spawn a vehicle first.",
                Time = 3
            })
        end
    end
})

-- Police System
PoliceTab:AddSection({Name = "Utility"})

local AntiTaserEnabled = false

PoliceTab:AddToggle({
    Name = "Anti-Taser",
    Default = GetSetting("AntiTaserEnabled", false),
    Callback = function(val)
        AntiTaserEnabled = val
        SaveSetting("AntiTaserEnabled", val)
        if val then
            task.spawn(function()
                while AntiTaserEnabled do
                    local character = LocalPlayer.Character
                    if character then
                        if character:GetAttribute("Tased") then
                            character:SetAttribute("Tased", false)
                        end
                        
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp:GetAttribute("Tased") then
                            hrp:SetAttribute("Tased", false)
                        end
                        
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") and part:GetAttribute("Tased") then
                                part:SetAttribute("Tased", false)
                            end
                        end
                    end
                    task.wait(0.05)
                end
            end)
        end
    end
})

-- Auto Taser System
local AutoTaserSettings = {
    enabled = false,
    maxRange = 50,
    prediction = 0.15,
    lastFireTime = 0,
    fireCooldown = 0.3,
    debugMode = false
}

local taserRemote = nil
local function findTaserRemote()
    local folder = ReplicatedStorage:FindFirstChild("WvO")
    if folder then
        taserRemote = folder:FindFirstChild("99c8a262-b24b-4a80-a962-df12db3054cd")
    end
    return taserRemote ~= nil
end

findTaserRemote()



startAutoTaser()

PoliceTab:AddToggle({
    Name = "Enable Auto-Taser",
    Default = GetSetting("AutoTaserEnabled", false),
    Callback = function(value)
        AutoTaserSettings.enabled = value
        SaveSetting("AutoTaserEnabled", value)
        
        if value then
            OrionLib:MakeNotification({
                Name = "Auto-Taser",
                Content = "Auto-Taser enabled",
                Time = 3
            })
            
            if not taserRemote and not findTaserRemote() then
                OrionLib:MakeNotification({
                    Name = "Auto-Taser Error",
                    Content = "Taser remote not found!",
                    Time = 5
                })
            end
        else
            OrionLib:MakeNotification({
                Name = "Auto-Taser",
                Content = "Auto-Taser disabled",
                Time = 3
            })
        end
    end
})

PoliceTab:AddSlider({
    Name = "Maximum Range",
    Min = 20,
    Max = 100,
    Default = GetSetting("MaxTaserRange", 50),
    Increment = 5,
    ValueName = "studs",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(value)
        AutoTaserSettings.maxRange = value
        SaveSetting("MaxTaserRange", value)
    end
})

PoliceTab:AddSlider({
    Name = "Prediction",
    Min = 0,
    Max = 0.5,
    Default = GetSetting("PredictionTaser", 0.15),
    Increment = 0.05,
    ValueName = "sec",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(value)
        AutoTaserSettings.prediction = value
        SaveSetting("PredictionTaser", value)
    end
})

-- Taser Customization
PoliceTab:AddSection({Name = "Taser Customization"})

local selectedTaserColor = Color3.fromRGB(255, 255, 0)
local selectedTaserMaterial = "SmoothPlastic"

PoliceTab:AddColorpicker({
    Name = "Taser Color",
    Default = selectedTaserColor,
    Callback = function(color)
        selectedTaserColor = color
    end
})

PoliceTab:AddDropdown({
    Name = "Taser Material",
    Default = GetSetting("TaserMat", "SmoothPlastic"),
    Options = {
        "Plastic", "SmoothPlastic", "Neon", "Metal", "DiamondPlate", 
        "Marble", "Granite", "ForceField", "Glass", "Ice", "Foil"
    },
    Callback = function(material)
        selectedTaserMaterial = material
        SaveSetting("TaserMat", material)
    end
})

PoliceTab:AddButton({
    Name = "Apply to Taser",
    Callback = function()
        local character = LocalPlayer.Character
        local taser = nil
        
        if character then
            taser = character:FindFirstChild("Taser")
        end
        
        if not taser then
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            if backpack then
                taser = backpack:FindFirstChild("Taser")
            end
        end
        
        if taser then
            for _, part in pairs(taser:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "Handle" then
                    part.Color = selectedTaserColor
                    pcall(function()
                        part.Material = Enum.Material[selectedTaserMaterial]
                    end)
                end
            end
            OrionLib:MakeNotification({
                Name = "Taser Customized",
                Content = "Applied color and material to Taser",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "No Taser Found",
                Content = "You need a taser in inventory",
                Time = 3
            })
        end
    end
})

PoliceTab:AddButton({
    Name = "Reset Taser to Default",
    Callback = function()
        local character = LocalPlayer.Character
        local taser = nil
        
        if character then
            taser = character:FindFirstChild("Taser")
        end
        
        if not taser then
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            if backpack then
                taser = backpack:FindFirstChild("Taser")
            end
        end
        
        if taser then
            for _, part in pairs(taser:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "Handle" then
                    part.Color = Color3.fromRGB(255, 255, 0)
                    pcall(function()
                        part.Material = Enum.Material.SmoothPlastic
                    end)
                end
            end
            OrionLib:MakeNotification({
                Name = "Taser Reset",
                Content = "Taser reset to default appearance",
                Time = 3
            })
        end
    end
})

-- Radar Farm System
PoliceTab:AddSection({Name = "Farm"})

local RadarFarm = {
    Enabled = false,
    FireRate = 1, 
    ScanInterval = 0.1, 
}

local Remote = ReplicatedStorage["WvO"]:FindFirstChild("e3a0cb13-da43-46b9-ba5d-e6ea0d913417")

local function scanAndProcessVehicles(character, radarTool)
    if not character or not radarTool then return end
    
    local vehicles = workspace.Vehicles:GetChildren()
    local characterRoot = character.PrimaryPart
    if not characterRoot then return end
    
    for _, vehicle in ipairs(vehicles) do
        if not RadarFarm.Enabled then break end
        
        local driveSeat = vehicle:FindFirstChild("DriveSeat")
        if not driveSeat then continue end
        
        local targetPosition = driveSeat.Position
        local direction = (targetPosition - characterRoot.Position).Unit
        
        Remote:FireServer(radarTool, targetPosition, direction)
    end
end

local function startRadarFarm()
    local lastFireTime = 0
    
    while RadarFarm.Enabled do
        local currentTime = tick()
        
        if currentTime - lastFireTime >= RadarFarm.FireRate then
            local character = LocalPlayer.Character
            if character then
                local radarTool = character:FindFirstChild("Radar Gun")
                if radarTool and Remote then
                    scanAndProcessVehicles(character, radarTool)
                end
            end
            lastFireTime = currentTime
        end
        
        task.wait(RadarFarm.ScanInterval)
    end
end

PoliceTab:AddToggle({
    Name = "Radar Farm",
    Default = false,
    Callback = function(newState)
        RadarFarm.Enabled = newState
        
        if newState then
            task.spawn(startRadarFarm)
        end
    end
})

-- Player Outfits System
PlayerTab:AddSection({Name = "Preset Outfits"})

local presetOutfits = {
    {Name = "Headless", Type = "headless"},
    {Name = "Invisible", Type = "transparency", Value = 1},
    {Name = "Ghost", Type = "transparency", Value = 0.5},
    {Name = "Gold", Type = "color", Color = Color3.fromRGB(255, 215, 0)},
    {Name = "Ice", Type = "color", Color = Color3.fromRGB(173, 216, 230)},
    {Name = "Neon Pink", Type = "color", Color = Color3.fromRGB(255, 0, 255)}
}

local originalStates = {}

local function cacheOriginalStates()
    local char = LocalPlayer.Character
    if not char then return end
    originalStates = {}
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            originalStates[part] = {Color = part.Color, Transparency = part.Transparency}
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    cacheOriginalStates()
end)

if LocalPlayer.Character then
    cacheOriginalStates()
end

local function resetToDefault()
    local char = LocalPlayer.Character
    if not char then return end
    for part, state in pairs(originalStates) do
        if part and part.Parent then
            part.Color = state.Color
            part.Transparency = state.Transparency
        end
    end
end

local function applyHeadless()
    local char = LocalPlayer.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if head then
        head.Transparency = 1
        for _, obj in ipairs(head:GetChildren()) do
            if obj:IsA("Decal") then
                obj:Destroy()
            end
        end
    end
end

local function applyTransparency(value)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = value
        end
    end
end

local function applyColor(color)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            part.Color = color
        end
    end
end

local presetDropdown = PlayerTab:AddDropdown({
    Name = "Select Preset",
    Options = {},
    Default = "",
    Callback = function(option)
        if option == "" then return end
        resetToDefault()
        task.wait(0.1)
        for _, preset in ipairs(presetOutfits) do
            if preset.Name == option then
                if preset.Type == "headless" then
                    applyHeadless()
                elseif preset.Type == "transparency" then
                    applyTransparency(preset.Value)
                elseif preset.Type == "color" then
                    applyColor(preset.Color)
                end
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Outfit Manager",
                    Text = "Applied: " .. option,
                    Duration = 3
                })
                break
            end
        end
    end
})

local function populatePresets()
    local names = {}
    for _, preset in ipairs(presetOutfits) do
        table.insert(names, preset.Name)
    end
    presetDropdown:Refresh(names, names[1] or "")
end

populatePresets()

PlayerTab:AddSection({ Name = "Quick Actions" })

PlayerTab:AddButton({
    Name = "Clear Outfit",
    Callback = function()
        resetToDefault()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Outfit Manager",
            Text = "Outfit reset to default",
            Duration = 3
        })
    end
})

-- Copy Player Outfit
PlayerTab:AddSection({ Name = "Copy Player Outfit" })

local playerListDropdown = PlayerTab:AddDropdown({
    Name = "Select Player",
    Options = {"No players"},
    Default = "No players",
    Callback = function() end
})

local function updatePlayerList()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    if #names == 0 then
        names = {"No players"}
    end
    playerListDropdown:Refresh(names, names[1])
end

local function copyFullOutfit(player)
    local targetChar = player.Character
    local myChar = LocalPlayer.Character
    if not targetChar or not myChar then return false end
    
    pcall(function()
        for _, item in ipairs(myChar:GetChildren()) do
            if item:IsA("Shirt") or item:IsA("Pants") or 
               item:IsA("Accessory") or item:IsA("Hat") then
                item:Destroy()
            end
        end
        
        for _, item in ipairs(targetChar:GetChildren()) do
            if item:IsA("Shirt") or item:IsA("Pants") or 
               item:IsA("Accessory") or item:IsA("Hat") then
                item:Clone().Parent = myChar
            end
        end
        
        local targetHead = targetChar:FindFirstChild("Head")
        local myHead = myChar:FindFirstChild("Head")
        
        if targetHead and myHead then
            local targetFace = targetHead:FindFirstChild("face")
            local myFace = myHead:FindFirstChild("face")
            
            if myFace then myFace:Destroy() end
            if targetFace then
                targetFace:Clone().Parent = myHead
            end
        end
    end)
    
    return true
end

PlayerTab:AddButton({
    Name = "Copy Selected Outfit",
    Callback = function()
        local selected = playerListDropdown.Value
        if selected and selected ~= "No players" then
            local target = Players:FindFirstChild(selected)
            if target then
                copyFullOutfit(target)
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Outfit Manager",
                    Text = "Copied " .. selected .. "'s outfit!",
                    Duration = 3
                })
            end
        end
    end
})

PlayerTab:AddButton({
    Name = "Refresh Player List",
    Callback = updatePlayerList
})

updatePlayerList()
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

game.StarterGui:SetCore("SendNotification", {
    Title = "Outfit Manager",
    Text = "Ready - Presets & Outfit Copy",
    Duration = 5
})

-- Animation System
AnimTab:AddSection({Name = "Animations"})

local currentAnimation = nil
local isAnimationPlaying = false
local animationSpeed = 1.0

local danceAnimations = {
    { Name = "Happy", Id = "rbxassetid://507771019" },
    { Name = "Dance1", Id = "rbxassetid://3695333486" },
    { Name = "Dance2", Id = "rbxassetid://3303391864" },
    { Name = "Fake 67", Id = "rbxassetid://3333499508" },
    { Name = "Dance3", Id = "rbxassetid://4049037604" },
    { Name = "LeftRight", Id = "rbxassetid://4212455378" },
    { Name = "Hip", Id = "rbxassetid://3333136415" },
    { Name = "(Standing) Jacks", Id = "rbxassetid://4265725525" },
    { Name = "Robot", Id = "rbxassetid://3338025566" },
    { Name = "Yipii", Id = "rbxassetid://4841405708" }
}

local cuffedAnimEnabled = false
local cuffedAnimTrack = nil
local deadAnimEnabled = false
local deadAnimTrack = nil

local function setupCuffedAnim(character)
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator") or Instance.new("Animator", humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://9357137817"
    cuffedAnimTrack = animator:LoadAnimation(animation)
    cuffedAnimTrack.Priority = Enum.AnimationPriority.Action
    if cuffedAnimEnabled then
        wait(1)
        cuffedAnimTrack:Play()
    end
end

local function setupDeadAnim(character)
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator") or Instance.new("Animator", humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://11019608524"
    deadAnimTrack = animator:LoadAnimation(animation)
    deadAnimTrack.Priority = Enum.AnimationPriority.Action
    if deadAnimEnabled then
        wait(1)
        deadAnimTrack:Play()
    end
end

local function playDanceAnimation(animationId)
    if currentAnimation then
        currentAnimation:Stop()
        currentAnimation = nil
    end
    
    local character = LocalPlayer.Character
    if not character then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Animations",
            Text = "No character found!",
            Duration = 3
        })
        return
    end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    
    if not humanoid then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Animations",
            Text = "No humanoid found!",
            Duration = 3
        })
        return
    end
    
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end
    
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    
    currentAnimation = animator:LoadAnimation(animation)
    currentAnimation.Priority = Enum.AnimationPriority.Action
    currentAnimation:Play()
    currentAnimation:AdjustSpeed(animationSpeed)
    
    isAnimationPlaying = true
    
    currentAnimation.Stopped:Connect(function()
        isAnimationPlaying = false
    end)
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "Animations",
        Text = "Dance started!",
        Duration = 3
    })
end

local function stopCurrentAnimation()
    if currentAnimation then
        currentAnimation:Stop()
        currentAnimation = nil
    end
    isAnimationPlaying = false
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "Animations",
        Text = "Dance stopped!",
        Duration = 3
    })
end

local selectedDance = danceAnimations[1].Name
local danceDropdown = AnimTab:AddDropdown({
    Name = "Select Dance",
    Options = {},
    Default = selectedDance,
    Callback = function(option)
        selectedDance = option
    end
})

local function populateDanceDropdown()
    local danceNames = {}
    for _, dance in ipairs(danceAnimations) do
        table.insert(danceNames, dance.Name)
    end
    danceDropdown:Refresh(danceNames, danceNames[1])
end

populateDanceDropdown()

local function getAnimationIdByName(name)
    for _, dance in ipairs(danceAnimations) do
        if dance.Name == name then
            return dance.Id
        end
    end
    return danceAnimations[1].Id
end

AnimTab:AddButton({
    Name = "Play Selected Dance",
    Callback = function()
        local animId = getAnimationIdByName(selectedDance)
        playDanceAnimation(animId)
    end
})

AnimTab:AddButton({
    Name = "Stop Current Dance",
    Callback = function()
        stopCurrentAnimation()
    end
})

AnimTab:AddSection({Name = "Animation Settings"})

AnimTab:AddSlider({
    Name = "Animation Speed",
    Min = 0.1,
    Max = 3.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.0,
    Increment = 0.1,
    ValueName = "x",
    Callback = function(value)
        animationSpeed = value
        if currentAnimation then
            currentAnimation:AdjustSpeed(animationSpeed)
        end
    end
})

local autoStopOnMove = false
AnimTab:AddToggle({
    Name = "Auto-Stop When Moving",
    Default = GetSetting("AutoStopMoving", false),
    Callback = function(value)
        autoStopOnMove = value
        SaveSetting("AutoStopMoving", value)
    end
})

local function setupAutoStop(character)
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.Running:Connect(function(speed)
        if autoStopOnMove and isAnimationPlaying and speed > 2 then
            stopCurrentAnimation()
        end
    end)
end

AnimTab:AddSection({Name = "Fake Anims"})

AnimTab:AddToggle({
    Name = "Fake Cuffed",
    Default = false,
    Callback = function(val)
        cuffedAnimEnabled = val
        if not cuffedAnimEnabled then
            if cuffedAnimTrack then 
                cuffedAnimTrack:Stop() 
            end
        else
            if currentAnimation then
                stopCurrentAnimation()
            end
            if deadAnimTrack then
                deadAnimTrack:Stop()
                deadAnimEnabled = false
            end
            if cuffedAnimTrack then 
                cuffedAnimTrack:Play() 
            else
                if LocalPlayer.Character then
                    setupCuffedAnim(LocalPlayer.Character)
                    if cuffedAnimTrack then
                        cuffedAnimTrack:Play()
                    end
                end
            end
        end
    end
})

AnimTab:AddToggle({
    Name = "Fake Dead",
    Default = false,
    Callback = function(val)
        deadAnimEnabled = val
        if not deadAnimEnabled then
            if deadAnimTrack then 
                deadAnimTrack:Stop() 
            end
        else
            if currentAnimation then
                stopCurrentAnimation()
            end
            if cuffedAnimTrack then
                cuffedAnimTrack:Stop()
                cuffedAnimEnabled = false
            end
            if deadAnimTrack then 
                deadAnimTrack:Play() 
            else
                if LocalPlayer.Character then
                    setupDeadAnim(LocalPlayer.Character)
                    if deadAnimTrack then
                        deadAnimTrack:Play()
                    end
                end
            end
        end
    end
})

AnimTab:AddButton({
    Name = "Stop All Animations",
    Callback = function()
        stopCurrentAnimation()
        if cuffedAnimTrack then 
            cuffedAnimTrack:Stop()
            cuffedAnimEnabled = false
        end
        if deadAnimTrack then 
            deadAnimTrack:Stop()
            deadAnimEnabled = false
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "Animations",
            Text = "All animations stopped!",
            Duration = 3
        })
    end
})

AnimTab:AddTextbox({
    Name = "Custom Animation ID",
    Default = "rbxassetid://",
    TextDisappear = false,
    Callback = function(text)
        if text ~= "rbxassetid://" and text ~= "" then
            local customId = text
            if not text:find("rbxassetid://") then
                customId = "rbxassetid://" .. text
            end
            table.insert(danceAnimations, {Name = "Custom Dance", Id = customId})
            populateDanceDropdown()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Animations",
                Text = "Custom dance added to list",
                Duration = 3
            })
        end
    end
})

LocalPlayer.CharacterAdded:Connect(setupAutoStop)

if LocalPlayer.Character then
    setupAutoStop(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setupCuffedAnim)
LocalPlayer.CharacterAdded:Connect(setupDeadAnim)

if LocalPlayer.Character then
    setupCuffedAnim(LocalPlayer.Character)
    setupDeadAnim(LocalPlayer.Character)
end

-- Miscellaneous Features
MiscTab:AddSection({Name = "Utilities"})

MiscTab:AddParagraph("Untested due to Executor downtime.", "Give Feedback with a High Unc Executor in Discord")

MiscTab:AddButton({
    Name = "Infinite Stamina",
    Callback = function()
        if getfenv().firsttime then return end
        getfenv().firsttime = true
        for _, v in pairs(getgc(true)) do
            if type(v) == "function" and getinfo(v).name == "setStamina" then
                hookfunction(v, function(...)
                    return ..., math.huge
                end)
                break
            end
        end
    end
}) 

MiscTab:AddButton({
    Name = "Reset player",
    Callback = function()
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
})

local InfiniteJumpEnabled = false
MiscTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(val)
        InfiniteJumpEnabled = val
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

local noclipEnabled = false
local noclipConnection = nil

MiscTab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(val)
        noclipEnabled = val
        
        if val then
            noclipConnection = RunService.Stepped:Connect(function()
                if noclipEnabled then
                    local character = LocalPlayer.Character
                    if character then
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            
            local character = LocalPlayer.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

local AntiAFK = false

MiscTab:AddToggle({
    Name = "Anti AFK",
    Default = GetSetting("AntiAFK", false),
    Callback = function(val)
        AntiAFK = val
        SaveSetting("AntiAFK", val)
        if val then
            local VirtualUser = game:GetService("VirtualUser")
            LocalPlayer.Idled:Connect(function()
                if AntiAFK then
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end
            end)
        end
    end
}) 

MiscTab:AddToggle({
    Name = "Anti-Fall",
    Default = false,
    Callback = function(val)
        if val then
            getfenv().nofall = RunService.Heartbeat:Connect(function()
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp and hrp.Velocity.Y < -30 and workspace:Raycast(hrp.Position, Vector3.new(0, -20, 0)) then
                    hrp.Velocity = Vector3.zero
                end
            end)
        elseif getfenv().nofall then
            getfenv().nofall:Disconnect()
            getfenv().nofall = nil
        end
    end
})

MiscTab:AddToggle({
    Name = "Anti Downed",
    Default = false,
    Callback = function(Value)
        getgenv().godMode = Value
        while true do
            if not getgenv().godMode then return end

            game.Players.LocalPlayer.Character.Humanoid.Health = 100
            task.wait()
        end
    end,
})

local blurNames = {"Blur", "Bloom", "Flash", "Blind", "White", "BlurEffect", "BloomEffect", "ColorCorrectionEffect"}
local antiBlurActive = false
local blurCons = {}

local function isBlurOrFlashEffect(effect)
    local n = effect.Name:lower()
    if effect:IsA("BlurEffect") or effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") then
        return true
    end
    for _,name in pairs(blurNames) do
        if n:find(name:lower()) then
            return true
        end
    end
    return false
end

local function removeAllBlur()
    for _,v in pairs(Lighting:GetChildren()) do
        if isBlurOrFlashEffect(v) then
            pcall(function() v:Destroy() end)
        end
    end
end

local function enableAntiBlur()
    table.insert(blurCons, Lighting.ChildAdded:Connect(function(child)
        if isBlurOrFlashEffect(child) then
            pcall(function() child:Destroy() end)
        end
    end))

    removeAllBlur()
end

local function disableAntiBlur()
    for _,c in pairs(blurCons) do
        pcall(function() c:Disconnect() end)
    end
    blurCons = {}
end

MiscTab:AddToggle({
    Name = "Anti Flashbang",
    Default = GetSetting("AntiFlash", false),
    Callback = function(v)
        antiBlurActive = v
        SaveSetting("AntiFlash", v)
        if v then
            enableAntiBlur()
        else
            disableAntiBlur()
        end
    end
})

MiscTab:AddTextbox({
    Name = "Custom Plate",
    Default = "HeavenlyHub",
    TextDisappear = false,
    Callback = function(text)
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        for _, gui in ipairs(workspace:GetDescendants()) do
            if gui:IsA("SurfaceGui") and gui.Parent:IsA("BasePart") and (gui.Parent.Position - hrp.Position).Magnitude < 15 then
                local label = gui:FindFirstChildWhichIsA("TextLabel")
                if label then
                    label.Text = text
                end
            end
        end
    end
})

-- Player Customization
MiscTab:AddSection({Name = "Player"})

local selectedPlayerColor = Color3.fromRGB(255, 255, 255)
local selectedPlayerMaterial = "SmoothPlastic"
local originalPlayerColors = {}
local originalPlayerMaterials = {}

MiscTab:AddColorpicker({
    Name = "Player Color",
    Default = GetSetting("PlayerCol", selectedPlayerColor),
    Callback = function(color)
        selectedPlayerColor = color
        SaveSetting("PlayerCol", color)
    end
})

MiscTab:AddDropdown({
    Name = "Player Material",
    Default = GetSetting("PlayerMat", "SmoothPlastic"),
    Options = {
        "Plastic", "SmoothPlastic", "Neon", "Metal", "DiamondPlate", 
        "Marble", "Granite", "ForceField", "Glass", "Ice", "Foil"
    },
    Callback = function(material)
        selectedPlayerMaterial = material
        SaveSetting("PlayerMat", material)
    end
})

MiscTab:AddButton({
    Name = "Apply to Player",
    Callback = function()
        local character = LocalPlayer.Character
        if not character then 
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Character not found",
                Time = 3
            })
            return 
        end
        
        originalPlayerColors = {}
        originalPlayerMaterials = {}
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                originalPlayerColors[part] = part.Color
                originalPlayerMaterials[part] = part.Material
                
                part.Color = selectedPlayerColor
                pcall(function()
                    part.Material = Enum.Material[selectedPlayerMaterial]
                end)
            end
        end
        
        OrionLib:MakeNotification({
            Name = "Player Customized",
            Content = "Applied color and material to player",
            Time = 3
        })
    end
})

MiscTab:AddButton({
    Name = "Reset Player Appearance",
    Callback = function()
        local character = LocalPlayer.Character
        if not character then return end
        
        for part, color in pairs(originalPlayerColors) do
            if part and part.Parent then
                part.Color = color
            end
        end
        
        for part, material in pairs(originalPlayerMaterials) do
            if part and part.Parent then
                pcall(function()
                    part.Material = material
                end)
            end
        end
        
        originalPlayerColors = {}
        originalPlayerMaterials = {}
        
        OrionLib:MakeNotification({
            Name = "Player Reset",
            Content = "Player appearance reset to default",
            Time = 3
        })
    end
})

-- Player Fly System
MiscTab:AddSection({Name = "Fly Settings"})

local playerFly = false
local flyBind = Enum.KeyCode.V
local flySpeed = 50
local isFlying = false
local flyAttachment = nil
local flyAlignPosition = nil
local flyAlignOrientation = nil

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

    spawn(function()
        while isFlying and root and humanoid do
            local moveDir = Vector3.zero
            local camCFrame = workspace.CurrentCamera.CFrame

            if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCFrame.RightVector end

            if moveDir.Magnitude > 0 then
                moveDir = moveDir.Unit
                local newPos = lastPosition + (moveDir * flySpeed * 0.033)
                flyAlignPosition.Position = newPos
                lastPosition = newPos
            end

            flyAlignOrientation.CFrame = CFrame.new(Vector3.zero, camCFrame.LookVector)
            wait(0.033)
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

MiscTab:AddToggle({
    Name = "Enable Player Fly - Bit Buggy",
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

MiscTab:AddSlider({
    Name = "Fly Speed",
    Min = 10,
    Max = 150,
    Default = 50,
    Increment = 5,
    ValueName = "",
    Callback = function(v)
        flySpeed = v
    end
})

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

-- Spinbot System
MiscTab:AddSection({Name = "Spin Settings"})

local spinbotEnabled = false
local spinSpeed = 10

local function updateSpinbot()
    if spinbotEnabled and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
        end
    end
end

MiscTab:AddToggle({
    Name = "Enable SpinBot",
    Default = false,
    Callback = function(v)
        spinbotEnabled = v
    end
})

MiscTab:AddSlider({
    Name = "Spin Speed",
    Min = 1,
    Max = 90,
    Color = Color3.fromRGB(255, 255, 255),
    Default = GetSetting("SpinSpeed", 10),
    Increment = 1,
    ValueName = "°",
    Callback = function(v)
        spinSpeed = v
        SaveSetting("SpinSpeed", v)
    end
})

RunService.RenderStepped:Connect(function()
    updateSpinbot()
end)

-- Night Vision System
MiscTab:AddSection({Name = "Night Vision Settings"})

local nightVisionSettings = {
    enabled = false,
    color = Color3.fromRGB(0, 255, 0),
    brightness = 5,
    originalAmbient = nil,
    originalOutdoorAmbient = nil,
    originalBrightness = nil,
    originalFogEnd = nil
}

nightVisionSettings.originalAmbient = Lighting.Ambient
nightVisionSettings.originalOutdoorAmbient = Lighting.OutdoorAmbient
nightVisionSettings.originalBrightness = Lighting.Brightness
nightVisionSettings.originalFogEnd = Lighting.FogEnd

local function updateNightVision(forceDisable)
    if nightVisionSettings.enabled and not forceDisable then
        Lighting.Ambient = nightVisionSettings.color
        Lighting.OutdoorAmbient = nightVisionSettings.color
        Lighting.Brightness = nightVisionSettings.brightness
        Lighting.FogEnd = 1e6
    else
        Lighting.Ambient = nightVisionSettings.originalAmbient
        Lighting.OutdoorAmbient = nightVisionSettings.originalOutdoorAmbient
        Lighting.Brightness = nightVisionSettings.originalBrightness or 1
        Lighting.FogEnd = nightVisionSettings.originalFogEnd or 1000
    end
end

RunService.RenderStepped:Connect(function()
    if nightVisionSettings.enabled then
        updateNightVision()
    end
end)

MiscTab:AddToggle({
    Name = "Enable Night Vision",
    Default = GetSetting("EnableNightVision", false),
    Callback = function(v)
        nightVisionSettings.enabled = v
        SaveSetting("EnableNightVision", v)
        if not v then
            updateNightVision(true)
        end
    end
})

MiscTab:AddColorpicker({
    Name = "Night Vision Color",
    Default = nightVisionSettings.color,
    Callback = function(color)
        nightVisionSettings.color = color
        if nightVisionSettings.enabled then
            updateNightVision()
        end
    end
})

MiscTab:AddSlider({
    Name = "Brightness",
    Min = 0,
    Max = 10,
    Color = Color3.fromRGB(255, 255, 255),
    Default = nightVisionSettings.brightness,
    Increment = 0.1,
    ValueName = "Brightness",
    Callback = function(value)
        nightVisionSettings.brightness = value
        if nightVisionSettings.enabled then
            updateNightVision()
        end
    end
})

-- Jump Boost System
local jumpBoostEnabled = false
local jumpMultiplier = 1

MiscTab:AddToggle({
    Name = "Jump Boost",
    Default = false,
    Callback = function(val)
        jumpBoostEnabled = val
    end
})

MiscTab:AddSlider({
    Name = "Jump Height",
    Min = 1,
    Max = 50,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.5,
    Callback = function(val)
        jumpMultiplier = val
    end
})

RunService.Heartbeat:Connect(function()
    if jumpBoostEnabled and jumpMultiplier > 1 then
        local character = LocalPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChild("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        
        if humanoid and hrp then
            if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                hrp.AssemblyLinearVelocity = Vector3.new(
                    hrp.AssemblyLinearVelocity.X,
                    50 * jumpMultiplier, 
                    hrp.AssemblyLinearVelocity.Z
                )
            end
        end
    end
end)

-- Speed System
local speedActive = false
local speedValue = 1

MiscTab:AddToggle({
    Name = "Speed",
    Default = false,
    Callback = function(val)
        speedActive = val
    end
})

MiscTab:AddSlider({
    Name = "Multiplier",
    Min = 1,
    Max = 3,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    Callback = function(val)
        speedValue = val
    end
})

RunService.Stepped:Connect(function()
    if not speedActive then return end
    if speedValue <= 1 then return end

    local char = LocalPlayer.Character
    if not char then return end

    local humanoid = char:FindFirstChild("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if humanoid and hrp then
        local moveDir = humanoid.MoveDirection

        if moveDir.Magnitude > 0 then
            hrp.AssemblyLinearVelocity = Vector3.new(
                moveDir.X * 20 * speedValue,
                hrp.AssemblyLinearVelocity.Y,
                moveDir.Z * 20 * speedValue
            )
        end
    end
end)

-- Camera System
MiscTab:AddSection({Name = "Camera"})

local MAX_ZOOM = 5000

MiscTab:AddSlider({
    Name = "Camera Zoom",
    Min = 0,
    Max = 5000,
    Default = 60,
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(value)
        MAX_ZOOM = value
        game.Players.LocalPlayer.CameraMaxZoomDistance = value
    end
})

MiscTab:AddToggle({
    Name = "Wall Transparency",
    Default = false,
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if value then
            player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
        else
            player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom
        end
    end
})

-- Performance Monitor
MiscTab:AddSection({Name = "Performance Monitor"})

local fpsEnabled = false
local fpsLabel = nil

local function createFPSCounter()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSCounter"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.CoreGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 80)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local fpsText = Instance.new("TextLabel")
    fpsText.Name = "FPS"
    fpsText.Size = UDim2.new(1, 0, 0.5, 0)
    fpsText.Position = UDim2.new(0, 0, 0, 0)
    fpsText.BackgroundTransparency = 1
    fpsText.Text = "FPS: 0"
    fpsText.TextColor3 = Color3.fromRGB(0, 255, 0)
    fpsText.TextSize = 18
    fpsText.Font = Enum.Font.GothamBold
    fpsText.Parent = frame
    
    local pingText = Instance.new("TextLabel")
    pingText.Name = "Ping"
    pingText.Size = UDim2.new(1, 0, 0.5, 0)
    pingText.Position = UDim2.new(0, 0, 0.5, 0)
    pingText.BackgroundTransparency = 1
    pingText.Text = "Ping: 0ms"
    pingText.TextColor3 = Color3.fromRGB(0, 255, 255)
    pingText.TextSize = 18
    pingText.Font = Enum.Font.GothamBold
    pingText.Parent = frame
    
    return screenGui
end

local function updateFPSCounter()
    local fps = 0
    local lastUpdate = tick()
    local frameCount = 0
    
    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1
        if tick() - lastUpdate >= 1 then
            fps = frameCount
            frameCount = 0
            lastUpdate = tick()
            
            if fpsLabel and fpsEnabled then
                local fpsText = fpsLabel:FindFirstChild("Frame"):FindFirstChild("FPS")
                local pingText = fpsLabel:FindFirstChild("Frame"):FindFirstChild("Ping")
                
                if fpsText then
                    fpsText.Text = "FPS: " .. fps
                   
                    if fps >= 60 then
                        fpsText.TextColor3 = Color3.fromRGB(0, 255, 0)
                    elseif fps >= 30 then
                        fpsText.TextColor3 = Color3.fromRGB(255, 255, 0)
                    else
                        fpsText.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                end
                
                if pingText then
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                    pingText.Text = "Ping: " .. math.floor(ping) .. "ms"
                   
                    if ping <= 100 then
                        pingText.TextColor3 = Color3.fromRGB(0, 255, 0)
                    elseif ping <= 200 then
                        pingText.TextColor3 = Color3.fromRGB(255, 255, 0)
                    else
                        pingText.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                end
            end
        end
    end)
end

MiscTab:AddToggle({
    Name = "FPS & Ping Counter",
    Default = false,
    Callback = function(val)
        fpsEnabled = val
        if val then
            if not fpsLabel then
                fpsLabel = createFPSCounter()
                updateFPSCounter()
            end
            fpsLabel.Enabled = true
        else
            if fpsLabel then
                fpsLabel.Enabled = false
            end
        end
    end
})

-- FPS Boost
local isEnabled = false

MiscTab:AddButton({
    Name = "FPS Boost",
    Callback = function()
        if isEnabled then
            Lighting.GlobalShadows = true
            Lighting.Technology = Enum.Technology.ShadowMap
            Lighting.Brightness = 1

            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj:IsA("BasePart") then
                    Obj.Material = Enum.Material.Plastic
                    Obj.Transparency = 0
                elseif Obj:IsA("ParticleEmitter") or Obj:IsA("Trail") then
                    Obj.Enabled = true
                elseif Obj:IsA("Decal") then
                    Obj.Transparency = 0
                end
            end

            if workspace.Terrain then
                workspace.Terrain.Decoration = true
            end

            isEnabled = false
        else
            Lighting.GlobalShadows = false
            Lighting.Technology = Enum.Technology.Voxel
            Lighting.Brightness = 3

            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj:IsA("BasePart") then
                    Obj.Material = Enum.Material.Plastic
                elseif Obj:IsA("ParticleEmitter") or Obj:IsA("Trail") then
                    Obj.Enabled = false
                elseif Obj:IsA("Decal") then
                    Obj.Transparency = 1
                end
            end

            if workspace.Terrain then
                workspace.Terrain.Decoration = false
            end

            isEnabled = true
        end
    end
})

-- Bouncy Suspension
MiscTab:AddSection({Name = "Broken & Funny stuff"})

local bbounceSpeed = 0.2
local bbounceActive = false

MiscTab:AddToggle({
    Name = "Bouncy Suspension",
    Default = false,
    Callback = function(Value)
        bbounceActive = Value

        if Value then
            task.spawn(function()
                local bounceHeight = 1.5
                local bounceDirection = 1
                local bounceSpeed = 0.05
                
                while bbounceActive do
                    pcall(function()
                        local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
                        if vehicle then
                            local driveSeat = vehicle:FindFirstChild("DriveSeat", true)
                            if driveSeat then
                                for _, v in pairs(driveSeat:GetChildren()) do
                                    if v:IsA("SpringConstraint") then
                                        v.LimitsEnabled = true
                                        v.MinLength = bounceHeight
                                        v.MaxLength = bounceHeight
                                    end
                                end
                            end
                        end
                    end)
                    
                    if bounceHeight >= 2 then
                        bounceDirection = -1
                    elseif bounceHeight <= 1.5 then
                        bounceDirection = 1
                    end
                    
                    bounceHeight = bounceHeight + (bbounceSpeed * bounceDirection)
                    task.wait(0.05)
                end
            end)
        else
            pcall(function()
                local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
                if vehicle then
                    local driveSeat = vehicle:FindFirstChild("DriveSeat", true)
                    if driveSeat then
                        for _, v in pairs(driveSeat:GetChildren()) do
                            if v:IsA("SpringConstraint") then
                                v.LimitsEnabled = true
                                v.MinLength = 1.5
                                v.MaxLength = 1.5
                            end
                        end
                    end
                end
            end)
        end
    end
})

MiscTab:AddSlider({
    Name = "Bounce Speed",
    Min = 0,
    Max = 100,
    Default = 20,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(Value)
        bbounceSpeed = Value / 100
    end
})

-- Headlight Color System
VehicleModsTab2:AddSection({Name = "Headlight Color"})

local headlightColorEnabled = false
local selectedHeadlightColor = Color3.fromRGB(255, 255, 255)
local headlightBrightness = 100
local rainbowHeadlights = false
local rainbowSpeed = 1

local function applyLightSettings(spotlight)
    if not spotlight or not spotlight:IsA("SpotLight") then return end
    
    if rainbowHeadlights then
        local hue = (tick() * rainbowSpeed) % 1
        spotlight.Color = Color3.fromHSV(hue, 1, 1)
    else
        spotlight.Color = selectedHeadlightColor
    end
    
    spotlight.Brightness = headlightBrightness / 50
    spotlight.Range = 50 
    spotlight.Angle = 45  
end

local function getAllHeadlights()
    local headlights = {}
    
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then 
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle.Name:find(LocalPlayer.Name) then
                car = vehicle
                break
            end
        end
        if not car then return headlights end
    end

    local body = car:FindFirstChild("Body")
    if body then
        local headlightsFolder = body:FindFirstChild("Headlights")
        if headlightsFolder then
            local headlightsSubFolder = headlightsFolder:FindFirstChild("Headlights")
            if headlightsSubFolder then
                local leftHeadlight = headlightsSubFolder:FindFirstChild("Left")
                local rightHeadlight = headlightsSubFolder:FindFirstChild("Right")
                
                if leftHeadlight then
                    local spotlight = leftHeadlight:FindFirstChild("Spotlight") or leftHeadlight:FindFirstChildWhichIsA("SpotLight")
                    if spotlight then
                        table.insert(headlights, spotlight)
                    end
                end
                
                if rightHeadlight then
                    local spotlight = rightHeadlight:FindFirstChild("Spotlight") or rightHeadlight:FindFirstChildWhichIsA("SpotLight")
                    if spotlight then
                        table.insert(headlights, spotlight)
                    end
                end
            end
        end
    end
    
    if #headlights == 0 then
        for _, part in pairs(car:GetDescendants()) do
            if part:IsA("SpotLight") then
                table.insert(headlights, part)
            end
        end
    end

    return headlights
end

local function updateHeadlights()
    if not headlightColorEnabled then return end
    
    local headlights = getAllHeadlights()
    
    if #headlights == 0 then
        return
    end
    
    for _, spotlight in pairs(headlights) do
        applyLightSettings(spotlight)
    end
end

VehicleModsTab2:AddToggle({
    Name = "Custom Headlight Color",
    Default = false,
    Callback = function(val)
        headlightColorEnabled = val
        if val then
            task.wait(0.5)
            updateHeadlights()
            OrionLib:MakeNotification({
                Name = "Headlights",
                Content = "Custom headlight color enabled",
                Time = 3
            })
        else
            local headlights = getAllHeadlights()
            for _, spotlight in pairs(headlights) do
                if spotlight:IsA("SpotLight") then
                    spotlight.Color = Color3.fromRGB(255, 255, 255)
                    spotlight.Brightness = 2
                end
            end
        end
    end
})

VehicleModsTab2:AddColorpicker({
    Name = "Headlight Color",
    Default = selectedHeadlightColor,
    Callback = function(color)
        selectedHeadlightColor = color
        rainbowHeadlights = false 
        if headlightColorEnabled then
            updateHeadlights()
        end
    end
})

VehicleModsTab2:AddSlider({
    Name = "Headlight Brightness",
    Min = 10,
    Max = 500,
    Default = GetSetting("HeadlightBright", 100),
    Increment = 10,
    ValueName = "%",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(val)
        headlightBrightness = val
        SaveSetting("HeadlightBright", val)
        if headlightColorEnabled then
            updateHeadlights()
        end
    end
})

VehicleModsTab2:AddToggle({
    Name = "Rainbow Headlights",
    Default = false,
    Callback = function(val)
        rainbowHeadlights = val
        if val then
            task.spawn(function()
                while rainbowHeadlights and headlightColorEnabled do
                    updateHeadlights()
                    task.wait(0.05)
                end
            end)
        end
    end
})

VehicleModsTab2:AddSlider({
    Name = "Rainbow Speed",
    Min = 0.1,
    Max = 5,
    Default = GetSetting("RainbowSpeed", 1),
    Increment = 0.1,
    Color = Color3.fromRGB(255, 255, 255),
    ValueName = "x Speed",
    Callback = function(val)
        rainbowSpeed = val
        SaveSetting("RainbowSpeed", val)
    end
})

-- Underglow System
VehicleModsTab2:AddSection({Name = "Underglow Lights"})

local UnderglowSettings = {
    Enabled = false,
    Color = Color3.fromRGB(0, 255, 255),
    Rainbow = false,
    Brightness = 2,
    Range = 20
}

local underglowParts = {}

local function createUnderglow()
    for _, part in pairs(underglowParts) do
        if part then part:Destroy() end
    end
    underglowParts = {}
    
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then return end
    
    local positions = {
        Vector3.new(2, -1, 3),   
        Vector3.new(-2, -1, 3),  
        Vector3.new(2, -1, -3),  
        Vector3.new(-2, -1, -3)  
    }
    
    for _, offset in pairs(positions) do
        local light = Instance.new("Part")
        light.Name = "UnderglowLight"
        light.Size = Vector3.new(0.5, 0.5, 0.5)
        light.Transparency = 1
        light.CanCollide = false
        light.Anchored = false
        light.CFrame = car:GetPivot() * CFrame.new(offset)
        
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = light
        weld.Part1 = car.PrimaryPart or car:FindFirstChild("DriveSeat")
        weld.Parent = light
        
        local pointLight = Instance.new("PointLight")
        pointLight.Color = UnderglowSettings.Color
        pointLight.Brightness = UnderglowSettings.Brightness
        pointLight.Range = UnderglowSettings.Range
        pointLight.Parent = light
        
        light.Parent = car
        table.insert(underglowParts, light)
    end
end

VehicleModsTab2:AddToggle({
    Name = "Underglow Lights",
    Default = false,
    Callback = function(val)
        UnderglowSettings.Enabled = val
        if val then
            createUnderglow()
        else
            for _, part in pairs(underglowParts) do
                if part then part:Destroy() end
            end
            underglowParts = {}
        end
    end
})

VehicleModsTab2:AddColorpicker({
    Name = "Underglow Color",
    Default = UnderglowSettings.Color,
    Callback = function(color)
        UnderglowSettings.Color = color
        UnderglowSettings.Rainbow = false
        for _, part in pairs(underglowParts) do
            if part then
                local light = part:FindFirstChildOfClass("PointLight")
                if light then light.Color = color end
            end
        end
    end
})

VehicleModsTab2:AddToggle({
    Name = "Rainbow Underglow",
    Default = false,
    Callback = function(val)
        UnderglowSettings.Rainbow = val
        if val then
            task.spawn(function()
                while UnderglowSettings.Rainbow and UnderglowSettings.Enabled do
                    local hue = (tick() % 5) / 5
                    local color = Color3.fromHSV(hue, 1, 1)
                    for _, part in pairs(underglowParts) do
                        if part then
                            local light = part:FindFirstChildOfClass("PointLight")
                            if light then light.Color = color end
                        end
                    end
                    task.wait(0.05)
                end
            end)
        end
    end
})

-- Custom Engine Sound System
local engineState = {
    inVehicle = false,
    engineActive = false,
    hornActive = true,
    customSound = nil,
    enginePitch = 1.0,
    engineVolume = 1.5,
    hornVolume = 1.0,
    hornPitch = 1.0,
    seat = nil,
    vehicle = nil,
    engineLoop = nil,
    engineType = "Truck Engine",
    hornType = "Classic Horn",
    currentSpeed = 0,
    throttleInput = 0,
    engineRPM = 0,
    previousSpeed = 0,
    currentAcceleration = 0,
    lastHornTime = 0
}

local AllSounds = {
    ["Truck Engine"] = "rbxassetid://85098441998081",
    ["Sports Car"] = "rbxassetid://8916893206",
    ["V8 Muscle"] = "rbxassetid://74832102079275",
    ["Motorcycle"] = "rbxassetid://95861625173344",
    ["Electric Car"] = "rbxassetid://74570409322232",
    ["Classic Car"] = "rbxassetid://6679711103",
    ["Race Car"] = "rbxassetid://81491848767534",
    ["Monster Truck"] = "rbxassetid://1065439616",
    
    ["Classic Horn"] = "rbxassetid://5945905639",
    ["Truck Horn"] = "rbxassetid://86051083118541",
    ["Police Siren"] = "rbxassetid://129944954638234",
    ["Train Horn"] = "rbxassetid://130210820726906",
    ["Boat Horn"] = "rbxassetid://117631655211899",
    ["Fancy Horn"] = "rbxassetid://9113887600",
    ["Goofy Horn"] = "rbxassetid://110741466920489",
    
    ["Truck Engine_preset"] = "0.4|2.5|Deep Diesel",
    ["Sports Car_preset"] = "1.6|1.8|High Rev Sports",
    ["V8 Muscle_preset"] = "0.8|2.2|Powerful V8",
    ["Motorcycle_preset"] = "2.0|1.5|High Pitch Bike",
    ["Electric Car_preset"] = "1.2|1.0|Smooth Electric",
    ["Classic Car_preset"] = "0.9|1.8|Vintage Classic",
    ["Race Car_preset"] = "1.8|2.0|Extreme Racing",
    ["Monster Truck_preset"] = "0.3|3.0|Heavy Monster",
    
    ["Classic Horn_preset"] = "1.0|1.0|Standard Car Horn",
    ["Truck Horn_preset"] = "0.7|2.5|Loud Air Horn",
    ["Police Siren_preset"] = "1.0|2.0|Emergency Siren",
    ["Train Horn_preset"] = "0.5|3.0|Powerful Train",
    ["Boat Horn_preset"] = "0.8|2.2|Deep Ship Horn",
    ["Fancy Horn_preset"] = "1.1|1.2|Elegant Tone"
}

local function detectVehicle()
    local character = LocalPlayer.Character
    if not character then return false end

    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return false end

    local seat = humanoid.SeatPart
    if not seat then
        engineState.seat = nil
        engineState.vehicle = nil
        return false
    end

    engineState.seat = seat
    engineState.vehicle = seat.Parent
    return true
end

local function removeCustomSound()
    if engineState.customSound then
        engineState.customSound:Stop()
        engineState.customSound:Destroy()
        engineState.customSound = nil
    end
end

local function spawnEngineSound()
    removeCustomSound()

    local soundAsset = AllSounds[engineState.engineType]
    if not soundAsset then
        soundAsset = AllSounds["Truck Engine"]
    end

    local newSound = Instance.new("Sound")
    newSound.Name = "CustomEngineSound"
    newSound.SoundId = soundAsset
    newSound.Volume = 0.5
    newSound.Pitch = engineState.enginePitch * 0.6
    newSound.Looped = true
    newSound.MaxDistance = 300
    newSound.RollOffMinDistance = 15

    if engineState.vehicle then
        if engineState.vehicle.PrimaryPart then
            newSound.Parent = engineState.vehicle.PrimaryPart
        else
            newSound.Parent = engineState.vehicle
        end
    else
        newSound.Parent = workspace
    end

    local soundReady = false
    local loadConnection
    loadConnection = newSound.Loaded:Connect(function()
        soundReady = true
        loadConnection:Disconnect()
    end)

    local timeout = tick()
    while not soundReady and tick() - timeout < 3 do
        task.wait(0.1)
    end

    if soundReady then
        local worked = pcall(function()
            newSound:Play()
        end)

        if worked then
            engineState.customSound = newSound
            return true
        end
    end

    newSound:Destroy()
    return false
end

local function fetchVehicleMetrics()
    if not engineState.seat then return 0, 0, 0 end

    local throttle = 0
    local speed = 0
    local rpm = 0

    if engineState.seat:IsA("VehicleSeat") then
        local velocityVector = engineState.seat.Velocity
        local forwardVector = engineState.seat.CFrame.LookVector
        local forwardVelocity = velocityVector:Dot(forwardVector)
        speed = math.abs(forwardVelocity) * 3.6

        throttle = math.abs(engineState.seat.ThrottleFloat)

        local maxSpeed = 150
        local speedPercentage = math.min(speed / maxSpeed, 1)

        local idleRPM = 800
        local maxRPM = 7000
        rpm = idleRPM + (speedPercentage * (maxRPM - idleRPM))

        if throttle > 0.1 then
            rpm = rpm * (1 + (throttle * 0.5))
        end

        local currentTime = tick()
        local speedChange = speed - engineState.previousSpeed
        engineState.currentAcceleration = speedChange / 0.1
        engineState.previousSpeed = speed

        if engineState.currentAcceleration > 10 then
            rpm = rpm * 1.3
        elseif engineState.currentAcceleration > 5 then
            rpm = rpm * 1.15
        end
    else
        local velocityMagnitude = engineState.seat.Velocity.Magnitude
        speed = velocityMagnitude * 3.6
        throttle = 0
        rpm = 800 + (speed / 150 * 6200)
    end

    rpm = math.clamp(rpm, 800, 8000)

    return throttle, math.floor(speed), rpm
end

local function refreshEngineSound()
    if not engineState.customSound or not engineState.engineActive then return end

    local throttle, speed, rpm = fetchVehicleMetrics()
    engineState.throttleInput = throttle
    engineState.currentSpeed = speed
    engineState.engineRPM = rpm

    local minPitch = engineState.enginePitch * 0.5
    local maxPitch = engineState.enginePitch * 2.0

    local rpmNormalized = (rpm - 800) / (8000 - 800)
    local targetPitch = minPitch + (rpmNormalized * (maxPitch - minPitch))

    local minVolume = engineState.engineVolume * 0.3
    local maxVolume = engineState.engineVolume * 1.5

    local targetVolume = minVolume + (rpmNormalized * (maxVolume - minVolume))

    if throttle > 0.3 then
        targetVolume = targetVolume * (1 + (throttle * 0.3))
    end

    if engineState.currentAcceleration > 15 then
        targetPitch = targetPitch * 1.1
        targetVolume = targetVolume * 1.2
    elseif engineState.currentAcceleration > 8 then
        targetPitch = targetPitch * 1.05
        targetVolume = targetVolume * 1.1
    end

    if speed < 1 and throttle < 0.1 then
        targetPitch = engineState.enginePitch * 0.6
        targetVolume = engineState.engineVolume * 0.3
    end

    targetPitch = math.clamp(targetPitch, 0.2, 3.0)
    targetVolume = math.clamp(targetVolume, 0.2, 4.0)

    local smoothFactor = 0.15
    local currentPitch = engineState.customSound.Pitch
    local currentVolume = engineState.customSound.Volume

    local newPitch = currentPitch + (targetPitch - currentPitch) * smoothFactor
    local newVolume = currentVolume + (targetVolume - currentVolume) * smoothFactor

    engineState.customSound.Pitch = newPitch
    engineState.customSound.Volume = newVolume
end

local function initializeSoundSystem()
    if engineState.engineLoop then
        engineState.engineLoop:Disconnect()
        engineState.engineLoop = nil
    end

    removeCustomSound()

    local success = spawnEngineSound()
    if success then
        engineState.engineLoop = RunService.Heartbeat:Connect(function()
            refreshEngineSound()
        end)
        return true
    else
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Failed to load engine sound",
            Time = 3
        })
        return false
    end
end

local function monitorVehicleState()
    while true do
        local wasInVehicle = engineState.inVehicle
        engineState.inVehicle = detectVehicle()

        if engineState.inVehicle ~= wasInVehicle then
            if engineState.inVehicle then
                task.wait(0.5)
                if engineState.engineActive then
                    initializeSoundSystem()
                end
            else
                if engineState.engineLoop then
                    engineState.engineLoop:Disconnect()
                    engineState.engineLoop = nil
                end
                removeCustomSound()
                engineState.currentSpeed = 0
                engineState.throttleInput = 0
                engineState.engineRPM = 0
                engineState.previousSpeed = 0
                engineState.currentAcceleration = 0
            end
        end

        task.wait(0.5)
    end
end

local function toggleEngineState()
    if not engineState.inVehicle then
        OrionLib:MakeNotification({
            Name = "Engine",
            Content = "Enter a vehicle first",
            Time = 3
        })
        return false
    end

    engineState.engineActive = not engineState.engineActive

    if engineState.engineActive then
        local success = initializeSoundSystem()
        if success then
            OrionLib:MakeNotification({
                Name = "Engine",
                Content = "Custom engine ACTIVE",
                Time = 2
            })
        else
            engineState.engineActive = false
            return false
        end
    else
        removeCustomSound()
        if engineState.engineLoop then
            engineState.engineLoop:Disconnect()
            engineState.engineLoop = nil
        end
        OrionLib:MakeNotification({
            Name = "Engine",
            Content = "Custom engine OFF",
            Time = 2
        })
    end

    return true
end

local function activateHorn()
    if not engineState.hornActive then return end
    if not engineState.inVehicle then return end
    if tick() - engineState.lastHornTime < 0.5 then return end

    engineState.lastHornTime = tick()

    local hornSoundAsset = AllSounds[engineState.hornType]
    if not hornSoundAsset then
        hornSoundAsset = AllSounds["Classic Horn"]
    end

    local horn = Instance.new("Sound")
    horn.SoundId = hornSoundAsset
    horn.Volume = engineState.hornVolume
    horn.Pitch = engineState.hornPitch
    horn.Parent = workspace

    horn:Play()

    task.wait(3)
    horn:Destroy()
end

local function previewHorn()
    if not engineState.inVehicle then
        OrionLib:MakeNotification({
            Name = "Horn",
            Content = "Enter a vehicle to test horn",
            Time = 2
        })
        return
    end

    activateHorn()
end

local function applyHornPreset()
    local presetString = AllSounds[engineState.hornType .. "_preset"]
    if presetString then
        local parts = {}
        for part in presetString:gmatch("[^|]+") do
            table.insert(parts, part)
        end
        
        if #parts >= 2 then
            engineState.hornPitch = tonumber(parts[1]) or 1.0
            engineState.hornVolume = tonumber(parts[2]) or 1.0
            
            OrionLib:MakeNotification({
                Name = "Horn Preset",
                Content = parts[3] or "Preset Applied",
                Time = 3
            })
        end
    end
end

local function setupHornControls()
    ContextActionService:BindActionAtPriority(
        "HornOverride",
        function(actionName, inputState)
            if inputState == Enum.UserInputState.Begin then
                activateHorn()
                return Enum.ContextActionResult.Sink
            end
            return Enum.ContextActionResult.Pass
        end,
        false,
        9999,
        Enum.KeyCode.H
    )

    UIS.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.H then
            activateHorn()
        end
    end)
end

local function applyPresetConfig()
    local presetString = AllSounds[engineState.engineType .. "_preset"]
    if presetString then
        local parts = {}
        for part in presetString:gmatch("[^|]+") do
            table.insert(parts, part)
        end
        
        if #parts >= 2 then
            engineState.enginePitch = tonumber(parts[1]) or 1.0
            engineState.engineVolume = tonumber(parts[2]) or 1.5

            if engineState.engineActive and engineState.customSound then
                engineState.customSound.Pitch = engineState.enginePitch * 0.6
                engineState.customSound.Volume = engineState.engineVolume * 0.3
            end

            OrionLib:MakeNotification({
                Name = "Engine Preset",
                Content = parts[3] or "Preset Applied",
                Time = 3
            })
        end
    end
end

-- Add Custom Engine Sound Controls
VehicleModsTab2:AddSection({Name = "Controls"})

local engineToggle = VehicleModsTab2:AddToggle({
    Name = "Custom Engine Sound",
    Default = false,
    Callback = function(enabled)
        if enabled then
            local worked = toggleEngineState()
            if not worked then
                engineToggle:Set(false)
            end
        else
            engineState.engineActive = false
            removeCustomSound()
            if engineState.engineLoop then
                engineState.engineLoop:Disconnect()
                engineState.engineLoop = nil
            end
        end
    end
})

local engineDropdown = VehicleModsTab2:AddDropdown({
    Name = "Select Engine Type",
    Default = "...",
    Options = {"Truck Engine", "Sports Car", "V8 Muscle", "Motorcycle", "Electric Car", "Classic Car", "Race Car", "Monster Truck"},
    Callback = function(selection)
        engineState.engineType = selection
        applyPresetConfig()

        if engineState.engineActive then
            initializeSoundSystem()
        end
    end
})

VehicleModsTab2:AddSection({Name = "Engine Configuration"})

VehicleModsTab2:AddSlider({
    Name = "Engine Pitch",
    Min = 0.2,
    Max = 3.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(value)
        engineState.enginePitch = value
        if engineState.engineActive and engineState.customSound then
            local currentRatio = engineState.customSound.Pitch / engineState.enginePitch
            engineState.customSound.Pitch = value * currentRatio
        end
    end
})

VehicleModsTab2:AddSlider({
    Name = "Engine Volume",
    Min = 0.5,
    Max = 4.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.5,
    Increment = 0.1,
    ValueName = "",
    Callback = function(value)
        engineState.engineVolume = value
        if engineState.engineActive and engineState.customSound then
            local currentRatio = engineState.customSound.Volume / engineState.engineVolume
            engineState.customSound.Volume = value * currentRatio
        end
    end
})

VehicleModsTab2:AddSection({Name = "Horn Controls"})

local hornToggle = VehicleModsTab2:AddToggle({
    Name = "Enable Horn",
    Default = true,
    Callback = function(enabled)
        engineState.hornActive = enabled

        if enabled then
            OrionLib:MakeNotification({
                Name = "Horn",
                Content = "Horn enabled",
                Time = 2
            })
        else
            OrionLib:MakeNotification({
                Name = "Horn",
                Content = "Horn disabled",
                Time = 2
            })
        end
    end
})

VehicleModsTab2:AddSection({Name = "Horn Selection"})

local hornDropdown = VehicleModsTab2:AddDropdown({
    Name = "Select Horn Type",
    Default = "...",
    Options = {"Classic Horn", "Truck Horn", "Police Siren", "Train Horn", "Boat Horn", "Fancy Horn", "Goofy Horn"},
    Callback = function(selection)
        engineState.hornType = selection
        applyHornPreset()
    end
})

VehicleModsTab2:AddSection({Name = "Horn Configuration"})

VehicleModsTab2:AddSlider({
    Name = "Horn Pitch",
    Min = 0.2,
    Max = 3.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(value)
        engineState.hornPitch = value
    end
})

VehicleModsTab2:AddSlider({
    Name = "Horn Volume",
    Min = 0.1,
    Max = 5.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(value)
        engineState.hornVolume = value
    end
})

setupHornControls()
task.spawn(monitorVehicleState)

-- Christmas Code
local ohString1 = "CHRISTMAS25"

local success, errorMessage = pcall(function()
    game:GetService("ReplicatedStorage").WvO["b9a04abf-aea6-466b-8bfc-6a0bc1ae6423"]:FireServer(ohString1)
end)

if not success then
    -- Silent failure
end

-- Initialize Orion
OrionLib:Init()

OrionLib:MakeNotification({
    Name = "Heavenly",
    Content = "Join Discord! discord.gg/MERzRQ2UHn",
    Image = "rbxassetid://6035067873",
    Time = 16
})
