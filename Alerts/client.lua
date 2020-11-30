function isCar(veh)
	local vc = GetVehicleClass(veh) -- Get vehicle class 
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20) -- Return number 
end

local dabs = nil

Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)

        if IsPedShooting(player) then
				local playerCoords = GetEntityCoords(player)

				local alreadyNotified = true
				local street = GetStreetName(playerCoords)
					local handle, object = FindFirstPed()
					local success

						repeat 
							success, object = FindNextPed(handle)
                            nearbyped = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, 200, 1, 0, 0, 1, -1)
                            local pos = GetEntityCoords(object)
                            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerCoords['x'], playerCoords['y'], playerCoords['z'], true)
                            dabs = "Skud affyret"
                            if alreadyNotified and distance <= 50 and object  ~= GetPlayerPed(-1) then
								NotifyPeople(dabs, street, playerCoords)
								alreadyNotified = false
								Citizen.Wait(5000)
							end

						until not success

					EndFindPed(handle)


				alreadyNotified = true
        end

        Citizen.Wait(30)
    end
end)

Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)

       if IsPedInMeleeCombat(player) then
                local playerCoords = GetEntityCoords(player)

                local alreadyNotified = true
                local street = GetStreetName(playerCoords)
                    local handle, object = FindFirstPed()
                    local success

                        repeat 
                            success, object = FindNextPed(handle)
                            nearbyped = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, 200, 1, 0, 0, 1, -1)
                            local pos = GetEntityCoords(object)
                            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerCoords['x'], playerCoords['y'], playerCoords['z'], true)
                            dabs = "Slås Kamp"
                            if alreadyNotified and distance <= 50 and object  ~= GetPlayerPed(-1) then
                                NotifyPeople(dabs, street, playerCoords)
                                alreadyNotified = false
                                Citizen.Wait(5000)
                            end

                        until not success

                    EndFindPed(handle)


                alreadyNotified = true
            end

        Citizen.Wait(30)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        if (IsPedTryingToEnterALockedVehicle(player) or IsPedJacking(player)) then
                local playerCoords = GetEntityCoords(player)
                local alreadyNotified = true
                local street = GetStreetName(playerCoords)
                    local handle, object = FindFirstPed()
                    local success
                        repeat 
                            success, object = FindNextPed(handle)
                            nearbyped = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, 200, 1, 0, 0, 1, -1)
                            local pos = GetEntityCoords(object)
                            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerCoords['x'], playerCoords['y'], playerCoords['z'], true)
                            dabs = "Biltyveri"
                            if alreadyNotified and distance <= 50 and object  ~= GetPlayerPed(-1) then
                                NotifyPeople(dabs, street, playerCoords)
                                alreadyNotified = false
                                Citizen.Wait(5000)
                            end
                        until not success
                    EndFindPed(handle)
                alreadyNotified = true
            end
        Citizen.Wait(30)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        if IsControlPressed(1, 19) and IsControlJustPressed(1, 74) then
                local playerCoords = GetEntityCoords(player)
                local alreadyNotified = true
                local street = GetStreetName(playerCoords)
                    local handle, object = FindFirstPed()
                    local success
                        repeat 
                            success, object = FindNextPed(handle)
                            nearbyped = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, 200, 1, 0, 0, 1, -1)
                            local pos = GetEntityCoords(object)
                            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerCoords['x'], playerCoords['y'], playerCoords['z'], true)
                            dabs = "Panikknap"
                            if alreadyNotified and distance <= 50 and object  ~= GetPlayerPed(-1) then
                                NotifyPeople(dabs, street, playerCoords)
                                alreadyNotified = false
                                Citizen.Wait(1)
                            end
                        until not success
                    EndFindPed(handle)
                alreadyNotified = true
            end
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    alreadyNotifiedDead = true
    while true do
        local player = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(player)
        local health = GetEntityHealth(player)
        if health <= 120 then
            if alreadyNotifiedDead then
                local street = GetStreetName(playerCoords)
                    local handle, object = FindFirstPed()
                    local success
                    
                    repeat 
                        success, object = FindNextPed(handle)
                        dabs = "Omkommet"
                        nearbyped = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, 200, 1, 0, 0, 1, -1)
                        local pos = GetEntityCoords(object)
                        local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerCoords['x'], playerCoords['y'], playerCoords['z'], true)
                        if alreadyNotifiedDead and distance <= 300 and object  ~= GetPlayerPed(-1) then
                            NotifyPeople(dabs, street, playerCoords)
                            alreadyNotifiedDead = false
                            Citizen.Wait(6000)
                        end

                    until not success

                    EndFindPed(handle)

            end
        end

        if health > 120 then
            alreadyNotifiedDead = true
        end

        Citizen.Wait(30)
    end
