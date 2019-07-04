
util.AddNetworkString("FSEventSoundPlay")
print("[FSE LOG] Core Loaded")




function FSE.RunRandomEvent()
    local event = table.Random(FSE.EventsTable)
    print("[FSE]Random event has started.")
    if not event then return end
    if event.func then
        event.func()
    end
    if event.msg then
        net.Start("FSEventSoundPlay")
        net.Broadcast()
        for k,v in pairs(player.GetAll()) do
            v:Notify(event.msg)
        end
    end


end

timer.Create("FSE.TIMER", FSE.Time, 0, FSE.RunRandomEvent)

timer.Create("FSE.SafetyTimer", FSE.Time+1, 0, function() --jak sie timer wywalił przez funkcje z eventu wtedy na nowo go odpala
    if not timer.Exists("FSE.TIMER") then
        timer.Create("FSE.TIMER", FSE.Time, 0, FSE.RunRandomEvent)
    end
end)

