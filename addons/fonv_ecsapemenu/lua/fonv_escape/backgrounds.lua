function Esc.Background()

	if ( !BgSlideOn ) then
		local Bg = 'materials/bg/'..math.random(1,35)..'.jpg'
		FalloutEsc.BgImg = Bg
		BgSlideOn = true;
		BgChangeTime = CurTime() + FalloutEsc.BgChangeSlideTime
	end
	
	Materials(FalloutEsc.BgImg, 0, 0, ScrW(), ScrH())
end

hook.Add('Think', 'testbg', function()
	if (BgSlideOn == true) then
		if CurTime() > BgChangeTime then 
			local Bg = 'materials/bg/'..math.random(1,35)..'.jpg'
			FalloutEsc.BgImg = Bg
			BgChangeTime = CurTime() + FalloutEsc.BgChangeSlideTime
		end
	end
end)