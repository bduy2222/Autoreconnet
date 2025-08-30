-- Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Auto Rejoin
local plr = game:GetService("Players").LocalPlayer
local tp = game:GetService("TeleportService")

plr.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Failed then
        tp:Teleport(game.PlaceId,plr)
    end
end)

plr.OnKick:Connect(function()
    task.wait(3)
    tp:Teleport(game.PlaceId,plr)
end)

game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(o)
    if o.Name=="ErrorPrompt" then
        task.wait(3)
        tp:Teleport(game.PlaceId,plr)
    end
end)
