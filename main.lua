local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ============================================================
-- PRYNLABS - DARK LABORATORY / NEON GREEN THEME
-- ============================================================

-- ⚠️ REPLACE THIS WITH YOUR UPLOADED LOGO ASSET ID
local LOGO_ID = "rbxassetid://115884640418653"

WindUI:AddTheme({
    Name = "PrynLabs",
    Accent = Color3.fromHex("#00FF88"),
    Dialog = Color3.fromHex("#0F1410"),
    Outline = Color3.fromHex("#00FF88"),
    Text = Color3.fromHex("#E8F5E9"),
    Placeholder = Color3.fromHex("#4A6B52"),
    Background = Color3.fromHex("#050805"),
    Button = Color3.fromHex("#00FF88"),
    Icon = Color3.fromHex("#00FF88")
})

local Window = WindUI:CreateWindow({
    Title = "PrynLabs Hub",
    Author = "by Prince Ryan | https://discord.gg/kzbJm2fwpG",
    Icon = "solar:test-tube-bold",
    Theme = "PrynLabs",
    ToggleKey = Enum.KeyCode.RightShift,
    SideBarWidth = 210,
})

WindUI:Notify({
    Title = "🧪 PrynLabs",
    Content = "Laboratory systems online.",
    Icon = "solar:test-tube-bold",
    Duration = 4,
})

-- ============================================================
-- LOGO OVERLAY (Adds your P logo to the top of the hub window)
-- ============================================================
task.spawn(function()
    task.wait(1.5) -- Wait for WindUI to fully build

    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Find the WindUI main frame
    local windGui = playerGui:FindFirstChild("WindUI")
    if not windGui then return end

    local mainFrame = windGui:FindFirstChild("MainFrame") or windGui:FindFirstChildWhichIsA("Frame")
    if not mainFrame then
        -- Fallback: search deeper
        for _, v in ipairs(windGui:GetDescendants()) do
            if v:IsA("Frame") and v.Name == "Main" then
                mainFrame = v
                break
            end
        end
    end
    if not mainFrame then return end

    -- Create the logo image
    local logo = Instance.new("ImageLabel")
    logo.Name = "PrynLabsLogo"
    logo.Image = LOGO_ID
    logo.Size = UDim2.new(0, 40, 0, 40)
    logo.Position = UDim2.new(0, 12, 0, 8)
    logo.BackgroundTransparency = 1
    logo.ZIndex = 10
    logo.Parent = mainFrame

    -- Optional: subtle green glow behind the logo
    local glow = Instance.new("ImageLabel")
    glow.Name = "PrynLabsLogoGlow"
    glow.Image = LOGO_ID
    glow.Size = UDim2.new(0, 50, 0, 50)
    glow.Position = UDim2.new(0, 7, 0, 3)
    glow.BackgroundTransparency = 1
    glow.ImageColor3 = Color3.fromHex("#00FF88")
    glow.ImageTransparency = 0.7
    glow.ZIndex = 9
    glow.Parent = mainFrame
end)

-- ============================================================
-- COORDINATES GUI FUNCTION
-- ============================================================
local coordsGuiOpen = false

