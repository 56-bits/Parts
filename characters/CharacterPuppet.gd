extends Node

var position := Vector2() setget set_pos, get_pos
var movement := Vector2()
var sprint := false

var is_interpolating := false
var interpolating_pos := Vector2()

func _ready():
	pass

func _process(delta):
	if is_interpolating:
		interpolate()
	
	$character.move(movement, sprint)

puppet func update_movement(pos : Vector2, mov : Vector2, spr : bool):
	var diff := get_pos() - pos
	
#	set_pos(pos)
	
	if diff.length() < 2:
		set_pos(pos)
		is_interpolating = false
	elif diff.length() < 100:
		is_interpolating = true
		interpolating_pos = pos
	else:
		set_pos(pos)
		is_interpolating = false
	
	movement = mov
	sprint = spr

puppet func update_status():
	pass

func interpolate() -> void:
	var diff := interpolating_pos - get_pos()
	
	if diff.length() > 2:
		diff /= 4
		set_pos(get_pos() + diff)
	else:
		is_interpolating = false

func set_state(state : Dictionary):
	name = state["id"]
	$character/Name.text = state["name"]
	$character.colour = state["colour"]

func set_pos(pos : Vector2) -> void:
	$character.position = pos

func get_pos() -> Vector2:
	return $character.position