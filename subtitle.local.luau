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

local pr1 = false
local diffi = 0
while pr1 == false do
	local inp1 = UserIS.InputBegan:Wait()
	if inp1.KeyCode == Enum.KeyCode.One then
		diffi = 0
		pr1 = true
		Begin.Enabled= false
		
	elseif inp1.KeyCode == Enum.KeyCode.Two then
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
		l1.Text = " Talk to the woman "
		l2.Text = " near the call booth "
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
		l1.Text = " Talk to the woman "
		l2.Text = " near the call booth "
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
		l1.Text = " Talk to the woman "
		l2.Text = " near the call booth "
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
		l1.Text = " Talk to the woman "
		l2.Text = " near the call booth "
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
	objF.Visible = false
	
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
	objF.Visible = true
	
	l1.Text = " Talk with her while "
	l2.Text = " driving the car "
	
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
	objF.Visible = true
	
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
	objF.Visible = true
	hum.WalkSpeed = oldSpd
	hum.JumpPower = oldjmp
	hum.JumpHeight = oldJmpH
	
	l1.Text= " Do as directed by Sherry "
	l2.Visible = false
	
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
		
		l1.Text = "Follow Sherry"
		
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
		l1.Text = " Take a seat "
		
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
				
				l1.Text = " Find out why Sherry shouted "
				
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
					
					label.Text= "<Shery asks for help>"
					label.Visible = true
					nxt.Visible = true
					
					l1.Text = " Help Sherry to "
					l2.Text = " open the door "
					l2.Visible = true
					
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
		
		l1.Text = " Check if the "
		l2.Text = " is alive "
		
		--[[ **commented this part as it is of no use now but can be useful afterwads**
		local cheryhum = workspace.CherryMainDED:WaitForChild("Humanoid")
		local anmt = cheryhum:WaitForChild("Animator")
		local anima = Instance.new("Animation")
		anima.AnimationId = "rbxassetid://124865660803880"
		local a = anmt:LoadAnimation(anima)
		
		local leftarm = workspace:WaitForChild("Left Arm")
		local pivt = workspace:WaitForChild("Armpivot") 
		leftarm.PivotOffset = pivt.CFrame:Inverse()*leftarm.CFrame
		leftarm.CFrame  = leftarm.CFrame*CFrame.Angles(math.rad(70),0,0) ]]

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
		l1.Text = " Talk to the police "
		l2.Visible = false
		
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
		
		label.Text= "<To myself : I think there's something more! >"
		press= false
		while press == false do
			local input=UserIS.InputBegan:Wait()
			if input.KeyCode==Enum.KeyCode.F then
				press =true
			end
		end
		
		label.Visible = false
		nxt.Visible = false 
		
		l1.Text = "- Investigate the house "
		l2.Text = "- Find Evidences "
		l3.Text = "- End this by reporting "
		l4.Text = "  to Police"
		l2.Visible = true
		l3.Visible = true
		l4.Visible = true
		
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
			
			label.Text = "A peice of paper.. can be a evidence ... should I tell police about this ?"
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
			op3.Text = "1. Yes"
			op4.Text = "2. No"
			frame3.Visible = true
			frame4.Visible =true
			back.Visible = true
			
			press =false
			while press == false do
				local inp = UserIS.InputBegan:Wait()
				if inp.KeyCode == Enum.KeyCode.One then
					polprmpt.Enabled = true
					EndPrompt.Enabled = false
					frame3.Visible=false
					frame4.Visible=false
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
					
					frame3.Visible =false
					frame4.Visible = false
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
					frame3.Visible = false
					frame4.Visible =false
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
			
			label.Visible = false
			nxt.Visible = false
			
			Options.Enabled = true
			back.Visible =true
			frame1.Visible = true
			op1.Text = "1.Nobody would cut their hand so agressively"
			frame2.Visible = true
			op2.Text = "2.I just overthinking"
			frame3.Visible = true
			op3.Text = "3.She wasnt in proper mental state, thats why the cuts are agressive"
			frame4.Visible = true
			op4.Text = "4.Its normal for a person who suicide with a cut"
			QFrame.Visible = true
			q.Text = "Is the cut normal?"
			
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
					
					label.Text = "A person human who suicide would never cut their own hand like that"
					label.Visible = true
					nxt.Visible = true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press =true
						end
					end
					label.Text = "The person would be scared to cut their won hand like this"
					press = false
					while press == false do
						local ipu= UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text = "...Even if they are about to commit suicide"
					
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
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
					
					label.Text ="I am just out of my mind sometimes"
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
					
					label.Text = "Her bad mental state is surely the reason!"
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
					
					label.Text = "This is not a topic i should care about much"
					label.Visible =true
					nxt.Visible = true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text = "There are bigger fish to fry"
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
			
			label.Text = "This door was locked from inside..."
			label.Visible = true
			nxt.Visible = true

			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end

			label.Text = "Then after we forced the door.. the lock should have broke??"

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
			q.Text="Why didn't the lock break?"
			frame1.Visible = true
			op1.Text = "1.Because the lock was never actually locked from inside!"
			frame2.Visible= true
			op2.Text = "2.Because it was a remote controlled lock that Sherry could control from anywhere"
			frame3.Visible = true
			op3.Text = "3.Because the lock is made of nickel and zinc alloy"
			frame4.Visible = true
			op4.Text = "4.Because the lock was turboflex"
			
			
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
					
					label.Text = "Wait...the lock was never actually locked from inside!"
					label.Visible=true
					nxt.Visible= true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text = "It was Sherry from the beggining who was acting that door was locked"
					press = false
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="Sherry locked the door when we were pushing it open"
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="and at a sudden she opened the lock "
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="giving a illusion that we broke through the lock!"
					press = false
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
					
					label.Text = "It was controlled by Sherry with a remote!"
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
					
					label.Text = "Nickel and zinc alloy is nearly unbreakable and unscratchable"
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
					
					label.Text = "I am so dumb ...the lock was turboflex.."
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

			label.Text = "They probablly started packing stuff ..."
			label.Visible = true
			nxt.Visible = true

			press = false
			while press == false do
				local input = UserIS.InputBegan:Wait()
				if input.KeyCode == Enum.KeyCode.F then
					press = true
				end
			end

			label.Text ="...probablly to shift to the different house Sherry was mentioning before!"

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
			op1.Text = "1.This is not a tape at all"
			frame2.Visible = true
			op2.Text = "2.This can be here from several days!"
			frame3.Visible = true
			op3.Text = "3.They were just packing stuff"
			frame4.Visible = true
			op4.Text = "4.This is the exact tape on the bathroom door!"
			QFrame.Visible = true
			q.Text = "What is this tape doing here?"
			
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
					
					label.Text ="Why am i wasting my time!"
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
					
					label.Text = "Why am wasting time here!"
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
					
					label.Text= "This might be the tape they were using to pack stuff"
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
					
					label.Text ="Even if so , why is it here?"
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
					
					q.Text= "How did the tape come here?"
					op3.Text= "3.This is why the tape didn't had fingerprints of Sherry"
					op1.Text ="1.The is why the tape did't had fingerprints of Cherry"
					op2.Text ="2.The tape was probably an extra peice left out"
					op4.Text = "4.Cherry was probablly checking the strength of the tape!"
					
					press = false 
					while press == false do
						local inp1 = UserIS.InputBegan:Wait()
						if inp1.KeyCode == Enum.KeyCode.One then
							Options.Enabled = false
							frame1.Visible = false
							frame2.Visible = false
							frame3.Visible = false
							frame4.Visible = false
							QFrame.Visible = false
							back.Visible =false
							opWrong = opWrong+1
							label.Text="The tape didn't had fingerprint of Cherry cuase Sherry used it!"
							label.Visible = true
							nxt.Visible = true
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Visible = false
							nxt.Visible = false
							
						elseif inp1.KeyCode == Enum.KeyCode.Two then
							Options.Enabled = false
							frame1.Visible = false
							frame2.Visible = false
							frame3.Visible = false
							frame4.Visible = false
							QFrame.Visible = false
							back.Visible =false
							opWrong = opWrong+1
							label.Text="The tape was just a left out peice!"
							label.Visible = true
							nxt.Visible = true
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Visible = false
							nxt.Visible = false
							
						elseif inp1.KeyCode == Enum.KeyCode.Three then
							Options.Enabled = false
							frame1.Visible = false
							frame2.Visible = false
							frame3.Visible = false
							frame4.Visible = false
							QFrame.Visible = false
							back.Visible =false
							opCorrect = opCorrect+1
							label.Text="The tape didn't had fingerprint of Sherry cuase Cherry used it!"
							label.Visible = true
							nxt.Visible = true
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Text = "They were packing and Cherry was probablly using the tape to pack"
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Text ="And then Sherry used those tape to stick it to the inside of the door"
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Text = "Which removed the suspision from Sherry as the tape had Cherry's fingerprint!"
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Visible = false
							nxt.Visible = false
							
						elseif inp1.KeyCode == Enum.KeyCode.Four then
							Options.Enabled = false
							frame1.Visible = false
							frame2.Visible = false
							frame3.Visible = false
							frame4.Visible = false
							QFrame.Visible = false
							back.Visible =false
							opWrong = opWrong+1
							label.Text="Cherry was probally checking the reliability of the tape to tape shut the door"
							label.Visible = true
							nxt.Visible = true
							press = true
							while press == false do
								local inpp = UserIS.InputBegan:Wait()
								if inpp.KeyCode == Enum.KeyCode.F then
									press =true
								end
							end
							label.Visible = false
							nxt.Visible = false	
						end
					end
					
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

			label.Text = "(thought) A BLOOD SPOT?"
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
			q.Text = "Why there a blood spot?"
			frame1.Visible = true
			op1.Text = "1.Cherry might touched the door after hurting herself"
			frame2.Visible = true
			op2.Text = "2.It must be the main culprit's fingerprint"
			frame3.Visible = true
			op3.Text = "3.Its just tomato sauce"
			frame4.Visible = true
			op4.Text = "4.Someone might've spatted a mosquito there"
			
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
					
					label.Text="Cherry might have checked if someone was out after cutting her hand"
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
					
					label.Text = "It must be the culprit who checked the door after killing Sherry"
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
					
					label.Text="They might've touched the door after eating something with tomato sauce"
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
					
					label.Text ="Eww...a mosquito getting yanked here !!"
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

			label.Text = "Why is this detergent and shampoo mixed up?"
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
			q.Text = "Why are these mixed up?"
			QFrame.Visible = true
			op1.Text = "1.Cherry wasn't in proper state of mind!"
			frame1.Visible  = true
			op2.Text = "2.Must have been the wind!"
			frame2.Visible = true
			op3.Text = "3.Wait is this fluoride toothpaste and acidic detergent!"
			frame3.Visible = true
			op4.Text = "4.Wait is this chlorine bleach and acidic detergent!"
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
					
					label.Text = "Cherry was already out of mind"
					label.Visible=true
					nxt.Visible = true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="She might have gone really mad !"
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
					
				elseif inp.KeyCode ==Enum.KeyCode.Two then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible = false
					frame2.Visible = false
					frame3.Visible = false
					frame4.Visible = false
					back.Visible =false
					opWrong= opWrong+1
					
					label.Text="This must have been the wind!"
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
					
					label.Text = "This must have been fluoride toothpaste and acidic detergent!"
					label.Visible = true
					nxt.Visible= true
					press = false
					while press == false do
						local ipu =UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text = "They can cause cause harmful chemical reacti.."
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text = "Oh no! this is not a acidic detergent, I've gone mad!"
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
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
					
					label.Text = "This is chlorine bleach and acidic detergent!!"
					label.Visible = true
					nxt.Visible =true
					press = false
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="This cause a harmful chemical reac..."
					press=false
					while press == false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="Oh,wait..no this is not chlorine bleach!"
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text ="I've really gone mad!!"
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
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
			
			label.Text ="I am missing something...."
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
			q.Text="Am I missing something?"
			QFrame.Visible = true
			op1.Text = "1.My mind is just messing with me!"
			frame1.Visible = true
			op2.Text = "2.Cherry didn't had and merch of this band!"
			frame2.Visible = true
			op3.Text = "3.The 'E' of 'AMAZE' !" 
			frame3.Visible = true
			op4.Text = "4.The poster is old!"
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
					
					label.Text = "What happened to my mind!"
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
					
					label.Text= "I didn't see any merch of this band belonging to Cherry!"
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
					
					label.Text ="The 'E' from the word 'AMAZÉ' is wrong!"
					label.Visible=true
					nxt.Visible=true
					press=true
					while press==false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Text ="The dash above the accented 'E' is missing!"
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
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
					
					label.Text="The poster should be new but its old!"
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
			
			label.Text ="Why is Colon partially filled?"
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
			op1.Text = "This colon used to remove fingerprint"
			frame1.Visible = true
			op2.Visible = "This colon was used to remove blood stains!"
			frame2.Visible = true
			op3.Text = "This colon was used to drug Cherry"
			frame3.Visible = true
			op4.Text = "The colon was used to freshen the air"
			frame4.Visible = true
			q.Text = "Why is colon partially filled?"
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
					
					label.Text="The culprit must have used the colon.."
					
					label.Visible = true
					nxt.Visible =true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Text ="..to remove their fingerprints from the scene!"
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
					
				elseif inp.KeyCode ==Enum.KeyCode.Two then
					Options.Enabled = false
					QFrame.Visible = false
					frame1.Visible =false
					frame2.Visible =false
					frame3.Visible =false
					frame4.Visible =false
					back.Visible =false
					opWrong = opWrong+1
					
					label.Text="The culprit might have used the colon to remove the bloodstains!"
					label.Visible = true
					nxt.Visible = true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode==Enum.KeyCode.F then
							press=true
						end
					end
					label.Text = "As water would not have worked properly!"
					press= false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press= true
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
					
					label.Text = "The culprit must have used the colon to drug Sherry!"
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
					
					label.Text="The colon must have been used by the culprit..."
					label.Visible = true
					nxt.Visible =true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press = true
						end
					end
					label.Text = "...to freshen the air disguise any odor!"
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
			
			label.Text = "Why is this juice so yellow?"
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
			op1.Text = "Some substances were mixed in it"
			frame1.Visible = true
			op2.Text = "Its not a juice"
			frame2.Visible =true
			op3.Text  = "Food color was mixed"
			frame3.Visible = true
			op4.Text = "The juice is stale"
			frame4.Visible =true
			q.Text = "Why is the juice so yellow?"
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
					
					label.Text = "This juice is surely altered by something!"
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
					
					label.Text = "The doesnt looks like a juice at all"
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
					
					label.Text = "This color might come from food colourings"
					label.Visible=true
					nxt.Visible=true
					press=false
					while press==false do
						local ipu=UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
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
					
					label.Text="The juice might be stale"
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
				
			label.Text = "Why is this blanket rumpled?"
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
			op1.Text = "Someone might have slept here"
			frame1.Visible =true
			op2.Text = "This was used to strangle Cherry!"
			frame2.Visible = true
			op3.Text = "The blanket was probably used to clean the blood stains!"
			frame3.Visible =true
			op4.Text = "The blanket was used to cover the body!"
			frame4.Visible =true
			q.Text = "Why is the blanket rumpled?"
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
					
					--[[
					label.Text = ""
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
					nxt.Visible =false]]
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
					--[[
					label.Text ="<2nd optionline>"
					label.Visible=true
					nxt.Visible=true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible = false]]
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
					--[[
					label.Text = "<3rd option line>"
					label.Visible = true
					nxt.Visible=true
					press = false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible=false
					nxt.Visible = false]]
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
					--[[
					label.Text="<4th option line>"
					label.Visible=true
					nxt.Visible = true
					press=false
					while press == false do
						local ipu = UserIS.InputBegan:Wait()
						if ipu.KeyCode == Enum.KeyCode.F then
							press=true
						end
					end
					label.Visible = false
					nxt.Visible = false]]
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
			objF.Visible = false
			EndPrompt.Enabled = false
			Options.Enabled = false
			Ending.Enabled = true
			
			if opCorrect == 0 and opStry==0 and opWrong==0 then
				EndLabel.Text = " You provided the police NO evidence which left them more confused and the culprit ESCAPED! "
				EndFrame.Visible = true
				
			elseif opCorrect == 5 and opStry==2 and opWrong==0 then
				EndLabel.Text = "You were perfect with your deductions..."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "We got to know it was Sherry who killed her own sister!"
				press=false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "The story begins recently when Sherry got to know Cherry was going to get married!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "Sherry was happy when she heard about this but..."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = " Sherry got to know that Cherry's fiancé was actually Sherry's crush!!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text="Sherry got angry not at only this fact rather she was always irritated by her sister because..."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text ="...Cherry,from childhood, copied whatever Sherry did!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "Cherry wore the dress that Sherry wore, bought the cup that Sherry used!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "All that Sherry liked , Cherry liked too"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "Sherry was not angry at first but when days passed but this behaviour didn't change...Sherry started getting irritated."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text ="This irritation grew into anger ... and when Sherry got to know that..."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				EndLabel.Text = "Cherry was going to marry HER(Sherry's) crush..."
				local te = EndLabel.Text
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " Sherry couldn't hold back the anger "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " Sherry started planning a conspiracy against her own sister "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= " Sherry planned to kill Cherry using a very unique technique "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " Sherry had a great knowledge in chemistry... she knew that mixing chlorine bleach and acidic detergent causes a chemical reaction which releases chlorine "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" That chlorine can easily do in a person "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = "She drugged Cherry with some sleeping pills and then dragged her to the bathroom "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" She sat Cherry down in one corner and then mixed the chlorine bleach and acidic detergent "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " After some time she thought Cherry was dead... but her heart was still beating! "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= "  Then she realised it was not chlorine bleach but it was normal bleach that Cherry brought from market"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te =" She was in complete confusion what to do next so she thought to kill he by cutting her hand "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" ...which would still look like a suicide! Nobody would have questioned "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " She then took Cherry's hand and made deep cuts with a knife "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="After Sherry confirmed Cherry was dead ...  she started finishing things up by DEFINING it as a suicide "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= " She took the tape(with gloves) that Cherry kept ready on her dressing table to pack stuff as she was shifting! "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="  This way the tapes had the finger-print of Cherry ..."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" ...Sherry took those peices tape and taped it to the bathroom's glass door from inside"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" Thus when the door is closed ..it gave an illusion that the door was taped shut from inside which wasn't taped to the wall and frame in reality the tapes were only taped to the door "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" Then Sherry sneaked out of the house and came to to the cafe where i met her where she also got a perfect opportunity to make me a witness "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="Another trick that Sherry used to manipulate that the door was closed was by locking the door from outside when we were pushing to break into "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" This made me feel that the door was locked from inside and when she open the lock at a sudden ... it felt like we broke the lock! "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" But a culprit can never leave a crime scene without some trail "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" The first evidence was the small peice of tape on the dressing table that Sherry might have overlooked "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" That small peice of tape gave us a big hint "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" Another big hint was the door lock not being damaged letting us figure out the trick with it "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" The cuts on the hand were also very aggresive which is very unatural even for a mentally disabled person as human have tendency to fear when they are hurting themself "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " The Blood spot on the door proved us that this wasnt a suicide and was done by a outsider "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = " but all of this didn't proved Sherry as the culprit... it just pointed as it was a murder"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" The only evidence that debunked all of this was , unexpectedly an 'É' or better as only 'E' !"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= "The band 'AMAZÉ' has a 'É' not a normal 'E ' "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = "Something was tickling my mind but when I saw the poster I realised it! "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= " It was Sherry's headband ... it had 'AMAZE' not 'AMAZÉ' "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= "Most of us will be confused here but if we noticed that the background color of the headband was blood red "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="An official merch can't have a mistake... the missing dash above the 'E' was never missing "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="It was hiding from us because of a blood mark which camoflauged with the background red color of headband !"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="When Sherry cut Cherry's hand , blood had sprayed out ... then Sherry must have changed clothes but she did'nt change the headband"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="Most probablly beacuse she didn't notice any blood mark over it which camo-ed with the background!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" These factors revealed that Sherry was the culprit !"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" After Sherry realised that she couldn't escape anymore ...she said us why she killed her sister "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="Then we revealed to Sherry that we had a talk with Cherry's fiance and we got to know that..."
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="...it was never Cherry who wanted to marry him ...it was the fiance who first proposed her!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" Also, little did she knew that Cherry knew about Sherry's plan!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="She just acted along with Sherry because she wanted to keep Sherry happy even if she gets killed "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" We got to know about this throught the paper I got... "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="It was actually the reciept of the shop from where Cherry brought the bleach and detergent"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" When we went back to the shop and asked about some details ... "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="The shop owner answered that he heard Cherry murmuring to herself "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te="Cherry was saying to herself :'I don't want to kill my sister with this' while holding the chlorine bleach"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te= " This maped out that Cherry knew Sherry was going to kill her "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" But the saddest part is that Cherry knew that if Sherry used the chlorine bleach reaction to kill her...Sherry would herself get killed too!!"
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te =" Thats why she was murmuring to herself all that and brought chlorine free bleach even though she was told to bring chlorine bleach "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te=" After realizing to what she had done all the regrets and grief came booming out of Sherry but there wasn't a way to bring a dead one back! "
				press = false
				while press == false do
					local inp = UserIS.InputBegan:Wait()
					if inp.KeyCode == Enum.KeyCode.F then
						press = true
					end
				end
				te = "When people don't want the best for you, they are not the best for you.   - <i> GAYLE KING </i>"

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