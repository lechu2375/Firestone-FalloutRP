function FS_ConvertTime( timeGiven )
    local time = string.NiceTime( timeGiven )
    time = string.Replace(time, "minutes", "minut")
    time = string.Replace(time, "hour", "godzinę")
    time = string.Replace(time, "hours", "godziny")
    return time
end