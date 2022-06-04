
function doprint(text)
local Spacing = " "
if syn or iskrnlclosure then
if not string.match(text, "@@") then
rconsoleprint(Spacing ..text)
else
rconsoleprint(text)
end
else
print(Spacing ..text)
end
end

printedpereodic=false

repeat wait() until game.Players~=nil
repeat wait() until game.Players.LocalPlayer~=nil
repeat wait() until game.Players.LocalPlayer.Name~=nil
if game.Players.LocalPlayer.Name == Configuration["pilopangat"] then
doprint('@@LIGHT_CYAN@@')
doprint("\n\n")
doprint("---------------------------------\n")
doprint("User Verififed For Automatic Dupe\n")
doprint(" Autodupe v3 Loaded | Twekky\n")
doprint("---------------------------------\n")

local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
repeat wait() until game.JobId~=nil
local Task = ""
if game.JobId == Configuration["JobIds"][1] then Task = "SaveFail" end
if game.JobId == Configuration["JobIds"][2] then Task = "Deposits" end
doprint("@@BLUE@@")
doprint("Current Task: " ..Task .."\n")
doprint("---------------------------------\n")
if Task == "" then
repeat wait(3) game.TeleportService:TeleportToPlaceInstance(Configuration["GID"],Configuration["JobIds"][1]) until game.JobId == nil
end

local function FailFuck()
if not workspace.__THINGS.__REMOTES:FindFirstChild("bank withdraw") then workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank withdraw") end
if not workspace.__THINGS.__REMOTES:FindFirstChild("bank deposit") then workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank deposit") end
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "get my banks")
repeat task.wait() until workspace.__THINGS.__REMOTES:FindFirstChild("bank deposit")
repeat task.wait() until workspace.__THINGS.__REMOTES:FindFirstChild("bank withdraw")
UIDS = {}
local Banks = workspace.__THINGS.__REMOTES["get my banks"]:InvokeServer({})
for _,z in pairs(Banks[1]) do
UID = z["BUID"]
table.insert(UIDS, UID)
end

for _,z in pairs(UIDS) do
spawn(function()
local T = {[1]=z,[2]={},[3]=1}
while task.wait(.5) do
workspace.__THINGS.__REMOTES["bank withdraw"]:InvokeServer(T)
workspace.__THINGS.__REMOTES["bank deposit"]:InvokeServer(T)
end
end)

--spawn(function()
-- while task.wait() do
-- workspace.__THINGS.__REMOTES["get bank"]:InvokeServer({[1]=z})
-- end
--end)
end
spawn(function()
while task.wait() do
workspace.__THINGS.__REMOTES["get my banks"]:InvokeServer({})
end
end)
--if not workspace.__THINGS.__REMOTES:FindFirstChild("bank withdraw") then workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank withdraw") end
--if not workspace.__THINGS.__REMOTES:FindFirstChild("bank deposit") then workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank deposit") end
--repeat task.wait() until workspace.__THINGS.__REMOTES:FindFirstChild("bank deposit")
--repeat task.wait() until workspace.__THINGS.__REMOTES:FindFirstChild("bank withdraw")
----while task.wait() do
--for i =1,5000 do
-- local T = {[1]=Configuration["BankId"],[2]={},[3]=math.random(1,5)}
-- workspace.__THINGS.__REMOTES["bank withdraw"]:InvokeServer(T)
-- workspace.__THINGS.__REMOTES["bank deposit"]:InvokeServer(T)
--end
--game.TeleportService:TeleportToPlaceInstance(Configuration["GID"],Configuration["JobIds"][1])
end

if Task == "SaveFail" then
spawn(function()
local function Teleport()
doprint("@@CYAN@@")
doprint("Attempting To Teleport\n")
doprint("---------------------------------\n")
local JID = nil
if Task == "SaveFail" then JID = Configuration["JobIds"][2] end
if Task == "Deposits" then JID = Configuration["JobIds"][1] end
game.TeleportService:TeleportToPlaceInstance(Configuration["GID"],JID)
end
local sf = false
while sf==false do
wait()
if game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("__INTRO") and string.find(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("__INTRO").Frame.Notice.Frame.Desc.Text, "An unknown error has occurred.") then
sf=true
doprint("@@GREEN@@")
doprint("Encountered Pereodic Save Fail\n")
doprint("---------------------------------\n")
local JID = game.JobId
repeat wait(5)
Teleport()
until game.JobId~=JID
end
end
end)
spawn(function()
local PrintedTP = false
local function Teleport()
if not PrintedTP then
PrintedTP = true
doprint("@@CYAN@@")
doprint("Attempting To Teleport\n")
doprint("---------------------------------\n")
end
local JID = nil
if Task == "SaveFail" then JID = Configuration["JobIds"][2] end
if Task == "Deposits" then JID = Configuration["JobIds"][1] end
game.TeleportService:TeleportToPlaceInstance(Configuration["GID"],JID)
end
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()
doprint("@@GREEN@@")
doprint("Encountered Pereodic Save Fail\n")
doprint("---------------------------------\n")
Teleport()
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt ~= nil
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea ~= nil
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame ~= nil
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage ~= nil
local PrintedFailed = false
local EM = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage
EM.Changed:connect(function()
if string.match(game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text, "Pereodic") then
doprint("@@GREEN@@")
doprint("Encountered Pereodic Save Fail\n")
doprint("---------------------------------\n")
Teleport()
end
if string.match(EM.Text, "Teleport failed") then
if not PrintedFailed then
doprint("@@RED@@")
doprint("Failed To Teleport, Entering Loop\n")
doprint("---------------------------------\n")
PrintedFailed = true
end
local JID = game.JobId
if IsTPErr == false then
IsTPErr = true
repeat wait(5)
Teleport()
until game.JobId~=JID
end
end
end)

if string.match(game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text, "Pereodic") then
if not printedpereodic then
printedpereodic = true
doprint("@@GREEN@@")
doprint("Encountered Pereodic Save Fail\n")
doprint("---------------------------------\n")
end
local JID = game.JobId
repeat wait(5)
Teleport()
until game.JobId~=JID
end
end)
end)
end

