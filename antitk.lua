PLUGIN.name = "Anti-teamkill"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Notify and kick for teamkilling player."

function PLUGIN:PlayerSpawn(client)
    client:setNetVar("rdm_counter", 0)
end

function PLUGIN:PlayerDeath(client, inflictor, attacker)
    if client != attacker and IsValid(client) and IsValid(attacker) and attacker:IsPlayer() then
        if attacker:Team() == client:Team() then
		attacker:setNetVar("killed_players", attacker:getNetVar("killed_players",0) + 1)
		attacker:notify("You killed your, if you continue - you will get a ban!")
        end
    end
	
	timer.Create("CheckForKills"..attacker:EntIndex(),300,0,function()
		if attacker:getNetVar("killed_players",0) != 0 then
			attacker:setNetVar("killed_players", attacker:getNetVar("killed_players",0) - 1)
		end
	end)

    if (client:getChar()) then
        if attacker:getNetVar("killed_players",0) > 2 then 
            attacker:Ban(60,true) 
        end 
    end
end

function PLUGIN:PlayerDisconnected(ply)
    if timer.Exists("CheckForKills"..ply:EntIndex()) then
        timer:Remove()
    end
end
