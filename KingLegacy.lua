local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Epic Hub", "Ocean")

_G.autofarm = false 
_G.dropfarm = false
_G.invisible = false
_G.autohaki = false

_G.defense = false
_G.melee = false
_G.sword = false
_G.devilfruit = false

local distancefrommob = 0

local plr = game:GetService("Players").LocalPlayer
local VU = game:GetService("VirtualUser")

local level = plr.PlayerStats.lvl
local RSmob = game:GetService("ReplicatedStorage").MOB
local WSmob = game.workspace.Monster
local RSquest = game:GetService("ReplicatedStorage").MAP
local WSquest = game.workspace.AntiTPNPC
local questboard = plr.PlayerGui.Quest.QuestBoard

local mob = nil
local qnpc = nil

local tool = nil

local toollist = {}

mt = getrawmetatable(game)
setreadonly(mt,false)
old = mt.__index
mt.__index = newcclosure(function(a,b,c)
    if b == "UserId" and a == plr and not checkcaller() then
        return 394373295
    end
    return old(a,b,c)
end)

plr.CharacterRemoving:connect(function()
    if _G.autofarm then
        _G.autofarm = false 
        
        plr.CharacterAdded:wait()
        wait(1)
        
        _G.autofarm = true
    end
end)

local MainTab = Window:NewTab("Main")
local FarmSettingSection = MainTab:NewSection("Farm Settings")
local FarmSection = MainTab:NewSection("Farm")

function gettool()
    local bp = plr.Backpack:FindFirstChild(tool)
    local charac = plr.Character:FindFirstChildOfClass("Tool")
    
    if bp then
        if charac then
            charac.Parent = plr.Backpack
            wait(.05)
        end
        bp.Parent = plr.Character
    end
end

function invisible()
    pcall(function()
    local torso = plr.Character:FindFirstChild("LowerTorso")
    local hum = plr.Character:FindFirstChild("Humanoid")
    
    if hum and torso then
        pcall(function()
        if hum.Health > 0 and torso:FindFirstChild("Root") then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(2045.0865478516, 49.646903991699, -1764.8370361328)
            wait(.1)
            torso.Root:Destroy()
            torso.Anchored = true
        end
        end)
    end
    end)
end

function autohaki()
    local haki = plr.Character:FindFirstChild("Haki")
    
    if haki and _G.autohaki then
        if haki.Value == 0 then
            pcall(function()
            game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
            wait(1)
            end)
        end
    end
end

function movemob()
    for i,v in pairs(RSmob:GetChildren()) do
        v.Parent = WSmob.Mon   
    end
end

