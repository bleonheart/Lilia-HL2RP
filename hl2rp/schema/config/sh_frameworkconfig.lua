-- General Gameplay Settings
lia.config.EquipDelay = 2 -- Delay OnEquip
lia.config.DropDelay = 2 -- Delay OnDrop
lia.config.TakeDelay = 2 -- Delay OnTake
lia.config.SchemaYear = 2023 -- Year When Schema Happens
lia.config.AmericanDates = true -- American Date Formatting?
lia.config.AmericanTimeStamp = true -- American Time Formatting?
lia.config.CarRagdoll = true -- Enable car ragdolls
lia.config.TimeUntilDroppedSWEPRemoved = 15 -- Time until dropped weapons are removed (in seconds)
lia.config.PlayerSpawnVehicleDelay = 30 -- Delay before players can spawn vehicles (in seconds)
lia.config.NPCsDropWeapons = true -- NPCs drop weapons when killed
lia.config.DrawEntityShadows = true -- Enable entity shadows
lia.config.WalkSpeed = 130 -- Player walk speed
lia.config.RunSpeed = 235 -- Player run speed
lia.config.CharacterSwitchCooldownTimer = 5 -- Cooldown timer for character switching (in seconds)
lia.config.CharacterSwitchCooldown = true -- Enable character switch cooldown
lia.config.AutoRegen = false -- Enable automatic health regeneration
lia.config.HealingAmount = 10 -- Amount of health regenerated per tick when AutoRegen is enabled
lia.config.HealingTimer = 60 -- Time interval between health regeneration ticks (in seconds)
lia.config.PermaClass = true -- Enable permanent player classes
-- Cleanup Settings
lia.config.MapCleanerEnabled = true -- Enable map cleaning functionality
lia.config.ItemCleanupTime = 7200 -- Time interval for cleaning up items on the ground (in seconds)
lia.config.MapCleanupTime = 21600 -- Time interval for cleaning up maps (in seconds)
-- Server Settings
lia.config.DevServer = false -- Is it a Development Server?
-- Player Interaction Settings
lia.config.WalkRatio = 0.5 -- Walk speed ratio (used in certain interactions)
lia.config.SalaryOverride = true -- Enable salary override
lia.config.SalaryInterval = 300 -- Salary interval (in seconds)
lia.config.JumpCooldown = 0.8 -- Cooldown time between jumps (in seconds)
lia.config.MaxAttributes = 30 -- Maximum number of player attributes
lia.config.AllowExistNames = true -- Allow existing character names
-- Communication and Interaction Settings
lia.config.FactionBroadcastEnabled = true -- Enable faction broadcasts
lia.config.AdvertisementEnabled = true -- Enable player advertisements
lia.config.AdvertisementPrice = 25 -- Price for player advertisements
lia.config.DefaultGamemodeName = "Lilia - Skeleton" -- Default server gamemode name
-- Visual Settings
lia.config.Color = Color(75, 119, 190) -- Default color used for UI elements
lia.config.DarkTheme = true -- Enable dark theme
lia.config.Font = "Arial" -- Default font used for UI elements
lia.config.GenericFont = "Segoe UI" -- Default generic font used for UI elements
-- Inventory and Currency Settings
lia.config.WhitelistEnabled = false -- Enable whitelist functionality
lia.config.MoneyModel = "models/props_lab/box01a.mdl" -- Model for in-game currency
lia.config.AutoWorkshopDownloader = false -- Automatically download missing workshop content
lia.config.MaxCharacters = 5 -- Maximum number of characters per player
lia.config.invW = 6 -- Inventory width
lia.config.invH = 4 -- Inventory height
lia.config.DefaultMoney = 0 -- Default starting amount of in-game currency
lia.config.CurrencyPluralName = "Dollars" -- Plural name for in-game currency
lia.config.CurrencySingularName = "Dollar" -- Singular name for in-game currency
lia.config.CurrencySymbol = "$" -- Currency symbol
-- Player Attribute Settings
lia.config.LoseWeapononDeathNPC = false -- NPCs do not lose weapons on death
lia.config.LoseWeapononDeathHuman = false -- Players do not lose weapons on death
lia.config.BranchWarning = true -- Enable warnings for branching in code
lia.config.VersionEnabled = true -- Enable version tracking
lia.config.version = "1.0" -- Server version
-- Voice and Audio Settings
lia.config.AllowVoice = true -- Enable voice communication
-- Character attribute settings -- UI and HUD Settings
lia.config.ThirdPersonEnabled = true -- Enable third-person perspective
lia.config.CrosshairEnabled = false -- Enable crosshair
lia.config.BarsDisabled = false -- Disable certain UI bars
lia.config.AmmoDrawEnabled = true -- Enable ammo drawing
lia.config.Vignette = true -- Enable vignette effect
-- Talk Ranges
lia.config.TalkRanges = {
    ["Whispering"] = 120, -- Whispering talk range
    ["Talking"] = 300, -- Normal talking talk range
    ["Yelling"] = 600, -- Yelling talk range
}

-- Player Model T-posing Fixer
lia.config.PlayerModelTposingFixer = {"models/player/Group03/female_03.mdl", "models/player/Group01/male_02.mdl", "models/player/player.mdl",}
-- Default Staff Ranks
lia.config.DefaultStaff = {
    ["STEAMID"] = "RANK",
}

-- Restricted Entity List for PhysGun
lia.config.PhysGunMoveRestrictedEntityList = {"prop_door_rotating", "lia_vendor"}
-- Blocked Entities for Remover Tool
lia.config.RemoverBlockedEntities = {"lia_bodygroupcloset", "lia_vendor",}
-- Blacklisted Entities for Duplicator Tool
lia.config.DuplicatorBlackList = {"lia_storage", "lia_money"}
-- Blocked Collide Entities
lia.config.BlockedCollideEntities = {"lia_item", "lia_money"}
-- Restricted Vehicles
lia.config.RestrictedVehicles = {}
-- Unloaded Modules
lia.config.UnLoadedModules = {
    ammosave = false,
    bodygrouper = false,
    chatbox = false,
    cmenu = false,
    corefiles = false,
    crashscreen = false,
    doors = false,
    f1menu = false,
    flashlight = false,
    inventory = false,
    interactionmenu = false,
    mainmenu = false,
    observer = false,
    pac = false,
    permakill = false,
    radio = false,
    raiseweapons = false,
    recognition = false,
    saveitems = false,
    scoreboard = false,
    serverblacklister = false,
    skills = false,
    spawnmenuitems = false,
    spawns = false,
    storage = false,
    tying = false,
    vendor = false,
    weaponselector = false,
    whitelist = false,
}

lia.config.ServerURLs = {
    ["Discord"] = "https://discord.gg/52MSnh39vw",
    ["Workshop"] = "https://steamcommunity.com/sharedfiles/filedetails/?id=2959728255"
}
