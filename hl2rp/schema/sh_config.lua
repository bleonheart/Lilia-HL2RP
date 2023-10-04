-- General Gameplay Settings
lia.config.EquipDelay = 1 -- Delay OnEquip
lia.config.DropDelay = 1 -- Delay OnDrop
lia.config.TakeDelay = 1 -- Delay OnTake
lia.config.SchemaYear = 2023 -- Year When Schema Happens
lia.config.AmericanDates = true -- American Date Formatting?
lia.config.AmericanTimeStamp = true -- American Time Formatting?
lia.config.lia.config.CarRagdoll = true -- Enable car ragdolls
lia.config.HeadShotDamage = 2 -- Damage multiplier for headshots
lia.config.TimeUntilDroppedSWEPRemoved = 15 -- Time until dropped weapons are removed (in seconds)
lia.config.PlayerSpawnVehicleDelay = 30 -- Delay before players can spawn vehicles (in seconds)
lia.config.NPCsDropWeapons = true -- NPCs drop weapons when killed
lia.config.DrawEntityShadows = true -- Enable entity shadows
lia.config.WalkSpeed = 130 -- Player walk speed
lia.config.RunSpeed = 235 -- Player run speed
lia.config.CharacterSwitchCooldownTimer = 5 -- Cooldown timer for character switching (in seconds)
lia.config.CharacterSwitchCooldown = true -- Enable character switch cooldown
lia.config.AutoRegen = false -- Enable automatic health regeneration
lia.config.lia.config.HealingAmount = 10 -- Amount of health regenerated per tick when AutoRegen is enabled
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
lia.config.TimeToEnterVehicle = 1 -- Time required to enter a vehicle (in seconds)
lia.config.JumpCooldown = 0.8 -- Cooldown time between jumps (in seconds)
lia.config.MaxAttributes = 30 -- Maximum number of player attributes
lia.config.AllowExistNames = true -- Allow existing character names
-- Communication and Interaction Settings
lia.config.FactionBroadcastEnabled = true -- Enable faction broadcasts
lia.config.AdvertisementEnabled = true -- Enable player advertisements
lia.config.AdvertisementPrice = 25 -- Price for player advertisements
lia.config.DefaultGamemodeName = "Lilia - Skeleton" -- Default server gamemode name
-- Visual Settings
lia.config.Color = Color(75119190) -- Default color used for UI elements
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
lia.config.CharAttrib = {"buttons/button16.wav", 30, 255}
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
lia.config.PlayerModelTposingFixer = {
    ["models/player/Group03/female_03.mdl"] = "citizen_female",
    ["models/player/Group01/male_02.mdl"] = "citizen_male",
}

-- Default Staff Ranks
lia.config.DefaultStaff = {
    ["STEAMID"] = "RANK",
}

