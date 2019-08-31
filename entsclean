PLUGIN.name = "Misc ents remove"
PLUGIN.author = "Dobytchick"
PLUGIN.desc = "Remove ragdolls, items and other shit."

local text = "After 60 seconds all items will be deleted (Ragdolls, items, money)"

local EntsForClean = {}
EntsForClean["prop_ragdoll"] = true
EntsForClean["nut_item"] = true
EntsForClean["nut_money"] = true

if CLIENT then
    timer.Create("notify_1_minute", 640, 0, function()
        for i=1,4 do
            chat.AddText(Color(217, 89, 89),text)
        end
    end)
end

if SERVER then
    timer.Create("Timer", 700, 0, function()
        for k,v in pairs(ents.GetAll()) do
            if EntsForClean[v:GetClass()] then
                v:Remove()
            end
        end
    end)
end
