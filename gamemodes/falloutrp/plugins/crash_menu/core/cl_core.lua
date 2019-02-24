if !CLIENT then return end
local PLUGIN = PLUGIN
local lastRequest = -1
local lastCheck = 0

surface.CreateFont( "CrashTextFont", {
    size = ScreenScale( 32 ),
	font = "Bebas Neue",
    antialias = true,
	extended = true,
} )

local function CheckCrash()
	net.Start("Crash_Check")
	net.SendToServer()
	lastRequest = CurTime()
end
timer.Create("Check Crash", 5, 0, CheckCrash)

net.Receive("Crash_Check", function()
    lastRequest = -1
end)

hook.Add("PostRenderVGUI", "FS_Crash", function()
    if lastRequest == -1 then
        if CurTime() - lastCheck > 5 then 
            lastCheck = CurTime()
            CheckCrash()
        end
        return
    end
    if CurTime() - lastRequest < 5 then return end
    local toReconnect = 35 - math.Round(CurTime() - lastRequest) + 5

    if toReconnect == 0 then 
        RunConsoleCommand("retry")
    end

    surface.SetDrawColor(0,0,0,245)
    surface.DrawRect(0, 0, ScrW(), ScrH())
    draw.SimpleText("Utracono połączenie z serwerem", "CrashTextFont", ScrW()/2, ScrH()/2.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("Połączymy cię ponownie za "..toReconnect.." sekund/y", "CrashTextFont", ScrW()/2, ScrH()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end)