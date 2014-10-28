function ApplyMyBindings(silent)
	ClearAllBindings()

	-- Movement
	SetBinding("E", "MOVEFORWARD")
	SetBinding("CTRL-E", "TOGGLEAUTORUN")
	SetBinding("BUTTON4", "TOGGLEAUTORUN")
	SetBinding("CTRL-SHIFT-E", "TOGGLERUN")
	SetBinding("S", "MOVEBACKWARD")
	SetBinding("SHIFT-S", "SITORSTAND")
	SetBinding("A", "STRAFELEFT")
	SetBinding("SHIFT-A", "TURNLEFT")
	SetBinding("D", "STRAFERIGHT")
	SetBinding("SHIFT-D", "TURNRIGHT")
	SetBinding("SPACE", "JUMP")

	-- Chat
	SetBinding("ENTER", "OPENCHAT")
	SetBinding("/", "OPENCHATSLASH")
	SetBinding("SHIFT-R", "REPLY")

	-- Actions
	SetBinding("SHIFT-UP", "PREVIOUSACTIONPAGE")
	SetBinding("SHIFT-MOUSEWHEELUP", "PREVIOUSACTIONPAGE")
	SetBinding("SHIFT-DOWN", "NEXTACTIONPAGE")
	SetBinding("SHIFT-MOUSEWHEELDOWN", "NEXTACTIONPAGE")

	-- Targeting
	SetBinding("TAB", "TARGETNEARESTENEMY")
	SetBinding("SHIFT-TAB", "TARGETNEARESTFRIEND")

	-- Attacking
	SetBinding("T", "STARTATTACK")
	SetBinding("SHIFT-T", "ASSISTTARGET")
	SetBinding("ALT-T", "INTERACTTARGET")

	-- Nameplates
	SetBinding("SHIFT-V", "NAMEPLATES")
	SetBinding("CTRL-V", "FRIENDNAMEPLATES")

	-- UI Panels
	SetBinding("ESCAPE", "TOGGLEGAMEMENU")
	SetBinding("B", "OPENALLBAGS")
	SetBinding("M", "TOGGLEWORLDMAP")
	SetBinding("SHIFT-M", "TOGGLEBATTLEFIELDMINIMAP")
	SetBinding("CTRL-M", "TOGGLEENCOUNTERJOURNAL")
	SetBinding("ALT-SHIFT-M", "TOGGLEWORLDSTATESCORES")
	SetBinding("F6", "TOGGLECHARACTER0")
	SetBinding("F7", "TOGGLESPELLBOOK")
	SetBinding("SHIFT-F7", "TOGGLEMOUNTJOURNAL")
	SetBinding("CTRL-F7", "TOGGLECOMPANIONJOURNAL")
	SetBinding("F8", "TOGGLETALENTS")
	SetBinding("F9", "TOGGLEQUESTLOG")
	SetBinding("F10", "TOGGLESOCIAL")
	SetBinding("SHIFT-F10", "TOGGLEGUILDTAB")
	SetBinding("F11", "TOGGLELFGPARENT")
	SetBinding("SHIFT-F11", "TOGGLECHARACTER4")
	SetBinding("F12", "TOGGLEACHIEVEMENT")

	-- UI Toggles
	SetBinding("ALT-Z", "TOGGLEUI")
	SetBinding("CTRL-R", "TOGGLEFPS")
	SetBinding("PRINTSCREEN", "SCREENSHOT")

	-- Camera
	SetBinding("MOUSEWHEELUP", "CAMERAZOOMIN")
	SetBinding("MOUSEWHEELDOWN", "CAMERAZOOMOUT")

	-- Vehicle Aim
	SetBinding("CTRL-MOUSEWHEELUP", "VEHICLEAIMUP")
	SetBinding("CTRL-MOUSEWHEELDOWN", "VEHICLEAIMDOWN")

	-- Addons
	SetBinding("`",				"CLICK Squire2Button:LeftButton")
	SetBinding("SHIFT-B",		"BAGNON_BANK_TOGGLE")
	SetBinding("ALT-CTRL-F",	"GOFISH_TOGGLE")
	SetBinding("ALT-SHIFT-F",	"HYDRA_FOLLOW")
	SetBinding("CTRL-F",		"HYDRA_FOLLOW_ME")
	SetBinding("I",				"EXAMINER_TARGET")
	SetBinding("ALT-I",			"EXAMINER_MOUSEOVER")
	SetBinding("ALT-SHIFT-L",	"CLICK LevelFlightButton:LeftButton")
	SetBinding("ALT-N",			"NOTEBOOK_PANEL")
	SetBinding("ALT-CTRL-R",	"RECOUNT_TOGGLE_MAIN")
--	SetBinding("ALT-X",			"CLICK CancelMyBuffsButton1:LeftButton")

	if not silent then
		print("Bindings applied.")
	end
end

