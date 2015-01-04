------------------------------------------------------------------------
-- Namespaceing
------------------------------------------------------------------------
-- local _, Augmento = ...
local addonName = ...

local description = "Augmento is my own setup. I started out with a hacked version of oBindings by haste, it evolved into something more - and thanks to Phanx I\'ve rewritten it completely to be less rape-style.\nThere are no in game settings; all is done in Lua itself. Should you have downloaded this and installed it - congratulations, you\'ve just erased ALL your keybindings."
local credits = "I\'d like to thank Tekkub and Phanx and haste, Tekkub unbeknowingly inspired me, Phanx is just awesome, her patience with me is endless. Also; cats."
------------------------------------------------------------------------
-- Frame kick off
------------------------------------------------------------------------
local Panel = CreateFrame('Frame', nil, InterfaceOptionsFramePanelContainer)
Panel.name = addonName
Panel:Hide()

-- Panel.childPanel = CreateFrame( "Frame", nil, Panel)
-- Panel.childPanel.name = ChildPanelName
-- Panel.childPanel:Hide()
--
-- -- Specify childness of this Panel
-- Panel.childPanel.parent = Panel.name

------------------------------------------------------------------------
-- GUI widgets
------------------------------------------------------------------------

-----------------------------
-- Populating the Panel itself (main Panel)
Panel:SetScript('OnShow', function(self)
  local Title = self:CreateFontString(nil, Panel, 'GameFontNormalLarge')
  Title:SetPoint('TOPLEFT', 16, -16)
  Title:SetText(addonName)

  local Author = self:CreateFontString(nil, Panel, 'GameFontNormal')
  Author:SetPoint('TOPLEFT', Title, 'BOTTOMLEFT', 0, -8)
  Author:SetPoint('RIGHT', -32, 0)
  Author:SetJustifyH('LEFT')
  Author:SetText(GetAddOnMetadata(addonName, "Author"))
  -- self.Panel.Author = Author

  local Notes = self:CreateFontString(nil, Panel, 'GameFontNormal')
  Notes:SetPoint("TOPLEFT", Author, "BOTTOMLEFT", 0, 0)
  Notes:SetPoint("RIGHT", Panel, "RIGHT")
  Notes:SetText(description)

  local creditsField = self:CreateFontString(nil, Panel, 'GameFontNormal')
  creditsField:SetPoint("TOPLEFT", Notes, "BOTTOMLEFT", 0, 0)
  creditsField:SetPoint("RIGHT", Panel, "RIGHT")
  creditsField:SetText(credits)

  self:SetScript('OnShow', nil)
end)

-----------------------------
-- Add the Panel to the Interface Options
InterfaceOptions_AddCategory(Panel)

-----------------------------
-- Add the child to the Interface Options
-- InterfaceOptions_AddCategory(Panel.childPanel)

-----------------------------
-- Adding a SlashCommand to open the correct Panel
SLASH_Augmento1 = '/augmento'
SLASH_Augmento2 = '/aug'
SlashCmdList[addonName] = function()
   InterfaceOptionsFrame_OpenToCategory(addonName)
   InterfaceOptionsFrame_OpenToCategory(addonName)
end
