function PostionalInteraction(identifier, key, label, coords , data)
    local self = {}

    if type(coords) ~= "vector3" then 
        print("ERROR: Tried to create an interaction with an invalid coords. Coords must be a vector3. Identifier: " .. identifier)
        return false
    end

    self.baseInteraction = BaseInteraction(identifier, key, label)

    data = data or {}

    self.interaction_distance = data.interaction_distance or 1.5
    self.view_distance = data.view_distance or 10.0

    return self
end