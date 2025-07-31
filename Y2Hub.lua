--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
if game.PlaceId~=4924922222 then game.Players.LocalPlayer:Kick("❌ يعمل فقط في Brookhaven!") return end
setclipboard("https://www.tiktok.com/@y_s4620?_t=ZS-8y2vGa22tCj&_r=1")
local texts={AR={Scripts="قائمة الاسكربتات",Control="تحكم الشخصية",Protection="الحماية",Spam="اسبام الشات",Troll="التخريب",Bang="Bang الواقعي",Invisible="الاختفاء",Music="الأغاني",Skins="نسخ الاسكنات",Tools="الأدوات",Server="السيرفر",FX="التأثيرات",VIP="مميزات VIP",About="حول",Close="إغلاق"},EN={Scripts="Scripts",Control="Character",Protection="Protection",Spam="Chat Spam",Troll="Troll",Bang="Bang",Invisible="Invisibility",Music="Music",Skins="Skins",Tools="Tools",Server="Server",FX="Effects",VIP="VIP",About="About",Close="Close"}}
local gui=Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)local f=Instance.new("Frame",gui)f.Size=UDim2.new(0,300,0,150)f.Position=UDim2.new(.5,-150,.5,-75)f.BackgroundColor3=Color3.fromRGB(25,25,25)local t=Instance.new("TextLabel",f)t.Size=UDim2.new(1,0,.3,0)t.Text="اختر اللغة / Choose Language"t.BackgroundTransparency=1 t.TextColor3=Color3.fromRGB(255,255,255)t.TextScaled=true local a=Instance.new("TextButton",f)a.Size=UDim2.new(.45,0,.4,0)a.Position=UDim2.new(.05,0,.5,0)a.Text="عربي"a.BackgroundColor3=Color3.fromRGB(200,0,0)a.TextColor3=Color3.new(1,1,1)local e=Instance.new("TextButton",f)e.Size=UDim2.new(.45,0,.4,0)e.Position=UDim2.new(.5,0,.5,0)e.Text="English"e.BackgroundColor3=Color3.fromRGB(200,0,0)e.TextColor3=Color3.new(1,1,1)
function LoadUI(lang)
gui:Destroy()local tx=texts[lang]local OrionLib=loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()local win=OrionLib:MakeWindow({Name="Y2 Hub",IntroEnabled=true,IntroText="Y2 Hub"})
local plr=game.Players.LocalPlayer
local function players()local l={}for _,p in pairs(game.Players:GetPlayers())do if p~=plr then table.insert(l,p.Name)end end return l end

-- TAB 1 Scripts
local s=win:MakeTab({Name=tx.Scripts})s:AddButton({Name="Infinite Yield",Callback=function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end})s:AddButton({Name="CMD-X",Callback=function()loadstring(game:HttpGet('https://raw.githubusercontent.com/CMD-X/CMD-X/refs/heads/master/Source'))()end})s:AddButton({Name="Dex Explorer",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()end})

-- TAB 2 Control
local c=win:MakeTab({Name=tx.Control})c:AddTextbox({Name="WalkSpeed",Default="16",Callback=function(v)local h=plr.Character and plr.Character:FindFirstChild("Humanoid")if h then h.WalkSpeed=tonumber(v)or 16 end end})c:AddTextbox({Name="JumpPower",Default="50",Callback=function(v)local h=plr.Character and plr.Character:FindFirstChild("Humanoid")if h then h.JumpPower=tonumber(v)or 50 end end})

-- TAB 3 Protection
local p=win:MakeTab({Name=tx.Protection})p:AddToggle({Name="Anti-AFK",Default=false,Callback=function(s)if s then plr.Idled:Connect(function()game.VirtualUser:ClickButton2(Vector2.new())end)end end})p:AddToggle({Name="Boost FPS",Callback=function(s)if s then game.Lighting.GlobalShadows=false settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 else game.Lighting.GlobalShadows=true end end})

