-- Wow cool script made by @qwirkzzy on roblox go check him (me) out
local newtool = Instance.new("Tool")
newtool.Name = "T-Pose"
newtool.ToolTip = "Assert dominance"
newtool.TextureId = "http://www.roblox.com/asset/?id=6869582429"
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
    while not v4 do
        u5 = v2.Character
        u5 = u5
        if u5 then
            v4 = u5:FindFirstChild("Humanoid")
        end
        task.wait()
    end
    local v6 = Instance.new("Animation")
    v6.AnimationId = "rbxassetid://9105892431"
    local u7 = v4:LoadAnimation(v6)
    local u8 = false
    v3.Button1Down:Connect(function() --[[Anonymous function at line 27]]
        --[[
    Upvalues:
        [1] = u1
        [2] = u5
        [3] = u8
        [4] = u7
    --]]
        if u1.Parent ~= u5 then
            return
        end
        u8 = true
        while true do
            if not u7.IsPlaying then
                u7:Play()
            end
            task.wait()
            if not u8 or u1.Parent ~= u5 then
                u7:Stop()
                return
            end
        end
    end)
    v3.Button1Up:Connect(function() --[[Anonymous function at line 45]]
        --[[
    Upvalues:
        [1] = u8
    --]]
        u8 = false
    end)
end)

coroutine.resume(co1)

newtool.Parent = game.Players.LocalPlayer.Backpack
localScript.Parent = newtool
