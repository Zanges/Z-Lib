local Lib = LibStub:NewLibrary("Z-Lib_CombatLockdownHelper-1.0", 1)


local ExecuteAfterLockdownTimer
--- @type table
local ExecuteAfterLockdownRunList = {}

function Lib:ExecuteSave(ID, Message, FunctionToRun, ...)
    if InCombatLockdown() then
        Lib:ExecuteAfterLockdown(ID, Message, FunctionToRun, ...)
    else
        FunctionToRun(...)
    end
end

function Lib:ExecuteAfterLockdown(ID, Message, FunctionToRun, ...)
    if not ExecuteAfterLockdownTimer or ExecuteAfterLockdownTimer.cancelled then
        ExecuteAfterLockdownTimer = ZLib:ScheduleRepeatingTimer(Lib.ExecuteAfterLockdownTimerElapsed, 0.25)
    end

    if ExecuteAfterLockdownRunList[ID] then
        -- Cancel
        ExecuteAfterLockdownRunList[ID] = nil
        if Message ~= nil then
            print(Message .. " Canceled") -- TODO Maybe add LibSink
        end
    else
        -- Dispatch
        local FunctionAndParameter = {
            Function = FunctionToRun,
            Parameter = ...
        }
        ExecuteAfterLockdownRunList[ID] = FunctionAndParameter
        if Message ~= nil then
            print(Message .. " after Combat") -- TODO Maybe add LibSink
        end
    end

end

Lib.ExecuteAfterLockdownTimerElapsed = function()
    if not InCombatLockdown() then
        ZLib:CancelTimer(ExecuteAfterLockdownTimer)
        LibStub("Z-Lib_Debug-1.0"):Debug("Handling after Combat Queue...") -- TODO Maybe add LibSink
        for ID, FunctionAndParameter in pairs(ExecuteAfterLockdownRunList) do
            if FunctionAndParameter then
                FunctionAndParameter.Function(FunctionAndParameter.Parameter)
                ExecuteAfterLockdownRunList[ID] = nil
            end
        end
        LibStub("Z-Lib_Debug-1.0"):Debug("Done!") -- TODO Maybe add LibSink
    end
end

local AlterWhileInCombatTimer
--- @type table
local EnterCombatRunList = {}
--- @type table
local LeaveCombatRunList = {}
--- @type boolean
local WasInCombat = false

function Lib:AlterWhileInCombat(ID, EnterCombatFunction, LeaveCombatFunction)
    if not AlterWhileInCombatTimer or AlterWhileInCombatTimer.cancelled then
        AlterWhileInCombatTimer = ZLib:ScheduleRepeatingTimer(Lib.AlterWhileInCombatTimerElapsed, 0.25)
    end

    EnterCombatRunList[ID] = EnterCombatFunction
    LeaveCombatRunList[ID] = LeaveCombatFunction
end

function Lib:RemoveFromAlterWhileInCombat(ID)
    EnterCombatRunList[ID] = nil
    LeaveCombatRunList[ID] = nil

    if #(EnterCombatRunList) == 0 then
        print("empty")
        ZLib:CancelTimer(AlterWhileInCombatTimer)
    end
end

Lib.AlterWhileInCombatTimerElapsed = function()
    if InCombatLockdown() and not WasInCombat then
        WasInCombat = true

        for _, Function in pairs(EnterCombatRunList) do
            Function()
        end
    elseif not InCombatLockdown() and WasInCombat then
        WasInCombat = false

        for _, Function in pairs(LeaveCombatRunList) do
            Function()
        end
    end
end