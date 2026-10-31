task.wait(3)

local Players = game:GetService("Players")

local pl = Players.LocalPlayer

local ch = pl.Character
if ch == nil then
	ch = pl.CharacterAdded:Wait()
end

local hum = ch:WaitForChild("Humanoid")
local animator = hum:WaitForChild("Animator")

hum.WalkSpeed = 0
hum.JumpPower = 0

local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://105258240133757"

local animTrack = animator:LoadAnimation(anim)
print("Animation length: "..animTrack.Length)
animTrack.Priority = Enum.AnimationPriority.Action4
animTrack:Play()

task.wait(0.6)

hum.WalkSpeed = 16
hum.JumpPower = 50