local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Adopt me by Tarzan", "DarkTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")

-- Global variables
getgenv().Toggled = false
getgenv().TeleportDuration = 5 -- Default teleport duration in seconds

-- Function to teleport using Tween with customizable duration
local function teleportTo(destination)
    local player = game.Players.LocalPlayer
    local rootPart = player.Character:WaitForChild("HumanoidRootPart")

    -- Tweening the teleportation
    local TweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(getgenv().TeleportDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenGoal = {CFrame = CFrame.new(destination)}
    local tween = TweenService:Create(rootPart, tweenInfo, tweenGoal)
    tween:Play() -- Start the tween
    tween.Completed:Wait() -- Wait for the tween to finish
end

-- Function to check the player's position
local function checkPlayerPosition(startPosition, targetPosition)
    local player = game.Players.LocalPlayer
    local rootPart = player.Character:WaitForChild("HumanoidRootPart")

    -- Check if the player is within the tolerance range of the starting position
    if (rootPart.Position - startPosition).Magnitude <= 300 then
        teleportTo(targetPosition) -- Teleport to the specified target position
        print("Teleported to target position!")
    end
end

-- Automatically check player position when they spawn
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1) -- Wait a moment for the character to load
end)

-- Button to start monitoring position
Section:NewButton("Start Monitoring", "Start monitoring position for teleportation", function()
    local startPosition = Vector3.new(-15995, 11275, -15584) -- Starting position
    local targetPosition = Vector3.new(-15973, 11430, -16373) -- Target position

    getgenv().Toggled = true -- Enable monitoring

    while getgenv().Toggled do
        checkPlayerPosition(startPosition, targetPosition) -- Check player position every loop
        wait(1) -- Check every second for position
    end
end)

-- Button to stop monitoring position
Section:NewButton("Stop Monitoring", "Stop monitoring position", function()
    getgenv().Toggled = false -- Disable monitoring
    print("Stopped monitoring position.")
end)

-- Button to start monitoring position
Section:NewButton("Start Monitoring private server", "Start monitoring position for teleportation", function()
    local startPosition = Vector3.new(-15995, 11275, -15584) -- Starting position
    local targetPosition = Vector3.new(-15966, 11391, -16155) -- Target position

    getgenv().Toggled = true -- Enable monitoring

    while getgenv().Toggled do
        checkPlayerPosition(startPosition, targetPosition) -- Check player position every loop
        wait(1) -- Check every second for position
    end
end)

-- Button to stop monitoring position
Section:NewButton("Stop Monitoring private server", "Stop monitoring position", function()
    getgenv().Toggled = false -- Disable monitoring
    print("Stopped monitoring position.")
end)


-- Keybind to toggle the UI
Section:NewKeybind("Toggle UI", "Press H to toggle the UI", Enum.KeyCode.H, function()
    Library:ToggleUI()
end)

-- Input for setting teleport speed
Section:NewSlider("Teleport Speed (Seconds)", "Set the duration for teleportation", 1, 10, function(value)
    getgenv().TeleportDuration = value -- Update teleport duration based on slider value
end)







-- Additional Label and Button
Section:NewLabel("V.G Hub")
Section:NewButton("Load External Script", "Load a script from the web", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dekos-lgbty/adoptme/main/script"))()
end)


Section:NewLabel("AFK SRIPT")
Section:NewButton("Load External Script", "Load a script from the web", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-Afk-Remastered-Script-or-Diffrent-Cool-UI-2097"))()
end)
