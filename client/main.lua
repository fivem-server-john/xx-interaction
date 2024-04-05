local width = 0.02
local height = width * GetAspectRatio(false)

local interactions = {}
local iconsToDraw = {}

-- Draw thread
Citizen.CreateThread(function()
    InitIcons()
    
    while (true) do
        Citizen.Wait(1)

        if not next(iconsToDraw) then 
            Citizen.Wait(500)
        end

        for k, v in ipairs(iconsToDraw) do
            SetDrawOrigin(v.coords.x, v.coords.y, v.coords.z + 0.5)
            DrawSprite(v.type .. "-interaction-icon", v.type, 0, 0, width, height, 0, 255, 255, 255,150)
            
        end

    end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)
        local drawIcons = {}
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, v in ipairs(interactions) do
            local distance = #(v.coords - playerCoords)
            if distance < v.view_distance then
                table.insert(drawIcons, v)
            end
        end

        iconsToDraw = drawIcons
    end

end)

function InitIcons() 
    for k,v in pairs(Config.Icons) do
        local txdName = k .. "-interaction-icon"
        local txd = CreateRuntimeTxd(txdName)
        local textureName = k
        local texture = CreateRuntimeTextureFromImage(txd, textureName, "icons/" .. v)
    end
end


function CreateInteraction(identifier, coords, type)
    local interaction = Interaction(identifier, coords, type)

    if not interaction then return end

    table.insert(interactions, interaction)
end

exports("CreateInteraction", CreateInteraction) 


-- TEST
local c = vector3(-89.748573, -999.621033, 104.262154)
exports["xx-interaction"]:CreateInteraction("test1", c, INTERACTION_TYPE.E)

c = vector3(-92.513596, -998.640076, 104.262146)
exports["xx-interaction"]:CreateInteraction("test2",c, INTERACTION_TYPE.E)

c = vector3(-96.521255, -997.142761, 104.262955)
exports["xx-interaction"]:CreateInteraction("test3",c, INTERACTION_TYPE.E)

c = vector3(-100.5299, -995.645447, 104.262955)
exports["xx-interaction"]:CreateInteraction("test4",c, INTERACTION_TYPE.E)

c = vector3(-104.5386, -994.148132, 104.262955)
exports["xx-interaction"]:CreateInteraction("test5",c, INTERACTION_TYPE.E)

c = vector3(-108.5473, -992.650818, 104.262955)
exports["xx-interaction"]:CreateInteraction("test6",c, INTERACTION_TYPE.E)

c = vector3(-112.556, -991.153503, 104.262955)
exports["xx-interaction"]:CreateInteraction("test7",c, INTERACTION_TYPE.E)

c = vector3(-116.5647, -989.656189, 104.262955)
exports["xx-interaction"]:CreateInteraction("test8",c, INTERACTION_TYPE.E)

c = vector3(-120.5734, -988.158874, 104.262955)
exports["xx-interaction"]:CreateInteraction("test9",c, INTERACTION_TYPE.E)

c = vector3(-124.5821, -986.66156, 104.262955)
exports["xx-interaction"]:CreateInteraction("test10",c, INTERACTION_TYPE.E)

c = vector3(-128.5908, -985.164245, 104.262955)
exports["xx-interaction"]:CreateInteraction("test11",c, INTERACTION_TYPE.E)

c = vector3(-132.5995, -983.666931, 104.262955)
exports["xx-interaction"]:CreateInteraction("test12",c, INTERACTION_TYPE.E)

c = vector3(-136.6082, -982.169616, 104.262955)
exports["xx-interaction"]:CreateInteraction("test13",c, INTERACTION_TYPE.E)

c = vector3(-140.6169, -980.672302, 104.262955)
exports["xx-interaction"]:CreateInteraction("test14",c, INTERACTION_TYPE.E)

c = vector3(-144.6256, -979.174987, 104.262955)
exports["xx-interaction"]:CreateInteraction("test15",c, INTERACTION_TYPE.E)

c = vector3(-148.6343, -977.677673, 104.262955)
exports["xx-interaction"]:CreateInteraction("test16",c, INTERACTION_TYPE.E)

c = vector3(-152.643, -976.180358, 104.262955)
exports["xx-interaction"]:CreateInteraction("test17",c, INTERACTION_TYPE.E)

c = vector3(-156.6517, -974.683044, 104.262955)
exports["xx-interaction"]:CreateInteraction("test18",c, INTERACTION_TYPE.E)

c = vector3(-160.6604, -973.185729, 104.262955)
exports["xx-interaction"]:CreateInteraction("test19",c, INTERACTION_TYPE.E)

c = vector3(-164.6691, -971.688415, 104.262955)
exports["xx-interaction"]:CreateInteraction("test20",c, INTERACTION_TYPE.E)


