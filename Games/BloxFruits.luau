local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/linoria/linoria/main/library.lua"))()
local Window = Library:CreateWindow({
    Title = "yosaH4X ☠️",
    Center = true,
    AutoShow = true,
    Size = UDim2.new(0, 300, 0, 250) -- ⚡️ Ukuran sudah dikecilin
})

-- Section Farming
local MainTab = Window:AddTab("Main")
local FarmingGroup = MainTab:AddLeftGroupbox("Farming")

FarmingGroup:AddToggle("AutoFarm", { Text = "Auto Farm", Default = false })
FarmingGroup:AddToggle("AutoBoss", { Text = "Auto Boss", Default = false })
FarmingGroup:AddToggle("AutoChest", { Text = "Chest", Default = false })
FarmingGroup:AddToggle("ESP", { Text = "ESP", Default = false })

-- Add Hide/Show Button
Library.ToggleKeybind = Enum.KeyCode.RightControl -- Default PC
-- 🔥 Untuk mobile, tambahin tombol custom (contoh Mahiru image button)

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local MahiruButton = Instance.new("ImageButton")
MahiruButton.Size = UDim2.new(0, 50, 0, 50)
MahiruButton.Position = UDim2.new(0, 20, 0, 20)
MahiruButton.Image = "rbxassetid://ID_MAHIRU_IMAGE" -- Ganti ID sesuai gambar Mahiru
MahiruButton.BackgroundTransparency = 1
MahiruButton.Parent = game.CoreGui

MahiruButton.MouseButton1Click:Connect(function()
    Library:Toggle()
end)

-- Drag Window
Window.Object.Active = true
Window.Object.Draggable = true
