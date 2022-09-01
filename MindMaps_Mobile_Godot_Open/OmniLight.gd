extends Light2D

var color2 = Color( 0, 1, 1, 1 ) #-- Cornflower color

# Called when the node enters the scene tree for the first time.
func _ready():
	color = color2
	pass # Replace with function body
	
func update_color(new_color):
	color = new_color
	#print(new_color)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
