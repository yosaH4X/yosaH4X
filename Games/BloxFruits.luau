-- ✅ Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌸 yosaH4X Blox Fruits",
    LoadingTitle = "yosaH4X",
    LoadingSubtitle = "by yosaH4X",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- kalau mau, isi nama folder config
        FileName = "yosaH4XConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false
    },
    KeySystem = false,
    KeySettings = {
        Title = "yosaH4X Key",
        Subtitle = "Key System",
        Note = "Hubungi yosaH4X buat dapet key",
        FileName = "yosaKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = "yosaFREE"
    }
})

-- 🌟 Farming Tab
local FarmingTab = Window:CreateTab("⚔️ Farming", 4483362458)

local AutoFarmToggle = FarmingTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        getgenv().AutoFarm = Value
        print("Auto Farm:", Value)
    end
})

local AutoBossToggle = FarmingTab:CreateToggle({
    Name = "Auto Boss",
    CurrentValue = false,
    Flag = "AutoBoss",
    Callback = function(Value)
        getgenv().AutoBoss = Value
        print("Auto Boss:", Value)
    end
})

local ChestToggle = FarmingTab:CreateToggle({
    Name = "Auto Chest",
    CurrentValue = false,
    Flag = "AutoChest",
    Callback = function(Value)
        getgenv().AutoChest = Value
        print("Auto Chest:", Value)
    end
})

local ESPToggle = FarmingTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        getgenv().ESP = Value
        print("ESP:", Value)
    end
})

-- 🌸 Notif Welcome
Rayfield:Notify({
    Title = "yosaH4X",
    Content = "Welcome to yosaH4X Script!",
    Duration = 6.5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Oke!",
            Callback = function()
                print("Selamat datang di yosaH4X!")
            end
        }
    }
})
