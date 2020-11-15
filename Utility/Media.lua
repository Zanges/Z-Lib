local Lib = LibStub:NewLibrary("Z-Lib_Media-1.0", 1)


local LSM = LibStub("LibSharedMedia-3.0")


LSM:Register("border", "White Square 1px", [[Interface\AddOns\Z-Lib\Assets\Textures\Border1px.tga]])
LSM:Register("statusbar", "Sleek", [[Interface\AddOns\Z-Lib\Assets\Textures\SleekTexture.tga]])
LSM:Register("background", "CircleTransparentBG", [[Interface\AddOns\Z-Lib\Assets\Textures\Circle.blp]])

Lib.CommonStyle = {}
Lib.CommonStyle.Simple = {
    bgFile = LSM:Fetch("background", "Solid"),
    edgeFile = LSM:Fetch("border", "White Square 1px"),
    tile = true,
    tileSize = 8,
    edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

function Lib:Grayscale(Gradient, Alpha)
    Alpha = Alpha or 1
    return Gradient, Gradient, Gradient, Alpha
end

function Lib:SimpleFont(Height)
    --- @type Font
    local FontObject = CreateFont("SimpleFont")
    FontObject:SetFont(LSM:Fetch("font", "Friz Quadrata TT"), Height or 14)
    FontObject:SetTextColor(Lib:Grayscale(1))
    return FontObject
end