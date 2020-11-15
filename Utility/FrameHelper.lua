---@class FrameHelper
local Lib = LibStub:NewLibrary("Z-Lib_FrameHelper-1.0", 1)


--- Calculates the Power of a Vector
--- @param Vector table  @ "2D Vector" with keys x, y
function Lib:CreateTextureFrame(Name, TexturePath, SizeX, SizeY)
    local Frame = CreateFrame("Frame", Name)

    Frame:SetSize(SizeX, SizeY)

    Frame.Texture = Frame:CreateTexture(Name .. "_Texture")
    Frame.Texture:SetAllPoints(Frame)
    Frame.Texture:SetTexture(TexturePath)

    return Frame
end