lia.config.PhysGunMoveRestrictedEntityList = {"prop_door_rotating", "lia_vendor",}
lia.config.RemoverBlockedEntities = {"ent_chess_board", "ent_draughts_board", "rock_big", "rock_medium", "rock_small ", "lia_bodygroupcloset", "lia_craftingtable", "carvendor", "sh_teller", "permaweapons", "stockbook", "lia_stash", "valet", "lia_vendor", "telephone", "lia_salary", "spruce", "pinetree", "oaktree", "beechtree", "npc_import_drug", "cardealer", "delivery_crate", "npcdelivery", "housing_npc", "jailer_npc", "sergeant_dornan", "npctaxi",}
lia.config.DuplicatorBlackList = {"lia_storage", "lia_money"}
lia.config.RestrictedVehicles = {"sim_fphys_chaos126p", "sim_fphys_hedgehog", "sim_fphys_ratmobile", "sim_fphys_tank2", "sim_fphys_tank", "sim_fphys_conscriptapc_armed", "sim_fphys_combineapc_armed", "sim_fphys_jeep_armed2", "sim_fphys_jeep_armed", "sim_fphys_tank3", "sim_fphys_v8elite_armed2", "sim_fphys_v8elite_armed", "sim_fphys_tank4", "sim_fphys_couch", "sim_fphys_couch", "sim_fphys_tank_sdkfz_halftrack", "sim_fphys_opel_blitz_ww2", "gred_simfphys_panzerivd", "gred_simfphys_panzerivf1", "gred_simfphys_panzerivf2", "sim_fphys_pwavia", "sim_fphys_pwgaz52", "sim_fphys_pwhatchback", "sim_fphys_pwhatchback", "sim_fphys_pwmoskvich", "sim_fphys_pwtrabant", "sim_fphys_pwtrabant02", "sim_fphys_pwvan", "sim_fphys_pwvolga", "sim_fphys_pwzaz", "sim_fphys_conscriptapc", "sim_fphys_combineapc", "sim_fphys_jeep", "sim_fphys_jalopy", "sim_fphys_v8elite", "sim_fphys_van", "sim_fphys_chaos126p", "sim_fphys_hedgehog", "sim_fphys_ratmobile", "sim_fphys_tank2", "sim_fphys_tank", "sim_fphys_conscriptapc_armed", "sim_fphys_combineapc_armed", "sim_fphys_jeep_armed2", "sim_fphys_jeep_armed", "sim_fphys_tank3", "sim_fphys_v8elite_armed2", "sim_fphys_v8elite_armed", "sim_fphys_tank4", "sim_fphys_couch", "sim_fphys_dukes", "sim_fphys_tank_sdkfz_halftrack", "sim_fphys_opel_blitz_ww2", "gred_simfphys_panzerivd", "gred_simfphys_panzerivf1", "gred_simfphys_panzerivf2", "sim_fphys_pwavia", "sim_fphys_pwgaz52", "sim_fphys_pwhatchback", "sim_fphys_pwliaz", "sim_fphys_pwmoskvich", "sim_fphys_pwtrabant", "sim_fphys_pwtrabant02", "sim_fphys_pwvan", "sim_fphys_pwvolga", "sim_fphys_pwzaz", "sim_fphys_conscriptapc", "sim_fphys_combineapc", "sim_fphys_jeep", "sim_fphys_jalopy", "sim_fphys_v8elite", "sim_fphys_van", "gred_simfphys_panzerivd", "avx_t-34-85", "sim_fphys_chaos126p", "sim_fphys_hedgehog", "sim_fphys_ratmobile", "sim_fphys_tank2", "sim_fphys_tank", "sim_fphys_conscriptapc_armed", "sim_fphys_combineapc_armed", "sim_fphys_jeep_armed2", "sim_fphys_jeep_armed", "sim_fphys_tank3", "sim_fphys_v8elite_armed2", "sim_fphys_v8elite_armed", "sim_fphys_tank4", "sim_fphys_couch", "sim_fphys_dukes", "sim_fphys_conscriptapc", "sim_fphys_combineapc", "sim_fphys_jeep", "sim_fphys_jalopy", "sim_fphys_v8elite", "sim_fphys_van", "gred_panzerivd", "gred_simfphys_panzerivf1", "gred_simfphys_panzerivf2", "T34rp", "t34_76rp", "T34_85rp", "T34", "t34_76", "sdkfz_234", "ps_sdkfz_251_armed", "gb_bomb_cbu", "gb_bomb_1000gp", "gb_bomb_2000gp", "gb_bomb_fab250", "gb_bomb_gbu12", "gb_bomb_250gp", "gb_bomb_500gp", "gb_bomb_gbu38", "gb_bomb_mk77", "gb_bomb_mk82", "gb_bomb_sc100", "gb_bomb_sc1000", "gb_bomb_sc250", "gb_bomb_sc500", "gb_rocket_hvar", "gb_rocket_hydra", "gb_rocket_nebel", "gb_rocket_rp3", "gb_rocket_v1", "gred_ammobox", "sdkfz", "sdkfz2w", "sim_fphys_tank2", "Airboat", "Jeep", "Pod", "sim_fphys_chaos126p", "sim_fphys_hedgehog", "sim_fphys_ratmobile", "sim_fphys_tank2", "sim_fphys_tank", "sim_fphys_conscriptapc_armed", "sim_fphys_combineapc_armed", "sim_fphys_jeep_armed2", "sim_fphys_jeep_armed", "sim_fphys_tank3", "sim_fphys_v8elite_armed2", "sim_fphys_v8elite_armed", "sim_fphys_tank4", "sim_fphys_couch", "sim_fphys_dukes", "sim_fphys_tank_sdkfz_halftrack", "sim_fphys_opel_blitz_ww2", "gred_simfphys_panzerivd", "gred_simfphys_panzerivf1", "gred_simfphys_panzerivf2", "sim_fphys_pwavia", "sim_fphys_pwgaz52", "sim_fphys_pwhatchback", "sim_fphys_pwhatchback", "sim_fphys_pwmoskvich", "sim_fphys_pwtrabant", "sim_fphys_pwtrabant02", "sim_fphys_pwvan", "sim_fphys_pwvolga", "sim_fphys_pwzaz", "sim_fphys_conscriptapc", "sim_fphys_conscriptapc", "sim_fphys_jeep", "sim_fphys_jalopy ", "sim_fphys_v8elite", "sim_fphys_van", "T34_85"}
lia.config.BlockedCollideEntities = {"lia_item", "lia_money"}
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