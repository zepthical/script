-- Script made by @qwirkzzy on Roblox, please DO NOT claim this is yours.
local newtool = Instance.new("Tool")
newtool.Name = "Helicopter Powers"
newtool.ToolTip = "I can see my house from here!"
newtool.TextureId = "rbxassetid://6235245591"
newtool.CanBeDropped = false
newtool.RequiresHandle = false
newtool.ManualActivationOnly = true

local localScript = Instance.new("LocalScript")
local co1 = coroutine.create(function()
    local u1 = newtool
    local v2 = game:GetService("Players").LocalPlayer
    local v3 = v2:GetMouse()
    local v4 = nil
    local u5 = nil
    local u6 = nil
    while not v4 do
        u5 = v2.Character
        u5 = u5
        if u5 then
            u6 = u5:FindFirstChild("HumanoidRootPart")
        end
        if u6 then
            v4 = u5:FindFirstChild("Humanoid")
        end
        task.wait()
    end
    local v7 = Instance.new("Animation")
    v7.AnimationId = "rbxassetid://9105897084"
    local u8 = v4:LoadAnimation(v7)
    local u9 = false
    local function u11(p10) --[[Anonymous function at line 21]]
        --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
        if p10 then
            u8:Play()
            if not u5:FindFirstChild("InvisibleLegs") then
                Instance.new("BoolValue", u5).Name = "InvisibleLegs"
            end
        else
            u8:Stop()
            if u5:FindFirstChild("InvisibleLegs") then
                u5.InvisibleLegs:Destroy()
            end
        end
        u5["Left Leg"].Transparency = p10 and 1 or 0
        u5["Right Leg"].Transparency = p10 and 1 or 0
    end
    v3.Button1Down:Connect(function() --[[Anonymous function at line 40]]
        --[[
    Upvalues:
        [1] = u1
        [2] = u5
        [3] = u9
        [4] = u6
        [5] = u8
        [6] = u11
    --]]
        if u1.Parent ~= u5 then
            return
        end
        u9 = true
        while true do
            local v12
            if u6.Orientation.X < 5 then
                v12 = u6.Orientation.X > -5 and true or u6.Orientation.X > 355
            else
                v12 = false
            end
            local v13
            if u6.Orientation.Z < 5 then
                v13 = u6.Orientation.Z > -5 and true or u6.Orientation.Z > 355
            else
                v13 = false
            end
            if v12 and v13 then
                if not u8.IsPlaying then
                    u11(true)
                end
            elseif u8.IsPlaying then
                u11(false)
            end
            task.wait()
            if not u9 or u1.Parent ~= u5 then
                u11(false)
                return
            end
        end
    end)
    v3.Button1Up:Connect(function() --[[Anonymous function at line 67]]
        --[[
    Upvalues:
        [1] = u9
    --]]
        u9 = false
    end)
end)

coroutine.resume(co1)

newtool.Parent = game.Players.LocalPlayer.Backpack
localScript.Parent = newtool
