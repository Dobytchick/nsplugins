PLUGIN.name = "Blacklist for bad guys"
PLUGIN.author = "Dobytchick, Carlsmei"
PLUGIN.desc = "This plugin dds a blacklist. Do not remove those who are in it, because they can harm your servers"

local blacklist = {}

local function add_to_bk(key,rsn)
    blacklist[key] = {rsn}
end

--add_to_bk(string,string)
add_to_bk("STEAM_0:1:155659578", "damage to the server")

if SERVER then
    function PLUGIN:CheckPassword(steamid64)
        local steamid = util.SteamIDFrom64(steamid64)
        if blacklist[steamid] then
            return false, blacklist[steamid]
        end
    end
end
