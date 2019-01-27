function FS_ConvertTime( timeGiven )
    local time = string.NiceTime( timeGiven )
    if string.find(time, "weeks") then
        time = string.Replace(time, "weeks", "tygodni/e")
    elseif string.find(time, "week") then
        time = string.Replace(time, "week", "tydzien")
    elseif string.find(time, "days") then
        time = string.Replace(time, "days", "dni")
    elseif string.find(time, "day") then
        time = string.Replace(time, "day", "dzien")
     elseif string.find(time, "hours") then
        time = string.Replace(time, "hours", "godzin/y")
    elseif string.find(time, "hour") then
        time = string.Replace(time, "hour", "godzine")
     elseif string.find(time, "minutes") then
        time = string.Replace(time, "minutes", "minut")
    end
    return time
end