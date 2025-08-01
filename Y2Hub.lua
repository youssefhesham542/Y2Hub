--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
if game.PlaceId ~= 4924922222 then
	game.Players.LocalPlayer:Kick("❌ يعمل فقط في Brookhaven!")
	return
end

setclipboard("https://www.tiktok.com/@y_s4620?_t=ZS-8y2vGa22tCj&_r=1")

local texts = {
	AR = {
		Scripts = "قائمة الاسكربتات", Control = "تحكم الشخصية", Protection = "الحماية",
		Spam = "اسبام الشات", Troll = "التخريب", Bang = "Bang الواقعي", Invisible = "الاختفاء",
		Music = "الأغاني", Skins = "نسخ الاسكنات", Tools = "الأدوات", Server = "السيرفر",
		FX = "التأثيرات", VIP = "مميزات VIP", About = "حول", Close = "إغلاق"
	},
	EN = {
		Scripts = "Scripts", Control = "Character", Protection = "Protection", Spam = "Chat Spam",
		Troll = "Troll", Bang = "Bang", Invisible = "Invisibility", Music = "Music",
		Skins = "Skins", Tools = "Tools", Server = "Server", FX = "Effects", VIP = "VIP",
		About = "About", Close = "Close"
	}
}

-- واجهة اختيار اللغة
local TweenService = game:GetService("TweenService")
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "LanguageUI"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 420, 0, 260)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 18)

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)
closeBtn.MouseButton1Click:Connect(function()
	mainFrame:Destroy()
end)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = "اختر اللغة | Choose Language"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 28

local arabicBtn = Instance.new("TextButton", mainFrame)
arabicBtn.Size = UDim2.new(0, 160, 0, 60)
arabicBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
arabicBtn.Text = "العربية"
arabicBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
arabicBtn.TextColor3 = Color3.new(1, 1, 1)
arabicBtn.Font = Enum.Font.GothamBold
arabicBtn.TextSize = 24
arabicBtn.BorderSizePixel = 0
Instance.new("UICorner", arabicBtn).CornerRadius = UDim.new(0, 12)
local arabicStroke = Instance.new("UIStroke", arabicBtn)
arabicStroke.Thickness = 3
arabicStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
arabicStroke.Color = Color3.fromRGB(255, 0, 0)

local englishBtn = arabicBtn:Clone()
englishBtn.Parent = mainFrame
englishBtn.Position = UDim2.new(0.55, 0, 0.6, 0)
englishBtn.Text = "English"
local englishStroke = englishBtn.UIStroke