function lvlcheck()
    if level.Value < 10 then
        mob = "Soldier [Lv. 1]"
        qnpc = "QuestLvl1"
    elseif level.Value < 20 then
        mob = "Clown Pirate [Lv. 10]"
        qnpc = "QuestLvl10"
    elseif level.Value < 30 then
        mob = "Smoky [Lv. 20]"
        qnpc = "QuestLvl20"
    elseif level.Value < 50 then
        mob = "Tashi [Lv. 30]"
        qnpc = "QuestLvl30"
    elseif level.Value < 75 then
        mob = "Clown Pirate [Lv. 50]"
        qnpc = "QuestLvl50"
    elseif level.Value < 100 then
        mob = "The Clown [Lv. 75]"
        qnpc = "QuestLvl75"
    elseif level.Value < 120 then
        mob = "Commander [Lv. 100]"
        qnpc = "QuestLvl100"
    elseif level.Value < 145 then
        mob = "The Captain [Lv. 120]"
        qnpc = "QuestLvl120"
    elseif level.Value < 180 then
        mob = "Axe Hand [Lv. 145]"
        qnpc = "QuestLvl145"
    elseif level.Value < 200 then
        mob = "Fishman [Lv. 180]"
        qnpc = "QuestLvl180"
    elseif level.Value < 230 then
        mob = "Karate Fishman [Lv. 200]"
        qnpc = "QuestLvl200"
    elseif level.Value < 250 then
        mob = "SharkMan [Lv. 230]"
        qnpc = "QuestLvl230"
    elseif level.Value < 300 then
        mob = "Trainer Chef [Lv. 250]"
        qnpc = "QuestLvl250"
    elseif level.Value < 350 then
        mob = "Dark Leg [Lv. 300]"
        qnpc = "QuestLvl300"
    elseif level.Value < 400 then
        mob = "Weapon Man [Lv. 350]"
        qnpc = "QuestLvl350"
    elseif level.Value < 450 then
        mob = "Snow Soldier [Lv. 400]"
        qnpc = "QuestLvl400"
    elseif level.Value < 500 then
        mob = "King Snow [Lv. 450]"
        qnpc = "QuestLvl450"
    elseif level.Value < 525 then
        mob = "Heavy Man [Lv. 500]"
        qnpc = "QuestLvl500"
    elseif level.Value < 625 then
        mob = "Candle Man [Lv. 525]"
        qnpc = "QuestLvl525"
    elseif level.Value < 725 then
        mob = "Bomb Man [Lv. 625]"
        qnpc = "QuestLvl625"
    elseif level.Value < 800 then
        mob = "King of Sand [Lv. 725]"
        qnpc = "QuestLvl725"
    elseif level.Value < 850 then
        mob = "Sky Soldier [Lv. 800]"
        qnpc = "QuestLvl800"
    elseif level.Value < 900 then
        mob = "Ball Man [Lv. 850]"
        qnpc = "QuestLvl850"
    elseif level.Value < 1000 then
        mob = "Rumble Man [Lv. 900]"
        qnpc = "QuestLvl900"
    elseif level.Value < 1100 then
        mob = "Soldier [Lv. 1000]"
        qnpc = "QuestLvl1000"
    elseif level.Value < 1150 then
        mob = "Leader [Lv. 1100]"
        qnpc = "QuestLvl1100"
    elseif level.Value < 1250 then
        mob = "Pasta [Lv. 1150]"
        qnpc = "QuestLvl1150"
    elseif level.Value < 1325 then
        mob = "Wolf [Lv. 1250]"
        qnpc = "QuestLvl1250"
    elseif level.Value < 1400 then
        mob = "Giraffe [Lv. 1325]"
        qnpc = "QuestLvl1325"
    elseif level.Value < 1500 then
        mob = "Leo [Lv. 1400]"
        qnpc = "QuestLvl1400"
    elseif level.Value < 1600 then
        mob = "Zombie [Lv. 1500]"
        qnpc = "QuestLvl1500"
    elseif level.Value < 1750 then
        mob = "Shadow Master [Lv. 1600]"
        qnpc = "QuestLvl1600"
    elseif level.Value < 1800 then
        mob = "New World Pirate [Lv. 1750]"
        qnpc = "QuestLvl1750"
    elseif level.Value < 1850 then
        mob = "Rear Admiral [Lv. 1800]"
        qnpc = "QuestLvl1800"
    elseif level.Value < 1925 then
        mob = "True Karate Fishman [Lv. 1850]"
        qnpc = "QuestLvl1850"
    elseif level.Value < 2000 then
        mob = "Quake Woman [Lv. 1925]"
        qnpc = "QuestLvl1925"
    elseif level.Value < 2050 then
        mob = "Fishman [Lv. 2000]"
        qnpc = "QuestLvl2000"
    elseif level.Value < 2100 then
        mob = "Combat Fishman [Lv. 2050]"
        qnpc = "QuestLvl2050"
    elseif level.Value < 2150 then
        mob = "Sword Fishman [Lv. 2100]"
        qnpc = "QuestLvl2100"
    elseif level.Value < 2200 then
        mob = "Fishman Soldier [Lv. 2150]"
        qnpc = "QuestLvl2150"
    elseif level.Value < 2250 then
        mob = "Seasoned Fishman [Lv. 2200]"
        qnpc = "QuestLvl2200"
    end
    wait()
