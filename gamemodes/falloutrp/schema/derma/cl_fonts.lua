resource.AddFile("resources/fonts/BebasNeue_regular.ttf")
resource.AddFile("resources/fonts/Overseer.ttf")
resource.AddFile("resources/fonts/monofonto.ttf")
resource.AddFile("resources/fonts/RobotoCondensed-Bold.ttf")
resource.AddFile("resources/fonts/RobotoCondensed-Regular.ttf")


surface.CreateFont( "FS_Main", {
	font = "Roboto Condensed",
	size = 26,
	antialias = true,
} )

surface.CreateFont( "FS_Main_Small", {
	font = "Roboto Condensed",
	size = 24,
	antialias = true,
} )

surface.CreateFont( "FS_Main_Bold", {
	font = "Roboto Bold Condensed",
	size = 26,
	antialias = true,
} )

surface.CreateFont( "FS_Side", {
	font = "Monofonto-Regular",
	size = 26,
	antialias = true,
} )

surface.CreateFont( "FS_Side_Small", {
	font = "Monofonto-Regular",
	size = 16,
	antialias = true,
} )

surface.CreateFont( "FS_Title", {
	font = "Overseer",
	size = 26,
	antialias = true,
} )

surface.CreateFont( "FS_Title_Bold", {
	font = "Overseer Bold",
	size = 26,
	antialias = true,
} )

surface.CreateFont( "FS_Notify", {
	font = "Trebuchet24",
	size = 20,
	antialias = true,
} )
