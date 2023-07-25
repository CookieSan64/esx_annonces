ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if Config.EnableESXIdentity then name = GetCharacterName(source) end
		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), message }, color = { 128, 128, 128 } })
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ann', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowedGroups = { 'superadmin', 'admin' } -- Liste des groupes autorisés à utiliser la commande

    local hasPermission = false
    for i=1, #allowedGroups do
        if xPlayer.getGroup() == allowedGroups[i] then
            hasPermission = true
            break
        end
    end

    if hasPermission then
        args = table.concat(args, ' ')
        local name = GetPlayerName(source)
        if Config.EnableESXIdentity then name = GetCharacterName(source) end

        local notification = {
            message = args,
            title = "ANNONCE SERVEUR",
            subject = " ",
            icon = 'CALICO',
            timeout = 10000,
            position = "top",
            progress = false,
            theme = "avis_fdo",
            exitAnim = "fadeOutRight",
            flash = false
        }

        TriggerClientEvent("bulletin:sendAdvanced", -1, notification)
    else
        local notification = {
            message = "Vous n'êtes pas autorisé à utiliser cette commande.",
            timeout = 10000,
            position = "bottomleft",
            progress = false,
            theme = "error",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent("bulletin:send", source, notification)
    end
end, false)

RegisterCommand('avis', function(source, args, rawCommand)
    if source == 0 then
        return
    end
    args = table.concat(args, ' ')
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'ccsd' or xPlayer.job.name == 'pr' or xPlayer.job.name == 'fbi' or xPlayer.job.name == 'gouv' then
        local notification = {
            message = args,
            title = "Force De l'Ordre",
            subject = "Avis de Recherche",
            icon = 'GOUV',
            timeout = 10000,
            position = "top",
            progress = false,
            theme = "avis_fdo",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
    else
        local notification = {
            message = "Vous n'êtes pas autorisé à utiliser cette commande.",
            timeout = 5000,
            position = "bottomleft",
            progress = false,
            theme = "error",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:send', source, notification)
    end
end, false)

	-- Métier EMS
RegisterCommand('ems', function(source, args, rawCommand)
    if source == 0 then
        return
    end
    args = table.concat(args, ' ')
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    if xPlayer.job.name == 'ambulance' then
        local notification = {
            message = args,
            title = "EMS",
            subject = "Annonce : ",
            icon = 'EMS',
            timeout = 10000,
            position = "bottomleft",
            progress = false,
            theme = "inform",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
    else
        local notification = {
            message = "Vous n'êtes pas autorisé à utiliser cette commande.",
            timeout = 5000,
            position = "bottomleft",
            progress = false,
            theme = "error",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:send', source, notification)
    end
end, false)

RegisterCommand('emsrecrutement', function(source, args, rawCommand)
    if source == 0 then
        return
    end
    args = table.concat(args, ' ')
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    if xPlayer.job.name == 'ambulance' then
        local notification = {
            message = args,
            title = "EMS",
            subject = "Recrutement : ",
            icon = 'EMS',
            timeout = 10000,
            position = "bottomleft",
            progress = false,
            theme = "inform",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
    else
        local notification = {
            message = "Vous n'êtes pas autorisé à utiliser cette commande.",
            timeout = 5000,
            position = "bottomleft",
            progress = false,
            theme = "error",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:send', source, notification)
    end
end, false)

	-- Métier CCPD
RegisterCommand('ccpd', function(source, args, rawCommand)
    if source == 0 then
        return
    end
    args = table.concat(args, ' ')
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    if xPlayer.job.name == 'police' then
        local notification = {
            message = args,
            title = "Calico City Police Department",
            subject = "Annonce : ", -- Ajoutez une valeur pour le champ subject
            icon = 'CCPD',
            timeout = 10000,
            position = "bottomleft",
            progress = false,
            theme = "inform",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
    else
        local notification = {
            message = "Vous n'êtes pas autorisé à utiliser cette commande.",
            timeout = 5000,
            position = "bottomleft",
            progress = false,
            theme = "error",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:send', source, notification)
    end
end, false)

RegisterCommand('ccpdrecrutement', function(source, args, rawCommand)
    if source == 0 then
        return
    end
    args = table.concat(args, ' ')
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    if xPlayer.job.name == 'police' then
        local notification = {
            message = args,
            title = "Calico City Police Department",
            subject = "Recrutement : ",
            icon = 'CCPD',
            timeout = 10000,
            position = "bottomleft",
            progress = false,
            theme = "inform",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
    else
        local notification = {
            message = "Vous n'êtes pas autorisé à utiliser cette commande.",
            timeout = 5000,
            position = "bottomleft",
            progress = false,
            theme = "error",
            exitAnim = "fadeOutRight",
            flash = false
        }
        TriggerClientEvent('bulletin:send', source, notification)
    end
end, false)

	-- Métier CCSD
    RegisterCommand('ccsd', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'ccsd' then
            local notification = {
                message = args,
                title = "Calico City Sherif Department",
                subject = "Annonce : ",
                icon = 'CCSD',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('ccsdrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'ccsd' then
            local notification = {
                message = args,
                title = "Calico City Sherif Department",
                subject = "Recrutement : ",
                icon = 'CCSD',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier FBI
    RegisterCommand('fbi', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'fbi' then
            local notification = {
                message = args,
                title = "FBI",
                subject = "Annonce : ",
                icon = 'FBI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('fbirecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'fbi' then
            local notification = {
                message = args,
                title = "FBI",
                subject = "Recrutement : ",
                icon = 'FBI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Gouvernement
    RegisterCommand('gouv', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'gouv' then
            local notification = {
                message = args,
                title = "Gouvernement",
                subject = "Annonce : ",
                icon = 'GOUV',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('gouvrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'gouv' then
            local notification = {
                message = args,
                title = "Gouvernement",
                subject = "Recrutement : ",
                icon = 'GOUV',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier WeazelNew
    RegisterCommand('wn', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'wn' then
            local notification = {
                message = args,
                title = "Weazel News",
                subject = "Annonce : ",
                icon = 'WN',
                timeout = 10000,
                position = "top",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('wnrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'wn' then
            local notification = {
                message = args,
                title = "Weazel News",
                subject = "Recrutement : ",
                icon = 'WN',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('wnpub', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'wn' then
            local notification = {
                message = args,
                title = "Weazel News",
                subject = "Publicité : ",
                icon = 'WN',
                timeout = 10000,
                position = "top",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('wnmeteo', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'wn' then
            local notification = {
                message = args,
                title = "Weazel News",
                subject = "Météo : ",
                icon = 'WN',
                timeout = 10000,
                position = "top",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier BobCat Security [ secworker ]
    RegisterCommand('sec', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'secworker' then
            local notification = {
                message = args,
                title = "BobCat Security",
                subject = "Annonce : ",
                icon = 'BOBCAT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('secrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'secworker' then
            local notification = {
                message = args,
                title = "BobCat Security",
                subject = "Recrutement : ",
                icon = 'BOBCAT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Up'N'Atom
    RegisterCommand('atom', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'atom' then
            local notification = {
                message = args,
                title = "Up'N'Atom",
                subject = "Annonce : ",
                icon = 'ATOM',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('atomrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'atom' then
            local notification = {
                message = args,
                title = "Up'N'Atom",
                subject = "Recrutement : ",
                icon = 'ATOM',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Avocat
    RegisterCommand('avocat', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'avocat' then
            local notification = {
                message = args,
                title = "Avocat",
                subject = "Annonce : ",
                icon = 'AVOCAT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('avocatrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'avocat' then
            local notification = {
                message = args,
                title = "Avocat",
                subject = "Recrutement : ",
                icon = 'AVOCAT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Bahama Mamas
    RegisterCommand('bahamas', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'bahamas' then
            local notification = {
                message = args,
                title = "Bahama Mamas",
                subject = "Annonce : ",
                icon = 'BAHAMAS',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('bahamasrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'bahamas' then
            local notification = {
                message = args,
                title = "Bahama Mamas",
                subject = "Recrutement : ",
                icon = 'BAHAMAS',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Boulangerie
    RegisterCommand('boul', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'boul' then
            local notification = {
                message = args,
                title = "Boulangerie",
                subject = "Annonce : ",
                icon = 'BOUL',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('boulrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'boul' then
            local notification = {
                message = args,
                title = "Boulangerie",
                subject = "Recrutement : ",
                icon = 'BOUL',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Burger Shot
    RegisterCommand('burgershot', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'burgershot' then
            local notification = {
                message = args,
                title = "Burger Shot",
                subject = "Annonce : ",
                icon = 'BURGER_SHOT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('burgershotrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'burgershot' then
            local notification = {
                message = args,
                title = "Burger Shot",
                subject = "Recrutement : ",
                icon = 'BURGER_SHOT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Event
    RegisterCommand('event', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'event' then
            local notification = {
                message = args,
                title = "Evenement",
                subject = "Annonce : ",
                icon = 'EVENT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('eventrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'event' then
            local notification = {
                message = args,
                title = "Evenement",
                subject = "Recrutement : ",
                icon = 'EVENT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier La Ferme
    RegisterCommand('ferme', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'ferme' then
            local notification = {
                message = args,
                title = "La Ferme",
                subject = "Annonce : ",
                icon = 'FERME',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('fermerecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'ferme' then
            local notification = {
                message = args,
                title = "La Ferme",
                subject = "Recrutement : ",
                icon = 'FERME',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Horny's
     RegisterCommand('horny', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'horny' then
            local notification = {
                message = args,
                title = "Horny's",
                subject = "Annonce : ",
                icon = 'HORNYS',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('hornyrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'horny' then
            local notification = {
                message = args,
                title = "Horny's",
                subject = "Recrutement : ",
                icon = 'HORNYS',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Restaurant Italien
     RegisterCommand('restoi', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'restoi' then
            local notification = {
                message = args,
                title = "Pizzeria",
                subject = "Annonce : ",
                icon = 'RESTOI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('restoirecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'restoi' then
            local notification = {
                message = args,
                title = "Pizzeria",
                subject = "Recrutement : ",
                icon = 'RESTOI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Mécano
      RegisterCommand('meca', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'mechanic' then
            local notification = {
                message = args,
                title = "Benny's",
                subject = "Annonce : ",
                icon = 'BENNY',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('mecarecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'mechanic' then
            local notification = {
                message = args,
                title = "Benny's",
                subject = "Recrutement : ",
                icon = 'BENNY',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Pompier
     RegisterCommand('pompier', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'pompier' then
            local notification = {
                message = args,
                title = "Calico City Fire Department",
                subject = "Annonce : ",
                icon = 'POMPIER',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('pompierrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'pompier' then
            local notification = {
                message = args,
                title = "Calico City Fire Department",
                subject = "Recrutement : ",
                icon = 'POMPIER',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Park Ranger
    RegisterCommand('pr', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'pr' then
            local notification = {
                message = args,
                title = "Park Ranger",
                subject = "Annonce : ",
                icon = 'PR',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('prrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'pr' then
            local notification = {
                message = args,
                title = "Park Ranger",
                subject = "Recrutement : ",
                icon = 'PR',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Psy
      RegisterCommand('psy', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'psy' then
            local notification = {
                message = args,
                title = "Cabinet Psy",
                subject = "Annonce : ",
                icon = 'PSY',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('psyrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'psy' then
            local notification = {
                message = args,
                title = "Cabinet Psy",
                subject = "Recrutement : ",
                icon = 'PSY',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Agent Immobilier
      RegisterCommand('immo', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'realestateagent' then
            local notification = {
                message = args,
                title = "Agence Immobilier",
                subject = "Annonce : ",
                icon = 'IMMO',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('immorecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'realestateagent' then
            local notification = {
                message = args,
                title = "Agence Immobilier",
                subject = "Recrutement : ",
                icon = 'IMMO',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Le Dragon D'or
       RegisterCommand('restoa', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'restoa' then
            local notification = {
                message = args,
                title = "Le Dragon D'or",
                subject = "Annonce : ",
                icon = 'RESTOA',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('restoarecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'restoa' then
            local notification = {
                message = args,
                title = "Le Dragon D'or",
                subject = "Recrutement : ",
                icon = 'RESTOA',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier RedWood
    RegisterCommand('tabac', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'tabac' then
            local notification = {
                message = args,
                title = "RedWood",
                subject = "Annonce : ",
                icon = 'REDWOOD',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('tabacrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'tabac' then
            local notification = {
                message = args,
                title = "RedWood",
                subject = "Recrutement : ",
                icon = 'REDWOOD',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Taxi
    RegisterCommand('taxi', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'taxi' then
            local notification = {
                message = args,
                title = "Taxi",
                subject = "Annonce : ",
                icon = 'TAXI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('taxirecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'taxi' then
            local notification = {
                message = args,
                title = "Taxi",
                subject = "Recrutement : ",
                icon = 'TAXI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Tequi-La-La
    RegisterCommand('tequi', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'tequi' then
            local notification = {
                message = args,
                title = "Tequi-La-La",
                subject = "Annonce : ",
                icon = 'TEQUI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('tequirecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'tequi' then
            local notification = {
                message = args,
                title = "Tequi-La-La",
                subject = "Recrutement : ",
                icon = 'TEQUI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier The Last Train
    RegisterCommand('train', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'train' then
            local notification = {
                message = args,
                title = "The Last Train",
                subject = "Annonce : ",
                icon = 'TLT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('trainrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'train' then
            local notification = {
                message = args,
                title = "The Last Train",
                subject = "Recrutement : ",
                icon = 'TLT',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Vignoble
    RegisterCommand('vigne', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'vigne' then
            local notification = {
                message = args,
                title = "Vignoble",
                subject = "Annonce : ",
                icon = 'VIGNE',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('vignerecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'vigne' then
            local notification = {
                message = args,
                title = "Vignoble",
                subject = "Recrutement : ",
                icon = 'VIGNE',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Yellow Jack
    RegisterCommand('yj', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'yellowjack' then
            local notification = {
                message = args,
                title = "Yellow Jack",
                subject = "Annonce : ",
                icon = 'YJ',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('yjrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'yellowjack' then
            local notification = {
                message = args,
                title = "Yellow Jack",
                subject = "Recrutement : ",
                icon = 'YJ',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    -- Métier Unicorn
    RegisterCommand('uni', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'uni' then
            local notification = {
                message = args,
                title = "Unicorn",
                subject = "Annonce : ",
                icon = 'UNICORN',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('unirecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'uni' then
            local notification = {
                message = args,
                title = "Unicorn",
                subject = "Recrutement : ",
                icon = 'UNICORN',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier The Lost Bar
    RegisterCommand('lostbar', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'lostbar' then
            local notification = {
                message = args,
                title = "The Lost Bar",
                subject = "Annonce : ",
                icon = 'TLB',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('lostbarrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'lostbar' then
            local notification = {
                message = args,
                title = "The Lost Bar",
                subject = "Recrutement : ",
                icon = 'TLB',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

	-- Métier Irish Pub
    RegisterCommand('irish', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'irish' then
            local notification = {
                message = args,
                title = "Irish Pub",
                subject = "Annonce : ",
                icon = 'IRISH',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('irishrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'irish' then
            local notification = {
                message = args,
                title = "Irish Pub",
                subject = "Recrutement : ",
                icon = 'IRISH',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)
	-- Métier Koi
    RegisterCommand('koi', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'koijob' then
            local notification = {
                message = args,
                title = "Koi",
                subject = "Annonce : ",
                icon = 'KOI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('koirecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'koijob' then
            local notification = {
                message = args,
                title = "Koi",
                subject = "Recrutement : ",
                icon = 'KOI',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)
	-- Métier Pearl's
    RegisterCommand('pearl', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'pearl' then
            local notification = {
                message = args,
                title = "Pearl's",
                subject = "Annonce : ",
                icon = 'PEARL',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('pearlrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'pearl' then
            local notification = {
                message = args,
                title = "Pearl's",
                subject = "Recrutement : ",
                icon = 'PEARL',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)
    -- Métier Diner
    RegisterCommand('diner', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'diner' then
            local notification = {
                message = args,
                title = "Diner",
                subject = "Annonce : ",
                icon = 'DINER',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)

    RegisterCommand('dinerrecrutement', function(source, args, rawCommand)
        if source == 0 then
            return
        end
        args = table.concat(args, ' ')
        local xPlayer = ESX.GetPlayerFromId(source)
        local name = xPlayer.getName()
        if xPlayer.job.name == 'diner' then
            local notification = {
                message = args,
                title = "Diner",
                subject = "Recrutement : ",
                icon = 'DINER',
                timeout = 10000,
                position = "bottomleft",
                progress = false,
                theme = "inform",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
        else
            local notification = {
                message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                timeout = 5000,
                position = "bottomleft",
                progress = false,
                theme = "error",
                exitAnim = "fadeOutRight",
                flash = false
            }
            TriggerClientEvent('bulletin:send', source, notification)
        end
    end, false)
    	-- Métier UwU Café
        RegisterCommand('uwu', function(source, args, rawCommand)
            if source == 0 then
                return
            end
            args = table.concat(args, ' ')
            local xPlayer = ESX.GetPlayerFromId(source)
            local name = xPlayer.getName()
            if xPlayer.job.name == 'uwu' then
                local notification = {
                    message = args,
                    title = "UwU Café",
                    subject = "Annonce : ",
                    icon = 'UWU',
                    timeout = 10000,
                    position = "bottomleft",
                    progress = false,
                    theme = "inform",
                    exitAnim = "fadeOutRight",
                    flash = false
                }
                TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
            else
                local notification = {
                    message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                    timeout = 5000,
                    position = "bottomleft",
                    progress = false,
                    theme = "error",
                    exitAnim = "fadeOutRight",
                    flash = false
                }
                TriggerClientEvent('bulletin:send', source, notification)
            end
        end, false)
    
        RegisterCommand('uwurecrutement', function(source, args, rawCommand)
            if source == 0 then
                return
            end
            args = table.concat(args, ' ')
            local xPlayer = ESX.GetPlayerFromId(source)
            local name = xPlayer.getName()
            if xPlayer.job.name == 'uwu' then
                local notification = {
                    message = args,
                    title = "UwU Café",
                    subject = "Recrutement : ",
                    icon = 'UWU',
                    timeout = 10000,
                    position = "bottomleft",
                    progress = false,
                    theme = "inform",
                    exitAnim = "fadeOutRight",
                    flash = false
                }
                TriggerClientEvent('bulletin:sendAdvanced', -1, notification)
            else
                local notification = {
                    message = "Vous n'êtes pas autorisé à utiliser cette commande.",
                    timeout = 5000,
                    position = "bottomleft",
                    progress = false,
                    theme = "error",
                    exitAnim = "fadeOutRight",
                    flash = false
                }
                TriggerClientEvent('bulletin:send', source, notification)
            end
        end, false)

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end