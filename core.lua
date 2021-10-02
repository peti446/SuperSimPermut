
local _, addon = ...

local frame = nil;
local textbox = nil;
local eventFrame = nil
local co1 = nil
-- UI
addon.ExtraData={
	-- SimcData
	RegionString = {
	  [1] = 'us',
	  [2] = 'kr',
	  [3] = 'eu',
	  [4] = 'tw',
	  [5] = 'cn'
	},
	SpecNames = {
	-- Death Knight
	  [250] = 'Blood',
	  [251] = 'Frost',
	  [252] = 'Unholy',
	-- Demon Hunter
	  [577] = 'Havoc',
	  [581] = 'Vengeance',
	-- Druid 
	  [102] = 'Balance',
	  [103] = 'Feral',
	  [104] = 'Guardian',
	  [105] = 'Restoration',
	-- Hunter 
	  [253] = 'Beast Mastery',
	  [254] = 'Marksmanship',
	  [255] = 'Survival',
	-- Mage 
	  [62] = 'Arcane',
	  [63] = 'Fire',
	  [64] = 'Frost',
	-- Monk 
	  [268] = 'Brewmaster',
	  [269] = 'Windwalker',
	  [270] = 'Mistweaver',
	-- Paladin 
	  [65] = 'Holy',
	  [66] = 'Protection',
	  [70] = 'Retribution',
	-- Priest 
	  [256] = 'Discipline',
	  [257] = 'Holy',
	  [258] = 'Shadow',
	-- Rogue 
	  [259] = 'Assassination',
	  [260] = 'Outlaw',
	  [261] = 'Subtlety',
	-- Shaman 
	  [262] = 'Elemental',
	  [263] = 'Enhancement',
	  [264] = 'Restoration',
	-- Warlock 
	  [265] = 'Affliction',
	  [266] = 'Demonology',
	  [267] = 'Destruction',
	-- Warrior 
	  [71] = 'Arms',
	  [72] = 'Fury',
	  [73] = 'Protection'
	},
	RoleTable={
		-- Death Knight
		[250] = 'tank',
		[251] = 'attack',
		[252] = 'attack',
		-- Demon Hunter
		[577] = 'attack',
		[581] = 'tank',
		-- Druid
		[102] = 'spell',
		[103] = 'attack',
		[104] = 'tank',
		[105] = 'heal',
		-- Hunter
		[253] = 'attack',
		[254] = 'attack',
		[255] = 'attack',
		-- Mage
		[62] = 'spell',
		[63] = 'spell',
		[64] = 'spell',
		-- Monk
		[268] = 'tank',
		[269] = 'attack',
		[270] = 'hybrid',
		-- Paladin
		[65] = 'heal',
		[66] = 'tank',
		[70] = 'attack',
		-- Priest
		[256] = 'spell',
		[257] = 'heal',
		[258] = 'spell',
		-- Rogue
		[259] = 'attack',
		[260] = 'attack',
		[261] = 'attack',
		-- Shaman
		[262] = 'spell',
		[263] = 'attack',
		[264] = 'heal',
		-- Warlock
		[265] = 'spell',
		[266] = 'spell',
		[267] = 'spell',
		-- Warrior
		[71] = 'attack',
		[72] = 'attack',
		[73] = 'attack'
	},
	-- Permutation data
	GetItemInfoName = {
		["INVTYPE_HEAD"]=1,
		["INVTYPE_NECK"]=2,
		["INVTYPE_SHOULDER"]=3,
		["INVTYPE_CLOAK"]=4,
		["INVTYPE_CHEST"]=5,
		["INVTYPE_ROBE"]=5,
		["INVTYPE_WRIST"]=6,
		["INVTYPE_HAND"]=7,
		["INVTYPE_WAIST"]=8,
		["INVTYPE_LEGS"]=9,
		["INVTYPE_FEET"]=10,
		["INVTYPE_FINGER"]=11,
		["INVTYPE_TRINKET"]=12,
		["INVSLOT_MAINHAND"]=13,
		["INVSLOT_OFFHAND"]=14
	},
	SlotNames = {
		[1]="HeadSlot", 
		[2]="NeckSlot", 
		[3]="ShoulderSlot", 
		[4]="BackSlot", 
		[5]="ChestSlot", 
		[6]="ShirtSlot", 
		[7]="TabardSlot", 
		[8]="WristSlot", 
		[9]="HandsSlot", 
		[10]="WaistSlot", 
		[11]="LegsSlot", 
		[12]="FeetSlot", 
		[13]="Finger0Slot", 
		[14]="Finger1Slot", 
		[15]="Trinket0Slot", 
		[16]="Trinket1Slot", 
		[17]="MainHandSlot", 
		[18]="SecondaryHandSlot", 
		[19]="AmmoSlot" 
	},
	SimcSlotNames = {
		[1]="head",
		[2]="neck",
		[3]="shoulder",
		[4]="back",
		[5]="chest",
		[6]="shirt",
		[7]="tabard",
		[8]="wrist",
		[9]="hands",
		[10]="waist",
		[11]="legs",
		[12]="feet",
		[13]="finger1",
		[14]="finger2",
		[15]="trinket1",
		[16]="trinket2",
		[17]="main_hand",
		[18]="off_hand",
		[19]="ammo"
	},
	ListNames = {
		[1]="head",
		[2]="neck",
		[3]="shoulder",
		[4]="back",
		[5]="chest",
		[6]="wrist",
		[7]="hands",
		[8]="waist",
		[9]="legs",
		[10]="feet",
		[11]="finger",
		[12]="trinket",
		[13]="main hand",
		[14]="off hand"
	},
	PermutSimcNames = {
		[1]="head",
		[2]="neck",
		[3]="shoulder",
		[4]="back",
		[5]="chest",
		[6]="wrist",
		[7]="hands",
		[8]="waist",
		[9]="legs",
		[10]="feet",
		[11]="finger1",
		[12]="finger2",
		[13]="trinket1",
		[14]="trinket2",
		[15]="main_hand",
		[16]="off_hand"
	},
	PermutSlotNames = {
		[1]="HeadSlot", 
		[2]="NeckSlot", 
		[3]="ShoulderSlot", 
		[4]="BackSlot", 
		[5]="ChestSlot", 
		[6]="WristSlot", 
		[7]="HandsSlot", 
		[8]="WaistSlot", 
		[9]="LegsSlot", 
		[10]="FeetSlot", 
		[11]="Finger0Slot", 
		[12]="Finger1Slot", 
		[13]="Trinket0Slot", 
		[14]="Trinket1Slot", 
		[15]="MainHandSlot", 
		[16]="SecondaryHandSlot"
	},

	-- UI
	FrameMenu={
		[1] = "Gear permutation",
		[2] = "Talent permutation",
		[3] = "Add Items",
		[4] = "Options"
	},
	ReportTypeGear = {
		[1] = 'Item names',
		[2] = 'Copy number'
	},
	ReportTypeTalents = {
		[1] = 'Talents taken',
		[2] = 'Copy number'
	},
	enchantWeapon = {
		[0] 	= 'Untouched',
		[5946] 	= 'Coastal Surge',
		[5950] 	= 'Gale-Force Striking',
		[5949] 	= 'Torrent of Elements',
		[5948] 	= 'Siphoning',
		[5965] 	= 'Deadly Navigation',
		[5964] 	= 'Masterful Navigation',
		[5963] 	= 'Quick Navigation',
		[5966] 	= 'Stalwart Navigation',
		[5962] 	= 'Versatile Navigation',
		[999999]= 'Scrap ench.'
	},
	enchantRing = {
		[0] 	= 'Untouched',
		[5942] 	= '+37 Crit',
		[5943] 	= '+37 Haste',
		[5944] 	= '+37 Mast',
		[5945] 	= '+37 Vers',
		[999999]= 'Scrap ench.'
	},
	gemList = {
		[0] 	 = 'Untouched',
		[153710] = '+30 Crit',
		[153711] = '+30 Haste',
		[153713] = '+30 Mast',
		[153712] = '+30 Vers',
		[154126] = '+40 Crit',
		[154127] = '+40 Haste',
		[154129] = '+40 Mast',
		[154128] = '+40 Vers',
		[999999] = 'Scrap gem'
	},
	gemListEpic = {
		[0] 	   = 'No Epic gem',
		[130246] = '+40 Str',
		[130247] = '+40 Agi',
		[130248] = '+40 Int',
	}
}

