nut.command.add("bugmenu", {
	onRun = function(ply, arg)
        net.Start("FS_RunAdvert")
        net.Start("fs_bug_ui")
        net.Send(ply)
	end
})