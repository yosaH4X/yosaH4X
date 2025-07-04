-- MemeSea.luau

getgenv().AutoWin = false
getgenv().AutoFarmMeme = false
getgenv().AutoCollect = false

-- Auto Win
spawn(function()
    while task.wait() do
        if getgenv().AutoWin then
            pcall(function()
                local endPart = workspace:FindFirstChild("EndPart")
                if endPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = endPart.CFrame
                    wait(1)
                end
            end)
        end
    end
end)

-- Auto Farm (contoh basic)
spawn(function()
    while task.wait() do
        if getgenv().AutoFarmMeme then
            pcall(function()
                for _, mob in pairs(workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                        repeat task.wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            mob.Humanoid.Health = 0
                        until not getgenv().AutoFarmMeme or mob.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

-- Auto Collect Coins or Items
spawn(function()
    while task.wait() do
        if getgenv().AutoCollect then
            pcall(function()
                for _, item in pairs(workspace:GetChildren()) do
                    if item.Name:find("Coin") and item:IsA("Part") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item.CFrame
                        wait(0.2)
                    end
                end
            end)
        end
    end
end)

print("✅ Meme Sea full native logic loaded (no UI)")
