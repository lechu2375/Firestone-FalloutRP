PLUGIN.name = "Pac Flag"
PLUGIN.author = "Stealthy Zoroark"
PLUGIN.desc = "Adds 'P' flag."

nut.flag.add("P", "Access to PAC 3 editor.")

hook.Add( "PrePACEditorOpen", "FlagCheck", function( client )
   if not client:getChar():hasFlags("P") then
       return false
   end
end )