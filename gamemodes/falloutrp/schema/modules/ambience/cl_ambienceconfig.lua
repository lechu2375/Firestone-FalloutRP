
-- AMBIENCE CONFIG
local function initAMBIENCE()

  -- AMBIENT MUSIC
  ----------------------------------------------------------------------------------------------------
  FO_AMB.RegisterTrack("Ambient1", "fs_map/ambient/sounds/fs_zwiedzanie_1.mp3", 126, 100)
  FO_AMB.RegisterTrack("Ambient2", "fs_map/ambient/sounds/fs_zwiedzanie_2.mp3", 211, 100, {"Legion"})
  FO_AMB.RegisterTrack("Ambient3", "fs_map/ambient/sounds/fs_zwiedzanie_3.mp3", 270, 100)
  FO_AMB.RegisterTrack("Ambient4", "fs_map/ambient/sounds/fs_zwiedzanie_4.mp3", 210, 100, {"NCR"})
  FO_AMB.RegisterTrack("Ambient5","fs_map/ambient/sounds/fs_zwiedzanie_5.mp3",240, 100, {"Legion"})
  FO_AMB.RegisterTrack("Ambient6","fs_map/ambient/sounds/fs_zwiedzanie_6.mp3",270, 100, {"NCR"})  
  FO_AMB.RegisterTrack("Ambient7","fs_map/ambient/sounds/fs_zwiedzanie_7.mp3",246, 100, {"Legion"})
  FO_AMB.RegisterTrack("Ambient8","fs_map/ambient/sounds/fs_zwiedzanie_8.mp3",288, 100, {"NCR"})
  ----------------------------------------------------------------------------------------------------

  -- RADIAL AMBIENCE
  --SKŁADNIA FO_AMB.RegisterTrack("NAZWA","ŚCIEŻKA",DŁUGOŚĆ TRACKU W SEKUNDACH, GŁOŚNOŚĆ, czy do bitki muza bool, "lokacja")--
 FO_AMB.RegisterTrack("Legion 1","fs_map/ambient/sounds/fs_cezar.mp3",252, 100, nil, "Legion")  
 FO_AMB.RegisterTrack("NCR 1","fs_map/ambient/sounds/fs_miasto.mp3",264, 100, nil, "NCR") 
 FO_AMB.RegisterTrack("Podziemia 1","fs_map/ambient/sounds/fs_podziemia.mp3",264, 100, nil, "Schron")

 FO_AMB.RegisterTrack("BoS 1","fs_map/ambient/sounds/fs_bunkier.mp3",187, 100, nil, "BoS")

  ---------------------------------------------------------------------------------------------------------

  --VECTORS FOR LOCATION BASED AMBIENCE
 FO_AMB.RadiusVecs["Legion"] = {Vec = Vector(5936, 96, 595.054), Rad = 2816} 	
 FO_AMB.RadiusVecs["NCR"] = {Vec = Vector(5261.08, 10732.5, 392), Rad = 5427}
 FO_AMB.RadiusVecs["BoS"] = {Vec = Vector(-9160, 3696, -5464), Rad = 4640}  
 FO_AMB.RadiusVecs["Schron"] = {Vec = Vector(-7880, 10976, -416), Rad = 2056}  

end 

------------------------
--
timer.Simple(1,function()
initAMBIENCE()
end)

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- 		   TUTORIAL			 --
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- This tutorial will help you add your own ambience tracks,
-- see below to find out what each second of the line of code means.

-- FO_AMB.RegisterTrack("The Courier Walks Softly","nv_ambiant/nv_13.mp3",246,false,100) <-- This is what the code looks like,
-- If we look at the code more here is what it means:

-- FO_AMB.RegisterTrack, This part of the code is to register the the track with the ambience system.
-- ("Example track Name" (String), "PATH TO THE AMBIENT SOUND TRACKS" (String), Number of seconds the track should play for (Number), is this track combat music (true or false), how loud should the track play? (Number))

-- (THIS TUTORIAL IS TO BE IMPROVED LATER.)

--=-=-=-=-=-=-=-=-=-=-=-=-=-=
--       END TUTORIAL      --
--=-=-=-=-=-=-=-=-=-=-=-=-=-=