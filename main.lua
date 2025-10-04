-- name: [CS] KFSelect
-- description: there she is

--[[
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/blob/main/API-doc.md

    Use this if you're curious on how anything here works >v<
]]

local E_MODEL_KATE = smlua_model_util_get_id("KF_geo")
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

local PALETTE_CHAR = {
    [PANTS]  = {r = 0x70, g = 0xea, b = 0x81},
    [SHIRT]  = {r = 0x9b, g = 0xe4, b = 0xff},
    [GLOVES] = {r = 0x15, g = 0x15, b = 0x1c},
    [SHOES]  = {r = 0x62, g = 0x62, b = 0x62},
    [HAIR]   = {r = 0x54, g = 0x31, b = 0x00},
    [SKIN]   = {r = 0xff, g = 0xc1, b = 0x9e},
    [CAP]    = {r = 0x9b, g = 0xe4, b = 0xff},
}


local CAPTABLE_KATE = {
    normal = smlua_model_util_get_id("KF_Cap_geo"),
    wing = smlua_model_util_get_id("KF_Cap_geo"),
    metal = smlua_model_util_get_id("KF_Cap_geo"),
    metalWing = smlua_model_util_get_id("KF_Cap_geo"),
}

CT_KATE = 0
if _G.charSelectExists then
    CT_KATE = _G.charSelect.character_add("KF", {"some gayass", "who likes toy bonnie"}, "KF", {r = 155, g = 228, b = 255}, E_MODEL_KATE, CT_MARIO, TEX_KATE_ICON)
	local KATE_THEME = audio_stream_load("kate theme.ogg")
    _G.charSelect.character_add_menu_instrumental(CT_KATE, KATE_THEME)
    _G.charSelect.character_add_graffiti(CT_KATE, get_texture_info("char-select-graffiti-kate"))
    _G.charSelect.character_add_caps(E_MODEL_KATE, CAPTABLE_KATE)
	_G.charSelect.character_add_animations(E_MODEL_KATE, KATE_ANIMTABLE)
	
	CT_ALT_KAE_TEE = _G.charSelect.character_add_costume(CT_KATE, "Kae Tee", {"Popstar K-18!", "Quite the silly gal!"}, "KF", {r = 195, g = 0, b = 60}, E_MODEL_KATE, CT_MARIO, TEX_KATE_ICON)
    CT_ALT_IC = _G.charSelect.character_add_costume(CT_KATE, "IC", {"Evill"}, "KF", {r = 195, g = 0, b = 60}, E_MODEL_IC, CT_MARIO, TEX_KATE_ICON)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
end