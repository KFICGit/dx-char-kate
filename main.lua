-- name: [CS] KFSelect
-- description: there he is

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_KF = smlua_model_util_get_id("KF_geo")

local TEX_KF_ICON = get_texture_info("kf-icon")

local TEXT_MOD_NAME = "KF Select"

local VOICETABLE_KF = {  
	[CHAR_SOUND_ATTACKED] = 'KF_SOUND_ATTACKED.ogg',
    [CHAR_SOUND_DOH] = 'KF_SOUND_DOH.ogg',
    [CHAR_SOUND_DROWNING] = 'KF_SOUND_DROWNING.ogg',
    [CHAR_SOUND_DYING] = 'KF_SOUND_DYING.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'KF_SOUND_GROUND_POUND_WAH.ogg',
    [CHAR_SOUND_HAHA] = 'KF_SOUND_HAHA.ogg',
    [CHAR_SOUND_HAHA_2] = 'KF_SOUND_HAHA_2.ogg',
    [CHAR_SOUND_HERE_WE_GO] = {'KF_SOUND_HERE_WE_GO.ogg', 'piza toewr.ogg', 'fafn.ogg', 'fafn worl ap.ogg', 'brc.ogg', 'the fuck 2.ogg', 'undrtal e.ogg', 'men.ogg'},
    [CHAR_SOUND_HOOHOO] = 'KF_SOUND_HOOHOO.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'KF_SOUND_MAMA_MIA.ogg',
    [CHAR_SOUND_OKEY_DOKEY] = 'KF_SOUND_OKEY_DOKEY.ogg',
    [CHAR_SOUND_ON_FIRE] = 'KF_SOUND_ON_FIRE.ogg',
    [CHAR_SOUND_OOOF] = 'KF_SOUND_OOOF.ogg',
    [CHAR_SOUND_OOOF2] = 'KF_SOUND_OOOF2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'KF_SOUND_PUNCH_HOO.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'KF_SOUND_PUNCH_WAH.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'KF_SOUND_PUNCH_YAH.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'KF_SOUND_SO_LONGA_BOWSER.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'KF_SOUND_TWIRL_BOUNCE.ogg',
    [CHAR_SOUND_WAAAOOOW] = {'KF_SOUND_WAAAOOOW.ogg', 'KF_SOUND_WAAAOOOW_2.ogg', 'KF_SOUND_WAAAOOOW_3.ogg', 'KF_SOUND_WAAAOOOW_4.ogg'},
    [CHAR_SOUND_WAH2] = 'KF_SOUND_WAH2.ogg',
    [CHAR_SOUND_WHOA] = 'KF_SOUND_WHOA.ogg',
    [CHAR_SOUND_YAHOO] = 'KF_SOUND_YAHOO.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = 'KF_SOUND_YAHOO_WAHA_YIPPEE.ogg',
    [CHAR_SOUND_YAH_WAH_HOO] = 'KF_SOUND_YAH_WAH_HOO.ogg',
    [CHAR_SOUND_YAWNING] = 'KF_SOUND_YAWNING.ogg',
}

--[[
local CAPTABLE_KF = {
    normal = smlua_model_util_get_id("kf_cap_normal_geo"),
    wing = smlua_model_util_get_id("kf_cap_wing_geo"),
    metal = smlua_model_util_get_id("kf_cap_metal_geo"),
    metalWing = smlua_model_util_get_id("kf_cap_wing_geo"),
}
]]

local PALETTE_KF = {
    [SHIRT] = "9BE4FF",
    [HAIR] = "543100",
    [SKIN] = "FFC19E",
    [PANTS] = "70EA81",
    [GLOVES] = "15151C",
    [SHOES] = "626262",
}

CT_CHAR = _G.charSelect.character_add("KF", {"some gayass", "who likes toy bonnie"}, "KF", {r = 155, g = 228, b = 255}, E_MODEL_KF, CT_MARIO, TEX_KF_ICON)
--_G.charSelect.character_add_caps(E_MODEL_KF, CAPS_KF)
_G.charSelect.character_add_palette_preset(E_MODEL_KF, PALETTE_KF)
_G.charSelect.character_add_voice(E_MODEL_KF, VOICETABLE_KF)
_G.charSelect.config_character_sounds()