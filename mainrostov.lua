local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZeroTracer"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ScreenGui.ResetOnSpawn = false

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local function showWelcomeNotification()
    local gui = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🌊WaveRostov Load!🌊",
        Text = "Successful Load! Приятной вам игры",
        Icon = "rbxassetid://84501783275854",
        Duration = 8
    })
end

showWelcomeNotification()

player.CharacterAdded:Connect(function()
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Spawned",
        Text = "Вы заспавнились",
        Icon = "rbxassetid://84501783275854",
        Duration = 5
    })
end)

local function createCustomNotification()
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 300, 0, 100)
    notificationFrame.Position = UDim2.new(0.5, -150, 0.1, 0)
    notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.Parent = ScreenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = notificationFrame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "🌊WaveRostov Load!🌊"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = notificationFrame
    
    local message = Instance.new("TextLabel")
    message.Size = UDim2.new(1, -20, 0, 50)
    message.Position = UDim2.new(0, 10, 0, 35)
    message.BackgroundTransparency = 1
    message.Text = "Successful Load! Приятной вам игры"
    message.TextColor3 = Color3.fromRGB(200, 200, 200)
    message.TextWrapped = true
    message.TextScaled = true
    message.Font = Enum.Font.Gotham
    message.Parent = notificationFrame
    
    notificationFrame.BackgroundTransparency = 1
    title.TextTransparency = 1
    message.TextTransparency = 1
    
    local tweenService = game:GetService("TweenService")
    local appearInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local disappearInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local appearTween = tweenService:Create(notificationFrame, appearInfo, {BackgroundTransparency = 0})
    local titleAppear = tweenService:Create(title, appearInfo, {TextTransparency = 0})
    local messageAppear = tweenService:Create(message, appearInfo, {TextTransparency = 0})
    
    local disappearTween = tweenService:Create(notificationFrame, disappearInfo, {BackgroundTransparency = 1})
    local titleDisappear = tweenService:Create(title, disappearInfo, {TextTransparency = 1})
    local messageDisappear = tweenService:Create(message, disappearInfo, {TextTransparency = 1})
    
    appearTween:Play()
    titleAppear:Play()
    messageAppear:Play()
    
    wait(5)
    
    disappearTween:Play()
    titleDisappear:Play()
    messageDisappear:Play()
    
    wait(1)
    notificationFrame:Destroy()
end

createCustomNotification()

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 531, 0, 22)
MainFrame.Position = UDim2.new(0.534, 0, 0.064, 0)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0
MainFrame.Parent = ScreenGui

local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(0)
UICorner1.Parent = MainFrame

local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 531, 0, 295)
MenuFrame.Position = UDim2.new(0, 0, 1, 0)
MenuFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
MenuFrame.BackgroundTransparency = 0
MenuFrame.Visible = false
MenuFrame.Parent = MainFrame

local MenuFrameUICorner = Instance.new("UICorner")
MenuFrameUICorner.CornerRadius = UDim.new(0)
MenuFrameUICorner.Parent = MenuFrame

local ChFrame = Instance.new("Frame")
ChFrame.Name = "ChFrame"
ChFrame.Size = UDim2.new(0, 512, 0, -1)
ChFrame.Position = UDim2.new(0.017, 0,0.125, 0)
ChFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ChFrame.Parent = MenuFrame

local FrameBot = Instance.new("Frame")
FrameBot.Name = "FrameBot"
FrameBot.Size = UDim2.new(0, 531, 0, 258)
FrameBot.Position = UDim2.new(0, 0, 0.125, 0)
FrameBot.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FrameBot.Visible = false
FrameBot.Parent = MenuFrame

local OpenCloseButton = Instance.new("TextButton")
OpenCloseButton.Name = "OpenCloseButton"
OpenCloseButton.Size = UDim2.new(0, 22, 0, 22)
OpenCloseButton.Position = UDim2.new(0, 0, 0, 0)
OpenCloseButton.BackgroundTransparency = 1
OpenCloseButton.TextSize = 14
OpenCloseButton.TextColor3 = Color3.new(1, 1, 1)
OpenCloseButton.Text = "▼"
OpenCloseButton.Font = Enum.Font.SourceSans
OpenCloseButton.Parent = MainFrame

local NameLabel = Instance.new("TextLabel")
NameLabel.Name = "NameLabel"
NameLabel.Size = UDim2.new(0, 246, 0, 22)
NameLabel.Position = UDim2.new(0.077, 0, 0, 0)
NameLabel.BackgroundTransparency = 1
NameLabel.TextSize = 16
NameLabel.TextColor3 = Color3.new(1, 1, 1)
NameLabel.Text = "WaveRostov  ///  Powered by t.me/rstwizoxu161"
NameLabel.Font = Enum.Font.SourceSans
NameLabel.Parent = MainFrame

local BotButton = Instance.new("TextButton")
BotButton.Name = "BotButton"
BotButton.Size = UDim2.new(0, 67,0, 24)
BotButton.Position = UDim2.new(0.041, 0,0.041, 0)
BotButton.BackgroundTransparency = 0
BotButton.BackgroundColor3 = Color3.new(0.1255, 0.1255, 0.1255)
BotButton.TextSize = 16
BotButton.TextColor3 = Color3.new(1, 1, 1)
BotButton.Text = "Bot"
BotButton.Font = Enum.Font.SourceSans
BotButton.Parent = MenuFrame