end)


local blipList = {}
--[[
RegisterNetEvent('notifyDispatch')
AddEventHandler('notifyDispatch', function(playerCoords, dabs)
    local ped = GetPlayerPed(PlayerPedId())
    local blip = AddBlipForCoord(playerCoords.x+0.001,playerCoords.y+0.001,playerCoords.z+0.001)
    SetBlipSprite(blip, 304)
    SetBlipColour(blip, 67)
    SetBlipAlpha(blip, 250)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("> "..dabs)
    SetBlipScale(blip, 0.7)
    EndTextCommandSetBlipName(blip)

    table.insert(blipList, blip)
end)--]]

RegisterNetEvent('notifyDispatch')
AddEventHandler('notifyDispatch', function(playerCoords, dabs)
            local alpha = 250
            local thiefBlip = AddBlipForRadius(playerCoords.x, playerCoords.y, playerCoords.z, 50.0)

            SetBlipHighDetail(thiefBlip, true)
            SetBlipColour(thiefBlip, 1)
            SetBlipAlpha(thiefBlip, alpha)
            SetBlipAsShortRange(thiefBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("> "..dabs)
            EndTextCommandSetBlipName(thiefBlip)
            --SetBlipScale(thiefBlip, 1.0)
            

            while alpha ~= 0 do
                Citizen.Wait(20*4)
                alpha = alpha - 1
                SetBlipAlpha(thiefBlip, alpha)

                if alpha == 0 then
                    RemoveBlip(thiefBlip)
                    return
                end
            end

end)

RegisterNetEvent('esx_outlawalert:outlawNotify')
AddEventHandler('esx_outlawalert:outlawNotify', function(type, data, length)
        SendNUIMessage({action = 'display', style = type, info = data, length = length})
        PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(PlayerPedId())
        for k,v in pairs(blipList) do
            RemoveBlip(v)
        end
        blipList = {}
        Citizen.Wait(180000)
    end
end)

function Lockvehicle(object)
    if object ~= nil then
        local pedInVehicle = GetPedInVehicleSeat(object, -1)
        local lock = false
        local numberPlate = GetVehicleNumberPlateText(object)

        if numberPlate ~= nil then

            if tostring(numberPlate) ~= tostring(currentPlate) and currentPlate ~= nil then 
                lock = true
            end

            if tostring(numberPlate) ~= tostring(lastPlate) and lastPlate ~= nil then
                lock = true
            end

            local firstDigit = tonumber(string.sub(tostring(numberPlate), 1, 1))
            local secondDigit = tonumber(string.sub(tostring(numberPlate), 2, 2))
            
            if firstDigit ~= nil and secondDigit ~= nil then

                if firstDigit >= 0 and secondDigit >= 0 then
                    lock = true
                else
                    lock = false
                end
            else
                lock = false
            end                   

            if lock then

                if pedInVehicle == 0 then
                    local lock = GetVehicleDoorLockStatus(object)
                    
                    if lock == 7 then
                        --Citizen.Trace("Bil: " .. tostring(GetVehicleNumberPlateText(object)) .. " - " .. tostring(currentPlate) .. " - " .. tostring(lastPlate))
                        SetVehicleDoorsLocked(object,2)
                        SetVehicleDoorsLockedForAllPlayers(object, true)
                    end
                end
            end
        end
    end 
end

function CheckDistance(object, pos, checkAlertness)
    local pedCoords = GetEntityCoords(object)
    local dis = Vdist(pos.x, pos.y, pos.z, pedCoords.x, pedCoords.y, pedCoords.z)

    if dis <= 100.0 and dis > 1.0 then
        --Citizen.Trace(tostring(dis))
        if checkAlertness then
            if GetPedAlertness(object) >= 1 then
                return true
            else
                return false
            end
        end

        return true
    end

    return false
end

function GetStreetName(playerPos)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)

    if s2 == 0 then
        return street1
    elseif s2 ~= 0 then
        return street1 .. " - " .. street2
    end
end


function NotifyPeople(dabs, street, playerCoords)
    TriggerServerEvent('dispatch', dabs, street, playerCoords)
end