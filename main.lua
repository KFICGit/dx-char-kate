-- name: [CS] KFSelect
-- description: there she is

--[[
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/blob/main/API-doc.md

    Use this if you're curious on how anything here works >v<
]]

local E_MODEL_KATE = smlua_model_util_get_id("KF_geo")
local E_MODEL_KAETEE = smlua_model_util_get_id("KaeTee_geo")
local E_MODEL_IC = smlua_model_util_get_id("IC_geo")

local TEX_KATE_ICON = get_texture_info("kf-icon")
local TEX_KAETEE_ICON = get_texture_info("kaetee-icon")
local TEX_IC_ICON = get_texture_info("ic-icon")

local TEX_KATE_GRAFITTI = get_texture_info("char-select-graffiti-kate")

local TEXT_MOD_NAME = "KF Select"

local KATE_ANIMTABLE = {
   [charSelect.CS_ANIM_MENU] = KATE_ANIM_CS_MENU, 
   [CHAR_ANIM_IDLE_HEAD_LEFT] = KATE_ANIM_HEAD_LEFT,
   [CHAR_ANIM_IDLE_HEAD_RIGHT] = KATE_ANIM_HEAD_LEFT,
   [CHAR_ANIM_IDLE_HEAD_CENTER] = KATE_ANIM_HEAD_LEFT,
   [CHAR_ANIM_FIRE_LAVA_BURN] = KATE_ANIM_FIREASS,
   [CHAR_ANIM_WALKING] = KATE_ANIM_WALK,
   [CHAR_ANIM_WATER_IDLE] = KATE_ANIM_SWIMIDLE,
   [CHAR_ANIM_SWIM_PART1] = KATE_ANIM_SWIMP1,
   [CHAR_ANIM_SWIM_PART2] = KATE_ANIM_SWIMP2,
   [CHAR_ANIM_SKID_ON_GROUND] = KATE_ANIM_SKIDGROUND,
   [CHAR_ANIM_TURNING_PART1] = KATE_ANIM_TURN1,
   [CHAR_ANIM_TURNING_PART2] = KATE_ANIM_TURN2,
   [CHAR_ANIM_WATER_ACTION_END] = KATE_ANIM_WATERACTEND,
   [CHAR_ANIM_RUNNING] = KATE_ANIM_WALK
}

local KAETEE_ANIMTABLE = {
   [charSelect.CS_ANIM_MENU] = KATE_ANIM_CS_MENU, 
   [CHAR_ANIM_IDLE_HEAD_LEFT] = KATE_ANIM_HEAD_LEFT,
   [CHAR_ANIM_IDLE_HEAD_RIGHT] = KATE_ANIM_HEAD_LEFT,
   [CHAR_ANIM_IDLE_HEAD_CENTER] = KATE_ANIM_HEAD_LEFT,
   [CHAR_ANIM_FIRE_LAVA_BURN] = KATE_ANIM_FIREASS,
   [CHAR_ANIM_WALKING] = KATE_ANIM_WALK,
   [CHAR_ANIM_WATER_IDLE] = KATE_ANIM_SWIMIDLE,
   [CHAR_ANIM_SWIM_PART1] = KATE_ANIM_SWIMP1,
   [CHAR_ANIM_SWIM_PART2] = KATE_ANIM_SWIMP2,
   [CHAR_ANIM_SKID_ON_GROUND] = KATE_ANIM_SKIDGROUND,
   [CHAR_ANIM_TURNING_PART1] = KATE_ANIM_TURN1,
   [CHAR_ANIM_TURNING_PART2] = KATE_ANIM_TURN2,
   [CHAR_ANIM_WATER_ACTION_END] = KATE_ANIM_WATERACTEND,
   [CHAR_ANIM_RUNNING] = KATE_ANIM_WALK
}
local IC_ANIMTABLE = {
   [charSelect.CS_ANIM_MENU] = IC_ANIM_CS_MENU, 
   [CHAR_ANIM_IDLE_HEAD_LEFT] = IC_ANIM_IDLE,
   [CHAR_ANIM_IDLE_HEAD_RIGHT] = IC_ANIM_IDLE,
   [CHAR_ANIM_IDLE_HEAD_CENTER] = IC_ANIM_IDLE,
}

