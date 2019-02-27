if !CLIENT then return end
local PLUGIN = PLUGIN

function PLUGIN:CharacterLoaded()
	lchar = LocalPlayer():getChar()
end

local width = ScrW()
local height = ScrH()
local lightColor = Color(17,255,31)
local healthLerp = 100
local staminaLerp = 100

local function DrawBar( x, y, side, text, lerp )
local textPos = nil
  if side == "Left" then
  	textPos = x - 40
  elseif side == "Right" then
  	textPos = x + width*0.2 + 5
  end
	surface.SetDrawColor(lightColor)
	surface.DrawRect(x, y, width*0.2, 3)
	surface.DrawRect(x, y - 10, 3, 10)
	surface.DrawRect(x + width*0.2 - 3, y - 10, 3, 10)
	if lerp then
		healthLerp = Lerp(4 * FrameTime(), healthLerp, LocalPlayer():Health())
		staminaLerp = Lerp(8 * FrameTime(), staminaLerp, lchar:getVar("stm"))
		surface.DrawRect(x, y - 10,(lerp * (ScrW() * 0.2) )/100, 10)
	end
	if text then
		draw.SimpleText(text, "F4_Hud_Font", textPos, y - 18 , lightColor)
	end
end


function PLUGIN:HUDPaint()

	if !LocalPlayer():Alive() or lchar == nil then return end
	// HP, AP

	DrawBar(width*0.07, height*0.93, "Left", "HP", healthLerp)
  	DrawBar(width*0.73, height*0.93, "Right", "ST", staminaLerp)

	// KOMPAS PO STARYM JEBANY

	DrawBar(width*0.4, height*0.93)
	local ang = LocalPlayer():EyeAngles()
	local vector = LocalPlayer():GetPos() + Vector(500,0,0) - LocalPlayer():GetShootPos()
	vector = vector:GetNormal()
	local pos = ang:Right():Dot(vector)*-1

	local alpha = 255 - math.abs(pos)*255
	surface.SetDrawColor(17,255,31,alpha)

	if ang.y > -90 and ang.y < 90 then
		draw.SimpleText("N", "F4_Hud_Font", width*0.5 + pos*ScrW()/10 -1,height*0.96,Color(17,255,31,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.DrawRect(width/2 + pos*ScrW()/10 - 1,height*0.93,3,15)
	end

	local vector = LocalPlayer():GetPos() + Vector(0,500,0) - LocalPlayer():GetShootPos()
	vector = vector:GetNormal()
	local pos = ang:Right():Dot(vector)
	local alpha = 255 - math.abs(pos)*255
	surface.SetDrawColor(17,255,31,alpha)
	if ang.y < 0 and ang.y > -180 then
		draw.SimpleText("E", "F4_Hud_Font", width*0.5 + pos*ScrW()/10 -1,height*0.96,Color(17,255,31,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.DrawRect(width/2 + pos*ScrW()/10 -1,height*0.93,3,15)
	end

	local vector = LocalPlayer():GetPos() + Vector(0,-500,0) - LocalPlayer():GetShootPos()
	vector = vector:GetNormal()
	local pos = ang:Right():Dot(vector)
	local alpha = 255 - math.abs(pos)*255
	surface.SetDrawColor(17,255,31,alpha)
	if ang.y > 0 and ang.y < 180 then
		draw.SimpleText("W", "F4_Hud_Font", width*0.5 + pos*ScrW()/10 -1,height*0.96,Color(17,255,31,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.DrawRect(width/2 + pos*ScrW()/10 -1,height*0.93,3,15)
	end

	local vector = LocalPlayer():GetPos() + Vector(-500,0) - LocalPlayer():GetShootPos()
	vector = vector:GetNormal()
	local pos = ang:Right():Dot(vector)*-1
	local alpha = 255 - math.abs(pos)*255
	surface.SetDrawColor(17,255,31,alpha)
	if (ang.y > 90 or ang.y < -90) then
		draw.SimpleText("S", "F4_Hud_Font", width*0.5 + pos*ScrW()/10 -1,height*0.96,Color(17,255,31,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.DrawRect(width/2 + pos*ScrW()/10 -1,height*0.93,3,15)
	end

	// AMMO

	local weapon = LocalPlayer():GetActiveWeapon()
	if !IsValid(weapon) then return end
	local clipAmmo = tonumber(weapon:Clip1()) or -1
	local restOfAmmo = LocalPlayer():GetAmmoCount(weapon:GetPrimaryAmmoType() or "")
	if clipAmmo != -1 then
		if clipAmmo > 99 then
			clipAmmo = clipAmmo
		elseif clipAmmo > 9 then
			clipAmmo = "0"..clipAmmo
		else
			clipAmmo = "00"..clipAmmo
		end
		if restOfAmmo > 99 then
			restOfAmmo = restOfAmmo
		elseif restOfAmmo > 9 then
			restOfAmmo = "0"..restOfAmmo
		else
			restOfAmmo = "00"..restOfAmmo
		end
		draw.SimpleText(clipAmmo,"F4_Ammo_Font",width*0.94,height*0.84, lightColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.DrawRect(width*0.923, height*0.86, 60, 3 )
		draw.SimpleText(restOfAmmo,"F4_Ammo_Font",width*0.94,height*0.88, lightColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

end

surface.CreateFont( "F4_Hud_Font", {
	font = "Roboto Condensed",
	size = 36,
	antialias = true,
	shadow = true,
	extended = true,
} )

surface.CreateFont( "F4_Ammo_Font", {
	font = "Roboto Condensed",
	size = 40,
	antialias = true,
	shadow = true,
	extended = true,
} )


hook.Add( "ShouldHideBars", "Hiding NS Hud", function()
	return true
end)

hook.Add( "CanDrawAmmoHUD", "Hiding NS Ammo Hud", function()
	return false
end)