-- TAB 4 Spam
local sp=win:MakeTab({Name=tx.Spam})local msg,count="Hello",10 sp:AddTextbox({Name="Message",Default="Hello",Callback=function(v)msg=v end})sp:AddTextbox({Name="Count",Default="10",Callback=function(v)count=tonumber(v)or 10 end})sp:AddButton({Name="Start",Callback=function()spawn(function()for i=1,count do game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All")wait(.5)end end)end})

-- TAB 5 Troll
local tr=win:MakeTab({Name=tx.Troll})local target tr:AddDropdown({Name="Player",Options=players(),Callback=function(v)target=v end})tr:AddButton({Name="Refresh",Callback=function()tr:Refresh(players(),true)end})tr:AddButton({Name="Freeze Player",Callback=function()if target then local tp=game.Players:FindFirstChild(target)if tp and tp.Character then tp.Character:BreakJoints()end end end})

-- TAB 6 Bang
local b=win:MakeTab({Name=tx.Bang})local bangOn=false local bangTarget b:AddDropdown({Name="Player",Options=players(),Callback=function(v)bangTarget=v end})b:AddToggle({Name="Bang",Callback=function(s)bangOn=s if bangOn and bangTarget then local tp=game.Players:FindFirstChild(bangTarget)local ch=plr.Character if tp and tp.Character and ch then local hum=ch:FindFirstChild("Humanoid")local a=Instance.new("Animation")a.AnimationId="rbxassetid://148840371"local track=hum:LoadAnimation(a)track:Play()spawn(function()while bangOn and tp and tp.Character do ch:MoveTo(tp.Character.HumanoidRootPart.Position-Vector3.new(0,0,1))wait(.1)end track:Stop()end)end end end})

-- TAB 7 Invisible
local inv=win:MakeTab({Name=tx.Invisible})inv:AddButton({Name="Enable",Callback=function()for _,p in pairs(plr.Character:GetDescendants())do if p:IsA("BasePart")then p.Transparency=1 end end end})inv:AddButton({Name="Disable",Callback=function()for _,p in pairs(plr.Character:GetDescendants())do if p:IsA("BasePart")then p.Transparency=0 end end end})

-- TAB 8 Music
local mu=win:MakeTab({Name=tx.Music})local id,sound=0,nil mu:AddTextbox({Name="Song ID",Default="",Callback=function(v)id=tonumber(v)or 0 end})mu:AddToggle({Name="Play",Callback=function(s)if s and id>0 then if sound then sound:Destroy()end sound=Instance.new("Sound",game.SoundService)sound.SoundId="rbxassetid://"..id sound.Volume=5 sound.Looped=true sound:Play()else if sound then sound:Destroy()end end end})

-- TAB 9 Skins
local sk=win:MakeTab({Name=tx.Skins})local skinTarget sk:AddDropdown({Name="Player",Options=players(),Callback=function(v)skinTarget=v end})sk:AddButton({Name="Copy Skin",Callback=function()if skinTarget then local p=game.Players:FindFirstChild(skinTarget)if p then local desc=game.Players:GetHumanoidDescriptionFromUserId(p.UserId)plr.Character.Humanoid:ApplyDescription(desc)end end end})

-- TAB 10 Tools
local to=win:MakeTab({Name=tx.Tools})to:AddButton({Name="Create Sword",Callback=function()local t=Instance.new("Tool")t.RequiresHandle=false t.Name="Sword"t.Parent=plr.Backpack end})

-- TAB 11 Server
local se=win:MakeTab({Name=tx.Server})se:AddButton({Name="Rejoin",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId,plr)end})se:AddButton({Name="Server Hop",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId)end})

-- TAB 12 FX
local fx=win:MakeTab({Name=tx.FX})fx:AddButton({Name="Red Fog",Callback=function()game.Lighting.FogEnd=50 game.Lighting.FogColor=Color3.new(1,0,0)end})

-- TAB 13 VIP
local vip=win:MakeTab({Name=tx.VIP})vip:AddButton({Name="Rainbow Screen",Callback=function()spawn(function()while wait(.2)do game.Lighting.Ambient=Color3.fromHSV(tick()%5/5,1,1)end end)end})

-- TAB 14 About
local ab=win:MakeTab({Name=tx.About})ab:AddParagraph("Y2 Hub","Made for Brookhaven | Orion GUI | Language Support")

-- TAB 15 Close
local cl=win:MakeTab({Name=tx.Close})cl:AddButton({Name="Close",Callback=function()game.CoreGui:FindFirstChild("Orion"):Destroy()end})

OrionLib:Init()end
a.MouseButton1Click:Connect(function()LoadUI("AR")end)
e.MouseButton1Click:Connect(function()LoadUI("EN")end