local CAPTABLE_KATE = {
    normal = smlua_model_util_get_id("KF_Cap_geo"),
    wing = smlua_model_util_get_id("KF_Cap_geo"),
    metal = smlua_model_util_get_id("KF_Cap_geo"),
    metalWing = smlua_model_util_get_id("KF_Cap_geo"),
}

local PALETTES_KATE = {
    {
        name = "Default",
        [PANTS] = "70EA81", -- Self Explanatory
        [SHIRT] = "9BE4FF", -- Jacket
        [GLOVES] = "1B1622", -- Shirt
        [SHOES] = "15151C", -- Self Explanatory
        [HAIR] = "543100", -- Self Explanatory
        [SKIN] = "FFC19E", -- Self Explanatory
        [CAP] = "9BE4FF", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Self Explanatory, Unused
    },
	{
        name = "Early Bird",
        [PANTS] = "474359", -- Self Explanatory
        [SHIRT] = "46009F", -- Jacket
        [GLOVES] = "000000", -- Shirt
        [SHOES] = "1D1626", -- Self Explanatory
        [HAIR] = "1D1626", -- Self Explanatory
        [SKIN] = "FF905B", -- Self Explanatory
        [CAP] = "46009F", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Self Explanatory, Unused
    },
	{
        name = "Opposite Day",
        [PANTS] = "9BE4FF", -- Self Explanatory
        [SHIRT] = "70EA81", -- Jacket
        [GLOVES] = "FFFFFF", -- Shirt
        [SHOES] = "543100", -- Self Explanatory
        [HAIR] = "1D1626", -- Self Explanatory
        [SKIN] = "FFC19E", -- Self Explanatory
        [CAP] = "70EA81", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Self Explanatory, Unused
    },
	{
        name = "Marshmellow",
        [PANTS] = "2B2542", -- Self Explanatory
        [SHIRT] = "1B162D", -- Jacket
        [GLOVES] = "9D94FF", -- Shirt
        [SHOES] = "FFFFFF", -- Self Explanatory
        [HAIR] = "D7D3FF", -- Self Explanatory
        [SKIN] = "FFFFFF", -- Self Explanatory
        [CAP] = "9D94FF", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Self Explanatory, Unused
    },
	{
        name = "Gaaaaaay",
        [PANTS] = "121331", -- Self Explanatory
        [SHIRT] = "0E2502", -- Jacket
        [GLOVES] = "D5C600", -- Shirt
        [SHOES] = "2A2A30", -- Self Explanatory
        [HAIR] = "3D2121", -- Self Explanatory
        [SKIN] = "EEC39A", -- Self Explanatory
        [CAP] = "0E2502", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Self Explanatory, Unused
    },
	    {
        name = "SINGULARITY",
        [PANTS] = "000000", -- Self Explanatory
        [SHIRT] = "577D8C", -- Jacket
        [GLOVES] = "2A2A31", -- Shirt
        [SHOES] = "0C0C19", -- Self Explanatory
        [HAIR] = "4C3323", -- Self Explanatory
        [SKIN] = "E1BFAC", -- Self Explanatory
        [CAP] = "9BE4FF", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Self Explanatory, Unused
    },
}

