-- BloxFruits.luau

getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().AutoChest = false
getgenv().ESP = false

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 220, 0, 300)
MainFrame.Position = UDim2.new(0.4, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.2

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, -35)
Title.BackgroundTransparency = 1
Title.Text = "🌸 yosaH4X 🌸"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local function createButton(text, posY)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.Text = text .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    return btn
end

local FarmBtn = createButton("Auto Farm", 10)
local BossBtn = createButton("Auto Boss", 60)
local ChestBtn = createButton("Chest", 110)
local ESPBtn = createButton("ESP", 160)

FarmBtn.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    FarmBtn.Text = "Auto Farm: " .. (getgenv().AutoFarm and "ON" or "OFF")
end)

BossBtn.MouseButton1Click:Connect(function()
    getgenv().AutoBoss = not getgenv().AutoBoss
    BossBtn.Text = "Auto Boss: " .. (getgenv().AutoBoss and "ON" or "OFF")
end)

ChestBtn.MouseButton1Click:Connect(function()
    getgenv().AutoChest = not getgenv().AutoChest
    ChestBtn.Text = "Chest: " .. (getgenv().AutoChest and "ON" or "OFF")
end)

ESPBtn.MouseButton1Click:Connect(function()
    getgenv().ESP = not getgenv().ESP
    ESPBtn.Text = "ESP: " .. (getgenv().ESP and "ON" or "OFF")
end)

-- Tombol hide/show pakai gambar Mahiru
local ToggleBtn = Instance.new("ImageButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0.01, 0, 0.6, 0)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Image = "https://tr.rbxcdn.com/75e8c6da84e93e172cc17be140f58446/150/150/Image/Png" -- Gambar Mahiru

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Anti AFK
pcall(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- Loop utama
spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
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
                        LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        boss.Humanoid.Health = 0
                    until boss.Humanoid.Health <= 0 or not getgenv().AutoBoss
                end
            end)
        end

        if getgenv().AutoChest then
            pcall(function()
                for _, chest in pairs(workspace:GetChildren()) do
                    if chest.Name:match("Chest") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = chest.CFrame
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