local function openCoordsGUI()
    if coordsGuiOpen and game.Players.LocalPlayer.PlayerGui:FindFirstChild("PrynLabsCoords") then
        return
    end
    coordsGuiOpen = true

    local player = game.Players.LocalPlayer
    local setclipboard = setclipboard or (syn and syn.write_clipboard)

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PrynLabsCoords"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 320, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -160, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromHex("#050805")
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromHex("#00FF88")
    stroke.Transparency = 0.2
    stroke.Parent = mainFrame

    local glow = Instance.new("UIStroke")
    glow.Thickness = 6
    glow.Color = Color3.fromHex("#00FF88")
    glow.Transparency = 0.85
    glow.Parent = mainFrame

    -- Logo in the coords GUI too
    local coordLogo = Instance.new("ImageLabel")
    coordLogo.Image = LOGO_ID
    coordLogo.Size = UDim2.new(0, 28, 0, 28)
    coordLogo.Position = UDim2.new(0, 8, 0, 6)
    coordLogo.BackgroundTransparency = 1
    coordLogo.ZIndex = 5
    coordLogo.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = "🧪 PRYNLABS // COORDINATES"
    title.TextColor3 = Color3.fromHex("#00FF88")
    title.Font = Enum.Font.Code
    title.TextSize = 16
    title.Parent = mainFrame

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 20)
    subtitle.Position = UDim2.new(0, 0, 0, 35)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Subject Tracking Module v2.6"
    subtitle.TextColor3 = Color3.fromHex("#4A6B52")
    subtitle.Font = Enum.Font.Code
    subtitle.TextSize = 11
    subtitle.Parent = mainFrame

    local coordLabel = Instance.new("TextLabel")
    coordLabel.Size = UDim2.new(1, -20, 0, 60)
    coordLabel.Position = UDim2.new(0, 10, 0, 60)
    coordLabel.BackgroundColor3 = Color3.fromHex("#0F1410")
    coordLabel.BorderSizePixel = 0
    coordLabel.Text = "X: 0.0  Y: 0.0  Z: 0.0"
    coordLabel.TextColor3 = Color3.fromHex("#00FF88")
    coordLabel.Font = Enum.Font.Code
    coordLabel.TextSize = 16
    coordLabel.Parent = mainFrame

    local coordCorner = Instance.new("UICorner")
    coordCorner.CornerRadius = UDim.new(0, 6)
    coordCorner.Parent = coordLabel

    local coordStroke = Instance.new("UIStroke")
    coordStroke.Thickness = 1
    coordStroke.Color = Color3.fromHex("#00FF88")
    coordStroke.Transparency = 0.6
    coordStroke.Parent = coordLabel

    local inputLabel = Instance.new("TextLabel")
    inputLabel.Size = UDim2.new(1, -20, 0, 18)
    inputLabel.Position = UDim2.new(0, 10, 0, 128)
    inputLabel.BackgroundTransparency = 1
    inputLabel.Text = "// TARGET INPUT (X, Y, Z):"
    inputLabel.TextColor3 = Color3.fromHex("#E8F5E9")
    inputLabel.Font = Enum.Font.Code
    inputLabel.TextSize = 11
    inputLabel.TextXAlignment = Enum.TextXAlignment.Left
    inputLabel.Parent = mainFrame

    local coordInput = Instance.new("TextBox")
    coordInput.Size = UDim2.new(1, -20, 0, 35)
    coordInput.Position = UDim2.new(0, 10, 0, 148)
    coordInput.BackgroundColor3 = Color3.fromHex("#0F1410")
    coordInput.BorderSizePixel = 0
    coordInput.PlaceholderText = "X: 100, Y: 50, Z: 200"
    coordInput.Text = ""
    coordInput.TextColor3 = Color3.fromHex("#00FF88")
    coordInput.PlaceholderColor3 = Color3.fromHex("#4A6B52")
    coordInput.Font = Enum.Font.Code
    coordInput.TextSize = 14
    coordInput.ClearTextOnFocus = false
    coordInput.Parent = mainFrame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = coordInput

    local inputStroke = Instance.new("UIStroke")
    inputStroke.Thickness = 1
    inputStroke.Color = Color3.fromHex("#00FF88")
    inputStroke.Transparency = 0.6
    inputStroke.Parent = coordInput

    local copyButton = Instance.new("TextButton")
    copyButton.Size = UDim2.new(0, 140, 0, 35)
    copyButton.Position = UDim2.new(0, 10, 0, 195)
    copyButton.BackgroundColor3 = Color3.fromHex("#00FF88")
    copyButton.BorderSizePixel = 0
    copyButton.Text = "📋 EXTRACT DATA"
    copyButton.TextColor3 = Color3.fromHex("#050805")
    copyButton.Font = Enum.Font.Code
    copyButton.TextSize = 13
    copyButton.Parent = mainFrame

    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 6)
    copyCorner.Parent = copyButton

    local tpButton = Instance.new("TextButton")
    tpButton.Size = UDim2.new(0, 140, 0, 35)
    tpButton.Position = UDim2.new(1, -150, 0, 195)
    tpButton.BackgroundColor3 = Color3.fromHex("#00FF88")
    tpButton.BorderSizePixel = 0
    tpButton.Text = "🚀 WARP"
    tpButton.TextColor3 = Color3.fromHex("#050805")
    tpButton.Font = Enum.Font.Code
    tpButton.TextSize = 13
    tpButton.Parent = mainFrame

    local tpCorner = Instance.new("UICorner")
    tpCorner.CornerRadius = UDim.new(0, 6)
    tpCorner.Parent = tpButton

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, -20, 0, 25)
    statusLabel.Position = UDim2.new(0, 10, 0, 240)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "// SYSTEM READY"
    statusLabel.TextColor3 = Color3.fromHex("#4A6B52")
    statusLabel.Font = Enum.Font.Code
    statusLabel.TextSize = 11
    statusLabel.Parent = mainFrame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -35, 0, 8)
    closeButton.BackgroundColor3 = Color3.fromHex("#00FF88")
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromHex("#050805")
    closeButton.Font = Enum.Font.Code
    closeButton.TextSize = 14
    closeButton.Parent = mainFrame

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton

    local function updateCoords()
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos = hrp.Position
                coordLabel.Text = string.format("X: %.1f  Y: %.1f  Z: %.1f", pos.X, pos.Y, pos.Z)
            end
        end
    end

    local function parseCoords(text)
        local x, y, z = text:match("X:%s*([%d%.%-]+),%s*Y:%s*([%d%.%-]+),%s*Z:%s*([%d%.%-]+)")
        if not x then
            x, y, z = text:match("([%d%.%-]+),%s*([%d%.%-]+),%s*([%d%.%-]+)")
        end
        if not x then
            x, y, z = text:match("([%d%.%-]+)%s+([%d%.%-]+)%s+([%d%.%-]+)")
        end
        if x and y and z then
            return tonumber(x), tonumber(y), tonumber(z)
        end
        return nil
    end

    local function teleportToCoords(x, y, z)
        local char = player.Character
        if not char then
            statusLabel.Text = "// ERROR: NO SUBJECT"
            statusLabel.TextColor3 = Color3.fromHex("#FF4444")
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            statusLabel.Text = "// ERROR: CORE MISSING"
            statusLabel.TextColor3 = Color3.fromHex("#FF4444")
            return
        end
        hrp.CFrame = CFrame.new(x, y, z)
        statusLabel.Text = string.format("// WARPED TO (%.1f, %.1f, %.1f)", x, y, z)
        statusLabel.TextColor3 = Color3.fromHex("#00FF88")
    end

    copyButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(coordLabel.Text)
            copyButton.Text = "✅ EXTRACTED"
            statusLabel.Text = "// DATA SAVED TO CLIPBOARD"
            statusLabel.TextColor3 = Color3.fromHex("#00FF88")
            task.wait(1.5)
            copyButton.Text = "📋 EXTRACT DATA"
        else
            copyButton.Text = "❌ NO CLIPBOARD"
            statusLabel.Text = "// ERROR: CLIPBOARD UNAVAILABLE"
            statusLabel.TextColor3 = Color3.fromHex("#FF4444")
            task.wait(1.5)
            copyButton.Text = "📋 EXTRACT DATA"
        end
    end)

    tpButton.MouseButton1Click:Connect(function()
        local text = coordInput.Text
        if text == "" then
            statusLabel.Text = "// ERROR: NO INPUT"
            statusLabel.TextColor3 = Color3.fromHex("#FF4444")
            return
        end
        local x, y, z = parseCoords(text)
        if not x then
            statusLabel.Text = "// ERROR: INVALID FORMAT"
            statusLabel.TextColor3 = Color3.fromHex("#FF4444")
            return
        end
        teleportToCoords(x, y, z)
    end)

    closeButton.MouseButton1Click:Connect(function()
        coordsGuiOpen = false
        screenGui:Destroy()
    end)

    task.spawn(function()
        while screenGui.Parent do
            updateCoords()
            task.wait(0.1)
        end
    end)

    updateCoords()
