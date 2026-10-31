--Umm, this is js variable declerations
local repSt=game:GetService("ReplicatedStorage")
local Players =game:GetService("Players")
local showCE = repSt:WaitForChild("ShowClue")

local pl = Players.LocalPlayer
local playergui=pl:WaitForChild("PlayerGui")
local screengui=playergui:WaitForChild("ScreenGui")
local cluef = screengui:WaitForChild("ClueFrame")
local notel=screengui:WaitForChild("NoteFrame"):WaitForChild("NoteList")
local nc=0
local tcorrect=0
local twrong = 0
local allchoices = {}
local resultf = screengui:WaitForChild("ResultFrame")
local resulttext = resultf:WaitForChild("ResultText")
local nextbtn = resultf:WaitForChild("NextButton")
local closebtn = resultf:WaitForChild("CloseButton")
local curresindx=1
local timerleft=60
local timergoin = true
local timerlbl = screengui:WaitForChild("TimerLabel")
local unlockEvent =repSt:WaitForChild("UnlockSuspects")



local function showresult()
	if #allchoices==0  then
		resulttext.Text = "You didn't investigate anything!"
		return
	end
	
	local tsresult = allchoices[curresindx]
	
	
	if tsresult.correct == true then
		resulttext.Text = tsresult.text.." -Corect!"
	else
		resulttext.Text = tsresult.text.." -Wrong :( ) "..tsresult.reason
	end
end

nextbtn.MouseButton1Click:Connect(function()
	curresindx = curresindx+1
	if curresindx<= #allchoices then
		showresult()
	else
		resulttext.Text = "That's all of ur results!!!!"
	end
end)
closebtn.MouseButton1Click:Connect(function()
	resultf.Visible = false
end)

-- A placeholder data to test logic 
local testopt= 
	{
	  {
			opttext="Option A - plcholder",
			nested = nil,
			correct = false,
			reason= "placeholder reason why A is wrong",
	  },
	  {
			opttext = "Option B - plcholder",
			nested = 
			{
				{opttext = "Option B1 - plcholder", nested=nil, correct=true},
				{ opttext ="Option B2 - plcholder", nested= nil, correct=false, reason="placeholder reason why B2 is wrong"},
			}
	  },
	  
	  {
			opttext = "Option C - plcholder",
			nested= nil,
			correct=false,
			reason="placeholder reason why C is wrong",
			
	  },
	  {
			opttext = "Option D - plcholder",
			nested= nil,
			correct=false,
			reason= "placeholder reason why D is wrong",
			
	  },
	  
	}

local sus1opt=
	{
		{
			opttext="Question 1-plcholder",
			nested = nil,
			correct = false,
			reason = "placeholder reson why this is wrong",
		},
		{
			opttext = "Question 2-plcholder",
			nested = nil,
			correct = true,
		},
	}

local sus2opt=
	{
		{
			opttext="Question 1 - plcholder",
			nested = nil,
			correct = true,
		},
		{
			opttext = "Question 2 - plcholder",
			nested = nil,
			correct = false,
			reason ="placeholder reson why this is wrong",
		},
	}

--
local function showopts(optlist)
	for _, child in pairs(cluef:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
	for i, opt in ipairs(optlist) do
		local btn = Instance.new("TextButton")
		btn.Size=UDim2.new(0,300,0,50)
		btn.Position=UDim2.new(0,10,0,(i-1)*60)
		btn.Text=opt.opttext
		btn.Parent=cluef
		
		btn.MouseButton1Click:Connect(function()
			print("Player chose "..opt.opttext)
			if opt.nested ~= nil then
				--logs ts choice to notebook
				local note = Instance.new("TextLabel")
				note.Size=UDim2.new(0,300,0,40)
				note.Text = opt.opttext
				note.Position=UDim2.new(0,0,0,nc*40)
				note.TextSize = 24
				note.TextColor3 = Color3.new(0,0,0)
				note.Parent = notel
				note.TextSize = 24
				note.TextColor3 = Color3.new(0,0,0)
				nc = nc + 1
				
				for _, child in pairs(cluef:GetChildren()) do
					if child:IsA("TextButton") then
						child:Destroy()
					end
				end
				
				for j , nestdopt in ipairs(opt.nested) do
					local nstbtn= Instance.new("TextButton")
					nstbtn.Size = UDim2.new(0,300,0,50)
					nstbtn.Position= UDim2.new(0,10,0,(j-1)*60)
					nstbtn.Text = nestdopt.opttext
					nstbtn.Parent = cluef

					nstbtn.MouseButton1Click:Connect(function()
						print("Player chose "..nestdopt.opttext)
						
						--logs the nested final choice to the notebook
						local note2= Instance.new("TextLabel")
						note2.Size=UDim2.new(0,300,0,40)
						note2.Position=UDim2.new(0,0,0,nc*40)
						note2.Text = nestdopt.opttext
						note2.TextSize = 24
						note2.TextColor3 = Color3.new(0,0,0)
						note2.Parent= notel
						note.TextSize = 24
						note.TextColor3 = Color3.new(0,0,0)
						nc = nc + 1
						
						local crecord = {}
						crecord.text = nestdopt.opttext
						crecord.correct = nestdopt.correct
						crecord.reason = nestdopt.reason
						allchoices[#allchoices+1]= crecord
						
						
						cluef.Visible=false
						
						
					end)
				end
				cluef.Visible =true
			else
				--logs the final non-nested choice 
				local note3= Instance.new("TextLabel")
				note3.Size=UDim2.new(0,300,0,40)
				note3.Text = opt.opttext
				note3.Parent= notel
				note3.TextSize = 24
				note3.TextColor3 = Color3.new(0,0,0)
				nc = nc + 1
				
				local crecord = {}
				crecord.text = opt.opttext
				crecord.correct = opt.correct
				crecord.reason = opt.reason
				allchoices[#allchoices+1]= crecord
				
				
				cluef.Visible=false
			end   
		end)
	end
	cluef.Visible=true
end


local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.R then
		resultf.Visible = true
		curresindx = 1
		showresult()
	end
end)

--timerrr
task.spawn(function()
	timerlbl.Visible =true
	while timergoin == true do
		task.wait(1)
		timerleft=timerleft-1
		timerlbl.Text = "TIMER LEFT: "..timerleft
		
		if timerleft<=0 then
			timergoin = false
			timerlbl.Visible= false
			resultf.Visible =true
			curresindx = 1
			showresult()
			unlockEvent:FireServer()
		end
	end
end)

showCE.OnClientEvent:Connect(function(kind)
	resultf.Visible = false
	if kind == "scene" then
		showopts(testopt)
	elseif kind == "suspect1" then
		showopts(sus1opt)
	elseif kind == "suspect2" then
		showopts(sus2opt)
	end
end)