local BotUICorner = Instance.new("UICorner")
BotUICorner.CornerRadius = UDim.new(0,3, 0)
BotUICorner.Parent = BotButton

local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Size = UDim2.new(0, 26, 0, 26)
AutoFarmButton.Position = UDim2.new(0.019, 0, 0.053, 0)
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
AutoFarmButton.BackgroundTransparency = 0
AutoFarmButton.TextSize = 14
AutoFarmButton.TextColor3 = Color3.fromRGB(0, 110, 255)
AutoFarmButton.Text = ""
AutoFarmButton.Font = Enum.Font.SourceSans
AutoFarmButton.Parent = FrameBot

local AutoFarmUICorner = Instance.new("UICorner")
AutoFarmUICorner.CornerRadius = UDim.new(0,5, 0)
AutoFarmUICorner.Parent = AutoFarmButton

local AutoFarmLabel = Instance.new("TextLabel")
AutoFarmLabel.Name = "AutoFarmLabel"
AutoFarmLabel.Size = UDim2.new(0, 52, 0, 31)
AutoFarmLabel.Position = UDim2.new(2.715, 0, -0.105, 0)
AutoFarmLabel.BackgroundTransparency = 1
AutoFarmLabel.TextSize = 18
AutoFarmLabel.TextColor3 = Color3.new(1, 1, 1)
AutoFarmLabel.Text = "AutoFarm(Грузчик)"
AutoFarmLabel.Font = Enum.Font.SourceSans
AutoFarmLabel.Parent = AutoFarmButton

local AutoFarmButton2 = Instance.new("TextButton")
AutoFarmButton2.Name = "AutoFarmButton2"
AutoFarmButton2.Size = UDim2.new(0, 26, 0, 26)
AutoFarmButton2.Position = UDim2.new(0.019, 0 ,0.204, 0)
AutoFarmButton2.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
AutoFarmButton2.BackgroundTransparency = 0
AutoFarmButton2.TextSize = 14
AutoFarmButton2.TextColor3 = Color3.fromRGB(0, 110, 255)
AutoFarmButton2.Text = ""
AutoFarmButton2.Font = Enum.Font.SourceSans
AutoFarmButton2.Parent = FrameBot

local AutoFarmLabel2 = Instance.new("TextLabel")
AutoFarmLabel2.Name = "AutoFarmLabel2"
AutoFarmLabel2.Size = UDim2.new(0, 52, 0, 31)
AutoFarmLabel2.Position = UDim2.new(2.715, 0, -0.105, 0)
AutoFarmLabel2.BackgroundTransparency = 1
AutoFarmLabel2.TextSize = 18
AutoFarmLabel2.TextColor3 = Color3.new(1, 1, 1)
AutoFarmLabel2.Text = "AutoFarm(Бандит)"
AutoFarmLabel2.Font = Enum.Font.SourceSans
AutoFarmLabel2.Parent = AutoFarmButton2

local AutoFarmUICorner2 = Instance.new("UICorner")
AutoFarmUICorner2.CornerRadius = UDim.new(0,8, 0)
AutoFarmUICorner2.Parent = AutoFarmButton2

local ButtonVisuals = Instance.new("TextButton")
ButtonVisuals.Name = "ButtonVisuals"
ButtonVisuals.Size = UDim2.new(0, 67,0, 24)
ButtonVisuals.Position = UDim2.new(0.202, 0,0.041, 0)
ButtonVisuals.BackgroundTransparency = 0
ButtonVisuals.BackgroundColor3 = Color3.new(0.1255, 0.1255, 0.1255)
ButtonVisuals.TextSize = 16
ButtonVisuals.TextColor3 = Color3.new(1, 1, 1)
ButtonVisuals.Text = "Visuals"
ButtonVisuals.Font = Enum.Font.SourceSans
ButtonVisuals.Parent = MenuFrame

local VisualsUICorner = Instance.new("UICorner")
VisualsUICorner.CornerRadius = UDim.new(0,3, 0)
VisualsUICorner.Parent = ButtonVisuals

local FrameVisuals = Instance.new("Frame")
FrameVisuals.Name = "FrameVisuals"
FrameVisuals.Size = UDim2.new(0, 531, 0, 258)
FrameVisuals.Position = UDim2.new(0, 0, 0.125, 0)
FrameVisuals.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FrameVisuals.Visible = false
FrameVisuals.Parent = MenuFrame

local ChamsCar = Instance.new("TextButton")
ChamsCar.Name = "ChamsCar"
ChamsCar.Size = UDim2.new(0, 26,0, 26)
ChamsCar.Position = UDim2.new(0.339, 0,0.189, 0)
ChamsCar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ChamsCar.BackgroundTransparency = 0
ChamsCar.TextSize = 14
ChamsCar.TextColor3 = Color3.fromRGB(0, 110, 255)
ChamsCar.Text = ""
ChamsCar.Font = Enum.Font.SourceSans
ChamsCar.Parent = FrameVisuals

local ChamsCarUICorner = Instance.new("UICorner")
ChamsCarUICorner.CornerRadius = UDim.new(0,8, 0)
ChamsCarUICorner.Parent = ChamsCar

