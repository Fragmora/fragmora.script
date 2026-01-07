
print([[


      __     __         _            
      \ \   / /__  _ __| |_ _____  __
       \ \ / / _ \| '__| __/ _ \ \/ /
        \ V / (_) | |  | ||  __/>  < 
         \_/ \___/|_|   \__\___/_/\_\
         Invented by Vortex Softwares                              

]])

local Config = {
	SilentAimRemote = game:GetService("ReplicatedStorage")["8WX"]:FindFirstChild("75721fbe-0361-4584-8feb-db2f118fa345"),
	TeaserShootRemoteEvent = game:GetService("ReplicatedStorage")["8WX"]:FindFirstChild("9b91a7ac-035c-4b97-9a85-9c36725e1796"),
	WerfRemoteEvent = game:GetService("ReplicatedStorage")["8WX"]:FindFirstChild("ee32a070-689d-44c7-93f4-ff844b2d3cd9"),
	Startjob = game:GetService("ReplicatedStorage")["8WX"]["0969d40c-0276-45c3-93d6-fdf1b6288c9e"]:FireServer("Patrol Police"),
	SpawnPoliceCar = game:GetService("ReplicatedStorage")["8WX"]["6820a68a-8236-4f37-96cc-238f5a7d9452"],
	EquipRadar = game:GetService("ReplicatedStorage")["8WX"]["40b23e8d-c721-47f8-9170-bbf8e467a35e"],
	RadarFarm = game:GetService("ReplicatedStorage")["8WX"]:FindFirstChild("35b3ffbf-8881-4eba-aaa2-6d0ce8f8bf8b"),
	VehicleDamageEvent = "37530351-ec20-4541-91f4-5b4df32f6a57"
}

local OrionLib = loadstring(game:HttpGet(('https://vortexsoft.pages.dev/api/VortexOrion.lua')))()
local Window = OrionLib:MakeWindow({
	Name = "Vortex    ",
	IntroText = "Launche Vortex",
	ShowIcon = true,
	Icon = "rbxassetid://79780037058546",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "Vortex",
	IntroEnabled = true
})

--Tabs

local SilentTab = Window:MakeTab({
	Name = "Silent Aim",
	Icon = "rbxassetid://138025957139303",
	PremiumOnly = false
})

local AimbotTab = Window:MakeTab({
	Name = "Aimbot",
	Icon = "rbxassetid://98232288704820",
	PremiumOnly = false
})

local TeleportTab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://123690431658937",
	PremiumOnly = false
})

local GunModTab = Window:MakeTab({
	Name = "Gun Mods",
	Icon = "rbxassetid://105216135416947",
	PremiumOnly = false
})

local CarModTab = Window:MakeTab({
	Name = "Car Mods",
	Icon = "rbxassetid://128462213395880",
	PremiumOnly = false
})

local Movement = Window:MakeTab({
	Name = "Movement",
	Icon = "rbxassetid://138054820332928",
	PremiumOnly = false
})

local Graphics = Window:MakeTab({
	Name = "Graphics",
	Icon = "rbxassetid://132177256558172",
	PremiumOnly = false
})

local farmTab = Window:MakeTab({
	Name = "Autofarm",
	Icon = "rbxassetid://121450316772412",
	PremiumOnly = false
})

local EspTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://108372562043884",
	PremiumOnly = false
})

local PoliceTab = Window:MakeTab({
	Name = "Police",
	Icon = "rbxassetid://89652930608206",
	PremiumOnly = false
})

local BypassTab = Window:MakeTab({
	Name = "Bypass",
	Icon = "rbxassetid://113978382940267",
	PremiumOnly = false
})	

local InfoTab = Window:MakeTab({
	Name = "Server",
	Icon = "rbxassetid://92667392992793",
	PremiumOnly = false
})

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://138941473258345",
	PremiumOnly = false
})


--Sections

local Section = AimbotTab:AddSection({
	Name = "Aimbot"
})

local Section = SilentTab:AddSection({
	Name = "Silent Aim Option"
})

local Section = GunModTab:AddSection({
	Name = "Gun Mod Options"
})

local Section = CarModTab:AddSection({
	Name = "Car Mod Options"
})

local Section = Movement:AddSection({
	Name = "Animations"
})

local Section = EspTab:AddSection({
	Name = "ESP Options"
})

local Section = Graphics:AddSection({
	Name = "Graphic Options"
})

local Section = TeleportTab:AddSection({
	Name = "Teleport Options"
})

local Section = farmTab:AddSection({
	Name = "Farm Options"
})

local Section = PoliceTab:AddSection({
	Name = "Police Options"
})

local Section = BypassTab:AddSection({
	Name = "Bypass Options"
})

local Section = InfoTab:AddSection({
	Name = "Server Information"
})

-- Komplettes Aimbot-Skript mit FOV & UI-Erweiterungen

local ignoredTeams = {
	["ADAC"] = true,
	["BusCompany"] = true,
	["FireDepartment"] = true,
	["Prisoner"] = true,
	["TruckCompany"] = true,
}

local ignoreUntouchable = true

local ignoreNotWanted = false 
-- Einstellungen
local aimbotEnabled = false
local mobileAimbotEnabled = false 
local aimPart = "HumanoidRootPart"
local teamCheck = true
local smoothness = 0.20
local enemyPredictionEnabled = false
local knockThreshold = 24
local maxDistance = 500
local fovSize = 100
local fovColor = Color3.fromRGB(255, 255, 255)
local fovThickness = 1

local whitelistedUsers = {}
local selectedPlayer = "Select Player"
local playerDropdown

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local aimbotGui = Instance.new("ScreenGui")
aimbotGui.Name = "MobileAimbotUI"
aimbotGui.ResetOnSpawn = false
aimbotGui.Enabled = false
aimbotGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 180)
frame.Position = UDim2.new(0.5, -90, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true
frame.Parent = aimbotGui

local function createButton(name, yOffset, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -20, 0, 30)
	button.Position = UDim2.new(0, 10, 0, yOffset)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.SourceSansSemibold
	button.TextSize = 16
	button.Text = name
	button.Parent = frame
	button.MouseButton1Click:Connect(callback)
	return button
end

local mobileAimbotButton = createButton("Mobile Aimbot", 10, function()
	mobileAimbotEnabled = not mobileAimbotEnabled
	mobileAimbotButton.BackgroundColor3 = mobileAimbotEnabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 50)
end)

local regularAimbotButton = createButton("Toggle Aimbot", 50, function()
	aimbotEnabled = not aimbotEnabled
	regularAimbotButton.BackgroundColor3 = aimbotEnabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 50)
end)

createButton("Toggle Prediction", 90, function()
	enemyPredictionEnabled = not enemyPredictionEnabled
end)

-- Orion UI Setup (falls du OrionLib benutzt)
AimbotTab:AddToggle({
	Name = "Mobile Aimbot",
	Default = false,
	Callback = function(value)
		aimbotGui.Enabled = value
	end
})

AimbotTab:AddToggle({
	Name = "Aimbot",
	Default = false,
	Callback = function(value)
		aimbotEnabled = value
	end
})

AimbotTab:AddBind({
	Name = "Aimbot Keybind",
	Default = Enum.KeyCode.L,
	Save = true,
	Flag = "AimbotKeybind",
	Callback = function()
		aimbotEnabled = not aimbotEnabled
	end
})

AimbotTab:AddDropdown({
	Name = "Aim Part",
	Default = "Head",
	Options = {"Head", "HumanoidRootPart"},
	Save = true,
	Flag = "Aim PartAimbot",
	Callback = function(value)
		aimPart = value
	end
})

AimbotTab:AddToggle({
	Name = "Ignore Team",
	Default = false,
	Save = true,
	Flag = "IgnoreTeamAimbot",
	Callback = function(value)
		teamCheck = value
	end
})

AimbotTab:AddToggle({
	Name = "Hit Prediction",
	Default = true,
	Save = true,
	Flag = "Hit PredictionAimbot",
	Callback = function(value)
		enemyPredictionEnabled = value
	end
})

AimbotTab:AddToggle({
	Name = "Ignore Untouchable Teams",
	Default = true,
	Save = true,
	Flag = "IgnoreUntouchableTeams",
	Callback = function(Value)
		ignoreUntouchable = Value
	end
})

AimbotTab:AddToggle({
	Name = "Ignore Not Wanted Civilians",
	Default = false,
	Save = true,
	Flag = "IgnoreNotWantedCivilians",
	Callback = function(Value)
		ignoreNotWanted = Value
	end
})

AimbotTab:AddColorpicker({
	Name = "FOV Color",
	Color = Color3.fromRGB(9, 99, 195),
	Save = true,
	Flag = "FOVColorAimbot",
	Callback = function(Value)
		fovColor = Value
	end
})

AimbotTab:AddSlider({
	Name = "Max Distance",
	Min = 10,
	Max = 1000,
	Default = 500,
	Color = Color3.fromRGB(11, 118, 225),
	Save = true,
	Flag = "MaxDistance",
	Increment = 10,
	Suffix = " Studs",
	Callback = function(value)
		maxDistance = value
	end
})

AimbotTab:AddSlider({
	Name = "Aimbot Smoothness",
	Min = 0.1,
	Max = 1,
	Default = 0.5,
	Save = true,
	Flag = "AimbotSmoothness",
	Color = Color3.fromRGB(12, 130, 235),
	Increment = 0.1,
	Suffix = " Smoothness",
	Callback = function(value)
		smoothness = value
	end
})

AimbotTab:AddSlider({
	Name = "FOV Size",
	Min = 20,
	Max = 300,
	Default = 100,
	Color = Color3.fromRGB(9, 99, 195),
	Save = true,
	Flag = "FOVSizeAimbot",
	Callback = function(value)
		fovSize = value
	end
})

local Section = AimbotTab:AddSection({
	Name = "Whitelist Settings"
})

local function updatePlayerList()
	local players = {"Select Player"}
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer then
			table.insert(players, player.Name)
		end
	end
	return players
end

-- Whitelist UI
playerDropdown = AimbotTab:AddDropdown({
	Name = "Select Player",
	Default = "",
	Options = updatePlayerList(),
	Callback = function(Value)
		selectedPlayer = Value
	end
})

