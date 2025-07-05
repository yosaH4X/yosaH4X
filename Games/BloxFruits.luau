local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "yosaH4X | BloxFruits",
   LoadingTitle = "yosaH4X | BloxFruits",
   LoadingSubtitle = "Script by yosaH4X - Enjoy !",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "yosaH4XHub"
   },
   KeySystem = false,
})

-- Rainbow
local function rainbow()
   local hue = tick() % 5 / 5
   return Color3.fromHSV(hue, 1, 1)
end

task.spawn(function()
   while task.wait() do
      Window:SetBackgroundColor(rainbow())
      Window:SetTopbarColor(rainbow())
   end
end)

-- Vars
_G.AutoFarm = false
_G.AutoBoss = false
_G.AutoStats = false
_G.ESPPlayers = false

-- Function Anti AFK
local function AntiAFK()
   local vu = game:GetService("VirtualUser")
   game:GetService("Players").LocalPlayer.Idled:Connect(function()
      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      wait(1)
      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end)
end

-- Main Tab
local MainTab = Window:CreateTab("Main 🌈", 4483362458)
MainTab:CreateParagraph({Title = "Script by yosaH4X - Enjoy !", Content = ""})

MainTab:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then
         task.spawn(function()
            while _G.AutoFarm and task.wait() do
               pcall(function()
                  local args = {
                      [1] = "StartQuest",
                      [2] = "BanditQuest1", -- Ganti sesuai quest
                      [3] = 1
                  }
                  game:GetService("ReplicatedStorage").Remotes.Comm:InvokeServer(unpack(args))

                  local mob = nil
                  for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                      if v.Name == "Bandit [Lv. 5]" and v.Humanoid.Health > 0 then
                          mob = v
                          break
                      end
                  end

                  if mob and mob:FindFirstChild("HumanoidRootPart") then
                      repeat
                          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                          game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
                          task.wait()
                      until mob.Humanoid.Health <= 0 or not _G.AutoFarm
                  end
               end)
            end
         end)
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Boss",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoBoss = Value
      if Value then
         task.spawn(function()
            while _G.AutoBoss and task.wait() do
               pcall(function()
                  for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                      if string.find(v.Name, "Boss") and v.Humanoid.Health > 0 then
                          repeat
                              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                              game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
                              task.wait()
                          until v.Humanoid.Health <= 0 or not _G.AutoBoss
                      end
                  end
               end)
            end
         end)
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Stats (Melee)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoStats = Value
      if Value then
         task.spawn(function()
            while _G.AutoStats and task.wait(1) do
               local args = {
                   [1] = "AddPoint",
                   [2] = "Melee",
                   [3] = 1
               }
               game:GetService("ReplicatedStorage").Remotes.Comm:InvokeServer(unpack(args))
            end
         end)
      end
   end,
})

MainTab:CreateToggle({
   Name = "ESP Players",
   CurrentValue = false,
   Callback = function(Value)
      _G.ESPPlayers = Value
      if Value then
         task.spawn(function()
            while _G.ESPPlayers and task.wait() do
               pcall(function()
                  for i,v in pairs(game.Players:GetPlayers()) do
                     if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        if not v.Character:FindFirstChild("Highlight") then
                           local highlight = Instance.new("Highlight")
                           highlight.FillColor = Color3.new(1,0,0)
                           highlight.OutlineColor = Color3.new(0,0,0)
                           highlight.Parent = v.Character
                        end
                     end
                  end
               end)
               wait(5)
            end
         end)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Highlight") then
               v.Character.Highlight:Destroy()
            end
         end
      end
   end,
})

MainTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         AntiAFK()
      end
   end,
})

MainTab:CreateToggle({
   Name = "Walk on Water",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.HumanoidRootPart.Touched:Connect(function(part)
            if part.Name == "Water" then
               game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            end
         end)
      end
   end,
})

Rayfield:LoadConfiguration()
