PLUGIN.name = "VJBASE Notarget"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Notrarget for NPC on vjbase"

if SERVER then
    function PLUGIN:PlayerSpawn(player)
        if player:Team() == FACTION_MONOLIT then
            player:SetNoTarget(true) 
            player.VJ_NoTarget = true
        else
            player:SetNoTarget(false) 
            player.VJ_NoTarget = false
        end
    end
end
