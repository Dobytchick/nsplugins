PLUGIN.name = "Anti-teamkill"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Notify and kick for teamkilling player."

function PLUGIN:PlayerSpawn(client)
    client:setNetVar("rdm_counter", 0)
end

function PLUGIN:PlayerDeath(client, inflictor, attacker)
    if client != attacker and IsValid(client) and IsValid(attacker) and attacker:IsPlayer() then
        if attacker:Team() == client:Team() then
					attacker:setNetVar("rdm_counter", attacker:getNetVar("rdm_counter",0) + 1)
					attacker:notify("Вы убили своего, если вы продолжите - вы получите бан")
        end
    end

    if (client:getChar()) then
        if attacker:getNetVar("rdm_counter",0) > 2 then 
            attacker:Ban(60,true) 
        end 
    end
end
