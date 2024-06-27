function BaseInteraction(identifier, key, labels)
    local self = {}

    if type(identifier) ~= "string" then 
        print("ERROR: Tried to create an interaction with an invalid identifier. Identifier must be a string. Identifier: " .. identifier)
        return false
    end

    if not ValueInDict(INTERACTION_KEY, key) then
        print("ERROR: Tried to create an interaction with an invalid key. Key must be a value from INTERACTION_KEY. Identifier: " .. identifier)
        return false
    end
    
    self.identifier = identifier
    self.key = key
    self.keyId = ConvertKeyToId(key)

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

function ConvertKeyToId(key)
    if key == INTERACTION_KEY.E then
        return {0, 38}    
    elseif key == INTERACTION_KEY.G then
        return {0, 47}
    else
        return {0, 38} -- Default return E
    end
end