------------------------------------------------------------------------
-- Localizing and loading the addon DB
------------------------------------------------------------------------
local _, Augmento = ...
local bindFrame = CreateFrame("frame")

------------------------------------------------------------------------
-- Basic Bindings
------------------------------------------------------------------------
function ApplyMyBindings(silent)
  ClearAllBindings() -- Since we're hardwiring these; no need to keep some ;P

  -- Movement
  SetBinding("W", "MOVEFORWARD")
  SetBinding("SHIFT-W", "TOGGLEAUTORUN")
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

  -- ActionPages
  SetBinding("SHIFT-UP", "PREVIOUSACTIONPAGE")
  SetBinding("SHIFT-MOUSEWHEELUP", "PREVIOUSACTIONPAGE")
  SetBinding("SHIFT-DOWN", "NEXTACTIONPAGE")
  SetBinding("SHIFT-MOUSEWHEELDOWN", "NEXTACTIONPAGE")

  -- Targeting
  SetBinding("TAB", "TARGETNEARESTENEMY")
  SetBinding("SHIFT-TAB", "TARGETNEARESTFRIEND")
  SetBinding("F2", "FOCUSTARGET")
  SetBinding("F3", "TARGETFOCUS")

  -- Attacking
  SetBinding("T", "STARTATTACK")
  SetBinding("SHIFT-T", "ASSISTTARGET")
  SetBinding("ALT-T", "INTERACTTARGET")

  -- UI Panels
  SetBinding("ESCAPE", "TOGGLEGAMEMENU")
  SetBinding("B", "OPENALLBAGS")
    -- Maps 'n Quests
  SetBinding("M", "TOGGLEWORLDMAP")
  SetBinding("SHIFT-M", "TOGGLEBATTLEFIELDMINIMAP")
  SetBinding("L", "TOGGLEQUESTLOG")
    -- Character
  SetBinding("F9", "TOGGLECHARACTER0")
  SetBinding("SHIFT-F9", "TOGGLESPELLBOOK")
  SetBinding("CTRL-F9",  "TOGGLETALENTS")
    -- Pets 'n mounts
  SetBinding("K", "TOGGLECOLLECTIONS")
  SetBinding("SHIFT-K", "TOGGLECOLLECTIONSMOUNTJOURNAL")
  SetBinding("O", "TOGGLESOCIAL")
  SetBinding("SHIFT-O", "TOGGLEGUILDTAB")

  SetBinding("F11", "TOGGLEDUNGEONSANDRAIDS") --groupfinder
  SetBinding("SHIFT-F11", "TOGGLEENCOUNTERJOURNAL")



  -- UI Toggles
  -- SetBinding("ALT-Z", "TOGGLEUI")
  -- SetBinding("CTRL-R", "TOGGLEFPS")

  -- Camera
  -- SetBinding("MOUSEWHEELUP", "CAMERAZOOMIN")
  -- SetBinding("MOUSEWHEELDOWN", "CAMERAZOOMOUT")

  -- -- Vehicle Aim
  -- SetBinding("CTRL-MOUSEWHEELUP", "VEHICLEAIMUP")
  -- SetBinding("CTRL-MOUSEWHEELDOWN", "VEHICLEAIMDOWN")

  -- Addons
  SetBinding("CTRL-V", "SPELL SummonRandomFavoriteMount")
  SetBinding("F12", "CLICK CorkFrame:LeftButton")

  if not silent then
    print("Bindings applied.")
  end
end

