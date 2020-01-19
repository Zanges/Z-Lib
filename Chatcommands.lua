local AddonName, AddonTable = ...
local Chatcommands = ZLib:NewModule("Chatcommands", "AceConsole-3.0")


function Chatcommands:OnEnable()
    Chatcommands:RegisterChatCommand("rl", function() ReloadUI() end)
end

function Chatcommands:OnDisable()
    Chatcommands:UnregisterChatCommand("rl")
end

