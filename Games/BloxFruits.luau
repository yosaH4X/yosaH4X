-- UI Native Blox Fruits
getgenv().AutoFarm = false
getgenv().AutoBoss = false

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local FarmButton = Instance.new("TextButton")
local BossButton = Instance.new("TextButton")

ScreenGui.Name = "YosaH4X_UI"
ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0, 20, 0, 200)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Active = true
Frame.Draggable = true

FarmButton.Parent = Frame
FarmButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FarmButton.Position = UDim2.new(0, 10, 0, 20)
FarmButton.Size = UDim2.new(0, 180, 0, 50)
FarmButton.Font = Enum.Font.SourceSans
FarmButton.Text = "Auto Farm: OFF"
FarmButton.TextColor3 = Color3.new(1, 1, 1)
FarmButton.TextSize = 18

BossButton.Parent = Frame
BossButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
BossButton.Position = UDim2.new(0, 10, 0, 80)
BossButton.Size = UDim2.new(0, 180, 0, 50)
BossButton.Font = Enum.Font.SourceSans
BossButton.Text = "Auto Boss: OFF"
BossButton.TextColor3 = Color3.new(1, 1, 1)
BossButton.TextSize = 18

FarmButton.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    FarmButton.Text = getgenv().AutoFarm and "Auto Farm: ON" or "Auto Farm: OFF"
end)

BossButton.MouseButton1Click:Connect(function()
    getgenv().AutoBoss = not getgenv().AutoBoss
    BossButton.Text = getgenv().AutoBoss and "Auto Boss: ON" or "Auto Boss: OFF"
end)

-- Logic Auto Farm
spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            v.Humanoid.Health = 0
                        until not getgenv().AutoFarm or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

-- Logic Auto Boss
spawn(function()
    while task.wait() do
        if getgenv().AutoBoss then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.MaxHealth >= 50000 then
                        repeat task.wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                            v.Humanoid.Health = 0
                        until not getgenv().AutoBoss or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

print("✅ YosaH4X Native UI Loaded!")
