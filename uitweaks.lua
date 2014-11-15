------------------------------------------------------------------------
-- Setting up the local scope so we can work in modules
------------------------------------------------------------------------
local _, Augmento = ...

local soundFile = [=[Sound\Interface\ReadyCheck.wav]=]

function Augmento.ApplyUITweaks()
   -- Fix Macro font
   SystemFont_Shadow_Small:SetFont(STANDARD_TEXT_FONT, 12)
end

------------------------------------------------------------------------
-- Slash Commands that shouldn't have been forgotten
SlashCmdList['RELOAD_UI'] = function() ReloadUI() end
SLASH_RELOAD_UI1 = '/rl'

SLASH_TICKETGM1 = '/gm'
SlashCmdList.TICKETGM = ToggleHelpFrame

SLASH_PROF1 = '/prof'
SLASH_PROF2 = '/professions'
SlashCmdList.PROF = function()
  CastSpell('Cooking')
------------------------------------------------------------------------
-- Filtering on Achievements and Guild
------------------------------------------------------------------------
function Augmento.ADOON_LOADED(addon)
   if(addon == 'Blizzard_AchievementUI') then
      AchievementFrame_SetFilter(3)
   elseif(addon == 'Blizzard_GuildUI') then
      GuildFrame:HookScript('OnShow', function()
         GuildFrameTab2:Click()
      end)
   end
end

------------------------------------------------------------------------
-- Toggle nameplates on while in combat and sound a bell.

function Augmento.PLAYER_REGEN_DISABLED(...)
   SetCVar("nameplateShowEnemies", 1)
   UIErrorsFrame:AddMessage('+ Combat', 1, 1, 1)
end

function Augmento.PLAYER_REGEN_ENABLED(...)
   SetCVar("nameplateShowEnemies", 0)
   UIErrorsFrame:AddMessage('- Combat', 1, 1, 1)
end

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
-- Sell your shit

-- Parse Gold/Silver/Copper
local function money_to_string(value)
  if value == 0 then return nil end

  local gold = math.floor(value / 10000)
  local silver = mod(math.floor(value / 100), 100)
  local copper = mod(value, 100)

  return string.format("|cffffd700%i|r.|cffc7c7cf%02i|r.|cffeda55f%02i|r", gold, silver, copper)
end

function Augmento.MERCHANT_SHOW(...)
   -- Auto-Repair from guild without shiftkey, if shiftkey is down, don't repair at all.
   if not CanMerchantRepair() or IsShiftKeyDown() then
      return
   else
      if (IsInGuild() and CanGuildBankRepair() and not IsShiftKeyDown()) then -- can we repair from this dude?
         RepairAllItems(CanGuildBankRepair() and GetGuildBankWithdrawMoney() >= GetRepairAllCost())
         if GetRepairAllCost() > 0 then
            print('Guild repaired for : '.. money_to_string(GetRepairAllCost()))
         end
      else
         RepairAllItems()
         if GetRepairAllCost() > 0 then
            print('Repaired for : '.. money_to_string(GetRepairAllCost()))
         end
      end
   end

   -- sell off junk
   local bag, slot
   local valueSold = 0, 0

   for bag = 0, 4 do
      for slot = 0, GetContainerNumSlots(bag) do
         local _, count, _, _, _, _, link = GetContainerItemInfo(bag, slot)
         if link then
            local _, _, quality, _, _, _, _, _, _, _, vendorPrice = GetItemInfo(link)

            if quality == 0 and vendorPrice > 0 then
               ShowContainerSellCursor(bag, slot)
               UseContainerItem(bag, slot)
               valueSold = valueSold + vendorPrice * count
            end
         end
      end
   end

   if valueSold > 0 then
      print('Sold Junk : ', money_to_string(valueSold))
   end
end