function ApplyMyOverrideBindings(silent)
	local _, c = UnitClass("player")
	local _, r = UnitRace("player")
	local ob = {
		["ALT-Q"] = "MACRO QuestItem",
		["ALT-`"] = "ITEM Hearthstone",
	}

	-- Racial Abilities
	if r == "BloodElf" then
		ob["NUMPADMINUS"] = "SPELL Arcane Torrent"
	elseif r == "Orc" then
		ob["NUMPADMINUS"] = "SPELL Blood Fury"
	elseif r == "Tauren" then
		ob["NUMPADMINUS"] = "SPELL War Stomp"
	elseif r == "Troll" then
		ob["NUMPADMINUS"] = "SPELL Berserking"
	end

	-- Class Abilities
	if c == "DRUID" then
		-- Shapeshift Forms
		ob["F1"] = "MACRO Bear"
		ob["F2"] = "MACRO Aquatic"
		ob["F3"] = "MACRO Cat"
		ob["F4"] = "MACRO Travel"
		ob["F5"] = "MACRO Flight"

		ob["C"]  = "MACRO Cure"
		ob["G"]  = "MACRO Interrupt"
		ob["Q"]  = "MACRO Taunt"
		ob["W"]  = "MACRO Fire"
		ob["NUMPAD0"] = "MACRO Power"

	elseif c == "MONK" then
		ob["C"] = "MACRO Cure"
		ob["Q"] = "SPELL Roll"

	elseif c == "SHAMAN" then
--[[
		ob["ALT-`"]   = "MACRO Home"
		ob["W"] = "MACRO Shield"
		ob["Z"] = "MACRO Bind"
		ob["X"] = "MACRO Hex"
		ob["C"] = "MACRO Cure"
		ob["NUMPAD0"] = "MACRO Power"
		ob["NUMPADDECIMAL"] = "MACRO Defend"

		ob["CTRL-`"] = "SPELL Ghost Wolf"
		ob["G"] = "SPELL Wind Shear"
		ob["O"] = "SPELL Far Sight"
		ob["P"] = "SPELL Water Walking"
		ob["F1"] = "SPELL Earthbind Totem"
		ob["F2"] = "SPELL Searing Totem"
		ob["F3"] = "SPELL Healing Tide Totem"
		ob["F4"] = "SPELL Stormlash Totem"
		ob["F5"] = "SPELL Totemic Recall"
		ob["NUMPADPLUS"] = "SPELL Bloodlust"
		ob["NUMPAD1"] = "SPELL Ascendance"
		ob["NUMPAD2"] = "SPELL Spirit Walk"
		ob["NUMPAD3"] = "SPELL Astral Shift"
		ob["NUMPADDIVIDE"] = "SPELL Earth Elemental Totem"
		ob["NUMPADMULTIPLY"] = "SPELL Fire Elemental Totem"
]]
	elseif c == "PALADIN" then
--[[
		ob["G"] = "MACRO Interrupt"
		ob["Q"] = "SPELL Reckoning"

		ob["F1"] = "SPELL Righteous Fury"
		ob["F2"] = "SPELL Seal of Truth"
		ob["F3"] = "SPELL Seal of Righteousness"
		ob["F4"] = "SPELL Seal of Insight"

		ob["NUMPADMINUS"] = "SPELL Avenging Wrath"
		ob["NUMPADPLUS"]  = "SPELL Holy Avenger"

		ob["NUMPADDECIMAL"] = "SPELL Ardent Defender"
		ob["NUMPAD0"] = "SPELL Guardian of Ancient Kings"
		ob["NUMPAD3"] = "SPELL Divine Protection"
		ob["NUMPAD2"] = "SPELL Divine Shield"
		ob["NUMPAD6"] = "SPELL Devotion Aura"
]]
	elseif c == "WARLOCK" then
--[[
	              T	PETATTACK

					  G	MACRO Teleport
					  W	MACRO Soulshatter
		  NUMPADPLUS	MACRO Power

					  O	Unending Breath
					  P	Eye of Kilrogg

					  V	Enslave Demon
					  X	Fear
					  Z	Banish

					 F4	Ember Tap
					 F5	Flames of Xoroth
			  NUMPAD0	Unending Resolve
	  NUMPADDECIMAL	Twilight Ward

					  Q	Havoc
		NUMPADDIVIDE	Summon Terrorguard
	 NUMPADMULTIPLY	Summon Abyssal
		  NUMPADPLUS	Dark Soul: Instability
			  NUMPAD9	Dark Intent
--]]
	end

	for key, action in pairs(ob) do
		SetOverrideBinding(PhanxBindFrame, nil, key, action)
	end

	if not silent then
		print("Override bindings applied.")
	end
end