AimbotTab:AddTextbox({
	Name = "Select Username",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		if Value ~= "" and Value ~= "Username eingeben" then
			whitelistedUsers[Value] = true
			OrionLib:MakeNotification({
				Name = "Whitelist",
				Content = Value .. " was added to the whitelist",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
	end
})

AimbotTab:AddButton({
	Name = "Add to Whitelist",
	Callback = function()
		if selectedPlayer ~= "Select Player" then
			whitelistedUsers[selectedPlayer] = true
			OrionLib:MakeNotification({
				Name = "Whitelist",
				Content = selectedPlayer .. " was added to the whitelist",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		else
			OrionLib:MakeNotification({
				Name = "Whitelist",
				Content = "Please select a player first",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
	end
})

AimbotTab:AddButton({
	Name = "Remove from Whitelist",
	Callback = function()
		if selectedPlayer ~= "Select Player" then
			if whitelistedUsers[selectedPlayer] then
				whitelistedUsers[selectedPlayer] = nil
				OrionLib:MakeNotification({
					Name = "Whitelist",
					Content = selectedPlayer .. " was removed from the whitelist",
					Image = "rbxassetid://4483345998",
					Time = 3
				})
			else
				OrionLib:MakeNotification({
					Name = "Whitelist",
					Content = selectedPlayer .. " is not in the whitelist",
					Image = "rbxassetid://4483345998",
					Time = 3
				})
			end
		else
			OrionLib:MakeNotification({
				Name = "Whitelist",
				Content = "Please select a player first",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
	end
})

AimbotTab:AddButton({
	Name = "Show Whitelisted Users",
	Callback = function()
		local userList = ""
		for username, _ in pairs(whitelistedUsers) do
			userList = userList .. username .. "\n"
		end

		if userList == "" then 
			userList = "No users in the whitelist"
		end

		OrionLib:MakeNotification({
			Name = "Whitelist",
			Content = userList,
			Image = "rbxassetid://4483345998",
			Time = 10
		})
	end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- FOV Circle zeichnen
local fovCircle = Drawing.new("Circle")
fovCircle.Radius = fovSize
fovCircle.Thickness = fovThickness
fovCircle.Filled = false
fovCircle.Color = fovColor
fovCircle.Visible = true

-- Targeting-Funktionen
local function predictTarget(target, predictionTime)
	if not target.Character or not target.Character:FindFirstChild(aimPart) then return Vector3.zero end
	local pos = target.Character[aimPart].Position
	local vel = target.Character[aimPart].Velocity
	return pos + vel * predictionTime
end

local function getClosestTarget()
	local cam = workspace.CurrentCamera
	local closest = nil
	local shortest = math.huge
	local localPlayer = player
	local char = localPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end

	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr == localPlayer or not plr.Character then continue end
		local part = plr.Character:FindFirstChild(aimPart)
		local hum = plr.Character:FindFirstChildOfClass("Humanoid")
		if not part or not hum or hum.Health <= knockThreshold then continue end
		if teamCheck and localPlayer.Team == plr.Team then continue end

		local screenPos, onScreen = cam:WorldToViewportPoint(part.Position)
		if not onScreen then continue end
		local mousePos = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
		local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude

		if dist < fovSize and dist < shortest and (char.HumanoidRootPart.Position - part.Position).Magnitude <= maxDistance then
			shortest = dist
			closest = plr
		end
	end
	return closest
end

local function getClosestTarget()
	local cam = workspace.CurrentCamera
	local closestPlayer = nil
	local closestDistance = math.huge
	local localPlayer = game.Players.LocalPlayer
	if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return nil
	end
	local localPosition = localPlayer.Character.HumanoidRootPart.Position
	local localTeam = localPlayer.Team

	for _, player in pairs(game.Players:GetPlayers()) do
		if player == localPlayer then continue end
		if not player.Character or not player.Character:FindFirstChild(aimPart) then continue end
		if whitelistedUsers[player.Name] then continue end

		-- ✳️ Ignoriere unantastbare Teams
		if ignoreUntouchable and ignoredTeams[player.Team.Name] then continue end

		if teamCheck then
			if not localTeam or not player.Team then continue end
			if localTeam.Name == "Citizen" and player.Team.Name ~= "Police" then continue end
			if localTeam.Name == "Police" and player.Team.Name ~= "Citizen" then continue end
		end

		if ignoreNotWanted then
			local isWanted = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and 
				player.Character.HumanoidRootPart:GetAttribute("IsWanted") == true
			local isPolice = player.Team and player.Team.Name == "Police"

			if not isWanted and not isPolice then 
				continue
			end
		end

		local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
		if not humanoid or humanoid.Health <= knockThreshold then continue end

		local targetPosition = player.Character[aimPart].Position
		local distanceToTarget = (localPosition - targetPosition).Magnitude
		if distanceToTarget > maxDistance then continue end

		local targetPos = cam:WorldToScreenPoint(targetPosition)
		if targetPos.Z < 0 then continue end

		local screenDistance = (Vector2.new(targetPos.X, targetPos.Y) - Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)).Magnitude
		if screenDistance > fovSize then continue end -- ✅ FOV-Bedingung hier einfügen

		if screenDistance < closestDistance then
			closestDistance = screenDistance
			closestPlayer = player
		end
	end
	return closestPlayer
end

-- TRIGGERBOT

-- Main Loop
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
	fovCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
	fovCircle.Color = fovColor
	local cam = workspace.CurrentCamera
	fovCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
	fovCircle.Radius = fovSize
	fovCircle.Visible = aimbotEnabled or mobileAimbotEnabled

	local target = getClosestTarget()

	if not target or not target.Character or not target.Character:FindFirstChild(aimPart) then return end

	local targetPos = enemyPredictionEnabled and predictTarget(target, 0.2) or target.Character[aimPart].Position
	local current = cam.CFrame.LookVector
	local dir = (targetPos - cam.CFrame.Position).Unit
	local newLook = current:Lerp(dir, smoothness)

	if (aimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) or mobileAimbotEnabled then
		cam.CFrame = CFrame.new(cam.CFrame.Position, cam.CFrame.Position + newLook)
	end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()

local enabled = false
local connection = nil
local targetMode = "All"  -- "Head", "Body", "All"

-- Body-Part Tabellen
local bodyParts = {
	Head = {"Head"},
	Body = {"UpperTorso", "LowerTorso", "HumanoidRootPart"},
	All = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"}
}

-- Funktion zum Simulieren des Mausklicks
local function click()
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	task.wait(0.05)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end

-- Überprüft, ob das Ziel ein gültiger Gegner ist
local function isValidTarget(part)
	local character = part:FindFirstAncestorOfClass("Model")
	if not character then return false end

	local player = Players:GetPlayerFromCharacter(character)
	if not player or player == localPlayer then return false end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0.25 then return false end

	return true
end

-- Hauptfunktion TriggerBot
local function triggerbot()
	if not enabled then return end

	local target = mouse.Target
	if not target then return end

	local selectedParts = bodyParts[targetMode] or bodyParts.All

	if table.find(selectedParts, target.Name) and isValidTarget(target) then
		click()
	end
end

-- TriggerBot Aktivieren/Deaktivieren
local function toggleTriggerBot(state)
	enabled = state
	if state then
		if not connection then
			connection = RunService.RenderStepped:Connect(triggerbot)
		end
	else
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end
end

local Section = AimbotTab:AddSection({
	Name = "Triggerbot Mods"
})

-- Toggle
AimbotTab:AddToggle({
	Name = "TriggerBot",
	Default = false,
	Callback = function(Value)
		toggleTriggerBot(Value)
	end
})

-- Dropdown zur Auswahl der Zielregion
AimbotTab:AddDropdown({
	Name = "Target Body Area",
	Default = "All",
	Options = {"Head", "Body", "All"},
	Callback = function(Value)
		targetMode = Value
	end
})

--Silent Aim

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
local ShootSpeed = 5 -- Schüsse pro Sekunde
local IsHoldingKey = false

-- Ignorierte Teams
local ignoredTeams = {
	["ADAC"] = true,
	["BusCompany"] = true,
	["FireDepartment"] = true,
	["Prisoner"] = true,
	["TruckCompany"] = true,
}

-- Create FOV circle
local FovCircle = Drawing.new("Circle")
FovCircle.Filled = false
FovCircle.Transparency = 1
FovCircle.Thickness = 1
FovCircle.Color = FovColor
FovCircle.Radius = FovSize
FovCircle.Visible = false

-- Function to update FOV circle
local function updateFovCircle()
	local cam = game:GetService("Workspace").CurrentCamera
	FovCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
	FovCircle.Radius = FovSize
	FovCircle.Color = SilentAimEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

	-- Automatically show FOV when Silent Aim is enabled
	FovCircle.Visible = FovEnabled or SilentAimEnabled
end

-- Run the update function on every frame
game:GetService("RunService").RenderStepped:Connect(updateFovCircle)

-- Silent Aim Toggle
SilentTab:AddToggle({
	Name = "Silent Aim",
	Default = false,
	Save = true,
	Flag = "SilentAim",
	Callback = function(Value)
		SilentAimEnabled = Value
		updateFovCircle()
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
	end
})


-- Show FOV Toggle
SilentTab:AddToggle({
	Name = "Show FOV",
	Default = false,
	Save = true,
	Flag = "ShowFOVSilentAim",
	Callback = function(Value)
		FovEnabled = Value
		updateFovCircle()
	end
})

-- Ignore Untouchable Teams Toggle
SilentTab:AddToggle({
	Name = "Ignore Untouchable Teams",
	Default = true,
	Save = true,
	Flag = "IgnoreUntouchableTeams",
	Callback = function(Value)
		ignoreUntouchable = Value
	end
})

-- Other toggles and sliders
SilentTab:AddToggle({
	Name = "Hit Prediction",
	Default = true,
	Save = true,
	Flag = "PredictionEnabled",
	Callback = function(Value)
		PredictionEnabled = Value
	end
})

SilentTab:AddToggle({
	Name = "Ignores Dead People",
	Default = true,
	Save = true,
	Flag = "KnockedCheck",
	Callback = function(Value)
		KnockedCheck = Value
	end
})

SilentTab:AddToggle({
	Name = "Ignore Team",
	Default = false,
	Save = true,
	Flag = "TeamCheck",
	Callback = function(Value)
		TeamCheckEnabled = Value
	end
})

-- Shoot Speed Slider
SilentTab:AddSlider({
	Name = "Shoot Speed",
	Min = 1,
	Max = 20,
	Default = 10,
	Increment = 1,
	Suffix = "Shots/Sec",
	Color = Color3.fromRGB(9, 99, 195),
	Save = true,
	Flag = "ShootSpeedSilentAim",
	Callback = function(Value)
		ShootSpeed = Value
	end
})

SilentTab:AddSlider({
	Name = "FOV Size",
	Min = 10,
	Max = 300,
	Default = 50,
	Increment = 5,
	Suffix = "Units",
	Color = Color3.fromRGB(9, 99, 195),
	Save = true,
	Flag = "FovSizeSilentAim",
	Callback = function(Value)
		FovSize = Value
		updateFovCircle()
	end
})

local Section = SilentTab:AddSection({
	Name = "Special Mods"
})

SilentTab:AddToggle({
	Name = "Hold to Shoot",
	Default = false,
	Save = true,
	Flag = "HoldToShootSilentAim",
	Callback = function(Value)
		HoldToShootEnabled = Value
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

local function IsVisible(targetPart)
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
					Config.SilentAimRemote:FireServer(weapon, predictedPosition, direction)

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
	if SilentAimEnabled then
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

--GunMods

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local running = false

GunModTab:AddToggle({
	Name = "Fast Bullet",
	Default = false,
	Save = true,
	Flag = "FastBullet",
	Callback = function(Value)
		running = Value

		if running then
			task.spawn(function()
				while running do
					local Tool = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
					if Tool then
						Tool:SetAttribute("ShootDelay", 0)
						Tool:SetAttribute("Automatic", true)
					end
					task.wait(0.1)
				end
			end)
		end
	end
})


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local autoReloadConnection

GunModTab:AddToggle({
	Name = "Auto Reload",
	Default = false,
	Save = true,
	Flag = "AutoReload",
	Callback = function(state)
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		local VirtualInputManager = game:GetService("VirtualInputManager")

		local trackedWeapons = {
			"G36",
			"Glock 17",
			"MP5",
			"M4 Carabine",
			"Sniper",
			"M58B Shotgun"
		}

		task.spawn(function()
			while state do
				pcall(function()
					local character = LocalPlayer.Character
					if character then
						for _, weaponName in ipairs(trackedWeapons) do
							local weapon = character:FindFirstChild(weaponName) or workspace:FindFirstChild(weaponName)
							if weapon then
								local magSize = weapon:GetAttribute("MagCurrentSize") 
									or weapon:GetAttribute("Ammo") 
									or weapon:GetAttribute("Clip") 
									or (weapon:FindFirstChild("Ammo") and weapon.Ammo.Value)

								if magSize and magSize == 0 then
									VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
									task.wait(0.1)
									VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
									task.wait(1)
								end
							end
						end
					end
				end)
				task.wait(0.5)
			end
		end)
	end
})


GunModTab:AddToggle({
	Name = "No Recoil",
	Default = false,
	Save = true,
	Flag = "NoRecoil",
	Callback = function(enabled)
		if enabled then
			-- Start disabling recoil
			recoilConnection = RunService.Heartbeat:Connect(function()
				local tool = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
				if tool then
					tool:SetAttribute("Recoil", 0)
					tool:SetAttribute("Instability", 0)
				end
			end)
		else
			-- Stop disabling recoil
			if recoilConnection then
				recoilConnection:Disconnect()
				recoilConnection = nil
			end
		end
	end
})

------------------------- shoot sounds

local soundOptions = {
	"Default",
	"Ak47", 
	"M1911",
	"Glock",
	"MP40",
	"P90",
	"Pixel",
	"Undertale"
}

local soundIds = {
	["Ak47"] = "rbxassetid://5910000043",
	["M1911"] = "rbxassetid://1136243671", 
	["Glock"] = "rbxassetid://6581933860",
	["MP40"] = "rbxassetid://103807799095792",
	["P90"] = "rbxassetid://87534588983395",
	["Pixel"] = "rbxassetid://7380537613",
	["Undertale"] = "rbxassetid://438149153"
}

local originalSounds = {}
local soundObjects = {}

local function initializeSounds()
	for _, sound in pairs(game:GetDescendants()) do
		if sound:IsA("Sound") then
			local currentId = sound.SoundId
			if currentId == "rbxassetid://801226154" or currentId == "rbxassetid://801217802" then
				originalSounds[sound] = currentId
				soundObjects[sound] = true
			end
		end
	end
end

local function changeSounds(selectedSound)
	local newSoundId = soundIds[selectedSound]

	for sound, originalId in pairs(originalSounds) do
		if sound and sound.Parent then
			if selectedSound == "Default" then
				-- Zurück zur Original-ID
				sound.SoundId = originalId
			else
				-- Neuen Sound setzen
				sound.SoundId = newSoundId
			end
		end
	end
end

initializeSounds()

GunModTab:AddDropdown({
	Name = "Shoot Sound",
	Default = "Default",
	Save = true,
	Flag = "ShootSound",
	Options = soundOptions,
	Callback = function(selectedSound)
		changeSounds(selectedSound)
	end    
})

------------------------- croshhair size

local CrosshairSize = 25
local connections = {}

local function updateCrosshair(tool)
	if tool then
		tool:SetAttribute("CrosshairSize", CrosshairSize)
	end
end

local function setupToolListeners()
	local plr = game:GetService("Players").LocalPlayer

	for _, connection in pairs(connections) do
		connection:Disconnect()
	end
	connections = {}

	plr.CharacterAdded:Connect(function(character)
		connections.toolAdded = character.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				updateCrosshair(child)
			end
		end)

		for _, tool in pairs(character:GetChildren()) do
			if tool:IsA("Tool") then
				updateCrosshair(tool)
			end
		end
	end)

	if plr.Character then
		for _, tool in pairs(plr.Character:GetChildren()) do
			if tool:IsA("Tool") then
				updateCrosshair(tool)
			end
		end

		connections.toolAdded = plr.Character.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				updateCrosshair(child)
			end
		end)
	end
end

GunModTab:AddSlider({
	Name = "Crosshair Size",
	Min = 0,
	Max = 25,
	Default = 25,
	Save = true,
	Flag = "CrosshairSize",
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = " ",
	Callback = function(Value)
		CrosshairSize = Value

		-- Crosshair für alle aktuellen Tools aktualisieren
		local plr = game:GetService("Players").LocalPlayer
		if plr and plr.Character then
			for _, tool in pairs(plr.Character:GetChildren()) do
				if tool:IsA("Tool") then
					updateCrosshair(tool)
				end
			end
		end
	end    
})

setupToolListeners()

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	setupToolListeners()
end)

------------------------- FOV

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local aimFovConnection
local aimFovValue = 40 -- Standardwert, gleich wie im Slider-Default

-- Starte Verbindung direkt beim Script-Ausführung
aimFovConnection = RunService.Heartbeat:Connect(function()
	local tool = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
	if tool then
		tool:SetAttribute("AimFieldOfView", aimFovValue)
	end
end)

-- OrionLib Slider für AimFOV
GunModTab:AddSlider({
	Name = "Aim FOV",
	Min = 30,
	Max = 120,
	Color = Color3.fromRGB(255, 255, 255),
	Default = aimFovValue,
	Increment = 1,
	Save = false,
	Flag = "AimFOVSlider",
	Callback = function(value)
		aimFovValue = value
	end
})

local Section = GunModTab:AddSection({
	Name = "Customize weapon color"
})


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
-- Konfiguration
local ghostColor = Color3.fromRGB(0, 170, 255)
local rainbowEnabled = false
local enabled = false
local savedColors = {}
local targetParts = {"Body", "MeshPart", "Base1", "BrigherBlack", "BaseTop"}
local targetTools = {"Glock 17", "MP5", "M58B Shotgun", "M4 Carbine", "G36", "Sniper"}

-- Regenbogen-Funktion
local function HSVToRGB(hue)
	return Color3.fromHSV(hue % 1, 1, 1)
end

-- Prüft ob ein Tool zu den gesuchten Tools gehört
local function isTargetTool(toolName)
	for _, name in ipairs(targetTools) do
		if toolName:lower():find(name:lower()) then
			return true
		end
	end
	return false
end

-- Findet alle gesuchten Tools
local function findTargetTools(character)
	local tools = {}

	if not character then return tools end

	-- Prüfe im Charakter
	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Tool") and isTargetTool(child.Name) then
			table.insert(tools, child)
		end
	end

	-- Prüfe im Backpack
	local backpack = LocalPlayer:FindFirstChild("Backpack")
	if backpack then
		for _, tool in pairs(backpack:GetChildren()) do
			if tool:IsA("Tool") and isTargetTool(tool.Name) then
				table.insert(tools, tool)
			end
		end
	end

	return tools
end

-- Findet alle gesuchten Parts in einem Tool
local function findTargetParts(tool)
	local parts = {}

	for _, partName in ipairs(targetParts) do
		local part = tool:FindFirstChild(partName)
		if part and part:IsA("BasePart") then
			table.insert(parts, part)
		end
	end

	-- Alternative Suche nach Parts, die die Namen enthalten
	for _, descendant in pairs(tool:GetDescendants()) do
		if descendant:IsA("BasePart") then
			for _, partName in ipairs(targetParts) do
				if descendant.Name:lower():find(partName:lower()) then
					table.insert(parts, descendant)
					break
				end
			end
		end
	end

	return parts
end

-- Farbe auf die Parts anwenden
local function applyColorToParts(parts, color)
	for _, part in ipairs(parts) do
		if not savedColors[part] then
			savedColors[part] = {
				Color = part.Color,
				Material = part.Material
			}
		end

		part.Color = color
		part.Material = Enum.Material.ForceField
	end
end

-- Original-Farbe wiederherstellen
local function restoreOriginalColor(parts)
	for _, part in ipairs(parts) do
		if savedColors[part] then
			part.Color = savedColors[part].Color
			part.Material = savedColors[part].Material
			savedColors[part] = nil
		end
	end
end

-- Prüft alle Tools und wendet Farbe an
local function checkAndApplyColor(color)
	if not enabled then return end

	local character = LocalPlayer.Character
	if not character then return end

	local tools = findTargetTools(character)
	for _, tool in ipairs(tools) do
		local parts = findTargetParts(tool)
		applyColorToParts(parts, color)
	end
end

-- Prüft alle Tools und stellt Originalfarbe wieder her
local function checkAndRestoreColor()
	local character = LocalPlayer.Character
	if not character then return end

	local tools = findTargetTools(character)
	for _, tool in ipairs(tools) do
		local parts = findTargetParts(tool)
		restoreOriginalColor(parts)
	end
end

-- Regenbogen-Effekt
local hue = 0
local rainbowConnection

local function startRainbow()
	if rainbowConnection then
		rainbowConnection:Disconnect()
	end

	rainbowEnabled = true
	rainbowConnection = RunService.Heartbeat:Connect(function(deltaTime)
		if not enabled then return end

		hue = (hue + deltaTime / 2) % 1
		checkAndApplyColor(HSVToRGB(hue))
	end)
end

local function stopRainbow()
	if rainbowConnection then
		rainbowConnection:Disconnect()
		rainbowConnection = nil
	end
	rainbowEnabled = false
end

-- Kontinuierliche Überprüfung
local checkConnection
local function startContinuousCheck()
	if checkConnection then
		checkConnection:Disconnect()
	end

	checkConnection = RunService.Heartbeat:Connect(function()
		if not enabled then return end

		if rainbowEnabled then
			-- Für Regenbogen wird die Farbe bereits gesetzt
			return
		else
			-- Für statische Farbe prüfen wir kontinuierlich
			checkAndApplyColor(ghostColor)
		end
	end)
end

-- Hauptfunktion zum Aktivieren/Deaktivieren
local function toggleWeaponColors(state)
	enabled = state

	if enabled then
		if rainbowEnabled then
			startRainbow()
		else
			startContinuousCheck()
			checkAndApplyColor(ghostColor)
		end
	else
		if rainbowConnection then
			stopRainbow()
		end
		if checkConnection then
			checkConnection:Disconnect()
			checkConnection = nil
		end
		checkAndRestoreColor()
	end
end

-- Toggle für Weapon Colors
GunModTab:AddToggle({
	Name = "Weapon Color",
	Default = false,
	Save = true,
	Flag = "WeaponColors11",
	Callback = function(Value)
		toggleWeaponColors(Value)
	end
})

-- ColorPicker für die Farbe
GunModTab:AddColorpicker({
	Name = "Weapons Color Picker",
	Default = ghostColor,
	Save = true,
	Flag = "WeaponsColorPicker11",
	Callback = function(Value)
		ghostColor = Value
		if enabled and not rainbowEnabled then
			checkAndApplyColor(ghostColor)
		end
	end
})

-- Toggle für Rainbow Mode
GunModTab:AddToggle({
	Name = "Rainbow Mode",
	Default = false,
	Save = true,
	Flag = "WeaponColorRainbowMode11",
	Callback = function(Value)
		rainbowEnabled = Value

		if enabled then
			if rainbowEnabled then
				startRainbow()
			else
				stopRainbow()
				startContinuousCheck()
				checkAndApplyColor(ghostColor)
			end
		end
	end
})

-- Automatische Anwendung, wenn der Charakter geladen wird
local function onCharacterAdded(character)
	if enabled then
		-- Warte kurz bis der Charakter vollständig geladen ist
		wait(1)

		if rainbowEnabled then
			startRainbow()
		else
			startContinuousCheck()
			checkAndApplyColor(ghostColor)
		end
	end

	-- Überwache neue Tools
	character.ChildAdded:Connect(function(child)
		if child:IsA("Tool") and isTargetTool(child.Name) and enabled then
			if rainbowEnabled then
				-- Rainbow wird automatisch angewendet
			else
				checkAndApplyColor(ghostColor)
			end
		end
	end)
end

-- Initialisierung
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then
	onCharacterAdded(LocalPlayer.Character)
end

local Section = GunModTab:AddSection({
	Name = "Customize secondary weapon color"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
-- Konfiguration
local ghostColor = Color3.fromRGB(0, 170, 255)
local rainbowEnabled = false
local enabled = false
local savedColors = {}
local targetParts2 = {"Scope", "Stock", "Base2", "DarkerBlack", "BaseDown"}
local targetTools2 = {"Glock 17", "MP5", "M58B Shotgun", "M4 Carbine", "G36", "Sniper"}

-- Regenbogen-Funktion
local function HSVToRGB(hue)
	return Color3.fromHSV(hue % 1, 1, 1)
end

-- Prüft ob ein Tool zu den gesuchten Tools gehört
local function isTargetTool2(toolName)
	for _, name in ipairs(targetTools2) do
		if toolName:lower():find(name:lower()) then
			return true
		end
	end
	return false
end

-- Findet alle gesuchten Tools
local function findTargetTools2(character)
	local tools = {}

	if not character then return tools end

	-- Prüfe im Charakter
	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Tool") and isTargetTool2(child.Name) then
			table.insert(tools, child)
		end
	end

	-- Prüfe im Backpack
	local backpack = LocalPlayer:FindFirstChild("Backpack")
	if backpack then
		for _, tool in pairs(backpack:GetChildren()) do
			if tool:IsA("Tool") and isTargetTool2(tool.Name) then
				table.insert(tools, tool)
			end
		end
	end

	return tools
end

-- Findet alle gesuchten Parts in einem Tool
local function findTargetParts2(tool)
	local parts = {}

	for _, partName in ipairs(targetParts2) do
		local part = tool:FindFirstChild(partName)
		if part and part:IsA("BasePart") then
			table.insert(parts, part)
		end
	end

	-- Alternative Suche nach Parts, die die Namen enthalten
	for _, descendant in pairs(tool:GetDescendants()) do
		if descendant:IsA("BasePart") then
			for _, partName in ipairs(targetParts2) do
				if descendant.Name:lower():find(partName:lower()) then
					table.insert(parts, descendant)
					break
				end
			end
		end
	end

	return parts
end

-- Farbe auf die Parts anwenden
local function applyColorToParts(parts, color)
	for _, part in ipairs(parts) do
		if not savedColors[part] then
			savedColors[part] = {
				Color = part.Color,
				Material = part.Material
			}
		end

		part.Color = color
		part.Material = Enum.Material.ForceField
	end
end

-- Original-Farbe wiederherstellen
local function restoreOriginalColor(parts)
	for _, part in ipairs(parts) do
		if savedColors[part] then
			part.Color = savedColors[part].Color
			part.Material = savedColors[part].Material
			savedColors[part] = nil
		end
	end
end

-- Prüft alle Tools und wendet Farbe an
local function checkAndApplyColor(color)
	if not enabled then return end

	local character = LocalPlayer.Character
	if not character then return end

	local tools = findTargetTools2(character)
	for _, tool in ipairs(tools) do
		local parts = findTargetParts2(tool)
		applyColorToParts(parts, color)
	end
end

-- Prüft alle Tools und stellt Originalfarbe wieder her
local function checkAndRestoreColor()
	local character = LocalPlayer.Character
	if not character then return end

	local tools = findTargetTools2(character)
	for _, tool in ipairs(tools) do
		local parts = findTargetParts2(tool)
		restoreOriginalColor(parts)
	end
end

-- Regenbogen-Effekt
local hue = 0
local rainbowConnection

local function startRainbow()
	if rainbowConnection then
		rainbowConnection:Disconnect()
	end

	rainbowEnabled = true
	rainbowConnection = RunService.Heartbeat:Connect(function(deltaTime)
		if not enabled then return end

		hue = (hue + deltaTime / 2) % 1
		checkAndApplyColor(HSVToRGB(hue))
	end)
end

local function stopRainbow()
	if rainbowConnection then
		rainbowConnection:Disconnect()
		rainbowConnection = nil
	end
	rainbowEnabled = false
end

-- Kontinuierliche Überprüfung
local checkConnection
local function startContinuousCheck()
	if checkConnection then
		checkConnection:Disconnect()
	end

	checkConnection = RunService.Heartbeat:Connect(function()
		if not enabled then return end

		if rainbowEnabled then
			-- Für Regenbogen wird die Farbe bereits gesetzt
			return
		else
			-- Für statische Farbe prüfen wir kontinuierlich
			checkAndApplyColor(ghostColor)
		end
	end)
end

-- Hauptfunktion zum Aktivieren/Deaktivieren
local function toggleWeaponColors(state)
	enabled = state

	if enabled then
		if rainbowEnabled then
			startRainbow()
		else
			startContinuousCheck()
			checkAndApplyColor(ghostColor)
		end
	else
		if rainbowConnection then
			stopRainbow()
		end
		if checkConnection then
			checkConnection:Disconnect()
			checkConnection = nil
		end
		checkAndRestoreColor()
	end
end

-- Toggle für Weapon Colors
GunModTab:AddToggle({
	Name = "Secondary Color",
	Default = false,
	Save = true,
	Flag = "WeaponColors2",
	Callback = function(Value)
		toggleWeaponColors(Value)
	end
})

-- ColorPicker für die Farbe
GunModTab:AddColorpicker({
	Name = "Secondary Color Picker",
	Default = ghostColor,
	Save = true,
	Flag = "WeaponsColorPicker2",
	Callback = function(Value)
		ghostColor = Value
		if enabled and not rainbowEnabled then
			checkAndApplyColor(ghostColor)
		end
	end
})

-- Toggle für Rainbow Mode
GunModTab:AddToggle({
	Name = "Rainbow Mode",
	Default = false,
	Save = true,
	Flag = "WeaponColorRainbowMode2",
	Callback = function(Value)
		rainbowEnabled = Value

		if enabled then
			if rainbowEnabled then
				startRainbow()
			else
				stopRainbow()
				startContinuousCheck()
				checkAndApplyColor(ghostColor)
			end
		end
	end
})

-- Automatische Anwendung, wenn der Charakter geladen wird
local function onCharacterAdded(character)
	if enabled then
		-- Warte kurz bis der Charakster vollständig geladen ist
		wait(1)

		if rainbowEnabled then
			startRainbow()
		else
			startContinuousCheck()
			checkAndApplyColor(ghostColor)
		end
	end

	-- Überwache neue Tools
	character.ChildAdded:Connect(function(child)
		if child:IsA("Tool") and isTargetTool2(child.Name) and enabled then
			if rainbowEnabled then
				-- Rainbow wird automatisch angewendet
			else
				checkAndApplyColor(ghostColor)
			end
		end
	end)
end

-- Initialisierung
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then
	onCharacterAdded(LocalPlayer.Character)
end

--CarMod   

CarModTab:AddButton({
	Name = "Mobile Car Fly",
	Callback = function()
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local player = Players.LocalPlayer

		local flightEnabled = false
		local kmhToSpeed = 7.77
		local flightSpeed = 150 * kmhToSpeed
		local moveUp, moveDown, moveLeft, moveRight = false, false, false, false

		local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
		local frame = Instance.new("Frame", screenGui)
		frame.Size = UDim2.new(0, 150, 0, 180)
		frame.Position = UDim2.new(0.5, -75, 0.5, -90)
		frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		frame.BackgroundTransparency = 0.3
		frame.Active = true
		frame.Draggable = true
		frame.AnchorPoint = Vector2.new(0.5, 0.5)

		local toggle = Instance.new("TextButton", frame)
		toggle.Size = UDim2.new(1, -20, 0, 35)
		toggle.Position = UDim2.new(0, 10, 0, 10)
		toggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
		toggle.Text = "Car Fly OFF"
		toggle.TextColor3 = Color3.new(1,1,1)
		toggle.Font = Enum.Font.SourceSansBold
		toggle.TextSize = 18
		toggle.AutoButtonColor = false
		toggle.MouseButton1Click:Connect(function()
			flightEnabled = not flightEnabled
			toggle.Text = flightEnabled and "Car Fly ON" or "Car Fly OFF"
			toggle.BackgroundColor3 = flightEnabled and Color3.fromRGB(0,180,0) or Color3.fromRGB(180,0,0)
		end)

		local function createArrow(text, pos)
			local btn = Instance.new("TextButton", frame)
			btn.Size = UDim2.new(0, 40, 0, 40)
			btn.Position = pos
			btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			btn.TextColor3 = Color3.new(1,1,1)
			btn.Font = Enum.Font.SourceSansBold
			btn.TextSize = 28
			btn.Text = text
			btn.AutoButtonColor = false
			return btn
		end

		local btnUp = createArrow("↑", UDim2.new(0.5, -20, 0, 55))
		local btnDown = createArrow("↓", UDim2.new(0.5, -20, 0, 110))
		local btnLeft = createArrow("←", UDim2.new(0.22, -20, 0, 82))
		local btnRight = createArrow("→", UDim2.new(0.78, -20, 0, 82))

		btnUp.MouseButton1Down:Connect(function() moveUp = true end)
		btnUp.MouseButton1Up:Connect(function() moveUp = false end)
		btnUp.MouseLeave:Connect(function() moveUp = false end)

		btnDown.MouseButton1Down:Connect(function() moveDown = true end)
		btnDown.MouseButton1Up:Connect(function() moveDown = false end)
		btnDown.MouseLeave:Connect(function() moveDown = false end)

		btnLeft.MouseButton1Down:Connect(function() moveLeft = true end)
		btnLeft.MouseButton1Up:Connect(function() moveLeft = false end)
		btnLeft.MouseLeave:Connect(function() moveLeft = false end)

		btnRight.MouseButton1Down:Connect(function() moveRight = true end)
		btnRight.MouseButton1Up:Connect(function() moveRight = false end)
		btnRight.MouseLeave:Connect(function() moveRight = false end)

		local lastPosition, lastLookVector = nil, nil

		RunService.RenderStepped:Connect(function()
			if not flightEnabled then
				lastPosition, lastLookVector = nil, nil
				return
			end

			local character = player.Character
			if not character then return end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoid or not humanoid.SeatPart or humanoid.SeatPart.Name ~= "DriveSeat" then return end
			local vehicle = humanoid.SeatPart.Parent
			if not vehicle.PrimaryPart then vehicle.PrimaryPart = humanoid.SeatPart end

			local lookVector = workspace.CurrentCamera.CFrame.LookVector
			local rightVector = lookVector:Cross(Vector3.new(0,1,0)).Unit

			if not lastPosition then lastPosition = vehicle.PrimaryPart.Position end
			if not lastLookVector then lastLookVector = lookVector end

			local moveY = 0
			local moveX = 0
			if moveUp then moveY = 1 elseif moveDown then moveY = -1 end
			if moveRight then moveX = 1 elseif moveLeft then moveX = -1 end

			local speedMultiplier = flightSpeed / 100
			local targetPos = vehicle.PrimaryPart.Position + lookVector * moveY * speedMultiplier + rightVector * moveX * speedMultiplier
			local newPos = lastPosition:Lerp(targetPos, 0.3)
			local smoothLook = lastLookVector:Lerp(lookVector, 0.2)

			if moveX ~= 0 or moveY ~= 0 then
				vehicle:SetPrimaryPartCFrame(CFrame.new(newPos, newPos + smoothLook))
			else
				vehicle:SetPrimaryPartCFrame(CFrame.new(vehicle.PrimaryPart.Position, vehicle.PrimaryPart.Position + smoothLook))
			end

			lastPosition = newPos
			lastLookVector = smoothLook

			for _, part in pairs(vehicle:GetDescendants()) do
				if part:IsA("BasePart") then
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
					part.Velocity = Vector3.zero
					part.RotVelocity = Vector3.zero
				end
			end
		end)
	end
})

-- anfang fly undetected

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local vehicles = workspace:WaitForChild("Vehicles")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Variables
local flightEnabled = false
local safeFlyEnabled = true
local kmhToSpeed = 7.77
local flightSpeed = 150 * kmhToSpeed
local POSITION_LERP_ALPHA = 0.3
local ROTATION_LERP_ALPHA = 0.2
local lastPosition = nil
local lastLookVector = nil
local straightFlightStartTime = nil
local STRAIGHT_FLIGHT_DURATION = 1
local hasShiftedRight = false
local SHIFT_DISTANCE = 10

-- Vehicle Fling Vars
local vehicleFlingEnabled = false
local flingActive = false
local flingStartTime = 0 -- NEU: Zeitpunkt wenn Fling aktiviert wurde
local FLING_DELAY = 0.6 -- NEU: 0.5 Sekunden Verzögerung

-- NEU: Variablen für einmaliges Aussteigen
local hasPerformedSingleExit = false
local singleExitCompleted = false

-- OPTIMIERT: Auto re-enter function
local function enterVehicle()
	if not safeFlyEnabled or not flightEnabled then return false end

	local vehicle = vehicles:FindFirstChild(player.Name)
	if vehicle and char:FindFirstChild("Humanoid") then
		local seat = vehicle:FindFirstChild("DriveSeat")
		if seat then
			seat:Sit(char.Humanoid)
			return true
		end
	end
	return false
end

-- NEU: Einmaliges Aussteigen nach 5 Sekunden
local function performSingleExit()
	if singleExitCompleted or not safeFlyEnabled or not flightEnabled or vehicleFlingEnabled then
		return
	end

	local hum = char and char:FindFirstChild("Humanoid")
	if hum and hum.SeatPart and hum.SeatPart.Name == "DriveSeat" then
		hasPerformedSingleExit = true

		-- Aussteigen
		hum.Sit = false
		hum:ChangeState(Enum.HumanoidStateType.Jumping)

		-- Nach kurzer Zeit wieder einsteigen
		task.delay(0.5, function()
			if safeFlyEnabled and flightEnabled and not vehicleFlingEnabled then
				enterVehicle()
				singleExitCompleted = true
			end
		end)
	end
end

-- NEU: Überarbeitete SafeFly Funktion für kontinuierliches Reinsetzen (OHNE wiederholtes Aussteigen)
local safeFlyConnection
local lastForceEnterTime = 0
local FORCE_ENTER_COOLDOWN = 0.5 -- Alle 0.5 Sekunden prüfen
local singleExitTimerStarted = false

local function startSafeFly()
	if safeFlyConnection then return end

	singleExitCompleted = false
	hasPerformedSingleExit = false
	singleExitTimerStarted = false

	safeFlyConnection = RunService.Heartbeat:Connect(function()
		if safeFlyEnabled and flightEnabled and not vehicleFlingEnabled then
			local hum = char and char:FindFirstChild("Humanoid")
			local currentTime = tick()

			if hum then
				-- Einmaliges Aussteigen nach 5 Sekunden starten
				if not singleExitTimerStarted and not hasPerformedSingleExit then
					singleExitTimerStarted = true
					task.delay(3, performSingleExit)
				end

				-- Prüfen ob Spieler nicht im Sitz ist (nur reinsetzen, nicht aussteigen)
				if not hum.SeatPart or hum.SeatPart.Name ~= "DriveSeat" then
					-- Cooldown für Force Enter
					if (currentTime - lastForceEnterTime) > FORCE_ENTER_COOLDOWN then
						lastForceEnterTime = currentTime

						-- Versuche ins Fahrzeug zu kommen
						local success = enterVehicle()

						-- Falls nicht erfolgreich, warte kurz und versuche es erneut
						if not success then
							task.wait(0.1)
							enterVehicle()
						end
					end
				end
				-- KEIN wiederholtes Aussteigen mehr - nur das einmalige nach 5 Sekunden
			end
		end
	end)
end

local function stopSafeFly()
	if safeFlyConnection then
		safeFlyConnection:Disconnect()
		safeFlyConnection = nil
	end
	-- Reset der Einmal-Aussteigen Variablen
	hasPerformedSingleExit = false
	singleExitCompleted = false
	singleExitTimerStarted = false
end

-- Fly Toggle Management
local function updateFlightState()
	if flightEnabled then
		startSafeFly()
	else
		stopSafeFly()
	end
end

function turncaroff()
	local vehiclesFolder = workspace:FindFirstChild("Vehicles")
	if vehiclesFolder then
		local playerVehicle = vehiclesFolder:FindFirstChild(player.Name)
		if playerVehicle and playerVehicle:IsA("Model") then
			playerVehicle:SetAttribute("IsOn", false)

			-- Optional: Auch die tatsächliche Health des Vehicles setzen, falls vorhanden
			local humanoid = playerVehicle:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.MaxHealth = 500
				humanoid.Health = 500
			end
		end
	end
end

-- Fling Physik (Nur wenn aktiv und im Fahrzeug) MIT VERZÖGERUNG
RunService.Heartbeat:Connect(function()
	if vehicleFlingEnabled then
		local player = game.Players.LocalPlayer
		local c = player.Character
		if c then
			local h = c:FindFirstChildOfClass("Humanoid")
			if h and h.SeatPart and h:GetState() == Enum.HumanoidStateType.Seated then
				flingActive = true

				-- NEU: Prüfe ob 0.5 Sekunden vergangen sind seit Fling aktiviert wurde
				local currentTime = tick()
				if (currentTime - flingStartTime) >= FLING_DELAY then
					local hrp = c:FindFirstChild("HumanoidRootPart")
					if hrp then
						for _, part in pairs(hrp:GetTouchingParts()) do
							if part:IsA("BasePart") and part:IsDescendantOf(workspace) and not part:IsDescendantOf(player) then
								hrp.AssemblyLinearVelocity = -(part.Position - hrp.Position).Unit * 9999999
								turncaroff()
								break
							end
						end
					end
				end
			else
				flingActive = false
			end
		else
			flingActive = false
		end
	else
		flingActive = false
	end
end)

-- NEU: Verbesserte Auto-Reinsetzen Funktion mit Teleport (funktioniert bei beiden Modi)
local autoEnterConnection
local function startAutoEnter()
	if autoEnterConnection then return end

	autoEnterConnection = RunService.Heartbeat:Connect(function()
		if safeFlyEnabled and flightEnabled then
			local player = game.Players.LocalPlayer
			local c = player.Character  
			if not c then return end

			local h = c:FindFirstChildOfClass("Humanoid")
			if not h then return end

			-- Prüfen ob Spieler nicht im richtigen Sitz sitzt
			if not h.SeatPart or h.SeatPart.Name ~= "DriveSeat" then
				flingActive = false

				-- Fahrzeug des Spielers finden
				local vehicle = workspace:FindFirstChild("Vehicles") and workspace.Vehicles:FindFirstChild(player.Name)
				if not vehicle then
					for _, m in ipairs(workspace:GetDescendants()) do
						if m:IsA("Model") and m.Name:lower():find(player.Name:lower()) then
							vehicle = m
							break
						end
					end
				end

				-- In Fahrzeug setzen mit Teleport
				if vehicle then
					local seat = vehicle:FindFirstChild("DriveSeat") or vehicle:FindFirstChildWhichIsA("VehicleSeat")
					if seat then
						-- Charakter zum Sitz teleportieren
						local hrp = c:FindFirstChild("HumanoidRootPart")
						if hrp then
							hrp.CFrame = seat.CFrame + Vector3.new(0, 3, 0)
						end

						-- In Sitz setzen
						h.Sit = false
						task.wait(0.0)
						seat:Sit(h)

						-- Zusätzlicher Versuch falls nicht erfolgreich
						task.wait(0.0)
						if not h.SeatPart then
							seat:Sit(h)
						end
					end
				end
			else
				flingActive = true
			end
		end
	end)
end

local function stopAutoEnter()
	if autoEnterConnection then
		autoEnterConnection:Disconnect()
		autoEnterConnection = nil
	end
end

-- Car Fly Logic (No more ground teleport)
RunService.RenderStepped:Connect(function(deltaTime)
	local character = player.Character
	if vehicleFlingEnabled then flightEnabled = true end

	if flightEnabled and character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.SeatPart and humanoid.SeatPart.Name == "DriveSeat" then
			local seat = humanoid.SeatPart
			local vehicle = seat.Parent
			if not vehicle.PrimaryPart then vehicle.PrimaryPart = seat end
			local lookVector = workspace.CurrentCamera.CFrame.LookVector
			if not lastPosition then lastPosition = vehicle.PrimaryPart.Position end
			if not lastLookVector then lastLookVector = lookVector end

			local moveY = 0
			local moveZ = 0
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveZ = 1
			elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then moveZ = -1 end
			if UserInputService:IsKeyDown(Enum.KeyCode.E) then moveY = 1
			elseif UserInputService:IsKeyDown(Enum.KeyCode.Q) then moveY = -1 end

			local isFlyingStraight = UserInputService:IsKeyDown(Enum.KeyCode.W)
				and not UserInputService:IsKeyDown(Enum.KeyCode.S)
				and not UserInputService:IsKeyDown(Enum.KeyCode.E)
				and not UserInputService:IsKeyDown(Enum.KeyCode.Q)
				and not UserInputService:IsKeyDown(Enum.KeyCode.A)
				and not UserInputService:IsKeyDown(Enum.KeyCode.D)

			local currentTime = tick()
			if isFlyingStraight then
				if not straightFlightStartTime then straightFlightStartTime = currentTime end
				if not hasShiftedRight and (currentTime - straightFlightStartTime) >= STRAIGHT_FLIGHT_DURATION then
					local rightVector = lookVector:Cross(Vector3.new(0, 1, 0)).Unit
					local shiftPosition = vehicle.PrimaryPart.Position + (rightVector * SHIFT_DISTANCE)
					local shiftCFrame = CFrame.new(shiftPosition, shiftPosition + lookVector)
					vehicle:SetPrimaryPartCFrame(shiftCFrame)
					lastPosition = shiftPosition
					hasShiftedRight = true
				end
			else
				straightFlightStartTime = nil
				hasShiftedRight = false
			end

			local speedMultiplier = flightSpeed / 100
			local targetPosition = vehicle.PrimaryPart.Position + (lookVector * moveZ * speedMultiplier) + (Vector3.new(0, 1, 0) * moveY * speedMultiplier)
			local newPosition = lastPosition:Lerp(targetPosition, POSITION_LERP_ALPHA)
			local smoothLookVector = lastLookVector:Lerp(lookVector, ROTATION_LERP_ALPHA)

			if moveZ ~= 0 or moveY ~= 0 then
				local targetCFrame = CFrame.new(newPosition, newPosition + smoothLookVector)
				vehicle:SetPrimaryPartCFrame(targetCFrame)
			else
				local targetCFrame = CFrame.new(vehicle.PrimaryPart.Position, vehicle.PrimaryPart.Position + smoothLookVector)
				vehicle:SetPrimaryPartCFrame(targetCFrame)
			end

			lastPosition = newPosition
			lastLookVector = smoothLookVector

			for _, part in pairs(vehicle:GetDescendants()) do
				if part:IsA("BasePart") then
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
					part.Velocity = Vector3.zero
					part.RotVelocity = Vector3.zero
				end
			end
		else
			lastPosition = nil
			lastLookVector = nil
			straightFlightStartTime = nil
			hasShiftedRight = false
		end
	else
		lastPosition = nil
		lastLookVector = nil
		straightFlightStartTime = nil
		hasShiftedRight = false
	end
end)

-- UI Controls
CarModTab:AddToggle({
	Name = "Car Fly",
	Default = false,
	Callback = function(Value)
		if vehicleFlingEnabled then
			flightEnabled = true
		else
			flightEnabled = Value
		end
		updateFlightState()
		if flightEnabled then
			startAutoEnter()
		else
			stopAutoEnter()
		end
	end
})

CarModTab:AddToggle({
	Name = "Safe Fly",
	Default = true,
	Callback = function(Value)
		safeFlyEnabled = Value
		updateFlightState()
		if safeFlyEnabled and flightEnabled then
			startAutoEnter()
		else
			stopAutoEnter()
		end
	end
})

CarModTab:AddToggle({
	Name = "Vehicle Fling",
	Default = false,
	Callback = function(value)
		vehicleFlingEnabled = value
		if value then
			flightEnabled = true
			flingStartTime = tick() -- NEU: Startzeit speichern wenn Fling aktiviert wird
			updateFlightState()
			startAutoEnter()
		else
			stopAutoEnter()
		end
	end
})

CarModTab:AddBind({
	Name = "Car Fly Keybind",
	Default = Enum.KeyCode.X,
	Save = true,
	Flag = "CarFlyKeybind",
	Hold = false,
	Callback = function()
		-- Wenn Vehicle Fling aktiv ist, kann Car Fly nicht deaktiviert werden
		if not vehicleFlingEnabled then
			flightEnabled = not flightEnabled
			updateFlightState()
			if flightEnabled then
				startAutoEnter()
			else
				stopAutoEnter()
			end
		end
	end
})

CarModTab:AddSlider({
	Name = "Car Fly Speed",
	Min = 10,
	Max = 190,
	Default = 130,
	Save = true,
	Flag = "CarFlySpeed",
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(kmhValue)
		flightSpeed = kmhValue * kmhToSpeed
	end
})

-- Character Management
player.CharacterAdded:Connect(function(character)
	char = character
	hrp = character:WaitForChild("HumanoidRootPart")

	-- Reset states
	flightEnabled = false
	flingActive = false
	lastPosition = nil
	lastLookVector = nil
	hasPerformedSingleExit = false
	singleExitCompleted = false
	singleExitTimerStarted = false

	-- Safe Fly neu starten falls aktiv
	task.wait(1) -- Warten bis Character vollständig geladen ist
	updateFlightState()
	stopAutoEnter()

	if safeFlyEnabled and flightEnabled then
		startAutoEnter()
	end
end)

-- ende fly


local Section = CarModTab:AddSection({
	Name = "Mods"
})

CarModTab:AddButton({
	Name = "Enter in own Car",
	Callback = function()
		local function ensurePlayerInVehicle()
			local vehicle = workspace.Vehicles:FindFirstChild(player.Name)  
			if vehicle then
				local humanoid = player.Character:FindFirstChild("Humanoid")
				if humanoid and not humanoid.SeatPart then 
					local driveSeat = vehicle:FindFirstChild("DriveSeat")
					if driveSeat then
						driveSeat:Sit(humanoid)
					end
				end
			end
		end
		ensurePlayerInVehicle()
	end
})

CarModTab:AddButton({
	Name = "Bring own Car",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local root = character:WaitForChild("HumanoidRootPart")
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		local vehicle = nil

		local vehiclesFolder = workspace:FindFirstChild("Vehicles")
		if vehiclesFolder then
			vehicle = vehiclesFolder:FindFirstChild(player.Name)
		end

		if not vehicle then
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v.Name:lower():find(player.Name:lower()) then
					vehicle = v
					break
				end
			end
		end

		if vehicle and vehicle:IsA("Model") then
			local seat = vehicle:FindFirstChild("DriveSeat") or vehicle:FindFirstChildWhichIsA("VehicleSeat")
			if seat then
				if not vehicle.PrimaryPart then
					vehicle.PrimaryPart = seat
				end

				vehicle:SetPrimaryPartCFrame(root.CFrame * CFrame.new(0, 3, -8))

				task.wait(0.2)

				if humanoid and not humanoid.SeatPart then
					seat:Sit(humanoid)
				end
			else
			end
		else
		end
	end
})

local Section = CarModTab:AddSection({
	Name = "Special Mods"
})

CarModTab:AddToggle({
	Name = "Infinite Fuel",
	Default = false,
	Save = false,
	Flag = "InfiniteFuel",
	Callback = function(Value)
		fuelToggle = Value
		task.spawn(function()
			while task.wait() do
				if fuelToggle then
					local vehiclesFolder = workspace:FindFirstChild("Vehicles")
					if vehiclesFolder then
						local playerVehicle = vehiclesFolder:FindFirstChild(player.Name)
						if playerVehicle and playerVehicle:IsA("Model") then
							playerVehicle:SetAttribute("currentFuel", math.huge)
						end
					end
				end
			end
		end)
	end
})

local VehicleGodmodeEnabled = false
local VehicleGodmodeConnection

CarModTab:AddToggle({
	Name = "Vehicle Godmode",
	Default = false,
	Callback = function(Value)
		VehicleGodmodeEnabled = Value

		if Value then
			-- Starte die periodische Überprüfung
			VehicleGodmodeConnection = game:GetService("RunService").Heartbeat:Connect(function()
				applyVehicleGodmode()
			end)

			-- Sofort anwenden beim Aktivieren
			applyVehicleGodmode()
		else
			-- Stoppe die periodische Überprüfung
			if VehicleGodmodeConnection then
				VehicleGodmodeConnection:Disconnect()
				VehicleGodmodeConnection = nil
			end
		end
	end
})

-- Funktion zum Anwenden des Godmodes
function applyVehicleGodmode()
	if not VehicleGodmodeEnabled then return end

	local vehiclesFolder = workspace:FindFirstChild("Vehicles")
	if vehiclesFolder then
		local playerVehicle = vehiclesFolder:FindFirstChild(player.Name)
		if playerVehicle and playerVehicle:IsA("Model") then
			playerVehicle:SetAttribute("IsOn", true)
			playerVehicle:SetAttribute("currentHealth", 1000)

			-- Optional: Auch die tatsächliche Health des Vehicles setzen, falls vorhanden
			local humanoid = playerVehicle:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.MaxHealth = 1000
				humanoid.Health = 1000
			end
		end
	end
end

-- Timer für alle 2 Sekunden (alternativ zu Heartbeat)
spawn(function()
	while true do
		if VehicleGodmodeEnabled then
			applyVehicleGodmode()
		end
		wait(2) -- Warte 2 Sekunden
	end
end)

CarModTab:AddTextbox({
	Name = "Numberplate Text",
	Default = "Vortex",
	TextDisappear = true,
	Callback = function(txt)
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		for _, part in ipairs(workspace:GetDescendants()) do
			if part:IsA("SurfaceGui") and part.Parent:IsA("BasePart") then
				local dist = root and (part.Parent.Position - root.Position).Magnitude
				if dist and dist < 15 then
					local label = part:FindFirstChildWhichIsA("TextLabel")
					if label then label.Text = txt end
				end
			end
		end
	end
})

------------------------- vehicle sounds

local soundOptions = {
	"Default",
	"v10", 
	"v8",
	"Evomr",
	"7 ExhL"
}

local soundIds = {
	["v10"] = "rbxassetid://92387486484055",
	["v8"] = "rbxassetid://91912342333180", 
	["Evomr"] = "rbxassetid://72327468507163",
	["7 ExhL"] = "rbxassetid://75247492673971"
}

local originalSounds = {}
local soundObjects = {}

local function initializeSounds1()
	for _, sound in pairs(game:GetDescendants()) do
		if sound:IsA("Sound") then
			local currentId = sound.SoundId
			if currentId == "rbxassetid://358130654" or currentId == "rbxassetid://358130655" then
				originalSounds[sound] = currentId
				soundObjects[sound] = true
			end
		end
	end
end

local function changeSounds1(selectedSound)
	local newSoundId = soundIds[selectedSound]

	for sound, originalId in pairs(originalSounds) do
		if sound and sound.Parent then
			if selectedSound == "Default" then
				-- Zurück zur Original-ID
				sound.SoundId = originalId
			else
				-- Neuen Sound setzen
				sound.SoundId = newSoundId
			end
		end
	end
end

initializeSounds1()

CarModTab:AddDropdown({
	Name = "Vehicle Sound",
	Default = "Default",
	Save = true,
	Flag = "VehicleSound",
	Options = soundOptions,
	Callback = function(selectedSound)
		changeSounds1(selectedSound)
	end    
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VehiclesFolder = workspace:WaitForChild("Vehicles") 

local function getCurrentSpringLength()
	local vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
	if not vehicle then return nil end  -- nil statt 1.5 zurückgeben

	local driveSeat = vehicle:FindFirstChild("DriveSeat", true)
	if not driveSeat then return nil end

	local spring = driveSeat:FindFirstChildWhichIsA("SpringConstraint")
	if not spring then return nil end

	return spring.CurrentLength
end

local sliderMoved = false

CarModTab:AddSlider({ 
	Name = "Vehicle Height",
	Min = 0.5,
	Max = 13,
	Default = 1.5,  -- Standardwert, aber wird nicht automatisch angewendet
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.1,
	ValueName = "",
	Callback = function(Value)
		-- Nur ausführen, wenn der Slider bereits bewegt wurde
		if not sliderMoved then
			sliderMoved = true
			return
		end

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

local player = game.Players.LocalPlayer
local playerName = player.Name

local function GetMyVehicle()
	local vehiclesFolder = workspace:FindFirstChild("Vehicles")
	if not vehiclesFolder then return nil end

	for _, model in pairs(vehiclesFolder:GetChildren()) do
		if model:IsA("Model") and model.Name == playerName then
			return model
		end
	end
	return nil
end

local HealthLevels = {
	[1] = 500,
	[2] = 1e10,
	[3] = 1e15,
	[4] = 1e30,
	[5] = 1e35,
	[6] = 1e40,
	[7] = 1e45,
	[8] = 1e80,
	[9] = 1e90,
	[10] = 1e999999999999999999999999999999999,
}

local selectedLevel = 1

task.spawn(function()
	while true do
		if selectedLevel ~= 1 then 
			local vehicle = GetMyVehicle()
			if vehicle and vehicle:GetAttribute("currentHealth") ~= nil then
				vehicle:SetAttribute("currentHealth", HealthLevels[selectedLevel])
			end
		end
		task.wait(0.5) 
	end
end)

CarModTab:AddSlider({
	Name = "Acceleration Multiplier",
	Min = 1,
	Max = 10,
	Default = selectedLevel,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "",
	Callback = function(level)
		selectedLevel = level
		if level ~= 1 then
			local vehicle = GetMyVehicle()
			if vehicle and vehicle:GetAttribute("currentHealth") ~= nil then
				vehicle:SetAttribute("currentHealth", HealthLevels[level])
			end
		end
	end
})

local Section = CarModTab:AddSection({
	Name = "Jump Mods"
})

local jumpKey = Enum.KeyCode.F2 

local function JumpVehicle()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local vehiclesFolder = workspace:FindFirstChild("Vehicles")
	if not vehiclesFolder then return end

	local vehicle = vehiclesFolder:FindFirstChild(player.Name)
	if not vehicle or not vehicle:IsA("Model") then return end

	local seat = vehicle:FindFirstChild("DriveSeat") or vehicle:FindFirstChildWhichIsA("VehicleSeat")
	if not seat then return end

	if not vehicle.PrimaryPart then
		vehicle.PrimaryPart = seat
	end

	local body = vehicle.PrimaryPart
	body.AssemblyLinearVelocity = (body.CFrame.LookVector + Vector3.new(0, 1.4, 0)).Unit * jumpPower
	body.AssemblyAngularVelocity = Vector3.zero
end

CarModTab:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 300,
	Default = 90,
	Increment = 10,
	Color = Color3.fromRGB(9, 99, 195),
	Save = true,
	Flag = "VehicleJumpPower",
	ValueName = "Power",
	Callback = function(value)
		jumpPower = value
	end
})

CarModTab:AddBind({
	Name = "Jump Keybind",
	Default = Enum.KeyCode.F2,
	Save = true,
	Flag = "VehicleJumpKeybind",
	Hold = false,
	Callback = function(key)
		jumpKey = key
		JumpVehicle()
	end
})

CarModTab:AddButton({
	Name = "Jump Vehicle",
	Callback = JumpVehicle
})

local Section = CarModTab:AddSection({
	Name = "Boost Mods"
})

local boostPower = 1000 
local boostKey 

local function BoostVehicle()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local vehiclesFolder = workspace:FindFirstChild("Vehicles")
	if not vehiclesFolder then return end

	local vehicle = vehiclesFolder:FindFirstChild(player.Name)
	if not vehicle or not vehicle:IsA("Model") then return end

	local seat = vehicle:FindFirstChild("DriveSeat") or vehicle:FindFirstChildWhichIsA("VehicleSeat")
	if not seat then return end

	if not vehicle.PrimaryPart then
		vehicle.PrimaryPart = seat
	end

	local body = vehicle.PrimaryPart
	local forwardDirection = body.CFrame.LookVector

	body.AssemblyLinearVelocity = forwardDirection.Unit * boostPower
	body.AssemblyAngularVelocity = Vector3.zero
end

CarModTab:AddSlider({
	Name = "Boost Power",
	Min = 100,
	Max = 2000,
	Default = 1000,
	Color = Color3.fromRGB(9, 99, 195),
	Save = true,
	Flag = "VehicleBoostPower",
	Increment = 50,
	ValueName = "Power",
	Callback = function(value)
		boostPower = value
	end
})

CarModTab:AddBind({
	Name = "Boost Keybind",
	Default = Enum.KeyCode.F1,
	Hold = false,
	Save = true,
	Flag = "VehicleBoostKeybind",
	Callback = function(key)
		boostKey = key
		BoostVehicle()
	end
})

CarModTab:AddButton({
	Name = "Boost Vehicle",
	Callback = function()
		BoostVehicle()
	end
})

local TuningSection = CarModTab:AddSection({
	Name = "Tuning Garage Mods"
})

CarModTab:AddSlider({
	Name = "Armor Level",
	Min = 0,
	Max = 6,
	Default = 0,
	Increment = 1,
	Save = true,
	Flag = "ArmorLevel",
	Callback = function(Value)
		local vehiclesFolder = workspace:FindFirstChild("Vehicles")
		if vehiclesFolder then
			local playerVehicle = vehiclesFolder:FindFirstChild(player.Name)
			if playerVehicle and playerVehicle:IsA("Model") then
				playerVehicle:SetAttribute("armorLevel", Value)
			end
		end
	end
})

CarModTab:AddSlider({
	Name = "Brakes Level",
	Min = 0,
	Max = 6,
	Default = 0,
	Increment = 1,
	Save = true,
	Flag = "BrakesLevel",
	Callback = function(Value)
		local vehiclesFolder = workspace:FindFirstChild("Vehicles")
		if vehiclesFolder then
			local playerVehicle = vehiclesFolder:FindFirstChild(player.Name)
			if playerVehicle and playerVehicle:IsA("Model") then
				playerVehicle:SetAttribute("brakesLevel", Value)
			end
		end
	end
})

CarModTab:AddSlider({
	Name = "Engine Level",
	Min = 0,
	Max = 6,
	Default = 0,
	Increment = 1,
	Save = true,
	Flag = "EngineLevel",
	Callback = function(Value)
		local vehiclesFolder = workspace:FindFirstChild("Vehicles")
		if vehiclesFolder then
			local playerVehicle = vehiclesFolder:FindFirstChild(player.Name)
			if playerVehicle and playerVehicle:IsA("Model") then
				playerVehicle:SetAttribute("engineLevel", Value)
			end
		end
	end
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == FlyKey then
		ToggleFlight(not Flying)
	end
end)

--Esp

local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
-- Admin detection
local ShowAdminDetection = false
local AdminFlags = {}

-- Sicht des esp
local MaxESPDistance = 1000 -- Standardwert in Studs

-- tool esp
local ShowToolESP = false
-- normal
local ShowName = false
local ShowUser = false
local ShowDistance = false
local ShowTeam = false
local ShowWanted = false
local ShowHealth = false -- Neue Variable für Health-Anzeige

-- Tracer ESP
local ShowTracer = false
local tracerDrawings = {}

-- Diese Funktion muss definiert sein, bevor sie verwendet wird
local function getTeamColor(player)
	return (player.Team and player.Team.TeamColor) and player.Team.TeamColor.Color or Color3.new(1, 1, 1)
end

-- Funktion zur Bestimmung der Health-Farbe (grün -> gelb -> rot)
local function getHealthColor(health, maxHealth)
	local percentage = health / maxHealth
	if percentage > 0.5 then
		-- Grün zu Gelb
		local r = 2 * (1 - percentage)
		local g = 1
		local b = 0
		return Color3.new(r, g, b)
	else
		-- Gelb zu Rot
		local r = 1
		local g = 2 * percentage
		local b = 0
		return Color3.new(r, g, b)
	end
end

local function createTracer(player)
	if player == Players.LocalPlayer then return end
	if not player.Character then return end

	local tracer = Drawing.new("Line")
	tracer.Thickness = 1  -- Dünne Linie
	tracer.Transparency = 0.7
	tracer.Visible = false

	tracerDrawings[player] = tracer
end

local function removeTracer(player)
	if tracerDrawings[player] then
		if tracerDrawings[player] then 
			tracerDrawings[player]:Remove() 
		end
		tracerDrawings[player] = nil
	end
end

local function updateTracers()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer and ShowTracer then
			if not tracerDrawings[player] then
				createTracer(player)
			end

			local tracer = tracerDrawings[player]
			if tracer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local rootPart = player.Character.HumanoidRootPart
				local rootPos, rootVis = Camera:WorldToViewportPoint(rootPart.Position)

				-- Distanzprüfung hinzufügen
				local dist = (Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (rootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) or 0

				if rootVis and dist <= MaxESPDistance then
					-- Teamfarbe verwenden
					local teamColor = getTeamColor(player)
					tracer.Color = teamColor

					-- Untere Bildschirmrand als Zielpunkt
					tracer.To = Vector2.new(rootPos.X, rootPos.Y)
					tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
					tracer.Visible = true
				else
					tracer.Visible = false
				end
			else
				if tracer then
					tracer.Visible = false
				end
			end
		else
			if tracerDrawings[player] then
				tracerDrawings[player].Visible = false
			end
		end
	end
end

-- Hintergrund-Update für Tracer
task.spawn(function()
	while true do
		if ShowTracer then
			updateTracers()
		else
			for _, tracer in pairs(tracerDrawings) do
				if tracer then
					tracer.Visible = false
				end
			end
		end
		task.wait(0)
	end
end)

-- Skelett ESP (bestehender Code)
local ShowSkeleton = false
local skeletonDrawings = {}

local function createSkeleton(player)
	if player == Players.LocalPlayer then return end
	if not player.Character then return end

	local bones = {
		{"Head", "UpperTorso"},
		{"UpperTorso", "LowerTorso"},
		{"UpperTorso", "LeftUpperArm"},
		{"LeftUpperArm", "LeftLowerArm"},
		{"LeftLowerArm", "LeftHand"},
		{"UpperTorso", "RightUpperArm"},
		{"RightUpperArm", "RightLowerArm"},
		{"RightLowerArm", "RightHand"},
		{"LowerTorso", "LeftUpperLeg"},
		{"LeftUpperLeg", "LeftLowerLeg"},
		{"LeftLowerLeg", "LeftFoot"},
		{"LowerTorso", "RightUpperLeg"},
		{"RightUpperLeg", "RightLowerLeg"},
		{"RightLowerLeg", "RightFoot"},
	}

	local lines = {}
	for _, bone in ipairs(bones) do
		local line = Drawing.new("Line")
		line.Thickness = 1
		line.Transparency = 1
		line.Color = Color3.new(1, 1, 1)
		line.Visible = false
		table.insert(lines, {line = line, from = bone[1], to = bone[2]})
	end

	skeletonDrawings[player] = lines
end

local function removeSkeleton(player)
	if skeletonDrawings[player] then
		for _, obj in ipairs(skeletonDrawings[player]) do
			if obj.line then obj.line:Remove() end
		end
		skeletonDrawings[player] = nil
	end
end

local function updateSkeletons()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer and ShowSkeleton then
			if not skeletonDrawings[player] then
				createSkeleton(player)
			end

			local lines = skeletonDrawings[player]
			if lines and player.Character then
				for _, l in ipairs(lines) do
					local part1 = player.Character:FindFirstChild(l.from)
					local part2 = player.Character:FindFirstChild(l.to)
					if part1 and part2 then
						local pos1, vis1 = Camera:WorldToViewportPoint(part1.Position)
						local pos2, vis2 = Camera:WorldToViewportPoint(part2.Position)
						if vis1 and vis2 then
							l.line.From = Vector2.new(pos1.X, pos1.Y)
							l.line.To = Vector2.new(pos2.X, pos2.Y)
							l.line.Visible = true
						else
							l.line.Visible = false
						end
					else
						l.line.Visible = false
					end
				end
			end
		else
			removeSkeleton(player)
		end
	end
end

-- Hintergrund-Update für Skelette
task.spawn(function()
	while true do
		if ShowSkeleton then
			updateSkeletons()
		else
			for _, v in pairs(skeletonDrawings) do
				for _, l in ipairs(v) do
					l.line.Visible = false
				end
			end
		end
		task.wait(0)
	end
end)

-- Spieler joinen/gehen Handler
Players.PlayerRemoving:Connect(function(player)
	removeSkeleton(player)
	removeTracer(player)
	AdminFlags[player.UserId] = nil
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if ShowSkeleton then
			task.wait(1)
			createSkeleton(player)
		end
		if ShowTracer then
			task.wait(1)
			createTracer(player)
		end
	end)
end)

local function isWanted(player)
	return player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart:GetAttribute("IsWanted") == true
end

local function updateESP(player)
	if player == Players.LocalPlayer then return end

	if ShowAdminDetection and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local y = player.Character.HumanoidRootPart.Position.Y
		if y > 90 then
			AdminFlags[player.UserId] = true
		end
	end

	-- Admin Y-Position Check
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local y = player.Character.HumanoidRootPart.Position.Y
		if y > 90 then
			AdminFlags[player.UserId] = true
		end
	end


	if not player.Character or not player.Character:FindFirstChild("Head") then return end

	local head = player.Character.Head
	local gui = head:FindFirstChild("ESPGui")

	if not gui then
		gui = Instance.new("BillboardGui", head)
		gui.Name = "ESPGui"
		gui.Size = UDim2.new(2, 0, 2, 0)
		gui.StudsOffset = Vector3.new(0, 3.5, 0)
		gui.AlwaysOnTop = true
		local text = Instance.new("TextLabel", gui)
		text.Name = "ESPText"
		text.Size = UDim2.new(1, 0, 1, 0)
		text.BackgroundTransparency = 1
		text.Font = Enum.Font.GothamBold
		text.TextColor3 = Color3.new(1, 1, 1)
		text.TextSize = 11
		text.TextStrokeTransparency = 0.5
		text.RichText = true
		text.Text = ""
		text.ZIndex = 2
	end

	local label = gui:FindFirstChild("ESPText")

	local dist = (Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (head.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) or 0
	if dist > MaxESPDistance then
		if gui then gui.Enabled = false end
		if tracerDrawings[player] then
			tracerDrawings[player].Visible = false
		end
		return
	else
		if gui then gui.Enabled = true end
	end
	local teamColor = getTeamColor(player)

	local lines = {}
	if ShowAdminDetection and AdminFlags[player.UserId] then
		table.insert(lines, '<font color="rgb(255,0,0)">Admin</font>')
	end

	if ShowName then table.insert(lines, player.DisplayName) end
	if ShowUser then table.insert(lines, "@" .. player.Name) end
	if ShowDistance then table.insert(lines, "Distanze: " .. math.floor(dist) .. " studs") end
	if ShowTeam then
		local r, g, b = math.floor(teamColor.R * 255), math.floor(teamColor.G * 255), math.floor(teamColor.B * 255)
		table.insert(lines, '<font color="rgb(' .. r .. ',' .. g .. ',' .. b .. ')">' .. (player.Team and player.Team.Name or "Unknown") .. '</font>')
	end
	if ShowWanted then
		if isWanted(player) then
			table.insert(lines, '<font color="rgb(255, 208, 0)">Wanted</font>')
		else
			table.insert(lines, '<font color="rgb(128,128,128)">Not Wanted</font>')
		end
	end

	-- Health-Anzeige hinzufügen
	if ShowHealth and player.Character and player.Character:FindFirstChild("Humanoid") then
		local humanoid = player.Character.Humanoid
		local health = math.floor(humanoid.Health)
		local maxHealth = humanoid.MaxHealth
		local healthColor = getHealthColor(health, maxHealth)
		local r, g, b = math.floor(healthColor.R * 255), math.floor(healthColor.G * 255), math.floor(healthColor.B * 255)
		table.insert(lines, '<font color="rgb(' .. r .. ',' .. g .. ',' .. b .. ')">' .. health .. '/' .. maxHealth .. ' HP</font>')
	end

	if ShowToolESP then
		local foundTool = false
		local specialItems = {
			["Bayonet"] = true,
			["Machete"] = true,
			["Circular Saw"] = true,
			["Baseball Bat"] = true,
			["Metal Bat"] = true,
			["Glock 17"] = true,
			["MP5"] = true,
			["M58B Shotgun"] = true,
			["M4 Carbine"] = true,
			["G36"] = true,
			["Sniper"] = true,
			["Bomb"] = true,
			["Taser"] = true
		}

		if player.Character then
			for _, obj in pairs(player.Character:GetChildren()) do
				if obj:IsA("Tool") then
					if specialItems[obj.Name] then
						table.insert(lines, "<font color='rgb(255, 164, 164)'>" .. obj.Name .. "</font>")
					else
						table.insert(lines, "" .. obj.Name)  -- Normaler Text
					end
					foundTool = true
					break
				end
			end
		end 


		if not foundTool then
			table.insert(lines, "<font color='rgb(128,128,128)'>Nothing Equipped</font>")
		end
	end
	-- Jetzt Text setzen (Tool ist enthalten, falls aktiv)
	label.Text = table.concat(lines, "\n")

end

local function updateAll()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer then
			updateESP(player)
		end
	end
end

task.spawn(function()
	while true do
		updateAll()
		task.wait(0.1)
	end
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)
		updateESP(player)
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	AdminFlags[player.UserId] = nil  -- Admin-Flag löschen
	if player.Character and player.Character:FindFirstChild("Head") then
		local gui = player.Character.Head:FindFirstChild("ESPGui")
		if gui then gui:Destroy() end
	end
	removeTracer(player)
end)

local SettingsFile = "VortexESPSettings.json"
local HttpService = game:GetService("HttpService")

local Settings = {
	ShowName = false,
	ShowUser = false,
	ShowDistance = false,
	ShowTeam = false,
	ShowWanted = false,
	ShowHealth = false,  -- Neue Einstellung für Health-Anzeige
	ShowToolESP = false,
	ShowSkeleton = false,
	ShowAdminDetection = false,
	MaxESPDistance = 1000,
	ShowTracer = false,  -- Neue Einstellung für Tracer
}

-- Einstellungen speichern
local function SaveSettings()
	writefile(SettingsFile, HttpService:JSONEncode(Settings))
end

-- Einstellungen laden
local function LoadSettings()
	if isfile(SettingsFile) then
		local data = readfile(SettingsFile)
		local decoded = HttpService:JSONDecode(data)
		for k, v in pairs(decoded) do
			Settings[k] = v
		end
	end
end

-- Settings initialisieren
LoadSettings()

-- ESP-Variablen aktivieren
ShowName = Settings.ShowName
ShowUser = Settings.ShowUser
ShowDistance = Settings.ShowDistance
ShowTeam = Settings.ShowTeam
ShowWanted = Settings.ShowWanted
ShowHealth = Settings.ShowHealth  -- Health-Einstellung laden
ShowToolESP = Settings.ShowToolESP
ShowSkeleton = Settings.ShowSkeleton
ShowAdminDetection = Settings.ShowAdminDetection
MaxESPDistance = Settings.MaxESPDistance
ShowTracer = Settings.ShowTracer  -- Tracer-Einstellung laden

EspTab:AddToggle({
	Name = "Nametag",
	Default = Settings.ShowName,
	Callback = function(v) 
		ShowName = v
		Settings.ShowName = v
		SaveSettings()
	end
})

EspTab:AddToggle({
	Name = "Username",
	Default = Settings.ShowUser,
	Callback = function(v) 
		ShowUser = v
		Settings.ShowUser = v
		SaveSettings()
	end
})

EspTab:AddToggle({
	Name = "Distance",
	Default = Settings.ShowDistance,
	Callback = function(v) 
		ShowDistance = v
		Settings.ShowDistance = v
		SaveSettings()
	end
})

EspTab:AddToggle({
	Name = "Teamgroup",
	Default = Settings.ShowTeam,
	Callback = function(v) 
		ShowTeam = v
		Settings.ShowTeam = v
		SaveSettings()
	end
})

EspTab:AddToggle({
	Name = "Wanted check",
	Default = Settings.ShowWanted,
	Callback = function(v) 
		ShowWanted = v
		Settings.ShowWanted = v
		SaveSettings()
	end
})

-- Health-Toggle hinzufügen
EspTab:AddToggle({
	Name = "Health",
	Default = Settings.ShowHealth,
	Callback = function(v) 
		ShowHealth = v
		Settings.ShowHealth = v
		SaveSettings()
	end
})

EspTab:AddToggle({
	Name = "Shows equipped Items",
	Default = Settings.ShowToolESP,
	Callback = function(v) 
		ShowToolESP = v
		Settings.ShowToolESP = v
		SaveSettings()
	end
})

EspTab:AddToggle({
	Name = "View Skeleton",
	Default = Settings.ShowSkeleton,
	Callback = function(v)
		ShowSkeleton = v
		Settings.ShowSkeleton = v
		SaveSettings()

		if not v then
			for _, player in pairs(Players:GetPlayers()) do
				removeSkeleton(player)
			end
		end
	end
})

-- Tracer-Toggle hinzufügen
EspTab:AddToggle({
	Name = "View Tracer",
	Default = Settings.ShowTracer,
	Callback = function(v) 
		ShowTracer = v
		Settings.ShowTracer = v
		SaveSettings()

		if not v then
			-- Alle Tracer ausblenden, wenn deaktiviert
			for _, player in pairs(Players:GetPlayers()) do
				if tracerDrawings[player] then
					tracerDrawings[player].Visible = false
				end
			end
		end
	end
})

EspTab:AddToggle({
	Name = "Admin Detection (not 100%)",
	Default = Settings.ShowAdminDetection,
	Callback = function(v) 
		ShowAdminDetection = v
		Settings.ShowAdminDetection = v
		SaveSettings()
	end
})

EspTab:AddSlider({
	Name = "ESP Render Range",
	Min = 100,
	Max = 3500,
	Default = Settings.MaxESPDistance,
	Color = Color3.fromRGB(9, 99, 195),
	Increment = 50,
	ValueName = "",
	Callback = function(v)
		MaxESPDistance = v
		Settings.MaxESPDistance = v
		SaveSettings()
	end
})

-- Graphics
local Lighting = game:GetService("Lighting")

--- Variablen für den Sky-Status
local originalSky = Lighting:FindFirstChildOfClass("Sky")

-- Funktion zum Entfernen des Sky
local function removeSky()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then
        sky:Destroy()
    end
end

-- Funktion zum Wiederherstellen des Sky
local function restoreSky()
    if originalSky and not Lighting:FindFirstChildOfClass("Sky") then
        local newSky = originalSky:Clone()
        newSky.Parent = Lighting
    end
end

-- Toggle-Button für Sky
Graphics:AddToggle({
	Name = "Remove Atmosphere",
    Default = false,
    Callback = function(Value)
        if Value then
            removeSky()
        else
            restoreSky()
        end
    end    
})

-- Originalwerte speichern
local LightingSettings = {
	Ambient = Lighting.Ambient,
	OutdoorAmbient = Lighting.OutdoorAmbient,
	Brightness = Lighting.Brightness,
	ShadowSoftness = Lighting.ShadowSoftness,
	GlobalShadows = Lighting.GlobalShadows
}

-- Funktionen zum Ein-/Ausschalten
local function enableFullbright()
	Lighting.Ambient = Color3.fromRGB(255, 255, 255)
	Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
	Lighting.Brightness = 2
	Lighting.ShadowSoftness = 0
	Lighting.GlobalShadows = false
end

local function disableFullbright()
	Lighting.Ambient = LightingSettings.Ambient
	Lighting.OutdoorAmbient = LightingSettings.OutdoorAmbient
	Lighting.Brightness = LightingSettings.Brightness
	Lighting.ShadowSoftness = LightingSettings.ShadowSoftness
	Lighting.GlobalShadows = LightingSettings.GlobalShadows
end

-- Toggle in deinen Graphics-Tab einfügen
Graphics:AddToggle({
	Name = "Fullbright",
	Default = false,
	Save = false,
	Flag = "Fullbright",
	Callback = function(value)
		if value then
			enableFullbright()
		else
			disableFullbright()
		end
	end
})

-- Oben in deinem Script definieren (falls noch nicht vorhanden)
local xrayEnabled = false

-- Xray Toggle im Graphics Tab hinzufügen
Graphics:AddToggle({
	Name = "Xray",
	Default = false,
	Callback = function(Value)
		xrayEnabled = Value
		for _, part in ipairs(workspace:GetDescendants()) do
			if part:IsA("BasePart") and not part:FindFirstAncestorWhichIsA("Model"):FindFirstChildOfClass("Humanoid") then
				part.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
			end
		end
	end
})

local Lighting = game:GetService("Lighting")
local Sky = Lighting:FindFirstChildOfClass("Sky")

if not Sky then
	Sky = Instance.new("Sky")
	Sky.Parent = Lighting
end

-- Skybox Presets
local SkyPresets = {
	["Standard"] = {
		SkyboxBk = "rbxasset://textures/sky/sky512_bk.tex",
		SkyboxDn = "rbxasset://textures/sky/sky512_dn.tex",
		SkyboxFt = "rbxasset://textures/sky/sky512_ft.tex",
		SkyboxLf = "rbxasset://textures/sky/sky512_lf.tex",
		SkyboxRt = "rbxasset://textures/sky/sky512_rt.tex",
		SkyboxUp = "rbxasset://textures/sky/sky512_up.tex",
		SunTextureId = "rbxasset://sky/sun.jpg",
		MoonTextureId = "rbxasset://sky/moon.jpg"
	},

	["Galaxy"] = {
		SkyboxBk = "http://www.roblox.com/asset/?id=159454299",
		SkyboxDn = "http://www.roblox.com/asset/?id=159454296",
		SkyboxFt = "http://www.roblox.com/asset/?id=159454293",
		SkyboxLf = "http://www.roblox.com/asset/?id=159454286",
		SkyboxRt = "http://www.roblox.com/asset/?id=159454300",
		SkyboxUp = "http://www.roblox.com/asset/?id=159454288",
		SunTextureId = "rbxasset://sky/sun.jpg",
		MoonTextureId = "rbxasset://sky/moon.jpg"
	},

	["Space"] = {
		SkyboxBk = "http://www.roblox.com/asset/?id=166509999",
		SkyboxDn = "http://www.roblox.com/asset/?id=166510057",
		SkyboxFt = "http://www.roblox.com/asset/?id=166510116",
		SkyboxLf = "http://www.roblox.com/asset/?id=166510092",
		SkyboxRt = "http://www.roblox.com/asset/?id=166510131",
		SkyboxUp = "http://www.roblox.com/asset/?id=166510114",
		SunTextureId = "rbxasset://sky/sun.jpg",
		MoonTextureId = "rbxasset://sky/moon.jpg"
	},

	["Universe"] = {
		SkyboxBk = "rbxassetid://15983968922",
		SkyboxDn = "rbxassetid://15983966825",
		SkyboxFt = "rbxassetid://15983965025",
		SkyboxLf = "rbxassetid://15983967420",
		SkyboxRt = "rbxassetid://15983966246",
		SkyboxUp = "rbxassetid://15983964246",
		SunTextureId = "rbxasset://sky/sun.jpg",
		MoonTextureId = "rbxasset://sky/moon.jpg"
	},

	["Aesthetic"] = {
		SkyboxBk = "rbxassetid://600830446",
		SkyboxDn = "rbxassetid://600831635",
		SkyboxFt = "rbxassetid://600832720",
		SkyboxLf = "rbxassetid://600886090",
		SkyboxRt = "rbxassetid://600833862",
		SkyboxUp = "rbxassetid://600835177",
		SunTextureId = "rbxasset://sky/sun.jpg",
		MoonTextureId = "rbxasset://sky/moon.jpg"
	},

	["Pink"] = {
		SkyboxBk = "rbxassetid://12635309703",
		SkyboxDn = "rbxassetid://12635311686",
		SkyboxFt = "rbxassetid://12635312870",
		SkyboxLf = "rbxassetid://12635313718",
		SkyboxRt = "rbxassetid://12635315817",
		SkyboxUp = "rbxassetid://12635316856",
		SunTextureId = "rbxasset://sky/sun.jpg",
		MoonTextureId = "rbxassetid://1345054856"
	}
}

-- Funktion zum Anwenden der Skybox
local function ApplySkybox(textures)
	for property, textureId in pairs(textures) do
		if Sky[property] then
			Sky[property] = textureId
		end
	end
end

-- Dropdown für Sky Presets
Graphics:AddDropdown({
	Name = "Change Sky",
	Default = "Standard",
	Save = true,
	Flag = "Sky",
	Options = {"Standard", "Galaxy", "Space", "Universe", "Aesthetic", "Pink"},
	Callback = function(selected)
		ApplySkybox(SkyPresets[selected])
	end    
})

local Section = Graphics:AddSection({
	Name = "Ghost Options"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local STATE = "normal"
local savedColors = {}
local ghostColor = Color3.fromRGB(0, 170, 255)
local rainbowEnabled = false

-- Regenbogen-Funktion
local function HSVToRGB(hue)
	return Color3.fromHSV(hue % 1, 1, 1)
end

-- Ghost Mode anwenden
local function applyGhostColor(color)
	local character = LocalPlayer.Character
	if not character then return end

	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") and part.Transparency < 1 then
			if not savedColors[part] then
				savedColors[part] = {
					Color = part.Color,
					Material = part.Material
				}
			end
			part.Material = Enum.Material.ForceField
			part.Color = color
		end
	end
end

-- Ghost Mode zurücksetzen
local function restoreOriginalAppearance()
	local character = LocalPlayer.Character
	if not character then return end

	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") and savedColors[part] then
			part.Material = savedColors[part].Material
			part.Color = savedColors[part].Color
		end
	end

	savedColors = {}
end

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

function copySkinFromPlayer(player)
	if not player or not player.Character then
		return false
	end

	local targetCharacter = player.Character
	local localCharacter = localPlayer.Character

	if not localCharacter then
		localPlayer.CharacterAdded:Wait()
		localCharacter = localPlayer.Character
		wait(1)
	end

	for _, oldItem in pairs(localCharacter:GetChildren()) do
		if oldItem:IsA("ShirtGraphic") or oldItem:IsA("Shirt") or oldItem:IsA("Pants") then
			oldItem:Destroy()
		end
	end

	for _, item in pairs(targetCharacter:GetChildren()) do
		if item:IsA("Shirt") then
			local clone = item:Clone()
			clone.Parent = localCharacter
		elseif item:IsA("Pants") then
			local clone = item:Clone()
			clone.Parent = localCharacter
		elseif item:IsA("ShirtGraphic") then
			local clone = item:Clone()
			clone.Parent = localCharacter
		end
	end

	local bodyParts = {
		"Head",
		"LeftFoot", "RightFoot",
		"LeftHand", "RightHand", 
		"LeftLowerArm", "RightLowerArm",
		"LeftLowerLeg", "RightLowerLeg",
		"LeftUpperArm", "RightUpperArm",
		"LeftUpperLeg", "RightUpperLeg",
		"UpperTorso", "LowerTorso"
	}

	for _, partName in pairs(bodyParts) do
		local targetPart = targetCharacter:FindFirstChild(partName)
		local localPart = localCharacter:FindFirstChild(partName)

		if targetPart and localPart then
			localPart.BrickColor = targetPart.BrickColor
			localPart.Material = targetPart.Material
		end
	end

	local targetHead = targetCharacter:FindFirstChild("Head")
	local localHead = localCharacter:FindFirstChild("Head")

	if targetHead and localHead then
		for _, face in pairs(localHead:GetChildren()) do
			if face:IsA("Decal") then
				face:Destroy()
			end
		end

		-- Neues Gesicht kopieren
		local targetFace = targetHead:FindFirstChildOfClass("Decal")
		if targetFace then
			local newFace = targetFace:Clone()
			newFace.Parent = localHead
		end
	end

	return true
end

function copyRandomSkin()
	local otherPlayers = {}
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= localPlayer and player.Character then
			table.insert(otherPlayers, player)
		end
	end

	if #otherPlayers == 0 then
		return false
	end

	local randomIndex = math.random(1, #otherPlayers)
	local randomPlayer = otherPlayers[randomIndex]

	return copySkinFromPlayer(randomPlayer)
end

-- Funktion zum Aktualisieren der Spielerliste im Dropdown
function updatePlayerDropdown()
	local playerOptions = {"Random Player"}
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= localPlayer and player.Character then
			table.insert(playerOptions, player.Name)
		end
	end
	return playerOptions
end

-- Dropdown für Spielerauswahl
local dropdown = Graphics:AddDropdown({
	Name = "Skinchanger",
	Default = "Choose a player",
	Options = updatePlayerDropdown(),
	Callback = function(value)
		if value == "Random Player" then
			copyRandomSkin()
		else
			local selectedPlayer = Players:FindFirstChild(value)
			if selectedPlayer then
				copySkinFromPlayer(selectedPlayer)
			end
		end
	end    
})

Players.PlayerAdded:Connect(function(player)
	wait(2)
	dropdown:Refresh(updatePlayerDropdown(), true)
end)

Players.PlayerRemoving:Connect(function(player)
	dropdown:Refresh(updatePlayerDropdown(), true)
end)

Graphics:AddToggle({
	Name = "Player Ghost",
	Default = false,
	Callback = function(enabled)
		STATE = enabled and "force" or "normal"
		if enabled then
			applyGhostColor(ghostColor)
		else
			restoreOriginalAppearance()
		end
	end
})

Graphics:AddColorpicker({
	Name = "Ghost Color",
	Default = ghostColor,
	Save = true,
	Flag = "GhostColor",
	Callback = function(value)
		ghostColor = value
		if STATE == "force" and not rainbowEnabled then
			applyGhostColor(ghostColor)
		end
	end
})

-- Rainbow Mode Toggle
Graphics:AddToggle({
	Name = "Rainbow Color",
	Default = false,
	Callback = function(enabled)
		rainbowEnabled = enabled
	end
})

-- Regenbogen-Update-Schleife
RunService.RenderStepped:Connect(function()
	if STATE == "force" and rainbowEnabled then
		local hue = tick() % 5 / 5 -- Wert von 0 bis 1
		local rainbowColor = HSVToRGB(hue)
		applyGhostColor(rainbowColor)
	end
end)

--Teleports

local TweenService = game:GetService("TweenService")
local FARMspeed = 100 -- Default value

-- Slider for speed control
TeleportTab:AddSlider({
	Name = "Teleport Speed",
	Min = 50,
	Max = 175,
	Default = 100,
	Save = true,
	Flag = "TeleportSpeed",
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "speed",
	Callback = function(Value)
		FARMspeed = Value
	end    
})

local function ensurePlayerInVehicle()
	local player = game.Players.LocalPlayer
	if player and player.Character then
		local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
		if vehicle and player.Character:FindFirstChild("Humanoid") then
			local humanoid = player.Character:FindFirstChild("Humanoid")
			if humanoid and not humanoid.SeatPart then
				local driveSeat = vehicle:FindFirstChild("DriveSeat")
				if driveSeat then
					driveSeat:Sit(humanoid)
				end
			end
		end
	end
end

local function tweenToCFrame(model, targetCFrame, duration, onComplete)
	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = model:GetPrimaryPartCFrame()

	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		model:SetPrimaryPartCFrame(CFrameValue.Value)
		model.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
	end)

	local tween = TweenService:Create(CFrameValue, info, { Value = targetCFrame })
	tween:Play()
	tween.Completed:Connect(function()
		CFrameValue:Destroy()
		if onComplete then onComplete() end
	end)
end

local function flyVehicleTo(targetCFrame, callback)
	local player = game.Players.LocalPlayer
	local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
	if not vehicle then return end

	local driveSeat = vehicle:FindFirstChild("DriveSeat")
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid and driveSeat then
		if not humanoid.SeatPart then
			driveSeat:Sit(humanoid)
		end
	end

	if not vehicle.PrimaryPart then
		vehicle.PrimaryPart = vehicle:FindFirstChild("Mass", true)
	end

	local startPos = vehicle.PrimaryPart.Position
	local targetPos = targetCFrame.Position
	local downPos = Vector3.new(startPos.X, startPos.Y - 5.3, startPos.Z)

	vehicle:SetPrimaryPartCFrame(CFrame.new(downPos))

	local horizontalTarget = Vector3.new(targetPos.X, downPos.Y, targetPos.Z)
	local riseTarget = Vector3.new(targetPos.X, startPos.Y + 0, targetPos.Z)

	local horizontalDistance = (Vector3.new(startPos.X, 0, startPos.Z) - Vector3.new(horizontalTarget.X, 0, horizontalTarget.Z)).Magnitude
	local duration1 = horizontalDistance / FARMspeed
	local duration2 = 1 / FARMspeed

	tweenToCFrame(vehicle, CFrame.new(horizontalTarget), duration1, function()
		tweenToCFrame(vehicle, CFrame.new(riseTarget), duration2, callback)
	end)
end

local function flyVehicleTo2(targetCFrame, callback)
	local player = game.Players.LocalPlayer
	local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
	if not vehicle then return end

	local driveSeat = vehicle:FindFirstChild("DriveSeat")
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid and driveSeat then
		if not humanoid.SeatPart then
			driveSeat:Sit(humanoid)
		end
	end

	if not vehicle.PrimaryPart then
		vehicle.PrimaryPart = vehicle:FindFirstChild("Mass", true)
	end

	local startPos = vehicle.PrimaryPart.Position
	local targetPos = targetCFrame.Position

	-- Flughöhe während des Transports
	local flightHeight = -1

	-- Sofort auf Flughöhe -1 setzen
	local startFlightPos = Vector3.new(startPos.X, flightHeight, startPos.Z)
	vehicle:SetPrimaryPartCFrame(CFrame.new(startFlightPos))

	-- Zielposition für den Flug (auf Flughöhe -1)
	local flightTarget = Vector3.new(targetPos.X, flightHeight, targetPos.Z)

	-- Berechne Dauer für den Flug
	local distance = (Vector3.new(startPos.X, 0, startPos.Z) - Vector3.new(flightTarget.X, 0, flightTarget.Z)).Magnitude
	local duration = distance / FARMspeed

	-- Erstelle TweenInfo
	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = vehicle:GetPrimaryPartCFrame()

	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		-- Während des Fluges Y-Koordinate auf -1 fixieren
		local currentPos = CFrameValue.Value.Position
		local fixedCFrame = CFrame.new(currentPos.X, flightHeight, currentPos.Z)
		vehicle:SetPrimaryPartCFrame(fixedCFrame)
		vehicle.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
	end)

	local tween = TweenService:Create(CFrameValue, info, { Value = CFrame.new(flightTarget) })
	tween:Play()

	tween.Completed:Connect(function()
		CFrameValue:Destroy()
		-- Sobald angekommen, auf finale Höhe setzen
		vehicle:SetPrimaryPartCFrame(targetCFrame)

		if callback then callback() end
	end)
end

local function teleportToLocation(coordinates)
	ensurePlayerInVehicle()
	task.wait(0.5)
	flyVehicleTo2(coordinates)
end

TeleportTab:AddButton({
	Name = "Nearest Dealer",
	Callback = function()
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		local function findNearestDealer()
			local nearestDealer = nil
			local closestDistance = math.huge

			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("Model") and obj.Name:lower():find("dealer") then
					if obj.PrimaryPart then
						local distance = (LocalPlayer.Character.HumanoidRootPart.Position - obj.PrimaryPart.Position).magnitude
						if distance < closestDistance then
							nearestDealer = obj
							closestDistance = distance
						end
					end
				end
			end
			return nearestDealer
		end

		local dealer = findNearestDealer()
		if dealer then
			teleportToLocation(dealer.PrimaryPart.CFrame)
		end
	end
})

TeleportTab:AddButton({
	Name = "Nearest Smuggler",
	Callback = function()
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		local function findNearestSmuggler()
			local nearestSmuggler = nil
			local closestDistance = math.huge

			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("Model") and obj.Name:lower():find("smuggler") then
					if obj.PrimaryPart then
						local distance = (LocalPlayer.Character.HumanoidRootPart.Position - obj.PrimaryPart.Position).magnitude
						if distance < closestDistance then
							nearestSmuggler = obj
							closestDistance = distance
						end
					end
				end
			end
			return nearestSmuggler
		end

		local smuggler = findNearestSmuggler()
		if smuggler then
			teleportToLocation(smuggler.PrimaryPart.CFrame)
		end
	end
})

TeleportTab:AddButton({
	Name = "Nearest Vending Machine",
	Callback = function()
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		local function findNearestVendingMachine()
			local nearestPart = nil
			local closestDistance = math.huge

			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("Model") and obj.Name == "Vending Machine" then
					for _, part in pairs(obj:GetChildren()) do
						if part:IsA("BasePart") and part.Name == "Light" then
							local lightColor = part.Color
							if lightColor == Color3.fromRGB(73, 147, 0) then
								local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).magnitude
								if distance < closestDistance then
									nearestPart = part
									closestDistance = distance
								end
							end
						end
					end
				end
			end
			return nearestPart
		end

		local vendingMachinePart = findNearestVendingMachine()
		if vendingMachinePart then
			teleportToLocation(vendingMachinePart.CFrame)
		end
	end
})

local Section = TeleportTab:AddSection({
	Name = "Select to teleport"
})


TeleportTab:AddDropdown({
	Name = "Robbable Places",
	Options = {"Gasn-Go", "Osso-Fuel", "Jewelry Store", "Bank", "Ares Tank", "Tool Shop", "Farm Shop", "Erwin Club", "Yellow Container", "Green Container"},
	Callback = function(selected)
		if selected == "Gasn-Go" then
			teleportToLocation(CFrame.new(-1566.311, 5.25, 3812.591))
		elseif selected == "Osso-Fuel" then
			teleportToLocation(CFrame.new(-33.184, 5.25, -748.875))
		elseif selected == "Jewelry Store" then
			teleportToLocation(CFrame.new(-413.255, 5.5, 3517.947))
		elseif selected == "Bank" then
			teleportToLocation(CFrame.new(-1188.809, 5.5, 3228.133))
		elseif selected == "Ares Tank" then
			teleportToLocation(CFrame.new(-858.118, 5.3, 1514.51))
		elseif selected == "Farm Shop" then
			teleportToLocation(CFrame.new(-896.206, 4.984, -1165.972))
		elseif selected == "Erwin Club" then
			teleportToLocation(CFrame.new(-1858.259, 5.25, 3023.394))
		elseif selected == "Yellow Container" then
			teleportToLocation(CFrame.new(1118.788, 28.696, 2335.582))
		elseif selected == "Green Container" then
			teleportToLocation(CFrame.new(1169.115, 28.696, 2153.111))
		elseif selected == "Tool Shop" then
			teleportToLocation(CFrame.new(-750.401, 5.25, 670.062))           
		end
	end
})

TeleportTab:AddDropdown({
	Name = "Usable Places",
	Options = {"Car Dealer", "Prison In", "Prison Out", "Hospital", "Parking Garage"},
	Callback = function(selected)
		if selected == "Car Dealer" then
			teleportToLocation(CFrame.new(-1421.418, 5.25, 941.061))
		elseif selected == "Prison In" then
			teleportToLocation(CFrame.new(-573.336, 5.088, 3061.913))
		elseif selected == "Prison Out" then
			teleportToLocation(CFrame.new(-580.354, 5.25, 2839.322))
		elseif selected == "Hospital" then
			teleportToLocation(CFrame.new(-284.98, 5.25, 1108.397))
		elseif selected == "Parking Garage" then
			teleportToLocation(CFrame.new(-1476.472900390625, -23.861671447753906, 3669.669677734375))
		end
	end
})

TeleportTab:AddDropdown({
	Name = "Work Places",
	Options = {"ADAC", "Police Station", "Fire Station", "Truck Station", "Bus Station"},
	Callback = function(selected)
		if selected == "ADAC" then
			teleportToLocation(CFrame.new(-126.326, 5.25, 431.344))
		elseif selected == "Police Station" then
			teleportToLocation(CFrame.new(-1684.459, 5.25, 2736.004))
		elseif selected == "Fire Station" then
			teleportToLocation(CFrame.new(-1026.58, 5.464, 3899.69))
		elseif selected == "Truck Station" then
			teleportToLocation(CFrame.new(710.446, 5.25, 1481.296))
		elseif selected == "Bus Station" then
			teleportToLocation(CFrame.new(-1676.292, 5.144, -1272.049))
		end
	end
})

--AutoFarm

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VehiclesFolder = workspace:WaitForChild("Vehicles")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")

local FARMPos
local FARMLastPos
local FARMcooldown = false
local FARMheight = -10
local FARMspeed = 110
local FARMcurrentTween = nil
local FARMstopFarm = false
local busFarmToggle = false
local truckFarmToggle = false

farmTab:AddToggle({
	Name = "Autofarm [Bus]",
	Default = false,
	Callback = function(Value)
		busFarmToggle = Value
		if FARMLastPos then FARMLastPos = nil end
		if FARMcurrentTween then
			FARMcurrentTween:Cancel()
			FARMstopFarm = true
			task.wait(0.5)
			FARMstopFarm = false
		end
	end
})

farmTab:AddToggle({
	Name = "Autofarm [Truck]",
	Default = false,
	Callback = function(Value)
		truckFarmToggle = Value
		if FARMLastPos then FARMLastPos = nil end
		if FARMcurrentTween then
			FARMcurrentTween:Cancel()
			FARMstopFarm = true
			task.wait(0.5)
			FARMstopFarm = false
		end
	end
})

local function ensurePlayerInVehicle()
	if LocalPlayer.Team == game:GetService("Teams").TruckCompany or LocalPlayer.Team == game:GetService("Teams").BusCompany then
		local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
		if vehicle and LocalPlayer.Character then
			local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
			if humanoid and not humanoid.SeatPart then
				local driveSeat = vehicle:FindFirstChild("DriveSeat")
				if driveSeat then
					driveSeat:Sit(humanoid)
				end
			end
		end
	end
end

local function partfind()
	for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
		if v:IsA("BillboardGui") and v.Adornee then
			if v.Adornee.CFrame then
				return v.Adornee.CFrame
			end
		end
	end
	return nil
end

local function destination()
	for _, v in pairs(workspace.BusStops:GetDescendants()) do
		if v.Name == "SelectionBox" and v.Visible and v.Transparency ~= 1 then
			return v.Parent.CFrame
		end
	end
	for _, v in pairs(workspace.DeliveryDestinations:GetDescendants()) do
		if v.Name == "SelectionBox" and v.Visible and v.Transparency ~= 1 then
			return v.Parent.CFrame
		end
	end
	return nil
end

local function tweenModel(model, targetCFrame, duration)
	if FARMcurrentTween then
		FARMcurrentTween:Cancel()
		FARMcurrentTween = nil
	end

	local info = TweenInfo.new(
		duration,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.InOut
	)

	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = model:GetPrimaryPartCFrame()

	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		model:SetPrimaryPartCFrame(CFrameValue.Value)
		model.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
		model.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
	end)

	local tween = TweenService:Create(CFrameValue, info, { Value = targetCFrame })
	tween:Play()

	local tweenCompleted = false
	tween.Completed:Connect(function()
		CFrameValue:Destroy()
		tweenCompleted = true
	end)

	FARMcurrentTween = tween

	repeat task.wait(0.5) until tweenCompleted or FARMstopFarm

	return tweenCompleted
end

local function tweenFunction()
	local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name)
	if not vehicle then
		FARMLastPos = nil
		return
	end
	if vehicle.PrimaryPart == nil then
		vehicle.PrimaryPart = vehicle:FindFirstChild("Mass", true)
	end
	local _, size = vehicle:GetBoundingBox()

	if FARMPos then
		local currentPosition = vehicle.PrimaryPart.CFrame
		local downwardPosition = CFrame.new(currentPosition.Position.X, currentPosition.Position.Y + FARMheight, currentPosition.Position.Z)

		vehicle:SetPrimaryPartCFrame(downwardPosition)
		vehicle.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
		vehicle.PrimaryPart.AssemblyAngularVelocity = Vector3.zero

		if not FARMstopFarm then
			local adjustedPosition = FARMPos * CFrame.new(0, FARMheight, 0)
			if not tweenModel(vehicle, adjustedPosition, (adjustedPosition.Position - downwardPosition.Position).Magnitude / FARMspeed) then return end
		end

		if not FARMstopFarm then
			tweenModel(vehicle, (FARMPos * CFrame.new(0, size.Y / 2, 0)), FARMheight / (FARMspeed * 2))
			local slightForwardPosition = vehicle.PrimaryPart.CFrame * CFrame.new(0, 0, -5)
			vehicle:SetPrimaryPartCFrame(slightForwardPosition)
		end
	else
		FARMLastPos = nil
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	local active = false
	if busFarmToggle and LocalPlayer.Team == game:GetService("Teams").BusCompany then
		active = true
	elseif truckFarmToggle and LocalPlayer.Team == game:GetService("Teams").TruckCompany then
		active = true
	end

	if active then
		ensurePlayerInVehicle()
		FARMPos = destination() or partfind()
		if not FARMcooldown then
			if not workspace.Vehicles:FindFirstChild(LocalPlayer.Name) then
				FARMcooldown = true
				OrionLib:MakeNotification({
					Name = "Autofarm Error",
					Content = "Please spawn the first vehicle.",
					Time = 3
				})
				task.wait(3)
				FARMcooldown = false
				return
			end
			FARMcooldown = true
			FARMPos = destination() or partfind()

			local significantChange = true
			if FARMPos and FARMLastPos then
				local distance = (FARMPos.Position - FARMLastPos.Position).Magnitude
				significantChange = distance > 1
			end

			if FARMPos and significantChange then
				if FARMcurrentTween then
					FARMcurrentTween:Cancel()
				end
				FARMstopFarm = true
				task.wait(0.5)
				FARMstopFarm = false
				FARMLastPos = FARMPos
				tweenFunction()
			end

			task.wait(0.5)
			FARMcooldown = false
		end
	end
end)

local Section = farmTab:AddSection({
	Name = "Autorobbery"
})

farmTab:AddButton({
	Name = "Open Autorob Menu",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ItemTo/VortexAutorob/refs/heads/main/release"))()
	end    
})

farmTab:AddParagraph("Warning", "The old menu will close. The autorob menu will then open, containing all the information.")

local Section = farmTab:AddSection({
	Name = "Options"
})

farmTab:AddToggle({
	Name = "Anti-Fall",  
	Default = false,  
	Callback = function(state)
		if state then
			getfenv().ANTIFALL = true
			getfenv().nofall = game:GetService("RunService").RenderStepped:Connect(function()
				local character = game.Players.LocalPlayer.Character
				if character then
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart then
						local raycastResult = workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -20, 0))
						if raycastResult and humanoidRootPart.Velocity.Y < -30 then
							humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
						end
					end
				end
			end)
		else
			getfenv().ANTIFALL = false
			if getfenv().nofall then
				getfenv().nofall:Disconnect()
			end
		end
	end
})

farmTab:AddButton({
	Name = "Reset (will lose 50% XP)",
	Callback = function()
		local player = game.Players.LocalPlayer

		local function setHealthToZero()
			local character = player.Character
			if character and character:FindFirstChild("Humanoid") then
				local humanoid = character:FindFirstChild("Humanoid")
				humanoid.Health = 0  
			end
		end

		setHealthToZero()
	end    
})

local antiAfkEnabled = false
local afkConnection
local afkLoop

farmTab:AddToggle({
	Name = "Anti AFK",
	Default = false,
	Save = true,
	Flag = "AntiAFKfarmTab",
	Callback = function(Value)
		antiAfkEnabled = Value

		if Value then
			local vu = game:service'VirtualUser'
			afkConnection = game:service'Players'.LocalPlayer.Idled:Connect(function()
				vu:CaptureController()
				vu:ClickButton2(Vector2.new())
			end)

			afkLoop = task.spawn(function()
				while antiAfkEnabled do
					task.wait(300) 
					vu:CaptureController()
					vu:ClickButton2(Vector2.new())
				end
			end)
		else
			if afkConnection then
				afkConnection:Disconnect()
				afkConnection = nil
			end
			if afkLoop then
				task.cancel(afkLoop)
				afkLoop = nil
			end
		end
	end
})            

--Police

-- Auto teaser
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local autoTaserToggle = false
local predictionFactor = 0.22
local maxTargetDistance = 20

local function toggleAutoTaser(value)
	autoTaserToggle = value
end

PoliceTab:AddToggle({
	Name = "Auto Taser",
	Default = false,
	Callback = function(Value)
		toggleAutoTaser(Value)
	end    
})

local function isPlayerOnSeat(player)
	local char = player.Character
	if not char then return false end

	-- Prüfe ob der Spieler auf einem Stuhl/Sitz sitzt
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if humanoid and humanoid.Sit then
		return true
	end

	-- Zusätzliche Prüfung für Sitze
	for _, part in ipairs(char:GetChildren()) do
		if part:IsA("BasePart") then
			local seat = part:FindFirstAncestorOfClass("VehicleSeat")
			if seat then
				return true
			end
		end
	end

	return false
end

local function getBestTarget()
	local myChar = LocalPlayer.Character
	if not (myChar and myChar:FindFirstChild("HumanoidRootPart")) then return end

	local bestTarget = nil
	local closestDistance = maxTargetDistance

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				local hrp = char.HumanoidRootPart
				if hrp:GetAttribute("IsWanted") == true then
					local humanoid = char:FindFirstChildOfClass("Humanoid")

					-- Ignoriere Spieler mit weniger als 30 HP oder die auf einem Stuhl sitzen
					if humanoid and humanoid.Health > 30 and not isPlayerOnSeat(player) then
						local distance = (myChar.HumanoidRootPart.Position - hrp.Position).Magnitude
						if distance < closestDistance then
							closestDistance = distance
							bestTarget = {
								player = player,
								part = hrp,
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

RunService.Heartbeat:Connect(function()
	if not autoTaserToggle then return end

	local myChar = LocalPlayer.Character
	if not (myChar and myChar:FindFirstChild("HumanoidRootPart")) then return end

	local taser = myChar:FindFirstChild("Taser")
	if not taser then return end

	local target = getBestTarget()
	if not target then return end

	-- Position wird bei jedem Heartbeat aktuell abgerufen
	local shootFrom = myChar.HumanoidRootPart.Position
	local targetHrp = target.part
	local predictedPos = targetHrp.Position + (targetHrp.Velocity * predictionFactor)

	Config.TeaserShootRemoteEvent:FireServer(taser, predictedPos, (predictedPos - shootFrom).Unit)
end)

-- Auto Stop Stick
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local autoStopStickToggle = false
local predictionFactor = 0.22
local maxTargetDistance = 20

local function toggleAutoStopStick(value)
	autoStopStickToggle = value
end

PoliceTab:AddToggle({
	Name = "Auto Stop Stick",
	Default = false,
	Callback = function(Value)
		toggleAutoStopStick(Value)
	end    
})

local function isPlayerSitting(player)
	local char = player.Character
	if not char then return false end

	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end

	-- Prüfe ob der Humanoid auf einem Sitz sitzt
	if humanoid.Sit then
		return true
	end

	-- Zusätzliche Prüfung: Suche nach SitController im Humanoid
	local sitController = humanoid:FindFirstChild("SitController")
	if sitController then
		return true
	end

	return false
end

local function getBestTarget()
	local myChar = LocalPlayer.Character
	if not (myChar and myChar:FindFirstChild("HumanoidRootPart")) then return end

	local bestTarget = nil
	local closestDistance = maxTargetDistance

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				local hrp = char.HumanoidRootPart

				-- Prüfe ob Spieler wanted ist UND auf einem Sitz sitzt
				if hrp:GetAttribute("IsWanted") == true and isPlayerSitting(player) then
					local humanoid = char:FindFirstChildOfClass("Humanoid")
					if humanoid and humanoid.Health > 0 then
						local distance = (myChar.HumanoidRootPart.Position - hrp.Position).Magnitude
						if distance < closestDistance then
							closestDistance = distance
							bestTarget = {
								player = player,
								part = hrp,
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

RunService.Heartbeat:Connect(function()
	if not autoStopStickToggle then return end

	local myChar = LocalPlayer.Character
	if not (myChar and myChar:FindFirstChild("HumanoidRootPart")) then return end

	local stopStick = myChar:FindFirstChild("StopStick") or myChar:FindFirstChild("Stop Stick")
	if not stopStick then return end

	local target = getBestTarget()
	if not target then return end

	local throwFrom = myChar.HumanoidRootPart.Position
	local predictedPos = target.part.Position + (target.part.Velocity * predictionFactor)

	Config.WerfRemoteEvent:FireServer(stopStick, predictedPos, (predictedPos - throwFrom).Unit)
end)

local Section = PoliceTab:AddSection({
	Name = "Arrest Options"
})

local MAX_DISTANCE = 7
local isPressingE = false
local isEnabled = false

local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

-- Einfache Überprüfung: Hat der Spieler das Handcuffs-Tool im Charakter?
local function hasHandcuffsTool()
	if not localPlayer.Character then return false end

	-- Durchsuche alle Kinder des Charakters nach einem Tool namens "Handcuffs"
	for _, obj in pairs(localPlayer.Character:GetChildren()) do
		if obj:IsA("Tool") and obj.Name == "Handcuffs" then
			return true
		end
	end

	return false
end

local function isWanted(player)
	return player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart:GetAttribute("IsWanted") == true
end

local function startPressingE()
	if isPressingE then return end
	isPressingE = true

	-- E-Taste gedrückt halten
	task.wait(0.1)
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
end

local function stopPressingE()
	if not isPressingE then return end
	isPressingE = false

	-- E-Taste loslassen
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

local function onHeartbeat()
	if not isEnabled then return end

	-- Überprüfe, ob der Spieler das Handcuffs-Tool im Charakter hat
	if not hasHandcuffsTool() then
		stopPressingE()
		return
	end

	local character = localPlayer.Character
	if not character then
		stopPressingE()
		return 
	end

	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then
		stopPressingE()
		return
	end

	local wantedPlayerInRange = false

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= localPlayer and player.Character and isWanted(player) then
			local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
			if targetRoot then
				local distance = (rootPart.Position - targetRoot.Position).Magnitude
				if distance <= MAX_DISTANCE then
					wantedPlayerInRange = true
					break
				end
			end
		end
	end

	if wantedPlayerInRange then
		startPressingE()
	else
		stopPressingE()
	end
end

-- Starte die Überprüfung
RunService.Heartbeat:Connect(onHeartbeat)

PoliceTab:AddToggle({
	Name = "Auto Cuff",
	Callback = function(Value)
		isEnabled = Value
		if not isEnabled then
			stopPressingE()
		end
	end
})

PoliceTab:AddSlider({
	Name = "Cuff Distance",
	Min = 1,
	Max = 7,
	Default = 7,
	Increment = 1,
	Save = true,
	Flag = "CuffDistance",
	Format = "Studs",
	Callback = function(Value)
		MAX_DISTANCE = Value
	end
})

local Section = PoliceTab:AddSection({
	Name = "Radar Farm Options"
})

local remote = game:GetService("ReplicatedStorage")["8WX"]:FindFirstChild("35b3ffbf-8881-4eba-aaa2-6d0ce8f8bf8b")

PoliceTab:AddButton({
	Name = "Automatic Radar Farm (goes police + position)",
	Callback = function()
		local function showNotification(text, duration)
			duration = duration or 3
			local success, _ = pcall(function()
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Vortex Softwares",
					Text = text,
					Duration = duration
				})
			end)
		end

		-- 1 settings

		local startPosition = Vector3.new(-1686.76, 5.88, 2755.92)
		local maxDistance = 9000

		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")

		local distance = (hrp.Position - startPosition).Magnitude
		if distance > maxDistance then
			showNotification("Checkpoint error", 5)
			return
		else
			showNotification("Checkpoint start", 5)
		end

		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
		local rs = game:GetService("ReplicatedStorage")
		local vehicles = workspace:WaitForChild("Vehicles")
		local ts = game:GetService("TweenService")
		local runService = game:GetService("RunService")

		local noclip = true
		runService.Stepped:Connect(function()
			if noclip and char then
				for _, part in ipairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		end)

		local function flyTo(position, duration)
			local info = TweenInfo.new(duration or 2, Enum.EasingStyle.Linear)
			local tween = ts:Create(hrp, info, {CFrame = CFrame.new(position)})
			tween:Play()
			tween.Completed:Wait()
		end

		local isFlyingVehicle = false
		local function flyVehicleTo(position)
			if isFlyingVehicle then return warn("Bereits im Flugprozess") end
			isFlyingVehicle = true

			local vehicle = vehicles:FindFirstChild(player.Name)
			if not vehicle or not vehicle:FindFirstChild("DriveSeat") then
				warn("Kein Fahrzeug oder DriveSeat gefunden")
				isFlyingVehicle = false
				return
			end

			local seat = vehicle.DriveSeat
			if char:FindFirstChild("Humanoid") then
				seat:Sit(char.Humanoid)
			end

			local root = vehicle.PrimaryPart or vehicle:FindFirstChildWhichIsA("BasePart")
			local target = position
			local step = 2
			local delayTime = 0.01

			local function moveAxis(startVal, endVal, setter)
				local dir = endVal > startVal and 1 or -1
				local val = startVal
				while (dir == 1 and val < endVal) or (dir == -1 and val > endVal) do
					val = val + dir * step
					if (dir == 1 and val > endVal) or (dir == -1 and val < endVal) then
						val = endVal
					end
					setter(val)
					task.wait(delayTime)
				end
			end

			local function moveXZ(startX, endX, startZ, endZ, setter)
				local dist = math.sqrt((endX - startX)^2 + (endZ - startZ)^2)
				local steps = math.ceil(dist / step)
				for i = 1, steps do
					local t = i / steps
					local x = startX + (endX - startX) * t
					local z = startZ + (endZ - startZ) * t
					setter(x, z)
					task.wait(delayTime)
				end
				setter(endX, endZ)
			end

			local function pivotCFrame(x, y, z)
				vehicle:PivotTo(CFrame.new(x, y, z))
			end

			local startPos = root.Position
			moveAxis(startPos.Y, startPos.Y + -5, function(y)
				pivotCFrame(startPos.X, y, startPos.Z)
			end)

			local current = vehicle.PrimaryPart.Position
			moveXZ(current.X, target.X, current.Z, target.Z, function(x, z)
				pivotCFrame(x, current.Y, z)
				current = vehicle.PrimaryPart.Position
			end)

			current = vehicle.PrimaryPart.Position
			moveAxis(current.Y, target.Y + 20, function(y)
				pivotCFrame(current.X, y, current.Z)
			end)

			current = vehicle.PrimaryPart.Position
			step = 0.2
			delayTime = 0.005
			moveAxis(current.Y, target.Y, function(y)
				pivotCFrame(current.X, y, current.Z)
			end)

			isFlyingVehicle = false
		end

		local function enterVehicle()
			local vehicle = vehicles:FindFirstChild(player.Name)
			if vehicle and char:FindFirstChild("Humanoid") then
				local seat = vehicle:FindFirstChild("DriveSeat")
				if seat then
					seat:Sit(char.Humanoid)
				end
			end
		end

		local function exitVehicle()
			if char:FindFirstChild("Humanoid") then
				char.Humanoid.Jump = true
			end
		end

		local function startJob()
			Config.Startjob:FireServer("Patrol Police")
			task.wait(1)
		end

		local function spawnPolice
		()
			Config.SpawnPoliceCar:FireServer("VW Golf Patrol Police")
			task.wait(1)
		end

		local function equipRadarGun()
			Config.EquipRadar:FireServer("Radar Gun")
			task.wait(0.5)

			local radar = nil
			for i = 1, 10 do
				radar = char:FindFirstChild("Radar Gun")
				if radar then break end
				task.wait(0.2)
			end
			if radar then
				noclip = false
			end
		end

		local function startRadarFarm()
			_G.RadarFarmEnabled = true
			while _G.RadarFarmEnabled do
				local radarGun = char:FindFirstChild("Radar Gun")
				if radarGun and Config.RadarFarm then
					for _, veh in ipairs(workspace.Vehicles:GetChildren()) do
						local ds = veh:FindFirstChild("DriveSeat")
						if ds then
							Config.RadarFarm:FireServer(radarGun, ds.Position, (ds.Position - hrp.Position).Unit)
						end
					end
				end
				task.wait(1)
			end
		end

		-- 2 settings

		enterVehicle()
		task.wait(0.5)
		flyVehicleTo(Vector3.new(-1686.76, 5.88, 2755.92))
		task.wait(0.5)
		exitVehicle()
		task.wait(0.5)
		flyTo(Vector3.new(-1678.27, 5.50, 2795.63), 1.5)
		task.wait(1)
		showNotification("Join police job.", 3)	
		startJob()
		task.wait(0.5)
		flyTo(Vector3.new(-1589.17, 5.63, 2866.31), 3)
		task.wait(0.5)
		showNotification("Spawn police vehicle.", 3)	
		spawnPoliceCar()
		task.wait(0.6)
		enterVehicle()
		showNotification("Fly to farm position.", 4)
		task.wait(0.5)
		flyVehicleTo(Vector3.new(-1203.083984375, 5.394604682922363, 2814.597412109375))
		task.wait(1)
		exitVehicle()
		task.wait(0.5)
		flyTo(Vector3.new(-1145.33, 5.50, 2802.81), 1.2) 
		showNotification("Take Radar Gun.", 2)	
		equipRadarGun()
		showNotification("Start Radar Farm.", 10)	
		startRadarFarm()
	end
})

PoliceTab:AddToggle({
	Name = "Radar Farm",
	Default = false,
	Callback = function(state)
		_G.RadarFarmEnabled = state
		while _G.RadarFarmEnabled do
			local player = game:GetService("Players").LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local radarGun = character:FindFirstChild("Radar Gun")
			if radarGun and Config.RadarFarm then
				for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
					local driveSeat = vehicle:FindFirstChild("DriveSeat")
					if driveSeat then
						Config.RadarFarm:FireServer(radarGun, driveSeat.Position, (driveSeat.Position - character.PrimaryPart.Position).Unit)
					end
				end
			end
			task.wait(1)
		end
	end
})

PoliceTab:AddParagraph("Radar Farm: How It Works?", "To use the auto farming feature, you must join the police team and make sure the radar gun is equipped. Once that's done, you can go AFK.")

local antiAfkEnabled = false
local afkConnection
local afkLoop

PoliceTab:AddToggle({
	Name = "Anti AFK",
	Default = false,
	Save = true,
	Flag = "AntiAFKPoliceTab",
	Callback = function(Value)
		antiAfkEnabled = Value

		if Value then
			local vu = game:service'VirtualUser'
			afkConnection = game:service'Players'.LocalPlayer.Idled:Connect(function()
				vu:CaptureController()
				vu:ClickButton2(Vector2.new())
			end)

			afkLoop = task.spawn(function()
				while antiAfkEnabled do
					task.wait(300) 
					vu:CaptureController()
					vu:ClickButton2(Vector2.new())
				end
			end)
		else
			if afkConnection then
				afkConnection:Disconnect()
				afkConnection = nil
			end
			if afkLoop then
				task.cancel(afkLoop)
				afkLoop = nil
			end
		end
	end
})            


--Bypass

BypassTab:AddButton({
	Name = "Bypass Mod Freecam",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/4JrUuEqn"))()
		game.StarterGui:SetCore("SendNotification", {
			Title = "Bypass Freecam Request";
			Text = "Successfully bypassed Freecam!";
			Duration = 6
		})
	end    
})

BypassTab:AddParagraph("Freecam: How It Works?", "To use the Mod Freecam feature, you must press shift + P.")

-- hier bypass freecam

local BypassSection = BypassTab:AddSection({
	Name = "Only for executors that have a good UNC like Swift, Wave etc."
})


BypassTab:AddLabel("Anti Cheat bypass is soon back")



-- vehicle damge bypass

local vehicleBypassActive = false
local vehicleToggleRef = nil
local oldVehicleNamecall = nil

local function activateVehicleBypass()
	if vehicleBypassActive then return end

	local mt = getrawmetatable(game)
	setreadonly(mt, false)

	oldVehicleNamecall = mt.__namecall

	mt.__namecall = newcclosure(function(self, ...)
		local method = getnamecallmethod()
		if method == "FireServer" and tostring(self.Name) == Config.VehicleDamageEvent then
			return nil
		end
		return oldVehicleNamecall(self, ...)
	end)

	vehicleBypassActive = true
end

local function deactivateVehicleBypass()
	if not vehicleBypassActive then return end

	local mt = getrawmetatable(game)
	setreadonly(mt, false)

	if oldVehicleNamecall then
		mt.__namecall = oldVehicleNamecall
	end

	vehicleBypassActive = false
end

-- Toggle erstellen
vehicleToggleRef = BypassSection:AddToggle({
	Name = "Bypass Vehicle Damage",
	Default = false,
	Save = true,
	Flag = "BypassVehicleDamage",
	Callback = function(state)
		if state then
			if not getrawmetatable then
				OrionLib:MakeNotification({
					Name = "Oops, Failed!",
					Content = "Your executor does not support 'getrawmetatable'.",
					Time = 5
				})
				if vehicleToggleRef then
					vehicleToggleRef:Set(false)
				end
				return
			end
			activateVehicleBypass()
		else
			deactivateVehicleBypass()
		end
	end
})

--Misc

local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local toggleEnabled = false
local humanoid, character, stepSize = nil, nil, 0.3
local Clip, Noclipping, antiArrestConnection, noclipArrestConnection, antiDownedConnection
local spinBotEnabled = false
local AntiTaserEnabled = false

local function setupCharacter()
	character = player.Character or player.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
end

player.CharacterAdded:Connect(setupCharacter)
setupCharacter()


local SafetySection = MiscTab:AddSection({Name = "Safety Options"})

SafetySection:AddButton({
	Name = "Safe Leave (dont work cuffed, Buildings)",
	Callback = function()
		local player = game:GetService("Players").LocalPlayer
		local RunService = game:GetService("RunService")
		local camera = workspace.CurrentCamera

		local attachment, alignPosition, alignOrientation
		local isFlying = false
		local savedCamCFrame

		-- Kamera fixieren
		local function lockCameraFrozen()
			camera.CameraType = Enum.CameraType.Scriptable
			camera.CFrame = savedCamCFrame

			RunService:BindToRenderStep("FrozenCam", Enum.RenderPriority.Camera.Value + 1, function()
				camera.CFrame = savedCamCFrame
			end)
		end

		-- Kamera freigeben
		local function unlockCamera()
			RunService:UnbindFromRenderStep("FrozenCam")
			camera.CameraType = Enum.CameraType.Custom
		end

		-- Fly aktivieren
		local function enableFly()
			local character = player.Character
			if not character then return false end

			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local root = character:FindFirstChild("HumanoidRootPart")

			if not humanoid or not root then return false end

			-- Wenn im Sitz, aufstehen
			if humanoid.SeatPart then
				humanoid.Sit = false
				task.wait(0.1)
			end

			if attachment then attachment:Destroy() end
			if alignPosition then alignPosition:Destroy() end
			if alignOrientation then alignOrientation:Destroy() end

			attachment = Instance.new("Attachment", root)

			alignPosition = Instance.new("AlignPosition", root)
			alignPosition.Attachment0 = attachment
			alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
			alignPosition.MaxForce = 9999999
			alignPosition.Responsiveness = 9999999

			alignOrientation = Instance.new("AlignOrientation", root)
			alignOrientation.Attachment0 = attachment
			alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
			alignOrientation.MaxTorque = 9999999
			alignOrientation.Responsiveness = 9999999

			humanoid.PlatformStand = true
			isFlying = true

			return true
		end

		-- Fly deaktivieren
		local function disableFly()
			isFlying = false
			local character = player.Character
			if character and character:FindFirstChild("Humanoid") then
				character.Humanoid.PlatformStand = false
			end
			if attachment then attachment:Destroy() end
			if alignPosition then alignPosition:Destroy() end
			if alignOrientation then alignOrientation:Destroy() end
		end

		-- Safe Leave Funktion
		local function safeLeave()
			local character = player.Character
			if not character then return end

			-- Kamera merken und einfrieren
			savedCamCFrame = camera.CFrame
			lockCameraFrozen()

			if not enableFly() then return end

			local root = character:FindFirstChild("HumanoidRootPart")
			if not root then return end

			local startY = root.Position.Y
			local targetHeight = root.Position + Vector3.new(0, 9999, 0)

			alignPosition.Position = targetHeight
			alignOrientation.CFrame = CFrame.new(Vector3.new(), Vector3.new(0, 1, 0))

			-- Warten bis oben, dann kicken
			task.spawn(function()
				while isFlying and character and character:FindFirstChild("HumanoidRootPart") do
					local currentY = character.HumanoidRootPart.Position.Y
					if currentY >= startY + 2000 then
						disableFly()
						unlockCamera()
						player:Kick("Vortex Softwares: Save Leave")
						break
					end
					RunService.Heartbeat:Wait()
				end
			end)
		end

		-- Script ausführen
		safeLeave()

	end    
})

SafetySection:AddButton({
	Name = "Self Revive",
	Callback = function()
		local TweenService = game:GetService("TweenService")
		local VirtualInputManager = game:GetService("VirtualInputManager")
		local FARMspeed = 170
		local startPosition = nil

		local function isPlayerDead()
			local player = game.Players.LocalPlayer
			if player and player.Character then
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					return humanoid.Health <= 24
				end
			end
			return false
		end

		local function showNotification(message)
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Vortex",
				Text = message,
				Duration = 5
			})
		end

		local function ensurePlayerInVehicle()
			local player = game.Players.LocalPlayer
			if player and player.Character then
				local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
				if vehicle and player.Character:FindFirstChild("Humanoid") then
					local humanoid = player.Character:FindFirstChild("Humanoid")
					if humanoid and not humanoid.SeatPart then
						local driveSeat = vehicle:FindFirstChild("DriveSeat")
						if driveSeat then
							driveSeat:Sit(humanoid)
						end
					end
				end
			end
		end

		local function tweenToCFrame(model, targetCFrame, duration, onComplete)
			local info = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			local CFrameValue = Instance.new("CFrameValue")
			CFrameValue.Value = model:GetPrimaryPartCFrame()

			CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
				model:SetPrimaryPartCFrame(CFrameValue.Value)
				model.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
			end)

			local tween = TweenService:Create(CFrameValue, info, { Value = targetCFrame })
			tween:Play()
			tween.Completed:Connect(function()
				CFrameValue:Destroy()
				if onComplete then onComplete() end
			end)
		end

		local function flyVehicleTo(targetCFrame, callback)
			local player = game.Players.LocalPlayer
			local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
			if not vehicle then return end

			local driveSeat = vehicle:FindFirstChild("DriveSeat")
			local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
			if humanoid and driveSeat then
				if not humanoid.SeatPart then
					driveSeat:Sit(humanoid)
				end
			end

			if not vehicle.PrimaryPart then
				vehicle.PrimaryPart = vehicle:FindFirstChild("Mass", true)
			end

			local startPos = vehicle.PrimaryPart.Position
			local targetPos = targetCFrame.Position

			-- Flughöhe während des Transports
			local flightHeight = -1

			-- Sofort auf Flughöhe -1 setzen
			local startFlightPos = Vector3.new(startPos.X, flightHeight, startPos.Z)
			vehicle:SetPrimaryPartCFrame(CFrame.new(startFlightPos))

			-- Zielposition für den Flug (auf Flughöhe -1)
			local flightTarget = Vector3.new(targetPos.X, flightHeight, targetPos.Z)

			-- Berechne Dauer für den Flug
			local distance = (Vector3.new(startPos.X, 0, startPos.Z) - Vector3.new(flightTarget.X, 0, flightTarget.Z)).Magnitude
			local duration = distance / FARMspeed

			-- Erstelle TweenInfo
			local info = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			local CFrameValue = Instance.new("CFrameValue")
			CFrameValue.Value = vehicle:GetPrimaryPartCFrame()

			CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
				-- Während des Fluges Y-Koordinate auf -1 fixieren
				local currentPos = CFrameValue.Value.Position
				local fixedCFrame = CFrame.new(currentPos.X, flightHeight, currentPos.Z)
				vehicle:SetPrimaryPartCFrame(fixedCFrame)
				vehicle.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
			end)

			local tween = TweenService:Create(CFrameValue, info, { Value = CFrame.new(flightTarget) })
			tween:Play()

			tween.Completed:Connect(function()
				CFrameValue:Destroy()
				-- Sobald angekommen, auf finale Höhe setzen
				vehicle:SetPrimaryPartCFrame(targetCFrame)

				if callback then callback() end
			end)
		end

		local function goToHospitalAndSit()
			local player = game.Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()

			character:MoveTo(Vector3.new(-107.427, 7.648, 1073.643))
			wait(1)

			local buildings = workspace:FindFirstChild("Buildings")

			local hospital = buildings:FindFirstChild("Hospital")

			local bed = hospital:FindFirstChild("HospitalBed")

			local seat = bed:FindFirstChild("Seat")

			character:MoveTo(seat.Position + Vector3.new(0, 2, 0))
			wait(0.7)

			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				seat:Sit(humanoid)
			else
			end
		end

		local function pressSpace()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
			wait(0.1)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
			wait(0.2)
		end

		local player = game.Players.LocalPlayer

		if isPlayerDead() then
			startPosition = player.Character and player.Character.PrimaryPart and player.Character.PrimaryPart.CFrame or nil

			ensurePlayerInVehicle()
			wait(0.5)

			local hospitalCarPosition = CFrame.new(-89.70, 5.88, 1055.77)

			flyVehicleTo(hospitalCarPosition, function()
				wait(1)
				player.Character:MoveTo(Vector3.new(-107.427, 7.648, 1073.643))
				wait(0.5)
				goToHospitalAndSit()

				task.spawn(function()
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					while humanoid and humanoid.Health <= 27 do
						wait(1)
						humanoid = player.Character:FindFirstChildOfClass("Humanoid") -- aktualisieren
					end

					pressSpace()
					wait(0.5)
					ensurePlayerInVehicle()
					ensurePlayerInVehicle()
					wait(0.5)

					if startPosition then
						flyVehicleTo(startPosition)
					end
				end)
			end)
		else
			showNotification("You are not dead.")
		end

	end    
})

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local BlurEffect = Lighting:FindFirstChild("BlurEffect") or Lighting:FindFirstChildOfClass("BlurEffect")

SafetySection:AddToggle({
	Name = "Anti Flashbang",
	Default = false,
	Save = true,
	Flag = "AntiFlashbang",
	Callback = function(Value)
		if Value then
			-- BlurEffect in Workspace verschieben
			if BlurEffect then
				BlurEffect.Parent = Workspace
			else
				BlurEffect = Lighting:FindFirstChild("BlurEffect") or Lighting:FindFirstChildOfClass("BlurEffect")
				if BlurEffect then
					BlurEffect.Parent = Workspace
				end
			end
		else
			-- BlurEffect zurück zu Lighting verschieben
			if BlurEffect then
				BlurEffect.Parent = Lighting
			end
		end
	end
})

SafetySection:AddToggle({
	Name = "Anti Dying",
	Default = false,
	Callback = function(state)
		local player = game.Players.LocalPlayer

		if state then
			local hasSatOnce = false

			local function ensurePlayerInVehicle(character)
				local humanoid = character:FindFirstChild("Humanoid")
				if not humanoid then return end

				local vehicle = workspace:FindFirstChild("Vehicles") and workspace.Vehicles:FindFirstChild(player.Name)
				if not vehicle then return end

				if humanoid.SeatPart and humanoid.SeatPart:IsDescendantOf(vehicle) then return end

				local seat = vehicle:FindFirstChild("DriveSeat")
				if seat then
					seat:Sit(humanoid)
				end
			end

			local function monitorCharacter(character)
				local humanoid = character:WaitForChild("Humanoid", 5)
				if not humanoid then return end
				hasSatOnce = false -- Zurücksetzen bei neuem Charakter

				humanoid.HealthChanged:Connect(function(currentHealth)
					if currentHealth <= 40 and not hasSatOnce then
						ensurePlayerInVehicle(character)
						hasSatOnce = true
					end
				end)
			end

			getfenv().antiDyingConnection = player.CharacterAdded:Connect(monitorCharacter)

			if player.Character then
				monitorCharacter(player.Character)
			end
		else
			if getfenv().antiDyingConnection then
				getfenv().antiDyingConnection:Disconnect()
				getfenv().antiDyingConnection = nil
			end
		end
	end
})


SafetySection:AddToggle({
	Name = "Anti Falldamage",
	Default = false,
	Callback = function(state)
		if state then
			getfenv().nofall = runService.RenderStepped:Connect(function()
				local root = character and character:FindFirstChild("HumanoidRootPart")
				if root and root.Velocity.Y < -30 then
					local ray = workspace:Raycast(root.Position, Vector3.new(0, -20, 0))
					if ray then root.Velocity = Vector3.zero end
				end
			end)
		elseif getfenv().nofall then
			getfenv().nofall:Disconnect()
			getfenv().nofall = nil
		end
	end
})

local running = false
local connection

local running = false
local connection
local noclipConnection

SafetySection:AddToggle({
	Name = "Anti Arrest",
	Default = false,
	Callback = function(state)
		running = state

		if running then
			local player = game.Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid")
			local rootPart = character:WaitForChild("HumanoidRootPart")

			connection = game:GetService("RunService").Heartbeat:Connect(function()
				local nearestPolice = nil
				local shortestDistance = math.huge

				for _, p in pairs(game.Players:GetPlayers()) do
					if p.Team and p.Team.Name == "Police" and p.Character then
						local policeRoot = p.Character:FindFirstChild("HumanoidRootPart")
						if policeRoot then
							local dist = (rootPart.Position - policeRoot.Position).Magnitude
							if dist < shortestDistance then
								shortestDistance = dist
								nearestPolice = policeRoot
							end
						end
					end
				end

				if nearestPolice and shortestDistance <= 30 then
					local fleeDirection = (rootPart.Position - nearestPolice.Position).Unit
					local targetPosition = rootPart.Position + fleeDirection * 10 + Vector3.new(0, 2, 0)
					humanoid:MoveTo(targetPosition)
				end
			end)

			noclipConnection = game:GetService("RunService").Stepped:Connect(function()
				for _, part in pairs(character:GetDescendants()) do
					if part:IsA("BasePart") and part.CanCollide then
						part.CanCollide = false
					end
				end
			end)

		else
			if connection then connection:Disconnect() connection = nil end
			if noclipConnection then noclipConnection:Disconnect() noclipConnection = nil end
		end
	end
})

local antiDownedConnection
SafetySection:AddToggle({
	Name = "Anti Downed",
	Default = false,
	Callback = function(state)
		if state then
			local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
			antiDownedConnection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				humanoid.Health = 100
			end)
		else
			if antiDownedConnection then
				antiDownedConnection:Disconnect()
				antiDownedConnection = nil
			end
		end
	end 
})

SafetySection:AddToggle({
	Name = "Anti Taser",
	Default = false,
	Save = true,
	Flag = "AntiTaser",
	Callback = function(state)
		AntiTaserEnabled = state
	end
})

runService.Heartbeat:Connect(function()
	if AntiTaserEnabled then
		local char = player.Character
		if char and char:GetAttribute("Tased") == true then
			char:SetAttribute("Tased", false)
		end
	end
end)

-- movement

local animationId = 9357137817
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "http://www.roblox.com/asset/?id=" .. animationId
local animationTrack = humanoid:LoadAnimation(animation)
animationTrack.Looped = true

local animationEnabled = false
local animationToggle

-- Animation Funktionen
local function enableAnimation()
	if animationEnabled then return end
	animationTrack:Play()
	animationEnabled = true
	if animationToggle then
		animationToggle:Set(true)
	end
end

local function disableAnimation()
	if not animationEnabled then return end
	animationTrack:Stop()
	animationEnabled = false
	if animationToggle then
		animationToggle:Set(false)
	end
end

local function toggleAnimation()
	local function waitForStand()
		while humanoid.SeatPart do
			wait(0.1)
		end
	end

	if humanoid.SeatPart then
		disableAnimation()
		waitForStand()
	end

	if animationEnabled then
		disableAnimation()
	else
		enableAnimation()
	end
end

-- Toggle in UI
animationToggle = Movement:AddToggle({
	Name = "Fake Cuffed",
	Default = false,
	Callback = function(Value)
		if Value then
			enableAnimation()
		else
			disableAnimation()
		end
	end
})

-- Keybind
Movement:AddBind({
	Name = "Animation Toggle Keybind",
	Default = Enum.KeyCode.F6,
	Save = true,
	Flag = "AnimationToggleKeybind",
	Hold = false,
	Callback = toggleAnimation
})

-- fake dead

local animationId = 11019608524
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local animation = Instance.new("Animation")
animation.AnimationId = "http://www.roblox.com/asset/?id=" .. animationId
local animationTrack = humanoid:LoadAnimation(animation)
animationTrack.Looped = true

local animationEnabled = false
local rotateEnabled = false

-- UI-Referenzen (werden später gesetzt)
local animationToggle

-- Hilfsfunktion zur Rotation
local function applyRotation(enabled)
	if enabled then
		-- Holt die Blickrichtung des HumanoidRootParts
		local lookVector = humanoidRootPart.CFrame.LookVector

		-- Berechnet die Rotation basierend auf der Blickrichtung
		local forwardCFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + lookVector)

		-- Kippen um -90° nach vorne
		humanoidRootPart.CFrame = forwardCFrame * CFrame.Angles(math.rad(-90), 0, 0)

		humanoid.PlatformStand = true
	else
		humanoid.PlatformStand = false
		humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position)
	end
end


-- Animation Funktionen
local function enableAnimation()
	if animationEnabled then return end -- verhindert doppeltes Aktivieren
	animationTrack:Play()
	animationEnabled = true
	if rotateEnabled then
		applyRotation(true)
	end
	if animationToggle then
		animationToggle:Set(true) -- UI Toggle synchronisieren
	end
end

local function disableAnimation()
	if not animationEnabled then return end -- verhindert doppeltes Deaktivieren
	animationTrack:Stop()
	animationEnabled = false
	applyRotation(false)
	if animationToggle then
		animationToggle:Set(false) -- UI Toggle synchronisieren
	end
end

local function toggleAnimation()
	-- Wenn auf einem Sitz, Animation erst nach Aufstehen starten
	local function waitForStand()
		while humanoid.SeatPart do
			wait(0.1)
		end
	end

	if humanoid.SeatPart then
		disableAnimation()  -- Animation vorher stoppen
		waitForStand()      -- Warten bis Spieler aufsteht
	end

	if animationEnabled then
		disableAnimation()
	else
		enableAnimation()
	end
end

-- Toggles
animationToggle = Movement:AddToggle({
	Name = "Fake Dead",
	Default = false,
	Callback = function(Value)
		if Value then
			enableAnimation()
		else
			disableAnimation()
		end
	end
})

Movement:AddToggle({
	Name = "Lie Down",
	Default = true,
	Callback = function(Value)
		rotateEnabled = Value
		if animationEnabled then
			applyRotation(Value)
		end
	end
})

-- Keybinds
Movement:AddBind({
	Name = "Animation Toggle Keybind",
	Default = Enum.KeyCode.F5,
	Save = true,
	Flag = "AnimationToggleKeybind",
	Hold = false,
	Callback = toggleAnimation
})

local MovementSection = Movement:AddSection({Name = "Movement"})

MovementSection:AddToggle({
	Name = "Speed Hack",
	Default = false,
	Callback = function(Value) toggleEnabled = Value end
})

MovementSection:AddBind({
	Name = "Speed Keybind",
	Save = true,
	Flag = "SpeedHackKeybind",
	Default = Enum.KeyCode.T,
	Hold = false,
	Callback = function() toggleEnabled = not toggleEnabled end
})

MovementSection:AddSlider({
	Name = "Speed",
	Min = 0.1,
	Max = 0.3,
	Default = 0.1,
	Save = true,
	Flag = "SpeedHackSlider",
	Increment = 0.05,
	ValueName = "Speed",
	Callback = function(Value) stepSize = Value end
})

runService.Heartbeat:Connect(function()
	if toggleEnabled and humanoid and character then
		local direction = humanoid.MoveDirection
		if direction.Magnitude > 0 then
			character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame + direction.Unit * stepSize)
		end
	end
end)

