-- Define the Roblox Services we need
local Players = game:GetService("Players")

-- Get the Local Player (the player running this script)
local LocalPlayer = Players.LocalPlayer

-- Define the destination coordinates (X, Y, Z)
-- You must replace the numbers (0, 10, 0) with the actual coordinates of your base.
-- Adding a small height (like 10 or 20 for Y) is recommended so the player doesn't spawn *inside* the ground.
local BASE_COORDINATES = Vector3.new(0, 50, 0) -- X=0, Y=50, Z=0

-- Define the CFrame (Coordinate Frame) for the teleportation
-- A CFrame is generally better than a Vector3 for teleporting as it includes position and orientation.
-- We use the coordinates and add an offset of 3 studs in the Y-axis to prevent the player from getting stuck in the floor.
local TARGET_CFRAME = CFrame.new(BASE_COORDINATES) * CFrame.new(0, 3, 0)

-- Function to handle the teleport
local function TeleportPlayer()
    -- Wait for the player's character to load (in case they just spawned)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    
    -- Find the HumanoidRootPart, which controls the character's position
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    
    if HumanoidRootPart then
        -- Use PivotTo (or CFrame assignment) to instantly move the character
        Character:PivotTo(TARGET_CFRAME)
        
        -- Alternatively, you can directly set the CFrame of the HumanoidRootPart:
        -- HumanoidRootPart.CFrame = TARGET_CFRAME
        
        print("Player " .. LocalPlayer.Name .. " teleported to base at: " .. tostring(BASE_COORDINATES))
    else
        warn("Character or HumanoidRootPart not found for teleport!")
    end
end

-- Example of how to call the function (e.g., when a button is clicked, or a command is entered)
-- For demonstration, we'll just call it immediately.
TeleportPlayer()
