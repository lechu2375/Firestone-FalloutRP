
util.AddNetworkString("FSEventSoundPlay")
print("[FSE LOG] Core Loaded")




function FSE.RunRandomEvent()
    local event = table.Random(FSE.EventsTable) --declare table
    print("[FSE]Random event has started.") --print in console
    if not event then return end --if not table then end function
    if event.func then --if event.func then run function from the table
        event.func()
    end
    if event.msg then -- if message name then broadcast sound play and notufy all
        net.Start("FSEventSoundPlay")
        net.Broadcast()
        for k,v in pairs(player.GetAll()) do
            v:Notify(event.msg) --CUSTOM NOTIFICATION LIB, CHANGE THIS
        end
    end


end

if not timer.Exists("FSE.TIMER") then
    timer.Create("FSE.TIMER", FSE.Time, 0, FSE.RunRandomEvent) --safety timer
end
if not timer.Exists("FSE.SafetyTimer") then 
    timer.Create("FSE.SafetyTimer", FSE.Time+1, 0, function() --jak sie timer wywalił przez funkcje z eventu wtedy na nowo go odpala
        if not timer.Exists("FSE.TIMER") then
            timer.Create("FSE.TIMER", FSE.Time, 0, FSE.RunRandomEvent)
        end
    end)
end