end

-- ============================================================
-- HOP SERVER FUNCTION
-- ============================================================
local function hopServer()
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local placeId = game.PlaceId

    WindUI:Notify({
        Title = "🔍 SCANNING",
        Content = "Locating optimal server instance...",
        Icon = "solar:magnifer-bold",
        Duration = 3,
    })

    local url = string.format(
        "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true",
        placeId
    )

    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if not success or not response or not response.data then
        WindUI:Notify({
            Title = "❌ SCAN FAILED",
            Content = "Unable to retrieve server list.",
            Icon = "solar:close-circle-bold",
            Duration = 4,
        })
        return
    end

    local lowestServer = nil
    local lowestCount = math.huge

    for _, server in ipairs(response.data) do
        if server.id and server.playing < server.maxPlayers then
            if server.playing < lowestCount then
                lowestCount = server.playing
                lowestServer = server
            end
        end
    end

    if not lowestServer then
        WindUI:Notify({
            Title = "❌ NO TARGET",
            Content = "No available server instances.",
            Icon = "solar:close-circle-bold",
            Duration = 4,
        })
        return
    end

    WindUI:Notify({
        Title = "🚀 WARPING",
        Content = string.format("Transferring to instance [%d subjects]", lowestCount),
        Icon = "solar:rocket-bold",
        Duration = 3,
    })

    task.wait(0.5)
    TeleportService:TeleportToPlaceInstance(placeId, lowestServer.id, player)
