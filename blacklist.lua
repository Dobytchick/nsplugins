PLUGIN.name = "Blacklist for bad guys"
PLUGIN.author = "Dobytchick, Carlsmei"
PLUGIN.desc = "This plugin adds a blacklist"

local bList = {}
bList[ "STEAM_0:1:155659578" ] = "Damage to the server"

if SERVER then
    function PLUGIN:PlayerAuthed( ply, steamid, uniqueid )
        if blacklist[ ply:SteamID() ] then
            ply:Ban( 0 )
            ply:Kick( "Вы добавлены в черный список на данном сервере. Причина:" .. blacklist[ ply:SteamID() ] )
        end
    end
end
