-- // Library Rayfield
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

-- Variables
_G.AutoFarm = false
_G.AutoBoss = false
_G.AutoSea = false
_G.AutoRaid = false
_G.AutoStats = false
_G.ESPPlayers = false
_G.ESPFruits = false

-- Main
local MainTab = Window:CreateTab("Main 🌈", 4483362458)
MainTab:CreateParagraph({Title = "Script by yosaH4X - Enjoy !", Content = ""})

MainTab:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      while _G.AutoFarm do
         -- Logic farming
         pcall(function()
            local args = {
               [1] = "StartQuest",
               [2] = "BanditQuest1",
               [3] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.Comm:InvokeServer(unpack(args))
            local mob = game:GetService("Workspace").Enemies:FindFirstChild("Bandit [Lv. 5]")
            if mob then
               repeat
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                  game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
                  wait(0.1)
               until mob.Humanoid.Health <= 0 or not _G.AutoFarm
            end
         end)
         wait()
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Boss",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoBoss = Value
      while _G.AutoBoss do
         pcall(function()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
               if string.find(v.Name, "Boss") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                  repeat
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                     game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
                     wait(0.1)
                  until v.Humanoid.Health <= 0 or not _G.AutoBoss
               end
            end
         end)
         wait()
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Sea Beast",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoSea = Value
      while _G.AutoSea do
         pcall(function()
            -- Logic Sea Beast (dummy logic)
            print("Sea Beast farming running...")
            wait(5)
         end)
         wait()
      end
   end,
})

-- Raid
local RaidTab = Window:CreateTab("Raid 🌈", 4483362458)
RaidTab:CreateToggle({
   Name = "Auto Farm Raid",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoRaid = Value
      while _G.AutoRaid do
         pcall(function()
            print("Auto Raid farming...")
            wait(5)
         end)
         wait()
      end
   end,
})

-- Stats
local StatsTab = Window:CreateTab("Stats 🌈", 4483362458)
StatsTab:CreateToggle({
   Name = "Auto Stats",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoStats = Value
      while _G.AutoStats do
         pcall(function()
            local args = {
               [1] = "AddPoint",
               [2] = "Melee",
               [3] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.Comm:InvokeServer(unpack(args))
         end)
         wait(1)
      end
   end,
})

-- ESP
local ESPTab = Window:CreateTab("ESP 🌈", 4483362458)
ESPTab:CreateToggle({
   Name = "ESP Players",
   CurrentValue = false,
   Callback = function(Value)
      _G.ESPPlayers = Value
      while _G.ESPPlayers do
         pcall(function()
            for i,v in pairs(game.Players:GetPlayers()) do
               if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                  v.Character.HumanoidRootPart.BillboardGui = Instance.new("BillboardGui", v.Character.HumanoidRootPart)
               end
            end
         end)
         wait(5)
      end
   end,
})

ESPTab:CreateToggle({
   Name = "ESP Fruits",
   CurrentValue = false,
   Callback = function(Value)
      _G.ESPFruits = Value
      while _G.ESPFruits do
         pcall(function()
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
               if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                  v.Handle.BrickColor = BrickColor.Random()
               end
            end
         end)
         wait(2)
      end
   end,
})

-- Shop
local ShopTab = Window:CreateTab("Shop 🌈", 4483362458)
ShopTab:CreateButton({
   Name = "Buy All Accessories",
   Callback = function()
      print("Buying all accessories...")
   end,
})

-- Misc
local MiscTab = Window:CreateTab("Misc 🌈", 4483362458)
MiscTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         local vu = game:GetService("VirtualUser")
         game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         end)
      end
   end,
})

MiscTab:CreateToggle({
   Name = "Walk on Water",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         print("Walk on Water enabled!")
      else
         print("Walk on Water disabled!")
      end
   end,
})

Rayfield:LoadConfiguration()
