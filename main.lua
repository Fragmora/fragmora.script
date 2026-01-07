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


local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fragmora/fragmora.script/refs/heads/main/orion.lua"))()


local Window = OrionLib:MakeWindow({
    Name = ".gg/MERzRQ2UHn | Heavenly | Emergency Hamburg",
    HidePremium = false,
    IntroIcon = "rbxassetid://120536320464344",
    SaveConfig = true,
    ConfigFolder = "HvnlyEH",
    IntroEnabled = true,
    IntroText = "Access Granted... Welcome to Heavenly"
})

Players = game:GetService("Players")
RunService = game:GetService("RunService")
UIS = game:GetService("UserInputService")
LocalPlayer = Players.LocalPlayer
Camera = workspace.CurrentCamera
TweenService = game:GetService("TweenService")
HttpService = game:GetService("HttpService")
ReplicatedStorage = game:GetService("ReplicatedStorage")

-- creds ja
local TabCredits = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://123810491451954"
})
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

local AimbotTab = Window:MakeTab({
    Name = "Aimbot",
    Icon = "rbxassetid://121615146959714",
    PremiumOnly = false
})

local SilentTab = Window:MakeTab({
    Name = "Silent Aim",
    Icon = "rbxassetid://138025957139303",
    PremiumOnly = false
})

-- Silent Aim Tab für deine Heavenly UI
local SilentTab = Window:MakeTab({
    Name = "Silent Aim",
    Icon = "rbxassetid://138025957139303",
    PremiumOnly = false
})

SilentTab:AddSection({Name = "Silent Aim Options"})

-- Silent Aim Config mit Fehlerbehandlung
local function findRemoteSafe(folderName, remoteName)
    local success, result = pcall(function()
        local repStorage = game:GetService("ReplicatedStorage")
        local folder = repStorage:FindFirstChild(folderName)
        if folder then
            return folder:FindFirstChild(remoteName)
        end
        return nil
    end)
    return success and result or nil
end

local SilentAimRemote = findRemoteSafe("8WX", "75721fbe-0361-4584-8feb-db2f118fa345")

if not SilentAimRemote then
    warn("[Heavenly] Silent Aim Remote nicht gefunden! Silent Aim wird nicht funktionieren.")
end

-- Silent Aim Variablen
local SilentAimEnabled = false
local PredictionEnabled = true
local KnockedCheck = true
local FovEnabled = false
local FovSize = 50
local FovColor = Color3.fromRGB(255, 0, 0)
local SelectedHitParts = { "HumanoidRootPart", "Head" }
local TeamCheckEnabled = false
local ignoreUntouchable = true
local HoldToShootEnabled = false
local ShootSpeed = 5
local IsHoldingKey = false

-- Ignorierte Teams
local ignoredTeams = {
    ["ADAC"] = true,
    ["BusCompany"] = true,
    ["FireDepartment"] = true,
    ["Prisoner"] = true,
    ["TruckCompany"] = true,
}

-- FOV Circle erstellen
local FovCircle = Drawing.new("Circle")
FovCircle.Filled = false
FovCircle.Transparency = 1
FovCircle.Thickness = 1
FovCircle.Color = FovColor
FovCircle.Radius = FovSize
FovCircle.Visible = false

-- FOV Circle aktualisieren
local function updateFovCircle()
    local cam = game:GetService("Workspace").CurrentCamera
    if cam and cam.ViewportSize then
        FovCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
        FovCircle.Radius = FovSize
        FovCircle.Color = SilentAimEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        FovCircle.Visible = FovEnabled or SilentAimEnabled
    end
end

-- FOV Update-Loop
game:GetService("RunService").RenderStepped:Connect(updateFovCircle)

-- Silent Aim Toggle
SilentTab:AddToggle({
    Name = "Silent Aim",
    Default = GetSetting("SilentAimEnabled", false),
    Save = true,
    Flag = "SilentAim",
    Callback = function(Value)
        SilentAimEnabled = Value
        SaveSetting("SilentAimEnabled", Value)
        updateFovCircle()
        if Value then
            OrionLib:MakeNotification({
                Name = "Silent Aim",
                Content = "Silent Aim aktiviert",
                Image = "rbxassetid://6035067873",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Silent Aim",
                Content = "Silent Aim deaktiviert",
                Image = "rbxassetid://6035067873",
                Time = 3
            })
        end
    end
})

-- Silent Aim Keybind
SilentTab:AddBind({
    Name = "Silent Aim Keybind",
    Default = Enum.KeyCode.K,
    Save = true,
    Flag = "SilentAimKeybind",
    Hold = false,
    Callback = function()
        SilentAimEnabled = not SilentAimEnabled
        updateFovCircle()
        OrionLib:MakeNotification({
            Name = "Silent Aim",
            Content = "Silent Aim: " .. (SilentAimEnabled and "AN" or "AUS"),
            Image = "rbxassetid://6035067873",
            Time = 2
        })
    end
})

-- Show FOV Toggle
SilentTab:AddToggle({
    Name = "Show FOV",
    Default = GetSetting("ShowFOVSilentAim", false),
    Save = true,
    Flag = "ShowFOVSilentAim",
    Callback = function(Value)
        FovEnabled = Value
        SaveSetting("ShowFOVSilentAim", Value)
        updateFovCircle()
    end
})

-- Ignore Untouchable Teams Toggle
SilentTab:AddToggle({
    Name = "Ignore Untouchable Teams",
    Default = GetSetting("IgnoreUntouchableTeams", true),
    Save = true,
    Flag = "IgnoreUntouchableTeams",
    Callback = function(Value)
        ignoreUntouchable = Value
        SaveSetting("IgnoreUntouchableTeams", Value)
    end
})

-- Other toggles and sliders
SilentTab:AddToggle({
    Name = "Hit Prediction",
    Default = GetSetting("PredictionEnabled", true),
    Save = true,
    Flag = "PredictionEnabled",
    Callback = function(Value)
        PredictionEnabled = Value
        SaveSetting("PredictionEnabled", Value)
    end
})

SilentTab:AddToggle({
    Name = "Ignores Dead People",
    Default = GetSetting("KnockedCheck", true),
    Save = true,
    Flag = "KnockedCheck",
    Callback = function(Value)
        KnockedCheck = Value
        SaveSetting("KnockedCheck", Value)
    end
})

SilentTab:AddToggle({
    Name = "Ignore Team",
    Default = GetSetting("TeamCheck", false),
    Save = true,
    Flag = "TeamCheck",
    Callback = function(Value)
        TeamCheckEnabled = Value
        SaveSetting("TeamCheck", Value)
    end
})

-- Shoot Speed Slider
SilentTab:AddSlider({
    Name = "Shoot Speed",
    Min = 1,
    Max = 20,
    Default = GetSetting("ShootSpeedSilentAim", 10),
    Increment = 1,
    Suffix = "Shots/Sec",
    Color = Color3.fromRGB(9, 99, 195),
    Save = true,
    Flag = "ShootSpeedSilentAim",
    Callback = function(Value)
        ShootSpeed = Value
        SaveSetting("ShootSpeedSilentAim", Value)
    end
})

SilentTab:AddSlider({
    Name = "FOV Size",
    Min = 10,
    Max = 300,
    Default = GetSetting("FovSizeSilentAim", 50),
    Increment = 5,
    Suffix = "Units",
    Color = Color3.fromRGB(9, 99, 195),
    Save = true,
    Flag = "FovSizeSilentAim",
    Callback = function(Value)
        FovSize = Value
        SaveSetting("FovSizeSilentAim", Value)
        updateFovCircle()
    end
})

SilentTab:AddSection({
    Name = "Special Mods"
})

SilentTab:AddToggle({
    Name = "Hold to Shoot",
    Default = GetSetting("HoldToShootSilentAim", false),
    Save = true,
    Flag = "HoldToShootSilentAim",
    Callback = function(Value)
        HoldToShootEnabled = Value
        SaveSetting("HoldToShootSilentAim", Value)
    end
})

SilentTab:AddBind({
    Name = "Hold to Shoot Keybind",
    Default = Enum.KeyCode.Q,
    Save = true,
    Flag = "HoldToShootKeybindSilentAim",
    Hold = true,
    Callback = function(Value)
        IsHoldingKey = Value
    end
})

-- Funktionen
local function isValidTarget(player)
    local localPlayer = game:GetService("Players").LocalPlayer
    
    -- Check if player is in an ignored team (always check this regardless of TeamCheckEnabled)
    if ignoreUntouchable and player.Team and ignoredTeams[player.Team.Name] then
        return false
    end
    
    -- Only check team colors if TeamCheckEnabled is true
    if TeamCheckEnabled then
        if not player.Team or not localPlayer.Team then return true end
        
        local localTeam = localPlayer.Team.Name
        local targetTeam = player.Team.Name
        return (localTeam == "Citizen" and targetTeam == "Police") or
            (localTeam == "Police" and targetTeam == "Citizen")
    end
    
    return true
end

local function isPlayerKnocked(player)
    if not KnockedCheck then return false end
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        return humanoid and humanoid.Health <= 25.5
    end
    return false
end

local function calculatePrediction(player, targetPartName)
    local targetPart = player.Character and player.Character:FindFirstChild(targetPartName)
    if not targetPart then return nil end
    local velocity = targetPart.Velocity or Vector3.new()
    local distance = (targetPart.Position - game:GetService("Players").LocalPlayer.Character.Head.Position).Magnitude
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
    local predictionTime = ping + 0.05
    local predictedPosition = targetPart.Position + (velocity * predictionTime)
    return predictedPosition
end

local lastShotTime = 0
local function fireAtPlayer(player)
    if not player or not player.Character then return end
    if isPlayerKnocked(player) then return end
    
    -- Check shoot cooldown
    local currentTime = tick()
    if currentTime - lastShotTime < (1 / ShootSpeed) then
        return
    end
    
    local localPlayer = game:GetService("Players").LocalPlayer
    local character = localPlayer.Character
    if not character then return end
    
    local weapons = {'G36', 'M4 Carbine', 'M58B Shotgun', 'MP5', 'Glock 17', 'Sniper'}
    local weapon = nil
    for _, name in ipairs(weapons) do
        local w = character:FindFirstChild(name)
        if w then
            weapon = w
            break
        end
    end
    if not weapon then return end
    
    for _, partName in ipairs(SelectedHitParts) do
        local targetPart = player.Character:FindFirstChild(partName)
        if targetPart then
            local predictedPosition = calculatePrediction(player, partName)
            if not predictedPosition then continue end
            local direction = (predictedPosition - character.Head.Position).Unit
            if weapon and predictedPosition and direction then
                -- Sichere Remote-Ausführung
                pcall(function()
                    SilentAimRemote:FireServer(weapon, predictedPosition, direction)
                end)
                
                lastShotTime = currentTime
                FovCircle.Color = Color3.fromRGB(0, 255, 0)
                task.delay(0.2, function()
                    FovCircle.Color = SilentAimEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                end)
                break
            end
        end
    end
end

local function IsVisible(targetPart)
    return true
end

