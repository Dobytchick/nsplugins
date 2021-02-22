PLUGIN.name = "Anti-teamkill"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Notify and kick for teamkilling player."

local set = cookie.Set
local get = cookie.GetNumber

function PLUGIN:PlayerDeath(client, inflictor, attacker)
    if client != attacker and IsValid(client) and IsValid(attacker) and attacker:IsPlayer() then
        if attacker:Team() == client:Team() then
		attacker.attack_counter = (attacker.attack_counter || 0) + 1
			
		if attacker.attack_counter > 1 then
			set("rdm_count"..attacker:SteamID64(), attacker.attack_counter)
			attacker:notify("You killed your, if you continue - you will get a ban!")
		end
			
		timer.Simple(10,function() 
			if attacker.attack_counter then 
				attacker.attack_counter = attacker.attack_counter - 1 
				set("rdm_count"..attacker:SteamID64(), attacker.attack_counter)
			end 
		end)
        end
    end

    if (client:getChar()) then
        if get("rdm_count"..attacker:SteamID64(), 0) > 2 then 
            attacker:Ban(60,true) 
        end 
    end
end
