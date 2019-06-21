Firestone = Firestone or {}
FSE = Firestone.FSE or {}
FSE.EventsTable = FSE.EventsTable or {}

include("fse_core/events.lua")
print("FSE load")

timer.Simple(7, function ()
    print("FSE timerek")
    FSE.EventsTable.testowy.func()
end)
