local Lib = LibStub:NewLibrary("Z-Lib_GroupHelper-1.0", 1)

function Lib:GetGroupType()
    if UnitInRaid("player") then
        return "RAID"
    elseif UnitInParty("player") then
        return "PARTY"
    end
    return "SOLO"
end