-- SimC, tokenize function
function addon:tokenize(str)
  str = str or ""
  -- convert to lowercase and remove spaces
  str = string.lower(str)
  str = string.gsub(str, ' ', '_')
  str = string.gsub(str, ',', '_')

  -- strip trailing spaces
  if string.sub(str, str:len())=='_' then
    str = string.sub(str, 0, str:len()-1)
  end
  return str
end

function addon:GetItemsFromJurnal(isRaid) 
   local items = {}
   EJ_SelectTier(EJSuggestTab_GetPlayerTierIndex())
   local diffID = 23
   if(isRaid) then diffID = 16 end
   EJ_SetDifficulty(diffID)
   local i=1
   EJ_SetLootFilter(select(3,UnitClass("player")), select(1, GetSpecializationInfo(GetSpecialization())))
   while EJ_GetInstanceByIndex(i, isRaid) do
      local instanceId, name = EJ_GetInstanceByIndex(i, isRaid)
      EJ_SelectInstance(instanceId)
      i = i+1
      
      local j = 1
      while EJ_GetEncounterInfoByIndex(j, instanceId) do
         local name, _, encounterId = EJ_GetEncounterInfoByIndex(j, instanceId)
         EJ_SelectEncounter(encounterId)
         
         local amountLoot = EJ_GetNumLoot()
         if(amountLoot and amountLoot > 0) then
            local k = 1
            while k <= amountLoot and C_EncounterJournal.GetLootInfoByIndex(k, encounterID) do
               local itemInfo = C_EncounterJournal.GetLootInfoByIndex(k, encounterID)
               if(itemInfo) then
                  --Item id
				  table.insert(items, itemInfo)
               end
               k = k+1
            end
         end
         j = j+1
      end
   end
   
   return items
