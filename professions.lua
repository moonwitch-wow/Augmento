------------------------------------------------------------------------
-- Localization
------------------------------------------------------------------------
local _, Augmento = ...

------------------------------------------------------------------------
-- Adding a /prof command
------------------------------------------------------------------------
-- local profToUse = GetProfessionInfo(GetProfessions()) --Just use the first one since we've got tabs
--
-- local button = CreateFrame('Button', 'ProfButton', UIParent, 'SecureActionButtonTemplate, MagicButtonTemplate')
-- button:SetAttribute('type', 'macro')
-- button:SetAttribute('macrotext', '/use ' ..profToUse)

SLASH_PROF1 = '/prof'
SlashCmdList["PROF"] = function()
   ToggleSpellBook(BOOKTYPE_PROFESSION)
end

------------------------------------------------------------------------
-- Adding levels
------------------------------------------------------------------------

-- Enchanting vellum button
do
	function Augmento.ADDON_LOADED(addon)
		if(addon ~= 'Blizzard_TradeSkillUI' or InCombatLockdown()) then return end

		if(IsSpellKnown(13262)) then
			local button = CreateFrame('Button', 'TradeSkillVellumButton', TradeSkillCreateButton, 'SecureActionButtonTemplate, MagicButtonTemplate')
			button:SetPoint('TOPRIGHT', TradeSkillCreateButton, 'TOPLEFT')
			button:SetSize(80, 22)
			button:SetText('Scroll')
			button:SetAttribute('type', 'macro')
			button:SetAttribute('macrotext', '/click TradeSkillCreateButton\n/use item:38682')

			local enchanting = GetSpellInfo(7411)
			hooksecurefunc('TradeSkillFrame_Update', function()
				if(InCombatLockdown()) then
					return
				end

				if(IsTradeSkillGuild() or IsTradeSkillLinked()) then
					button:Hide()
				elseif(CURRENT_TRADESKILL == enchanting) then
					local _, _, _, _, service = GetTradeSkillInfo(TradeSkillFrame.selectedSkill)
					if(service == ENSCRIBE) then
						button:Show()

						if(TradeSkillCreateButton:IsEnabled() and GetItemCount(38682) > 0) then
							button:Enable()
						else
							button:Disable()
						end
					else
						button:Hide()
					end
				else
					button:Hide()
				end
			end)
		end
	end
end
