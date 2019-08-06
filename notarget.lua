PLUGIN.name = "VJBASE Notarget"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Notrarget for NPC on vjbase"

local factions = {}

local function addTable(text)
    factions[text] = true
end

addTable(FACTION_MONOLIT) -- Use this function for add faction on notarget.

if SERVER then
    function PLUGIN:PlayerSpawn(player)
        if factions[player:Team()] then
            player:SetNoTarget(true) 
            player.VJ_NoTarget = true
        else
            player:SetNoTarget(false) 
            player.VJ_NoTarget = false
        end
    end
end
