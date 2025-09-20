-- Script made by @qwirkzzy on Roblox, please DO NOT claim this is yours.
local newtool = Instance.new("Tool")
newtool.Name = "Bootleg Speed Coil"
newtool.TextureId = "rbxassetid://13884842243"
newtool.CanBeDropped = false
newtool.RequiresHandle = true
newtool.ManualActivationOnly = false

local handle = Instance.new("MeshPart")
handle.Name = "Handle"
handle.Color = Color3.new(1, 0, 0)
handle.DoubleSided = false
handle.Material = Enum.Material.Neon
handle.MeshId = "http://www.roblox.com/asset/?id=16606212"
handle.RenderFidelity = Enum.RenderFidelity.Precise
handle.Transparency = 0.6
handle.Size = Vector3.new(1.35, 1.35, 2.2)
handle.EnableFluidForces = false
handle.CanCollide = false
handle.Anchored = false
handle.Massless = true

local DENSITY = 0.01
local FRICTION = 0.3
local ELASTICITY = 0.2
local FRICTION_WEIGHT = 1
local ELASTICITY_WEIGHT = 1

local physProperties = PhysicalProperties.new(DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT)
handle.CustomPhysicalProperties = physProperties

local sound = Instance.new("Sound")
sound.SoundId = "http://www.roblox.com/asset/?id=99173388"
sound.Looped = false
sound.PlaybackRegionsEnabled = false
sound.PlaybackSpeed = 1
sound.Playing = false
sound.TimePosition = 0
sound.Volume = 0.5
sound.LoopRegion = NumberRange.new(0, 60000)
sound.PlaybackRegion = NumberRange.new(0, 60000)
sound.RollOffMaxDistance = 10000
sound.RollOffMinDistance = 10
sound.RollOffMode = Enum.RollOffMode.Inverse
--sound.SoundGroup = game.SoundService._ITEM_SOUNDS_

local localScript = Instance.new("LocalScript")
local co1 = coroutine.create(function()
    local u1 = game.Players.LocalPlayer.Name
    newtool.Equipped:Connect(function() --[[Anonymous function at line 3]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v2 = game.Workspace:FindFirstChild(u1).Humanoid
        v2.WalkSpeed = v2.WalkSpeed + 4
        localScript.Parent.Sound:Play()
    end)
    newtool.Unequipped:Connect(function() --[[Anonymous function at line 9]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v3 = game.Workspace:FindFirstChild(u1)
        if v3.Humanoid.WalkSpeed > 16 then
            local v4 = v3.Humanoid
            v4.WalkSpeed = v4.WalkSpeed - 4
        end
    end)
end)

coroutine.resume(co1)

newtool.Parent = game.Players.LocalPlayer.Backpack
handle.Parent = newtool
localScript.Parent = handle
sound.Parent = handle
