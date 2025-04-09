-- Created By: 200Blitz
-- Version: 1.0
-- -----------------------------
local mainGame = game.Workspace:WaitForChild("Game_Main") -- Got reference to Game_Main.

-- Holds all gates and buttons
local gates =  mainGame:WaitForChild("Gates")
local buttons = mainGame:WaitForChild("Buttons")

-- Defines a function that if the player touches the button, the gate will turn green and can get gone through.
local function activateButton(button,touched)
	
	-- Sets value to True.
	touched.Value = true
	
	-- Finds gate with same name as button.
	local gate = gates:FindFirstChild(button.Name)
	
	-- Changes color of button and turns of collide.
	if button then
		button.BrickColor = BrickColor.new("Dark green")
		button.CanCollide = false
	end
	
	-- Sets color, transparency, and collide to green, 0.5, and false respectively.
	if gate then
		gate.Transparency = 0.5
		gate.CanCollide = false
		gate.BrickColor=BrickColor.new("Dark green")
	end
	
	-- Checks how long it should stay open based on number-value.
	local duration  = button:FindFirstChild("Duration")
	
	-- Reads value from Duration.
	local timer = duration.Value
	
	-- Prints out each number and subtracts 1 from timer each time.
	while timer > 0 do
		print(timer)
		task.wait(1)
		timer = timer - 1
	end
	
	-- Sets button color, material, and collide to normal alongside gate. Also sets touched value to False.
	button.BrickColor = BrickColor.new("Really red")
	button.Material = Enum.Material.Neon
	button.CanCollide = true
	
	gate.Transparency = 0
	gate.CanCollide = true
	
	touched.Value = false
	
end

-- This checks if the button is being touched through a loop. If touched, it will call the function.
for _, button in pairs(buttons:GetChildren()) do
	button.Touched:Connect(function(otherPart)
		local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		local touched = button:FindFirstChild("Touched")
		
		if humanoid and touched and touched.Value == false then
			activateButton(button, touched)
			
		end
		
	end)  
end