local ChamsCarLabel = Instance.new("TextLabel")
ChamsCarLabel.Name = "ChamsCarLabel"
ChamsCarLabel.Size = UDim2.new(0, 52, 0, 31)
ChamsCarLabel.Position = UDim2.new(1.407, 0,-0.105, 0)
ChamsCarLabel.BackgroundTransparency = 1
ChamsCarLabel.TextSize = 18
ChamsCarLabel.TextColor3 = Color3.new(1, 1, 1)
ChamsCarLabel.Text = "ChamsCar"
ChamsCarLabel.Font = Enum.Font.SourceSans
ChamsCarLabel.Parent = ChamsCar

local ChamsBankomat = Instance.new("TextButton")
ChamsBankomat.Name = "ChamsBankomat"
ChamsBankomat.Size = UDim2.new(0, 26,0, 26)
ChamsBankomat.Position = UDim2.new(0.339, 0,0.049, 0)
ChamsBankomat.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
ChamsBankomat.BackgroundTransparency = 0
ChamsBankomat.TextSize = 14
ChamsBankomat.TextColor3 = Color3.fromRGB(0, 110, 255)
ChamsBankomat.Text = ""
ChamsBankomat.Font = Enum.Font.SourceSans
ChamsBankomat.Parent = FrameVisuals

local ChamsBankomatUICorner = Instance.new("UICorner")
ChamsBankomatUICorner.CornerRadius = UDim.new(0,8, 0)
ChamsBankomatUICorner.Parent = ChamsBankomat

local ChamsBankomatLabel = Instance.new("TextLabel")
ChamsBankomatLabel.Name = "ChamsBankomatLabel"
ChamsBankomatLabel.Size = UDim2.new(0, 100, 0, 31)
ChamsBankomatLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
ChamsBankomatLabel.BackgroundTransparency = 1
ChamsBankomatLabel.TextSize = 18
ChamsBankomatLabel.TextColor3 = Color3.new(1, 1, 1)
ChamsBankomatLabel.Text = "ChamsBankomat"
ChamsBankomatLabel.Font = Enum.Font.SourceSans
ChamsBankomatLabel.Parent = ChamsBankomat

local BoxTextButton = Instance.new("TextButton")
BoxTextButton.Name = "BoxTextButton"
BoxTextButton.Size = UDim2.new(0, 26, 0, 26)
BoxTextButton.Position = UDim2.new(0.012, 0, 0.038, 0)
BoxTextButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
BoxTextButton.BackgroundTransparency = 0
BoxTextButton.TextSize = 14
BoxTextButton.TextColor3 = Color3.fromRGB(0, 110, 255)
BoxTextButton.Text = ""
BoxTextButton.Font = Enum.Font.SourceSans
BoxTextButton.Parent = FrameVisuals

local BoxTextButtonUiCorner = Instance.new("UICorner")
BoxTextButtonUiCorner.CornerRadius = UDim.new(0,8, 0)
BoxTextButtonUiCorner.Parent = BoxTextButton

local BoxTextLabel = Instance.new("TextLabel")
BoxTextLabel.Name = "BoxTextLabel"
BoxTextLabel.Size = UDim2.new(0, 52, 0, 31)
BoxTextLabel.Position = UDim2.new(1.407, 0, -0.105, 0)
BoxTextLabel.BackgroundTransparency = 1
BoxTextLabel.TextSize = 18
BoxTextLabel.TextColor3 = Color3.new(1, 1, 1)
BoxTextLabel.Text = "box"
BoxTextLabel.Font = Enum.Font.SourceSans
BoxTextLabel.Parent = BoxTextButton

local NameTextButton = Instance.new("TextButton")
NameTextButton.Name = "NameTextButton"
NameTextButton.Size = UDim2.new(0, 26, 0, 26)
NameTextButton.Position = UDim2.new(0.012, 0, 0.184, 0)
NameTextButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
NameTextButton.BackgroundTransparency = 0
NameTextButton.TextSize = 14
NameTextButton.TextColor3 = Color3.fromRGB(0, 110, 255)
NameTextButton.Text = ""
NameTextButton.Font = Enum.Font.SourceSans
NameTextButton.Parent = FrameVisuals

local NameTextLabel = Instance.new("TextLabel")
NameTextLabel.Name = "NameTextLabel"
NameTextLabel.Size = UDim2.new(0, 52, 0, 31)
NameTextLabel.Position = UDim2.new(1.379, 0, -0.105, 0)
NameTextLabel.BackgroundTransparency = 1
NameTextLabel.TextSize = 18
NameTextLabel.TextColor3 = Color3.new(1, 1, 1)
NameTextLabel.Text = "name"
NameTextLabel.Font = Enum.Font.SourceSans
NameTextLabel.Parent = NameTextButton

local NameTextButtonUiCorner = Instance.new("UICorner")
NameTextButtonUiCorner.CornerRadius = UDim.new(0,8, 0)
NameTextButtonUiCorner.Parent = NameTextButton

local SettingsFrame2 = Instance.new("Frame")
SettingsFrame2.Name = "SettingsFrame2"
SettingsFrame2.Size = UDim2.new(0, 150, 0, 40)
SettingsFrame2.Position = UDim2.new(0.3, 0, 0.1, 0)
SettingsFrame2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SettingsFrame2.BackgroundTransparency = 0.1
SettingsFrame2.Visible = false
SettingsFrame2.Parent = FrameVisuals

local SettingsFrame2UICorner = Instance.new("UICorner")
SettingsFrame2UICorner.CornerRadius = UDim.new(0, 5)
SettingsFrame2UICorner.Parent = SettingsFrame2