local function realisticRGB(stroke)
	local colors = {
		Color3.fromRGB(255, 90, 90), Color3.fromRGB(255, 180, 0),
		Color3.fromRGB(100, 255, 100), Color3.fromRGB(80, 200, 255),
		Color3.fromRGB(130, 100, 255), Color3.fromRGB(255, 80, 200),
	}
	local i = 1
	while stroke and stroke.Parent do
		local nextColor = colors[(i % #colors) + 1]
		local tween = TweenService:Create(stroke, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Color = nextColor
		})
		tween:Play()
		tween.Completed:Wait()
		i += 1
	end
end

task.spawn(function() realisticRGB(arabicStroke) end)
task.spawn(function() realisticRGB(englishStroke) end)

local welcomeSound = Instance.new("Sound")
welcomeSound.SoundId = "rbxassetid://9118025346"
welcomeSound.Volume = 1
welcomeSound.Parent = workspace
welcomeSound:Play()
welcomeSound.Ended:Connect(function()
	welcomeSound:Destroy()
end)

function LoadUI(lang)
	screenGui:Destroy()
	local tx = texts[lang]
	local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
	local win = OrionLib:MakeWindow({Name="Y2 Hub",IntroEnabled=true,IntroText="Y2 Hub"})
	local plr = game.Players.LocalPlayer
	local function players() local l = {} for _,p in pairs(game.Players:GetPlayers()) do if p~=plr then table.insert(l,p.Name) end end return l end

	local s = win:MakeTab({Name=tx.Scripts})
	s:AddButton({Name="Infinite Yield",Callback=function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end})
	s:AddButton({Name="CMD-X",Callback=function()loadstring(game:HttpGet('https://raw.githubusercontent.com/CMD-X/CMD-X/refs/heads/master/Source'))()end})
	s:AddButton({Name="Dex Explorer",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()end})

	local c = win:MakeTab({Name=tx.Control})
	c:AddTextbox({Name="WalkSpeed",Default="16",Callback=function(v)local h=plr.Character and plr.Character:FindFirstChild("Humanoid")if h then h.WalkSpeed=tonumber(v)or 16 end end})
	c:AddTextbox({Name="JumpPower",Default="50",Callback=function(v)local h=plr.Character and plr.Character:FindFirstChild("Humanoid")if h then h.JumpPower=tonumber(v)or 50 end end})

	local p = win:MakeTab({Name=tx.Protection})
	p:AddToggle({Name="Anti-AFK",Default=false,Callback=function(s)if s then plr.Idled:Connect(function()game.VirtualUser:ClickButton2(Vector2.new())end)end end})
	p:AddToggle({Name="Boost FPS",Callback=function(s)if s then game.Lighting.GlobalShadows=false settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 else game.Lighting.GlobalShadows=true end end})

	local sp = win:MakeTab({Name=tx.Spam})
	local msg,count="Hello",10
	sp:AddTextbox({Name="Message",Default="Hello",Callback=function(v)msg=v end})
	sp:AddTextbox({Name="Count",Default="10",Callback=function(v)count=tonumber(v)or 10 end})
	sp:AddButton({Name="Start",Callback=function()spawn(function()for i=1,count do game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All")wait(.5)end end)end})

	local tr = win:MakeTab({Name=tx.Troll})
	local target
	tr:AddDropdown({Name="Player",Options=players(),Callback=function(v)target=v end})
	tr:AddButton({Name="Refresh",Callback=function()tr:Refresh(players(),true)end})
	tr:AddButton({Name="Freeze Player",Callback=function()if target then local tp=game.Players:FindFirstChild(target)if tp and tp.Character then tp.Character:BreakJoints()end end end})

	local b = win:MakeTab({Name=tx.Bang})
	local bangOn = false local bangTarget
	b:AddDropdown({Name="Player",Options=players(),Callback=function(v)bangTarget=v end})
	b:AddToggle({Name="Bang",Callback=function(s)
		bangOn=s
		if bangOn and bangTarget then
			local tp=game.Players:FindFirstChild(bangTarget)
			local ch=plr.Character
			if tp and tp.Character and ch then
				local hum=ch:FindFirstChild("Humanoid")
				local a=Instance.new("Animation")
				a.AnimationId="rbxassetid://148840371"
				local track=hum:LoadAnimation(a)
				track:Play()
				spawn(function()
					while bangOn and tp and tp.Character do
						ch:MoveTo(tp.Character.HumanoidRootPart.Position-Vector3.new(0,0,1))
						wait(.1)
					end
					track:Stop()
				end)
			end
		end
	end})

	local inv = win:MakeTab({Name=tx.Invisible})
	inv:AddButton({Name="Enable",Callback=function()for _,p in pairs(plr.Character:GetDescendants())do if p:IsA("BasePart")then p.Transparency=1 end end end})
	inv:AddButton({Name="Disable",Callback=function()for _,p in pairs(plr.Character:GetDescendants())do if p:IsA("BasePart")then p.Transparency=0 end end end})

	local mu = win:MakeTab({Name=tx.Music})
	local id,sound=0,nil
	mu:AddTextbox({Name="Song ID",Default="",Callback=function(v)id=tonumber(v)or 0 end})
	mu:AddToggle({Name="Play",Callback=function(s)
		if s and id>0 then
			if sound then sound:Destroy()end
			sound=Instance.new("Sound",game.SoundService)
			sound.SoundId="rbxassetid://"..id
			sound.Volume=5
			sound.Looped=true
			sound:Play()
		else
			if sound then sound:Destroy()end
		end
	end})

	local sk = win:MakeTab({Name=tx.Skins})
	local skinTarget
	sk:AddDropdown({Name="Player",Options=players(),Callback=function(v)skinTarget=v end})
	sk:AddButton({Name="Copy Skin",Callback=function()
		if skinTarget then
			local p=game.Players:FindFirstChild(skinTarget)
			if p then
				local desc=game.Players:GetHumanoidDescriptionFromUserId(p.UserId)
				plr.Character.Humanoid:ApplyDescription(desc)
			end
		end
	end})

	local to = win:MakeTab({Name=tx.Tools})
	to:AddButton({Name="Create Sword",Callback=function()local t=Instance.new("Tool")t.RequiresHandle=false t.Name="Sword"t.Parent=plr.Backpack end})

	local se = win:MakeTab({Name=tx.Server})
	se:AddButton({Name="Rejoin",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId,plr)end})
	se:AddButton({Name="Server Hop",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId)end})

	local fx = win:MakeTab({Name=tx.FX})
	fx:AddButton({Name="Red Fog",Callback=function()game.Lighting.FogEnd=50 game.Lighting.FogColor=Color3.new(1,0,0)end})

	local vip = win:MakeTab({Name=tx.VIP})
	vip:AddButton({Name="Rainbow Screen",Callback=function()spawn(function()while wait(.2)do game.Lighting.Ambient=Color3.fromHSV(tick()%5/5,1,1)end end)end})

	local ab = win:MakeTab({Name=tx.About})
	ab:AddParagraph("Y2 Hub","Made for Brookhaven | Orion GUI | Language Support")

	local cl = win:MakeTab({Name=tx.Close})
	cl:AddButton({Name="Close",Callback=function()game.CoreGui:FindFirstChild("Orion"):Destroy()end})

	OrionLib:Init()
end

arabicBtn.MouseButton1Click:Connect(function() LoadUI("AR") end)
englishBtn.MouseButton1Click:Connect(function() LoadUI("EN") end)