end

function addon:doCartesianALACON(tableToPermut)
	local i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14
	local tableReturn={}
	local itemsCalculated = 0
	for i1=1,#tableToPermut[1] do
		for i2=1,#tableToPermut[2] do
			for i3=1,#tableToPermut[3] do
				for i4=1,#tableToPermut[4] do
					for i5=1,#tableToPermut[5] do
						for i6=1,#tableToPermut[6] do
							for i7=1,#tableToPermut[7] do
								for i8=1,#tableToPermut[8] do
									for i9=1,#tableToPermut[9] do
										for i10=1,#tableToPermut[10] do
											for i11=1,#tableToPermut[11] do
												for i12=1,#tableToPermut[11] do
													if(tableToPermut[11][i11].id ~= tableToPermut[11][i12].id) then
														for i13=1,#tableToPermut[12] do
															for i14=1,#tableToPermut[12] do
																if(tableToPermut[12][i13].id ~= tableToPermut[12][i14].id) then
																	tableReturn[#tableReturn+1]={}
																	tableReturn[#tableReturn][1]=tableToPermut[1][i1]
																	tableReturn[#tableReturn][2]=tableToPermut[2][i2]
																	tableReturn[#tableReturn][3]=tableToPermut[3][i3]
																	tableReturn[#tableReturn][4]=tableToPermut[4][i4]
																	tableReturn[#tableReturn][5]=tableToPermut[5][i5]
																	tableReturn[#tableReturn][6]=tableToPermut[6][i6]
																	tableReturn[#tableReturn][7]=tableToPermut[7][i7]
																	tableReturn[#tableReturn][8]=tableToPermut[8][i8]
																	tableReturn[#tableReturn][9]=tableToPermut[9][i9]
																	tableReturn[#tableReturn][10]=tableToPermut[10][i10]
																	
																	--ring
																	tableReturn[#tableReturn][11]=tableToPermut[11][i11]
																	tableReturn[#tableReturn][12]=tableToPermut[11][i12]
																	
																	--trinket
																	tableReturn[#tableReturn][13]=tableToPermut[12][i13]
																	tableReturn[#tableReturn][14]=tableToPermut[12][i14]
																	
																	--TODO WEAPONS
																	
																	-- To not crash game
																	itemsCalculated = itemsCalculated +1
																	if(itemsCalculated > 25000) then
																		itemsCalculated = 0
																		coroutine.yield()
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	return tableReturn
end

function addon:GetPermutTableString() 
	local courutineGater = 0
	local maxCourutineNum = 500
	
	coroutine.yield()
	local raidItems = addon:GetItemsFromJurnal(true)
	coroutine.yield()
	local dungeonItems = addon:GetItemsFromJurnal(false)
	coroutine.yield()
	
	local Items = {}
	for i, itemInfo in ipairs(raidItems) do
		local equipLoc = select(9, GetItemInfo(itemInfo.itemID))
		if(addon.ExtraData.GetItemInfoName[equipLoc] ~= nil) then
			local simc_slot = addon.ExtraData.GetItemInfoName[equipLoc]
			if(not Items[simc_slot]) then
				Items[simc_slot] =  {}
			end
			local newItem = {
					["id"] = itemInfo.itemID,
					["bonus_id"] = "2564"
					}
			table.insert(Items[simc_slot], newItem)
		end
		-- Gate
		courutineGater = courutineGater +1
		if(courutineGater > maxCourutineNum) then
			courutineGater = 0
			coroutine.yield()
		end
	end
	--[ for i, itemInfo in ipairs(dungeonItems) do
	--	local equipLoc = select(9, GetItemInfo(itemInfo.itemID))
	--	if(addon.ExtraData.GetItemInfoName[equipLoc] ~= nil) then
	--		local simc_slot = addon.ExtraData.GetItemInfoName[equipLoc]
	--		if(not Items[simc_slot]) then
	--			Items[simc_slot] =  {}
	--		end
	--		local newItem = {
	--				["id"] = itemInfo.itemID,
	--				["bonus_id"] = "2564"
	--				}
	--		table.insert(Items[simc_slot], newItem)
	--	end
	--	-- Gate
	--	courutineGater = courutineGater +1
	--	if(courutineGater > maxCourutineNum) then
	--		courutineGater = 0
	--		coroutine.yield()
	--	end
	--end 
	coroutine.yield()
		print("Start permutations")
	-- local permuts = addon:doCartesianALACON(Items)
	print(#permuts)
	print("Finished permutations")
	coroutine.yield()
	-- Generate string
	local resultStringTable = {}
	print("Creating table")
	for i2,permutRow in pairs(permuts) do
		for slotNum, data in pairs(permutRow) do
			if(resultStringTable[addon.ExtraData.PermutSimcNames[slotNum]] == nil) then
				resultStringTable[addon.ExtraData.PermutSimcNames[slotNum]] = ""
			end
			resultStringTable[addon.ExtraData.PermutSimcNames[slotNum]] = resultStringTable[addon.ExtraData.PermutSimcNames[slotNum]] .. ",id=" .. data.id .. ",bonus_id="..data.bonus_id
		end
		-- Gate
		courutineGater = courutineGater +1
		if(courutineGater > maxCourutineNum) then
			print("Yelding creating string")
			courutineGater = 0
			coroutine.yield()
		end
	end
	
	return resultStringTable; 
end


function addon:CreateSimcTalentString()
  local talentInfo = {}
  local maxTiers = 7
  local maxColumns = 3
  for tier = 1, maxTiers do
    for column = 1, maxColumns do
      local talentID, name, iconTexture, selected, available = GetTalentInfo(tier, column, GetActiveSpecGroup())
      if selected then
        talentInfo[tier] = column
      end
    end
  end

  local str = ''
  for i = 1, maxTiers do
    if talentInfo[i] then
      str = str .. talentInfo[i]
    else
      str = str .. '0'
    end
  end

  return str
end

function addon:GenerateSimCString()
	print("Setting text")
	local playerName = UnitName('player')
	local _, playerClass, classID = UnitClass('player')
	local playerLevel = UnitLevel('player')
	local playerRealm = GetRealmName()
	local playerRegion = addon.ExtraData.RegionString[GetCurrentRegion()]
	local bPermut=false
	local slotId,itemLink
	local itemString = {}

	local playerRace = select(2, UnitRace('player'))
	local playerTalents = addon:CreateSimcTalentString()
	local playerSpec = addon.ExtraData.SpecNames[ GetSpecializationInfo(GetSpecialization()) ]
	
	-- Construct SimC-compatible strings from the basic information
	local player = ""
	playerClass = addon:tokenize(playerClass) 
	player = playerClass .. '="' .. playerName .. '"'
	playerLevel = 'level=' .. addon:tokenize(playerLevel)
	playerRace = 'race=' .. addon:tokenize(playerRace)
	playerRole = 'role=' .. addon.ExtraData.RoleTable[ GetSpecializationInfo(GetSpecialization())]
	playerSpec = 'spec=' .. addon:tokenize(playerSpec)
	playerRealm = 'server=' .. addon:tokenize(playerRealm)
	playerRegion = 'region=' .. addon:tokenize(playerRegion)
	playerTalents = 'talents=' .. playerTalents	

	-- Build the output string for the player (not including gear)
	local SimPermutProfile = player .. '\n'
	SimPermutProfile = SimPermutProfile .. playerLevel .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRace .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRegion .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRealm .. '\n'
	SimPermutProfile = SimPermutProfile .. playerRole .. '\n'
	SimPermutProfile = SimPermutProfile .. playerTalents .. '\n'
	SimPermutProfile = SimPermutProfile .. playerSpec .. '\n'

	--add custome simc parameters
	--SimPermutProfile = SimPermutProfile .. actualSettings.simcCommands.. '\n'
	
	SimPermutProfile = SimPermutProfile .. '\n'
	

	SimPermutProfile = SimPermutProfile .. "name=SuperSim\n"
		print("Setting text 2 ")
	local itemsPermutationsStringTable = addon:GetPermutTableString()
	local stringCalculated = 0
			print("Setting text 3 ")
	for i, string in ipairs(itemsPermutationsStringTable) do
		--if ( i ~= 1) then
		--	SimPermutProfile = SimPermutProfile .. "copy=copy"..i..", \"SuperSim\"\n"
		--end
		SimPermutProfile = SimPermutProfile .. string .. "\n"
		
		stringCalculated = stringCalculated +1
		if(stringCalculated > 300) then
			stringCalculated = 0
			coroutine.yield()
		end
	end


	
	eventFrame:hide()
	print("Setting text")
	textbox:SetText(SimPermutProfile)
	co1 = nil
end


eventFrame = CreateFrame("Frame", nil, UIParent)
eventFrame:SetScript("OnUpdate", function(self, elapsed)
	if(co1 ~= nil) then
		coroutine.resume(co1)
	end
end)
eventFrame:Hide()


SLASH_SUPERSIMSLASH1 = "/supersim"
-- Command UI
SlashCmdList["SUPERSIMSLASH"] = function (arg)
	if(frame == nil)
	then
		local f = CreateFrame("Frame",nil,UIParent, "BasicFrameTemplateWithInset")
		f:SetFrameStrata("BACKGROUND")
		f:SetWidth(500) -- Set these to whatever height/width is needed 
		f:SetHeight(600) -- for your Textur
		f:SetPoint("CENTER",0,0)
		f:SetMovable(true)
		f:EnableMouse(true)
		f:RegisterForDrag("LeftButton")
		f:SetScript("OnDragStart", f.StartMoving)
		f:SetScript("OnDragStop", f.StopMovingOrSizing)
		f.Select = CreateFrame("Button", "$parentSelect", f, "UIPanelButtonTemplate")
		f.Select:SetSize(14, 14)
		f.Select:SetPoint("RIGHT", f.Close, "LEFT")
		f.Select:SetText("S")
		f.Select:SetScript("OnClick", function(self)
			self:GetParent().Text:HighlightText() -- parameters (start, end) or default all
			self:GetParent().Text:SetFocus()
		end)

		f.SF = CreateFrame("ScrollFrame", "$parent_DF", f, "UIPanelScrollFrameTemplate")
		f.SF:SetPoint("TOPLEFT", f, 12, -30)
		f.SF:SetPoint("BOTTOMRIGHT", f, -30, 10)
		f.Text = CreateFrame("EditBox", nil, f.SF)
		f.Text:SetMultiLine(true)
		f.Text:SetSize(465, 170)
		f.Text:SetPoint("TOPLEFT", f.SF)
		f.Text:SetPoint("BOTTOMRIGHT", f.SF)
		f.Text:SetMaxLetters(99999)
		f.Text:SetFontObject(GameFontWhite)
		f.Text:SetAutoFocus(false)
		f.Text:SetScript("OnEscapePressed", function(self) self:ClearFocus() end) 
		f.Text:SetText("Generado el string esto puede datadar varios minutos") 
		f.SF:SetScrollChild(f.Text)
		
		textbox = f.Text
		frame = f
		--co1 = coroutine.create(addon.GenerateSimCString)
		--eventFrame:Show()
	end

	frame:Show()
end


