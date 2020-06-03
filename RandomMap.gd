extends Node2D
onready var tilemap = $TileMap
var set_desert = {"sand" : 85, "dirt" : 10, "grass" : 5}
var set_plain = {"sand" : 0, "dirt" : 10, "grass" : 90}
	
func _ready():
	randomize()
	make_chunk(10,10, set_desert)
	print(tilemap.tile_set.tile_get_light_occluder ( 1 ) )


func make_chunk(width:int, height:int, set:Dictionary) -> void:
	for i in width:
		for j in height:
			var tile_name:String = set.keys()[get_random_weigths(set)]
			tilemap.set_cell(i, j, tilemap.tile_set.find_tile_by_name(tile_name))	

func get_random_weigths(set:Dictionary) -> int:
	var sum_weigths:float = 0.0
	var offset:float = 0.0
	var index:int = 0
	var rnd:float = randf()
	
	for value in set.values():
		sum_weigths += value
		
	for value in set.values():
		if rnd <= (offset + value) / sum_weigths:
			return index
		index += 1
		offset += value	
	return index
