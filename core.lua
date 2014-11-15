------------------------------------------------------------------------
-- Setting up the local scope so we can work in modules
-- Also creating a frame to handle - well the events to be
-- handled
------------------------------------------------------------------------
local _, Augmento = ...
local handler = CreateFrame("Frame")

------------------------------------------------------------------------
-- Functions - functions named after events for easy event tracking
------------------------------------------------------------------------
function Augmento.PLAYER_ENTERING_WORLD(...)
  ApplyMyBindings(true)
  ApplyMyOverrideBindings(true)
  ApplyDefaultActionBindings(nil, false)
  SaveBindings(2) -- 1: Account Wide, 2: Character Wide

  Augmento.ApplyUITweaks()
end

function Augmento.PLAYER_LOGOUT(...)
  -- Handle eventual logout events here.
end

------------------------------------------------------------------------
-- Many Whelps, handle Events
-- Events get registered if they are in the table
-- Augmento (Augmento.EVENT_TO_REGISTER_FOR)
------------------------------------------------------------------------
handler:SetScript('OnEvent', function(self, event, ...)
  Augmento[event](self, event, ...)
end)

for k, v in pairs(Augmento) do
  handler:RegisterEvent(k) -- Register all events for which handlers have been defined
end