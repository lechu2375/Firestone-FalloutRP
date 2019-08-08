




local function readpos()
    net.Start("FS.RequestSpawnPos")
    net.SendToServer()
end

net.Receive("FS.RequestSpawnPos", function( )
	local postable = util.JSONToTable(util.Decompress(net.ReadString()))
end ) 
 


hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if not FSItemSpawnerDebug then return end
	render.SetColorMaterial()
	for _,v in ipairs(postable) do
        render.DrawSphere( v, 100, 15, 15, Color( 0, 175, 175, 100 ) )
    end
end )

concommand.Add("spawnerdebug", function()
    if not postable then readpos() end

    if FSItemSpawnerDebug then
        FSItemSpawnerDebug = nil 
    else
        FSItemSpawnerDebug = true
    end
end)