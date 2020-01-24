local Lib = LibStub:NewLibrary("Z-Lib_AceHelper-1.0", 1)


--- Helper Function to switch Modules On/Off based of State
--- @param AddonObj table  @ Addon Object
--- @param ModuleName string @ Module Name
--- @param State boolean @ True if On
function Lib:ToggleModule(AddonObj, ModuleName, State)
    if State then
        AddonObj:EnableModule(ModuleName)
    else
        AddonObj:DisableModule(ModuleName)
    end
end