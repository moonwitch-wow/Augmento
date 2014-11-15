------------------------------------------------------------------------
-- Namespaceing
------------------------------------------------------------------------
local _, Augmento = ...

------------------------------------------------------------------------
-- Console Variables
-- For a complete list
------------------------------------------------------------------------
local cvars = {
   -- [[ Control Options Panel ]] --
   -- autoLootKey = "SHIFT"/"CTRL"/"ALT"/"NONE", -- Needs to be set if AutoLoot is disabled
   autoClearAFK = 1,
   autoDismount = 1, -- no UI
   autoUnshift = 1, -- no UI, cancels form if needed
   autoDismountFlying = 1, -- I fall to my death too often
   autoLootDefault = 1,
   autoOpenLootHistory = 1,
   autoStand = 1, -- no UI
   blockChannelInvites = 0,
   blockTrades = 0,
   deselectOnClick = 1, -- Sticky Targeting, 0 = ON, 1 = OFF
   interactOnLeftClick = 0,
   lootUnderMouse = 1,

   -- [[ Combat Options Panel ]] --
   ActionButtonUseKeyDown = 1,
   assistAttack = 1,
   autoSelfCast = 1,
   displaySpellActivationOverlays = 1,
   lossOfControl = 1,
   -- Extra Loss of Control
   -- Full duration = 2 - Alert Only = 1 - Disabled = 0
   lossOfControlDisarm = 1,
   lossOfControlFull = 2,
   lossOfControlInterrupt = 1,
   lossOfControlRoot = 1,
   lossOfControlSilence = 2,
   MaxSpellStartRecoveryOffset = 0, -- minValue = 0, maxValue = 400, valueStep = 10
   reducedLagTolerance = 0,
   showTargetCastbar = 1,
   showTargetOfTarget = 1,
   spellActivationOverlayOpacity = .85, -- minValue = 0.1, maxValue = 1.0, valueStep = 0.05
   stopAutoAttackOnTargetChange = 1, -- Ninja pulls will not occur

   -- [[ Display Options Panel ]] --
   rotateMinimap = 0,
   screenEdgeFlash = 1,
   displayFreeBagSlots = 1,
   movieSubtitle = 1,
   threatShowNumeric = 1,
   threatPlaySounds = 1,
   SpellTooltip_DisplayAvgValues = 1,
   emphasizeMySpellEffects = 1,

   -- [[ Objectives Options Panel ]] --
   autoQuestWatch = 1,
   autoQuestProgress = 1,
   -- advancedWorldMap = 1,
   mapFade = 1,

   -- [[ Social Options Panel ]] --
   profanityFilter = 0,
   chatBubbles = 0,
   chatBubblesParty = 1,
   spamFilter = 1,
   removeChatDelay = 1,
   guildMemberNotify = 1,
   -- showChatIcons = 1,
   wholeChatWindowClickable = 1,
   chatMouseScroll = 1,

   -- [[ ActionBars Options Panel ]] --
   -- bottomLeftActionBar = 0, -- default = 0
   -- bottomRightActionBar = 0, --default = 0
   -- rightActionBar = 0, -- default = 0
   -- rightTwoActionBar = 0, -- default = 0
   lockActionBars = 1,
   alwaysShowActionBars = 0,
   secureAbilityToggle = 1,
   countdownForCooldowns = 1,

   -- [[ Name Options Panel ]] --
   UnitNameOwn = 0,
   UnitNameNPC = 1,
   UnitNameNonCombatCreatureName = 0,
   UnitNamePlayerGuild = 0,
   UnitNameGuildTitle = 0,
   UnitNamePlayerPVPTitle = 0,

   UnitNameFriendlyPlayerName = 1,
   UnitNameFriendlyPetName = 0,
   UnitNameFriendlyGuardianName = 0,
   UnitNameFriendlyTotemName = 0,

   UnitNameEnemyPlayerName = 1,
   UnitNameEnemyPetName = 1,
   UnitNameEnemyGuardianName = 0,
   UnitNameEnemyTotemName = 0,
   UnitNameForceHideMinus = 0,

   nameplateShowFriends = 0,
   nameplateShowFriendlyPets = 0,
   nameplateShowFriendlyGuardians = 0,
   nameplateShowFriendlyTotems = 0,
   nameplateShowEnemies = 1,
   nameplateShowEnemyPets = 1,
   nameplateShowEnemyGuardians = 0,
   nameplateShowEnemyTotems = 0,
   nameplateShowEnemyMinus = 1,
   ShowClassColorInNameplate = 1,
   showVKeyCastbar = 1, -- technically Nameplates
   showVKeyCastbarOnlyOnTarget = 1, -- technically Nameplates
   showVKeyCastbarSpellName = 1, -- technically Nameplates

   -- [[ FCT Options Panel ]] --
   enableCombatText = 1,
   fctCombatState = 1,
   fctDodgeParryMiss = 1,
   fctDamageReduction = 0,
   fctRepChanges = 1,
   fctReactives = 1,
   fctFriendlyHealers = 0,
   fctComboPoints = 1,
   fctLowManaHealth = 1,
   fctEnergyGains = 0,
   fctPeriodicEnergyGains = 0,
   fctHonorGains = 0,
   fctAuras = 1,
   CombatDamage = 1,
   CombatLogPeriodicSpells = 1,
   PetMeleeDamage = 1,
   CombatHealing = 1,
   CombatHealingAbsorbTarget = 1,
   CombatHealingAbsorbSelf = 1,
   fctSpellMechanics = 1,
   fctSpellMechanicsOther = 0,
   enablePetBattleCombatText = 1,

   -- [[ Status Text Options Panel ]] --
   xpBarText = 1,
   playerStatusText = 1,
   petStatusText = 1,
   partyStatusText = 1,
   targetStatusText = 1,
   alternateResourceText = 1,

   -- [[ UnitFrame Options Panel ]] --
   showPartyBackground = 1,
   showPartyPets = 1,
   showArenaEnemyFrames = 1,
   showArenaEnemyCastbar = 1,
   showArenaEnemyPets = 1,
   fullSizeFocusFrame = 1,

   -- [[ Camera Options Panel ]] --
   cameraTerrainTilt = 1, -- move camera to follow your character
   cameraBobbing = 0,
   cameraWaterCollision = 1, -- If char below water, move camera below water as well
   cameraPivot = 1,
   cameraYawSmoothSpeed = 120, -- AUTO_FOLLOW_SPEED minValue = 90, maxValue = 270, valueStep = 10
   cameraDistanceMaxFactor = 1.5, -- minValue = 1, maxValue = 2, valueStep = 0.1

   -- [[ Buffs and Debuffs Options Panel ]] --
   buffDurations = 1,
   showDispelDebuffs = 1,
   showCastableBuffs = 1,
   consolidateBuffs = 0,
   showAllEnemyDebuffs = 0,

   -- [[ Battle.net Options Panel ]] --
   showToastOnline = 1,
   showToastOffline = 0,
   showToastBroadcast = 0,
   showToastFriendRequest = 1,
   showToastConversation = 0,
   showToastWindow = 0,
   toastDuration = 2, -- minValue = 0, maxValue = 10, valueStep = 0.5

   -- [[ Mouse Options Panel ]] --
   enableMouseSpeed = 1,
   mouseInvertPitch = 0,
   enableWoWMouse = 0,
   autointeract = 0, -- click to move
   mouseSpeed = 1, -- minValue = 0.5, maxValue = 1.5, valueStep = 0.05
   cameraYawMoveSpeed = 120, -- Int between 90 - 270

   -- [[ Help Options Panel ]] --
   showTutorials = 0, -- Beginners tips
   showGameTips = 0, -- Tip of the Day
   UberTooltips = 1, -- More info in ToolTips
   scriptErrors = 1, -- Show UI errors
   colorblindMode = 0,
   enableMovePad = 0,

   -- Sound
   ChatAmbienceVolume = 0.3,
   ChatMusicVolume = 0.3,
   ChatSoundVolume = 0.4,
   EnableMicrophone = 0,
   EnableVoiceChat = 0,
   Sound_AmbienceVolume = 0.1,
   Sound_DialogVolume = 0.1,
   Sound_EnableAllSound = 1,
   Sound_EnableAmbience = 0,
   Sound_EnableDSPEffects = 0,
   Sound_EnableMusic = 0,
   Sound_EnableReverb = 0,
   Sound_EnableSFX = 1,
   Sound_EnableSoftwareHRTF = 0,
   Sound_EnableSoundWhenGameIsInBG = 1,
   Sound_ListenerAtCharacter = 1,
   Sound_MasterVolume = 0.3,
   Sound_MusicVolume = 0.1,
   Sound_NumChannels = 24,
   Sound_SFXVolume = 0.1,

   -- Calendar
   --timeMgrAlarmEnabled
   calendarShowBattlegrounds = 1,
   calendarShowDarkMoon = 1,
   calendarShowLockouts = 1,
   calendarShowResets = 1,
   calendarShowWeeklyHolidays = 1,
   timeMgrUseLocalTime = 1,
   timeMgrUseMilitaryTime  = 1,

   -- Misc
   auctionDisplayOnCharacter = 1,
   characterFrameCollapsed = 0,
   checkAddonVersion = 0,
   screenshotFormat = 'png',
   screenshotQuality = 10,
   scriptErrors = 1,
   scriptProfile = 0,
   synchronizeBindings = 0, -- because blizzard seems to fuck me over
   synchronizeConfig = 0, -- because blizzard seems to fuck me over
   synchronizeMacros = 0, -- because blizzard seems to fuck me over
   synchronizeSettings = 0, -- because blizzard seems to fuck me over
   taintLog = 1,

   -- Normal settings
   -- farclip = 700,
   -- graphicsQuality = 3,
   -- groundEffectDensity = 35,
   -- groundEffectDist = 90,
   -- particleDensity = 50,
   -- projectedTextures = 0,
   -- reflectionMode = 0,
   -- refraction = 1,
   -- rippleDetail = 1,
   -- shadowMode = 1,
   -- shadowTextureSize = 1024,
   -- SSAOBlur = 0,
   -- sunShafts = 0,
   -- textureFilteringMode = 3,
   -- waterDetail = 1,

   -- RAID settings
   -- RAIDfarclip = 450,
   -- RAIDgraphicsQuality = 3,
   -- RAIDgroundEffectDensity = 32,
   -- RAIDgroundEffectDist = 80,
   -- RAIDparticleDensity = 30,
   -- RAIDprojectedTextures = 0,
   -- RAIDreflectionMode = 0,
   -- RAIDrefraction = 1,
   -- RAIDsettingsInit = 1,
   -- RAIDshadowMode = 0,
   -- RAIDshadowTextureSize = 1024,
   -- RAIDSSAO = 0,
   -- RAIDSSAOBlur = 0,
   -- RAIDsunShafts = 0,
   -- RAIDWaterDetail = 1,
   -- RAIDwmoLodDist = 300,
}

function Augmento.Init(...)
   for key, value in next, cvars do
      SetCVar(key, value)
   end
end