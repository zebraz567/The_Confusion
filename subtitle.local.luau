local UserIS = game:GetService("UserInputService")

local gui = script.Parent
local label = gui.SubtitleLabel
local nxt = gui.NextButton
local promt = workspace:WaitForChild("CafeStaff"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")
local seat = workspace:FindFirstChild("CafeSeat", true)
local player = game.Players.LocalPlayer

local pl0 = game.Players.LocalPlayer
local ch0 = pl0.Character or pl0.CharecterAdded:Wait()
local hum0 = ch0:WaitForChild("Humanoid")
hum0.WalkSpeed = 0
hum0.JumpPower = 0
local Begin = player.PlayerGui:WaitForChild("BeginGui")
local beginF = Begin:WaitForChild("BeginFrame")
local beginLabel = beginF:WaitForChild("BeginLabel")
local Obj = player.PlayerGui:WaitForChild("ObjectiveGui")
local objF = Obj:WaitForChild("objF")
local l1 = objF:WaitForChild("Line1")
local l2 = objF:WaitForChild("Line2")
local l3 = objF:WaitForChild("Line3")
local l4 = objF:WaitForChild("Line4")

Begin.Enabled = true
beginF.Visible = true
beginLabel.Text = [[
                    Press <1> for EASY DIFFICULTY  
                                 or  
                    Press <2> for NORMAL DIFFICULTY       
                  ]]

local pr1 = false
local diffi = 0
while pr1 == false do
	local inp1 = UserIS.InputBegan:Wait()
	if inp1.KeyCode == Enum.KeyCode.One then
		beginLabel.Text = "You chose EASY difficulty!"
		diffi = 0
		pr1 = true
		Begin.Enabled= false
		
	elseif inp1.KeyCode == Enum.KeyCode.Two then
		beginLabel.Text = "You chose NORMAL difficulty!"
		diffi = 1
		pr1 = true
		Begin.Enabled = false
	end
end
hum0.WalkSpeed = 16
hum0.JumpPower = 40

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

Obj.Enabled = true
objF.Visible = true 

l3.Visible = false
l4.Visible = false
l1.Text = " Talk to the staff "
l2.Text = " at the counter "

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
	
	l1.Text = " Sit on the seat "
	l2.Text = " assigned to you "
	
	label.Visible = false
	nxt.Visible = false
	talk2Staff=true
	promt.Enabled = true
	
	
end)


seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	if seat.Occupant ~= nil and talk2Staff == true and scenePly ==false and seat.Occupant.Parent == player.Character then
		scenePly = true
		
		l1.Text = " No Objective "
		l2.Visible =false
		
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
		
		l1.Text = " Ask the seated customers "
		l2.Text = " about your concert ticket "
		l2.Visible = true
		
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
	local policetpe = workspace:WaitForChild("Police_Tape")
	
	local tp = {}
	for _, den in pairs(policetpe:GetDescendants()) do
		if den:IsA("BasePart") then
			table.insert(tp,den)
		end
	end 
	for _, t in pairs(tp) do
		t.CanCollide = false
		t.Transparency = 1
	end
	
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
		
		for _, t in pairs(tp) do
			t.Transparency = 1
		end

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
		
		--This part is all the script of the evidences
		local MainE_paper = workspace:WaitForChild("ME_paper")
		local Pmt_MEp = MainE_paper.Cloud:WaitForChild("ProximityPrompt")
		local lockp = workspace.bthdoor.bathdoormur.lockcc:WaitForChild("ProximityPrompt")
		local cdprm = workspace.cardboard.Cardboard_Box:WaitForChild("ProximityPrompt")
		local MainE_tape = workspace.ME_cdtape:WaitForChild("ProximityPrompt")
		local bspot = workspace.BloodSpot.bsm:WaitForChild("ProximityPrompt")
		local chem = workspace.chemicals.Liquid:WaitForChild("ProximityPrompt")
		local bodyEv = workspace.CherryMainDED.HumanoidRootPart:WaitForChild("ProximityPrompt")
		local Poster = workspace.Poster:WaitForChild("ProximityPrompt")
		local Colon_F= workspace.Colon:WaitForChild("ProximityPrompt")
		local BJuice_F = workspace.Banana_Juice:WaitForChild("ProximityPrompt")
		local Blanket_F = workspace.Blanket_F:WaitForChild("ProximityPrompt")
		local EndPrompt = workspace.Police1.Torso:WaitForChild("EndPrompt")
		
		--This is for the show of the option screen!
		local repSt=game:GetService("ReplicatedStorage")
		local Players =game:GetService("Players")
		local pl = Players.LocalPlayer
		local playergui=pl:WaitForChild("PlayerGui")
		local Options = playergui:WaitForChild("OptionsGui")
		local frame1 = Options:WaitForChild("OneOption")
		local op1 = frame1:WaitForChild("opOne")
		local frame2 = Options:WaitForChild("TwoOption")
		local op2 = frame2:WaitForChild("opTwo")
		local frame3 = Options:WaitForChild("ThreeOption")
		local op3 = frame3:WaitForChild("opThree")
		local frame4 = Options:WaitForChild("FourOption")
		local op4 = frame4:WaitForChild("opFour")
		local QFrame = Options:WaitForChild("Question")
		local q= QFrame:WaitForChild("Qna")
		local back = Options:WaitForChild("BackF")
		local b = back:WaitForChild("back")
		local Ending = playergui:WaitForChild("EndGui")
		local EndFrame = Ending:WaitForChild("EndFrame")
		local EndLabel = EndFrame:WaitForChild("EndLabel")
		
		local opCorrect = 0 
		local opWrong = 0
		local opStry = 0

		Pmt_MEp.Enabled   =true
		lockp.Enabled     =true
		cdprm.Enabled     =true
		MainE_tape.Enabled=true
		bspot.Enabled     =true
		chem.Enabled      =true
		bodyEv.Enabled    =true
		Poster.Enabled    =true
		if diffi == 0 then
			Colon_F.Enabled   =true
			BJuice_F.Enabled  =true
			Blanket_F.Enabled =true
		end
		EndPrompt.Enabled = true
		
		local plr1 = game.Players.LocalPlayer
		local ch1 = plr1.Character or plr1.CharecterAdded:Wait()
		local hum1 = ch1:WaitForChild("Humanoid")

		Pmt_MEp.Triggered:Connect(function()
			Pmt_MEp.Enabled=false
			hum1.WalkSpeed = 0
			hum1.JumpPower =0
			
			label.Text = "<A peice of paper.. can be a evidence ... should I tell police about this ?>"
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
			
			Options.Enabled=true
			q.Text = "Do you want to tell the police ?"
			QFrame.Visible =true
			op1.Text = "1. Yes"
			op2.Text = "2. No"
			frame2.Visible = true
			frame1.Visible =true
			back.Visible = true
			
			press =false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					polprmpt.Enabled = true
					EndPrompt.Enabled = false
					frame2.Visible=false
					frame1.Visible=false
					QFrame.Visible=false
					Options.Enabled =false
					back.Visible =false
					opStry = opStry+1

					polprmpt.Triggered:Connect(function()
						polprmpt.Enabled = false
						label.Text = "<Police: Thanks for telling us ... we will find out if its useful!"
						label.Visible=true
						nxt.Visible = true

						press = false
						while press == false do
							local ipu = UserIS.InputBegan:Wait()
							if ipu.KeyCode == Enum.KeyCode.F then
								press = true
							end
						end
						label.Visible = false
						nxt.Visible = false
					end)
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
				
				elseif inp.KeyCode == Enum.KeyCode.Two then
					
					frame1.Visible =false
					frame2.Visible = false
					QFrame.Visible=false
					Options.Enabled=false
					back.Visible=false
					opWrong=opWrong + 1
					
					label.Text = "<I guess I would be inturepting the police! >"
					label.Visible = true
					nxt.Visible =true
					
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					frame1.Visible = false
					frame2.Visible =false
					QFrame.Visible = false
					back.Visible = false
					Options.Enabled = false
					Pmt_MEp.Enabled = true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
				end	
				
			end

		end)

		bodyEv.Triggered:Connect(function()
			bodyEv.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0

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
			
			Options.Enabled = true
			back.Visible =true
			frame1.Visible = true
			op1.Text = "BodyEv 1st line"
			frame2.Visible = true
			op2.Text = "BodyEv 2nd line"
			frame3.Visible = true
			op3.Text = "Bodyev 3rd line "
			frame4.Visible = true
			op4.Text = "BodyEv 4th line"
			QFrame.Visible = true
			q.Text = "BodyEv question?"
			
			press = false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opCorrect = opCorrect + 1
					
					label.Text = "<1st option line!>"
					label.Visible = true
					nxt.Visible = true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press =true
						end
					end
					label.Visible = false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Two then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong +1
					
					label.Text ="<2nd option line!>"
					label.Visible = true
					nxt.Visible =true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<3rd option line>"
					label.Visible = true
					nxt.Visible =true
					press = false
					while press == false do
						local ipu =UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible=false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
				
				elseif inp.KeyCode == Enum.KeyCode.Four then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong +1
					
					label.Text = "<4th option line>"
					label.Visible =true
					nxt.Visible = true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible = false
					bodyEv.Enabled = true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				end
			end
			
		end)

		lockp.Triggered:Connect(function()
			lockp.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower =0
			
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
			nxt.Visible = false
			
			Options.Enabled = true
			back.Visible =true
			QFrame.Visible = true
			q.Text="doorhandle quetion?"
			frame1.Visible = true
			op1.Text = "lockc 1st option"
			frame2.Visible= true
			op2.Text = "lockc 2nd option"
			frame3.Visible = true
			op3.Text = "lockc 3rd option"
			frame4.Visible = true
			op4.Text = "lockc 4th option"
			
			
			press = false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opCorrect = opCorrect+1
					
					label.Text = "<1st option line>"
					label.Visible=true
					nxt.Visible= true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible =false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower =40
					
				elseif inp.KeyCode == Enum.KeyCode.Two then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<2nd option line>"
					label.Visible = true
					nxt.Visible = true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press =true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower =40
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text = "<3rd option line>"
					label.Visible= true
					nxt.Visible = true
					press=false
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible =false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower =40
					
				elseif inp.KeyCode == Enum.KeyCode.Four then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text = "<4th option line>"
					label.Visible = true
					nxt.Visible = true
					press= false
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press =true
						end
					end
					label.Visible = false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower =40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled = false
					frame1.Visible=false
					frame2.Visible= false
					frame3.Visible = false
					frame4.Visible =false
					QFrame.Visible = false
					back.Visible =false
					lockp.Enabled = true
					hum1.WalkSpeed = 16
					hum1.JumpPower =40
				end
				
			end
			
		end)

		cdprm.Triggered:Connect(function()
			cdprm.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower =0

			label.Text = "ME: They probablly started packing stuff ..."
			label.Visible = true
			nxt.Visible = true

			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end

			label.Text ="ME: ...probablly to shift to the different house Sherry was mentioning before!"

			press=false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end

			label.Visible = false
			nxt.Visible = false
			hum1.WalkSpeed = 16
			hum1.JumpPower =40

		end)

		MainE_tape.Triggered:Connect(function()
			MainE_tape.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0

			label.Text = "ME: What's this tape doing here? "
			label.Visible = true
			nxt.Visible =true

			press=false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end

			label.Visible = false
			nxt.Visible = false
			
			Options.Enabled = true
			back.Visible =true
			frame1.Visible = true
			op1.Text = "Tape 1st option"
			frame2.Visible = true
			op2.Text = "Tape 2nd option"
			frame3.Visible = true
			op3.Text = "Tape 3rd option"
			frame4.Visible = true
			op4.Text = "Tape 4th option"
			QFrame.Visible = true
			q.Text = "Tape Question?"
			
			press=false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text ="<1st option lne>"
					label.Visible=true
					nxt.Visible = true
					press = true
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible =false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Two then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<2nd option line>"
					label.Visible = true
					nxt.Visible =true
					press = true
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text="<3rd option line"
					label.Visible = true
					nxt.Visible =true
					press =true
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Four then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opCorrect = opCorrect + 1
					
					label.Text ="<4th  option line>"
					label.Visible = true
					nxt.Visible = true
					press=true
					while press==false do
						local ipu= UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible =false
					frame4.Visible = false
					back.Visible = false
					MainE_tape.Enabled =true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				end
			end
			
		end)

		bspot.Triggered:Connect(function()
			bspot.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0

			label.Text = "ME(thought): A BLOOD SPOT?"
			label.Visible = true
			nxt.Visible = true

			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end

			label.Visible=false
			nxt.Visible =false
			
			Options.Enabled = true
			back.Visible =true
			QFrame.Visible = true
			q.Text = "Bspot Question?"
			frame1.Visible = true
			op1.Text = "Bspot 1st otpion"
			frame2.Visible = true
			op2.Text = "Bspot 2nd option"
			frame3.Visible = true
			op3.Text = "Bspot 3rd option"
			frame4.Visible = true
			op4.Text = "Bspot 4th option"
			
			press=false
			while press==false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text="<1st option line>"
					label.Visible=true
					nxt.Visible = true
					press = true
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Two then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opCorrect = opCorrect + 1
					
					label.Text = "<2nd option line>"
					label.Visible = true
					nxt.Visible=true
					
					press = true
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode== Enum.KeyCode.F then
							press =true
						end
					end
					label.Visible = false
					nxt.Visible= false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text="<3rd option line>"
					label.Visible = true
					nxt.Visible = true
					press=true
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode== Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible =false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Four then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text ="<4rd option line>"
					label.Visible =true
					nxt.Visible = true
					press = true
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible =false
					nxt.Visible= false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					QFrame.Visible = false
					back.Visible =false
					bspot.Enabled = true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
				end
			end

		end)
		
		chem.Triggered:Connect(function()
			chem.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0

			label.Text = "ME: Why is this detergent and shampoo mixed up?"
			label.Visible = true
			nxt.Visible = true

			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode ==Enum.KeyCode.F then
					press= true
				end
			end
			label.Visible = false
			nxt.Visible = false
			
			back.Visible = true
			Options.Enabled = true
			q.Text = "Chem question ?"
			QFrame.Visible = true
			op1.Text = "Chem option 1"
			frame1.Visible  = true
			op2.Text = "Chem option 2"
			frame2.Visible = true
			op3.Text = "Chem option 3"
			frame3.Visible = true
			op4.Text = "Chem option 4"
			frame4.Visible = true
			
			press = false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible = false
					opWrong = opWrong+1
					
					label.Text = "<1st option line>"
					label.Visible=true
					nxt.Visible = true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Two then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					opWrong= opWrong+1
					
					label.Text="<2nd option line>"
					label.Visible = true
					nxt.Visible = true
					press=false
					while press==false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "3rd option"
					label.Visible = true
					nxt.Visible= true
					press = false
					while press == false do
						local ipu =UserIS.InputBegan:Wait()
						if ipu == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible =false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Four then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible= false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					opStry = opStry + 1
					
					label.Text = "<4th option line>"
					label.Visible = true
					nxt.Visible =true
					press=false
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if inp.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible =false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible= false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					chem.Enabled =true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				end
			end
			
		end)
		
		Poster.Triggered:Connect(function()
			Poster.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0
			
			label.Text ="ME: I am missing something...."
			label.Visible = true
			nxt.Visible = true
			
			press = false
			while press == false do 
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end
			
			label.Text="Or...is it just my feeling..?"
			
			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end
			label.Visible = false
			nxt.Visible =false
			
			Options.Enabled = true
			q.Text="Poster Question?"
			Qframe.Visible = true
			op1.Text = "Poster option 1"
			frame1.Visible = true
			op2.Text = "Poster option 2"
			frame2.Visible = true
			op3.Text = "Poster option 3"
			frame3.Visible = true
			op4.Text = "Poster option 4"
			frame4.Visible = true
			
			press=false
			while press==false do
				local inp=UserIS.InputBegan:Wait()
				if inp.KeyCode ==Enum.KeyCode.One then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text="<1st option line>"
					label.Visible =true
					nxt.Visible=true
					press=false
					while press==false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible= false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Two then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible = false
					opWrong = opWrong + 1
					
					label.Text="<2nd option line>"
					label.Visible = true
					nxt.Visible=true
					press=false
					while press==false do
						local ipu =UserIS.InputBegan:Wait()
						if ipu.KeyCode== Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					opCorrect = opCorrect+1
					
					label.Text ="<3rd option line>"
					label.Visible=true
					nxt.Visible=true
					press=true
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible=false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Four then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible = false
					opWrong = opWrong + 1
					
					label.Text="<4th option line>"
					label.Visible =true
					nxt.Visible = true
					press = false
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible= false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					Poster.Enabled =true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				end
			end
			
		end) 
		
		Colon_F.Triggered:Connect(function()
			Colon_F.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0
			
			label.Text ="ME: Why is Colon partially filled?"
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
			
			Options.Enabled = true
			op1.Text = "Colon option 1"
			frame1.Visible = true
			op2.Visible = "Colon option 2"
			frame2.Visible = true
			op3.Text = "Colon option 3"
			frame3.Visible = true
			op4.Text = "Colon option 4"
			frame4.Visible = true
			q.Text = "Colon question ?"
			QFrame.Visible = true
			
			press=false
			while press == false do
				local inp=UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible =false
					frame4.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text="<1st option line>"
					label.Visible = true
					nxt.Visible =true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.F then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text="<2nd option>"
					label.Visible = true
					nxt.Visible = true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible= false
					nxt.Visible=false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Three then
					Options.Enabled = false
					QFrame.Visible= false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible = false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text = "<3rd option line>"
					label.Visible = true
					nxt.Visible = true
					press = false
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = false
					nxt.Visible=false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Four then
					Options.Enabled = false
					QFrame.Visible =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible = false
					frame4.Visible =false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text="<4th option line>"
					label.Visible = true
					nxt.Visible =true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Visible = true
					nxt.Visible =true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible =false
					frame4.Visible = false
					back.Visible =false
					Colon_F.Enabled=true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				end
			end
			
		end)
		 
		BJuice_F.Triggered:Connect(function()
			BJuice_F.Enabled = false
			hum1.WalkSpeed =0
			hum1.JumpPower = 0
			
			label.Text = "ME: Why is this juice so yellow?"
			label.Visible = true
			nxt.Visible = true
			
			press =false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode==Enum.KeyCode.F then
					press =true
				end
			end
			label.Visible =false
			nxt.Visible= false
			
			Options.Enabled = true
			op1.Text = "Bjuice option 1"
			frame1.Visible = true
			op2.Text = "Bjuice option 2"
			frame2.Visible =true
			op3.Text  = "Bjuice option 3"
			frame3.Visible = true
			op4.Text = "Bjuice option 4"
			frame4.Visible =true
			q.Text = "Bjuice question ?"
			QFrame.Visible =true
			
			press=true
			while press == false do
				local inp=UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					Options.Enabled = false
					QFrame.Visible =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					back.Visible =false
					opWrong = opWrong + 1
					
					label.Text = "<1st option lone>"
					label.Visible= true
					nxt.Visible = true
					press=false
					while press==false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode ==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Two then
					Options.Enabled =false
					QFrame.Visible =false
					frame1.Visible = false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<2nd option line>"
					label.Visible =true
					nxt.Visible = true
					press = false
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false 
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Three then
					Options.Enabled =false
					QFrame.Visible =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible = false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<3rd option line>"
					label.Visible=true
					nxt.Visible=true
					press=false
					while press==false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Four then
					Options.Enabled =false
					QFrame.Visible =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible=false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text="<4th option line>"
					label.Visible=true
					nxt.Visible=true
					press=false
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible=false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled =false
					QFrame.Visible =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible=false
					back.Visible =false
					BJuice_F.Enabled=true
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				end
			end
				
	    end)
		 
		Blanket_F.Triggered:Connect(function()
			Blanket_F.Enabled = false
			hum1.WalkSpeed = 0
			hum1.JumpPower = 0	
				
			label.Text = "Why is this blanket so scrumbled?"
			label.Visible=true
			nxt.Visible = true
			
			press=true
			while press == false do
				local input =UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press =true
				end
			end
			label.Visible=false
			nxt.Visible =false
			
			Options.Enabled =true
			op1.Text = "Blanket otpion 1"
			frame1.Visible =true
			op2.Text = "Blanket option 2"
			frame2.Visible = true
			op3.Text = "Blanket otpion 3"
			frame3.Visible =true
			op4.Text = "Blanket option 4"
			frame4.Visible =true
			q.Text = "Blanket question ?"
			QFrame.Visible =true
			
			press=false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode ==Enum.KeyCode.One then
					Options.Enabled =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					QFrame.Visible =false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<1st option>"
					label.Visible=true
					nxt.Visible=true
					press= true
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible =false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Two then
					Options.Enabled =false
					frame1.Visible = false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible = false
					QFrame.Visible =false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text ="<2nd optionline>"
					label.Visible=true
					nxt.Visible=true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Three then
					Options.Enabled = false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					QFrame.Visible =false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text = "<3rd option line>"
					label.Visible = true
					nxt.Visible=true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode ==Enum.KeyCode.Four then
					Options.Enabled =false
					QFrame.Visible =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					back.Visible = false
					opWrong = opWrong+1
					
					label.Text="<4th option line>"
					label.Visible=true
					nxt.Visible = true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
					
				elseif inp.KeyCode == Enum.KeyCode.Five then
					Options.Enabled =false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					QFrame.Visible =false
					back.Visible =false 
					hum1.WalkSpeed = 16
					hum1.JumpPower = 40
				end
			end
		
		end)
		
		EndPrompt.Triggered:Connect(function()
			EndPrompt.Enabled = false
			Options.Enabled = false
			EndGui.Enabled = true
			
			if opCorrect == 0 and opStry==0 and opWrong==0 then
				EndLabel.Text = " You provided the police NO evidence which left them more confused and the culprit ESCAPED! "
				EndFrame.Visible = true
				
			elseif opCorrect == 5 and opStry==2 and opWrong==0 then
				EndLabel.Text = "You were perfect with your deductions...(continue)..."
				EndFrame.Visible = true
				
			elseif opCorrect<=4 and opCorrect>2 and opStry==2 and opWrong>2 then
				EndLabel.Text = "You were great with your deductions but you missed some important points to be noticed!"
				EndFrame.Visible = true
				
			elseif opCorrect<=2 then
				EndLabel.Text = "You tried but couldn't get the result you actually wanted!"
				EndFrame.Visible = true
			
			elseif opWrong>0 and opCorrect ==0 and opStry ==0 then
				EndLabel.Text = "You were completely wrong with your evidence resulting in the escape of the culprit! "
				EndFrame.Visible = true
			end
			
		end)
		 
	end)
	
end)                                                                         