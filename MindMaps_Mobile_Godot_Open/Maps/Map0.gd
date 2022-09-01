extends Node

var row_0 = [0,0,0,0,0,0,0]
var row_1 = [0,1,1,1,2,3,0]
var row_2 = [0,1,5,2,3,4,0]
var row_3 = [0,1,1,1,2,3,0]
var row_4 = [0,1,1,1,1,2,0]
var row_5 = [0,1,1,1,1,6,0]
var row_6 = [0,0,0,0,0,0,0]

var map_2d = [row_0,row_1,row_2,row_3,row_4,row_5,row_6]

var start_x = 2
var start_y = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Level Zero Loaded")
