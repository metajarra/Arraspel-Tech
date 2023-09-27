extends TileMap
class_name Grid

# the thing with grid based games is that you either have to fake it
# or you have to find a way to make a tile on a grid correspond to
# something with information like a player, enemy, item, etc.

enum CELL_TYPES { Empty, Player, Actor, Item, Wall }

var known_entities : Array[GridEntity]

func get_cell_at_coordinates(layer : int, coordinates : Vector2):
	var _coordinates := coordinates as Vector2i
	var cell_atlas_id = get_cell_atlas_coords(layer, _coordinates)

func _get_grid_entity_at_coordinates(coordinates: Vector2):
	pass

func _get_cell_type_at_coordinates(coordinates : Vector2):
	pass

func set_cell_at_coordinates(coordinates : Vector2):
	pass

func _set_cell_entity_at_coordinates(coordinates : Vector2):
	pass

func _set_cell_type_at_coordinates(coordinates : Vector2):
	pass