end

-- ============================================================
-- ADVANCED ANTI-AFK FUNCTION
-- ============================================================
local antiAfkEnabled = false
local antiAfkConnection = nil

local function startAntiAfk()
    if antiAfkEnabled then return end
    antiAfkEnabled = true

    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
    end

    local player = game.Players.LocalPlayer
    local VirtualUser = game:GetService("VirtualUser")

    antiAfkConnection = player.Idled:Connect(function()
        if not antiAfkEnabled then return end
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

    task.spawn(function()
        while antiAfkEnabled do
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if hrp and humanoid and humanoid.Health > 0 then
                    pcall(function()
                        local oldCFrame = hrp.CFrame
                        hrp.CFrame = oldCFrame * CFrame.new(0, 0, 0.01)
                        task.wait(0.05)
                        hrp.CFrame = oldCFrame
                    end)
                end
            end
            task.wait(60)
        end
    end)

    WindUI:Notify({
        Title = "🛡️ ANTI-AFK ONLINE",
        Content = "Idle prevention protocol engaged.",
        Icon = "solar:shield-check-bold",
        Duration = 3,
    })
end

local function stopAntiAfk()
    if not antiAfkEnabled then return end
    antiAfkEnabled = false

    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
    end

    WindUI:Notify({
        Title = "🛡️ ANTI-AFK OFFLINE",
        Content = "Idle prevention protocol disengaged.",
        Icon = "solar:shield-cross-bold",
        Duration = 3,
    })
end

-- ============================================================
-- LT2: VOID -> DIE -> RELOAD SLOT 1 -> OPEN LOAD GUI
-- ============================================================
local LT2_SLOT = 1
local voidReloadBusy = false

local function clickButtonByText(text, root, timeout)
    local deadline = tick() + (timeout or 5)
    while tick() < deadline do
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("TextButton") and obj.Text:lower():find(text:lower(), 1, true) then
                return obj
            end
        end
        task.wait(0.1)
    end
    return nil
end

local function openLoadSlotGUI()
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Step 1: open the top Menu
    local menuBtn = clickButtonByText("menu", playerGui, 5)
    if not menuBtn then
        WindUI:Notify({
            Title = "❌ MENU BUTTON NOT FOUND",
            Content = "Could not locate the Menu button.",
            Icon = "solar:close-circle-bold",
            Duration = 4,
        })
        return
    end
    firesignal(menuBtn.MouseButton1Click)

    task.wait(0.5) -- let the Menu popup render

    -- Step 2: click "Load" inside the Menu popup
    local loadBtn = clickButtonByText("load", playerGui, 5)
    if not loadBtn then
        WindUI:Notify({
            Title = "❌ LOAD BUTTON NOT FOUND",
            Content = "Menu opened, but no Load button was found.",
            Icon = "solar:close-circle-bold",
            Duration = 4,
        })
        return
    end
    firesignal(loadBtn.MouseButton1Click)
end

local function voidSlotReload()
    if voidReloadBusy then return end
    voidReloadBusy = true

    local Players = game:GetService("Players")
    local RS = game:GetService("ReplicatedStorage")
    local player = Players.LocalPlayer

    local oldChar = player.Character
    local hum = oldChar and oldChar:FindFirstChildOfClass("Humanoid")
    local hrp = oldChar and oldChar:FindFirstChild("HumanoidRootPart")

    if not (hum and hrp and hum.Health > 0) then
        WindUI:Notify({
            Title = "❌ NO SUBJECT",
            Content = "You must be alive to run this.",
            Icon = "solar:close-circle-bold",
            Duration = 3,
        })
        voidReloadBusy = false
        return
    end

    local diedHandled = false   -- guards against duplicate reloads
    local reloadDone = false
    local newChar = nil
    local guiOpened = false     -- guards against duplicate GUI opens
    local diedConn, addedConn

    local function cleanup()
        if diedConn then diedConn:Disconnect() end
        if addedConn then addedConn:Disconnect() end
        voidReloadBusy = false
    end

    -- Only opens once, and only after BOTH the reload finished and the new avatar spawned
    local function tryOpenGui()
        if guiOpened or not reloadDone or not newChar then return end
        guiOpened = true

        task.spawn(function()
            newChar:WaitForChild("HumanoidRootPart", 10)
            newChar:WaitForChild("Humanoid", 10)
            task.wait(0.5) -- let the avatar settle
            openLoadSlotGUI()
            cleanup()
        end)
    end

    -- Listen for the NEW avatar (connected before we die so we can't miss it)
    addedConn = player.CharacterAdded:Connect(function(char)
        if char == oldChar then return end
        newChar = char
        tryOpenGui()
    end)

    -- Died fires the moment health hits 0, before the respawn
    diedConn = hum.Died:Connect(function()
        if diedHandled then return end
        diedHandled = true
        diedConn:Disconnect()

        -- Reload immediately, in its own thread so we never block on respawn
        task.spawn(function()
            local ok, err = pcall(function()
                return RS.LoadSaveRequests.RequestLoad:InvokeServer(LT2_SLOT, player)
            end)

            if not ok then
                warn("[PrynLabs] Slot reload failed:", err)
                WindUI:Notify({
                    Title = "❌ RELOAD FAILED",
                    Content = "Slot " .. LT2_SLOT .. " could not be loaded.",
                    Icon = "solar:close-circle-bold",
                    Duration = 4,
                })
                cleanup()
                return
            end

            reloadDone = true
            tryOpenGui()
        end)
    end)

    WindUI:Notify({
        Title = "🕳️ VOID PROTOCOL",
        Content = "Warping subject to the void...",
        Icon = "solar:rocket-bold",
        Duration = 3,
    })

    -- Teleport below the destroy height so the avatar dies
    local voidY = workspace.FallenPartsDestroyHeight - 100
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.CFrame = CFrame.new(hrp.Position.X, voidY, hrp.Position.Z)

    -- Safety: if the player never dies, abort cleanly
    task.delay(15, function()
        if not diedHandled then
            WindUI:Notify({
                Title = "⚠️ ABORTED",
                Content = "Subject did not die. Sequence cancelled.",
                Icon = "solar:close-circle-bold",
                Duration = 4,
            })
            cleanup()
        end
    end)
end

-- ============================================================
-- STEAL AN EGG TAB
-- ============================================================
local stealaneggTab = Window:Tab({ Title = "Steal An Egg", Icon = "egg" })

stealaneggTab:Button({
    Title = "Chilli Hub",
    Desc = "Load Chilli Hub protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end
})

stealaneggTab:Button({
    Title = "Anti Chase",
    Desc = "Load Anti Chase protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet("https://flowauth.net/v1/loaders/6824c37a4078d7d311677732e231edaa.lua"))()
    end
})

stealaneggTab:Button({
    Title = "Blyxo Hub",
    Desc = "Load Blyxo Hub protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet("https://flowauth.net/v1/loaders/69d3463240384f3a73fbe32c178093a2.lua"))()
    end
})

stealaneggTab:Button({
    Title = "Miranda Hub",
    Desc = "Load Miranda Hub protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/7891557d7950ed56a7d1d8f57b66ad4d.lua"))()
    end
})

