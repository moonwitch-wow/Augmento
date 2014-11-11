------------------------------------------------------------------------
-- Namespaceing
------------------------------------------------------------------------
local _, Augmento = ...

local description = "Augmento is my own setup. I started out with a hacked version of oBindings by haste, it evolved into something more - and thanks to Phanx I\'ve rewritten it completely to be less rape-style.\nThere are no in game settings; all is done in Lua itself. Should you have downloaded this and installed it - congratulations, you\'ve just erased ALL your keybindings."
local credits = "I\'d like to thank Tekkub and Phanx and haste, Tekkub unbeknowingly inspired me, Phanx is just awesome, her patience with me is endless. Also; cats."
------------------------------------------------------------------------
-- Frame kick off
------------------------------------------------------------------------
local Panel = CreateFrame('Frame', nil)
Panel.name = Augmento
Panel:Hide()

-- Panel.childpanel = CreateFrame( "Frame", nil, Panel)
-- Panel.childpanel.name = ChildPanelName
-- Panel.childpanel:Hide()
--
-- -- Specify childness of this panel
-- Panel.childpanel.parent = Panel.name

------------------------------------------------------------------------
-- GUI widgets
------------------------------------------------------------------------

-----------------------------
-- Populating the panel itself (main panel)
Panel:SetScript('OnShow', function(self)
  local Title = self:CreateFontString(nil, Panel, 'GameFontNormalLarge')
  Title:SetPoint('TOPLEFT', 16, -16)
  Title:SetText(Augmento)

  local Author = self:CreateFontString(nil, Panel, 'GameFontNormal')
  Author:SetPoint('TOPLEFT', Title, 'BOTTOMLEFT', 0, -8)
  Author:SetPoint('RIGHT', -32, 0)
  Author:SetJustifyH('LEFT')
  Author:SetText(GetAddOnMetadata(Augmento, "Author"))
  -- self.Author = Author

  local Notes = self:CreateFontString(nil, Panel, 'GameFontNormal')
  Notes:SetPoint("TOPLEFT", Author, "BOTTOMLEFT", 0, 0)
  Notes:SetPoint("RIGHT", Panel, "RIGHT")
  Notes:SetText(description)

  local Credits = self:CreateFontString(nil, Panel, 'GameFontNormal')
  Credits:SetPoint("TOPLEFT", Notes, "BOTTOMLEFT", 0, 0)
  Credits:SetPoint("RIGHT", Panel, "RIGHT")
  Credits:SetText(credits)

  self:SetScript('OnShow', nil)
end)

-----------------------------
-- Add the panel to the Interface Options
InterfaceOptions_AddCategory(Panel)

-----------------------------
-- Add the child to the Interface Options
-- InterfaceOptions_AddCategory(Panel.childpanel)

-----------------------------
-- Adding a SlashCommand to open the correct Panel
SLASH_Addonname1 = '/Augmento'
SlashCmdList[Augmento] = function()
   InterfaceOptionsFrame_OpenToCategory(Augmento)
end
