local _, Augmento = ...
------------------------------------------------------------------------
-- Toggle nameplates on while in combat

function Augmento.PLAYER_REGEN_DISABLED(event)
  --self:Debug(event)
  if db.showNameplatesInCombat then
    SetCVar("nameplateShowEnemies", 1)
  end
  if summonPending then
    self:StopSummonDelayTimer()
  end
function Augmento.ApplyUITweaks()
  -- Fix Macro font
  SystemFont_Shadow_Small:SetFont(STANDARD_TEXT_FONT, 12)
end

function Augmento.PLAYER_REGEN_ENABLED(event)
  --self:Debug(event)
  if db.showNameplatesInCombat then
    SetCVar("nameplateShowEnemies", 0)
  end
  if summonPending then
    self:StartSummonDelayTimer()
  end
end