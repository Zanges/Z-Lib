---@class GeometryHelper
local Lib = LibStub:NewLibrary("Z-Lib_GeometryHelper-1.0", 1)


---@type FrameHelper
local FrameHelper = LibStub:GetLibrary("Z-Lib_FrameHelper-1.0")

local LSM = LibStub("LibSharedMedia-3.0")



function Lib:DrawCircle(Name, SizeX, SizeY)
    local Frame = FrameHelper:CreateTextureFrame(Name, LSM:Fetch("background", "CircleTransparentBG"), SizeX, SizeY)
    Frame.Texture:SetBlendMode("BLEND")
    return Frame
end