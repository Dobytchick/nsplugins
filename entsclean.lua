local PLUGIN = PLUGIN

PLUGIN.name = "Misc ents remove"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Remove ragdolls, items and other shit."

PLUGIN.textToClean = "Через 60 секунд удалятся предметы, регдоллы, деньги, лежащие на земле"

PLUGIN.EntsForClean = {}
PLUGIN.EntsForClean["prop_ragdoll"] = true
PLUGIN.EntsForClean["nut_item"] = true
PLUGIN.EntsForClean["nut_money"] = true

nut.config.add("cleanTime", 700, "Seconds before garbage disposal", nil, {
	data = {min = 1, max = 1000},
    category = "Misc Ents Remove",
})

if CLIENT then
    timer.Create("notify_1_minute", nut.config.get("cleanTime") - 60, 0, function()
        for i=1,2 do
            chat.AddText(Color(217, 89, 89),"[!] " .. PLUGIN.textToClean)
        end
    end)
end

if SERVER then
    timer.Create("Timer", nut.config.get("cleanTime"), 0, function()
        for k,v in pairs(ents.GetAll()) do
            if PLUGIN.EntsForClean[v:GetClass()] then
                v:Remove()
            end
        end
    end)
end
