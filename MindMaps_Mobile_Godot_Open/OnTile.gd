extends Light2D

var move = 24
onready var control = get_node("/root/Node2D/Control")
onready var tutorial = get_node("/root/Node2D/Tutorial")


var loc_y = 2
var loc_x = 2
var fin_y = 5 
var fin_x = 5 

func update_loc():
	loc_y = control.map_y*move+12
	loc_x = control.map_x*move+12
	set_position(Vector2(loc_x,loc_y))
	print("X:",loc_x,"Y:",loc_y)
	check()

func check():
	if loc_x == 132 and loc_y == 132:
		control.tutorial_on = false
		print("tutorial off")
		tutorial.visible = false
	print("check")