function ApplyDefaultActionBindings(full, silent)
	SetBinding("1", "ACTIONBUTTON1")
	SetBinding("2", "ACTIONBUTTON2")
	SetBinding("3", "ACTIONBUTTON3")
	SetBinding("4", "ACTIONBUTTON4")
	SetBinding("5", "ACTIONBUTTON5")
	SetBinding("6", "ACTIONBUTTON6")

	if not full then
		if not silent then
			print("Bindings applied for action buttons 1-6.")
		end
		return
	end

	SetBinding("7", "ACTIONBUTTON7")
	SetBinding("8", "ACTIONBUTTON8")
	SetBinding("9", "ACTIONBUTTON9")
	SetBinding("0", "ACTIONBUTTON10")
	SetBinding("-", "ACTIONBUTTON11")
	SetBinding("=", "ACTIONBUTTON12")

	if not silent then
		print("Bindings applied for action buttons 1-12.")
	end
end

SetBinding("ESCAPE", "TOGGLEGAMEMENU")
SetBinding("/", "OPENCHATSLASH")

local f = CreateFrame("Frame", "PhanxBindFrame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	ApplyMyBindings(true)
	ApplyMyOverrideBindings(true)
	ApplyDefaultActionBindings(nil, true)
end)

------------------------------------------------------------------------
--	ClearAllBindings()
--		Removes all bindings, and then applies the following bindings:
--			[1] ESC -> Toggle main menu
--			[2] / -> Open chat input box with a pre-filled slash
------------------------------------------------------------------------

function ClearAllBindings()
	for i = 1, GetNumBindings() do
		for j = select( "#", GetBinding( i ) ), 2, -1 do
			local b = select( j, GetBinding( i ) )
			if b then
				SetBinding( b )
			end
		end
	end
	SetBinding( "ESCAPE", "TOGGLEGAMEMENU" )
	SetBinding( "/", "OPENCHATSLASH" )
end

------------------------------------------------------------------------
--	GetBindingFriendlyActionText(command)
--		Turns a binding command into a human-readable description of
--		the action to be performed when the binding is activated.
--		Accepts:
--			[1] command (string)
--		Returns:
--			[1] text (string)
------------------------------------------------------------------------

function GetBindingFriendlyActionText( command )
	local action, target = command:match( "^(%S+) ?(.*)$" )
	if action == "CLICK" then
		local button, click = target:match( "([^:]+):?(.*)" )
		return format( "Click with %s on %s", click or "LeftButton", button )
	elseif action == "ITEM" then
		return format( "Use item %s", target )
	elseif action == "MACRO" then
		return format( "Run macro %s", target )
	elseif action == "SPELL" then
		return format( "Cast spell %s", target )
	elseif action:sub( 1, 12 ) == "ACTIONBUTTON" then
		action = tonumber( action:match( "%d+" ) )
		local type, spell, subtype = GetActionInfo( action )
		if type == "companion" then
			spell = select( 2, GetCompanionInfo( "CRITTER", spell ) )
			return format( "Summon %s %s", subtype == "CRITTER" and "companion" or "mount", spell )
		elseif type == "equipmentset" then
			return format( "Equip set %s", spell )
		elseif type == "item" then
			spell = GetItemInfo( spell )
			return format( "Use item %s", spell )
		elseif type == "macro" then
			spell = GetMacroInfo( spell )
			return format( "Run macro %s", spell )
		elseif type == "spell" then
			spell = GetSpellInfo( spell )
			return format( "Cast spell %s", spell )
		else
			return GetBindingText( command, "BINDING_NAME_" )
		end
	elseif action:sub( 1, 18 ) == "BONUSACTIONBUTTON" then
		action = tonumber( action:match( "%d+" ) )
		local skill = GetPetActionInfo( action )
		if action then
			return format( "Use pet action %s", action )
		else
			return GetBindingText( command, "BINDING_NAME_" )
		end
	elseif action:sub( 1, 16 ) == "SHAPESHIFTBUTTON" then
		action = tonumber( action:match( "%d+" ) )
		local form = select( 2, GetShapeshiftFormInfo( action ) )
		if form then
			return format( "Change stance to %s", form )
		else
			return GetBindingText( command, "BINDING_NAME_" )
		end
	else
		return GetBindingText( command, "BINDING_NAME_" )
	end
end

------------------------------------------------------------------------
--	DumpBindings(raw)
--		Lists all currently active bindings and their descriptions.
--		Accepts:
--			[1] raw (boolean)
--				Controls whether binding commands and descriptions
--				are converted into friendly texts or listed as-is.
--		Returns:
--			none
------------------------------------------------------------------------

function DumpBindings(raw)
	for i = 1, GetNumBindings() do
		local command = GetBinding( i )
		if command ~= "NONE" then
			for j = 2, select( "#", GetBinding( i ) ) do
				local key = select( j, GetBinding( i ) )
				if raw then
					print( key, "==>", command )
				else
					print( GetBindingText( key, "KEY_" ), "==>", GetBindingFriendlyActionText( command ) )
				end
			end
		end
	end
end