MovementSection:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(Value)
		Clip = not Value
		if Value then
			Noclipping = runService.Stepped:Connect(function()
				for _, part in pairs(player.Character:GetDescendants()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
			end)
		elseif Noclipping then
			Noclipping:Disconnect()
			Noclipping = nil
		end
	end
})

MovementSection:AddButton({
	Name = "Escape Vehicle",
	Callback = function()
		local char = player.Character
		local hum = char and char:FindFirstChild("Humanoid")
		if hum and hum.SeatPart then
			hum.Sit = false
			wait(0.1) -- kleine Verzögerung, damit Sit=false registriert wird
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
})

MovementSection:AddButton({
	Name = "Steal Nearest E-Bike",
	Callback = function()

		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart

		local function isUUID(name)
			local pattern = "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$"
			return string.match(name, pattern) ~= nil
		end

		local function onCharacterAdded(newCharacter)
			character = newCharacter
			humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		end

		player.CharacterAdded:Connect(onCharacterAdded)
		if player.Character then
			onCharacterAdded(player.Character)
		end

		local vehiclesFolder = workspace:WaitForChild("Vehicles")

		local function findNearestDriveSeat()
			local closestDistance = math.huge
			local closestSeat = nil

			for _, vehicle in ipairs(vehiclesFolder:GetChildren()) do
				if isUUID(vehicle.Name) then
					local driveSeat = vehicle:FindFirstChild("DriveSeat", true)
					if driveSeat and driveSeat:IsA("Seat") then
						local distance = (driveSeat.Position - humanoidRootPart.Position).Magnitude
						if distance < closestDistance then
							closestDistance = distance
							closestSeat = driveSeat
						end
					end
				end
			end

			return closestSeat
		end

		local seat = findNearestDriveSeat()
		if seat then
			seat:Sit(character:WaitForChild("Humanoid"))
		end
	end
})

