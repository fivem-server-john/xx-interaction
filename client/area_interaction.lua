function AreaInteraction(identifier, key, labels, points, heightInterval, onClickEvent, additionalData)
    local self = {}
    
    if type(points) ~= "table" then
        print("ERROR: Tried to create an area-interaction with an invalid points. Points must be an array. Identifier: " .. identifier)
        return false
    end

    additionalData = additionalData or {}

    self.baseInteraction = BaseInteraction(identifier, key, labels)

    self.points = points
    self.heightInterval = heightInterval
    self.priority = additionalData.priority or 0

    self.onClickEvent = onClickEvent

    self.zone = nil
    self.inZone = false

    self.CreateZone = function()
        local polyZone = PolyZone:Create(self.points, {
            name = self.baseInteraction.identifier,
            minZ = self.heightInterval[1],
            maxZ = self.heightInterval[2],
            debugGrid = false,
            gridDivisions = 25
        })
        self.zone = polyZone

        self.BindZoneEvents()
    end

    self.BindZoneEvents = function()
        self.zone:onPointInOut(self.baseInteraction.identifier, function(isPointInside, point)
            if isPointInside then
                self.PlayerEnteredArea()
            else
                self.PlayerLeftArea()
            end
        end)
    end 

    self.PlayerEnteredArea = function()
        self.inZone = true
    end

    self.PlayerLeftArea = function()
        self.inZone = false
    end

    return self
end