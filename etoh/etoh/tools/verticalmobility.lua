-- Script made by @qwirkzzy on Roblox, please DO NOT claim this is yours.
local newtool = Instance.new("Tool")
newtool.Name = "Vertical Mobility"
newtool.ToolTip = "Cheater..."
newtool.TextureId = "rbxassetid://6300212134"
newtool.CanBeDropped = false
newtool.RequiresHandle = false
newtool.ManualActivationOnly = true
newtool.Parent = game.Players.LocalPlayer.Backpack

local yes = Instance.new("Part")
yes.Name = "yes"
yes.Transparency = 1
yes.Locked = true
yes.Rotation = Vector3.new(180, 0, 180)
yes.Size = Vector3.new(0.05, 0.05, 0.05)
yes.CanCollide = false
yes.Anchored = true
yes.Massless = true
yes.RootPriority = 0
yes.EnableFluidForces = false

local DENSITY = 0.01
local FRICTION = 0.3
local ELASTICITY = 0.5
local FRICTION_WEIGHT = 1
local ELASTICITY_WEIGHT = 1

local physProperties = PhysicalProperties.new(DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT)
yes.CustomPhysicalProperties = physProperties
yes.Parent = newtool

local sound = Instance.new("Sound")
sound.Name = "Thrusting"
sound.SoundId = "rbxassetid://391784935"
sound.Looped = true
sound.PlaybackRegionsEnabled = false
sound.PlaybackSpeed = 1
sound.Playing = false
sound.TimePosition = 0
sound.Volume = 0.3
sound.LoopRegion = NumberRange.new(0, 60000)
sound.PlaybackRegion = NumberRange.new(0, 60000)
sound.RollOffMaxDistance = 10000
sound.RollOffMinDistance = 10
sound.RollOffMode = Enum.RollOffMode.Inverse
--sound.SoundGroup = game.SoundService._ITEM_SOUNDS_
sound.Parent = yes

local mesh = Instance.new("BlockMesh")
mesh.Offset = Vector3.new(0, 10000, 0)
mesh.Scale = Vector3.new(0, 0, 0)
mesh.VertexColor = Vector3.new(1, 1, 1)
mesh.Parent = yes

local animation = Instance.new("Animation")
animation.Name = "StandStill"
animation.AnimationId = "rbxassetid://9105888138"
animation.Parent = newtool

local gui = Instance.new("ScreenGui")
gui.ClipToDeviceSafeArea = true
gui.SafeAreaCompatibility = Enum.SafeAreaCompatibility.FullscreenExtension
gui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
gui.Name = "Button"
gui.DisplayOrder = 0
gui.Enabled = true
gui.IgnoreGuiInset = false
gui.ResetOnSpawn = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = newtool

local button = Instance.new("TextButton")
button.Name = "FlyButton"
button.Active = true
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.AutoButtonColor = true
button.BackgroundColor3 = Color3.new(1, 1, 0)
button.BorderSizePixel = 0
button.Modal = false
button.Position = UDim2.new(0.1, 0, 0.85, 0)
button.Size = UDim2.new(0.1, 0, 0.1, 0)
button.Font = Enum.Font.GothamBlack
button.Text = "Fly"
button.RichText = false
button.TextColor3 = Color3.new(0, 0, 0)
button.TextScaled = true
button.Parent = gui

local localScript = Instance.new("LocalScript")
localScript.Name = "JetpackScript"
localScript.Parent = newtool

local co1 = coroutine.create(function()
local u1 = newtool
local u2 = u1:WaitForChild("yes")
local u3 = game:GetService("Players")
local u4 = u1:WaitForChild("StandStill")
local u5 = u1:WaitForChild("Button")
local u6 = u2:WaitForChild("Thrusting")
local u7 = game:GetService("Workspace").CurrentCamera
local u8 = game:GetService("UserInputService")
local u9 = 0
local u10 = nil
local u11 = nil
local u12 = false
local u13 = nil
local u14 = Instance.new("BodyVelocity")
u14.Velocity = Vector3.new(0, 0, 0)
local u15 = Instance.new("BodyGyro")
u15.P = 20000
u15.D = 8000
local v16 = u15.P
local v17 = u15.P
local v18 = u15.P
u15.maxTorque = Vector3.new(v16, v17, v18)
function Thrust()
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u15
        [4] = u6
        [5] = u11
        [6] = u7
    --]]
    if localScript:IsDescendantOf(workspace) then
        u13 = true
        u14.Parent = Torso
        u15.Parent = Torso
        u6:Play()
        if u11 then
            u11:Play()
            u11:AdjustSpeed(2.5)
        end
        while u13 do
            u15.cframe = u7.CoordinateFrame
            local v19 = u14
            local v20 = u7.CoordinateFrame.lookVector.unit.y
            v19.Velocity = Vector3.new(0, v20, 0) * 100
            task.wait()
        end
        u6:Stop()
    end
end
function CutEngine()
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u11
        [4] = u15
    --]]
    u13 = false
    u14.Velocity = Vector3.new(0, 0, 0)
    u14.Parent = nil
    u11:Stop()
    u15.Parent = nil
end
function RecursiveGetLift(p21)
    local v22 = 0
    for _, v23 in pairs(p21:GetChildren()) do
        if v23:IsA("BasePart") then
            if Head and (Head.Parent and (v23.Position - Head.Position).magnitude < 10) then
                v22 = v22 + v23:GetMass() * 196.66666666666669 * 1
            else
                v22 = v22 + v23:GetMass() * 196.66666666666669 * 0.8
            end
        end
        v22 = v22 + RecursiveGetLift(v23)
    end
    return v22
end
function EquipJetPack()
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    spawn(function() --[[Anonymous function at line 85]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        while u2 and task.wait(0.1) do
            pcall(function() --[[Anonymous function at line 87]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u1
                --]]
                u2.CFrame = u1.Parent.HumanoidRootPart.CFrame
            end)
        end
    end)
end
function Equipped(p24)
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u8
        [4] = u10
        [5] = u5
        [6] = u9
        [7] = u14
        [8] = u11
        [9] = u4
    --]]
    local v25 = u1.Parent
    local v26 = u3:GetPlayerFromCharacter(v25)
    local v27 = v25:FindFirstChild("Humanoid")
    if u8.TouchEnabled then
        u10 = u5:Clone()
        u10.Parent = v26:FindFirstChild("PlayerGui")
        u10.FlyButton.MouseButton1Down:connect(Thrust)
        u10.FlyButton.MouseButton1Up:connect(CutEngine)
    end
    Head = v25:FindFirstChild("Head")
    Torso = v25:FindFirstChild("Torso")
    if v26 and (v27 and (v27.Health ~= 0 and (Head and Torso))) then
        task.wait()
        EquipJetPack()
        u9 = RecursiveGetLift(v25)
        u14.P = u9 * 10
        local v28 = u14
        local v29 = u14.P
        v28.MaxForce = Vector3.new(0, v29, 0)
        p24.Button1Down:connect(Thrust)
        p24.Button1Up:connect(CutEngine)
        u11 = v27:LoadAnimation(u4)
    end
end
function Unequipped()
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u14
        [4] = u15
        [5] = u11
        [6] = u13
    --]]
    if u10 then
        u10:Destroy()
    end
    u12 = false
    if u14 and u14.Parent then
        u14.Parent = nil
    end
    if u15 and u15.Parent then
        u15.Parent = nil
    end
    if u11 then
        u11:Stop()
    end
    u13 = false
end
u1.Equipped:connect(Equipped)
u1.Unequipped:connect(Unequipped)
end)

coroutine.resume(co1)
