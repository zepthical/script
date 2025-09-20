-- // This script basically makes you immortal (kinda)
-- // Made by @qwirkzzy on Roblox

return task.spawn(function()
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local char = localPlayer.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    hum:GetPropertyChangedSignal("Health"):Connect(function()
        hum.Health += 100
    end)
end)
