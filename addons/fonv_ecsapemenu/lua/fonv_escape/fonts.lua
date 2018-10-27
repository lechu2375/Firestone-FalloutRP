if CLIENT then

local fonttext = "Arial"

	surface.CreateFont( "text",
	{
		font      = fonttext,
		size      = 24,
		weight    = -1,
	}

 )
	surface.CreateFont( "text_blur",
	{
		font      = fonttext,
		size      = 24,
		weight    = -1,
		underline = 0,
		additive  = false,
		outline = false,
		blursize = 6
	}

 )

surface.CreateFont( "text_big",
	{
		font      = fonttext,
		size      = 72,
		weight    = -1,
	}

 )
	surface.CreateFont( "text_blur_big",
	{
		font      = fonttext,
		size      = 72,
		weight    = -1,
		underline = 0,
		additive  = false,
		outline = false,
		blursize = 10
	}

 )
end