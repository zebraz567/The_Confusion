local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

playerGui.ChildAdded:Connect(function(child)
	if child.Name == "A-Chassis Interface" then
		child.Enabled = false
	end
end)