local function GetNearestTarget()
    local localPlayer = game:GetService("Players").LocalPlayer
    local camera = game:GetService("Workspace").CurrentCamera
    local closestPlayer = nil
    local shortestDistance = FovSize
    
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= localPlayer and player.Character and isValidTarget(player) and not isPlayerKnocked(player) then
            for _, partName in ipairs(SelectedHitParts) do
                local targetPart = player.Character:FindFirstChild(partName)
                if targetPart and IsVisible(targetPart) then
                    local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen and screenPos.Z > 0 then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - FovCircle.Position).Magnitude
                        if distance <= FovSize and distance < shortestDistance then
                            shortestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

-- Shooting logic
game:GetService("RunService").Stepped:Connect(function()
    if SilentAimEnabled and SilentAimRemote then
        local target = GetNearestTarget()
        
        if target then
            -- Check if we should shoot based on mode
            local shouldShoot = true
            
            if HoldToShootEnabled then
                shouldShoot = IsHoldingKey
            end
            
            if shouldShoot then
                fireAtPlayer(target)
            end
        end
    end
end)

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

--hier ma random autorob yo

local AutoRobTab = Window:MakeTab({
    Name = "Auto Rob",
    Icon = "rbxassetid://112398672404328",
    PremiumOnly = false
})

AutoRobTab:AddSection({
    Name = "Auto Robbery System"
})

AutoRobTab:AddParagraph("If you launch the autorob menu, this will automatically close")


AutoRobTab:AddButton({
    Name = "Load AutoRob System",
    Callback = function()
        local success, err = pcall(function()
            local autoRobScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fragmora/fragmora.script/refs/heads/main/autorob.lua"))()
            if autoRobScript then
                autoRobScript()
            end
        end)
        
        if not success then
            OrionLib:MakeNotification({
                Name = "Load Error",
                Content = "Failed to load AutoRob: " .. tostring(err),
                Time = 5
            })
        end
    end
})

AimbotTab:AddSection({
    Name = "Aimbot"
})

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

AimbotTab:AddSection({
    Name = "Checks"
})

AimbotTab:AddToggle({
    Name = "Team Check",
    Default = GetSetting("TeamCheck", true),
    Callback = function(val)
        TeamCheck = val
        SaveSetting("TeamCheck", val)
    end
})

AimbotTab:AddSection({
    Name = "Prediction"
})

AimbotTab:AddToggle({
    Name = "Enable Prediction",
    Default = GetSetting("Prediction", false),
    Callback = function(val)
        Prediction = val
        SaveSetting("Prediction", val)
    end
})

-- aimbot Logic
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AutoTaserConfig = {
    enabled = false,
    maxRange = 50,
    prediction = 0.15,
    lastFire = 0,
    cooldown = 0.3,
    debugMode = true
}

local AntiCheatBypass = {
    enabled = false,
    velocityLimit = 500,
    lastBypassTime = 0,
    bypassInterval = 5
}

local ImprovedCarFlySettings = {
    enabled = false,
    maxSpeed = 120,
    smoothing = 0.15
}



local function getPredictedPosition(player, offset)
    return player.Character[AimPart].Position + player.Character[AimPart].Velocity * offset
end

local function getBestTarget()
    local Camera = workspace.CurrentCamera
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
    if AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getBestTarget()
        if target and target.Character and target.Character:FindFirstChild(AimPart) then
            local Camera = workspace.CurrentCamera
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


GunModsTab:AddSection({
    Name = "Weapon Mods"
})

local WeaponData = {
    weaponList = { "G36", "M4 Carbine", "M58B Shotgun", "MP5", "Glock 17", "Sniper" },
    mods = {
        { name = "Fast Fire", attribute = "ShootDelay", saved = {}, active = false },
        { name = "No Recoil", attribute = "Recoil", saved = {}, active = false },
        { name = "Small Crosshair", attribute = "CrosshairSize", saved = {}, active = false }
    }
}

function applyMod(gun, mod)
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

function setupForCharacter(char, mod)
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


GunModsTab:AddSection({
    Name = "Weapon Customization"
})

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
        "Plastic",
        "SmoothPlastic",
        "Neon",
        "Metal",
        "DiamondPlate",
        "Marble",
        "Granite",
        "ForceField",
        "Glass",
        "Ice",
        "Foil"
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

GunModsTab:AddSection({
    Name = "Flashlight Color"
})

local selectedFlashlightColor = Color3.fromRGB(255, 255, 255)
local rainbowFlashlight = false
local flashlightBrightness = 1

GunModsTab:AddColorpicker({
    Name = "Flashlight Color",
    Default = selectedFlashlightColor,
    Callback = function(color)
        selectedFlashlightColor = color
        rainbowFlashlight = false
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
        rainbowFlashlight = val
        if val then
            task.spawn(function()
                while rainbowFlashlight do
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


selfReviveEnabled = false
selfReviveKey = Enum.KeyCode.P

vu401 = function()
    if not LocalPlayer.Character then
        return true
    end
    v400 = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    return not v400 and true or v400.Health < 30
end

vu407 = function()
    v402 = workspace:FindFirstChild("Vehicles")
    if v402 then
        v402 = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    end
    v403 = LocalPlayer.Character
    if v402 and v403 then
        v404 = v403:FindFirstChildWhichIsA("Humanoid")
        v405 = v403:FindFirstChild("HumanoidRootPart")
        v406 = v402:FindFirstChild("DriveSeat")
        if v404 and (v405 and v406) then
            v405.CFrame = v406.CFrame + Vector3.new(0, 3, 0)
            wait(0.2)
            v406:Sit(v404)
        end
    end
end

vu410 = function()
    v408 = LocalPlayer.Character
    if v408 then
        v409 = v408:FindFirstChildWhichIsA("Humanoid")
        if v409 then
            v409.Sit = false
        end
    end
end

vu415 = function()
    v411 = workspace.Buildings and (workspace.Buildings:FindFirstChild("Hospital") and workspace.Buildings.Hospital:FindFirstChild("HospitalBed"))
    if v411 then
        v411 = workspace.Buildings.Hospital.HospitalBed:FindFirstChild("Seat")
    end
    v412 = LocalPlayer.Character
    if v411 and v412 then
        v413 = v412:FindFirstChildWhichIsA("Humanoid")
        v414 = v412:FindFirstChild("HumanoidRootPart")
        if v413 and v414 then
            v414.CFrame = v411.CFrame + Vector3.new(0, 3, 0)
            wait(0.2)
            if v413.SeatPart ~= v411 then
                v411:Sit(v413)
                wait(0.3)
            end
        end
    end
end

tweenObjectToPosition = function(obj, targetPos, speed)
    if not obj or not obj.PrimaryPart then return false end
    
    startPosition = obj.PrimaryPart.Position
    distance = (startPosition - targetPos).Magnitude
    duration = distance / speed
    
    value = Instance.new("CFrameValue")
    value.Value = obj:GetPivot()

    value.Changed:Connect(function(newCFrame)
        obj:PivotTo(newCFrame)
        if obj.PrimaryPart then
            obj.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
            obj.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    tween = TweenService:Create(value, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Value = CFrame.new(targetPos)
    })
    
    tween:Play()
    tween.Completed:Wait()
    value:Destroy()
    return true
end

selfReviveSequence = function()
    if vu401() then
        v416 = LocalPlayer.Character
        if not v416 then
            return
        end
        v417 = v416:FindFirstChildWhichIsA("Humanoid")
        v418 = v416:FindFirstChild("HumanoidRootPart")
        if not (v417 and v418) then
            return
        end
        v419 = workspace:FindFirstChild("Vehicles")
        if v419 then
            v419 = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
        end
        if not v419 then
            return
        end
        v420 = v418.CFrame
        vu407()
        wait(0.5)
        tweenObjectToPosition(v419, Vector3.new(-84, 5.6, 1109.3), 200)
        vu410()
        wait(0.3)
        vu415()
        repeat
            wait(0.2)
        until v417 and v417.Health >= 50
        v417.Sit = false
        wait(0.3)
        vu407()
        wait(0.3)
        tweenObjectToPosition(v419, v420.Position, 200)
        wait(0.3)
        vu407()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Self Revive",
            Text = "You are not dead, you cant perform a self revive!",
            Duration = 5
        })
    end
end

checkAndRevive = function()
    if selfReviveEnabled and LocalPlayer.Character then
        humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health <= 0 then
            wait(3)
            selfReviveSequence()
        end
    end
end

teleportSpeed = 50
VehiclesFolder = workspace:WaitForChild("Vehicles")

locationCoordinates = {
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

bringCarToMe = function()
    vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if vehicle and LocalPlayer.Character then
        hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            targetPos = hrp.Position + hrp.CFrame.LookVector * 10
            vehicle:SetPrimaryPartCFrame(CFrame.new(targetPos))
            return true
        end
    end
    return false
end

enterVehicle = function()
    vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if vehicle then
        driveSeat = vehicle:FindFirstChild("DriveSeat", true)
        if driveSeat and LocalPlayer.Character then
            humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                driveSeat:Sit(humanoid)
                wait(0.5)
                return true
            end
        end
    end
    return false
end

tweenVehicleToPosition = function(vehicle, targetPos, speed)
    if not vehicle or not vehicle.PrimaryPart then return false end
    
    startPosition = vehicle.PrimaryPart.Position
    distance = (startPosition - targetPos).Magnitude
    duration = distance / speed
    
    value = Instance.new("CFrameValue")
    value.Value = vehicle:GetPivot()

    value.Changed:Connect(function(newCFrame)
        vehicle:PivotTo(newCFrame)
        if vehicle.PrimaryPart then
            vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
            vehicle.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    tween = TweenService:Create(value, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Value = CFrame.new(targetPos)
    })
    
    tween:Play()
    tween.Completed:Wait()
    value:Destroy()
    return true
end

teleportToLocation = function(locationName)
    location = locationCoordinates[locationName]
    if not location then return end
    
    if bringCarToMe() then
        wait(0.3)
        
        if enterVehicle() then
            vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
            if vehicle then
                tweenVehicleToPosition(vehicle, location.Position, teleportSpeed)
            end
        end
    end
end




TeleportsTab:AddSection({
    Name = "Teleport Settings"
})

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

TeleportsTab:AddSection({
    Name = "Robbable Places"
})

robbableDropdown = TeleportsTab:AddDropdown({
    Name = "Select Robbable Place",
    Options = {"Bank", "Jewelry", "Ares Fuel", "Gas n Go Fuel", "Ossu Fuel", "Night Club", "Tool Shop", "Food Shop", "Clothing Store"},
    Default = "Bank",
    Callback = function(v) end
})

TeleportsTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        selected = robbableDropdown.Value
        if selected then
            teleportToLocation(selected)
        end
    end
})

TeleportsTab:AddSection({
    Name = "Usable Places"
})

usableDropdown = TeleportsTab:AddDropdown({
    Name = "Select Usable Place",
    Options = {"Tuning Garage", "Car Dealership", "Hospital", "Prison"},
    Default = "Tuning Garage",
    Callback = function(v) end
})

TeleportsTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        selected = usableDropdown.Value
        if selected then
            teleportToLocation(selected)
        end
    end
})

