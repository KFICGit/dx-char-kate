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
        [PANTS] = "70EA81",
        [SHIRT] = "9BE4FF",
        [GLOVES] = "1B1622",
        [SHOES] = "15151C",
        [HAIR] = "543100",
        [SKIN] = "FFC19E",
        [CAP] = "1B162D",
        [EMBLEM] = "6B5EFF",
    },
	{
        name = "Default BUT IT'S 2",
        [PANTS] = "70EA81",
        [SHIRT] = "9BE4FF",
        [GLOVES] = "1B1622",
        [SHOES] = "15151C",
        [HAIR] = "543100",
        [SKIN] = "FFC19E",
        [CAP] = "1B162D",
        [EMBLEM] = "6B5EFF",
    }
}

local PALETTES_KAETEE = {
    {
        name = "Default",
        [PANTS] = "4028C0",
        [SHIRT] = "2B040D",
        [GLOVES] = "C3003C",
        [SHOES] = "15151C",
        [HAIR] = "543100",
        [SKIN] = "FFC19E",
        [CAP] = "1B162D",
        [EMBLEM] = "6B5EFF",
    },
}
local PALETTES_IC = {
    {
        name = "Default",
        [PANTS] = "000000",
        [SHIRT] = "386D81",
        [GLOVES] = "C3003C",
        [SHOES] = "47544A",
        [HAIR] = "3C280E",
        [SKIN] = "DDBFAF",
        [CAP] = "1B162D",
        [EMBLEM] = "6B5EFF",
    },
}


CT_KATE = 0
if _G.charSelectExists then
    CT_KATE = _G.charSelect.character_add("KF", {"some gayass", "who likes toy bonnie"}, "KF", {r = 155, g = 228, b = 255}, E_MODEL_KATE, CT_MARIO, TEX_KATE_ICON)
	local KATE_THEME = audio_stream_load("kate theme.ogg")
    _G.charSelect.character_add_menu_instrumental(CT_KATE, KATE_THEME)
    _G.charSelect.character_add_graffiti(CT_KATE, get_texture_info("char-select-graffiti-kate"))
    _G.charSelect.character_add_caps(E_MODEL_KATE, CAPTABLE_KATE)
	_G.charSelect.character_add_animations(E_MODEL_KATE, KATE_ANIMTABLE)
	_G.charSelect.character_add_animations(E_MODEL_KAETEE, KAETEE_ANIMTABLE)
		_G.charSelect.character_add_animations(E_MODEL_IC, IC_ANIMTABLE)
	for i = 1, #PALETTES_KATE do
    _G.charSelect.character_add_palette_preset(E_MODEL_KATE, PALETTES_KATE[i], PALETTES_KATE[i].name)
end
	for i = 1, #PALETTES_KAETEE do
    _G.charSelect.character_add_palette_preset(E_MODEL_KAETEE, PALETTES_KAETEE[i], PALETTES_KAETEE[i].name)
end
	for i = 1, #PALETTES_IC do
    _G.charSelect.character_add_palette_preset(E_MODEL_IC, PALETTES_IC[i], PALETTES_IC[i].name)
end
	
	CT_ALT_KAETEE = _G.charSelect.character_add_costume(CT_KATE, "Kae Tee", {"Popstar K-18!", "Quite the silly gal!"}, "KF", {r = 195, g = 0, b = 60}, E_MODEL_KAETEE, CT_MARIO, TEX_KATE_ICON)
    CT_ALT_IC = _G.charSelect.character_add_costume(CT_KATE, "IC", {"Evill"}, "KF", {r = 56, g = 109, b = 129}, E_MODEL_IC, CT_MARIO, TEX_KATE_ICON)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
end