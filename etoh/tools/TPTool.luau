-- Acquired from Infinite Yield
local player = game:GetService("Players").LocalPlayer;local LocalPlayer = player
local Mouse = LocalPlayer:GetMouse()

local TpTool = Instance.new("Tool")
TpTool.Name = "Teleport Tool"
TpTool.RequiresHandle = false
TpTool.Parent = LocalPlayer.Backpack
TpTool.Activated:Connect(function()
	local Char = LocalPlayer.Character or workspace:FindFirstChild(LocalPlayer.Name)
	local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
	if not Char or not HRP then
		return warn("Failed to find HumanoidRootPart")
	end
	HRP.CFrame = CFrame.new(Mouse.Hit.X, Mouse.Hit.Y + 3, Mouse.Hit.Z, select(4, HRP.CFrame:components()))
end)
