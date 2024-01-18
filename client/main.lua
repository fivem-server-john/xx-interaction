local width = 0.02
local height = width * GetAspectRatio(false)

Citizen.CreateThread(function()

    local coords = GetEntityCoords(PlayerPedId())

    RequestModel(GetHashKey("a_f_o_soucent_01"))

    while not HasModelLoaded(GetHashKey("a_f_o_soucent_01")) do
        Citizen.Wait(1)
    end

    local ped = CreatePed(4, GetHashKey("a_f_o_soucent_01"), coords.x, coords.y, coords.z, 0.0, true, true)
    SetEntityInvincible(ped, true)
    SetEntityCoords(ped, coords)

    FreezeEntityPosition(ped, true)

    local txd = CreateRuntimeTxd('test')
    local test = CreateRuntimeTextureFromImage(txd, "e", "icons/e-icon.png")

    while (true) do
        Citizen.Wait(1)

        if IsControlJustReleased(0, 38) then
            PlayAudio(ped)
        end
        SetDrawOrigin(coords.x, coords.y, coords.z + 0.5)
        DrawSprite("test", "e", 0, 0, width, height, 0, 255, 255, 255,150)
        ClearDrawOrigin()
        
    end

end)

function PlayAudio(ped)
    print(GetEntityCoords(PlayerPedId()))
    PlayPedAmbientSpeechNative(ped, "GENERIC_BYE", "SPEECH_PARAMS_FORCE")

end