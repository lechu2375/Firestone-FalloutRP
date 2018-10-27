function Materials( mat, x, y, w, h )
	surface.SetDrawColor( Color(255,255,255,255) )
	surface.SetMaterial( Material( mat ) )
	surface.DrawTexturedRect( x, y, w, h)
end

function DrawBox( x, y, w, h, col )
	surface.SetDrawColor(col)
	surface.DrawRect(x, y, w, h)
end

function TextBlur(text, x, y, col, colblur, pos)
	for i=1,9 do
		draw.SimpleText(text, "text_blur", x, y, colblur, pos)
	end
	draw.SimpleText(text, "text", x, y, col, pos)
end

function TextBlurBig(text, x, y, col, colblur, pos)
	for i=1,9 do
			draw.SimpleText(text, "text_blur_big", x, y, colblur, pos)
	end
	draw.SimpleText(text, "text_big", x, y, col, pos)
end