local spinBotEnabled = false
local spinSpeed = 20000000000000

MovementSection:AddToggle({
	Name = "Spinbot",
	Default = false,
	Callback = function(Value)
		spinBotEnabled = Value
	end
})

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
	if spinBotEnabled then
		local player = game.Players.LocalPlayer
		local character = player.Character
		if character and character:FindFirstChild("HumanoidRootPart") then
			local root = character.HumanoidRootPart
			local currentCFrame = root.CFrame
			local rotation = CFrame.Angles(0, math.rad(spinSpeed), 0)
			root.CFrame = currentCFrame * rotation
		end
	end
end)

local UtilitySection = MiscTab:AddSection({Name = "Utility"})

local antiSpeedCamEnabled = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local vehicleFolder = workspace:WaitForChild("Vehicles")

local DETECTION_DISTANCE = 70
local TELEPORT_DISTANCE = 125
local CHECK_INTERVAL = 0.1
local TELEPORT_COOLDOWN = 3

local lastTeleportTime = 0
local speedCameraConnection
local lastCheck = 0

local function getPlayerVehicle()
	return vehicleFolder:FindFirstChild(LocalPlayer.Name)
end

local function teleportVehicleForward(vehicle, distance)
	if not vehicle or not vehicle.PrimaryPart then return end
	local currentCFrame = vehicle.PrimaryPart.CFrame
	local lookDirection = currentCFrame.LookVector
	local horizontal = Vector3.new(lookDirection.X, 0, lookDirection.Z).Unit
	local offset = horizontal * distance
	local newPosition = vehicle.PrimaryPart.Position + offset
	local newCFrame = CFrame.new(newPosition, newPosition + horizontal)
	vehicle:SetPrimaryPartCFrame(newCFrame)