local ColorTextBox = Instance.new("TextBox")
ColorTextBox.Name = "ColorTextBox"
ColorTextBox.Size = UDim2.new(0.8, 0, 0.5, 0)
ColorTextBox.Position = UDim2.new(0.1, 0, 0.25, 0)
ColorTextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ColorTextBox.TextColor3 = Color3.new(1, 1, 1)
ColorTextBox.TextSize = 14
ColorTextBox.PlaceholderText = "Enter color/rainbow"
ColorTextBox.Text = "white"
ColorTextBox.ClearTextOnFocus = false
ColorTextBox.Parent = SettingsFrame2

local carHighlightsEnabled = false
local carActiveHighlights = {}
local carsFolderConnection = nil
local carCheckLoop = nil

local bankomatHighlightsEnabled = false
local bankomatActiveHighlights = {}

local autoTeleportEnabled = false
local isRunning = false
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local autoTeleportEnabled2 = false
local isRunning2 = false

local outlinesEnabled = false
local localOutlines = Instance.new("Folder")
localOutlines.Name = "ClientBodyOutlines"
localOutlines.Parent = FrameVisuals

local nametagsEnabled = false
local nametagsFolder = Instance.new("Folder")
nametagsFolder.Name = "LocalNametags"
nametagsFolder.Parent = FrameVisuals

local OUTLINE_COLOR = Color3.fromRGB(255, 255, 255)
local OUTLINE_THICKNESS = 1
local RAINBOW_MODE = false
local rainbowConnections = {}

local colorMap = {
    red = Color3.fromRGB(255, 0, 0),
    green = Color3.fromRGB(0, 255, 0),
    blue = Color3.fromRGB(0, 0, 255),
    yellow = Color3.fromRGB(255, 255, 0),
    purple = Color3.fromRGB(128, 0, 128),
    orange = Color3.fromRGB(255, 165, 0),
    pink = Color3.fromRGB(255, 192, 203),
    black = Color3.fromRGB(0, 0, 0),
    white = Color3.fromRGB(255, 255, 255),
    cyan = Color3.fromRGB(0, 255, 255),
    magenta = Color3.fromRGB(255, 0, 255),
    brown = Color3.fromRGB(165, 42, 42),
    gray = Color3.fromRGB(128, 128, 128),
    darkred = Color3.fromRGB(139, 0, 0),
    darkgreen = Color3.fromRGB(0, 100, 0),
    darkblue = Color3.fromRGB(0, 0, 139),
    darkgray = Color3.fromRGB(169, 169, 169),
    lightblue = Color3.fromRGB(173, 216, 230),
    lightgreen = Color3.fromRGB(144, 238, 144)
}

local positions = {
    Vector3.new(5144.60595703125, 87.04823303222656, 1120.1256103515625),
    Vector3.new(5070.3623046875, 94.11610412597656, 1124.9158935546875)
}

local positions2 = {
    Vector3.new(4802.25048828125, 87.0907211303711, -1142.975341796875),
    Vector3.new(67.22386932373047, 87.09380340576172, -3207.224853515625),
    Vector3.new(-32.11979675292969, 87.09135437011719, -1515.8731689453125),
    Vector3.new(111.8641586303711, 87.09136199951172, -164.25643920898438)
}

local function createModelHighlight(model, color)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = model
    highlight.Parent = model
    highlight.FillTransparency = 1
    highlight.OutlineColor = color
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    highlight.Enabled = true
    
    return highlight
end

local function isValidCar(model)
    if not model:IsA("Model") then
        return false
    end
    
    if model.Parent == nil or model.Parent:IsA("Model") then
        return false
    end
    
    local hasSeat = model:FindFirstChildWhichIsA("VehicleSeat") or model:FindFirstChild("DriveSeat")
    local hasBaseParts = false
    
    for _, part in pairs(model:GetChildren()) do
        if part:IsA("BasePart") then
            hasBaseParts = true
            break
        end
    end
    
    return hasBaseParts and (hasSeat or model.Parent.Name == "Cars")
end

local function quickCarCheck()
    local carsFolder = workspace:FindFirstChild("Cars")
    if not carsFolder then return 0 end
    
    local carsProcessed = 0
    
    for _, carModel in pairs(carsFolder:GetChildren()) do
        if isValidCar(carModel) then
            local existingHighlight = carModel:FindFirstChildOfClass("Highlight")
            if not existingHighlight then
                local highlight = createModelHighlight(carModel, Color3.fromRGB(255, 0, 4))
                table.insert(carActiveHighlights, highlight)
                carsProcessed = carsProcessed + 1
            end
        end
    end
    
    return carsProcessed
end

