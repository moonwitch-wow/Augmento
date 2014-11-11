------------------------------------------------------------------------
-- Setting up the local scope so we can work in modules
------------------------------------------------------------------------
local _, Augmento = ...

function Augmento.ApplyUITweaks()
  -- Fix Macro font
  SystemFont_Shadow_Small:SetFont(STANDARD_TEXT_FONT, 12)
end

-- Slash Commands that shouldn't have been forgotten
SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame

SLASH_PROF1 = '/prof'
SLASH_PROF2 = '/professions'
SlashCmdList.PROF = function()
  CastSpell('Cooking')
end

------------------------------------------------------------------------
-- Toggle nameplates on while in combat
function Augmento.PLAYER_REGEN_DISABLED(...)
  SetCVar("nameplateShowEnemies", 1)

end

function Augmento.PLAYER_REGEN_ENABLED(...)
  SetCVar("nameplateShowEnemies", 0)
end