end

local function findAllSpeedCameras()
	local speedCameras = {}
	local speedCamerasFolder = workspace:FindFirstChild("SpeedCameras")
	if not speedCamerasFolder then return speedCameras end

	local mobileFolder = speedCamerasFolder:FindFirstChild("Mobile")
	if mobileFolder then
		for _, child in pairs(mobileFolder:GetChildren()) do
			if child:IsA("Model") and child.Name == "MobileSpeedCamera" then
				local mainPart = child.PrimaryPart or child:FindFirstChildOfClass("Part")
				if mainPart then
					if not child.PrimaryPart then
						child.PrimaryPart = mainPart
					end
					table.insert(speedCameras, child)
				end
			end
		end
	end

	local stationaryFolder = speedCamerasFolder:FindFirstChild("Stationary")
	if stationaryFolder then
		for _, stationaryCamera in pairs(stationaryFolder:GetChildren()) do
			if stationaryCamera:IsA("Model") and stationaryCamera.Name == "StationarySpeedCamera" then
				for _, child in pairs(stationaryCamera:GetChildren()) do
					if child:IsA("Model") and child.Name == "SpeedCamera" then
						local mainPart = child.PrimaryPart or child:FindFirstChildOfClass("Part")
						if mainPart then
							if not child.PrimaryPart then
								child.PrimaryPart = mainPart
							end
							table.insert(speedCameras, child)
						end
					end
				end
			end
		end
	end

	return speedCameras