local function enableCarHighlights()
    local carsFolder = workspace:FindFirstChild("Cars")
    
    if carsFolder then
        print("Папка 'Cars' найдена, включение подсветки...")
        
        local initialCars = quickCarCheck()
        print("Начально обработано автомобилей: " .. initialCars)
        
        carsFolderConnection = carsFolder.ChildAdded:Connect(function(child)
            task.wait(0.1)
            
            if isValidCar(child) and carHighlightsEnabled then
                local existingHighlight = child:FindFirstChildOfClass("Highlight")
                if existingHighlight then
                    existingHighlight:Destroy()
                end
                

                local highlight = createModelHighlight(child, Color3.fromRGB(255, 0, 4))
                table.insert(carActiveHighlights, highlight)
                print("Автоматически создана подсветка для нового автомобиля: " .. child.Name)
            end
        end)
        
        carCheckLoop = RunService.Heartbeat:Connect(function()
            if carHighlightsEnabled then
                quickCarCheck()
            end
        end)
        
        print("Подсветка Cars ВКЛЮЧЕНА! Отслеживание новых автомобилей активно.")
        carHighlightsEnabled = true
        
    else
        warn("Папка 'Cars' не найдена в Workspace!")
        
        local possibleNames = {"Vehicles", "Cars", "Автомобили", "Машины"}
        for _, name in ipairs(possibleNames) do
            local potentialFolder = workspace:FindFirstChild(name)
            if potentialFolder then
                print("Найдена папка с названием: " .. name)
                enableCarHighlights()
                return
            end
        end
    end
end