TeleportsTab:AddSection({
    Name = "Work Places"
})

workDropdown = TeleportsTab:AddDropdown({
    Name = "Select Work Place",
    Options = {"Police Station", "Fire Station", "Bus Company", "Truck Company"},
    Default = "Police Station",
    Callback = function(v) end
})

TeleportsTab:AddButton({
    Name = "Teleport Now",
    Callback = function()
        selected = workDropdown.Value
        if selected then
            teleportToLocation(selected)
        end
    end
})

TeleportsTab:AddSection({
    Name = "Self Revive"
})

TeleportsTab:AddButton({
    Name = "Manual Revive / Bind : P",
    Callback = function()
        selfReviveSequence()
    end
})

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == selfReviveKey then
        selfReviveSequence()
    end
end)

spawn(function()
    while true do
        checkAndRevive()
        wait(0.5)
    end
end)


plr = Players.LocalPlayer

state = {
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

SkeletonBones = {
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

teamColorForTeam = function(team)
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

createSkeleton = function()
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

createESPForPlayer = function(other)
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

    local newLabel = function(yOffset, color)
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

    state.espObjects[other.UserId] = {
        billboard = billboard,
        nameLbl = newLabel(0),
        infoLbl = newLabel(20),
        healthLbl = newLabel(38, Color3.fromRGB(120,255,120)),
        equipLbl = newLabel(56, Color3.fromRGB(255,255,0)),
        wantedLbl = newLabel(74),
        skeleton = createSkeleton()
    }
end

updateESPEntry = function(other)
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
    end

    entry.billboard.Enabled = true
    local teamColor = teamColorForTeam(other.Team)

    entry.nameLbl.Text = state.showNames and other.Name or ""
    entry.nameLbl.TextColor3 = teamColor

    entry.infoLbl.Text = state.showDistance and ((other.Team and ("["..other.Team.Name.."] ") or "") .. math.floor(dist) .. "m") or (other.Team and ("["..other.Team.Name.."]") or "")
    entry.healthLbl.Text = state.showHealth and ("HP: "..math.floor(hum.Health)) or ""

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

updateSkeleton = function(other)
    local entry = state.espObjects[other.UserId]
    if not entry or not state.showSkeleton or not state.espEnabled then
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

    if state.espEnabled and t - lastESPUpdate >= ESP_UPDATE_INTERVAL then
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= plr then
                if not state.espObjects[p.UserId] then
                    createESPForPlayer(p)
                end
                updateESPEntry(p)
            end
        end
        lastESPUpdate = t
    end

    if t - lastSkelUpdate >= SKEL_INTERVAL then
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= plr and state.espObjects[p.UserId] then
                updateSkeleton(p)
            end
        end
        lastSkelUpdate = t
    end
end)

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        if state.espEnabled then
            task.wait(1)
            createESPForPlayer(p)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(p)
    local entry = state.espObjects[p.UserId]
    if entry then
        if entry.billboard then entry.billboard:Destroy() end
        if entry.skeleton then
            for _,l in ipairs(entry.skeleton) do
                l:Remove()
            end
        end
        state.espObjects[p.UserId] = nil
    end
end)

ESPTab:AddSection({
    Name = "ESP Settings"
})

