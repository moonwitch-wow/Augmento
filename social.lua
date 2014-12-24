------------------------------------------------------------------------
-- Setting up the local scope so we can work in modules
------------------------------------------------------------------------
local _, Augmento = ...

------------------------------------------------------------------------
-- AutoAccept Friends and Guilds party invites
function Augmento.PARTY_INVITE_REQUEST(name, l, f, g)
   if(QueueStatusMinimapButton:IsShown()) then return end
   if(l or f or g) then return end

   for index = 1, select(2, GetNumGuildMembers()) do
      if(GetGuildRosterInfo(index) == name) then
         return AcceptGroup()
      end
   end

   for index = 1, select(2, BNGetNumFriends()) do
      if(string.match(select(5, BNGetFriendInfo(index)), name)) then
         return AcceptGroup()
      end
   end

   for index = 1, GetNumFriends() do
      if(GetFriendInfo(index) == name) then
         return AcceptGroup()
      end
   end
end

function Augmento.PARTY_LEADER_CHANGED()
   if(StaticPopup_Visible('PARTY_INVITE')) then
      StaticPopup_Hide('PARTY_INVITE')
   elseif(StaticPopup_Visible('PARTY_INVITE_XREALM')) then
      StaticPopup_Hide('PARTY_INVITE_XREALM')
   end
end