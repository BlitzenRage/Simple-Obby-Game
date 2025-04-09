-- Created By: 200Blitz
-- Version: 1.0
-- -----------------------------
-- If a player joins, this sets up a leaderboard for them.
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	-- Creates new stat called coins.
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats
	
end)

-- Got reference to Game_Main and Coins.
local mainGame = game.Workspace:WaitForChild("Game_Main")
local coins = mainGame:WaitForChild("Coins")

-- Loops through all coins and checks if they have been touched. If they are, it adds a value to stats and is able to be picked up again after 5 seconds.
for _, coin in  pairs(coins:GetChildren()) do
	coin.Touched:Connect(function(otherPart)
		local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
		local touched = coin:FindFirstChild("Touched")
		
		if humanoid and player and touched and touched.Value == false then
				touched.Value = true
				
				player.leaderstats.Coins.Value += 1
				
				coin.Transparency = 0.75
				coin.CanCollide = false
				task.wait(5)
				
				coin.Transparency = 0
				coin.CanCollide = true
				touched.Value = false
			end
		end)
	end
