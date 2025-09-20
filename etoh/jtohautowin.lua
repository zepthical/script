-- EToH Autowin script, script is NOT MINE but has been modified by @qwirkzzy on Roblox, thanks :)
-- [[ services ]] --
local Players = game:GetService('Players')

-- [[ variables ]] --
local towersToAvoid = {
    'ToRoMW',
    'ToTHT',
    'ToBP',
    'ToCaV',
    'ToRT',
    'ToPB',
    'ToHR',
    'ToWWW',
    'ToEMP',
    'TT',
    'ToBT',
    'ToC',
    'ToCA',
    'ToDC',
    'ToDT',
    'ToEH',
    'ToFaCT',
    'ToHA',
    'ToIB',
    'ToIF',
    'ToMB',
    'ToPZ',
    'ToRER',
    'ToTL',
    'ToUH',
    'ToAAA',
    'ToAE',
    'ToBK',
    'ToEI',
    'ToFM',
    'ToHH',
    'ToSM',
    'ToSO',
    'ToTB',
    'ToTDA',
    'ToWF',
    'ToAR',
    'ToFN',
    'ToI',
    'ToIM',
    'ToMM',
    'ToNS',
    'ToUA',
    'ToAM',
    'ToCP',
    'ToCR',
    'ToDIE',
    'ToER',
    'ToGF',
    'ToJE',
    'ToRoMW',
    'ToTHT',
    'ToBP',
    'ToCaV',
    'ToRT',
    'PersistOBJs',
}

local tools = {
    'Toxic Wings',
    'Heavenly Orb',
    'Candy Cane Grappling Hook',
    'Heavenly Coil',
}

-- [[ function to return cuz yeh ]] --
return function(tower: string, time: number)
    local currentTower = tower or ''
    for _, v in pairs(workspace.Towers:GetChildren()) do
        if not table.find(towersToAvoid, v.Name) and not (tower and v.Name ~= currentTower) then
            local tp = workspace.Teleporters:FindFirstChild(v.Name).Teleporter.TPFRAME
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(tp.CFrame)
            task.wait(0.75)
            for _, tool in tools do
                local v = Instance.new('Tool')
                v.Name = tool
                v.Parent = game.Players.LocalPlayer.Character
                task.wait(0.2)
            end
            task.wait(1 + (time or 0))
            local winpad
            for _, w in pairs(workspace:FindFirstChild('WinPads', true):GetChildren()) do
                if w:IsA("BasePart") and tostring(w.TowerId.Value) == tostring(v.Name) then
                    winpad = w
                end
            end
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(winpad.CFrame)
            task.wait(1)
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace:FindFirstChild("RestartBrick", true).CFrame)
            game.Players.LocalPlayer.CharacterAdded:Wait()
            task.wait(0.5)
        end
    end
end
-- Hi
