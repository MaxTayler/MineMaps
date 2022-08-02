extends Node

var row_1 = [0,0,0,0,0,0,0,0,0,0,0]
var row_2 = [0,1,1,1,1,1,1,1,1,1,0]
var row_3 = [0,1,1,1,1,1,1,1,1,1,0]
var row_4 = [0,1,1,1,1,1,1,1,1,1,0]
var row_5 = [0,1,1,1,1,1,1,1,1,1,0]
var row_6 = [0,1,1,1,1,1,1,1,1,1,0]
var row_7 = [0,1,1,1,1,1,1,1,1,1,0]
var row_8 = [0,1,1,1,1,1,1,1,1,1,0]
var row_9 = [0,1,1,1,1,1,1,1,1,1,0]
var row_10 = [0,0,0,0,0,0,0,0,0,0,0]

var start_x = 1
var start_y = 1

var map_2d = [row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,row_9,row_10]

# Called when the node enters the scene tree for the first time.
func _ready():
		print(map_2d[4][4])