end

function autohit()
    VU:ClickButton1(Vector2.new(0,0)) 
end

function autoquest()
    for i,v in pairs(RSquest:GetChildren()) do
        if string.find(v.Name, "QuestLvl") then
            v.Parent = WSquest
        end
    end
    
    local quest = WSquest:FindFirstChild(qnpc)
    local hum = plr.Character:FindFirstChild("Humanoid")
    
    if quest and hum.Health > 0 and questboard.Visible == false and not string.match(questboard.QuestCount.Text, mob) then
        plr.Character.HumanoidRootPart.CFrame = quest.PrimaryPart.CFrame
        wait(.1)
        plr.Character.HumanoidRootPart.Anchored = true
        repeat
            VU:ClickButton1(Vector2.new(0,0))
            wait()
        until plr.PlayerGui:FindFirstChild(qnpc)
        
        local questui = plr.PlayerGui:FindFirstChild(qnpc)
        
        questui:WaitForChild("Dialogue")
        questui.Dialogue:WaitForChild("Accept")
        
        local accept = questui.Dialogue.Accept
        wait(1)
        repeat
            accept.AnchorPoint = Vector2.new(.5, .5)
            accept.Position = UDim2.new(.5, 0, .5, 0)
            accept.Size = UDim2.new(999, 999, 999, 999)
            wait(.1)
            VU:ClickButton1(Vector2.new(0,0))
            wait()
        until questboard.Visible == true
        plr.Character.HumanoidRootPart.Anchored = false

        accept.AnchorPoint = Vector2.new(0, 0)
        accept.Position = UDim2.new(-0.037, 0, 1.3109, 0)
        accept.Size = UDim2.new(0.3499, 0, 0.3499, 0)
        
        repeat
            wait()
        until questboard.Visible == true
    end
    wait()
end
 
