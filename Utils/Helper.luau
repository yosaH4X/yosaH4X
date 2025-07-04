return function()
    local Helper = {}

    function Helper:TweenToPosition(pos)
        local tweenService = game:GetService("TweenService")
        local plr = game.Players.LocalPlayer
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local info = TweenInfo.new(
                (hrp.Position - pos.Position).Magnitude / 300, 
                Enum.EasingStyle.Linear
            )
            local goal = {CFrame = pos}
            local tween = tweenService:Create(hrp, info, goal)
            tween:Play()
            tween.Completed:Wait()
        end
    end

    function Helper:EquipTool()
        local plr = game.Players.LocalPlayer
        for _, v in pairs(plr.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                plr.Character.Humanoid:EquipTool(v)
                break
            end
        end
    end

    function Helper:BypassAntiTP()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end

    function Helper:SafeWait(seconds)
        local runService = game:GetService("RunService")
        local start = tick()
        repeat runService.Heartbeat:Wait() until tick() - start >= seconds
    end

    return Helper
end
