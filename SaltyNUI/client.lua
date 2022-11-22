local disableMovement	= false -- set to true, if you want to disable movement
local ismuted 			= false -- do not touch

-- SaltyNUI Events
RegisterNetEvent('SaltyNUI:TsNotActive')
AddEventHandler('SaltyNUI:TsNotActive', function() 
	SendNUIMessage({action = "toggleWindow", value = "true"})
	ismuted = true
end)
RegisterNetEvent('SaltyNUI:TsActive')
AddEventHandler('SaltyNUI:TsActive', function() 
	SendNUIMessage({action = "toggleWindow", value = "false"})
	ismuted = false
end)

-- SaltyChat Events
AddEventHandler('SaltyChat_SoundStateChanged', function(muted) 
if (muted) then
	SendNUIMessage({action = "toggleWindow", value = "true"})
	ismuted = true
	else
	ismuted = false
	SendNUIMessage({action = "toggleWindow", value = "false"})
	end
end)

-- Disable movement while muted
Citizen.CreateThread(function()
	while disableMovement do
		Citizen.Wait(100)
		local playerPed = PlayerPedId()
		if ismuted then
			DisableAllControlActions(0)
		else
			Citizen.Wait(500)
		end
	end
end)