resource.AddFile("resources/fonts/BebasNeue_regular.ttf")
resource.AddFile("resources/fonts/Overseer.ttf")
resource.AddFile("resources/fonts/monofonto.ttf")
resource.AddFile("resources/fonts/RobotoCondensed-Bold.ttf")
resource.AddFile("resources/fonts/RobotoCondensed-Regular.ttf")

surface.CreateFont( "FS_Main", {
	font = "Roboto Condensed",
	size = ScreenScale( 10 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Main_Small", {
	font = "Roboto Condensed",
	size = ScreenScale( 9.5 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Main_Bold", {
	font = "Roboto Bold Condensed",
	size = ScreenScale( 10 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Side", {
	font = "Roboto Condensed",
	size = ScreenScale( 10 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Side_Small", {
	font = "Roboto Condensed",
	size = ScreenScale( 5 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Title", {
	font = "Overseer",
	size = ScreenScale( 10 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Title_Bold", {
	font = "Overseer Bold",
	size = ScreenScale( 10 ),
	antialias = true,
	extended = true,
} )

surface.CreateFont( "FS_Notify", {
	font = "Roboto Condensed",
	size = ScreenScale( 7 ),
	antialias = true,
	extended = true,
} )
