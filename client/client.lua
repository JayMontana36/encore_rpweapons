local shotCooldown       = 0
local initialCamViewMode = nil

--
-- Threads
--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerId  = PlayerId()
        local playerPed = PlayerPedId()

        if Config.Reticle.Disable then
            local weapon         = GetSelectedPedWeapon(playerPed)
            local isWeaponExempt = isWeaponExempt(weapon)
            local isPedExempt    = isPedExempt(playerPed)

            if not isWeaponExempt and not isPedExempt then
                HideHudComponentThisFrame(14)
            end
        end

        if Config.ThirdPerson.Disable then
            local forceFirstPerson = false

            if IsPlayerFreeAiming(playerId) then
                forceFirstPerson = true
            end

            if IsPedShooting(playerPed) then
                forceFirstPerson = true
                shotCooldown     = 60
            end

            if shotCooldown > 0 then
                forceFirstPerson = true

                shotCooldown = shotCooldown - 1
            end

            if forceFirstPerson then
                if not initialCamViewMode then
                    initialCamViewMode = GetFollowPedCamViewMode()
                end

                SetFollowPedCamViewMode(4)
            elseif initialCamViewMode ~= nil then
                SetFollowPedCamViewMode(initialCamViewMode)

                initialCamViewMode = nil
            end

            if
                Config.ThirdPerson.DisableFPTPCover
                and GetProfileSetting(237) == 1
            then
                local showWarning = false

                if IsPedAimingFromCover(playerPed) then
                    showWarning = true
                end

                if shotCooldown > 0 then
                    showWarning = true
                end

                if showWarning then
                    DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)

                    SetTextFont(2)
                    SetTextScale(0.5, 0.5)
                    SetTextColour(255, 255, 255, 255)
                    SetTextEntry("STRING")
                    SetTextCentre(true)

                    AddTextComponentString('Please disable First Person Third Person Cover in your camera settings')

                    DrawText(0.5, 0.5)
                end
            end
        end
    end
end)

--
-- Functions
--

function isWeaponExempt(weapon)
    local isExempt = false

    for k,v in pairs(Config.Reticle.ExemptWeapons) do
        if weapon == v then
            isExempt = true
            break
        end
    end

    return isExempt
end

function isPedExempt(playerPed)
    if not Config.Reticle.ExemptVehicle then
        return false
    end

    if not IsPedInAnyVehicle(playerPed, false) then
        return false
    end

    return true
end