function ApplyMyOverrideBindings(silent)
  local _, class = UnitClass("player")
  local _, race = UnitRace("player")
  local ob = {
    -- ["ALT-Q"] = "MACRO QuestItem",
    -- ["ALT-`"] = "ITEM Hearthstone",
  }

  --  -- Racial Abilities
  --  if r == "BloodElf" then
  --    ob["NUMPADMINUS"] = "SPELL Arcane Torrent"
  --  elseif r == "Orc" then
  --    ob["NUMPADMINUS"] = "SPELL Blood Fury"
  --  elseif r == "Tauren" then
  --    ob["NUMPADMINUS"] = "SPELL War Stomp"
  --  elseif r == "Troll" then
  --    ob["NUMPADMINUS"] = "SPELL Berserking"
  --  end

  -- Class Abilities
  if class == "DRUID" then
  --    -- Shapeshift Forms
  --    ob["F1"] = "MACRO Bear"
  --    ob["F2"] = "MACRO Aquatic"
  --    ob["F3"] = "MACRO Cat"
  --    ob["F4"] = "MACRO Travel"
  --    ob["F5"] = "MACRO Flight"

  --    ob["C"]  = "MACRO Cure"
  --    ob["G"]  = "MACRO Interrupt"
  --    ob["Q"]  = "MACRO Taunt"
  --    ob["W"]  = "MACRO Fire"
  --    ob["NUMPAD0"] = "MACRO Power"
  elseif class == "SHAMAN" then
    -- Shields
    ob["V"] = "SPELL Lightning Shield"
    ob["Q"] = "SPELL Astral Shift"
  --    ob["W"] = "MACRO Shield"
  --    ob["Z"] = "MACRO Bind"
  --    ob["X"] = "MACRO Hex"
  --    ob["C"] = "MACRO Cure"
  --    ob["NUMPAD0"] = "MACRO Power"
  --    ob["NUMPADDECIMAL"] = "MACRO Defend"

  --    ob["CTRL-`"] = "SPELL Ghost Wolf"
  --    ob["G"] = "SPELL Wind Shear"
  --    ob["O"] = "SPELL Far Sight"
  --    ob["P"] = "SPELL Water Walking"
  --    ob["F1"] = "SPELL Earthbind Totem"
  --    ob["F2"] = "SPELL Searing Totem"
  --    ob["F3"] = "SPELL Healing Tide Totem"
  --    ob["F4"] = "SPELL Stormlash Totem"
  --    ob["F5"] = "SPELL Totemic Recall"
  --    ob["NUMPADPLUS"] = "SPELL Bloodlust"
  --    ob["NUMPAD1"] = "SPELL Ascendance"
  --    ob["NUMPAD2"] = "SPELL Spirit Walk"
  --    ob["NUMPAD3"] = "SPELL Astral Shift"
  --    ob["NUMPADDIVIDE"] = "SPELL Earth Elemental Totem"
  --    ob["NUMPADMULTIPLY"] = "SPELL Fire Elemental Totem"
  elseif class == "PRIEST" then

  elseif class == "WARLOCK" then
    ob["Q"] = "SPELL Life Tap"

  elseif class == "MAGE" then

  elseif class == "MONK" then

  end

  for key, action in pairs(ob) do
    SetOverrideBinding(bindFrame, false, key, action)
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
  SetBinding("7", "ACTIONBUTTON7")
  SetBinding("8", "ACTIONBUTTON8")

  -- Ensuring my Shift Macro's work, so this UNbinds the shifties.
  SetBinding("SHIFT-1")
  SetBinding("SHIFT-2")
  SetBinding("SHIFT-3")
  SetBinding("SHIFT-4")
  SetBinding("SHIFT-5")
  SetBinding("SHIFT-6")
  SetBinding("SHIFT-7")
  SetBinding("SHIFT-8")
  SetBinding("SHIFT-9")
  SetBinding("SHIFT-0")
  SetBinding("SHIFT--")
  SetBinding("SHIFT-=")

  if not full then
    if not silent then
      print("Bindings applied for action buttons 1-8.")
    end
    return
  end

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



------------------------------------------------------------------------
--  ClearAllBindings()
--    Removes all bindings, and then applies the following bindings:
--      [1] ESC -> Toggle main menu
--      [2] / -> Open chat input box with a pre-filled slash
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