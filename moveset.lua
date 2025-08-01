local gKateExtraStates = {}
for i = 0, MAX_PLAYERS - 1 do
    gKateExtraStates[i] = {
        bounceHold = 0,
        bounceTargetX = 0,
        bounceTargetY = 0,
        bounceTargetZ = 0,

        scaleX = 1,
        scaleY = 1,
        scaleZ = 1,
    }
end

local ACT_KATE_BOUNCE_GROUND = allocate_mario_action(ACT_GROUP_STATIONARY)
local ACT_KATE_BOUNCE_WALL = allocate_mario_action(ACT_GROUP_AIRBORNE)
local ACT_KATE_PEELOUT = allocate_mario_action(ACT_GROUP_MOVING)

function act_kate_bounce_ground(m)
    local e = gKateExtraStates[m.playerIndex]
    --perform_ground_step(m)

    set_mario_animation(m, MARIO_ANIM_CROUCHING)
    e.bounceHold = e.bounceHold + e.bounceTargetY*0.2
    if e.bounceHold > e.bounceTargetY then
        m.vel.y = e.bounceHold
        m.vel.x = m.vel.x * 0.6
        m.vel.z = m.vel.z * 0.6
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    local objScale = math.abs(e.bounceHold)*0.01
    e.scaleX = 1 + objScale
    e.scaleY = 1 - objScale
    e.scaleZ = 1 + objScale
    m.actionTimer = m.actionTimer + 1
end

function act_kate_bounce_wall(m)
    local e = gKateExtraStates[m.playerIndex]

    set_mario_animation(m, MARIO_ANIM_START_WALLKICK)
    e.bounceHold = e.bounceHold + e.bounceTargetY*0.2
    if e.bounceHold > e.bounceTargetY then
        if m.wall ~= nil then
            local nx, nz = m.wall.normal.x, m.wall.normal.z
            
            local vx, vz = m.vel.x, m.vel.z
            
            local dot = vx * nx + vz * nz
            
            m.vel.x = vx - 2 * dot * nx
            m.vel.z = vz - 2 * dot * nz
            
            m.vel.x = m.vel.x * 0.7
            m.vel.z = m.vel.z * 0.7
            m.faceAngle.y = atan2s(m.vel.z, m.vel.x)
        else
            m.faceAngle.y = m.faceAngle.y + 0x8000 
        end
        set_mario_action(m, ACT_DOUBLE_JUMP, 0)
    end

    local objScale = math.abs(e.bounceHold)*0.01
    e.scaleX = 1 - objScale
    e.scaleY = 1 + objScale
    e.scaleZ = 1 - objScale
    m.actionTimer = m.actionTimer + 1
end

function act_kate_peelout(m)
    local e = gKateExtraStates[m.playerIndex]
    if m.controller.buttonDown & B_BUTTON == 0 then
        m.forwardVel = 80
        m.vel.y = 30
        return set_mario_action(m, ACT_FREEFALL, 0)
    end
    perform_ground_step(m)
    set_mario_animation(m, MARIO_ANIM_RUNNING_UNUSED)
    m.actionTimer = m.actionTimer + 1
end

--[[
function act_kate_peelout(m)
    local e = gKateExtraStates[m.playerIndex]
    perform_ground_step(m)

    set_mario_animation(m, MARIO_ANIM_FORWARD_SPINNING)
    e.bounceHold = e.bounceHold + e.bounceTargetY*0.2
    if e.bounceHold > e.bounceTargetY then
        m.vel.y = e.bounceHold
        m.vel.x = m.vel.x * 0.6
        m.vel.z = m.vel.z * 0.6
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    m.actionTimer = m.actionTimer + 1
end
]]
hook_mario_action(ACT_KATE_BOUNCE_GROUND, act_kate_bounce_ground)
hook_mario_action(ACT_KATE_BOUNCE_WALL, act_kate_bounce_wall)
hook_mario_action(ACT_KATE_PEELOUT, act_kate_peelout)

local landActs = {
    [ACT_JUMP_LAND] = true,
    [ACT_AIR_THROW_LAND] = true,
    [ACT_HOLD_JUMP_LAND] = true,
    [ACT_SIDE_FLIP_LAND] = true,
    [ACT_BACKFLIP_LAND] = true,
    [ACT_DOUBLE_JUMP_LAND] = true,
    [ACT_TRIPLE_JUMP_LAND] = true,
    [ACT_FREEFALL_LAND] = true,
    [ACT_GROUND_POUND_LAND] = true,
    [ACT_LONG_JUMP_LAND] = true,
}

local bonkActs = {
    [ACT_SOFT_BONK] = true,
    [ACT_HARD_BACKWARD_AIR_KB] = true,
    [ACT_AIR_HIT_WALL] = true,
}

function before_kate_action(m, nextAct)
    local e = gKateExtraStates[m.playerIndex]
    if (landActs[nextAct] or (nextAct == ACT_JUMP and m.action == ACT_BUTT_SLIDE)) and m.vel.y < -15 and m.input & INPUT_A_DOWN ~= 0 then
        e.bounceHold = -math.max(math.abs(m.vel.y), math.abs(m.forwardVel))
        e.bounceTargetY = math.abs(e.bounceHold*0.9) - 10
        return set_mario_action(m, ACT_KATE_BOUNCE_GROUND, 0)
    end

    if (nextAct == ACT_SLIDE_KICK) then
        return set_mario_action(m, ACT_KATE_PEELOUT, 0)
    end

    if bonkActs[nextAct] and m.action ~= ACT_KATE_BOUNCE_WALL then
        e.bounceHold = -math.sqrt(m.vel.x^2 + m.vel.z^2)
        e.bounceTargetY = math.sqrt(m.vel.x^2 + m.vel.z^2)
        return set_mario_action(m, ACT_KATE_BOUNCE_WALL, 0)
    end
end

function kate_update(m)
    local e = gKateExtraStates[m.playerIndex]
    m.peakHeight = m.pos.y
    obj_set_gfx_scale(m.marioObj, e.scaleX, e.scaleY, e.scaleZ)
    e.scaleX = math.lerp(e.scaleX, 1, 0.3)
    e.scaleY = math.lerp(e.scaleY, 1, 0.3)
    e.scaleZ = math.lerp(e.scaleZ, 1, 0.3)
end

_G.charSelect.character_hook_moveset(CT_KATE, HOOK_BEFORE_SET_MARIO_ACTION, before_kate_action)
_G.charSelect.character_hook_moveset(CT_KATE, HOOK_MARIO_UPDATE, kate_update)