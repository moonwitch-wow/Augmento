-- [[ Control Options Panel ]] --
-- autoLootKey = "SHIFT"/"CTRL"/"ALT"/"NONE", -- Needs to be set if AutoLoot is disabled
autoClearAFK = 1,
autoDismount = 1, -- no UI
autoDismountFlying = 0, -- I fall to my death too often
autoLootDefault = 1,
autoOpenLootHistory = 1,
autoStand = 0, -- no UI
autoUnshift = 0, -- no UI
blockChannelInvites = 0,
blockTrades = 0,
deselectOnClick = 1, -- Sticky Targeting, 0 = ON, 1 = OFF
interactOnLeftClick = 0,
lootUnderMouse = 1,
synchronizeBindings = 1, -- no UI
synchronizeConfig = 1, -- no UI
synchronizeMacros = 1, -- no UI
synchronizeSettings = 1, -- no UI

-- [[ Combat Options Panel ]] --
ActionButtonUseKeyDown = 1,
assistAttack = 1,
autoSelfCast = 1,
displaySpellActivationOverlays = 1,
lossOfControl = 1,
-- Extra Loss of Control
-- Full duration = 2 - Alert Only = 1 - Disabled = 0
lossOfControlDisarm
lossOfControlFull
lossOfControlInterrupt
lossOfControlRoot
lossOfControlSilence
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
advancedWorldMap = 1,
mapFade = 1,

-- [[ Social Options Panel ]] --
profanityFilter = 0,
chatBubbles = 0,
chatBubblesParty = 1,
spamFilter = 1,
removeChatDelay = 1,
guildMemberNotify = 1,
showChatIcons = 1,  
wholeChatWindowClickable = 1,
chatMouseScroll = 1,

-- [[ ActionBars Options Panel ]] --
bottomLeftActionBar = 0, -- default = 0
bottomRightActionBar = 0, --default = 0
rightActionBar = 0, -- default = 0
rightTwoActionBar = 0, -- default = 0
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
fctSpellMechanicsOther = 1,
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
