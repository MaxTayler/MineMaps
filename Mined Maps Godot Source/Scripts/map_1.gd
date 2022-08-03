extends Node

var row_0 = [0,0,0,0,0,0,0]
var row_1 = [0,4,3,2,7,6,0]
var row_2 = [0,3,2,1,1,2,0]
var row_3 = [0,2,1,1,2,3,0]
var row_4 = [0,1,5,2,3,4,0]
var row_5 = [0,0,0,0,0,0,0]

var map_2d = [row_0,row_1,row_2,row_3,row_4]

var start_x = 4
var start_y = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Level One Loaded")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