local function disableCarHighlights()
    if carsFolderConnection then
        carsFolderConnection:Disconnect()
        carsFolderConnection = nil
    end
    
    if carCheckLoop then
        carCheckLoop:Disconnect()
        carCheckLoop = nil
    end
    
    for _, highlight in pairs(carActiveHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    
    carActiveHighlights = {}
    print("Подсветка Cars ВЫКЛЮЧЕНА! Отслеживание новых автомобилей остановлено.")
    carHighlightsEnabled = false
end

local function toggleCarHighlights()
    if carHighlightsEnabled then
        disableCarHighlights()
        return false
    else
        enableCarHighlights()
        return true
    end
end

local function enableBankomatHighlights()
    local bankomatFolder = workspace:FindFirstChild("Bankomati")
    
    if bankomatFolder then
        for _, obj in pairs(bankomatFolder:GetDescendants()) do
            if obj:IsA("BasePart") then
                local existingHighlight = obj:FindFirstChildOfClass("Highlight")
                
                if existingHighlight then
                    existingHighlight:Destroy()
                end
                
                local highlight = createModelHighlight(obj, Color3.fromRGB(0, 255, 8))
                table.insert(bankomatActiveHighlights, highlight)
            end
        end
        print("Подсветка Bankomati ВКЛЮЧЕНА!")
        bankomatHighlightsEnabled = true
    else
        warn("Папка 'Bankomati' не найдена в Workspace!")
    end
end

local function disableBankomatHighlights()
    for _, highlight in pairs(bankomatActiveHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    
    bankomatActiveHighlights = {}
    print("Подсветка Bankomati ВЫКЛЮЧЕНА!")
    bankomatHighlightsEnabled = false
end

local function toggleBankomatHighlights()
    if bankomatHighlightsEnabled then
        disableBankomatHighlights()
        return false
    else
        enableBankomatHighlights()
        return true
    end
end

local function safeTeleport(position)
    if not character or not humanoidRootPart then
        character = player.Character
        if character then
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        else
            return false
        end
    end

    pcall(function()
        humanoidRootPart.CFrame = CFrame.new(position)
    end)
    return true
end

local function findProximityPrompts()
    local foundPrompts = {}
    local descendants = workspace:GetDescendants()
    for _, obj in ipairs(descendants) do
        if obj:IsA("ProximityPrompt") and obj.Enabled then
            table.insert(foundPrompts, obj)
        end
    end
    return foundPrompts
end

local function activateNearestPrompt()
    local prompts = findProximityPrompts()
    local closestPrompt = nil
    local closestDistance = math.huge

    for _, prompt in ipairs(prompts) do
        local promptPart = prompt.Parent
        if promptPart and promptPart:IsA("Model") then
            promptPart = promptPart.PrimaryPart
        end

        if promptPart and promptPart:IsA("BasePart") then
            local distance = (humanoidRootPart.Position - promptPart.Position).Magnitude
            if distance <= prompt.MaxActivationDistance and distance < closestDistance then
                closestDistance = distance
                closestPrompt = prompt
            end
        end
    end

    if closestPrompt then
        pcall(function()
            closestPrompt:InputHoldBegin()
            task.wait(0.2)
            closestPrompt:InputHoldEnd()
        end)
        return true
    end
    return false
end

local function waitAndActivatePrompt(waitTime)
    local activated = false
    local startTime = tick()
    while tick() - startTime < waitTime do
        if activateNearestPrompt() then
            activated = true
            break
        end
        task.wait(0.5)
    end
    return activated
end

local function teleportationCycle()
    if isRunning then return end
    isRunning = true

    while autoTeleportEnabled do
        if safeTeleport(positions[1]) then
            task.wait(2)
            waitAndActivatePrompt(3)
            task.wait(1)
        end

        if not autoTeleportEnabled then break end

        if safeTeleport(positions[2]) then
            task.wait(2)
            waitAndActivatePrompt(3)
            task.wait(1)
        end

        if not autoTeleportEnabled then break end
        task.wait(3)
    end

    isRunning = false
end

local function safeTeleport2(position)
    if not character or not humanoidRootPart then
        character = player.Character
        if character then
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        else
            return false
        end
    end

    pcall(function()
        humanoidRootPart.CFrame = CFrame.new(position)
    end)

    return true
end

local function findProximityPrompts2()
    local foundPrompts = {}
    local descendants = workspace:GetDescendants()

    for _, obj in ipairs(descendants) do
        if obj:IsA("ProximityPrompt") and obj.Enabled then
            table.insert(foundPrompts, obj)
        end
    end

    return foundPrompts
end

local function activatePromptWithHold(prompt)
    if not prompt or not prompt.Enabled then
        return false
    end

    print("Активация ProximityPrompt с удержанием 3 секунды")
    
    pcall(function()
        if prompt.HoldDuration > 0 then
            prompt:InputHoldBegin()
            
            local holdTime = prompt.HoldDuration
            local startTime = tick()
            
            while tick() - startTime < holdTime and autoTeleportEnabled2 do
                task.wait(0.1)
            end
            
            if autoTeleportEnabled2 then
                prompt:InputHoldEnd()
            else
                prompt:InputHoldEnd()
            end
        else
            ProximityPromptService:PromptTriggered(prompt, player)
        end
    end)

    return true
end

local function activateNearestPromptWithHold()
    local prompts = findProximityPrompts2()
    local closestPrompt = nil
    local closestDistance = math.huge

    for _, prompt in ipairs(prompts) do
        local promptPart = prompt.Parent
        if promptPart and promptPart:IsA("Model") then
            promptPart = promptPart.PrimaryPart
        end

        if promptPart and promptPart:IsA("BasePart") then
            local distance = (humanoidRootPart.Position - promptPart.Position).Magnitude
            if distance <= prompt.MaxActivationDistance and distance < closestDistance then
                closestDistance = distance
                closestPrompt = prompt
            end
        end
    end

    if closestPrompt then
        return activatePromptWithHold(closestPrompt)
    end

    return false
end

local function waitAndActivatePromptWithHold(waitTime)
    local activated = false
    local startTime = tick()

    while tick() - startTime < waitTime and autoTeleportEnabled2 do
        if activateNearestPromptWithHold() then
            activated = true
            break
        end
        task.wait(0.5)
    end

    return activated
end

local function teleportationCycle2()
    if isRunning2 then 
        print("Цикл бандита уже запущен!")
        return 
    end

    isRunning2 = true
    print("Цикл телепортации бандита запущен")
    
    local currentPositionIndex = 1

    while autoTeleportEnabled2 do
        print("Телепортация бандита на позицию " .. currentPositionIndex)
        
        if safeTeleport2(positions2[currentPositionIndex]) then
            task.wait(2)
            
            print("Активация ProximityPrompt с удержанием...")
            waitAndActivatePromptWithHold(5)
            
            print("Ожидание 54 секунды...")
            local waitStart = tick()
            while tick() - waitStart < 54 and autoTeleportEnabled2 do
                task.wait(1)
            end
        end

        if not autoTeleportEnabled2 then break end
        
        currentPositionIndex = currentPositionIndex + 1
        if currentPositionIndex > #positions2 then
            currentPositionIndex = 1
        end
        
        print("Переход к следующей позиции бандита: " .. currentPositionIndex)
    end

    print("Цикл телепортации бандита остановлен")
    isRunning2 = false
end

local function stopRainbowEffect()
    for _, connection in ipairs(rainbowConnections) do
        connection:Disconnect()
    end
    rainbowConnections = {}
end

local function startRainbowEffect()
    stopRainbowEffect()

    if not RAINBOW_MODE or not outlinesEnabled then return end

    local rainbowConnection
    local hue = 0

    rainbowConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if not RAINBOW_MODE or not outlinesEnabled then
            rainbowConnection:Disconnect()
            return
        end

        hue = (hue + deltaTime * 180) % 360
        local rainbowColor = Color3.fromHSV(hue/360, 1, 1)

        for _, outline in ipairs(localOutlines:GetChildren()) do
            local frame = outline:FindFirstChildWhichIsA("Frame")
            if frame then
                local uiStroke = frame:FindFirstChildWhichIsA("UIStroke")
                if uiStroke then
                    uiStroke.Color = rainbowColor
                end
            end
        end
    end)

    table.insert(rainbowConnections, rainbowConnection)
end

local function textToColor(text)
    text = string.lower(text:gsub("%s+", ""))

    if text == "rainbow" then
        RAINBOW_MODE = true
        if outlinesEnabled then
            startRainbowEffect()
        end
        return OUTLINE_COLOR
    else
        RAINBOW_MODE = false
        stopRainbowEffect()
    end

    if colorMap[text] then
        return colorMap[text]
    end

    local r, g, b = text:match("^(%d+)[,%s]*(%d+)[,%s]*(%d+)$")
    if r and g and b then
        return Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
    end

    local hex = text:match("^#?(%x%x%x%x%x%x)$")
    if hex then
        local r = tonumber(hex:sub(1, 2), 16) or 255
        local g = tonumber(hex:sub(3, 4), 16) or 255
        local b = tonumber(hex:sub(5, 6), 16) or 255
        return Color3.fromRGB(r, g, b)
    end

    return Color3.fromRGB(255, 255, 255)
end

local function updateOutlineColor(newColor)
    OUTLINE_COLOR = newColor

    for _, outline in ipairs(localOutlines:GetChildren()) do
        local frame = outline:FindFirstChildWhichIsA("Frame")
        if frame then
            local uiStroke = frame:FindFirstChildWhichIsA("UIStroke")
            if uiStroke then
                uiStroke.Color = OUTLINE_COLOR
            end
        end
    end
end

local function getBoxSize(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return 3.5, 4
    end
    
    if humanoid.RigType == Enum.HumanoidRigType.R6 then
        return 4, 5
    else
        return 4, 5
    end
end

local function getBoxAttachmentPoint(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid and humanoid.RigType == Enum.HumanoidRigType.R6 then
        return character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    else
        return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
    end
end

local function getBoxOffset(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return Vector3.new(0, 0, 0)
    end
    
    if humanoid.RigType == Enum.HumanoidRigType.R6 then
        return Vector3.new(0, 0.5, 0)
    else
        return Vector3.new(0, 1, 0)
    end
end

local function isValidCharacter(character)
    if not character then return false end
    if not character:FindFirstChild("Humanoid") then return false end
    if not character:FindFirstChild("HumanoidRootPart") then return false end
    if character:FindFirstChild("Humanoid").Health <= 0 then return false end
    return true
end

local boxConnections = {}
local nameConnections = {}

local function createOutline(player)
    if not outlinesEnabled or player == Players.LocalPlayer then return end

    local function initCharacter(character)
        if not isValidCharacter(character) then 
            if localOutlines:FindFirstChild(player.Name) then
                localOutlines[player.Name]:Destroy()
            end
            return 
        end
        
        if localOutlines:FindFirstChild(player.Name) then
            localOutlines[player.Name]:Destroy()
        end

        local humanoid = character:WaitForChild("Humanoid")
        local attachmentPoint = getBoxAttachmentPoint(character)
        
        if not attachmentPoint then
            warn("Не найдена точка крепления для бокса у игрока: " .. player.Name)
            return
        end

        local width, height = getBoxSize(character)
        local boxOffset = getBoxOffset(character)

        local billboard = Instance.new("BillboardGui")
        billboard.Name = player.Name
        billboard.Adornee = attachmentPoint
        billboard.Size = UDim2.new(width, 0, height, 0)
        billboard.StudsOffset = boxOffset
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 0
        billboard.SizeOffset = Vector2.new(0, 0)
        billboard.ExtentsOffset = Vector3.new(0, 0, 0)
        billboard.LightInfluence = 0
        billboard.ClipsDescendants = false
        billboard.Enabled = true
        billboard.Parent = localOutlines

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.BorderSizePixel = 0

        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = OUTLINE_COLOR
        uiStroke.Thickness = OUTLINE_THICKNESS
        uiStroke.Transparency = 0
        uiStroke.Parent = frame

        frame.Parent = billboard

        local function constantUpdate()
            if not billboard or not billboard.Parent then return end
            
            if not isValidCharacter(character) then
                if localOutlines:FindFirstChild(player.Name) then
                    localOutlines[player.Name]:Destroy()
                end
                return
            end

            local currentAttachment = getBoxAttachmentPoint(character)
            if currentAttachment and billboard.Adornee ~= currentAttachment then
                billboard.Adornee = currentAttachment
            end

            billboard.Enabled = true
        end

        if boxConnections[player.Name] then
            boxConnections[player.Name]:Disconnect()
        end
        
        boxConnections[player.Name] = RunService.Heartbeat:Connect(constantUpdate)
        
        humanoid.Died:Connect(function()
            if localOutlines:FindFirstChild(player.Name) then
                localOutlines[player.Name]:Destroy()
            end
            if boxConnections[player.Name] then
                boxConnections[player.Name]:Disconnect()
                boxConnections[player.Name] = nil
            end
        end)
    end

    player.CharacterAdded:Connect(initCharacter)
    
    player:GetPropertyChangedSignal("Parent"):Connect(function()
        if player.Parent == nil then
            if localOutlines:FindFirstChild(player.Name) then
                localOutlines[player.Name]:Destroy()
            end
            if boxConnections[player.Name] then
                boxConnections[player.Name]:Disconnect()
                boxConnections[player.Name] = nil
            end
        end
    end)
    
    if player.Character then
        initCharacter(player.Character)
    end
end

local function toggleOutlines()
    outlinesEnabled = not outlinesEnabled

    if outlinesEnabled then
        BoxTextButton.Text = "✓"
        SettingsFrame2.Visible = true
        
        for _, player in ipairs(Players:GetPlayers()) do
            createOutline(player)
        end
        
        Players.PlayerAdded:Connect(createOutline)

        if RAINBOW_MODE then
            startRainbowEffect()
        end
    else
        BoxTextButton.Text = ""
        SettingsFrame2.Visible = false
        localOutlines:ClearAllChildren()
        stopRainbowEffect()
        
        for playerName, connection in pairs(boxConnections) do
            connection:Disconnect()
        end
        boxConnections = {}
    end
end

local function createNametag(player)
    if not nametagsEnabled or player == Players.LocalPlayer then return end

    local function initCharacter(character)
        if not isValidCharacter(character) then 
            if nametagsFolder:FindFirstChild(player.Name) then
                nametagsFolder[player.Name]:Destroy()
            end
            return 
        end
        
        if nametagsFolder:FindFirstChild(player.Name) then
            nametagsFolder[player.Name]:Destroy()
        end

        local head = character:WaitForChild("Head")

        local billboard = Instance.new("BillboardGui")
        billboard.Name = player.Name
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 0
        billboard.SizeOffset = Vector2.new(0, 0)
        billboard.ExtentsOffset = Vector3.new(0, 0, 0)
        billboard.LightInfluence = 0
        billboard.ClipsDescendants = false
        billboard.Enabled = true
        billboard.Parent = nametagsFolder

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = player.Name
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextSize = 20
        textLabel.TextScaled = false
        textLabel.TextWrapped = false
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        textLabel.TextStrokeTransparency = 0.3
        textLabel.BackgroundTransparency = 1
        textLabel.BorderSizePixel = 0
        textLabel.ZIndex = 10
        textLabel.Parent = billboard

        local function constantUpdate()
            if not billboard or not billboard.Parent then return end
            
            if not isValidCharacter(character) then
                if nametagsFolder:FindFirstChild(player.Name) then
                    nametagsFolder[player.Name]:Destroy()
                end
                return
            end

            billboard.Enabled = true
            
            if head and billboard.Adornee ~= head then
                billboard.Adornee = head
            end
        end

        if nameConnections[player.Name] then
            nameConnections[player.Name]:Disconnect()
        end
        
        nameConnections[player.Name] = RunService.Heartbeat:Connect(constantUpdate)
        
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                if nametagsFolder:FindFirstChild(player.Name) then
                    nametagsFolder[player.Name]:Destroy()
                end
                if nameConnections[player.Name] then
                    nameConnections[player.Name]:Disconnect()
                    nameConnections[player.Name] = nil
                end
            end)
        end
    end

    player.CharacterAdded:Connect(initCharacter)
    
    player:GetPropertyChangedSignal("Parent"):Connect(function()
        if player.Parent == nil then
            if nametagsFolder:FindFirstChild(player.Name) then
                nametagsFolder[player.Name]:Destroy()
            end
            if nameConnections[player.Name] then
                nameConnections[player.Name]:Disconnect()
                nameConnections[player.Name] = nil
            end
        end
    end)
    
    if player.Character then
        initCharacter(player.Character)
    end
end

local function toggleNametags()
    nametagsEnabled = not nametagsEnabled

    if nametagsEnabled then
        NameTextButton.Text = "✓"
        
        for _, player in ipairs(Players:GetPlayers()) do
            createNametag(player)
        end
        
        Players.PlayerAdded:Connect(createNametag)
    else
        NameTextButton.Text = ""
        nametagsFolder:ClearAllChildren()
        
        for playerName, connection in pairs(nameConnections) do
            connection:Disconnect()
        end
        nameConnections = {}
    end
end

ChamsCar.MouseButton1Click:Connect(function()
    print("Кнопка ChamsCar нажата!")
    local isEnabled = toggleCarHighlights()
    
    if isEnabled then
        ChamsCar.Text = "✓"
    else
        ChamsCar.Text = ""
    end
end)

ChamsBankomat.MouseButton1Click:Connect(function()
    print("Кнопка ChamsBankomat нажата!")
    local isEnabled = toggleBankomatHighlights()
    
    if isEnabled then
        ChamsBankomat.Text = "✓"
    else
        ChamsBankomat.Text = ""
    end
end)

AutoFarmButton.MouseButton1Click:Connect(function()
    autoTeleportEnabled = not autoTeleportEnabled
    if autoTeleportEnabled then
        AutoFarmButton.Text = "✓"
        teleportationCycle()
    else
        AutoFarmButton.Text = ""
    end
end)

AutoFarmButton2.MouseButton1Click:Connect(function()
    print("Кнопка AutoFarmButton2 нажата!")
    autoTeleportEnabled2 = not autoTeleportEnabled2
    
    if autoTeleportEnabled2 then
        AutoFarmButton2.Text = "✓"
        teleportationCycle2()
    else
        AutoFarmButton2.Text = ""
    end
end)

BoxTextButton.MouseButton1Click:Connect(function()
    toggleOutlines()
end)

NameTextButton.MouseButton1Click:Connect(function()
    toggleNametags()
end)

ColorTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed or ColorTextBox.Text ~= "" then
        local newColor = textToColor(ColorTextBox.Text)
        updateOutlineColor(newColor)
    end
end)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
    
    if autoTeleportEnabled then
        task.wait(2)
        teleportationCycle()
    end
    
    if autoTeleportEnabled2 then
        task.wait(2)
        teleportationCycle2()
    end
end)

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

OpenCloseButton.MouseButton1Click:Connect(function()
    MenuFrame.Visible = not MenuFrame.Visible
    if MenuFrame.Visible then
        OpenCloseButton.Text = "▼"
    else
        OpenCloseButton.Text = "►"
    end
end)

BotButton.MouseButton1Click:Connect(function()
    FrameBot.Visible = not FrameBot.Visible
    FrameVisuals.Visible = false
    if FrameBot.Visible then
        BotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        ButtonVisuals.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    else
        BotButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

ButtonVisuals.MouseButton1Click:Connect(function()
    FrameVisuals.Visible = not FrameVisuals.Visible
    FrameBot.Visible = false
    if FrameVisuals.Visible then
        ButtonVisuals.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        BotButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    else
        ButtonVisuals.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

ScreenGui.Destroying:Connect(function()
    disableCarHighlights()
    disableBankomatHighlights()
    stopRainbowEffect()
    if outlinesEnabled then
        localOutlines:ClearAllChildren()
    end
    if nametagsEnabled then
        nametagsFolder:ClearAllChildren()
    end
    
    for playerName, connection in pairs(boxConnections) do
        connection:Disconnect()
    end
    for playerName, connection in pairs(nameConnections) do
        connection:Disconnect()
    end
    boxConnections = {}
    nameConnections = {}
end)