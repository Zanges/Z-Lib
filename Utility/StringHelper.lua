local Lib = LibStub:NewLibrary("Z-Lib_StringHelper-1.0", 1)


function Lib:Split (inputstr, sep)  --  from: https://stackoverflow.com/questions/1426954/split-string-in-lua
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end