function lvlfarm()
    lvlcheck()
    movemob()

    for i,v in pairs(WSmob:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("HumanoidRootPart") and v.Name == mob then
            lvlcheck()
            pcall(function()
            if v.Humanoid.Health > 0 and plr.Character.Humanoid.Health > 0 and _G.autofarm then
                if string.match(questboard.QuestCount.Text, mob) and questboard.Visible == false then
                else 
                    autoquest()
                end
                
                repeat
                    if _G.invisible and _G.autofarm then
                        invisible()
                    end
                    
                    if _G.autohaki then
                        autohaki()
                    end
                    
                    if _G.autofarm and plr.Character:FindFirstChild("Humanoid") then
                        if plr.Character.Humanoid.Health > 0 then
                            gettool()
                            plr.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame * CFrame.new(0, 0, distancefrommob)
                            autohit()
                            wait()
                        end
                    end
                    wait()
                until v.Humanoid.Health < 1 or _G.autofarm == false
            end
            end)
        end
    end
    wait(1)
end

function dropfarm()
    movemob()

    for i,v in pairs(WSmob:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("HumanoidRootPart") and v.Name == mob then
            pcall(function()
            if v.Humanoid.Health > 0 and plr.Character.Humanoid.Health > 0 and _G.dropfarm then
                if string.match(questboard.QuestCount.Text, mob) and questboard.Visible == false then
                else 
                    autoquest()
                end
                
                repeat
                    if _G.invisible and _G.dropfarm then
                        invisible()
                    end
                    
                    if _G.autohaki then
                        autohaki()
                    end
                    
                    if _G.dropfarm and plr.Character:FindFirstChild("Humanoid") then
                        if plr.Character.Humanoid.Health > 0 then
                            gettool()
                            plr.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame * CFrame.new(0, 0, distancefrommob)
                            autohit()
                            wait()
                        end
                    end
                    wait()
                until v.Humanoid.Health < 1 or _G.dropfarm == false
            end
            end)
        end
    end
    wait(1)
end

function findtool()
   for i,v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA("Tool") then
           table.insert(toollist, v.Name)
        end
    end
end
findtool()
local SelectWeapon = FarmSettingSection:NewDropdown("Select Weapon", " ", toollist, function(currentOption)
    tool = currentOption
end)
FarmSettingSection:NewButton("Refresh Weapons", " ", function()
    toollist = {}
    findtool()
    SelectWeapon:Refresh(toollist)
end)

FarmSettingSection:NewSlider("Distance", " ", 10, 0, function(s) 
    distancefrommob = s
end)
FarmSettingSection:NewToggle("Auto Haki", " ", function(state)
    if state then
        _G.autohaki = true
    else
        _G.autohaki = false
    end
end)
FarmSettingSection:NewToggle("Auto Invisible", " ", function(state)
    if state then
        _G.invisible = true
    else
        _G.invisible = false
    end
end)
FarmSection:NewToggle("Start", " ", function(state)
    if state then
        _G.autofarm = true
        
        while _G.autofarm do
            lvlfarm()
            wait()
        end
    else
        _G.autofarm = false
    end
end)
local DropFarmSection = MainTab:NewSection("Drop Farm")
DropFarmSection:NewDropdown("Choose NPC", " ", {"Tashi [Lv. 30]", "SharkMan [Lv. 230]", "Rumble Man [Lv. 900]", "Shadow Master [Lv. 1600]", "Quake Woman [Lv. 1925]"}, function(currentOption)
    if currentOption == "Tashi [Lv. 30]" then
        qnpc = "QuestLvl30"
    elseif currentOption == "SharkMan [Lv. 230]" then
        qnpc = "QuestLvl130"
    elseif currentOption == "Rumble Man [Lv. 900]" then
        qnpc = "QuestLvl900"
    elseif currentOption == "Shadow Master [Lv. 1600]" then
        qnpc = "QuestLvl1600"
    elseif currentOption == "Quake Woman [Lv. 1925]" then
        qnpc = "QuestLvl1925"
    end
    mob = currentOption
end)
DropFarmSection:NewToggle("Start", " ", function(state)
    if state then
        _G.dropfarm = true
        
        while _G.dropfarm do
            dropfarm()
            wait()
        end
    else
        _G.dropfarm = false
    end
end)

local AutoStatSection = MainTab:NewSection("Auto Stats")
AutoStatSection:NewToggle("Defense", " ", function(state)
    if state then
        _G.defense = true
    else
        _G.defense = false
    end
end)
AutoStatSection:NewToggle("Melee", " ", function(state)
    if state then
        _G.melee = true
    else
        _G.melee = false
    end
end)
AutoStatSection:NewToggle("Sword", " ", function(state)
    if state then
        _G.sword = true
    else
        _G.sword = false
    end
end)
AutoStatSection:NewToggle("Devil Fruit", " ", function(state)
    if state then
        _G.devilfruit = true
    else
        _G.devilfruit = false
    end
end)
AutoStatSection:NewToggle("Start", " ", function(state)
    if state then
        addstat = game:GetService("RunService").Heartbeat:connect(function()
            if _G.defense then
                local args = {
                    [1] = "Defense",
                    [2] = 1
                }
                
                plr.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
            end
            if _G.melee then
                local args = {
                    [1] = "Melee",
                    [2] = 1
                }
                
                plr.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
                end
            if _G.sword then
                local args = {
                    [1] = "Sword",
                    [2] = 1
                }
                
                plr.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
            end
            if _G.devilfruit then
                local args = {
                    [1] = "Devil Fruit",
                    [2] = 1
                }
                
                plr.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
            end
        end)
    else
        addstat:Disconnect()
    end
end)


local TeleportTab = Window:NewTab("Teleport")
local IslandsSection = TeleportTab:NewSection("Islands")

local islands = {
    ["Starter Island"] = CFrame.new(2155.7978515625, 48.800365447998, -1725.2432861328),
    ["Pirate Island"] = CFrame.new(3983.8303222656, 37.888278961182, 398.37832641602),
    ["Soldier Island"] = CFrame.new(1624.6490478516, 40.633907318115, 1158.1667480469),
    ["Shark Island"] = CFrame.new(3909.0766601563, 11.363608360291, 3171.0268554688),
    ["Chef Ship"] = CFrame.new(-26.993263244629, 99.441101074219, 80.659706115723),
    ["Snow Island"] = CFrame.new(-2892.6845703125, 19.963972091675, 1335.4912109375),
    ["Rocks Island"] = CFrame.new(6225.1240234375, 424.83090209961, -2050.7297363281),
    ["Desert Island"] = CFrame.new(1505.7093505859, 12.926520347595, 3446.3312988281),
    ["Sky Island"] = CFrame.new(-1080.1236572266, 202.21249389648, 4509.8232421875),
    ["Bubble Island"] = CFrame.new(8153.7666015625, 11.921149253845, 5369.986328125),
    ["Lobby Island"] = CFrame.new(4289.3989257813, 14.578567504883, 6845.3227539063),
    ["Zombie Island"] = CFrame.new(-1087.9639892578, 226.77285766602, 8382.3515625),
    ["War Island"] = CFrame.new(8552.39453125, 50.509754180908, 1398.1431884766),
    ["Fishland"] = CFrame.new(3545.6574707031, 7.3056707382202, 13572.11328125),
    ["Stone Arena"] = CFrame.new(9950.5205078125, 336.43142700195, -3658.1931152344)
}

local npcs = {
    ["Black Market"] = CFrame.new(2132.8388671875, 79.926513671875, -1596.1606445313),
    ["Gacha"] = CFrame.new(2014.6579589844, 48.167560577393, -1727.7615966797),
    ["Soru Seller"] = CFrame.new(1642.5843505859, 40.633907318115, 1172.9815673828),
    ["Buso Seller"] = CFrame.new(8135.9897460938, 12.779849052429, 5436.9096679688),
    ["Ken Seller"] = CFrame.new(-893.88287353516, 386.98907470703, 4697.734375),
    ["Delete Fruit"] = CFrame.new(-932.42700195313, 386.44485473633, 4757.46484375),
    ["Reset Stat"] = CFrame.new(2049.2905273438, 48.167560577393, -1802.7530517578),
    ["Katana Seller"] = CFrame.new(2050.3657226563, 48.167560577393, -1716.7631835938),
    ["Pipe Seller"] = CFrame.new(8104.4892578125, 11.901149749756, 5372.6845703125),
    ["Triple Katana Seller"] = CFrame.new(6228.2260742188, 26.5914478302, -2120.7785644531),
    ["Mini Mace Seller"] = CFrame.new(8700.8369140625, 310.11938476563, 1923.2171630859),
    ["Dark Leg Seller"] = CFrame.new(6457.9072265625, 168.79032897949, -2375.4028320313),
    ["Cyborg Seller"] = CFrame.new(4583.3857421875, 123.67582702637, 3226.0427246094),
    ["Water Style Seller"] = CFrame.new(2860.3154296875, 40.296794891357, 14145.532226563),
    ["Traveler"] = CFrame.new(8781.62890625, 211.32806396484, 1709.4216308594),
    ["Elite Pirate"] = CFrame.new(1837.9548339844, 17.258979797363, -1485.3641357422),
}

local islandname = {
    "Starter Island",
    "Pirate Island",
    "Soldier Island",
    "Shark Island",
    "Chef Ship",
    "Snow Island",
    "Rocks Island",
    "Desert Island",
    "Sky Island",
    "Bubble Island",
    "Lobby Island",
    "Zombie Island",
    "War Island",
    "Fishland",
    "Stone Arena"
}

local npcname = {
    "Black Market",
    "Gacha",
    "Soru Seller",
    "Buso Seller",
    "Ken Seller",
    "Delete Fruit",
    "Reset Stat",
    "Katana Seller",
    "Pipe Seller",
    "Triple Katana Seller",
    "Mini Mace Seller",
    "Dark Leg Seller",
    "Cyborg Seller",
    "Water Style Seller",
    "Traveler",
    "Elite Pirate",
}

IslandsSection:NewDropdown("Choose Island", " ", islandname, function(currentOption)
    plr.Character.HumanoidRootPart.CFrame = islands[currentOption]
end)
local NPCsSection = TeleportTab:NewSection("NPCs")
NPCsSection:NewDropdown("Choose NPC", " ", npcname, function(currentOption)
    plr.Character.HumanoidRootPart.CFrame = npcs[currentOption]
end)

local MiscTab = Window:NewTab("Misc")
local MiscSection = MiscTab:NewSection("Misc")
MiscSection:NewButton("No Water Damage", " ", function()
    local hookremote;
    hookremote = hookfunction(getrawmetatable(game).__namecall,function(...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "FireServer" and args[2] == "in" then
            return wait()
        end
        return hookremote(...)
    end)
end)
MiscSection:NewButton("No Cooldown Dash", " ", function()
    if plr.Backpack:FindFirstChild("Dash") then
        pcall(function()
        if plr.Backpack.Dash.Disabled == false then
            plr.Backpack.Dash.Disabled = true
            
            local l__LocalPlayer__1 = game.Players.LocalPlayer;
            
            Debounce = 1;
            RepStorage = game:GetService("ReplicatedStorage");
            local l__Camera__1 = workspace.Camera;
            function _G.Dash()
            	local l__Humanoid__2 = l__LocalPlayer__1.Character.Humanoid;
            
            	l__Humanoid__2:LoadAnimation(l__LocalPlayer__1.Backpack.Dash.Animation):Play();
            	local l__BodyVelocity__3 = l__LocalPlayer__1.Character.HumanoidRootPart:FindFirstChild("BodyVelocity");
            	if l__BodyVelocity__3 then
            		l__BodyVelocity__3:Destroy();
            	end;
            	local l__HumanoidRootPart__4 = l__LocalPlayer__1.Character.HumanoidRootPart;
            	spawn(function()
            		local l__HumanoidRootPart__5 = l__LocalPlayer__1.Character.HumanoidRootPart;
            		local l__Velocity__6 = l__HumanoidRootPart__5.Velocity;
            		local v7 = game.ReplicatedStorage.Chest.FruitEffect.SkyJump.Rings:Clone();
            		v7.Dash.Pitch = math.random(85, 125) / 100;
            		v7.Parent = workspace.Effects;
            		v7.CFrame = CFrame.new(l__HumanoidRootPart__5.Position, l__HumanoidRootPart__5.Position + l__Velocity__6) * CFrame.Angles(-math.pi / 2, 0, 0) * CFrame.new(0, -15, 0);
            		v7.Dash:Play();
            		game.Debris:AddItem(v7, 1);
            		game.TweenService:Create(v7, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
            			Size = Vector3.new(15, 0.75, 15), 
            			CFrame = v7.CFrame * CFrame.new(0, -5, 0), 
            			Transparency = 1
            		}):Play();
            		for v8 = 1, math.random(3, 6) do
            			local v9 = math.random(10, 30) / 100;
            			local v10 = game.ReplicatedStorage.Chest.MeleeEffect.Cyborg.Thing:Clone();
            			v10.Anchored = true;
            			v10.CanCollide = false;
            			v10.Size = Vector3.new(v9, v9, math.random(3, 25));
            			v10.CFrame = CFrame.new(l__HumanoidRootPart__5.Position, l__HumanoidRootPart__5.Position + l__Velocity__6) * CFrame.new(math.random(-3, 3), math.random(-3, 3), math.random(1, 3));
            			v10.Parent = workspace.Effects;
            			game.Debris:AddItem(v10, 1);
            			game.TweenService:Create(v10, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
            				Size = Vector3.new(0, 0, v10.Size.Z), 
            				CFrame = v10.CFrame * CFrame.new(0, 0, math.random(5, 10))
            			}):Play();
            			Spawn(function()
            				wait(0.1);
            				game.TweenService:Create(v10, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
            					Transparency = 1
            				}):Play();
            			end);
            		end;
            	end);
            	l__LocalPlayer__1.Backpack.Dash.DashRemote:FireServer();
            	local v11 = Instance.new("BodyVelocity");
            	v11.MaxForce = Vector3.new(100000, 100000, 100000);
            	local v12 = Instance.new("BodyGyro");
            	v12.MaxTorque = Vector3.new(100000000, 100000000, 100000000);
            	v12.P = 200000;
            	v12.CFrame = CFrame.new(l__HumanoidRootPart__4.Position, l__HumanoidRootPart__4.Position + l__Humanoid__2.MoveDirection * Vector3.new(1, 0, 1));
            	v12.Parent = l__HumanoidRootPart__4;
            	local v13 = CFrame.new(l__HumanoidRootPart__4.Position, l__HumanoidRootPart__4.Position + l__Camera__1.CFrame.LookVector * Vector3.new(1, 0, 1)).LookVector * 218;
            	local v14 = Vector3.new(l__Humanoid__2.MoveDirection.X, l__Humanoid__2.MoveDirection.Y, l__Humanoid__2.MoveDirection.Z) * 218;
            	v11.Velocity = v14;
            	game.Debris:AddItem(v11, 0.5);
            	game.Debris:AddItem(v12, 0.5);
            	spawn(function()
            		wait(0.05);
            		v11.Velocity = v14 * (0.25 - wait());
            		v12:Destroy();
            		wait(wait() + 0.02);
            		l__LocalPlayer__1.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp);
            		v11:Destroy();
            	end);
            	v11.Parent = l__HumanoidRootPart__4;
            end;
            
            local UIS = game:GetService("UserInputService")
            UIS.InputBegan:Connect(function(p1, p2)
            	if p2 then
            		return;
            	end;
            	local v15 = l__LocalPlayer__1.Character:FindFirstChild("Humanoid");
            	if v15 and (((p1.KeyCode == Enum.KeyCode.Q and (UIS:IsKeyDown(Enum.KeyCode.W) or UIS:IsKeyDown(Enum.KeyCode.S) or UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.D)))or p1.KeyCode == Enum.KeyCode.DPadUp) and Debounce == 1 and v15.Sit == false and v15.WalkSpeed ~= 0) then
            		Debounce = 0;
            		_G.Dash();
            		Debounce = 1;
            	end;
            end);
        end
        end)
    end
end)
MiscSection:NewButton("Inf Geppo", " ", function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            local geppo = plr.Backpack:FindFirstChild("GeppoNew")
            if geppo then
                local cd = geppo:FindFirstChild("cds")
                if cd then
                    cd.Value = 7
                end 
            end
        end)
    end)
end)

local DevilFruitSection = MiscTab:NewSection("Devil Fruit")
DevilFruitSection:NewToggle("Fruits Sniper", " ", function(state)
    if state then
        dfsnipe = game:GetService("RunService").Heartbeat:connect(function()
            local fruit1 = game.workspace.AllspawnDF:FindFirstChildOfClass("Tool")
            if fruit1 then
                if fruit1:FindFirstChild("Handle") and fruit1:FindFirstChild("DevilFruit") then
                    firetouchinterest(plr.Character.HumanoidRootPart, fruit1.Handle,0)
                end
            end
            
            local fruit2 = game.workspace:FindFirstChildOfClass("Tool")
            if fruit2 then
                if fruit2:FindFirstChild("Handle") and fruit2:FindFirstChild("DevilFruit") then
                    firetouchinterest(plr.Character.HumanoidRootPart, fruit2.Handle,0)
                end
            end
        end)
    else
        dfsnipe:Disconnect()
    end
end)

