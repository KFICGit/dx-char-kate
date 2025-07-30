-- name: [CS] KFSelect
-- description: there she is

--[[
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/blob/main/API-doc.md

    Use this if you're curious on how anything here works >v<
]]

local E_MODEL_KATE = smlua_model_util_get_id("KF_geo")

local TEX_KATE_ICON = get_texture_info("kf-icon")

local TEXT_MOD_NAME = "KF Select"

local KATE_ANIMTABLE = {
   [charSelect.CS_ANIM_MENU] = KATE_ANIM_CS_MENU 
}




local CAPTABLE_KATE = {
    normal = smlua_model_util_get_id("KF_Cap_geo"),
    wing = smlua_model_util_get_id("KF_Cap_geo"),
    metal = smlua_model_util_get_id("KF_Cap_geo"),
    metalWing = smlua_model_util_get_id("KF_Cap_geo"),
}

if _G.charSelectExists then
    CT_KATE = _G.charSelect.character_add("KF", {"some gayass", "who likes toy bonnie"}, "KF", {r = 155, g = 228, b = 255}, E_MODEL_KATE, CT_MARIO, TEX_KATE_ICON)
	local KATE_THEME = audio_stream_load("kate theme.ogg")
_G.charSelect.character_add_menu_instrumental(CT_KATE, KATE_THEME)

    _G.charSelect.character_add_caps(E_MODEL_KATE, CAPTABLE_KATE)
    -- the following must be hooked for each character added
	_G.charSelect.character_add_animations(E_MODEL_KATE, KATE_ANIMTABLE)
	
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
end