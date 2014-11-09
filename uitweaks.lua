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