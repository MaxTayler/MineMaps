extends Light


# Declare member variables here. Examples:
# var color1 = Color( 1, 0.84, 0, 1 ) 
# var color1 = Color( 0, 0.75, 0.5, 1 ) # var b = "text"
var color2 = Color( 0.39, 0.58, 0.93, 1 ) #-- Cornflower color

# Called when the node enters the scene tree for the first time.
func _ready():
	light_color = color2
	pass # Replace with function body
	
func update_color(new_color):
	light_color = new_color
	#print(new_color)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
