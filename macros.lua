------------------------------------------------------------------------
-- Namespaceing
------------------------------------------------------------------------
local _, Augmento = ...

------------------------------------------------------------------------
-- Macro's
------------------------------------------------------------------------
local _, class = UnitClass("player")
local currentSpec = GetSpecialization()
local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"

function Augmento.macroFactory(macroText, perChar)
   local arg1 = GetNumMacros()+1
   CreateMacro(string.sub(class, 1, 2)..arg1, "INV_Misc_QuestionMark", "#showtooltip\n"..macroText, perChar)
end

local macrolist = {
   "/cast [@mouseover] Power Word: Shield",
}

-- Get Talent Info
-- Name Macro based on first 2 letters of spec + increment of macroText
-- if spec -> create spec macro's
-- if no spec -> create only base macro's
-- args for CreateMacros(table[i], table[k], isPerChar if spec)