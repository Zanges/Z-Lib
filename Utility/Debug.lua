local lib = LibStub:NewLibrary("Z-Lib_Debug-1.0", 1)


local debugging = 1


--- Simple Debug function.
---@param text string @ Debug Msg
function lib:Debug(text)
    if debugging == 1 then
        print(text)
    end
end

--- Prints a given Table
--- @param table table @ The Table to print
function lib:DebugTable(table)
    if debugging == 1 then
        for i, text in pairs(table) do
            print(text)
        end
    end
end

--- Prints a given Table and nested Tables
--- @param table table @ The Table to print
function lib:DebugTableRecursive(table)
    if debugging == 1 then
        for i, v in pairs(table) do
            if type(v) == "table" then
                lib:DebugTableRecursive(v)
            else
                print(v)
            end
        end
    end
end


--- A Helper Value for lib:DebugTableRecursiveFormatted(table)
local depth = 0

--- Prints a given Table with nested Tables indented
--- @param table table @ The Table to print
function lib:DebugTableRecursiveFormatted(table)
    if debugging == 1 then
        for k, v in pairs(table) do
            if type(v) == "table" then
                depth = depth + 1
                lib:DebugTableRecursiveFormatted(v)
                depth = depth - 1
            else
                local spacerTemplate =  "   "
                local spacer = ""
                for i = 0, depth do
                    spacer = spacer .. spacerTemplate
                end

                if type(v) == "function" then
                    v = "function"
                elseif type(v) == "boolean" then
                    if v then
                        v = "true"
                    else
                        v = "false"
                    end
                elseif type(v) == "nil" then
                    v = "nil"
                end

                print(spacer .. k .. " : " .. v)
            end
        end
    end
end

function lib:PrintChildList(Frame)
    if debugging == 1 then
        RunScript("local x = {"..Frame..":GetChildren()}")
        for _, child in ipairs(x) do
            Debug(child:GetName())
        end
    end
end

return lib