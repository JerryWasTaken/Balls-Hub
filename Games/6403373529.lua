if getgenv().Balls_AlreadyLoaded ~= nil then error("Balls Hub was already found running or you have other scripts executed!") return else getgenv().Balls_AlreadyLoaded = 0 end

if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 9431156611 or game.PlaceId == 11520107397 then else return end

getgenv().isLoaded = false
getgenv().lastTick = tick()

local isflying, isopeningsafes = false, false
local baseflyvec = Vector3.new(0, 1e-9, 0)

local flykeys = {
	W = false,
	A = false,
	S = false,
	D = false,
	Space = false,
	LeftShift = false
}

local Stepped = {}
local isTping = false
local isTyping = false
local cam = workspace.CurrentCamera

local timeSlapped = 0
local timeRagdolled = 0

if game.PlaceId == 9431156611 then
	workspace:WaitForChild("Map"):WaitForChild("OriginOffice"):WaitForChild("Antiaccess"):Destroy()
    
	local part = Instance.new("Part", workspace)

	part.Name = "acidGod"
	part.Size = Vector3.new(145, 4, 140)
	part.Position = Vector3.new(-66.5, 0.05, -739)
	part.CanCollide = false
	part.Anchored = true
	part.Transparency = 1
	
	local lava = Instance.new("Part", workspace)

	lava.Name = "lavaGod"
	lava.Size = Vector3.new(144, 4, 195)
	lava.Position = Vector3.new(-248, -67.252, 399.5)
	lava.CanCollide = false
	lava.Anchored = true
	lava.Transparency = 1
	
	local jesus = Instance.new("Part", workspace)

	jesus.Name = "jesusWalk"
	jesus.Size = Vector3.new(2047, 0.009, 2019)
	jesus.Position = Vector3.new(-80.5, 8.005, -246.5)
	jesus.CanCollide = false
	jesus.Anchored = true
	jesus.Transparency = 1
else
    local arenaVoid = Instance.new("Part", workspace)

	arenaVoid.Name = "arenaVoid"
	arenaVoid.Size = Vector3.new(798, 1, 1290)
	arenaVoid.Position = Vector3.new(3450, 59.009, 68)
	arenaVoid.CanCollide = false
	arenaVoid.Anchored = true
	arenaVoid.Transparency = 1
end

-- walkspeed anticheat bypass
if game.PlaceId == 9431156611 and getrawmetatable and hookmetamethod then
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        
        if not checkcaller() and tostring(self) == "WS" and tostring(method) == "FireServer" then
            return
        end
        
        if not checkcaller() and tostring(self) == "AdminGUI" and tostring(method) == "FireServer" then
            return
        end
        
        return old(self, ...)
    end)
elseif game.PlaceId ~= 9431156611 and getrawmetatable and hookmetamethod then
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        
        if not checkcaller() and tostring(self) == "WalkSpeedChanged" and tostring(method) == "FireServer" then
            return
        end
        
        if not checkcaller() and tostring(self) == "AdminGUI" and tostring(method) == "FireServer" then
            return
        end
        
        return old(self, ...)
    end)
end

-- typing detector
game:GetService("UserInputService").InputBegan:Connect(function(input, typing)
    isTyping = typing
end)

local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://1548304764"
sound.PlayOnRemove = true
sound.Volume = 0.5