ESPTab:AddToggle({
    Name = "Enable ESP",
    Default = GetSetting("ESPEnabled", false),
    Callback = function(v)
        state.espEnabled = v
        SaveSetting("ESPEnabled", v)
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

ESPTab:AddToggle({
    Name = "Show Skeleton",
    Default = GetSetting("SkeletonESP", false),
    Save = true,
    Callback = function(Value)
        state.showSkeleton = Value
        SaveSetting("SkeletonESP", Value)
        for _, entry in pairs(state.espObjects) do
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
        state.showNames = v
        SaveSetting("ESPShowNames", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Health", 
    Default = GetSetting("ESPShowHealth", true), 
    Callback = function(v) 
        state.showHealth = v
        SaveSetting("ESPShowHealth", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Distance",
    Default = GetSetting("ShowDistance", true),
    Callback = function(v)
        state.showDistance = v
        SaveSetting("ShowDistance", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Team",
    Default = GetSetting("ShowTeam", true),
    Callback = function(v)
        state.showTeams = v
        SaveSetting("ShowTeam", v)
    end
})

ESPTab:AddToggle({
    Name = "Show Wanteds",
    Default = GetSetting("ShowWanteds", true),
    Callback = function(v)
        state.showWanted = v
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
        state.espDistance = value
        SaveSetting("ESPDistance", value)
    end
})

ESPTab:AddSlider({
    Name = "Skeleton Thickness",
    Min = 1,
    Max = 6,
    Default = GetSetting("SkeletonThickness", state.skeletonThickness),
    Increment = 1,
    ValueName = "px",
    Color = Color3.fromRGB(255,255,255),
    Save = true,
    Callback = function(Value)
        state.skeletonThickness = Value
        SaveSetting("SkeletonThickness", Value)
        for _, entry in pairs(state.espObjects) do
            if entry.skeleton then
                for _, line in ipairs(entry.skeleton) do
                    line.Thickness = Value
                end
            end
        end
    end
})

ESPTab:AddSection({
    Name = "Chams"
})

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
    Default = GetSetting("EnableChams", val),
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
    Default = GetSetting("HighlightPlayers", val),
    Callback = function(val)
        ChamsSettings.PlayersEnabled = val
        SaveSetting("HighlightPlayers", val)
        updatePlayerChams()
    end
})

ESPTab:AddToggle({
    Name = "Highlight Vehicles",
    Default = GetSetting("HighlightVehicles", val),
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
    Default = GetSetting("ChamsTransparency", val),
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
    Default = GetSetting("VehicleChamsColor", val),
    Callback = function(color)
        ChamsSettings.VehicleColor = color
        SaveSetting("VehicleChamsColor", val)
        updateVehicleChams()
    end
})




ESPTab:AddSection({
    Name = "Visual Stuff"
})


local Lighting = game:GetService("Lighting")


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


VehicleModsTab:AddSection({
    Name = "Car Fly"
})

local CarFlySettings = {
    plr = game.Players.LocalPlayer,
    uis = game:GetService("UserInputService"),
    rs = game:GetService("RunService"),
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

    local UIS = game:GetService("UserInputService")

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
    local character = CarFlySettings.plr.Character
    if not character then return end
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    local vehiclesFolder = workspace:FindFirstChild("Vehicles")
    local car = vehiclesFolder and vehiclesFolder:FindFirstChild(CarFlySettings.plr.Name)
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
            local character = CarFlySettings.plr.Character
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
            local character = CarFlySettings.plr.Character
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

CarFlySettings.rs.RenderStepped:Connect(function()
    local character = CarFlySettings.plr.Character
    if not character then return end

    if CarFlySettings.flightEnabled then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local car = workspace.Vehicles:FindFirstChild(CarFlySettings.plr.Name)
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
                    (CarFlySettings.uis:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (CarFlySettings.uis:IsKeyDown(Enum.KeyCode.A) and 1 or 0) + CarFlySettings.guiFlightDirection.X,
                    (CarFlySettings.uis:IsKeyDown(Enum.KeyCode.E) and 0.5 or 0) - (CarFlySettings.uis:IsKeyDown(Enum.KeyCode.Q) and 0.5 or 0) + CarFlySettings.guiFlightDirection.Y,
                    (CarFlySettings.uis:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (CarFlySettings.uis:IsKeyDown(Enum.KeyCode.W) and 1 or 0) + CarFlySettings.guiFlightDirection.Z
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

local flingEnabled = false

VehicleModsTab:AddSection({
    Name = "Fling"
})

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

local flingCooldowns = {}

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


VehicleModsTab:AddSection({
    Name = "Suspension"
})


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VehiclesFolder = workspace:WaitForChild("Vehicles") 

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
--[[
VehicleModsTab:AddSection({
    Name = "Maybach Suspension"
})
_G.bounceSpeed = 0.2
_G.bounceActive = false

VehicleModsTab:AddToggle({
    Name = "Bouncy Suspension",
    Default = false,
    Callback = function(Value)
        _G.bounceActive = Value

        if Value then
            task.spawn(function()
                local bounceHeight = 1.5
                local bounceDirection = 1
                local bounceSpeed = 0.05
                
                while _G.bounceActive do
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
                    
                    bounceHeight = bounceHeight + (_G.bounceSpeed * bounceDirection)
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

VehicleModsTab:AddSlider({
    Name = "Bounce Speed",
    Min = 0,
    Max = 100,
    Default = 20,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(Value)
        _G.bounceSpeed = Value / 100
    end
})--]]


VehicleModsTab:AddSection({
    Name = "Car Control"
})

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
            removeAllSpeedLimits()
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
        local isAccelerating = UserInputService:IsKeyDown(Enum.KeyCode.W) or 
                              UserInputService:IsKeyDown(Enum.KeyCode.Up)
        
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

VehicleModsTab:AddSection({
    Name = "Brake & Reverse"
})

local BrakeForceEnabled = false
local BrakePower = 500
local ReverseSpeedEnabled = false
local ReversePower = 500

VehicleModsTab:AddToggle({
    Name = "Enable Brake Force",
    Default = false,
    Callback = function(val)
        BrakeForceEnabled = val
        if val then
        end
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
        if val then
        end
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
    
    if BrakeForceEnabled and UserInputService:IsKeyDown(Enum.KeyCode.S) then
        local brakeDirection = -carForward
        local currentSpeed = Vector3.new(smoothVelocity.X, 0, smoothVelocity.Z).Magnitude
        
        if currentSpeed > 5 then
            local brakeForce = math.min(currentSpeed * 1.5, BrakePower)
            local brakeDelta = brakeDirection * brakeForce * 0.05
            driveSeat.AssemblyLinearVelocity = smoothVelocity + brakeDelta
        end
    end
    
    if ReverseSpeedEnabled and UserInputService:IsKeyDown(Enum.KeyCode.S) then
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


VehicleModsTab:AddSection({
    Name = "Car Boost"
})

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
    Callback = function()
        
    end
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

-- logic
RunService.Heartbeat:Connect(function()
    if CarBoostSettings.Enabled and UserInputService:IsKeyDown(CarBoostSettings.BoostKey) then
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


VehicleModsTab:AddSection({
    Name = "Interactables"
})



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

bringCarToMe = function()
    vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if vehicle and LocalPlayer.Character then
        hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            targetPos = hrp.Position + hrp.CFrame.LookVector * 10
            vehicle:SetPrimaryPartCFrame(CFrame.new(targetPos))
            return true
        end
    end
    return false
end

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
        
        -- osi
        local carPosition = driveSeat.Position
        local playerPosition = humanoidRootPart.Position
        local distance = (carPosition - playerPosition).Magnitude
        
        if distance > 50 then 
            -- Bring car 
            local bringOffset = 8 
            local camera = workspace.CurrentCamera
            local bringPosition = playerPosition + (camera.CFrame.LookVector * bringOffset)
            
            car:SetPrimaryPartCFrame(CFrame.new(bringPosition) * CFrame.Angles(0, humanoidRootPart.Orientation.Y, 0))
            driveSeat.AssemblyLinearVelocity = Vector3.zero
            driveSeat.AssemblyAngularVelocity = Vector3.zero
            
            task.wait(0.5) 
        end
        
        -- Enter tar
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
    character = LocalPlayer.Character
    if not character then return end

    humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    
    if humanoid.Sit then
    -- force
        humanoid.Sit = false
        humanoid.PlatformStand = false


        OrionLib:MakeNotification({
            Name = "Exited Car",
            Content = "Successfully exited Vehicle",
            Time = 2
        })
    else
        OrionLib:MakeNotificaiton({
            Name = "Not in a Vehicle",
            Content = "You're not currently sitting in a Vehicle",
            Time = 2
        })
    end
end
})


VehicleModsTab:AddSection({
    Name = "Overrides"
})

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


-- ad
VehicleModsTab2:AddSection({
    Name = "Auto Driver"
})

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
       
    },
    
    ["Extended Tour"] = {
        Vector3.new(0, 10, 0),
        Vector3.new(100, 10, 0),
        Vector3.new(100, 10, 100),
        Vector3.new(0, 10, 100),
        Vector3.new(-100, 10, 100),
        Vector3.new(-100, 10, 0),
        Vector3.new(-100, 10, -100),
        Vector3.new(0, 10, -100),
        Vector3.new(100, 10, -100),
        Vector3.new(100, 10, 0),
        Vector3.new(0, 10, 0)
    }
}

local selectedRoute = "City Loop"


VehicleModsTab2:AddDropdown({
    Name = "Select Route",
    Default = "City Loop - Start at Jeweler Parking",
    Options = {
        "City Loop - Start at Jeweler Parking", 
        "Highway Run - Start at Bank Tunnel at the Speed & City Sign", 
        "Business District - Start at Police Bridge", 
    },
    Callback = function(val)
        
        local routeMap = {
            ["City Loop - Start at Jeweler Parking"] = "City Loop",
            ["Highway Run - Start at Bank Tunnel at the Speed & City Sign"] = "Highway Run",
            ["Business District - Start at Police Bridge"] = "Business District",
        }
        
        selectedRoute = routeMap[val] or "City Loop"
        OrionLib:MakeNotification({
            Name = "Route Selected",
            Content = "Route: " .. selectedRoute,
            Time = 3
        })
    end
})


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
    local car = workspace.Vehicles:FindInstance(LocalPlayer.Name)
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
        SimpleAutoDriver.currentWaypoint = nil -- force rec
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

-- pos copy
--[[VehicleModsTab2:AddButton({
    Name = "Copy Current Position",
    Callback = function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local pos = char.HumanoidRootPart.Position
            setclipboard(string.format("Vector3.new(%.1f, %.1f, %.1f)", pos.X, pos.Y, pos.Z))
            OrionLib:MakeNotification({
                Name = "Position Copied",
                Content = "Position copied to clipboard: " .. string.format("Vector3.new(%.1f, %.1f, %.1f)", pos.X, pos.Y, pos.Z),
                Time = 5
            })
        end
    end
}) --]]


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



-- find
local function getNextWaypoint()
    if #SimpleAutoDriver.waypoints == 0 then
        generateWaypoints()
    end
    
    SimpleAutoDriver.currentWaypoint = (SimpleAutoDriver.currentWaypoint % #SimpleAutoDriver.waypoints) + 1
    return SimpleAutoDriver.waypoints[SimpleAutoDriver.currentWaypoint]
end

-- logic
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
                
                
                local hasObstacle, obstacleType = false, nil
                if SimpleAutoDriver.avoidObstacles and tick() - SimpleAutoDriver.lastObstacleCheck > 0.2 then
                    hasObstacle, obstacleType = checkForwardObstacle(carPosition, targetDirection, 25)
                    SimpleAutoDriver.lastObstacleCheck = tick()
                end
                
               
                local atIntersection = false
                if SimpleAutoDriver.stopAtIntersections then
                    atIntersection = isAtIntersection(carPosition)
                end
                
                
                if hasObstacle then
                    SimpleAutoDriver.state = "AVOIDING"
                    
                    
                    local avoidDirection = (targetDirection + car.CFrame.RightVector * 0.5).Unit
                    local avoidSpeed = math.min(SimpleAutoDriver.cruiseSpeed * 0.3, 15)
                    
                    driveSeat.AssemblyLinearVelocity = avoidDirection * avoidSpeed
                    
                    
                    task.wait(1)
                    SimpleAutoDriver.state = "DRIVING"
                    
                elseif atIntersection and currentSpeed > 20 then
                    
                    local brakeForce = math.min(currentSpeed * 0.8, 30)
                    driveSeat.AssemblyLinearVelocity = currentVelocity * 0.7
                    task.wait(0.5)
                    
                else
                    SimpleAutoDriver.state = "DRIVING"
                    
                    
                    local speedDifference = SimpleAutoDriver.cruiseSpeed - currentSpeed
                    local acceleration = math.min(math.max(speedDifference * 0.3, -20), 15)
                    
                    
                    local currentForward = driveSeat.CFrame.LookVector
                    local steerStrength = 0.1
                    local smoothedDirection = currentForward:Lerp(targetDirection, steerStrength)
                    
                   
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
    -- clear old
    for _, marker in pairs(waypointMarkers) do
        marker:Destroy()
    end
    waypointMarkers = {}
    
    -- mark
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

-- vis upd
task.spawn(function()
    while task.wait(1) do
        if SimpleAutoDriver.enabled then
            visualizeWaypoints()
        else
            -- clear
            for _, marker in pairs(waypointMarkers) do
                marker:Destroy()
            end
            waypointMarkers = {}
        end
    end
end)



VehicleModsTab:AddSection({
    Name = "Vehicle Tuning"
})

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
    Default = GetSetting("ArmorLevel", false),
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
    Default = GetSetting("BrakesLevel", false),
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
    Default = GetSetting("EngineLevel", false),
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Callback = function(val)
        setCarAttribute("engineLevel", val)
        SaveSetting("EngineLevel", val)
    end
})



VehicleModsTab2:AddSection({
    Name = "Drone View"
})

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
            
            -- old cframe
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
                    
                    -- smooth
                    if lastPosition then
                        targetPosition = lastPosition:Lerp(targetPosition, smoothFactor)
                    end
                    
                    -- wasd
                    local moveVector = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveVector = moveVector + Camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveVector = moveVector - Camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveVector = moveVector - Camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveVector = moveVector + Camera.CFrame.RightVector
                    end
                    
                    moveVector = moveVector * 0.5
                    targetPosition = targetPosition + moveVector
                    
                    -- ghi
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
                
                -- backtor
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

VehicleModsTab2:AddSection({
    Name = "Dashcam View"
})

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

VehicleModsTab2:AddSection({
    Name = "Car Duplicator"
})

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
        
        -- clone
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
        
        -- nearest car
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



VehicleModsTab2:AddSection({
    Name = "Vehicle Customization"
})


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

local function getBodyColor()
    local vehiclesFolder = workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return Color3.fromRGB(255, 255, 255) end
    local car = vehiclesFolder:FindFirstChild(LocalPlayer.Name)
    if not car then return Color3.fromRGB(255, 255, 255) end

    for _, part in pairs(car:GetDescendants()) do
        if part.Name == "Body" and part:IsA("BasePart") then
            return part.Color
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
        "Plastic",
        "SmoothPlastic",
        "Neon",
        "Metal",
        "DiamondPlate",
        "Marble",
        "Granite",
        "Brick",
        "Pebble",
        "Cobblestone",
        "Concrete",
        "CorrodedMetal",
        "Wood",
        "WoodPlanks",
        "Fabric",
        "Glass",
        "ForceField",
        "Ice",
        "Foil"
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
                -- loop
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

PoliceTab:AddSection({
    Name = "Utiility"
})


local RS = game:GetService("ReplicatedStorage")
local Remote = RS["WvO"]:FindFirstChild("e3a0cb13-da43-46b9-ba5d-e6ea0d913417")


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

local AutoTaserSettings = {
    enabled = false,
    maxRange = 50,
    prediction = 0.15,
    lastFireTime = 0,
    fireCooldown = 0.3,
    debugMode = false
}


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")


local taserRemote = nil
local function findTaserRemote()
    local folder = ReplicatedStorage:FindFirstChild("WvO")
    if folder then
        taserRemote = folder:FindFirstChild("99c8a262-b24b-4a80-a962-df12db3054cd")
        if taserRemote and AutoTaserSettings.debugMode then
            
        end
    end
    return taserRemote ~= nil
end


findTaserRemote()


local function findNearestWantedPlayer()
    local myCharacter = LocalPlayer.Character
    if not myCharacter then return nil end
    
    local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    
    local bestTarget = nil
    local shortestDistance = AutoTaserSettings.maxRange
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local theirCharacter = player.Character
            if theirCharacter then
                local theirRoot = theirCharacter:FindFirstChild("HumanoidRootPart")
                local theirHumanoid = theirCharacter:FindFirstChild("Humanoid")
                
                if theirRoot and theirHumanoid then
                    
                    local isWanted = theirRoot:GetAttribute("IsWanted")
                    
                    if isWanted == true and theirHumanoid.Health > 24 then
                        local distance = (myRoot.Position - theirRoot.Position).Magnitude
                        
                        if distance < shortestDistance then
                            shortestDistance = distance
                            bestTarget = {
                                player = player,
                                root = theirRoot,
                                humanoid = theirHumanoid,
                                distance = distance
                            }
                        end
                    end
                end
            end
        end
    end
    
    return bestTarget
end


local autoTaserLoop = nil

local function startAutoTaser()
    if autoTaserLoop then
        autoTaserLoop:Disconnect()
    end

    autoTaserLoop = RunService.Heartbeat:Connect(function()
        if not AutoTaserSettings.enabled then return end

        local currentTime = tick()
        if currentTime - AutoTaserSettings.lastFireTime < AutoTaserSettings.fireCooldown then
            return
        end

        if not taserRemote then
            if not findTaserRemote() then return end
        end

        local character = LocalPlayer.Character
        if not character then return end

        local taser = character:FindFirstChild("Taser")
        if not taser then return end

        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local target = findNearestWantedPlayer()
        if not target then return end

        local targetPosition = target.root.Position
        local targetVelocity = target.root.AssemblyLinearVelocity or Vector3.zero

        local predictedPosition =
            targetPosition + (targetVelocity * AutoTaserSettings.prediction)

        local aimDirection =
            (predictedPosition - root.Position).Unit

        local success = pcall(function()
            taserRemote:FireServer(taser, predictedPosition, aimDirection)
        end)

        if success then
            AutoTaserSettings.lastFireTime = currentTime
        end
    end)
end



startAutoTaser()

--[[local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local AutoStopStickRemote = game:GetService("ReplicatedStorage")["WvO"]["eb73d645-ab5e-4785-8a1f-ceacf2e95489"]

local autoStopStickEnabled = false
local autoStopStickConnection

local function getNearestPlayerInCar()
    local nearestPlayer = nil
    local nearestCar = nil
    local nearestDistance = math.huge
    local localCharacter = LocalPlayer.Character
    local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
    
    if not localRoot then return nil, nil, math.huge end
    
    for _, car in pairs(Workspace.Vehicles:GetChildren()) do
        local body = car:FindFirstChild("Body")
        
        if body then
            local seat = car:FindFirstChildWhichIsA("VehicleSeat", true)
            
            if seat and seat.Occupant then
                local character = seat.Occupant.Parent
                local player = Players:GetPlayerFromCharacter(character)
                
                if player and player ~= LocalPlayer then
                    local distance = (localRoot.Position - body.Position).Magnitude
                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestPlayer = player
                        nearestCar = car
                    end
                end
            end
        end
    end
    
    return nearestPlayer, nearestCar, nearestDistance
end

PoliceTab:AddToggle({
    Name = "Auto Stop-Stick",
    Default = false,
    Callback = function(Value)
        autoStopStickEnabled = Value
        
        if autoStopStickEnabled then
            autoStopStickConnection = RunService.Heartbeat:Connect(function()
                local nearestPlayer, nearestCar, distance = getNearestPlayerInCar()
                
                if nearestPlayer and nearestCar and distance < 100 then 
                    AutoStopStickRemote:FireServer(nearestCar)
                    wait(2)
                end
            end)
        else
            if autoStopStickConnection then
                autoStopStickConnection:Disconnect()
                autoStopStickConnection = nil
            end
        end
    end
}) --]]


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
        SaveSetting("MaxTaserRange", val)
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
        SaveSetting("PredictionTaser", val)
    end
})


PoliceTab:AddSection({
    Name = "Taser Customization"
})

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
        "Plastic",
        "SmoothPlastic",
        "Neon",
        "Metal",
        "DiamondPlate",
        "Marble",
        "Granite",
        "ForceField",
        "Glass",
        "Ice",
        "Foil"
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

PoliceTab:AddSection({Name = "Farm"})

local RadarFarm = {
    Enabled = false,
    FireRate = 1, 
    ScanInterval = 0.1, 
}

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

local function onRadarFarmToggle(newState)
    RadarFarm.Enabled = newState
    
    if newState then
        task.spawn(startRadarFarm)
    end
end


PoliceTab:AddToggle({
    Name = "Radar Farm",
    Default = false,
    Callback = onRadarFarmToggle
})

-------------

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

PlayerTab:AddSection({
    Name = "Preset Outfits"
})

local presetOutfits = {
    {Name = "Headless", Type = "headless"},
    {Name = "Invisible", Type = "transparency", Value = 1},
    {Name = "Ghost", Type = "transparency", Value = 0.5},
    {Name = "Gold", Type = "color", Color = Color3.fromRGB(255, 215, 0)},
    {Name = "Ice", Type = "color", Color = Color3.fromRGB(173, 216, 230)},
    {Name = "Neon Pink", Type = "color", Color = Color3.fromRGB(255, 0, 255)}
}

-- Cache original part colors and transparency
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

-- Preset Dropdown
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

-- Quick Actions
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

-- Copy Player Outfit Section
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

-- Your exact copyFullOutfit function
copyFullOutfit = function(player)
    targetChar = player.Character
    myChar = LocalPlayer.Character
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
        
        targetHead = targetChar:FindFirstChild("Head")
        myHead = myChar:FindFirstChild("Head")
        
        if targetHead and myHead then
            targetFace = targetHead:FindFirstChild("face")
            myFace = myHead:FindFirstChild("face")
            
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


AnimTab:AddSection({
    Name = "Animations"
})

currentAnimation = nil
isAnimationPlaying = false
animationSpeed = 1.0

danceAnimations = {
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

cuffedAnimEnabled = false
cuffedAnimTrack = nil
deadAnimEnabled = false
deadAnimTrack = nil

setupCuffedAnim = function(character)
    humanoid = character:WaitForChild("Humanoid")
    animator = humanoid:WaitForChild("Animator") or Instance.new("Animator", humanoid)
    animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://9357137817"
    cuffedAnimTrack = animator:LoadAnimation(animation)
    cuffedAnimTrack.Priority = Enum.AnimationPriority.Action
    if cuffedAnimEnabled then
        wait(1)
        cuffedAnimTrack:Play()
    end
end

setupDeadAnim = function(character)
    humanoid = character:WaitForChild("Humanoid")
    animator = humanoid:WaitForChild("Animator") or Instance.new("Animator", humanoid)
    animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://11019608524"
    deadAnimTrack = animator:LoadAnimation(animation)
    deadAnimTrack.Priority = Enum.AnimationPriority.Action
    if deadAnimEnabled then
        wait(1)
        deadAnimTrack:Play()
    end
end

playDanceAnimation = function(animationId)
    if currentAnimation then
        currentAnimation:Stop()
        currentAnimation = nil
    end
    
    character = LocalPlayer.Character
    if not character then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Animations",
            Text = "No character found!",
            Duration = 3
        })
        return
    end
    
    humanoid = character:FindFirstChildOfClass("Humanoid")
    animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    
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
    
    animation = Instance.new("Animation")
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

stopCurrentAnimation = function()
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

selectedDance = danceAnimations[1].Name
danceDropdown = AnimTab:AddDropdown({
    Name = "Select Dance",
    Options = {},
    Default = selectedDance,
    Callback = function(option)
        selectedDance = option
    end
})

populateDanceDropdown = function()
    danceNames = {}
    for _, dance in ipairs(danceAnimations) do
        table.insert(danceNames, dance.Name)
    end
    danceDropdown:Refresh(danceNames, danceNames[1])
end

populateDanceDropdown()

getAnimationIdByName = function(name)
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
        animId = getAnimationIdByName(selectedDance)
        playDanceAnimation(animId)
    end
})

AnimTab:AddButton({
    Name = "Stop Current Dance",
    Callback = function()
        stopCurrentAnimation()
    end
})

AnimTab:AddSection({
    Name = "Animation Settings"
})

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

autoStopOnMove = false
AnimTab:AddToggle({
    Name = "Auto-Stop When Moving",
    Default = GetSetting("AutoStopMoving", false),
    Callback = function(value)
        autoStopOnMove = value
        SaveSetting("AutoStopMoving")
    end
})

setupAutoStop = function(character)
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.Running:Connect(function(speed)
        if autoStopOnMove and isAnimationPlaying and speed > 2 then
            stopCurrentAnimation()
        end
    end)
end


AnimTab:AddSection({
    Name = "Fake Anims"
})

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
            customId = text
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



MiscTab:AddSection({
    Name = "Utilities"
})


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

local lighting = game:GetService("Lighting")
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
    for _,v in pairs(lighting:GetChildren()) do
        if isBlurOrFlashEffect(v) then
            pcall(function() v:Destroy() end)
        end
    end
end

local function enableAntiBlur()
    table.insert(blurCons, lighting.ChildAdded:Connect(function(child)
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


MiscTab:AddSection({
    Name = "Player"
})

local selectedPlayerColor = Color3.fromRGB(255, 255, 255)
local selectedPlayerMaterial = "SmoothPlastic"
local originalPlayerColors = {}
local originalPlayerMaterials = {}

MiscTab:AddColorpicker({
    Name = "Player Color",
    Default = GetSetting("PlayerCol", selectedPlayerColor),
    Callback = function(color)
        selectedPlayerColor = color
        SaveSetting("PlayerCol")
    end
})

MiscTab:AddDropdown({
    Name = "Player Material",
    Default = GetSetting("PlayerMat", SmoothPlastic),
    Options = {
        "Plastic",
        "SmoothPlastic",
        "Neon",
        "Metal",
        "DiamondPlate",
        "Marble",
        "Granite",
        "ForceField",
        "Glass",
        "Ice",
        "Foil"
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

-- pfly

playerFly = false
flyBind = Enum.KeyCode.V
flySpeed = 50

isFlying = false
flyAttachment = nil
flyAlignPosition = nil
flyAlignOrientation = nil

enableFly = function()
    character = LocalPlayer.Character
    if not character then return end
    root = character:FindFirstChild("HumanoidRootPart")
    humanoid = character:FindFirstChild("Humanoid")
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

    lastPosition = root.Position
    flyAlignPosition.Position = lastPosition

    spawn(function()
        while isFlying and root and humanoid do
            moveDir = Vector3.zero
            camCFrame = workspace.CurrentCamera.CFrame

            if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCFrame.RightVector end

            if moveDir.Magnitude > 0 then
                moveDir = moveDir.Unit
                newPos = lastPosition + (moveDir * flySpeed * 0.033)
                flyAlignPosition.Position = newPos
                lastPosition = newPos
            end

            flyAlignOrientation.CFrame = CFrame.new(Vector3.zero, camCFrame.LookVector)
            wait(0.033)
        end
    end)
end

disableFly = function()
    isFlying = false
    humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then humanoid.PlatformStand = false end
    if flyAttachment then flyAttachment:Destroy() end
    if flyAlignPosition then flyAlignPosition:Destroy() end
    if flyAlignOrientation then flyAlignOrientation:Destroy() end
end

MiscTab:AddSection({
    Name = "Fly Settings"
})

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

spinbotEnabled = false
spinSpeed = 10

updateSpinbot = function()
    if spinbotEnabled and LocalPlayer.Character then
        hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
        end
    end
end

MiscTab:AddSection({
    Name = "Spin Settings"
})

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

local nightVisionSettings = {
    enabled = false,
    color = Color3.fromRGB(0, 255, 0),
    brightness = 5,
    originalAmbient = nil,
    originalOutdoorAmbient = nil,
    originalBrightness = nil,
    originalFogEnd = nil
}


local lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")


nightVisionSettings.originalAmbient = lighting.Ambient
nightVisionSettings.originalOutdoorAmbient = lighting.OutdoorAmbient
nightVisionSettings.originalBrightness = lighting.Brightness
nightVisionSettings.originalFogEnd = lighting.FogEnd

local function updateNightVision(forceDisable)
    if nightVisionSettings.enabled and not forceDisable then
        lighting.Ambient = nightVisionSettings.color
        lighting.OutdoorAmbient = nightVisionSettings.color
        lighting.Brightness = nightVisionSettings.brightness
        lighting.FogEnd = 1e6
    else
        lighting.Ambient = nightVisionSettings.originalAmbient
        lighting.OutdoorAmbient = nightVisionSettings.originalOutdoorAmbient
        lighting.Brightness = nightVisionSettings.originalBrightness or 1
        lighting.FogEnd = nightVisionSettings.originalFogEnd or 1000
    end
end


RunService.RenderStepped:Connect(function()
    if nightVisionSettings.enabled then
        updateNightVision()
    end
end)


MiscTab:AddSection({
    Name = "Night Vision Settings"
})


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



MiscTab:AddSection({
    Name = "Camera"
})

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



MiscTab:AddSection({
    Name = "Broken & Funny stuff"
})

_G.bbounceSpeed = 0.2
_G.bbounceActive = false

MiscTab:AddToggle({
    Name = "Bouncy Suspension",
    Default = false,
    Callback = function(Value)
        _G.bbounceActive = Value

        if Value then
            task.spawn(function()
                local bounceHeight = 1.5
                local bounceDirection = 1
                local bounceSpeed = 0.05
                
                while _G.bbounceActive do
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
                    
                    bounceHeight = bounceHeight + (_G.bbounceSpeed * bounceDirection)
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
        _G.bbounceSpeed = Value / 100
    end
})


MiscTab:AddSection({
    Name = "Performance Monitor"
})


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

Lighting = game:GetService("Lighting")
workspace = game:GetService("Workspace")

isEnabled = false

MiscTab:AddButton({
    Name = "FPS Boost",
    Callback = function()
        if isEnabled then
            Lighting.GlobalShadows = true
            Lighting.Technology = Enum.Technology.ShadowMap
            Lighting.Brightness = 1

            for _, Obj in pairs(Workspace:GetDescendants()) do
                if Obj:IsA("BasePart") then
                    Obj.Material = Enum.Material.Plastic
                    Obj.Transparency = 0
                elseif Obj:IsA("ParticleEmitter") or Obj:IsA("Trail") then
                    Obj.Enabled = true
                elseif Obj:IsA("Decal") then
                    Obj.Transparency = 0
                end
            end

            if Workspace.Terrain then
                Workspace.Terrain.Decoration = true
            end

            isEnabled = false
        else
            Lighting.GlobalShadows = false
            Lighting.Technology = Enum.Technology.Voxel
            Lighting.Brightness = 3

            for _, Obj in pairs(Workspace:GetDescendants()) do
                if Obj:IsA("BasePart") then
                    Obj.Material = Enum.Material.Plastic
                elseif Obj:IsA("ParticleEmitter") or Obj:IsA("Trail") then
                    Obj.Enabled = false
                elseif Obj:IsA("Decal") then
                    Obj.Transparency = 1
                end
            end

            if Workspace.Terrain then
                Workspace.Terrain.Decoration = false
            end

            isEnabled = true
        end
    end
})


ESPTab:AddSection({Name = "Radar"})

local config = {
    enabled = false,
    showNames = true,
    showCompass = true,
    showGrid = true,
    showDistance = true,
    showHealth = true,
    showViewCones = false,
    trackWaypoint = false,
    zoom = 100,
    size = 200,
    opacity = 0.2,
    range = 500
}

local state = {
    frame = nil,
    dragging = false,
    dragStart = nil,
    frameStart = nil,
    waypoint = nil
}

local function createUI()
    local sg = Instance.new("ScreenGui")
    sg.Name = "MiniMapGui"
    sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.Parent = game.CoreGui
    
    local frame = Instance.new("Frame")
    frame.Name = "MiniMapFrame"
    frame.Size = UDim2.new(0, config.size, 0, config.size)
    frame.Position = UDim2.new(1, -220, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    frame.BackgroundTransparency = config.opacity
    frame.BorderSizePixel = 0
    frame.Parent = sg
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    -- Top bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 25)
    topBar.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    topBar.BorderSizePixel = 0
    topBar.Parent = frame
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 8)
    tCorner.Parent = topBar
    
    local title = Instance.new("TextLabel")
    title.Text = "Radar"
    title.Size = UDim2.new(1, -70, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 13
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topBar
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "X"
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -22.5, 0, 2.5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 12
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = topBar
    
    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(0, 4)
    cCorner.Parent = closeBtn
    
    -- Map container
    local map = Instance.new("Frame")
    map.Name = "MapContainer"
    map.Size = UDim2.new(1, -10, 1, -60)
    map.Position = UDim2.new(0, 5, 0, 30)
    map.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    map.BackgroundTransparency = 0.3
    map.BorderSizePixel = 0
    map.ClipsDescendants = true
    map.Parent = frame
    
    local mCorner = Instance.new("UICorner")
    mCorner.CornerRadius = UDim.new(0, 6)
    mCorner.Parent = map
    
    -- Grid
    local grid = Instance.new("Frame")
    grid.Name = "GridFrame"
    grid.Size = UDim2.new(1, 0, 1, 0)
    grid.BackgroundTransparency = 1
    grid.Visible = config.showGrid
    grid.Parent = map
    
    for i = 0, 4 do
        local h = Instance.new("Frame")
        h.Size = UDim2.new(1, 0, 0, 1)
        h.Position = UDim2.new(0, 0, i * 0.25, 0)
        h.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        h.BackgroundTransparency = 0.9
        h.BorderSizePixel = 0
        h.Parent = grid
        
        local v = Instance.new("Frame")
        v.Size = UDim2.new(0, 1, 1, 0)
        v.Position = UDim2.new(i * 0.25, 0, 0, 0)
        v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v.BackgroundTransparency = 0.9
        v.BorderSizePixel = 0
        v.Parent = grid
    end
    
    -- Compass
    local compass = Instance.new("Frame")
    compass.Name = "CompassFrame"
    compass.Size = UDim2.new(0, 50, 0, 50)
    compass.Position = UDim2.new(1, -55, 0, 5)
    compass.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    compass.BackgroundTransparency = 0.3
    compass.BorderSizePixel = 0
    compass.Visible = config.showCompass
    compass.Parent = map
    
    local compCorner = Instance.new("UICorner")
    compCorner.CornerRadius = UDim.new(1, 0)
    compCorner.Parent = compass
    
    local dirs = {
        {t = "N", p = UDim2.new(0.35, 0, 0, 2), c = Color3.fromRGB(255, 100, 100), s = 14},
        {t = "S", p = UDim2.new(0.35, 0, 0.7, 0), c = Color3.fromRGB(150, 150, 150), s = 11},
        {t = "E", p = UDim2.new(0.7, 0, 0.35, 0), c = Color3.fromRGB(150, 150, 150), s = 11},
        {t = "W", p = UDim2.new(0, 0, 0.35, 0), c = Color3.fromRGB(150, 150, 150), s = 11}
    }
    
    for _, d in ipairs(dirs) do
        local lbl = Instance.new("TextLabel")
        lbl.Text = d.t
        lbl.Size = UDim2.new(0.3, 0, 0.3, 0)
        lbl.Position = d.p
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = d.c
        lbl.TextSize = d.s
        lbl.Font = Enum.Font.GothamBold
        lbl.Parent = compass
    end
    
    -- Player dot
    local dot = Instance.new("Frame")
    dot.Name = "PlayerDot"
    dot.Size = UDim2.new(0, 10, 0, 10)
    dot.Position = UDim2.new(0.5, -5, 0.5, -5)
    dot.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    dot.BorderSizePixel = 0
    dot.ZIndex = 10
    dot.Parent = map
    
    local dCorner = Instance.new("UICorner")
    dCorner.CornerRadius = UDim.new(1, 0)
    dCorner.Parent = dot
    
    local arrow = Instance.new("ImageLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(1.5, 0, 1.5, 0)
    arrow.Position = UDim2.new(-0.25, 0, -0.25, 0)
    arrow.BackgroundTransparency = 1
    arrow.Image = "rbxassetid://7072721559"
    arrow.ImageColor3 = Color3.fromRGB(255, 255, 255)
    arrow.Parent = dot
    
    -- Info bar
    local info = Instance.new("Frame")
    info.Name = "InfoBar"
    info.Size = UDim2.new(1, -10, 0, 20)
    info.Position = UDim2.new(0, 5, 1, -25)
    info.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    info.BackgroundTransparency = 0.2
    info.BorderSizePixel = 0
    info.Parent = frame
    
    local iCorner = Instance.new("UICorner")
    iCorner.CornerRadius = UDim.new(0, 4)
    iCorner.Parent = info
    
    local txt = Instance.new("TextLabel")
    txt.Name = "InfoText"
    txt.Text = "Players: 0"
    txt.Size = UDim2.new(1, -10, 1, 0)
    txt.Position = UDim2.new(0, 5, 0, 0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.fromRGB(200, 200, 200)
    txt.TextSize = 10
    txt.Font = Enum.Font.Gotham
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.Parent = info
    
    -- Dragging
    topBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            state.dragging = true
            state.dragStart = inp.Position
            state.frameStart = frame.Position
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(inp)
        if state.dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = inp.Position - state.dragStart
            frame.Position = UDim2.new(state.frameStart.X.Scale, state.frameStart.X.Offset + delta.X,
                state.frameStart.Y.Scale, state.frameStart.Y.Offset + delta.Y)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            state.dragging = false
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        config.enabled = false
        sg:Destroy()
        state.frame = nil
    end)
    
    state.frame = frame
end

local function updateMap()
    if not config.enabled or not state.frame then return end
    
    local map = state.frame:FindFirstChild("MapContainer")
    if not map then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local pos = hrp.Position
    local _, y, _ = hrp.CFrame:ToEulerAnglesXYZ()
    
    -- Update arrow
    local dot = map:FindFirstChild("PlayerDot")
    if dot and dot:FindFirstChild("Arrow") then
        dot.Arrow.Rotation = math.deg(y)
    end
    
    -- Clear markers
    for _, c in pairs(map:GetChildren()) do
        if c.Name:find("Marker") or c.Name:find("Label") or c.Name:find("Health") or c.Name:find("View") then
            c:Destroy()
        end
    end
    
    local count = 0
    local scale = config.zoom / 100
    
    -- Draw waypoint
    if config.trackWaypoint and state.waypoint then
        local rel = state.waypoint - pos
        local x = (rel.X / (100 * scale)) * 90
        local z = (rel.Z / (100 * scale)) * 90
        
        if math.abs(x) < 85 and math.abs(z) < 85 then
            local w = Instance.new("Frame")
            w.Name = "WaypointMarker"
            w.Size = UDim2.new(0, 12, 0, 12)
            w.Position = UDim2.new(0.5, x - 6, 0.5, z - 6)
            w.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            w.BorderSizePixel = 2
            w.BorderColor3 = Color3.fromRGB(255, 200, 0)
            w.Rotation = 45
            w.ZIndex = 9
            w.Parent = map
        end
    end
    
    -- Draw players
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if config.enemiesOnly and p.Team == LocalPlayer.Team then continue end
            
            local oc = p.Character
            if oc and oc:FindFirstChild("HumanoidRootPart") then
                local op = oc.HumanoidRootPart.Position
                local rel = op - pos
                
                local x = (rel.X / (100 * scale)) * 90
                local z = (rel.Z / (100 * scale)) * 90
                
                if math.abs(x) < 85 and math.abs(z) < 85 then
                    count = count + 1
                    
                    local m = Instance.new("Frame")
                    m.Name = "PlayerMarker"
                    m.Size = UDim2.new(0, 8, 0, 8)
                    m.Position = UDim2.new(0.5, x - 4, 0.5, z - 4)
                    m.BackgroundColor3 = p.Team and p.Team.TeamColor.Color or Color3.fromRGB(255, 80, 80)
                    m.BorderSizePixel = 0
                    m.ZIndex = 8
                    m.Parent = map
                    
                    local mc = Instance.new("UICorner")
                    mc.CornerRadius = UDim.new(1, 0)
                    mc.Parent = m
                    
                    if config.highlightEnemies and p.Team ~= LocalPlayer.Team and p.Team then
                        m.BorderSizePixel = 2
                        m.BorderColor3 = Color3.fromRGB(255, 0, 0)
                    end
                    
                    if config.showNames then
                        local n = Instance.new("TextLabel")
                        n.Name = "NameLabel"
                        n.Text = p.Name
                        n.Size = UDim2.new(0, 100, 0, 15)
                        n.Position = UDim2.new(0.5, x - 50, 0.5, z + 6)
                        n.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        n.BackgroundTransparency = 0.5
                        n.TextColor3 = Color3.fromRGB(255, 255, 255)
                        n.TextSize = 8
                        n.Font = Enum.Font.Gotham
                        n.ZIndex = 9
                        n.Parent = map
                        
                        local nc = Instance.new("UICorner")
                        nc.CornerRadius = UDim.new(0, 3)
                        nc.Parent = n
                    end
                    
                    if config.showDistance then
                        local d = Instance.new("TextLabel")
                        d.Name = "DistLabel"
                        d.Text = math.floor((op - pos).Magnitude) .. "m"
                        d.Size = UDim2.new(0, 60, 0, 12)
                        d.Position = UDim2.new(0.5, x - 30, 0.5, z + (config.showNames and 22 or 8))
                        d.BackgroundTransparency = 1
                        d.TextColor3 = Color3.fromRGB(150, 200, 255)
                        d.TextSize = 7
                        d.Font = Enum.Font.GothamBold
                        d.TextStrokeTransparency = 0.5
                        d.ZIndex = 9
                        d.Parent = map
                    end
                    
                    if config.showHealth then
                        local h = oc:FindFirstChildOfClass("Humanoid")
                        if h then
                            local hp = h.Health / h.MaxHealth
                            local hb = Instance.new("Frame")
                            hb.Name = "HealthBar"
                            hb.Size = UDim2.new(0, 20, 0, 3)
                            hb.Position = UDim2.new(0.5, x - 10, 0.5, z - 8)
                            hb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            hb.BorderSizePixel = 0
                            hb.ZIndex = 8
                            hb.Parent = map
                            
                            local hf = Instance.new("Frame")
                            hf.Size = UDim2.new(hp, 0, 1, 0)
                            hf.BackgroundColor3 = Color3.fromHSV(hp * 0.3, 1, 1)
                            hf.BorderSizePixel = 0
                            hf.Parent = hb
                        end
                    end
                    
                    if config.showViewCones then
                        local _, oy, _ = oc.HumanoidRootPart.CFrame:ToEulerAnglesXYZ()
                        local v = Instance.new("ImageLabel")
                        v.Name = "ViewCone"
                        v.Size = UDim2.new(0, 30, 0, 30)
                        v.Position = UDim2.new(0.5, x - 15, 0.5, z - 15)
                        v.BackgroundTransparency = 1
                        v.Image = "rbxassetid://7072721559"
                        v.ImageColor3 = m.BackgroundColor3
                        v.ImageTransparency = 0.7
                        v.Rotation = math.deg(oy)
                        v.ZIndex = 6
                        v.Parent = map
                    end
                end
            end
        end
    end
    
    local info = state.frame:FindFirstChild("InfoBar"):FindFirstChild("InfoText")
    if info then
        info.Text = string.format("Players: %d | Zoom: %d%%", count, config.zoom)
    end
end

ESPTab:AddToggle({
    Name = "Enable Radar",
    Default = false,
    Callback = function(v)
        config.enabled = v
        if v then
            createUI()
            task.spawn(function()
                while config.enabled and state.frame do
                    updateMap()
                    task.wait(0.1)
                end
            end)
        elseif state.frame then
            state.frame.Parent:Destroy()
            state.frame = nil
        end
    end
})

ESPTab:AddSlider({Name = "Size", Min = 150, Max = 700, Default = 200, Increment = 10, 
    Color = Color3.fromRGB(100, 180, 255), ValueName = "px",
    Callback = function(v) config.size = v if state.frame then state.frame.Size = UDim2.new(0, v, 0, v) end end})

ESPTab:AddSlider({Name = "Zoom", Min = 50, Max = 200, Default = 100, Increment = 10,
    Color = Color3.fromRGB(100, 255, 180), ValueName = "%", Callback = function(v) config.zoom = v end})

ESPTab:AddSlider({Name = "Opacity", Min = 0, Max = 0.8, Default = 0.8, Increment = 0.1,
    Color = Color3.fromRGB(255, 180, 100), ValueName = "", 
    Callback = function(v) config.opacity = v if state.frame then state.frame.BackgroundTransparency = v end end})

ESPTab:AddToggle({Name = "Show Names", Default = true, Callback = function(v) config.showNames = v end})
ESPTab:AddToggle({Name = "Show Compass", Default = true, Callback = function(v) config.showCompass = v 
    if state.frame then local c = state.frame.MapContainer:FindFirstChild("CompassFrame") if c then c.Visible = v end end end})
ESPTab:AddToggle({Name = "Show Grid", Default = true, Callback = function(v) config.showGrid = v 
    if state.frame then local g = state.frame.MapContainer:FindFirstChild("GridFrame") if g then g.Visible = v end end end})
ESPTab:AddToggle({Name = "Show Distance", Default = true, Callback = function(v) config.showDistance = v end})
ESPTab:AddToggle({Name = "Show Health", Default = true, Callback = function(v) config.showHealth = v end})
ESPTab:AddToggle({Name = "Show Cones", Default = false, Callback = function(v) config.showViewCones = v end})

ESPTab:AddButton({Name = "Set Waypoint", Callback = function()
    local c = LocalPlayer.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        state.waypoint = c.HumanoidRootPart.Position
        config.trackWaypoint = true
    end
end})

ESPTab:AddButton({Name = "Clear Waypoint", Callback = function()
    state.waypoint = nil
    config.trackWaypoint = false
end})


VehicleModsTab2:AddSection({
    Name = "Headlight Color"
})

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

-- Ffind head
local function getAllHeadlights()
    local headlights = {}
    
    local car = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
    if not car then 
        -- altnames
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle.Name:find(LocalPlayer.Name) then
                car = vehicle
                break
            end
        end
        if not car then return headlights end
    end

    
    -- m1
    local body = car:FindFirstChild("Body")
    if body then
        
        local headlightsFolder = body:FindFirstChild("Headlights")
        if headlightsFolder then
            
            local headlightsSubFolder = headlightsFolder:FindFirstChild("Headlights")
            if headlightsSubFolder then
                
                -- find lr
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
    
    -- m2
    if #headlights == 0 then
    for _, part in pairs(car:GetDescendants()) do
        if part:IsA("SpotLight") then
            table.insert(headlights, part)
        end
    end
end

return headlights
end


-- colorchange
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
            task.wait(0.5) --wait
            updateHeadlights()
            OrionLib:MakeNotification({
                Name = "Headlights",
                Content = "Custom headlight color enabled",
                Time = 3
            })
        else
            -- Back to stand
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
                    task.wait(0.05) -- fast update smoothen
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

VehicleModsTab2:AddSection({
    Name = "Underglow Lights"
})

local UnderglowSettings = {
    Enabled = false,
    Color = Color3.fromRGB(0, 255, 255),
    Rainbow = false,
    Brightness = 2,
    Range = 20
}

local underglowParts = {}

local function createUnderglow()
    -- clear old
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

-- REMOVED 'local' from service variables to reduce local count
Players = game:GetService("Players")
RunService = game:GetService("RunService")
Workspace = game:GetService("Workspace")
UserInputService = game:GetService("UserInputService")
ContextActionService = game:GetService("ContextActionService")

local player = Players.LocalPlayer

-- KEPT your state table as is (just 1 local variable)
local state = {
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

-- COMBINED all sound tables into one (was 4 tables, now 1)
local AllSounds = {
    -- Engine sounds
    ["Truck Engine"] = "rbxassetid://85098441998081",
    ["Sports Car"] = "rbxassetid://8916893206",
    ["V8 Muscle"] = "rbxassetid://74832102079275",
    ["Motorcycle"] = "rbxassetid://95861625173344",
    ["Electric Car"] = "rbxassetid://74570409322232",
    ["Classic Car"] = "rbxassetid://6679711103",
    ["Race Car"] = "rbxassetid://81491848767534",
    ["Monster Truck"] = "rbxassetid://1065439616",
    
    -- Horn sounds  
    ["Classic Horn"] = "rbxassetid://5945905639",
    ["Truck Horn"] = "rbxassetid://86051083118541",
    ["Police Siren"] = "rbxassetid://129944954638234",
    ["Train Horn"] = "rbxassetid://130210820726906",
    ["Boat Horn"] = "rbxassetid://117631655211899",
    ["Fancy Horn"] = "rbxassetid://9113887600",
    ["Goofy Horn"] = "rbxassetid://110741466920489",
    
    -- Engine presets (store as strings for easy lookup)
    ["Truck Engine_preset"] = "0.4|2.5|Deep Diesel",
    ["Sports Car_preset"] = "1.6|1.8|High Rev Sports",
    ["V8 Muscle_preset"] = "0.8|2.2|Powerful V8",
    ["Motorcycle_preset"] = "2.0|1.5|High Pitch Bike",
    ["Electric Car_preset"] = "1.2|1.0|Smooth Electric",
    ["Classic Car_preset"] = "0.9|1.8|Vintage Classic",
    ["Race Car_preset"] = "1.8|2.0|Extreme Racing",
    ["Monster Truck_preset"] = "0.3|3.0|Heavy Monster",
    
    -- Horn presets
    ["Classic Horn_preset"] = "1.0|1.0|Standard Car Horn",
    ["Truck Horn_preset"] = "0.7|2.5|Loud Air Horn",
    ["Police Siren_preset"] = "1.0|2.0|Emergency Siren",
    ["Train Horn_preset"] = "0.5|3.0|Powerful Train",
    ["Boat Horn_preset"] = "0.8|2.2|Deep Ship Horn",
    ["Fancy Horn_preset"] = "1.1|1.2|Elegant Tone"
}

local function detectVehicle()
    local character = player.Character
    if not character then return false end

    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return false end

    local seat = humanoid.SeatPart
    if not seat then
        state.seat = nil
        state.vehicle = nil
        return false
    end

    state.seat = seat
    state.vehicle = seat.Parent
    return true
end

local function removeCustomSound()
    if state.customSound then
        state.customSound:Stop()
        state.customSound:Destroy()
        state.customSound = nil
    end
end

local function spawnEngineSound()
    removeCustomSound()

    -- Use AllSounds table instead of engineSounds
    local soundAsset = AllSounds[state.engineType]
    if not soundAsset then
        soundAsset = AllSounds["Truck Engine"]
    end

    local newSound = Instance.new("Sound")
    newSound.Name = "CustomEngineSound"
    newSound.SoundId = soundAsset
    newSound.Volume = 0.5
    newSound.Pitch = state.enginePitch * 0.6
    newSound.Looped = true
    newSound.MaxDistance = 300
    newSound.RollOffMinDistance = 15

    if state.vehicle then
        if state.vehicle.PrimaryPart then
            newSound.Parent = state.vehicle.PrimaryPart
        else
            newSound.Parent = state.vehicle
        end
    else
        newSound.Parent = Workspace
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
            state.customSound = newSound
            return true
        end
    end

    newSound:Destroy()
    return false
end

local function fetchVehicleMetrics()
    if not state.seat then return 0, 0, 0 end

    local throttle = 0
    local speed = 0
    local rpm = 0

    if state.seat:IsA("VehicleSeat") then
        local velocityVector = state.seat.Velocity
        local forwardVector = state.seat.CFrame.LookVector
        local forwardVelocity = velocityVector:Dot(forwardVector)
        speed = math.abs(forwardVelocity) * 3.6

        throttle = math.abs(state.seat.ThrottleFloat)

        local maxSpeed = 150
        local speedPercentage = math.min(speed / maxSpeed, 1)

        local idleRPM = 800
        local maxRPM = 7000
        rpm = idleRPM + (speedPercentage * (maxRPM - idleRPM))

        if throttle > 0.1 then
            rpm = rpm * (1 + (throttle * 0.5))
        end

        local currentTime = tick()
        local speedChange = speed - state.previousSpeed
        state.currentAcceleration = speedChange / 0.1
        state.previousSpeed = speed

        if state.currentAcceleration > 10 then
            rpm = rpm * 1.3
        elseif state.currentAcceleration > 5 then
            rpm = rpm * 1.15
        end
    else
        local velocityMagnitude = state.seat.Velocity.Magnitude
        speed = velocityMagnitude * 3.6
        throttle = 0
        rpm = 800 + (speed / 150 * 6200)
    end

    rpm = math.clamp(rpm, 800, 8000)

    return throttle, math.floor(speed), rpm
end

local function refreshEngineSound()
    if not state.customSound or not state.engineActive then return end

    local throttle, speed, rpm = fetchVehicleMetrics()
    state.throttleInput = throttle
    state.currentSpeed = speed
    state.engineRPM = rpm

    local minPitch = state.enginePitch * 0.5
    local maxPitch = state.enginePitch * 2.0

    local rpmNormalized = (rpm - 800) / (8000 - 800)
    local targetPitch = minPitch + (rpmNormalized * (maxPitch - minPitch))

    local minVolume = state.engineVolume * 0.3
    local maxVolume = state.engineVolume * 1.5

    local targetVolume = minVolume + (rpmNormalized * (maxVolume - minVolume))

    if throttle > 0.3 then
        targetVolume = targetVolume * (1 + (throttle * 0.3))
    end

    if state.currentAcceleration > 15 then
        targetPitch = targetPitch * 1.1
        targetVolume = targetVolume * 1.2
    elseif state.currentAcceleration > 8 then
        targetPitch = targetPitch * 1.05
        targetVolume = targetVolume * 1.1
    end

    if speed < 1 and throttle < 0.1 then
        targetPitch = state.enginePitch * 0.6
        targetVolume = state.engineVolume * 0.3
    end

    targetPitch = math.clamp(targetPitch, 0.2, 3.0)
    targetVolume = math.clamp(targetVolume, 0.2, 4.0)

    local smoothFactor = 0.15
    local currentPitch = state.customSound.Pitch
    local currentVolume = state.customSound.Volume

    local newPitch = currentPitch + (targetPitch - currentPitch) * smoothFactor
    local newVolume = currentVolume + (targetVolume - currentVolume) * smoothFactor

    state.customSound.Pitch = newPitch
    state.customSound.Volume = newVolume
end

local function initializeSoundSystem()
    if state.engineLoop then
        state.engineLoop:Disconnect()
        state.engineLoop = nil
    end

    removeCustomSound()

    local success = spawnEngineSound()
    if success then
        state.engineLoop = RunService.Heartbeat:Connect(function()
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
        local wasInVehicle = state.inVehicle
        state.inVehicle = detectVehicle()

        if state.inVehicle ~= wasInVehicle then
            if state.inVehicle then
                task.wait(0.5)
                if state.engineActive then
                    initializeSoundSystem()
                end
            else
                if state.engineLoop then
                    state.engineLoop:Disconnect()
                    state.engineLoop = nil
                end
                removeCustomSound()
                state.currentSpeed = 0
                state.throttleInput = 0
                state.engineRPM = 0
                state.previousSpeed = 0
                state.currentAcceleration = 0
            end
        end

        task.wait(0.5)
    end
end

local function toggleEngineState()
    if not state.inVehicle then
        OrionLib:MakeNotification({
            Name = "Engine",
            Content = "Enter a vehicle first",
            Time = 3
        })
        return false
    end

    state.engineActive = not state.engineActive

    if state.engineActive then
        local success = initializeSoundSystem()
        if success then
            OrionLib:MakeNotification({
                Name = "Engine",
                Content = "Custom engine ACTIVE",
                Time = 2
            })
        else
            state.engineActive = false
            return false
        end
    else
        removeCustomSound()
        if state.engineLoop then
            state.engineLoop:Disconnect()
            state.engineLoop = nil
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
    if not state.hornActive then return end
    if not state.inVehicle then return end
    if tick() - state.lastHornTime < 0.5 then return end

    state.lastHornTime = tick()

    -- Use AllSounds table instead of hornSounds
    local hornSoundAsset = AllSounds[state.hornType]
    if not hornSoundAsset then
        hornSoundAsset = AllSounds["Classic Horn"]
    end

    local horn = Instance.new("Sound")
    horn.SoundId = hornSoundAsset
    horn.Volume = state.hornVolume
    horn.Pitch = state.hornPitch
    horn.Parent = Workspace

    horn:Play()

    task.wait(3)
    horn:Destroy()
end

local function previewHorn()
    if not state.inVehicle then
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
    -- Get preset from AllSounds table
    local presetString = AllSounds[state.hornType .. "_preset"]
    if presetString then
        local parts = {}
        for part in presetString:gmatch("[^|]+") do
            table.insert(parts, part)
        end
        
        if #parts >= 2 then
            state.hornPitch = tonumber(parts[1]) or 1.0
            state.hornVolume = tonumber(parts[2]) or 1.0
            
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

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.H then
            activateHorn()
        end
    end)
end

local function previewEngineSounds()
    if not state.engineActive or not state.customSound then
        OrionLib:MakeNotification({
            Name = "Preview",
            Content = "Enable engine first",
            Time = 2
        })
        return
    end

    OrionLib:MakeNotification({
        Name = "Preview",
        Content = "Testing engine states...",
        Time = 3
    })

    local originalPitch = state.customSound.Pitch
    local originalVolume = state.customSound.Volume

    state.customSound.Pitch = state.enginePitch * 0.6
    state.customSound.Volume = state.engineVolume * 0.3
    task.wait(1)

    state.customSound.Pitch = state.enginePitch * 0.9
    state.customSound.Volume = state.engineVolume * 0.7
    task.wait(1)

    state.customSound.Pitch = state.enginePitch * 1.2
    state.customSound.Volume = state.engineVolume * 1.0
    task.wait(1)

    state.customSound.Pitch = state.enginePitch * 1.6
    state.customSound.Volume = state.engineVolume * 1.3
    task.wait(1)

    state.customSound.Pitch = state.enginePitch * 1.9
    state.customSound.Volume = state.engineVolume * 1.6
    task.wait(1)

    state.customSound.Pitch = state.enginePitch * 0.6
    state.customSound.Volume = state.engineVolume * 0.3
    task.wait(0.5)

    state.customSound.Pitch = originalPitch
    state.customSound.Volume = originalVolume
end

local function applyPresetConfig()
    -- Get preset from AllSounds table
    local presetString = AllSounds[state.engineType .. "_preset"]
    if presetString then
        local parts = {}
        for part in presetString:gmatch("[^|]+") do
            table.insert(parts, part)
        end
        
        if #parts >= 2 then
            state.enginePitch = tonumber(parts[1]) or 1.0
            state.engineVolume = tonumber(parts[2]) or 1.5

            if state.engineActive and state.customSound then
                state.customSound.Pitch = state.enginePitch * 0.6
                state.customSound.Volume = state.engineVolume * 0.3
            end

            OrionLib:MakeNotification({
                Name = "Engine Preset",
                Content = parts[3] or "Preset Applied",
                Time = 3
            })
        end
    end
end


VehicleModsTab2:AddSection({
    Name = "Controls"
})

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
            state.engineActive = false
            removeCustomSound()
            if state.engineLoop then
                state.engineLoop:Disconnect()
                state.engineLoop = nil
            end
        end
    end
})

local engineDropdown = VehicleModsTab2:AddDropdown({
    Name = "Select Engine Type",
    Default = "...",
    Options = {"Truck Engine", "Sports Car", "V8 Muscle", "Motorcycle", "Electric Car", "Classic Car", "Race Car", "Monster Truck"},
    Callback = function(selection)
        state.engineType = selection
        applyPresetConfig()

        if state.engineActive then
            initializeSoundSystem()
        end
    end
})


VehicleModsTab2:AddSection({
    Name = "Engine Configuration"
})

VehicleModsTab2:AddSlider({
    Name = "Engine Pitch",
    Min = 0.2,
    Max = 3.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(value)
        state.enginePitch = value
        if state.engineActive and state.customSound then
            local currentRatio = state.customSound.Pitch / state.enginePitch
            state.customSound.Pitch = value * currentRatio
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
        state.engineVolume = value
        if state.engineActive and state.customSound then
            local currentRatio = state.customSound.Volume / state.engineVolume
            state.customSound.Volume = value * currentRatio
        end
    end
})

VehicleModsTab2:AddSection({
    Name = "Horn Controls"
})

local hornToggle = VehicleModsTab2:AddToggle({
    Name = "Enable Horn",
    Default = true,
    Callback = function(enabled)
        state.hornActive = enabled

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

VehicleModsTab2:AddSection({
    Name = "Horn Selection"
})

local hornDropdown = VehicleModsTab2:AddDropdown({
    Name = "Select Horn Type",
    Default = "...",
    Options = {"Classic Horn", "Truck Horn", "Police Siren", "Train Horn", "Boat Horn", "Fancy Horn", "Goofy Horn"},
    Callback = function(selection)
        state.hornType = selection
        applyHornPreset()
    end
})

VehicleModsTab2:AddSection({
    Name = "Horn Configuration"
})

VehicleModsTab2:AddSlider({
    Name = "Horn Pitch",
    Min = 0.2,
    Max = 3.0,
    Color = Color3.fromRGB(255, 255, 255),
    Default = 1.0,
    Increment = 0.1,
    ValueName = "",
    Callback = function(value)
        state.hornPitch = value
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
        state.hornVolume = value
    end
})

setupHornControls()
task.spawn(monitorVehicleState)


ohString1 = "CHRISTMAS25"

success, errorMessage = pcall(function()
    game:GetService("ReplicatedStorage").WvO["b9a04abf-aea6-466b-8bfc-6a0bc1ae6423"]:FireServer(ohString1)
end)

if not success then

end
OrionLib:Init()

    
    OrionLib:MakeNotification({
        Name = "Heavenly",
        Content = "Join Discord! discord.gg/MERzRQ2UHn",
        Image = "rbxassetid://6035067873",
        Time = 16
    })

