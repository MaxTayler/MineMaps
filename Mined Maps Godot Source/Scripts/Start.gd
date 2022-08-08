extends Control
var start = true
onready var controls = get_node("/root/Spatial/Controls")
 
func _ready():
	print ("control object test:")
	print(controls)
	pass#_draw()

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			print("Input  Works")#start()
			controls.next_level()
			queue_free()
func _draw():
	var color = Color(0.5,0.5,0.5,0.8)
	var rect = Rect2(Vector2(0,200),Vector2(1050,200)) #XY
	draw_rect(rect,color)
