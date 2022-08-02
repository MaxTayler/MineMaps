extends Label

enum{
	CASE_A,CASE_B,CASE_C
}

var load_data = {}



# Called when the node enters the scene tree for the first time.
func _ready():
	var data_read = File.new()
	data_read.open("res://game_data.jason",File.READ)
	var data_cdb = parse_json( data_read.get_as_text() )
	data_read.close()

	for sheet in data_cdb["sheets"]:
		if sheet["name"] == "load_data":
			var sorted_dict = {}
			for entry in sheet["lines"]:
				var new_entry = entry.duplicate()
				new_entry.erase("name")
				sorted_dict[ entry["name"]] = new_entry
			return sorted_dict
			
	
