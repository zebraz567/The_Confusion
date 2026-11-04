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

    local sel=game:GetService("Selection")
	local parts={}

	for _, desendents in pairs(workspace.Police1:GetDescendants()) do
		if desendents:IsA("BasePart") then
			table.insert(parts, desendents)
		end
	end
	for _, part in pairs(parts) do
		part.Transparency=1
		part.CanCollide = false
		part.Anchored = true
	end
	local k =workspace.Police1.Head:WaitForChild("Decal")
	k.Transparency=1;

	local s = game:GetService("Selection")
	local p={}

	for _, d in pairs(workspace.police2:GetDescendants()) do
		if d:IsA("BasePart") then
			table.insert(p,d)
		end
	end
	for _, part in pairs(p) do
		part.Transparency=1
		part.CanCollide = false
		part.Anchored = true
	end 
	local f = workspace.police2.Head:WaitForChild("Decal")
	f.Transparency=1;
	
	
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
		
		local pt = {}
		for _,desen in pairs(workspace.CherryMainDED:GetDescendants()) do
			if desen:IsA("BasePart") then
				table.insert(pt, desen)
			end
		end
		for _, pts in pairs(pt) do
			pts.CanCollide = false
			pts.Anchored = true
		end
		
		label.Text="<Sherry in house ...First line>"
		label.Visible=true
		nxt.Visible=true
		
		houseprompt.Enabled = false

		
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
        wait(1)
		local pt1_1 = Vector3.new(854.291 , 7.82 , 552.661)

		sherryhum:MoveTo(pt1_1)
		sherryhum.MoveToFinished:Wait()
		
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
				
				
				local wkani2 = Instance.new("Animation")
				wkani2.AnimationId = "rbxassetid://180426354"
				local wkTr2 = animator:LoadAnimation(wkani2)
				wkTr2.Looped = true
				wkTr2:Play()
				
				rootPart.Anchored = false 
				
				wait(1)
				local pt2_1 = Vector3.new(847.8 , 1.22 , 553.5)

				sherryhum:MoveTo(pt2_1)
				sherryhum.MoveToFinished:Wait()
				
				local pt2_2 = Vector3.new(842.491 , 1.49 , 568.439)
				
				sherryhum:MoveTo(pt2_2)
				sherryhum.MoveToFinished:Wait()
				
				local pt2_3 = Vector3.new(830.383 , 1.49 , 570.178)
				
				sherryhum:MoveTo(pt2_3)
				sherryhum.MoveToFinished:Wait()
				
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
				local drprmt = workspace.bthdoor.bathdoormur:FindFirstChild("DoorPrompt")
				local talk = false
				drprmt.Enabled = false
				
				drZn.Touched:Connect(function(hit)
				if hit.Parent == player.Character and talk == false then
					talk=true
					
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
					
					pTr:Stop()
					drprmt.Enabled = true
				end
				end)
					
			end
		end)
	end)
	
	local bodyPrompt = workspace.CherryMainDED.HumanoidRootPart:FindFirstChild("BodyPrompt",true)
    bodyPrompt.Enabled = true
	bodyPrompt.Triggered:Connect(function()
		bodyPrompt.Enabled= false
		
		--[[ **commented this part as it is of no use now but can be useful afterwads**
		local cheryhum = workspace.CherryMainDED:WaitForChild("Humanoid")
		local anmt = cheryhum:WaitForChild("Animator")
		local anima = Instance.new("Animation")
		anima.AnimationId = "rbxassetid://124865660803880"
		local a = anmt:LoadAnimation(anima)]]
		
		local leftarm = workspace:WaitForChild("Left Arm")
		local pivt = workspace:WaitForChild("Armpivot") 
		leftarm.PivotOffset = pivt.CFrame:Inverse()*leftarm.CFrame
		leftarm.CFrame  = leftarm.CFrame*CFrame.Angles(math.rad(70),0,0)

		label.Text="<Checks if alive>"
		label.Visible =true
		nxt.Visible=true

		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		leftarm.CFrame = leftarm.CFrame*CFrame.Angles(math.rad(-70),0,0)
		label.Text = "<Me: She's dead , call the police!>"

		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end

		label.Visible = false
		nxt.Visible = false

		local sceneTitle=scenegui.BlackFrame.SceneTitle
		sceneTitle.Text="Police Arrives... You explain the incident to the police"
		scenegui.Enabled = true
		
		press=false
		local cn = 0
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.E then
				press = true
				cn = 1
			end
		end
		if cn == 1 then 
			local chr = player.Character
			local tp = workspace:WaitForChild("TpPart")
			chr.HumanoidRootPart.CFrame = tp.CFrame
		end
		
		local sel = game:GetService("Selection")
		local parts={}
		
		for _, descendent in pairs(workspace.Police1:GetDescendants()) do
			if descendent:IsA("BasePart") then
				table.insert(parts, descendent)	
			end
		end
		for _, part in pairs(parts) do
			part.Transparency = 0
			part.CanCollide = true
			part.Anchored = true
		end
		
		local k = workspace.Police1.Head:WaitForChild("Decal")
		k.Transparency=0 
		
		
		local s=game:GetService("Selection")
		local prt={}
		
		for _, d in pairs(workspace.police2:GetDescendants()) do
			if d:IsA("BasePart") then
				table.insert(prt,d)
			end
		end
		for _, p in pairs(prt) do
			p.Transparency = 0
			p.CanCollide = true
			p.Anchored = true
		end
		
		local f =workspace.police2.Head:WaitForChild("Decal")
		f.Transparency=0;
		
		scenegui.Enabled = false
		
		label.Text = "<Police: After observing all the incident ... this case seems like a su*c*de>"
		label.Visible =true
		nxt.Visible= true
		
		press =false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press =true
			end
		end
		label.Text= "<Police: But we still have to investigate it for confimation>"
		press = false
		while press == false do
			local input=UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		label.Text= "<Police: After a short descussion , we will let you know what to do!>"
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then 
				press = true
			end
		end
		
		label.Text= "<Me: Ok ...but... I think there's something more >"
		press= false
		while press == false do
			local input=UserIS.InputBegan:Wait()
			if input.KeyCode==Enum.KeyCode.F then
				press =true
			end
		end
		
		label.Visible = false
		nxt.Visible = false 
		
		
		local pol1hum = workspace.Police1:WaitForChild("Humanoid")
		local animtr = pol1hum:WaitForChild("Animator")
		local pol_wl = Instance.new("Animation")
		pol_wl.AnimationId = "rbxassetid://180426354"
		local polTr = animtr:LoadAnimation(pol_wl)
		
		local prts={}

		for _, descendent in pairs(workspace.Police1:GetDescendants()) do
			if descendent:IsA("BasePart") then
				table.insert(prts, descendent)	
			end
		end
		for _, pts in pairs(prts) do
			pts.CanCollide = true
			pts.Anchored = false
		end
		
		polTr.Looped =true
		polTr:Play()
		
		local trgtpol1 = Vector3.new(847.9, 1.32, 551.5)
		
		pol1hum:MoveTo(trgtpol1)
		pol1hum.MoveToFinished:Wait()
		
		local trgtpol2 = Vector3.new(852.7, 1.62, 548.5)
		pol1hum:MoveTo(trgtpol2)
		pol1hum.MoveToFinished:Wait()
		
		polTr:Stop()                                                                          
		 
	end)
	
	local MainE_paper = workspace:WaitForChild("ME_paper")
	local Pmt_MEp = MainE_paper:WaitForChild("ProximityPrompt")
	local lockp = workspace.bthdoor.bathdoormur.lockcc:WaitForChild("ProximityPrompt")
	local cdprm = workspace.cardboard:WaitForChild("ProximityPrompt")
	local MainE_tape = workspace.ME_cdtape:WaitForChild("ProximityPrompt")
	
	Pmt_MEp.Enabled=true
	bodyPrompt.Enabled = true
	lockp.Enabled = true
	
	Pmt_MEp.Triggered:Connect(function()
		Pmt_MEp.Enabled=false
		label.Text = "<A peice of paper.. can be a evidence ... tell police about this >"
		label.Visible=true
		nxt.Visible =true
		
		local polprmpt = workspace.Police1.Torso:WaitForChild("ProximityPrompt")
		
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		
		label.Visible=false
		nxt.Visible = false
		
		polprmpt.Enabled = true
		
		polprmpt.Triggered:Connect(function()
			label.Text = "<Police: Thanks for telling us ... we will find out if its useful!"
			label.Visible=true
			nxt.Visible = true
			
			MainE_paper.Transparency = 1
			
			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end
			label.Visible = false
			nxt.Visible = false
		end)
		
	end)
	
	bodyPrompt.Triggered:Connect(function()
		bodyPrompt.Enabled = false
		
		label.Text = "<Me : The cuts ... on the hand doesn't fit quite right.. >"
		label.Visible = true
		nxt.Visible = true
		
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		label.Text= "<Me: A person who suicide would never cut their hands in such aggresive manner...>"
		
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		label.Visible = false
		nxt.Visible = false
	end)
	
	lockp.Triggered:Connect(function()
		lock.Enabled = false
		label.Text = "<Me:This door was locked from inside...>"
		label.Visible = true
		nxt.Visible = true
		
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		
		label.Text = "<Me: Then after we forced the door.. the lock should have broke??>"
		
		press = false
		while press == false do
			local input = UserIS.InputBegan:Wait()
			if input.KeyCode == Enum.KeyCode.F then
				press = true
			end
		end
		label.Visible = false
		nxxt.Visible = false
	end)
	
	cdprm.Triggered:Connect(function()
		cdprm.Enabled = false
	end)
	
	MainE_tape.Triggered:Connect(function()
		MainE_tape.Enabled = false
		
	end)
	
end)                                                                         