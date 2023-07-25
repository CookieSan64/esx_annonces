RegisterNetEvent('esx_annonces:sendProximityMessage')
AddEventHandler('esx_annonces:sendProximityMessage', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/avis',    'Avis de recherche', { { name = _U('generic_argument_name'), help = 'Le message de l\'avis de recherche que vous voulez publier' } } )

	-- Métier EMS
	TriggerEvent('chat:addSuggestion', '/ems', 'Annonce EMS', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/emsrecrutement', 'Recrutement EMS', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier CCPD
	TriggerEvent('chat:addSuggestion', '/ccpd', 'Annonce CCPD', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/ccpdrecrutement', 'Recrutement CCPD', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier CCSD
	TriggerEvent('chat:addSuggestion', '/ccsd', 'Annonce CCSD', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/ccsdrecrutement', 'Recrutement CCSD', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier CCSO
	TriggerEvent('chat:addSuggestion', '/ccso', 'Annonce CCSO', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/ccsorecrutement', 'Recrutement CCSO', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier FBI
	TriggerEvent('chat:addSuggestion', '/fbi', 'Annonce FBI', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/fbirecrutement', 'Recrutement FBI', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Gouvernement
	TriggerEvent('chat:addSuggestion', '/gouv', 'Annonce Gouvernement', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/gouvrecrutement', 'Recrutement Gouvernement', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier WeazelNew
	TriggerEvent('chat:addSuggestion', '/wn', 'Annonce WeazelNew', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/wnrecrutement', 'Recrutement WeazelNew', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/wnpub', 'Publicité WeazelNew', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/wnmeteo', 'Info Météo', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	-- Métier Up'N'Atom
	TriggerEvent('chat:addSuggestion', '/atom', 'Annonce Up\'N\'Atom', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/atomrecrutement', 'Recrutement Up\'N\'Atom', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Avocat
	TriggerEvent('chat:addSuggestion', '/avocat', 'Annonce Avocat', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/avocatrecrutement', 'Recrutement Avocat', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Bahama Mamas
	TriggerEvent('chat:addSuggestion', '/bahamas', 'Annonce Bahama Mamas', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/bahamasrecrutement', 'Recrutement Bahama Mamas', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Boulangerie
	TriggerEvent('chat:addSuggestion', '/boul', 'Annonce Boulangerie', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/boulrecrutement', 'Recrutement Boulangerie', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Burger Shot
	TriggerEvent('chat:addSuggestion', '/burgershot', 'Annonce Burger Shot', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/burgershotrecrutement', 'Recrutement Burger Shot', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Concessionnaire
	TriggerEvent('chat:addSuggestion', '/cardealer', 'Annonce Concessionnaire', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/cardealerrecrutement', 'Recrutement Concessionnaire', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Event
    TriggerEvent('chat:addSuggestion', '/event', 'Annonce Event', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    TriggerEvent('chat:addSuggestion', '/eventrecrutement', 'Recrutement Event', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/eventpub', 'Publicité Evènement', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    -- Métier La Ferme
    TriggerEvent('chat:addSuggestion', '/ferme', 'Annonce La Ferme', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    TriggerEvent('chat:addSuggestion', '/fermrecrutement', 'Recrutement La Ferme', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
    -- Métier Horny's
    TriggerEvent('chat:addSuggestion', '/horny', 'Annonce Horny\'s', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    TriggerEvent('chat:addSuggestion', '/hornyrecrutement', 'Recrutement Horny\'s', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
    -- Métier Restaurant Italien
    TriggerEvent('chat:addSuggestion', '/restoi', 'Annonce Restaurant Italien', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    TriggerEvent('chat:addSuggestion', '/restoirecrutement', 'Recrutement Restaurant Italien', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
    -- Métier Mécano
    TriggerEvent('chat:addSuggestion', '/meca', 'Annonce Mécano', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    TriggerEvent('chat:addSuggestion', '/mecarecrutement', 'Recrutement Mécano', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
    -- Métier Pompier
    TriggerEvent('chat:addSuggestion', '/pompier', 'Annonce Pompier', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
    TriggerEvent('chat:addSuggestion', '/pompierrecrutement', 'Recrutement Pompier', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Pompier
	TriggerEvent('chat:addSuggestion', '/pompier', 'Annonce Pompier', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/pompierrecrutement', 'Recrutement Pompier', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Park Ranger (PR)
	TriggerEvent('chat:addSuggestion', '/pr', 'Annonce Park Ranger', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/prrecrutement', 'Recrutement Park Ranger', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Psy
	TriggerEvent('chat:addSuggestion', '/psy', 'Annonce Psy', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/psyrecrutement', 'Recrutement Psy', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Agent Immobilier (IMMO)
	TriggerEvent('chat:addSuggestion', '/immo', 'Annonce Agent Immobilier', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/immorecrutement', 'Recrutement Agent Immobilier', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Le Dragon D'or (RESTOA)
	TriggerEvent('chat:addSuggestion', '/restoa', 'Annonce Le Dragon D\'or', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/restoarecrutement', 'Recrutement Le Dragon D\'or', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier RedWood (TABAC)
	TriggerEvent('chat:addSuggestion', '/tabac', 'Annonce RedWood', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/tabacrecrutement', 'Recrutement RedWood', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Taxi
	TriggerEvent('chat:addSuggestion', '/taxi', 'Annonce Taxi', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/taxirecrutement', 'Recrutement Taxi', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Tequi-La-La
	TriggerEvent('chat:addSuggestion', '/tequi', 'Annonce Tequi-La-La', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/tequirecrutement', 'Recrutement Tequi-La-La', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier The Last Train
	TriggerEvent('chat:addSuggestion', '/train', 'Annonce The Last Train', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/trainrecrutement', 'Recrutement The Last Train', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Vignoble
	TriggerEvent('chat:addSuggestion', '/vignoble', 'Annonce Vignoble', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/vignoblerecrutement', 'Recrutement Vignoble', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Yellow Jack
	TriggerEvent('chat:addSuggestion', '/yj', 'Annonce Yellow Jack', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/yjrecrutement', 'Recrutement Yellow Jack', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier The Lost Bar
	TriggerEvent('chat:addSuggestion', '/lostbar', 'Annonce The Lost Bar', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/lostbarrecrutement', 'Recrutement The Lost Bar', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier BobCat Security
	TriggerEvent('chat:addSuggestion', '/sec', 'Annonce BobCat Security', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/secrecrutement', 'Recrutement BobCat Security', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )

	-- Métier Irish Pub
	TriggerEvent('chat:addSuggestion', '/irish', 'Annonce Irish Pub', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/irishrecrutement', 'Recrutement Irish Pub', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Koi
	TriggerEvent('chat:addSuggestion', '/koi', 'Annonce Koi', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/koirecrutement', 'Recrutement Koi', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Pearl's
	TriggerEvent('chat:addSuggestion', '/pearl', 'Annonce Pearl\'s', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/pearlrecrutement', 'Recrutement Pearl\'s', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier Diner
	TriggerEvent('chat:addSuggestion', '/diner', 'Annonce Diner', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/dinerrecrutement', 'Recrutement Diner', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
	-- Métier UwU Café
	TriggerEvent('chat:addSuggestion', '/uwu', 'Annonce UwU Café', { { name = _U('generic_argument_name'), help = 'Le message que vous voulez publier' } } )
	TriggerEvent('chat:addSuggestion', '/uwurecrutement', 'Recrutement UwU Café', { { name = _U('generic_argument_name'), help = 'Le message de recrutement que vous voulez publier' } } )
end)


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/avis')
	-- Métier EMS
		TriggerEvent('chat:removeSuggestion', '/ems')
		TriggerEvent('chat:removeSuggestion', '/emsrecrutement')
	-- Métier CCPD
		TriggerEvent('chat:removeSuggestion', '/ccpd')
		TriggerEvent('chat:removeSuggestion', '/ccpdrecrutement')
	-- Métier CCSD
		TriggerEvent('chat:removeSuggestion', '/ccsd')
		TriggerEvent('chat:removeSuggestion', '/ccsdrecrutement')
	-- Métier CCSO
		TriggerEvent('chat:removeSuggestion', '/ccso')
		TriggerEvent('chat:removeSuggestion', '/ccsorecrutement')
	-- Métier FBI
		TriggerEvent('chat:removeSuggestion', '/fbi')
		TriggerEvent('chat:removeSuggestion', '/fbirecrutement')
	-- Métier Gouvernement
		TriggerEvent('chat:removeSuggestion', '/gouv')
		TriggerEvent('chat:removeSuggestion', '/gouvrecrutement')
	-- Métier WeazelNew
		TriggerEvent('chat:removeSuggestion', '/wn')
		TriggerEvent('chat:removeSuggestion', '/wnrecrutement')
		TriggerEvent('chat:removeSuggestion', '/wnpub')
		TriggerEvent('chat:removeSuggestion', '/wnmeteo')
	-- Métier Up'N'Atom
		TriggerEvent('chat:removeSuggestion', '/atom')
		TriggerEvent('chat:removeSuggestion', '/atomrecrutement')
	-- Métier Avocat
		TriggerEvent('chat:removeSuggestion', '/avocat')
		TriggerEvent('chat:removeSuggestion', '/avocatrecrutement')
	-- Métier Bahama Mamas
		TriggerEvent('chat:removeSuggestion', '/bahamas')
		TriggerEvent('chat:removeSuggestion', '/bahamasrecrutement')
	-- Métier Bobcat
		TriggerEvent('chat:removeSuggestion', '/bobcat')
		TriggerEvent('chat:removeSuggestion', '/bobcatrecrutement')
	-- Métier Boulangerie
		TriggerEvent('chat:removeSuggestion', '/boul')
		TriggerEvent('chat:removeSuggestion', '/boulrecrutement')
	-- Métier Burger Shot
		TriggerEvent('chat:removeSuggestion', '/burgershot')
		TriggerEvent('chat:removeSuggestion', '/burgershotrecrutement')
	-- Métier Concessionnaire
		TriggerEvent('chat:removeSuggestion', '/cardealer')
		TriggerEvent('chat:removeSuggestion', '/cardealerrecrutement')
	-- Métier Event
		TriggerEvent('chat:removeSuggestion', '/event')
		TriggerEvent('chat:removeSuggestion', '/eventrecrutement')
		TriggerEvent('chat:removeSuggestion', '/eventpub')
	-- Métier La Ferme
		TriggerEvent('chat:removeSuggestion', '/ferme')
		TriggerEvent('chat:removeSuggestion', '/fermerecrutement')
	-- Métier Horny's
		TriggerEvent('chat:removeSuggestion', '/horny')
		TriggerEvent('chat:removeSuggestion', '/hornyrecrutement')
	-- Métier Restaurant Italien
		TriggerEvent('chat:removeSuggestion', '/restoi')
		TriggerEvent('chat:removeSuggestion', '/restoirecrutement')
	-- Métier Mécano
		TriggerEvent('chat:removeSuggestion', '/meca')
		TriggerEvent('chat:removeSuggestion', '/mecarecrutement')
	-- Métier Pompier
		TriggerEvent('chat:removeSuggestion', '/pompier')
		TriggerEvent('chat:removeSuggestion', '/pompierrecrutement')
	-- Métier Park Ranger
		TriggerEvent('chat:removeSuggestion', '/pr')
		TriggerEvent('chat:removeSuggestion', '/prrecrutement')
	-- Métier Psy
		TriggerEvent('chat:removeSuggestion', '/psy')
		TriggerEvent('chat:removeSuggestion', '/psyrecrutement')
	-- Métier Agent Immobilier
		TriggerEvent('chat:removeSuggestion', '/immo')
		TriggerEvent('chat:removeSuggestion', '/immorecrutement')
	-- Métier Le Dragon D'or
		TriggerEvent('chat:removeSuggestion', '/restoa')
		TriggerEvent('chat:removeSuggestion', '/restoarecrutement')
	-- Métier RedWood
		TriggerEvent('chat:removeSuggestion', '/tabac')
		TriggerEvent('chat:removeSuggestion', '/tabacrecrutement')
	-- Métier Taxi
		TriggerEvent('chat:removeSuggestion', '/taxi')
		TriggerEvent('chat:removeSuggestion', '/taxirecrutement')
	-- Métier Tequi-La-La
		TriggerEvent('chat:removeSuggestion', '/tequi')
		TriggerEvent('chat:removeSuggestion', '/tequirecrutement')
	-- Métier The Last Train
		TriggerEvent('chat:removeSuggestion', '/train')
		TriggerEvent('chat:removeSuggestion', '/trainrecrutement')
	-- Métier Vignoble
		TriggerEvent('chat:removeSuggestion', '/vigne')
		TriggerEvent('chat:removeSuggestion', '/vignerecrutement')
	-- Métier Yellow Jack
		TriggerEvent('chat:removeSuggestion', '/yj')
		TriggerEvent('chat:removeSuggestion', '/yjrecrutement')
	-- Métier The Lost Bar
		TriggerEvent('chat:removeSuggestion', '/lostbar')
		TriggerEvent('chat:removeSuggestion', '/lostbarrecrutement')
	end
end)