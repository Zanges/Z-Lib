local Lib = LibStub:NewLibrary("Z-Lib_PositionHelper-1.0", 1)


function Lib:SetPercentualHeight(Frame, Height, RefFrame, MinAbs, Offset)
    RefFrame = RefFrame or Frame:GetParent()
    MinAbs = MinAbs or 0
    local RefHeight = RefFrame:GetHeight()
    local TargetHeight = RefHeight * Height
    TargetHeight = math.max(TargetHeight, MinAbs)
    TargetHeight = TargetHeight - (2 * Offset)
    Frame:SetHeight(TargetHeight)
end

function Lib:SetPercentualWidth(Frame, Width, RefFrame, MinAbs, Offset)
    RefFrame = RefFrame or Frame:GetParent()
    MinAbs = MinAbs or 0
    local RefWidth = RefFrame:GetWidth()
    local TargetWidth = RefWidth * Width
    TargetWidth = math.max(TargetWidth, MinAbs)
    TargetWidth = TargetWidth - (2 * Offset)
    Frame:SetWidth(TargetWidth)
end