-- ============================================================
-- RIDE A PET TAB
-- ============================================================
local rideapetTab = Window:Tab({ Title = "Ride A Pet", Icon = "paw-print" })

rideapetTab:Button({
    Title = "Mystrix Hub",
    Desc = "Load Mystrix Hub protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))()
    end
})

rideapetTab:Button({
    Title = "Blyxo Hub",
    Desc = "Load Blyxo Hub protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet("https://flowauth.net/v1/loaders/354ab9b4bef70a7d4247d6249da1e41e.lua"))()
    end
})

-- ============================================================
-- LUMBER TYCOON 2 TAB
-- ============================================================
local lt2Tab = Window:Tab({ Title = "Lumber Tycoon 2", Icon = "axe" })

lt2Tab:Button({
    Title = "Kron Hub",
    Desc = "Load Kron Hub protocol",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0'))("")
    end
})

lt2Tab:Button({
    Title = "Void Reload Slot 1",
    Desc = "Void → die → reload Slot 1 → open Load Slot GUI",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        voidSlotReload()
    end
})

-- ============================================================
-- PRYNLABS SCRIPTS TAB (now includes About/Changelog)
-- ============================================================
local princeTab = Window:Tab({ Title = "PrynLabs Scripts", Icon = "flask-conical" })

