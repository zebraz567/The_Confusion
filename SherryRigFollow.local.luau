local Rs = game:GetService("RunService")
local car = workspace:WaitForChild("car")
local driveseat = workspace.car:WaitForChild("DriveSeat")
local pseat = workspace.car:WaitForChild("PassSeat")
local rig = workspace:WaitForChild("SherryCarRig")
local root = rig:FindFirstChild("HumanoidRootPart", true)

local rigHumanoid = rig:FindFirstChild("Humanoid", true)
rigHumanoid.AutoRotate = false
rigHumanoid.PlatformStand = true

local pseatOffset = driveseat.CFrame:ToObjectSpace(pseat.CFrame)
local rigOffset = pseat.CFrame:ToObjectSpace(root.CFrame)

Rs.RenderStepped:Connect(function()
	pseat.CFrame = driveseat.CFrame * pseatOffset
	rig:PivotTo(pseat.CFrame * rigOffset)
end)