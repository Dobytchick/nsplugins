PLUGIN.name = "Нотаргит"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Хуяргит блять"

if SERVER then
    function PLUGIN:PlayerLoadedChar(client, character, lastChar)
        if client:Team() == FACTION_MONOLIT then
            client:SetNoTarget(true) 
            client.VJ_NoTarget = true
        end
    end
end