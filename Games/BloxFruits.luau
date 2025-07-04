-- BloxFruits.luau

-- Default toggle
getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().AutoChest = false
getgenv().ESP = false

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AFarmBtn = Instance.new("TextButton")
local ABossBtn = Instance.new("TextButton")
local ChestBtn = Instance.new("TextButton")
local ESPBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 250)
Frame.Position = UDim2.new(0.5, -100, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Auto Farm Button
AFarmBtn.Parent = Frame
AFarmBtn.Size = UDim2.new(1, -20, 0, 40)
AFarmBtn.Position = UDim2.new(0, 10, 0, 10)
AFarmBtn.Text = "Toggle Auto Farm"

AFarmBtn.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    AFarmBtn.Text = "Auto Farm: " .. (getgenv().AutoFarm and "ON" or "OFF")
end)

-- Auto Boss Button
ABossBtn.Parent = Frame
ABossBtn.Size = UDim2.new(1, -20, 0, 40)
ABossBtn.Position = UDim2.new(0, 10, 0, 60)
ABossBtn.Text = "Toggle Auto Boss"

ABossBtn.MouseButton1Click:Connect(function()
    getgenv().AutoBoss = not getgenv().AutoBoss
    ABossBtn.Text = "Auto Boss: " .. (getgenv().AutoBoss and "ON" or "OFF")
end)

-- Chest Button
ChestBtn.Parent = Frame
ChestBtn.Size = UDim2.new(1, -20, 0, 40)
ChestBtn.Position = UDim2.new(0, 10, 0, 110)
ChestBtn.Text = "Toggle Chest"

ChestBtn.MouseButton1Click:Connect(function()
    getgenv().AutoChest = not getgenv().AutoChest
    ChestBtn.Text = "Chest: " .. (getgenv().AutoChest and "ON" or "OFF")
end)

-- ESP Button
ESPBtn.Parent = Frame
ESPBtn.Size = UDim2.new(1, -20, 0, 40)
ESPBtn.Position = UDim2.new(0, 10, 0, 160)
ESPBtn.Text = "Toggle ESP"

ESPBtn.MouseButton1Click:Connect(function()
    getgenv().ESP = not getgenv().ESP
    ESPBtn.Text = "ESP: " .. (getgenv().ESP and "ON" or "OFF")
end)

-- Logic loop basic
spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                -- Example: Farming logic
                print("Farming aktif...")
            end)
        end

        if getgenv().AutoBoss then
            pcall(function()
                -- Example: Boss logic
                print("Boss aktif...")
            end)
        end

        if getgenv().AutoChest then
            pcall(function()
                -- Example: Chest logic
                print("Chest aktif...")
            end)
        end

        if getgenv().ESP then
            pcall(function()
                -- Example: ESP logic
                print("ESP aktif...")
            end)
        end
    end
end)

print("✅ Full Panel Loaded!")