end

local function monitorSpeedCameras()
	local vehicle = getPlayerVehicle()
	if not vehicle or not vehicle.PrimaryPart then return end

	local vehiclePosition = vehicle.PrimaryPart.Position
	local speedCameras = findAllSpeedCameras()

	local currentTime = tick()
	if currentTime - lastTeleportTime < TELEPORT_COOLDOWN then return end

	for _, camera in pairs(speedCameras) do
		if camera and camera.PrimaryPart then
			local cameraPosition = camera.PrimaryPart.Position
			local distance = (vehiclePosition - cameraPosition).Magnitude
			if distance < DETECTION_DISTANCE then
				teleportVehicleForward(vehicle, TELEPORT_DISTANCE)
				lastTeleportTime = currentTime
				break
			end
		end
	end
end



UtilitySection:AddToggle({
	Name = "Anti Speed Camera",
	Default = false,
	Callback = function(Value)
		if Value then
			speedCameraConnection = RunService.Heartbeat:Connect(function()
				local currentTime = tick()
				if currentTime - lastCheck >= CHECK_INTERVAL then
					lastCheck = currentTime
					monitorSpeedCameras()
				end
			end)
		else
			if speedCameraConnection then
				speedCameraConnection:Disconnect()
				speedCameraConnection = nil
			end
		end
	end
})

