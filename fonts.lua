------------------------------------------------------------------------
-- Localization
------------------------------------------------------------------------
local _, Augmento = ...

local BigNoodle = "Interface\\AddOns\\Augmento\\media\\big_noodle_titling.ttf"
local dmgFontSize = 24
local fFlags = nil

local function CreateFontObj(obj, font, size, style, shadow)
	obj:SetFont(font, size, style)
  if shadow then
    obj:SetShadowColor(0,0,0)
    obj:SetShadowOffset(1,-1)
  end
end

function Augmento.ApplySystemFonts()
	DAMAGE_TEXT_FONT = BigNoodle
  -- NAMEPLATE_FONT     = font4
  -- STANDARD_TEXT_FONT = font3
  -- UNIT_NAME_FONT

  CreateFontObj(ZoneTextString, BigNoodle, 60, "NONE", true)
  CreateFontObj(SubZoneTextString, BigNoodle, 60, "NONE", true)
  CreateFontObj(PVPInfoTextString, BigNoodle, 16, "NONE", true)
  CreateFontObj(PVPArenaTextString, BigNoodle, 16, "NONE", true)
  CreateFontObj(SystemFont_Shadow_Small, STANDARD_TEXT_FONT, 12) -- macro font
  CreateFontObj(QuestTitleFont, BigNoodle, 20, true) -- quest title font

  -- Derived fonts
  CreateFontObj(BossEmoteNormalHuge, BigNoodle, 27, "THINOUTLINE", true)
  CreateFontObj(WorldMapTextFont, BigNoodle, 32, "THINOUTLINE", true)

	-- Objective tracker shit
	-- CreateFontObj(ObjectiveFont, BigNoodle, 14, nil, true) -- Actual objectives
	CreateFontObj(GameFontNormalMed2, BigNoodle, 20, nil, true) -- Actual objectives
	CreateFontObj(QuestFont_Large, BigNoodle, 20, nil, true) -- Actual objectives

  -- Base fonts
	-- SetFont(AchievementFont_Small, BOLD, 12)
	-- SetFont(NumberFont_OutlineThick_Mono_Small, NUMBER, 13, "OUTLINE")
	-- SetFont(NumberFont_Outline_Huge, NUMBER, 30, "THICKOUTLINE", 30)
	-- SetFont(NumberFont_Outline_Large, NUMBER, 17, "OUTLINE")
	-- SetFont(NumberFont_Outline_Med, NUMBER, 15, "OUTLINE")
	-- SetFont(NumberFont_Shadow_Med, NORMAL, 14)
	-- SetFont(NumberFont_Shadow_Small, NORMAL, 12)
	-- SetFont(QuestFont_Shadow_Small, NORMAL, 16)
	-- SetFont(QuestFont_Large, NORMAL, 16)
	-- SetFont(QuestFont_Shadow_Huge, BOLD, 19, nil, nil, nil, nil, 0.54, 0.4, 0.1)
	-- SetFont(QuestFont_Super_Huge, BOLD, 24)
	-- SetFont(ReputationDetailFont,                 BOLD, 12, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	-- SetFont(SpellFont_Small,                      BOLD, 11)
	-- SetFont(SystemFont_InverseShadow_Small,       BOLD, 11)
	-- SetFont(SystemFont_Large,                   NORMAL, 17)
	-- SetFont(SystemFont_Med1,                    NORMAL, 13)
	-- SetFont(SystemFont_Med2,                    ITALIC, 14, nil, 0.15, 0.09, 0.04)
	-- SetFont(SystemFont_Med3,                    NORMAL, 15)
	-- SetFont(SystemFont_OutlineThick_Huge2,      NORMAL, 22, "THICKOUTLINE")
	-- SetFont(SystemFont_OutlineThick_Huge4,  BOLDITALIC, 27, "THICKOUTLINE")
	-- SetFont(SystemFont_OutlineThick_WTF,    BOLDITALIC, 31, "THICKOUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)
	-- SetFont(SystemFont_Outline_Small,           NUMBER, 13, "OUTLINE")
	-- SetFont(SystemFont_Shadow_Huge1,              BOLD, 20)
	-- SetFont(SystemFont_Shadow_Huge3,              BOLD, 25)
	-- SetFont(SystemFont_Shadow_Large,            NORMAL, 17)
	-- SetFont(SystemFont_Shadow_Med1,             NORMAL, 13)
	-- SetFont(SystemFont_Shadow_Med2,             NORMAL, 14)
	-- SetFont(SystemFont_Shadow_Med3,             NORMAL, 15)
	-- SetFont(SystemFont_Shadow_Outline_Huge2,    NORMAL, 22, "OUTLINE")
	-- SetFont(SystemFont_Shadow_Small,              BOLD, 11)
	-- SetFont(SystemFont_Small,                   NORMAL, 12)
	-- SetFont(SystemFont_Tiny,                    NORMAL, 11)
	-- SetFont(Tooltip_Med,                        NORMAL, 13)
	-- SetFont(Tooltip_Small,                        BOLD, 12)
	-- SetFont(WhiteNormalNumberFont,                BOLD, 11)
end

function Augmento.SetDmgFont()
	-- DAMAGE_TEXT_FONT = BigNoodle
	-- NUM_COMBAT_TEXT_LINES = 20;
	-- COMBAT_TEXT_SCROLLSPEED = 1.0;
	-- COMBAT_TEXT_FADEOUT_TIME = 1.0;
	-- COMBAT_TEXT_HEIGHT = 18;
	-- COMBAT_TEXT_CRIT_MAXHEIGHT = 2.0;
	-- COMBAT_TEXT_CRIT_MINHEIGHT = 1.2;
	-- COMBAT_TEXT_CRIT_SCALE_TIME = 0.7;
	-- COMBAT_TEXT_CRIT_SHRINKTIME = 0.2;
	-- COMBAT_TEXT_TO_ANIMATE = {};
	-- COMBAT_TEXT_STAGGER_RANGE = 20;
	-- COMBAT_TEXT_SPACING = 7;
	-- COMBAT_TEXT_MAX_OFFSET = 130;
	-- COMBAT_TEXT_LOW_HEALTH_THRESHOLD = 0.2;
	-- COMBAT_TEXT_LOW_MANA_THRESHOLD = 0.2;
	-- COMBAT_TEXT_LOCATIONS = {};

  local fName, fHeight, fFlags = CombatTextFont:GetFont()
  CombatTextFont:SetFont(BigNoodle, dmgFontSize, fFlags)
end
------------------------------------------------------
------------------------------------------------------

-- REFERRENCE

-- If you want to add a colour value to the font string you have to add 3 more numbers at the end representing rgb values
-- Like this:
-- QuestTitleFontBlackShadow:SetFont(font1, 16, "THINOUTLINE", 0, 0, 0, 1, -1, 1.0, 0.82, 0)
-- However, I'm fairly sure many font colours are set globally and will overule this (such as reaction, difficulty or rep colours)
-- ALSO - Addons like Aurora are changing many of the fonts too and might overule these changes

-- Names of some font strings taken from the old AfterFonts addon:
-- (these may be depreciated for all I know, but a few definitely work)

-- AchievementFont_Small
-- NumberFont_OutlineThick_Mono_Small
-- NumberFont_Outline_Huge
-- NumberFont_Outline_Large
-- NumberFont_Outline_Med
-- NumberFont_Shadow_Med
-- NumberFont_Shadow_Small
-- SystemFont_InverseShadow_Small
-- SystemFont_Large
-- SystemFont_Med1
-- SystemFont_Med2
-- SystemFont_Med3
-- SystemFont_OutlineThick_Huge2
-- SystemFont_OutlineThick_Huge4
-- SystemFont_OutlineThick_WTF
-- SystemFont_Outline_Small
-- SystemFont_Shadow_Huge1
-- SystemFont_Shadow_Huge3
-- SystemFont_Shadow_Large
-- SystemFont_Shadow_Med1
-- SystemFont_Shadow_Med3
-- SystemFont_Shadow_Outline_Huge2
-- SystemFont_Shadow_Small
-- SystemFont_Small
-- SystemFont_Tiny
-- ReputationDetailFont
-- ItemTextFontNormal
-- DialogButtonNormalText
-- InvoiceTextFontNormal
-- InvoiceTextFontSmall
-- MailTextFontNormal
-- GameFontHighlightSmall
-- GameFontNormalSmall
-- GameFontDisableSmall
-- GameFontNormalHuge
-- GameFontNormalLarge
-- GameFontHighlight
-- GameFontDisable
-- GameFontNormal
-- GameFontBlackMedium
-- GameFontHighlightMedium
-- SubSpellFont
-- NumberFontNormalSmall
-- NumberFontNormal
-- NumberFontNormalLarge
-- NumberFontNormalHuge
-- WorldMapTextFont
-- MovieSubtitleFont
-- AchievementPointsFont
-- AchievementPointsFontSmall
-- AchievementDateFont
-- AchievementCriteriaFont
-- AchievementDescriptionFont
-- FriendsFont_Large
-- FriendsFont_Normal
-- FriendsFont_Small
-- FriendsFont_UserText
-- GameTooltipHeaderText
-- GameTooltipText
-- GameTooltipTextSmall
-- ZoneTextString
-- SubZoneTextString
-- PVPInfoTextString
-- PVPArenaTextString
-- CombatTextFont
-- BackpackTokenFrameToken1Count
-- BackpackTokenFrameToken2Count
-- BackpackTokenFrameToken3Count
-- QuestFontHighlight
-- QuestFontNormalSmall
-- QuestLogTitleText
-- QuestTitleFont
-- QuestFont
-- QuestFont_Large
-- QuestTitleFontBlackShadow
-- QuestFont_Super_Huge
-- HelpFrameKnowledgebaseNavBarHomeButtonText
-- GameFont_Gigantic
