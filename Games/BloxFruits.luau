-- BloxFruits.luau

getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().AutoChest = false
getgenv().ESP = false

-- UI Native
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AFarm = Instance.new("TextButton")
local ABoss = Instance.new("TextButton")
local AChest = Instance.new("TextButton")
local AESP = Instance.new("TextButton")
local HideBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Frame.Position = UDim2.new(0.4, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 200, 0, 350)

AFarm.Parent = Frame
AFarm.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
AFarm.Position = UDim2.new(0, 10, 0, 10)
AFarm.Size = UDim2.new(0, 180, 0, 50)
AFarm.Text = "Auto Farm: OFF"

ABoss.Parent = Frame
ABoss.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ABoss.Position = UDim2.new(0, 10, 0, 70)
ABoss.Size = UDim2.new(0, 180, 0, 50)
ABoss.Text = "Auto Boss: OFF"

AChest.Parent = Frame
AChest.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
AChest.Position = UDim2.new(0, 10, 0, 130)
AChest.Size = UDim2.new(0, 180, 0, 50)
AChest.Text = "Chest: OFF"

AESP.Parent = Frame
AESP.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
AESP.Position = UDim2.new(0, 10, 0, 190)
AESP.Size = UDim2.new(0, 180, 0, 50)
AESP.Text = "ESP: OFF"

HideBtn.Parent = Frame
HideBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
HideBtn.Position = UDim2.new(0, 10, 0, 250)
HideBtn.Size = UDim2.new(0, 180, 0, 50)
HideBtn.Text = "Hide UI"

AFarm.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    AFarm.Text = "Auto Farm: " .. (getgenv().AutoFarm and "ON" or "OFF")
end)

ABoss.MouseButton1Click:Connect(function()
    getgenv().AutoBoss = not getgenv().AutoBoss
    ABoss.Text = "Auto Boss: " .. (getgenv().AutoBoss and "ON" or "OFF")
end)

AChest.MouseButton1Click:Connect(function()
    getgenv().AutoChest = not getgenv().AutoChest
    AChest.Text = "Chest: " .. (getgenv().AutoChest and "ON" or "OFF")
end)

AESP.MouseButton1Click:Connect(function()
    getgenv().ESP = not getgenv().ESP
    AESP.Text = "ESP: " .. (getgenv().ESP and "ON" or "OFF")
end)

HideBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
    if Frame.Visible then
        HideBtn.Text = "Hide UI"
    else
        HideBtn.Text = "Show UI"
    end
end)

-- Anti AFK
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- Main loop
spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            v.Humanoid.Health = 0
                        until v.Humanoid.Health <= 0 or not getgenv().AutoFarm
                    end
                end
            end)
        end

        if getgenv().AutoBoss then
            pcall(function()
                local boss = workspace.Enemies:FindFirstChild("Boss")
                if boss and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                    repeat task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        boss.Humanoid.Health = 0
                    until boss.Humanoid.Health <= 0 or not getgenv().AutoBoss
                end
            end)
        end

        if getgenv().AutoChest then
            pcall(function()
                for _, chest in pairs(workspace:GetChildren()) do
                    if chest.Name:match("Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.CFrame
                        wait(0.5)
                    end
                end
            end)
        end

        if getgenv().ESP then
            pcall(function()
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if not enemy:FindFirstChild("Highlight") then
                        local highlight = Instance.new("Highlight", enemy)
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
                    end
                end
            end)
        end
    end
end)