game.Players.PlayerRemoving:Connect(function(player)
	if player == LocalPlayer and speedCameraConnection then
		speedCameraConnection:Disconnect()
		speedCameraConnection = nil
	end
end)

-- Funktion zum Server-Hop
local function ServerHop()
	local HttpService = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")
	local PlaceId = game.PlaceId
	local JobIds = {}

	local success, servers = pcall(function()
		return HttpService:JSONDecode(game:HttpGet(
			"https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
			))
	end)

	if success and servers and servers.data then
		for _, server in pairs(servers.data) do
			if server.playing < server.maxPlayers and server.id ~= game.JobId then
				table.insert(JobIds, server.id)
			end
		end

		if #JobIds > 0 then
			TeleportService:TeleportToPlaceInstance(PlaceId, JobIds[math.random(1, #JobIds)], game.Players.LocalPlayer)
		else
			OrionLib:MakeNotification({
				Name = "Fehler",
				Content = "Keine freien Server gefunden!",
				Time = 5
			})
		end
	else
		OrionLib:MakeNotification({
			Name = "Fehler",
			Content = "Serverdaten konnten nicht geladen werden.",
			Time = 5
		})
	end
end

UtilitySection:AddButton({
	Name = "Change Server",
	Callback = ServerHop
})

UtilitySection:AddButton({
	Name = "INF Stamina",
	Callback = function()
		if not getfenv().firsttime then
			getfenv().firsttime = true
			for _, v in pairs(getgc(true)) do
				if type(v) == "function" and getinfo(v).name == "setStamina" then
					hookfunction(v, function(...) return ..., math.huge end)
					break
				end
			end
		end
	end
})

UtilitySection:AddButton({
	Name = "Reset (lose all weapons)",
	Callback = function()
		local hum = player.Character and player.Character:FindFirstChild("Humanoid")
		if hum then hum.Health = 0 end
	end
})

local flyingSpeed = 50
local isFlying = false
local attachment, alignPosition, alignOrientation
local player = game:GetService("Players").LocalPlayer

local function canFly()
	return player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("Humanoid").SeatPart == nil
end

local function enableFly()
	if not canFly() then return false end

	local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
	local humanoid = player.Character:FindFirstChild("Humanoid")

	if attachment then attachment:Destroy() end
	if alignPosition then alignPosition:Destroy() end
	if alignOrientation then alignOrientation:Destroy() end

	attachment = Instance.new("Attachment")
	attachment.Parent = humanoidRootPart

	alignPosition = Instance.new("AlignPosition")
	alignPosition.Attachment0 = attachment
	alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
	alignPosition.MaxForce = 5000
	alignPosition.Responsiveness = 45
	alignPosition.Parent = humanoidRootPart

	alignOrientation = Instance.new("AlignOrientation")
	alignOrientation.Attachment0 = attachment
	alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
	alignOrientation.MaxTorque = 5000
	alignOrientation.Responsiveness = 45
	alignOrientation.Parent = humanoidRootPart

	humanoid.PlatformStand = true
	isFlying = true

	local lastPosition = humanoidRootPart.Position
	alignPosition.Position = lastPosition

	local function flyLoop()
		while isFlying and player.Character and humanoidRootPart and humanoid do
			local moveDirection = Vector3.new()
			local camCFrame = workspace.CurrentCamera.CFrame

			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
				moveDirection += camCFrame.LookVector
			end
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
				moveDirection -= camCFrame.LookVector
			end
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
				moveDirection -= camCFrame.RightVector
			end
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
				moveDirection += camCFrame.RightVector
			end

			if moveDirection.Magnitude > 0 then
				moveDirection = moveDirection.Unit
				local newPosition = lastPosition + (moveDirection * flyingSpeed * game:GetService("RunService").Heartbeat:Wait())
				alignPosition.Position = newPosition
				lastPosition = newPosition
			end

			alignOrientation.CFrame = CFrame.new(Vector3.new(), camCFrame.LookVector)
			game:GetService("RunService").Heartbeat:Wait()
		end
	end

	spawn(flyLoop)
	return true
end

local function disableFly()
	isFlying = false
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character:FindFirstChild("Humanoid").PlatformStand = false
	end
	if attachment then attachment:Destroy() end
	if alignPosition then alignPosition:Destroy() end
	if alignOrientation then alignOrientation:Destroy() end
end

local FlyToggle = MiscTab:AddToggle({
	Name = "Player Fly ",
	Default = false,
	Save = true,
	Flag = "Fly Toggle",
	Callback = function(Value)
		if Value then
			if not enableFly() then
				FlyToggle:Set(false)
			end
		else
			disableFly()
		end
	end    
})

local FlyKeybind = MiscTab:AddBind({
	Name = "Fly Bind",
	Default = Enum.KeyCode.V,
	Save = true,
	Flag = "FlyKeybind",
	Callback = function()
		if isFlying then
			disableFly()
			FlyToggle:Set(false)
		else
			if enableFly() then
				FlyToggle:Set(true)
			else
				FlyToggle:Set(false)
			end
		end
	end    
})

local SpeedSlider = MiscTab:AddSlider({
	Name = "Fly Speed",
	Min = 5,
	Max = 55,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Save = true,
	Flag = "FlySpeed",
	Callback = function(Value)
		flyingSpeed = Value
	end    
})

player.CharacterAdded:Connect(function()
	if isFlying then
		task.wait(1)
		if FlyToggle.Value then
			enableFly()
		end
	end
end)

local BankStatusLabel = InfoTab:AddLabel("Checking Bank...")
local ClubStatusLabel = InfoTab:AddLabel("Checking Club...")

local function checkBankStatus()
	local success, result = pcall(function()
		local Robberies = workspace:FindFirstChild("Robberies")
		if not Robberies then return false end

		local BankRobbery = Robberies:FindFirstChild("BankRobbery")
		if not BankRobbery then return false end

		local LightGreen = BankRobbery:FindFirstChild("LightGreen")
		if not LightGreen then return false end

		return LightGreen.Color == Color3.fromRGB(73, 147, 0)
	end)

	local isOpen = success and result

	if isOpen then
		BankStatusLabel:Set("Bank: GREEN")
	else
		BankStatusLabel:Set("Bank: RED")
	end
end

local function checkClubStatus()
	local success, safeDoor = pcall(function()
		return game.workspace:WaitForChild("Robberies", 5):WaitForChild("Club Robbery", 5):WaitForChild("Club", 5):WaitForChild("Door", 5)
	end)

	if not success or not safeDoor then
		ClubStatusLabel:Set("Club: UNKNOWN")
		return
	end

	local realDoor = safeDoor:IsA("BasePart") and safeDoor or safeDoor:FindFirstChildWhichIsA("BasePart")
	if not realDoor then
		ClubStatusLabel:Set("Club: UNKNOWN")
		return
	end

	local rotation = realDoor.Orientation
	if rotation == Vector3.new(0, 0, 0) then
		ClubStatusLabel:Set("Club: ROBBET")
	else
		ClubStatusLabel:Set("Club: ROBBABLE")
	end
end

local Section = InfoTab:AddSection({
	Name = "Player"
})

local totalPlayersLabel = InfoTab:AddLabel("Total Players: " .. #game.Players:GetPlayers())

game.Players.PlayerAdded:Connect(function()
	totalPlayersLabel:Set("Total Players: " .. #game.Players:GetPlayers())
end)

game.Players.PlayerRemoving:Connect(function()
	totalPlayersLabel:Set("Total Players: " .. #game.Players:GetPlayers())
end)

for _, team in pairs(game:GetService("Teams"):GetChildren()) do
	local teamLabel = InfoTab:AddLabel(team.Name .. ": " .. #team:GetPlayers() .. " Players")

	team.PlayerAdded:Connect(function()
		teamLabel:Set(team.Name .. ": " .. #team:GetPlayers() .. " Players")
	end)

	team.PlayerRemoved:Connect(function()
		teamLabel:Set(team.Name .. ": " .. #team:GetPlayers() .. " Players")
	end)
end

local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
	pcall(checkBankStatus)
	pcall(checkClubStatus)
end)

-- ganz am Ende deines Scripts
pcall(function()
	OrionLib:Init()
end)
