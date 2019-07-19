
-- AMBIENCE CONFIG
local function initAMBIENCE()

  -- AMBIENT MUSIC
  ----------------------------------------------------------------------------------------------------
  FO_AMB.RegisterTrack("Ambient1", "fs_map/ambient/sounds/fs_zwiedzanie_1.mp3", 126, 100)
  FO_AMB.RegisterTrack("Ambient2", "fs_map/ambient/sounds/fs_zwiedzanie_2.mp3", 211, 100)
  FO_AMB.RegisterTrack("Ambient3", "fs_map/ambient/sounds/fs_zwiedzanie_3.mp3", 270, 100)
  FO_AMB.RegisterTrack("Ambient4", "fs_map/ambient/sounds/fs_zwiedzanie_4.mp3", 210, 100)
  FO_AMB.RegisterTrack("Ambient5","fs_map/ambient/sounds/fs_zwiedzanie_5.mp3",240, 100)
  FO_AMB.RegisterTrack("Ambient6","fs_map/ambient/sounds/fs_zwiedzanie_6.mp3",270, 100)  
  FO_AMB.RegisterTrack("Ambient7","fs_map/ambient/sounds/fs_zwiedzanie_7.mp3",246, 100)
  FO_AMB.RegisterTrack("Ambient8","fs_map/ambient/sounds/fs_zwiedzanie_8.mp3",288, 100)
  ----------------------------------------------------------------------------------------------------

  -- RADIAL AMBIENCE
  --SKŁADNIA FO_AMB.RegisterTrack("NAZWA","ŚCIEŻKA",DŁUGOŚĆ TRACKU W SEKUNDACH, GŁOŚNOŚĆ, czy do bitki muza bool, "lokacja")--
 FO_AMB.RegisterTrack("Legion 1","fs_map/ambient/sounds/fs_cezar.mp3",252, 100, false, "Legion")  
 FO_AMB.RegisterTrack("NCR 1","fs_map/ambient/sounds/fs_miasto.mp3",264, 100, false, "NCR") 
 FO_AMB.RegisterTrack("Podziemia 1","fs_map/ambient/sounds/fs_podziemia.mp3",264, 100, false, "Schron")

 FO_AMB.RegisterTrack("BoS 1","fs_map/ambient/sounds/fs_bunkier.mp3",187, 100, false, "BoS")

  ---------------------------------------------------------------------------------------------------------

  --VECTORS FOR LOCATION BASED AMBIENCE
 FO_AMB.RadiusVecs["Legion"] = {Vec = Vector(6220, -762, 579), Rad = 3000} 	
 FO_AMB.RadiusVecs["NCR"] = {Vec = Vector(5201, 10852, 440), Rad = 4000}
 FO_AMB.RadiusVecs["BoS"] = {Vec = Vector(-6717, 29, -2998), Rad = 3200}  
 FO_AMB.RadiusVecs["Schron"] = {Vec = Vector(-7997, 10562, -838), Rad = 1000}  

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