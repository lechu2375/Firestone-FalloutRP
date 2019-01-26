function firestone_util_timeconver(time)
    local minuty = math.floor((time/60))
    local godziny = math.floor((minuty/60))
    if godziny < 1 then
        return "Minuty: "..minuty
    else
        return "Godziny: "..godziny.." Minuty: "..minuty
    end
end
