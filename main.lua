local toolSpawn = {game:GetService("Workspace").Levels.Level22.Bombispenser, game:GetService("Workspace").Levels.Level21.RocketLauncherDispenser, game:GetService("Workspace").Levels.Level23.SlingShotDispenser}
local keybind = Enum.KeyCode.T

function getTools()
    for _, v in pairs(toolSpawn) do
        for _, j in pairs(v:GetChildren()) do
            if v:IsA("Tool") then
                repeat wait() until v:FindFirstChild("Handle")
                repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
                v:FindFirstChild("Handle").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

function waitTools()
    for _, v in pairs(toolSpawn) do
        v.ChildAdded:Connect(function(child) 
            if child:IsA("Tool") then
                repeat wait() until child:FindFirstChild("Handle")
                repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
                child:FindFirstChild("Handle").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
             end
        end)
    end
end

waitTools()
getTools()

game:GetService("UserInputService").InputBegan:Connect(function(InputObject, GameProcessedEvent)
    if GameProcessedEvent then return end
    if InputObject.KeyCode == keybind then
        getTools()
    end
end)
--gig
