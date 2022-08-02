extends Control


var path = "res://files/godot_test_map.prn.txt"
var map_x = 0
var map_y = 0
var value = Color(0,0,0,0)

var color_array = [Color( 0.94, 0.97, 1, 1 ), Color( 0.5, 1, 0.83, 1 ), Color( 0.54, 0.17, 0.89, 1 ),Color( 0.82, 0.41, 0.12, 1 ), Color(1,1,0,1)] #

var set = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Get_data()

func Get_data():
	var maindata = {}
	var file = File.new()
	file.open(path, file.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		maindata[maindata.size()] = data_set;
	file.close()
	print(maindata)
	return maindata


func get_array():
	value = color_array[set] 
	#value = "false to get data point"
	#$OmniLight.update_color()
	print(value)
	print(set)
	#set += 1
