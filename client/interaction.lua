function Interaction(identifier, coords)
    local self = {}

    self.identifier = identifier
    self.type = "e"

    self.coords = coords
    self.interaction_distance = 1.5
    self.view_distance = 10.0

    return self
end

function InteractionGroup()


end