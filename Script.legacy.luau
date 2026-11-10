local door = script.Parent
local prompt = door.ProximityPrompt
local Open = false

local closed = door:GetPivot()
local hinge1 = CFrame.new(-2,0,0)
local open = closed*hinge1* CFrame.Angles(0,math.rad(-90),0)*hinge1:Inverse()

prompt.Triggered:Connect(function()
	if Open == false then
		door:PivotTo(open)
		Open = true
	else
		door:PivotTo(closed)
		Open = false
	end
end)