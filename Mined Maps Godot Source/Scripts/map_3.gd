extends Node

var row_1 = [0,0,0,0,0,0,0,0,0]
var row_2 = [0,4,3,2,1,1,1,7,0]
var row_3 = [0,3,2,1,1,7,1,0,0]
var row_4 = [0,2,1,5,1,1,1,2,0]
var row_5 = [0,1,1,1,1,1,2,3,0]
var row_6 = [0,1,1,1,1,2,3,4,0]
var row_7 = [0,1,1,6,1,2,3,4,0]
var row_8 = [0,0,0,0,0,0,0,0,0]
var map_2d = [row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8]

var start_x = 3
var start_y = 3

# Called when the node enters the scene tree for the first time.
func _ready():
		print(map_2d[3][3])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