local Config = {
    WindowName = "Balls-Hub | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Slap Battles",
    Color = "DarkTheme",
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib(Config.WindowName, Config.Color)

local Tab = Window:NewTab("Main")

local localPlr = game:GetService("Players").LocalPlayer

repeat wait() until localPlr.Character

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kitzoon/Rogue-Hub/main/Libs/BracketV3.lua"))()
local notifLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kitzoon/Rogue-Hub/main/Libs/Notifications.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kitzoon/Rogue-Hub/main/Libs/ESPLIB.lua"))()

if game.PlaceId == 9431156611 then
    getgenv().teleTab = Window:NewTab("Teleports")
end

getgenv().settings = {
    flyspeed = 16,
    gloveExtend = false,
    extendOption = "Meat Stick",
    autoClicker = false,
    autoToxic = false,
    walkSpeed = 20,
    jumpPower = 50,
    noRagdoll = false,
    noReaper = false,
    noTimestop = false,
    noRock = false,
    autoJoin = false,
    joinOption = "Normal Arena",
    noVoid = false,
    auraSlap = false,
    auraOption = "Legit",
    voidRainbow = false,
    voidForce = false,
    playerForce = false,
    fov = 70,
    spamFart = false,
    spin = false,
    spinSpeed = 10,
    autoEquip = false,
    wallNoclip = false,
    acidGod = false,
    lavaGod = false,
    walkSpeedTog = false,
    jumpPowerTog = false,
    walkJesus = false,
    candyFarm = false,
    invis = false,
    tpClick = false,
    slappleFarm = false,
    spamGlove = false,
    infGold = false,
    autoItems = false,
    hipHeight = false,
    hipHeightKey = "NONE",
    hipHeightNum = 1,
    playerNametag = false,
    ESPEnabled = false,
    Tracers = false,
    Boxes = false,
    Names = false,
    Colour = Color3.fromRGB(255, 255, 255),
    chatSpy = false,
    spoofNametag = false,
    spoofNametagAll = false,
    spoofedName = "",
    allSpoofedName = "",
    botBoost = false,
    botSpeed = 20,
    chatSpam = false,
    spamDelay = false,
    botAura = false,
    botHop = false,
    botDistance = false,
    botDistanceLimit = 5,
    femBoy = false,
    busJump = false,
    firstPerson = false,
    invisUno = false,
    errorSound = false,
    thanosSound = false,
    spamAbility = false,
    spamRock = false
}

if makefolder and isfolder and not isfolder("Rogue Hub") then
    makefolder("Rogue Hub")
    
    makefolder("Rogue Hub/Configs")
    makefolder("Rogue Hub/Data")
end

if readfile and isfile and isfile("Balls Hub/Configs/SlapBattles_Config.ROGUEHUB") then
    getgenv().settings = game:GetService("HttpService"):JSONDecode(readfile("Balls Hub/Configs/SlapBattles_Config.ROGUEHUB"))
end

local function saveSettings()
    if writefile then
        writefile("Balls Hub/Configs/SlapBattles_Config.ROGUEHUB", game:GetService("HttpService"):JSONEncode(getgenv().settings))
    end
end

function getQuote()
    local userQuotes = game:GetService("HttpService"):JSONDecode(readfile("/Rogue Hub/Configs/Quotes.ROGUEHUB"))
    return userQuotes[math.random(#userQuotes)]
end

local function getTool()
    local tool = localPlr.Character:FindFirstChildOfClass("Tool") or localPlr:WaitForChild("Backpack"):FindFirstChildOfClass("Tool")
    
    if tool ~= nil and tool:FindFirstChild("Glove") ~= nil then
        return tool    
    end
end

local function getBackpackTool()
    local tool = localPlr:WaitForChild("Backpack"):FindFirstChildOfClass("Tool")
    
    if tool ~= nil and tool:FindFirstChild("Glove") ~= nil then
        return tool
    end
end

localPlr.CharacterAdded:Connect(function()
    local humanoid = localPlr.Character:WaitForChild("Humanoid")
    
    if getgenv().settings.walkSpeedTog then
        humanoid.WalkSpeed = getgenv().settings.walkSpeed or 20
    else
        humanoid.WalkSpeed = 20
    end
    
    if getgenv().settings.jumpPowerTog then
        humanoid.JumpPower = getgenv().settings.jumpPower or 50
    else
        humanoid.JumpPower = 50    
    end
    
    if getgenv().settings.invis and localPlr.leaderstats.Slaps.Value >= 666 then
        task.wait(0.5)
        
        if localPlr.leaderstats.Glove.Value == "Ghost" then
            fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
        end
        
        game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
        
        repeat wait() until localPlr.Character:FindFirstChild("entered")
        
        for _,v in pairs(game.Lighting:GetChildren()) do
            if v.Name ~= "DepthOfField" or v.Name ~= "Bloom" or v.Name ~= "ColorCorrection" then
                v:Destroy()    
            end
        end
    end
    
    if getgenv().settings.infGold and getgenv().isLoaded then
        if localPlr.leaderstats.Slaps.Value >= 2500 and localPlr.leaderstats.Glove.Value ~= "Golden" and not localPlr.Character:FindFirstChild("entered") then
            fireclickdetector(workspace.Lobby.Golden.ClickDetector)
        elseif localPlr.leaderstats.Slaps.Value <= 2500 and getgenv().settings.invis then
            notifLib:Notification("You don't have enough slaps for the golden glove! (2500 Slaps)", 5)
            return
        end
        
        wait(0.3)
        
        game:GetService("ReplicatedStorage").Goldify:FireServer(true, BrickColor.new(24))
        
        notifLib:Notification("Godmode activated!", 5)
        
        repeat wait() until localPlr.Character:FindFirstChild("entered")
        
        for _,v in pairs(game.Lighting:GetChildren()) do
            if v.Name ~= "DepthOfField" or v.Name ~= "Bloom" or v.Name ~= "ColorCorrection" then
                v:Destroy()    
            end
        end
    end
    
    task.wait(3)
    
    if getgenv().settings.noRagdoll then
        if localPlr.Character.HumanoidRootPart == nil then return end
        
        localPlr.Character.Ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
            if localPlr.Character:FindFirstChild("HumanoidRootPart") and localPlr.Character.Ragdolled.Value == true then
                if localPlr.Character.HumanoidRootPart == nil or getgenv().settings.noRagdoll == false or getgenv().slapFarm or isTping then return end
                
                repeat task.wait()
                    localPlr.Character.Head.Anchored = true
                until localPlr.Character:FindFirstChild("Head") == nil or localPlr.Character.Ragdolled.Value == false
                
                localPlr.Character.Head.Anchored = false
            end
        end)
    end
    
    localPlr.Character.Ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
        if localPlr.Character.Ragdolled then
            timeRagdolled = timeRagdolled + 1
        end
    end)
    
    if getgenv().settings.noReaper and game.PlaceId ~= 11520107397 then
        localPlr.Character.ChildAdded:Connect(function(child)
            if child.Name == "DeathMark" and child:IsA("StringValue") and getgenv().settings.noReaper then
                game:GetService("ReplicatedStorage").ReaperGone:FireServer(child)
                game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy()
                child:Destroy()
            end
        end)
    end
    
    if getgenv().settings.wallNoclip then
        localPlr.Character:FindFirstChild("HumanoidRootPart").Touched:Connect(function(part)
            if part.Name == "wall" and getgenv().settings.wallNoclip then
                part.CanCollide = not getgenv().settings.wallNoclip
            end
        end)
    end
    
    repeat task.wait() until getTool() ~= nil
    
    if getgenv().settings.auraSlap and getgenv().settings.auraOption == "Legit" then
        getTool().Glove.Touched:Connect(function(part)
            if part.Parent:FindFirstChildOfClass("Humanoid") and getgenv().settings.auraSlap and getgenv().settings.auraOption == "Legit" and not getgenv().slapFarm then
                getTool():Activate()
                task.wait(0.3)
            end
        end)
    end
    
    while wait() do
        if getgenv().settings.fightBot then
            if not localPlr.Character or not localPlr.Character:FindFirstChild("Humanoid") then return end
            
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if getBackpackTool() then
                    localPlr.Character.Humanoid:EquipTool(getBackpackTool())
                end
                
                if v ~= localPlr and localPlr.Character:FindFirstChild("Humanoid") and v.Character and v.Character:FindFirstChild("entered") and not v.Character.IsInDefaultArena.Value and not v.isParticipatingplayerBool.Value and not v.Character:FindFirstChild("FrozenHumanoid") and not v.Character:FindFirstChild("Reversed") and getTool() then
                    local targetDistance = (v.Character.HumanoidRootPart.Position - workspace.CurrentCamera.CFrame.Position).magnitude
                    
                    if targetDistance < getgenv().settings.botDistanceLimit or not getgenv().settings.botDistance then
                        localPlr.Character.Humanoid:MoveTo(v.Character.HumanoidRootPart.Position)
                        localPlr.Character.Humanoid.WalkSpeed = getgenv().settings.botSpeed or 20
                        
                        if getgenv().settings.botHop and localPlr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
                            localPlr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                        
                        if getgenv().settings.botAura and getTool().Name == "Default" then
                            game:GetService("ReplicatedStorage").b:FireServer(v.Character.HumanoidRootPart)
                        else
                            getTool():Activate()
                        end
                        
                        game.CoreGui.TargetHUD.MainFrame.Username.Text = v.DisplayName or v.Name
                        game.CoreGui.TargetHUD.MainFrame.PlayerThumbnail.Image = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                    end
                end
            end
        end
        
        if getgenv().settings.auraSlap and getgenv().settings.auraOption == "Blatant" and not getgenv().slapFarm and getTool() then
            for _, target in ipairs(game:GetService("Players"):GetPlayers()) do
                if getTool() and target.Character and target.Character:FindFirstChild("Humanoid") and localPlr.Character and localPlr.Character:FindFirstChild("Humanoid") and target.Character:FindFirstChild("FrozenHumanoid") == nil and target.Character:FindFirstChild("Reversed") == nil and getgenv().settings.auraOption == "Blatant" and target:DistanceFromCharacter(localPlr.Character.HumanoidRootPart.Position) <= 20.1 and getTool().Name == "Default" then
                    game:GetService("ReplicatedStorage").b:FireServer(target.Character.HumanoidRootPart)
                    wait(0.3)
                end
            end
        end
    end
end)

local playerSec = Tab:NewSection("Player")

if game.PlaceId ~= 9431156611 and game.PlaceId ~= 11520107397 then
    playerSec:NewToggle("Error Sound Earrape (FE)", "spams the error sound, practically ear rape for everyone in your server.", function(state)
        getgenv().settings.errorSound = state
    end)

    playerSec:NewToggle("Slapples Glove Farm", "Auto farm's slapple gloves for you. (gets you free slaps)", function(state)
        getgenv().settings.slappleFarm = state
    end)
end

playerSec:NewToggle("Autoclicker", "", function(bool)
    getgenv().settings.autoClicker = bool
end)

playerSec:NewToggle("Click TP", "", function(bool)
    getgenv().settings.tpClick = bool
end)

localPlr:GetMouse().Button1Down:Connect(function()
    if localPlr.Character ~= nil and localPlr.Character:FindFirstChild("HumanoidRootPart") ~= nil and getgenv().settings.tpClick and not getgenv().settings.candyFarm and not getgenv().slapFarm and not isTping then
        localPlr.Character.HumanoidRootPart.CFrame = localPlr:GetMouse().Hit + Vector3.new(0,7,0)
        
        isTping = true
        wait(0.3)
        isTping = false
    end
end)

if game.PlaceId ~= 9431156611 then
    local toxicTog = playerSec:NewToggle("Auto Toxic", "automatically says a toxic phrase when you slap someone", function(bool)
        getgenv().settings.autoToxic = bool
        
        if getgenv().settings.autoToxic then
            localPlr.leaderstats.Slaps:GetPropertyChangedSignal("Value"):Connect(function()
                if not getgenv().settings.autoToxic or getgenv().slapFarm or getgenv().settings.auraSlap and getgenv().settings.auraOption == "Blatant" then return end
                
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getQuote(), "All")
            end)
        end
    end)
        
    localPlr.leaderstats.Slaps:GetPropertyChangedSignal("Value"):Connect(function()
        timeSlapped = timeSlapped + 1
    end)
