function Interaction(identifier, coords, itype, data)
    local self = {}

    if type(identifier) ~= "string" then 
        print("ERROR: Tried to create an interaction with an invalid identifier. Identifier must be a string. Identifier: " .. identifier)
        return false
    end

    if type(coords) ~= "vector3" then 
        print("ERROR: Tried to create an interaction with an invalid coords. Coords must be a vector3. Identifier: " .. identifier)
        return false
    end

    if not ValueInDict(INTERACTION_TYPE, itype) then
        print("ERROR: Tried to create an interaction with an invalid type. Type must be a value from INTERACTION_TYPE. Identifier: " .. identifier)
        return false
    end

    data = data or {}
    
    self.identifier = identifier
    self.coords = coords
    self.type = itype

    self.interaction_distance = data.interaction_distance or 1.5
    self.view_distance = data.view_distance or 10.0

    return self
end

function ValueInDict(dict, value)
    for k, v in pairs(dict) do
        if v == value then
            return true
        end
    end

    return false
end

INTERACTION_TYPE = {
    E = "e",
}