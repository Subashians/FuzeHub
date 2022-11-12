_G.toggle = true
while _G.toggle do
wait()

spawn(function()
if game:GetService("Workspace")["__MAP"].Interactive["Rank Rewards"].Pad.BillboardGui.Timer.Text == "Redeem!" then
while wait() do
local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
Library.Network.Invoke("redeem rank rewards", {})
end
end
end)
