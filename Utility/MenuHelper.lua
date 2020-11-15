---@class MenuHelper
local Lib = LibStub:NewLibrary("Z-Lib_MenuHelper-1.0", 1)


function Lib:CreateMenu(menuName)
    ---@class Menu : Frame
    local menu = CreateFrame()

    menu:SetBackdrop(Media.CommonStyle.Simple)

    menu:SetBackdropBorderColor(Media:Grayscale(0.4))
    menu:SetBackdropColor(Media:Grayscale(0.15))

    -- VARIABLES
    menu.buttons = {}
    menu.grow = "DOWN" -- possible = "DOWN" "UP" "RIGHT" "LEFT"

    -- FUNCTIONS
    function menu:addButtonInsecure(name, label, index, clickFunction, messageInCombat)
        ---@type Button
        local button = CreateFrame("BUTTON", name, self)

        tinsert(self.buttons, index, button)

        button:SetText(label)

        button:SetScript("OnClick", function()
            LibStub("Z-Lib_CombatLockdownHelper-1.0"):ExecuteSave(name, messageInCombat, clickFunction)
        end)
        button:RegisterForClicks("AnyUp")
    end
end