local PALETTES_KAETEE = {
    {
        name = "Popstar",
        [PANTS] = "4028C0", -- Skirt, 1/2 of sleeves,
        [SHIRT] = "2B040D", -- Shirt, 1/2 of sleeves, Outer Headphones
        [GLOVES] = "C3003C", -- Hair Highlight, Inner Headphones
        [SHOES] = "15151C", -- Self Explanatory
        [HAIR] = "543100", -- Self Explanatory
        [SKIN] = "FFC19E", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
	    {
        name = "Hiding in your wifi",
        [PANTS] = "2B323D", -- Skirt, 1/2 of sleeves,
        [SHIRT] = "77747A", -- Shirt, 1/2 of sleeves, Outer Headphones
        [GLOVES] = "93D0C7", -- Hair Highlight, Inner Headphones
        [SHOES] = "15151C", -- Self Explanatory
        [HAIR] = "93D0C7", -- Self Explanatory
        [SKIN] = "F6D0C0", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
		    {
        name = "Mechanical Love",
        [PANTS] = "567384", -- Skirt, 1/2 of sleeves,
        [SHIRT] = "111111", -- Shirt, 1/2 of sleeves, Outer Headphones
        [GLOVES] = "DC2D4E", -- Hair Highlight, Inner Headphones
        [SHOES] = "E9617B", -- Self Explanatory
        [HAIR] = "DC2D4E", -- Self Explanatory
        [SKIN] = "F6D0C0", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
		{
        name = "the yellow one",
        [PANTS] = "373534", -- Skirt, 1/2 of sleeves,
        [SHIRT] = "818C9B", -- Shirt, 1/2 of sleeves, Outer Headphones
        [GLOVES] = "F2D609", -- Hair Highlight, Inner Headphones
        [SHOES] = "F3DC44", -- Self Explanatory
        [HAIR] = "F2D609", -- Self Explanatory
        [SKIN] = "F6D4C2", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
	{
        name = "gumi i'll come up with a better name later",
        [PANTS] = "DDFC9F", -- Skirt, 1/2 of sleeves,
        [SHIRT] = "FFFFFF", -- Shirt, 1/2 of sleeves, Outer Headphones
        [GLOVES] = "FFB26B", -- Hair Highlight, Inner Headphones
        [SHOES] = "FFB26B", -- Self Explanatory
        [HAIR] = "7DD283", -- Self Explanatory
        [SKIN] = "FCE6D0", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
}
local PALETTES_IC = {
    {
        name = "The Husk",
        [PANTS] = "000000", -- Self Explanatory
        [SHIRT] = "386D81", -- Self Explanatory
        [GLOVES] = "C3003C", -- Self Explanatory
        [SHOES] = "47544A", -- Self Explanatory
        [HAIR] = "3C280E", -- Self Explanatory
        [SKIN] = "DDBFAF", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
	    {
        name = "Issac Conne",
        [PANTS] = "101328", -- Self Explanatory
        [SHIRT] = "0089BD", -- Self Explanatory
        [GLOVES] = "C3003C", -- Self Explanatory
        [SHOES] = "121613", -- Self Explanatory
        [HAIR] = "4F2E25", -- Self Explanatory
        [SKIN] = "DDBFAF", -- Self Explanatory
        [CAP] = "1B162D", -- Linked to Charges
        [EMBLEM] = "6B5EFF", -- Unimportant
    },
}

CT_KATE = 0
if _G.charSelectExists then
    CT_KATE = _G.charSelect.character_add("Kate", {"some gayass", "who likes toy bonnie"}, "KateFried", {r = 155, g = 228, b = 255}, E_MODEL_KATE, CT_MARIO, TEX_KATE_ICON)
	local KATE_THEME = audio_stream_load("kate theme.ogg")
    _G.charSelect.character_add_menu_instrumental(CT_KATE, KATE_THEME)
    _G.charSelect.character_add_graffiti(CT_KATE, get_texture_info("char-select-graffiti-kate"))
    _G.charSelect.character_add_caps(E_MODEL_KATE, CAPTABLE_KATE)
	_G.charSelect.character_set_category(CT_KATE, "Squishy Workshop", true)
	_G.charSelect.character_add_animations(E_MODEL_KATE, KATE_ANIMTABLE)
	for i = 1, #PALETTES_KATE do
    _G.charSelect.character_add_palette_preset(E_MODEL_KATE, PALETTES_KATE[i], PALETTES_KATE[i].name)
end


-- KAE-TEE ALT
	CT_ALT_KAETEE = _G.charSelect.character_add_costume(CT_KATE, "Kae-Tee", {"Popstar K-18!", "Quite the silly gal!"}, "KateFried", {r = 195, g = 0, b = 60}, E_MODEL_KAETEE, CT_MARIO, TEX_KAETEE_ICON)
		_G.charSelect.character_add_animations(E_MODEL_KAETEE, KAETEE_ANIMTABLE)
			for i = 1, #PALETTES_KAETEE do
    _G.charSelect.character_add_palette_preset(E_MODEL_KAETEE, PALETTES_KAETEE[i], PALETTES_KAETEE[i].name)
end

-- IC ALT
    CT_ALT_IC = _G.charSelect.character_add_costume(CT_KATE, "IC", {"Evill"}, "KateFried", {r = 56, g = 109, b = 129}, E_MODEL_IC, CT_MARIO, TEX_IC_ICON)
		_G.charSelect.character_add_animations(E_MODEL_IC, IC_ANIMTABLE)
			for i = 1, #PALETTES_IC do
    _G.charSelect.character_add_palette_preset(E_MODEL_IC, PALETTES_IC[i], PALETTES_IC[i].name)
end
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
end