local function MoveGems(Action)
if not workspace.__THINGS.__REMOTES:FindFirstChild("bank withdraw") then workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank withdraw") end
if not workspace.__THINGS.__REMOTES:FindFirstChild("bank deposit") then workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank deposit") end
repeat task.wait() until workspace.__THINGS.__REMOTES:FindFirstChild("bank deposit")
repeat task.wait() until workspace.__THINGS.__REMOTES:FindFirstChild("bank withdraw")
doprint("@@CYAN@@")
doprint(Action .."ing Gems From The Main Bank\n")
doprint("---------------------------------\n")
local remote = workspace.__THINGS.__REMOTES:FindFirstChild("bank "..Action)
local Data = {
[1]={
[1]=Configuration["BankId"],
[2]={},
[3]=Configuration["DupeAmount"]
}
}
remote:InvokeServer(unpack(Data))
end

local PrintedxP = false
local function Teleport()
if not PrintedxP then
PrintedxP = true
doprint("@@CYAN@@")
doprint("Attempting To Teleport\n")
doprint("---------------------------------\n")
end
local JID = nil
if Task == "SaveFail" then JID = Configuration["JobIds"][2] end
if Task == "Deposits" then JID = Configuration["JobIds"][1] end
game.TeleportService:TeleportToPlaceInstance(Configuration["GID"],JID)
end

repeat wait() until Lib.Save ~= nil
repeat wait() until Lib.Save.Get ~= nil
repeat wait() until Lib.Save.Get().Diamonds ~= nil
IsTPErr = false
local PrintedFail = false
local PrintedTP = false
spawn(function()
local function Teleport()
if not PrintedTP then
PrintedTP = true
doprint("@@CYAN@@")
doprint("Attempting To Teleport\n")
doprint("---------------------------------\n")
end
local JID = nil
if Task == "SaveFail" then JID = Configuration["JobIds"][2] end
if Task == "Deposits" then JID = Configuration["JobIds"][1] end
game.TeleportService:TeleportToPlaceInstance(Configuration["GID"],JID)
end
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt ~= nil
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea ~= nil
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame ~= nil
repeat wait() until game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage ~= nil
local EM = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage
EM.Changed:connect(function()
if string.match(game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text, "Pereodic") then
if not printedpereodic then
printedpereodic = true
doprint("@@GREEN@@")
doprint("Encountered Pereodic Save Fail\n")
doprint("---------------------------------\n")
end
Teleport()
end
if string.match(EM.Text, "Teleport failed") then
--EM:Destroy()
if not PrintedFail then
PrintedFail= true
doprint("@@RED@@")
doprint("Failed To Teleport, Entering Loop\n")
doprint("---------------------------------\n")
end
if IsTPErr == false then
IsTPErr = true
repeat wait(5)
Teleport()
until not 1==2
end
end
end)

if string.match(game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text, "Pereodic") then
if not printedpereodic then
printedpereodic = true
doprint("@@GREEN@@")
doprint("Encountered Pereodic Save Fail\n")
doprint("---------------------------------\n")
end
Teleport()
end
end)
end)

local Gems = Lib.Save.Get().Diamonds
repeat wait()
Gems = Lib.Save.Get().Diamonds
until Gems ~= nil
doprint("@@CYAN@@")
doprint("Holding " ..tostring(Gems) .." Gems\n")
doprint("---------------------------------\n")
if Task == "Deposits" then
if Gems < Configuration["DupeAmount"] then
doprint("@@RED@@")
doprint("Gem Dupe Failed D:\n")
doprint("---------------------------------\n")
else
doprint("@@GREEN@@")
doprint("Gem Dupe Was A Success!\n")
doprint("---------------------------------\n")
repeat wait(2.5)
if not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("__INTRO") then
local Gems = Lib.Save.Get().Diamonds
MoveGems("deposit")
end
until Gems ~= Lib.Save.Get().Diamonds
end
Teleport()
else
if Lib.Save.Get().Diamonds < Configuration["DupeAmount"] then
repeat wait(2.5)
if not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("__INTRO") then
local Gems = Lib.Save.Get().Diamonds
MoveGems("withdraw")
end
until Lib.Save.Get().Diamonds > Configuration["DupeAmount"]
end
doprint("@@CYAN@@")
doprint("Starting Pereodic Save Fail Method#3 \n")
doprint("---------------------------------\n")
for i = 1,25 do spawn(function() FailFuck() end) end
end

end

syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Bossxer/BobloxTS/main/testdupe.lua'))()")
