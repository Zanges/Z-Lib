local Lib = LibStub:NewLibrary("Z-Lib_MathHelper-1.0", 1)


--- Calculates the Power of a Vector
--- @param Vector table  @ "2D Vector" with keys x, y
function Lib:VectorPower(Vector)
    return math.sqrt((Vector['x']^2) + (Vector['y']^2))
end

--- Calculates the Dot-Product of two Vectors
--- @param Vector1 table  @ "2D Vector" 1 with keys x, y
--- @param Vector2 table  @ "2D Vector" 2 with keys x, y
function Lib:DotProduct(Vector1, Vector2)
    return (Vector1['x'] * Vector2['x']) + (Vector1['y'] * Vector2['y'])
end

--- Calculates the Angle between two Vectors in Degrees
--- @param Vector1 table  @ "2D Vector" 1 with keys x, y
--- @param Vector2 table  @ "2D Vector" 2 with keys x, y
function Lib:VectorAngle(Vector1, Vector2)
    return math.deg(math.acos(Lib:DotProduct(Vector1, Vector2) / (Lib:VectorPower(Vector1) * Lib:VectorPower(Vector2))))
end

--- Calculates the Direction of a Vector in Radian
--- @param Vector table  @ "2D Vector" with keys x, y
function Lib:VectorDirection(Vector)
    return math.atan2(Vector['x'], Vector['y'])
end

--- Calculates the Direction of a Vector in Degrees
--- @param Vector table  @ "2D Vector" with keys x, y
function Lib:VectorDirectionDeg(Vector)
    return math.deg(Lib:VectorDirection(Vector))
end

--- Calculates the Difference of Vector2 - Vector1
--- @param Vector1 table  @ "2D Vector" 1 with keys x, y
--- @param Vector2 table  @ "2D Vector" 2 with keys x, y
function Lib:VectorDifference(Vector1, Vector2)
    return {
        ['x'] = Vector2['x'] - Vector1['x'],
        ['y'] = Vector2['y'] - Vector1['y']
    }
end

--- Calculates the Direction of the Difference of Vector2 - Vector1 in Radian
--- @param Vector1 table  @ "2D Vector" 1 with keys x, y
--- @param Vector2 table  @ "2D Vector" 2 with keys x, y
function Lib:VectorDirectionDifference(Vector1, Vector2)
    local Vector = Lib:VectorDifference(Vector1, Vector2)
    return Lib:VectorDirection(Vector)
end

--- Calculates the Direction of the Difference of Vector2 - Vector1 in Degrees
--- @param Vector1 table  @ "2D Vector" 1 with keys x, y
--- @param Vector2 table  @ "2D Vector" 2 with keys x, y
function Lib:VectorDirectionDifferenceDeg(Vector1, Vector2)
    return math.deg(Lib:VectorDirectionDifference(Vector1, Vector2))
end