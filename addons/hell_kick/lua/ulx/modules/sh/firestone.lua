local CATEGORY_NAME = "Firestone"

------------------------------ Hell Kick ------------------------------
function ulx.hkick( calling_ply, target_ply, reason )
	if target_ply:IsListenServerHost() then
		ULib.tsayError( calling_ply, "This player is immune to kicking", true )
		return
	end

	if reason and reason ~= "" then
		ulx.fancyLogAdmin( calling_ply, "#A kicked #T (#s)", target_ply, reason )
		target_ply:HellKick()
	else
		reason = nil
		ulx.fancyLogAdmin( calling_ply, "#A kicked #T", target_ply )
		target_ply:HellKick()
	end

	timer.Simple(6, function()
		ULib.queueFunctionCall( ULib.kick, target_ply, reason, calling_ply )
	end)
end
local hkick = ulx.command( CATEGORY_NAME, "ulx hkick", ulx.hkick, "!hkick" )
hkick:addParam{ type=ULib.cmds.PlayerArg }
hkick:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
hkick:defaultAccess( ULib.ACCESS_ADMIN )
hkick:help( "Kicks target." )

------------------------------ Hell Ban ------------------------------
function ulx.hban( calling_ply, target_ply, minutes, reason )
	if target_ply:IsListenServerHost() or target_ply:IsBot() then
		ULib.tsayError( calling_ply, "This player is immune to banning", true )
		return
	end

	local time = "for #s"
	if minutes == 0 then time = "permanently" end
	local str = "#A banned #T " .. time
	if reason and reason ~= "" then str = str .. " (#s)" end
	ulx.fancyLogAdmin( calling_ply, str, target_ply, minutes ~= 0 and ULib.secondsToStringTime( minutes * 60 ) or reason, reason )
	target_ply:HellBan()
	
	timer.Simple(6, function()
		ULib.queueFunctionCall( ULib.kickban, target_ply, minutes, reason, calling_ply )
	end)
end
local hban = ulx.command( CATEGORY_NAME, "ulx hban", ulx.hban, "!hban", false, false, true )
hban:addParam{ type=ULib.cmds.PlayerArg }
hban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
hban:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
hban:defaultAccess( ULib.ACCESS_ADMIN )
hban:help( "Bans target." )