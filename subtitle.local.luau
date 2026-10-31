local UserIS = game:GetService("UserInputService")

local gui = script.Parent
local label = gui.SubtitleLabel
local nxt = gui.NextButton
local promt = workspace:WaitForChild("CafeStaff"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
local seat = workspace:FindFirstChild("CafeSeat", true)
local player = game.Players.LocalPlayer

local c1 = workspace:WaitForChild("cus1"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
local c2 = workspace:WaitForChild("cus2"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
local c3 = workspace:WaitForChild("Cus3"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
local c4 = workspace:WaitForChild("cus4"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
local susprmpt = workspace:WaitForChild("Sherry"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
c1.Enabled = false
c2.Enabled = false
c3.Enabled = false
c4.Enabled = false

local cusdone = 0

local talk2Staff = false
local scenePly = false

label.Visible = false
nxt.Visible = false


promt.Triggered:Connect(function()
	promt.Enabled = false
	
	label.Text = "<Your first line>"
	label.Visible = true
	nxt.Visible = true
	
	local press = false
	while press == false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Text = "<Your second line>"
	
	press = false
	while press == false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Visible = false
	nxt.Visible = false
	talk2Staff=true
	promt.Enabled = true
	
	
end)


seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	if seat.Occupant ~= nil and talk2Staff == true and scenePly ==false and seat.Occupant.Parent == player.Character then
		scenePly = true
		
		
		local hum = seat.Occupant
		local oldSpd = hum.WalkSpeed
		local oldjmp = hum.JumpPower
		local oldJmpH = hum.JumpHeight
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		hum.JumpHeight = 0
		
		label.Text = "<Your first line>"
		label.Visible = true
		nxt.Visible = true
		
		local press = false
		while press == false do 
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		
		label.Text = "<Your second line>"
		
		press = false
		while press == false do 
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		
		label.Visible = false
		nxt.Visible = false
		hum.WalkSpeed= oldSpd
		hum.JumpPower = oldjmp
		hum.JumpHeight = oldJmpH
		
		c1.Enabled = true
		c2.Enabled = true
		c3.Enabled = true
		c4.Enabled = true
		
	end
end)


c1.Triggered:Connect(function()
	print("c1 triggered")
	c1.Enabled = false
	
	label.Text = "<Your first line>"
	label.Visible = true
	nxt.Visible = true
	
	local press =false
	while press==false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode== Enum.KeyCode.F then
			press=true
		end
	end
	
	label.Visible = false
	nxt.Visible=false
	cusdone=cusdone+1
	
	if cusdone==4 then
		susprmpt.Enabled =true
	end
end)

c2.Triggered:Connect(function()
	print("c2 triggered")
	c2.Enabled = false
	
	label.Text="<custpmer sec line>"
	label.Visible = true
	nxt.Visible=true
	
	local press = false
	while press==false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode== Enum.KeyCode.F then
			press =true
		end
	end
	
	label.Visible=false
	nxt.Visible=false
	cusdone = cusdone+1
	
	if cusdone==4 then
		susprmpt.Enabled =true
	end
end)

c3.Triggered:Connect(function()
	print("c3 triggered")
	c3.Enabled = false
	
	label.Text = "<Customer3 line>"
	label.Visible = true
	nxt.Visible = true
	
	local press = false
	while press ==false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Visible= false
	nxt.Visible=false
	cusdone = cusdone+1
	
	if cusdone == 4 then
		susprmpt.Enabled = true
	end
end)

c4.Triggered:Connect(function()
	print("c4 triggered")
	c4.Enabled = false
	
	label.Text = "<Customer4 line>"
	label.Visible = true
	nxt.Visible = true
	
	local press = false
	while press == false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Visible= false
	nxt.Visible = false
	cusdone = cusdone+1
	
	if cusdone == 4 then 
		susprmpt.Enabled = true
	end
end)

susprmpt.Triggered:Connect(function()
	susprmpt.Enabled = false
	
	label.Text = "<Sherry's intecation>"
	label.Visible =true
	nxt.Visible = true
	
	local press = false
	while press == false do 
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Text = "<Sherry offers me a free ticket butt for a favor :o>"
	
	press = false
	while press == false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	label.Visible = false
	nxt.Visible = false
	
	local scenegui = gui.Parent:FindFirstChild("SceneGui")
	local char = player.Character
	local hum = char:WaitForChild("Humanoid")
	local oldSpd = hum.WalkSpeed
	local oldjmp = hum.JumpPower
	local oldJmpH = hum.JumpHeight
	hum.WalkSpeed = 0
	hum.JumpPower = 0
	hum.JumpHeight = 0
	
	scenegui.Enabled = true
	
	press = false
	while press == false do 
		local input = UserIS.InputBegan:Wait() 
		if input.KeyCode == Enum.KeyCode.E then
			press = true
		end
    end

	local car = workspace:FindFirstChild("car")
	local driveseat = car:FindFirstChild("DriveSeat",true)
	local pseat = car:FindFirstChild("PassSeat",true)
	local sherry = workspace:FindFirstChild("Sherry")

	scenegui.Enabled=false
	hum.WalkSpeed = oldSpd
	hum.JumpPower = oldjmp
	hum.JumpHeight = oldJmpH
	char:PivotTo(driveseat.CFrame*CFrame.new(0,2,0))
	driveseat:Sit(hum)

	task.wait(1)

    local sherryRig = workspace:FindFirstChild("SherryCarRig", true)

    sherry.Parent = nil

    for i, part in pairs(sherryRig:GetDescendants()) do
	    if part:IsA("BasePart") then
		    part.Transparency=0
	   end
	end
	
	task.wait(1)
	
	label.Text = "<Sherry in car 1st line>"
	label.Visible = true
	nxt.Visible = true
	
	press = false
	while press == false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Text = "<Sherry in car 2nd line>"
	
	press = false
	while press == false do
		local input= UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.F then
			press = true
		end
	end
	
	label.Visible=false
	nxt.Visible = false
	
	local sceneTitle=scenegui.BlackFrame.SceneTitle
	sceneTitle.Text="SCENE 3"
	scenegui.Enabled = true
	
	press = false
	while press== false do
		local input = UserIS.InputBegan:Wait()
		if input.KeyCode == Enum.KeyCode.E then
			press = true
		end
	end
	
	hum.Sit = false
	task.wait()
	
	local housespwn = workspace:FindFirstChild("HouseSpawn",true)
	local houseSt = workspace:FindFirstChild("HouseSeat",true)
	houseSt.Disabled=true
	char:PivotTo(housespwn.CFrame*CFrame.new(0,3,0))
	scenegui.Enabled = false
	
	local sherryHouse= workspace:FindFirstChild("SherryHouseRig",true)
	local houseprompt = sherryHouse:WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
	
	houseprompt.Triggered:Connect(function()
		houseprompt.Enabled = false
		label.Text="<Sherry in house ...First line>"
		label.Visible=true
		nxt.Visible=true
		
		press = false
		while press == false do 
			local input=UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		
		label.Visible = false
		nxt.Visible = false
		
		local walkTrgt = workspace:FindFirstChild("SherryWalkTarget", true)
		local sherryhum = sherryHouse:WaitForChild("Humanoid")
		local rootPart = sherryHouse:WaitForChild("HumanoidRootPart")

		local animator = sherryhum:WaitForChild("Animator")
		local walkAnim = Instance.new("Animation")
		walkAnim.AnimationId = "rbxassetid://180426354"
		local walkTrack = animator:LoadAnimation(walkAnim)
		walkTrack.Looped = true
		walkTrack:Play()
		
		rootPart.Anchored = false 

		if walkTrgt and sherryhum then
			print("MoveTo called, waiting for finish...")
		
			local distance = (rootPart.Position - walkTrgt.Position).Magnitude
			while distance > 4 do 
				
				task.wait(1)
				sherryhum:MoveTo(walkTrgt.Position)

				local reached = sherryhum.MoveToFinished:Wait() 

				distance = (rootPart.Position - walkTrgt.Position).Magnitude
				
				

				if not reached and distance > 4 then
					print("MoveTo timed out, resuming walk...")
				end
			end

			print("Finished moving successfully!")
		else
			print("Error: Target or Humanoid missing!")
		end	
		
		walkTrack:Stop()
		
		label.Text="<Sherry in house ...Second line>"
		label.Visible = true
		nxt.Visible= true
		
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		label.Visible = false
		nxt.Visible=false
		
		local hstscene = false
		houseSt.Disabled = false
		
		houseSt:GetPropertyChangedSignal("Occupant"):Connect(function()
			if houseSt.Occupant~= nil and houseSt.Occupant.Parent ==player.Character and hstscene == false then
				hstscene = true
				
				local sitH = houseSt.Occupant
				local sitSpd = sitH.WalkSpeed
				local sitJ = sitH.JumpPower
				local sitJH = sitH.JumpHeight
				sitH.WalkSpeed = 0
				sitH.JumpPower = 0
				sitH.JumpHeight = 0
				
				local pathFolder = workspace:FindFirstChild("Sherry2Path",true)
				local c = #pathFolder:GetChildren()
				
				local wkani2 = Instance.new("Animation")
				wkani2.AnimationId = "rbxassetid://180426354"
				local wkTr2 = animator:LoadAnimation(wkani2)
				wkTr2.Looped = true
				wkTr2:Play()
				
				for i=1, c do
					local pt = pathFolder:FindFirstChild(tostring(i))
					local d2 = (rootPart.Position-pt.Position).Magnitude
					while d2>4 do
						sherryhum:MoveTo(pt.Position)
						local reach2 = sherryhum.MoveToFinished:Wait()
						d2 = (rootPart.Position - pt.Position).Magnitude
					end
				end
				wkTr2:Stop()
				
				local pAnim = Instance.new("Animation")
				pAnim.AnimationId = "rbxassetid://104157641278831"
				local pTr = animator:LoadAnimation(pAnim)
				pTr.Priority = Enum.AnimationPriority.Action
				pTr.Looped = true
				pTr:Play()
				
				label.Text = "<selftalk>"
				label.Visible=true
				nxt.Visible=true
				
				press=false
				while press == false do
					local inpu = UserIS.InputBegan:Wait()
					if inpu.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				label.Text = "<s-Talk>"
				press=false
					while press == false do
						local input = UserIS.InputBegan:Wait()
						if input.KeyCode == Enum.KeyCode.F then
							press = true
					end
				end
				label.Text = "Sherry:(shouts) <Sherry shouting out>"
				
				press = false
				while press == false do
					local input = UserIS.InputBegan:Wait()
					if input.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				label.Visible=false
				nxt.Visible=false
				
				sitH.WalkSpeed = sitSpd	
				sitH.JumpHeight = sitJ
				sitH.JumpHeight = sitJH
				
				local drZn = workspace:FindFirstChild("DoorZone", true)
				local drprmt = workspace.bthdoor.bathdoormur:FindFirstChild("DoorPrompt", true)
				local talk = false
				
				drZn.Touched:Connect(function(hit)
				if hit.Parent == player.Character and talk == false then
					talk=true
					drprmt.Enabled = false
					label.Text= "<Shery asks for hepl>"
					label.Visible = true
					nxt.Visible = true
					
					press = false
					while press == false do
						local input = UserIS.InputBegan:Wait()
						if input.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					
					drprmt.Enabled = true
				end
				end)
				
				
			end
		end)
	end)
	
end)       