PLUGIN.name = "Blacklist for bad guys"
PLUGIN.author = "Dobytchick, Carlsmei"
PLUGIN.desc = "This plugin adds a blacklist"

local blacklist = {}

local function add_to_bk(key,rsn)
    blacklist[key] = {rsn}
end

--add_to_bk(string,string)
add_to_bk("STEAM_0:1:155659578", "damage to the server")

if SERVER then
    function PLUGIN:PlayerAuthed(ply, steamid, uniqueid)
        if blacklist[ply:SteamID()] then
            ply:Kick("Вы добавлены в черный список на данном сервере. Причина:"..blacklist[ply:SteamID()])
            ply:Ban(0, false)
        end
    end
end
