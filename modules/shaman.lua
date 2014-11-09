------------------------------------------------------------------------
-- Load if Shaman
------------------------------------------------------------------------
local _, Augmento = ...

if(select(2, UnitClass('player') ~= 'SHAMAN')) then return end

-- local Augmento.bindings.shaman = {
--   -- Shields
--   SetBindingSpell("V", "Lightning Shield")
--   SetBindingSpell("SHIFT-V", "Water Shield")

--   -- Default spells
--   SetBindingSpell("Q", "Astral Shift")
--   SetBindingSpell("G", "Wind Shear")
--   SetBindingSpell("F", "Ascendance")
--   SetBindingSpell("U", "Far Sight")
-- }
