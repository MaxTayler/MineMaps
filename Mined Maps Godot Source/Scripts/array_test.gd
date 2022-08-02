extends Spatial

var row_0 = [0,1,2,3]
var row_1 =[1,2,3,0]
var row_2 = [2,3,1,2]
var row_3 =[3,0,1,2]

var map_2d = [row_0,row_1,row_2,row_3]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		print(map_2d[0][0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
