-- Script made by @qwirkzzy on Roblox, please DO NOT claim this is yours.
local newtool = Instance.new("Tool")
newtool.Name = "Bootleg Coil"
newtool.ToolTip = "Bootleg coil best coil"
newtool.TextureId = "rbxassetid://6209230407"
newtool.CanBeDropped = false
newtool.RequiresHandle = true
newtool.ManualActivationOnly = true

local handle = Instance.new("MeshPart")
handle.Name = "Handle"
handle.Color = Color3.new(0, 1, 1)
handle.DoubleSided = false
handle.Material = Enum.Material.Neon
handle.MeshId = "http://www.roblox.com/asset/?id=16606212"
handle.RenderFidelity = Enum.RenderFidelity.Precise
handle.Transparency = 0.6
handle.Size = Vector3.new(1.35, 1.35, 2.2)
handle.EnableFluidForces = false
handle.CanCollide = false
handle.Anchored = false

local DENSITY = 0.01
local FRICTION = 0.3
local ELASTICITY = 0.2
local FRICTION_WEIGHT = 1
local ELASTICITY_WEIGHT = 1

local physProperties = PhysicalProperties.new(DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT)
handle.CustomPhysicalProperties = physProperties

local sound = Instance.new("Sound")
sound.Name = "CoilSound"
sound.SoundId = "http://www.roblox.com/asset/?id=16619553"
sound.Looped = false
sound.PlaybackRegionsEnabled = false
sound.PlaybackSpeed = 1
sound.Playing = false
sound.TimePosition = 0
sound.Volume = 1
sound.LoopRegion = NumberRange.new(0, 60000)
sound.PlaybackRegion = NumberRange.new(0, 60000)
sound.RollOffMaxDistance = 10000
sound.RollOffMinDistance = 10
sound.RollOffMode = Enum.RollOffMode.Inverse
--sound.SoundGroup = game.SoundService._ITEM_SOUNDS_

local attachment = Instance.new("Attachment")
attachment.Name = "RightGripAttachment"
attachment.Visible = false

local localScript = Instance.new("LocalScript")
localScript.Name = "GravityCoilScript"

local co1 = coroutine.create(function()
    -- Created by @qwirkzzy on Roblox
    -- Custom Bootleg Coil Script
    local tool = newtool
    local reduce = 0.5

    local function GetMass(character: Model)
        local ret = 0
        for i, v in character:GetChildren() do
            if v and v:IsA('BasePart') then
                ret += v:GetMass()
            end
        end
        return ret
    end

    local function onToolEquip()
        local hrp = tool.Parent:FindFirstChild('HumanoidRootPart')
        if hrp then
            sound:Play()
            
            local attach = Instance.new('Attachment')
            attach.Parent = hrp

            local force = Instance.new('VectorForce')
            force.Parent = hrp
            force.Attachment0 = attach
            
            local mass = GetMass(hrp.Parent)
            force.Force = Vector3.new(0, mass * workspace.Gravity * reduce, 0)
            
            tool.Unequipped:Connect(function()
                attach:Destroy()
                force:Destroy()
            end)
        end
    end

    tool.Equipped:Connect(onToolEquip)
end)

coroutine.resume(co1)

newtool.Parent = game.Players.LocalPlayer.Backpack
localScript.Parent = newtool
handle.Parent = newtool
sound.Parent = handle
attachment.Parent = handle
