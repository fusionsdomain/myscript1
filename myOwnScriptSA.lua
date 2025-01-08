-- Game ID
if game.PlaceId == 5780309044 then

-- GUI
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Stands Awakening's Nightmare", HidePremium = false, IntroEnabled = false,IntroText = "SA NIGHTMARE", SaveConfig = true, ConfigFolder = "SaConfig"})

-- Values


-- Functions



-- Tabs
local Scripts = Window:MakeTab({
	Name = "OPSCRIPTS",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Toggles
ScriptsTab:AddToggle("30S TS", "Time Stop for 30s [Left_Control]", function(state)
    Name = "30s TIMESTOP",
    local function onInputBegan(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
            local args = {30, "jotaroova"}
            game:GetService("ReplicatedStorage"):WaitForChild("Main"):WaitForChild("Timestop"):FireServer(unpack(args))
        end
    end

    if state then
        game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
    else
        print("off")
    end
end)

local toggleConnection


ScriptsTab:AddToggle("TS MOVEMENT", "Move in timestops", function(state)
    Name = "MOVE IN TIMESTOP",
    local function collectParts(parent)
        local parts = {}
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("BasePart") then
                table.insert(parts, child)
            end
            for _, grandChild in ipairs(child:GetChildren()) do
                if grandChild:IsA("BasePart") then
                    table.insert(parts, grandChild)
                end
            end
        end
        return parts
    end

    local function anchorParts(parts, anchor)
        for _, part in ipairs(parts) do
            game:GetService("ReplicatedStorage"):WaitForChild("Anchor"):FireServer(part, anchor)
        end
    end

    local function toggleMovementLoop()
        while state do
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character then
                local character = player.Character
                local partsToToggle = collectParts(character)
                anchorParts(partsToToggle, false)

                local stand = character:FindFirstChild("Stand")
                if stand then
                    local standPartsToToggle = collectParts(stand)
                    anchorParts(standPartsToToggle, false)
                else
                    warn("Stand object not found in character")
                end
            else
                warn("Character not found for LocalPlayer")
            end
            wait(1)
        end
    end

    if state then
        if toggleConnection then
            toggleConnection:Disconnect()
        end
        toggleConnection = coroutine.wrap(toggleMovementLoop)
        toggleConnection()
        print("Movement enabled in timestops")
    else
        if toggleConnection then
            toggleConnection:Disconnect()
        end
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character then
            local character = player.Character
            local partsToToggle = collectParts(character)
            anchorParts(partsToToggle, true)

            local stand = character:FindFirstChild("Stand")
            if stand then
                local standPartsToToggle = collectParts(stand)
                anchorParts(standPartsToToggle, true)
            else
                warn("Stand object not found in character")
            end
        else
            warn("Character not found for LocalPlayer")
        end
        print("Movement disabled in timestops")
    end
end)


end
OrionLib:Init()