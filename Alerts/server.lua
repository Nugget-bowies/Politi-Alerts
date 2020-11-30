local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_canc")

RegisterServerEvent('dispatch')
AddEventHandler('dispatch', function(dabs, street, playerCoords)
  Citizen.Wait(1000)
  local players = {}
  local users = vRP.getUsers({})
  local isPolice = false
  local isEMS = false

    for k,v in pairs(users) do
      
        local player = vRP.getUserSource({k})
        
        if player ~= nil then
          local user_id = vRP.getUserId({player})

          local isPolice = vRP.hasPermission({user_id,"police.garage"})
          local isEMS = vRP.hasPermission({user_id,"ems.beskedernopixel"})
          if isPolice then
            if dabs == "Skud affyret" or dabs == "Mistænkelig opførsel" or dabs == "Biltyveri" or dabs == "indbrud" or dabs == "Panikknap" then
            table.insert(players,player)
            end
          elseif isEMS then
            if dabs == "Omkommet" then
            table.insert(players,player)
            end
          end
        end
  end


for k,v in pairs(players) do
    if dabs == "Mistænkelig opførsel" then
      data = {["code"] = '10-86', ["name"] = "Mistænkelig opførsel", ["loc"] = street}
      mytype = 'police'
    elseif dabs == "Skud affyret" then
      mytype = 'police'
      data = {["code"] = '10-13', ["name"] = "Skud affyret", ["loc"] = street}
    elseif dabs == "Biltyveri" then
      mytype = 'police'
      data = {["code"] = '10-15', ["name"] = "Biltyveri rappoteret!", ["loc"] = street}
     elseif dabs == "Panikknap" then
      mytype = 'police'
      data = {["code"] = '10-89', ["name"] = "Kollega i nød!", ["loc"] = street}

    elseif dabs == "Omkommet" then
      mytype = 'ems'
      data = {["code"] = '10-dead', ["name"] = "Person såret", ["loc"] = street}
  end
    length = 7000
    TriggerClientEvent('esx_outlawalert:outlawNotify', v, mytype, data, length)
    TriggerClientEvent('notifyDispatch', v, playerCoords, dabs)
end
  
end)

