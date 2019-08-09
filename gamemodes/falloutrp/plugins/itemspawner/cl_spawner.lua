


local postable = postable or nil

local function readpos()
    net.Start("FS.RequestSpawnPos")
    net.SendToServer()
end

net.Receive("FS.RequestSpawnPos", function()
	postable = util.JSONToTable(net.ReadString())
end ) 
 


hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if not FSItemSpawnerDebug then return end
	render.SetColorMaterial()
	for _,v in ipairs(postable) do
        render.DrawSphere( v, 100, 15, 15, Color( 0, 175, 175, 100 ) )
    end
end )

concommand.Add("spawnerdebug", function()
    if not LocalPlayer():IsAdmin() then return end
    if not postable then 
        readpos() 
    end
    if FSItemSpawnerDebug then
        FSItemSpawnerDebug = false 
    else
        FSItemSpawnerDebug = true
    end
end)

concommand.Add("spawnerdebugreloadpos", function()
    if not LocalPlayer():IsAdmin() then return end
        readpos() 
end)