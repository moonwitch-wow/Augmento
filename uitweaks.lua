------------------------------------------------------------------------
-- Setting up the local scope so we can work in modules
------------------------------------------------------------------------
local _, Augmento = ...
local noop = function() end -- blargh

local soundFile = [=[Sound\Interface\ReadyCheck.wav]=]

function Augmento.ApplyUITweaks()
   -- Fix Macro font

end

------------------------------------------------------------------------
-- Slash Commands that shouldn't have been forgotten
SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame

------------------------------------------------------------------------
-- Toggle nameplates based on Combat
------------------------------------------------------------------------
-- function Augmento.PLAYER_REGEN_DISABLED(...)
--    SetCVar("nameplateShowEnemies", 1)
--    UIErrorsFrame:AddMessage('+ Combat', 1, 1, 1)
-- end

-- function Augmento.PLAYER_REGEN_ENABLED(...)
--    SetCVar("nameplateShowEnemies", 0)
--    UIErrorsFrame:AddMessage('- Combat', 1, 1, 1)
-- end

------------------------------------------------------------------------
-- Gimme a sound on :
-- LFG
-- PARTY INVITE
-- RAID BOSS START
------------------------------------------------------------------------
function Augmento.LFG_PROPOSAL_SHOW()
   PlaySoundFile(soundFile, 'Master')
end

ReadyCheckListenerFrame:SetScript('OnShow', function()
   PlaySoundFile(soundFile, 'Master')
end)

function Augmento.PARTY_INVITE_REQUEST()
   PlaySoundFile(soundFile, 'Master')
end

function Augmento.CHAT_MSG_RAID_BOSS_WHISPER(msg, name)
   if(name == UnitName('player') and msg == 'You are next in line!') then
      -- PlaySoundFile(soundFile, 'Master')
   end
end

------------------------------------------------------------------------
-- Enable sound in Cinematics
------------------------------------------------------------------------
function Augmento.CINEMATIC_START(boolean)
   SetCVar('Sound_EnableMusic', 1)
   SetCVar('Sound_EnableAmbience', 1)
   SetCVar('Sound_EnableSFX', 1)
end

function Augmento.CINEMATIC_STOP()
   SetCVar('Sound_EnableMusic', 0)
   SetCVar('Sound_EnableAmbience', 1)
   SetCVar('Sound_EnableSFX', 1)
end

------------------------------------------------------------------------
-- Selling greys and auto-repair
------------------------------------------------------------------------
function Augmento.MERCHANT_SHOW(...)
   --print('Merchant show triggered')

   if IsShiftKeyDown() then return end

   local junks, profit = 0, 0
   for bag = 0, 4 do
      for slot = 0, GetContainerNumSlots(bag) do
         local _, quantity, _, _, _, _, link = GetContainerItemInfo(bag, slot)
         if link then
            local _, _, quality, _, _, _, _, _, _, _, value = GetItemInfo(link)
            if quality == LE_ITEM_QUALITY_POOR then
               junks = junks + 1
               profit = profit + value
               UseContainerItem(bag, slot)
            end
         end
      end
   end
   if profit > 0 then
      print(format("Sold %s junk items for %s.", junks, GetMoneyString(profit)))
   end

   if CanMerchantRepair() then
      local repairAllCost, canRepair = GetRepairAllCost()
      if canRepair and repairAllCost > 0 then
         if CanGuildBankRepair() and not IsAltKeyDown() then
            local amount = GetGuildBankWithdrawMoney()
            local guildBankMoney = GetGuildBankMoney()
            if amount == -1 then
               amount = guildBankMoney
            else
               amount = min(amount, guildBankMoney)
            end
            if amount > repairAllCost then
               RepairAllItems(1)
               print(format("Repaired all items for %s from guild bank funds.", GetMoneyString(repairAllCost)))
               return
            else
               print("Insufficient guild bank funds to repair!")
            end
         elseif GetMoney() > repairAllCost then
            RepairAllItems()
            print(format("Repaired all items for %s.", GetMoneyString(repairAllCost)))
            return
         else
            print("Insufficient funds to repair!")
         end
      end
   end
end

------------------------------------------------------------------------
-- Auto-Accept Invites
------------------------------------------------------------------------
local IsFriend = function(name)
	for i=1, GetNumFriends() do
    if(GetFriendInfo(i)==name) then
      return true
    end
  end
	if(IsInGuild()) then
    for i=1, GetNumGuildMembers() do
      if(GetGuildRosterInfo(i)==name) then
        return true
      end
    end
  end
end

local ai = CreateFrame('Frame')
ai:RegisterEvent('PARTY_INVITE_REQUEST')
ai:SetScript('OnEvent', function(frame, event, name)
  if(IsFriend(name)) then
	   AcceptGroup()
	    print('Group invitation from |cffFFC354'..name..'|r accepted.')
		for i = 1, 4 do
			local frame = _G['StaticPopup'..i]
			if(frame:IsVisible() and frame.which=='PARTY_INVITE') then
				frame.inviteAccepted = 1
				StaticPopup_Hide('PARTY_INVITE')
				return
			end
		end
	else
		SendWho(name)
	end
end)
