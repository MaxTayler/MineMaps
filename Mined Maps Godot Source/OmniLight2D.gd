extends Light2D
var color2 = Color( 0, 0, 0, 0 ) #-- Cornflower color

func _ready():
	color = color2
	
func update_color(new_color):
	color = new_color
