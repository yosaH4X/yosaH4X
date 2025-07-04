-- BloxFruits.luau

getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().AutoChest = false
getgenv().ESP = false

-- Anti AFK
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- Auto Farm
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

-- Auto Boss
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

-- Auto Chest
spawn(function()
    while task.wait() do
        if getgenv().AutoChest then
            pcall(function()
                for _, chest in pairs(workspace:GetChildren()) do
                    if chest.Name:find("Chest") and chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.PrimaryPart.CFrame
                        wait(0.5)
                    end
                end
            end)
        end
    end
end)

-- ESP
spawn(function()
    while task.wait() do
        if getgenv().ESP then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Head") and not v.Head:FindFirstChild("BillboardGui") then
                        local esp = Instance.new("BillboardGui", v.Head)
                        esp.Size = UDim2.new(0, 100, 0, 40)
                        esp.Adornee = v.Head
                        esp.AlwaysOnTop = true
                        local text = Instance.new("TextLabel", esp)
                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.Text = "ENEMY"
                        text.TextColor3 = Color3.new(1, 0, 0)
                        text.BackgroundTransparency = 1
                    end
                end
            end)
        else
            for _, v in pairs(workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Head") then
                    local gui = v.Head:FindFirstChild("BillboardGui")
                    if gui then
                        gui:Destroy()
                    end
                end
            end
        end
    end
end)

print("✅ Blox Fruits full logic loaded (native, no UI)")