end

playerSec:NewToggle("Infinite Jump", "", function(bool)
    getgenv().settings.infJump = bool
end)

local noRagTog = playerSec:NewToggle("Anti Ragdoll", "", function(bool)
    getgenv().settings.noRagdoll = bool
    
    if getgenv().settings.noRagdoll and localPlr.Character:FindFirstChildOfClass("Humanoid") then
        localPlr.Character.Ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
            if localPlr.Character:FindFirstChild("HumanoidRootPart") and localPlr.Character.Ragdolled.Value == true then
                if not localPlr.Character:FindFirstChild("HumanoidRootPart") or getgenv().settings.noRagdoll == false or getgenv().slapFarm or isTping then return end
                
                repeat task.wait()
                    localPlr.Character.Head.Anchored = true
                until localPlr.Character:FindFirstChild("Head") == nil or localPlr.Character.Ragdolled.Value == false
                
                localPlr.Character.Head.Anchored = false
            end
        end)
    end
end)

if localPlr.Character:FindFirstChildOfClass("Humanoid") then
    localPlr.Character.Ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
        if localPlr.Character.Ragdolled then
            timeRagdolled = timeRagdolled + 1
        end
    end)
end

if game.PlaceId ~= 9431156611 then
    if game.PlaceId ~= 11520107397 then
        local reaperGod = playerSec:NewToggle("Reaper Godmode", "immune from the reaper death ability", function(bool)
            getgenv().settings.noReaper = bool
            
            if getgenv().settings.noReaper and localPlr.Character:FindFirstChildOfClass("Humanoid") then
                for _, v in next, localPlr.Character:GetChildren() do
                    if v.Name == "DeathMark" and v:IsA("StringValue") and getgenv().settings.noReaper then
                        game:GetService("ReplicatedStorage").ReaperGone:FireServer(v)
                        game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy()
                        v:Destroy()
                    end
                end
                
                localPlr.Character.ChildAdded:Connect(function(child)
                    if child.Name == "DeathMark" and child:IsA("StringValue") and getgenv().settings.noReaper then
                        game:GetService("ReplicatedStorage").ReaperGone:FireServer(child)
                        game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy()
                        child:Destroy()
                    end
                end)
            end
        end)
                
        local rockGod = playerSec:NewToggle("Rock Godmode", "immune from dangerous rocks! sometimes works, sometimes doesnt", function(bool)
            getgenv().settings.noRock = bool
            
            if getgenv().settings.noRock then
                for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                    if localPlr ~= target and target.Character and target.Character:FindFirstChild("FrozenHumanoid") and target.Character.rock:FindFirstChild("TouchInterest") then
                        target.Character.rock:Destroy()
                    end
                end
            end
        end)
                
        local noClipWall = playerSec:NewToggle("Giant Wall Noclip", "clip's through the giant wall ability.", function(bool)
            getgenv().settings.wallNoclip = bool
            
            if getgenv().settings.wallNoclip then
                for _,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Part") and v.Name == "wall" then
                        v.CanCollide = not getgenv().settings.wallNoclip
                    end
                end
                
                workspace.ChildAdded:Connect(function(child)
                    if child:IsA("Part") and child.Name == "wall" and getgenv().settings.wallNoclip then
                        child.CanCollide = not getgenv().settings.wallNoclip
                    end
                end)
            end
        end)
            
        playerSec:NewToggle("Move in Timestop & Cutscenes", "", function(bool)
            getgenv().settings.noTimestop = bool
        end)
        
        local togInvis = playerSec:NewToggle("Invisible (FE)", "Uses a glitch in Slap Battles to make you invisible. (Requires 666 slaps or more)", function(bool)
            getgenv().settings.invis = bool
            
            if not getgenv().settings.invis and getgenv().isLoaded and localPlr.leaderstats.Slaps.Value >= 666 and localPlr.Character:FindFirstChild("entered") then
                game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
                
                localPlr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                return
            end
            
            if getgenv().settings.invis and getgenv().isLoaded and localPlr.Character:FindFirstChild("entered") then
                localPlr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                
                repeat wait() until localPlr.Character and localPlr.Character:WaitForChild("HumanoidRootPart") and not localPlr.Character:FindFirstChild("entered")
            end
            
            if getgenv().settings.invis then
                if localPlr.leaderstats.Slaps.Value >= 666 and localPlr.leaderstats.Glove.Value ~= "Ghost" and not localPlr.Character:FindFirstChild("entered") then
                    fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
                elseif localPlr.leaderstats.Slaps.Value <= 666 and getgenv().settings.invis then
                    notifLib:Notification("You don't have enough slaps for the ghost glove! (666 Slaps)", 5)
                    return
                end
                
                wait(0.3)
                
                game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
                
                notifLib:Notification("Invisible activated!", 5)
            
                repeat wait() until localPlr.Character:FindFirstChild("entered")
                
                for _,v in pairs(game.Lighting:GetChildren()) do
                    if v.Name ~= "DepthOfField" or v.Name ~= "Bloom" or v.Name ~= "ColorCorrection" then
                        v:Destroy()    
                    end
                end
            end
        end)
                
        local godded = playerSec:NewToggle("Godmode (FE)", "Uses a glitch on a certain glove to give you godmode. (Requires 2500 slaps or more)", function(bool)
            getgenv().settings.infGold = bool
            
            if getgenv().settings.infGold and getgenv().isLoaded and localPlr.Character:FindFirstChild("entered") then
                localPlr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                
                repeat wait() until localPlr.Character and localPlr.Character:WaitForChild("HumanoidRootPart") and not localPlr.Character:FindFirstChild("entered")
            end
            
            if getgenv().settings.infGold and getgenv().isLoaded then
                if localPlr.leaderstats.Slaps.Value >= 2500 and localPlr.leaderstats.Glove.Value ~= "Golden" and not localPlr.Character:FindFirstChild("entered") then
                    fireclickdetector(workspace.Lobby.Golden.ClickDetector)
                elseif localPlr.leaderstats.Slaps.Value <= 2500 and getgenv().settings.invis then
                    notifLib:Notification("You don't have enough slaps for the golden glove! (2500 Slaps)", 5)
                    return
                end
                
                wait(0.3)
                
                game:GetService("ReplicatedStorage").Goldify:FireServer(true, BrickColor.new(24))
                
                notifLib:Notification("Godmode activated!", 5)
                
                repeat wait() until localPlr.Character:FindFirstChild("entered")
                
                for _,v in pairs(game.Lighting:GetChildren()) do
                    if v.Name ~= "DepthOfField" or v.Name ~= "Bloom" or v.Name ~= "ColorCorrection" then
                        v:Destroy()    
                    end
                end
            end
        end)

        local invisUno = playerSec:NewToggle("Invisible Reverse (FE)", "", function(bool)
            getgenv().settings.invisUno = bool
        end)
    end
    
    playerSec:NewToggle("Anti Void", "", function(bool)
        getgenv().settings.noVoid = bool
        
        workspace.dedBarrier.CanCollide = getgenv().settings.noVoid or false
        workspace.arenaVoid.CanCollide = getgenv().settings.noVoid or false
    end)
