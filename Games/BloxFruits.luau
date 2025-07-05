local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "🌸 yosaH4X 🌸",
    Center = true,
    AutoShow = true,
    TabPadding = 4,
    MenuFadeTime = 0.2
})

-- Ukuran minimal
Window:SetMinimumSize(Vector2.new(200, 200))
Window:Show()

Library:OnUnload(function()
    print("Unloaded")
end)

local Tabs = {
    Main = Window:AddTab("Main")
}

local MainBox = Tabs.Main:AddLeftGroupbox("Farming")

getgenv().AutoFarm = false
getgenv().AutoBoss = false
getgenv().AutoChest = false
getgenv().ESP = false

MainBox:AddToggle("AutoFarm", {
    Text = "Auto Farm",
    Default = false,
}):OnChanged(function(val)
    getgenv().AutoFarm = val
end)

MainBox:AddToggle("AutoBoss", {
    Text = "Auto Boss",
    Default = false,
}):OnChanged(function(val)
    getgenv().AutoBoss = val
end)

MainBox:AddToggle("AutoChest", {
    Text = "Auto Chest",
    Default = false,
}):OnChanged(function(val)
    getgenv().AutoChest = val
end)

MainBox:AddToggle("ESP", {
    Text = "ESP",
    Default = false,
}):OnChanged(function(val)
    getgenv().ESP = val
end)

MainBox:AddButton("Destroy UI", function()
    Library:Unload()
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Main)
ThemeManager:ApplyToTab(Tabs.Main)

Library:Notify("✅ yosaH4X Loaded! Klik tombol icon buat hide/show.")

-- 🌟 Buat tombol floating (Android)
local button = Instance.new("ImageButton")
button.Name = "MahiruIcon"
button.Parent = game:GetService("CoreGui")
button.BackgroundTransparency = 1
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0, 20, 0.5, -25)
button.Image = "rbxassetid://15182747853" -- ganti ID ke gambar Mahiru kalau mau custom

local visible = true
button.MouseButton1Click:Connect(function()
    visible = not visible
    Window:SetVisible(visible)
end)

-- Logic loop
task.spawn(function()
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
    end
end)
