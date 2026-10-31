local rs = game:GetService("ReplicatedStorage")
local plrs = game:GetService("Players")
local Rs = game:GetService("RunService")
local player = plrs.LocalPlayer
local ch = player.Character or player.CharacterAdded:Wait()
local hrp = ch:WaitForChild("HumanoidRootPart")

local roadT = rs:WaitForChild("RoadPiece")
local sgL = roadT:GetExtentsSize().X
local sgL = roadT:GetExtentsSize().X
print("segment length is", sgL)

local roadFldr = workspace:FindFirstChild("RoadSegments")
if roadFldr ==nil then
	roadFldr = Instance.new("Folder")
	roadFldr.Name = "RoadSegments"
	roadFldr.Parent = workspace
end

local roadStart = workspace:WaitForChild("RoadStart")

local spnwSeg = {}
local lastZ = 0
local spawnAhd =1000

for i=1, 10 do
	local newRd = roadT:Clone()
	newRd:PivotTo(roadStart.CFrame * CFrame.new(lastZ,0,0))
	newRd.Parent = roadFldr
	spnwSeg[lastZ]= true
	lastZ = lastZ + sgL
end
print("pieces in folder:", #roadFldr:GetChildren())

local roadCon = Rs.RenderStepped:Connect(function()
	local relPos = roadStart.CFrame:PointToObjectSpace(hrp.Position)
	local playerZ = relPos.X
	local targetZ = math.floor((playerZ+spawnAhd)/sgL)* sgL
	
	while lastZ<targetZ do
		if spnwSeg[lastZ] == nil then
			local newRd = roadT:Clone()
			newRd:PivotTo(roadStart.CFrame * CFrame.new(lastZ,0,0))
			newRd.Parent = roadFldr
			spnwSeg[lastZ] = true
		end
		lastZ = lastZ+sgL
	end
end)