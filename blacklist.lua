PLUGIN.name = "Blacklist for bad guys"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "This plugin dds a blacklist. Do not remove those who are in it, because they can harm your servers"

local blacklist = {}

local function add_to_bk(key,rsn)
    blacklist[key] = {reason = rsn}
end

--add_to_bk(string,string)
add_to_bk("STEAM_0:1:155659578", "damage to the server")

if SERVER then
    function PLUGIN:PlayerAuthed(ply, steamid, uniqueid)
    if blacklist[ply:SteamID()] then
        ply:Kick("Вы добавлены в черный список на данном сервере. Причина:"..blacklist[ply:SteamID()].reason)
        ply:Ban(0, false)
    end
end
end