end

if game.PlaceId == 9431156611 then
    local accid = playerSec:NewToggle("Anti Toxic Waste", "Protects you from Acid.", function(bool)
		getgenv().settings.acidGod = bool
		
		if workspace:FindFirstChild("acidGod") ~= nil then
			workspace.acidGod.CanCollide = getgenv().settings.acidGod
		end
		
		saveSettings()
    end)
        
    local lava = playerSec:NewToggle("Anti Lava", "Protects you from Lava.", function(bool)
		getgenv().settings.lavaGod = bool
		
		if workspace:FindFirstChild("lavaGod") ~= nil then
			workspace.lavaGod.CanCollide = getgenv().settings.lavaGod
		end
    end)
    
    local jesussy = playerSec:NewToggle("Walk On Water", "Lets you walk on water.", function(bool)
		getgenv().settings.walkJesus = bool
		
		if workspace:FindFirstChild("jesusWalk") ~= nil then
			workspace.jesusWalk.CanCollide = getgenv().settings.walkJesus
		end
    end)
        
    playerSec:NewToggle("Trap Door Noclip", "", function(bool)
		getgenv().settings.doorNoclip = bool
		
		for _,v in pairs(workspace.Map.WesternWarzone.Sheriff.Cell.Door:GetChildren()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.CanCollide = not getgenv().settings.doorNoclip
            end
        end
    end)
    
    local earlyBus = playerSec:NewToggle("Early Bus Jump", "lets you jump out of the bus earlier then other players.", function(bool)
		getgenv().settings.busJump = bool
        
        if getgenv().settings.busJump and getgenv().isLoaded then
            while wait() do
                if not isTyping and getgenv().settings.busJump and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                    if workspace:FindFirstChild("BusModel") ~= nil and workspace:FindFirstChild("BusModel").Welds:FindFirstChild(localPlr.Name) ~= nil then
                        game:GetService("ReplicatedStorage").Events.BusJumping:FireServer()
                    end
                end
            end
        end
    end)
end

function connectStep(name, func)
    Stepped[name] = game.RunService.Stepped:Connect(func)
end
function disconnectStep(name)
    if Stepped[name] then
		Stepped[name]:Disconnect()
	end
end

local hipTog = playerSec:NewToggle("Hip Height Edit", "", function(bool)
    getgenv().settings.hipHeight = bool
end)

playerSec:NewSlider("Hip Height", "SliderInfo", 20.1, 0, function(value)
	getgenv().settings.hipHeightNum = value
end)

local spinTog = playerSec:NewToggle("Spin", "SPINNNNNNNNN", function(bool)
    getgenv().settings.spin = bool
end)

playerSec:NewSlider("Spin Speed", "", 100,1, function(value)
	getgenv().settings.spinSpeed = value
end)

local togspeed = playerSec:NewToggle("Walk Speed", "", function(bool)
    getgenv().settings.walkSpeedTog = bool
    
    if getgenv().settings.walkSpeedTog then
        localPlr.Character.Humanoid.WalkSpeed = getgenv().settings.walkSpeed
    else
        localPlr.Character.Humanoid.WalkSpeed = 20
    end
end)

playerSec:NewSlider("Walk Speed", "", 300,20, function(value)
	getgenv().settings.walkSpeed = value
    
    if getgenv().settings.walkSpeedTog then
        localPlr.Character.Humanoid.WalkSpeed = getgenv().settings.walkSpeed
    else
        localPlr.Character.Humanoid.WalkSpeed = 20
    end
end)

local togjump = playerSec:NewSlider("Jump Power", "", function(bool)
    getgenv().settings.jumpPowerTog = bool
    
    if getgenv().settings.jumpPowerTog then
        localPlr.Character.Humanoid.JumpPower = getgenv().settings.jumpPower or 50
    else
        localPlr.Character.Humanoid.JumpPower = 50    
    end
end)

playerSec:NewSlider("Jump Power", "", 300,50, function(value)
	getgenv().settings.jumpPower = value
	saveSettings()
	
	if getgenv().settings.jumpPowerTog then
	    localPlr.Character.Humanoid.JumpPower = getgenv().settings.jumpPower
	else
	    localPlr.Character.Humanoid.JumpPower = 50
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if getTool() ~= nil then
        if getgenv().settings.gloveExtend and getgenv().settings.extendOption == "Meat Stick" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 25, 2) then
            getTool().Glove.Transparency = 0.5
            getTool().Glove.Size = Vector3.new(0, 25, 2)
        elseif getgenv().settings.gloveExtend and getgenv().settings.extendOption == "Pancake" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 25, 25) then
            getTool().Glove.Transparency = 0.5
            getTool().Glove.Size = Vector3.new(0, 25, 25)
        elseif getgenv().settings.gloveExtend and getgenv().settings.extendOption == "Growth" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(25, 25, 25) then
            getTool().Glove.Transparency = 0.5
            getTool().Glove.Size = Vector3.new(25, 25, 25)
        elseif getgenv().settings.gloveExtend and getgenv().settings.extendOption == "North Korea Wall" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 3.5, 2) then
            getTool().Glove.Transparency = 0.5
            getTool().Glove.Size = Vector3.new(45, 0, 45)
        elseif getgenv().settings.gloveExtend and getgenv().settings.extendOption == "Slight Extend" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 3.5, 2) then
            getTool().Glove.Transparency = 0
            getTool().Glove.Size = Vector3.new(3, 3, 3.7)
        elseif getgenv().settings.gloveExtend == false then
            getTool().Glove.Transparency = 0
            getTool().Glove.Size = Vector3.new(2.55232, 2.88637, 1.06914)
        end
        
        if getgenv().settings.hipHeight and localPlr.Character.Humanoid.HipHeight ~= getgenv().settings.hipHeightNum then
            localPlr.Character.Humanoid.HipHeight = getgenv().settings.hipHeightNum
        else
            localPlr.Character.Humanoid.HipHeight = hipBackup
        end
        
        if not isTyping and getgenv().settings.infJump and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
            localPlr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        
        if getgenv().settings.slappleFarm and game.PlaceId ~= 9431156611 then
            for _,v in pairs(workspace.Arena:GetDescendants()) do
                if getgenv().settings.slappleFarm and v:FindFirstChild("Glove") and v.Glove:FindFirstChildOfClass("TouchTransmitter") then
                    if string.find(v.Name, "Slapple") or string.find(v.Name, "GoldenSlapple") then
                        firetouchinterest(localPlr.Character.HumanoidRootPart, v.Glove, 0)
                        firetouchinterest(localPlr.Character.HumanoidRootPart, v.Glove, 1)
                        
                        wait(0.05)
                    end
                end
            end
        end
        
        if getgenv().settings.invisUno then
            for _,v in pairs(localPlr.Character:GetDescendants()) do
                if v:IsA("SelectionBox") or v.Name == "UnoReverseCard" then
                    v:Destroy()
                end
            end
        end
        
        if getgenv().settings.firstPerson then
            workspace.CurrentCamera.CFrame = localPlr.Character.Head.CFrame
            
            for _,v in pairs(localPlr.Character:GetChildren()) do
                if v:IsA("Accessory") then
                    v:Destroy()
                end
            end
        end

        if task.wait(2) and getTool() ~= nil and getgenv().settings.autoClicker and not getgenv().slapFarm then
            getTool():Activate()
        end
        
        if getTool() ~= nil and getgenv().settings.infGold and getTool().Name == "Golden" then
            game:GetService("ReplicatedStorage").Goldify:FireServer(true)
        end
        
        if getgenv().settings.noTimestop then
            for _, v in next, localPlr.Character:GetChildren() do
                if v:IsA("Part") or v:IsA("MeshPart") and v.Anchored then
                    v.Anchored = false
                end
            end
        end
        
        if getgenv().settings.noRock and game.PlaceId ~= 9431156611 then
            for _, target in next, game:GetService("Players"):GetPlayers() do
                if localPlr ~= target and target.Character and target.Character:FindFirstChild("FrozenHumanoid") and target.Character:FindFirstChild("rock") and target.Character.rock:FindFirstChild("TouchInterest") then
                    target.Character.rock:Destroy()
                end
            end
        end
        
        if getgenv().settings.playerForce then
            for _, v in next, localPlr.Character:GetChildren() do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    v.Material = "ForceField"
                end
            end
        else
            for _, v in next, localPlr.Character:GetChildren() do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    v.Material = "Plastic"
                end
            end 
        end
        
        if getgenv().settings.spamAbility and keypress and not isTyping and keyrelease and getTool().Name ~= "Diamond" and game.PlaceId ~= 9431156611 then
            keypress(0x45)
            keyrelease(0x45)
        end
        
        if getgenv().settings.spamRock and getTool().Name == "Diamond" and not getgenv().slapFarm and game.PlaceId ~= 9431156611 then
            game:GetService("ReplicatedStorage").Rockmode:FireServer()
        end
        
        if getgenv().settings.spin and localPlr:GetMouse().Icon ~= "rbxasset://textures/MouseLockedCursor.png" and not getgenv().slapFarm then
            localPlr.Character.HumanoidRootPart.CFrame = localPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(getgenv().settings.spinSpeed), 0)
        end
    end
    
    if game.PlaceId ~= 9431156611 and getgenv().settings.playerNametag and localPlr.Character and localPlr.Character:FindFirstChild("Head") and localPlr.Character.Head:FindFirstChild("Nametag") and localPlr.Character.Head.Nametag.Enabled then
        localPlr.Character.Head.Nametag.Enabled = false
    elseif game.PlaceId ~= 9431156611 and not getgenv().settings.playerNametag and localPlr.Character and localPlr.Character:FindFirstChild("Head") and localPlr.Character.Head:FindFirstChild("Nametag") and not localPlr.Character.Head.Nametag.Enabled then
        localPlr.Character.Head.Nametag.Enabled = true
    end
    
    if game.PlaceId ~= 9431156611 and getgenv().settings.spoofNametag and localPlr.Character and localPlr.Character:FindFirstChild("Head") and localPlr.Character.Head:FindFirstChild("Nametag") and localPlr.Character.Head.Nametag.TextLabel.Text ~= getgenv().settings.spoofedName then
        localPlr.Character.Head.Nametag.TextLabel.Text = getgenv().settings.spoofedName
    elseif game.PlaceId ~= 9431156611 and not getgenv().settings.spoofNametag and localPlr.Character and localPlr.Character.Head:FindFirstChild("Nametag") and localPlr.Character.Head.Nametag.TextLabel.Text == getgenv().settings.spoofedName then
        localPlr.Character.Head.Nametag.TextLabel.Text = localPlr.Name
    end
    
    if game.PlaceId ~= 9431156611 then
        if getgenv().settings.spoofNametagAll then
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= localPlr and v.Character and v.Character.Head:FindFirstChild("Nametag") and v.Character.Head.Nametag.TextLabel.Text ~= getgenv().settings.allSpoofedName then
                    v.Character.Head.Nametag.TextLabel.Text = getgenv().settings.allSpoofedName or ""
                end
            end
        elseif not getgenv().settings.spoofNametagAll then
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= localPlr and v.Character and v.Character.Head:FindFirstChild("Nametag") and v.Character.Head.Nametag.TextLabel.Text == getgenv().settings.allSpoofedName then
                    v.Character.Head.Nametag.TextLabel.Text = v.Name
                end
            end
        end
    end
    
    if getgenv().settings.playerSpoofNametagAll then
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= localPlr and v.Character and v.Character.Head:FindFirstChild("Nametag") and v.Character.Head.Nametag.TextLabel.TextTransparency ~= 1 then
                v.Character.Head.Nametag.TextLabel.TextTransparency = 1
            end
        end
    elseif not getgenv().settings.playerSpoofNametagAll then
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= localPlr and v.Character and v.Character.Head:FindFirstChild("Nametag") and v.Character.Head.Nametag.TextLabel.TextTransparency == 1 then
                v.Character.Head.Nametag.TextLabel.TextTransparency = 0
            end
        end
    end
    
    if getgenv().settings.spamGlove and game.PlaceId ~= 9431156611 and not localPlr.Character:FindFirstChild("entered") then
        for _,v in pairs(workspace.Lobby:GetChildren()) do
            if v:FindFirstChild("ClickDetector") then
                fireclickdetector(v.ClickDetector)
            end
        end
    end
    
    if getgenv().settings.errorSound and game.PlaceId ~= 9431156611 then
        game:GetService("ReplicatedStorage").ErrorDeath:FireServer()
    end
    
    if getgenv().settings.thanosSound and game.PlaceId ~= 9431156611 and getTool() and getTool().Name == "Thanos" then
        game:GetService("ReplicatedStorage").Illbeback:FireServer()
    end
    
    if getgenv().settings.autoJoin and getgenv().settings.joinOption == "Normal Arena" then
        if game.PlaceId == 9431156611 then return end
        
        if not localPlr.Character:FindFirstChild("entered") and localPlr.Character:FindFirstChild("HumanoidRootPart") then
            repeat wait(0.5)
                firetouchinterest(localPlr.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                firetouchinterest(localPlr.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
            until localPlr.Character:FindFirstChild("entered") ~= nil
        end
    elseif getgenv().settings.autoJoin and getgenv().settings.joinOption == "Default Only Arena" then
        if game.PlaceId == 9431156611 then return end
        
        if not localPlr.Character:FindFirstChild("entered") and localPlr.Character:FindFirstChild("HumanoidRootPart") then
            repeat wait(0.5)
                firetouchinterest(localPlr.Character.HumanoidRootPart, workspace.Lobby.Teleport2, 0)
                firetouchinterest(localPlr.Character.HumanoidRootPart, workspace.Lobby.Teleport2, 1)
            until localPlr.Character:FindFirstChild("entered") ~= nil
        end
    end
    
    if getgenv().settings.voidRainbow and game.PlaceId ~= 9431156611 then
        local hue = tick() % 10 / 10
        local rainbow = Color3.fromHSV(hue, 1, 1)
        
        workspace.dedBarrier.Transparency = 0
        workspace.dedBarrier.Color = rainbow
        
        workspace.arenaVoid.Transparency = 0
        workspace.arenaVoid.Color = rainbow
    else
        if game.PlaceId == 9431156611 then return end
        
        if not getgenv().settings.voidForce then
            workspace.dedBarrier.Transparency = 1
            workspace.arenaVoid.Transparency = 1
        end
        
        workspace.dedBarrier.Color = Color3.fromRGB(163, 162, 165)
        workspace.arenaVoid.Color = Color3.fromRGB(163, 162, 165)
    end
    
    if getgenv().settings.voidForce and game.PlaceId ~= 9431156611 then
        workspace.dedBarrier.Transparency = 0
        workspace.dedBarrier.Material = "ForceField"
        
        workspace.arenaVoid.Transparency = 0
        workspace.arenaVoid.Material = "ForceField"
    else
        if game.PlaceId == 9431156611 then return end
        
        if not getgenv().settings.voidRainbow then
            workspace.dedBarrier.Transparency = 1
            workspace.arenaVoid.Transparency = 1
        end
        
        workspace.dedBarrier.Material = "Plastic"
        workspace.arenaVoid.Material = "Plastic"
    end
end)

sound:Destroy()
getgenv().isLoaded = true

notifLib:Notification("Rogue Hub took " .. math.floor(tick() - getgenv().lastTick) .. " seconds to load!", 5)
