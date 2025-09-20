local players = game:GetService("Players")
local uis = game:GetService("UserInputService")
local enabled = true

local localPlayer = players.LocalPlayer

return function(keybind: string)
    uis.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode[keybind] then
            enabled = not enabled
        end
    end)

    uis.JumpRequest:Connect(function()
        if enabled == true then
            localPlayer.Character.Humanoid:ChangeState("Jumping")
        end
    end)
end