princeTab:Toggle({
    Title = "Advanced Anti-AFK",
    Desc = "Engage idle prevention protocol",
    Color = Color3.fromHex("#00FF88"),
    Default = false,
    Callback = function(state)
        if state then
            startAntiAfk()
        else
            stopAntiAfk()
        end
    end
})

princeTab:Button({
    Title = "Coordinates GUI",
    Desc = "Open subject tracking module",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        openCoordsGUI()
    end
})

princeTab:Button({
    Title = "Hop Server",
    Desc = "Warp to lowest-population instance",
    Color = Color3.fromHex("#00FF88"),
    Callback = function()
        hopServer()
    end
})

-- About / Credits / Changelog (was the Information tab)
princeTab:Section({ Title = "About PrynLabs" })

princeTab:Paragraph({
    Title = "Credits",
    Desc = "PrynLabs was made by Prince Ryan (Pryn)\nDiscord: https://discord.gg/kzbJm2fwpG"
})

princeTab:Paragraph({
    Title = "v1.0.0",
    Desc = "- Initial release of PrynLabs Hub\nSteal An Egg:\n- Added chilli hub, anti chase, blyxo hub, miranda hub\nRide A Pet:\n- Added mystrix hub, blyxo hub\nLumber Tycoon 2:\n- Added kron hub, void reload slot 1\n\nMORE SCRIPTS IN THE FUTURE!!!"
})