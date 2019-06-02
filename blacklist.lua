PLUGIN.name = "Blacklist for bad guys" -- Не уверен, но щитаю ты можешь забрать это себе, потому что я это выкладывал в нейтралку.
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "This plugin dds a blacklist. Do not remove those who are in it, because they can harm your servers"

local blacklist =
{
["STEAM_0:1:155659578"] = {reason =     "Нанесение вреда серверу"}, -- preacher
["STEAM_0:1:74508052"] = {reason =      "Читы"}, -- ariston
["STEAM_0:0:90027894"] = {reason =      "Нанесение вреда серверу"}, -- brick
["STEAM_0:1:154479925"] = {reason =     "Нанесение вреда серверу"}, -- jajaez
["STEAM_0:0:90699715"] = {reason =      "Читы"}, -- yth (chexov)
["STEAM_0:0:62724395"] = {reason =      "Нанесение вреда серверу"}, -- willson
["STEAM_0:1:60351139"] = {reason =      "Читы"}, -- otto
["STEAM_0:1:155659578"] = {reason =     "Читы"}, -- kisel
["STEAM_0:1:155659578"] = {reason =     "Нанесение вреда серверу"}, -- nekromant
["STEAM_0:0:138923478"] = {reason =     "Нанесение вреда серверу"}, -- norkhel
["STEAM_0:1:111135272"] = {reason =     "Реклама"}, -- Триумф
["STEAM_0:0:452979288"] = {reason =     "Читы"}, -- Оскал
["STEAM_0:1:111135272"] = {reason =     "Читы"}, -- Болотник
}
if SERVER then
    function PLUGIN:PlayerAuthed(ply, steamid, uniqueid)
    if blacklist[ply:SteamID()] then
        ply:Kick("Вы добавлены в черный список на данном сервере. Причина:"..blacklist[ply:SteamID()].reason)
        ply:Ban(0, false)
    end
end
end