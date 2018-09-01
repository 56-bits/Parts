extends "res://characters/CharacterController.gd"

func _ready():
	._ready()

func _process(delta):
	if randf() < .05:
		match randi()%4:
			0:
				movement = Vector2()
				sprint != sprint
			1:
				movement.x = -1
			2:
				movement.x = 1
			3:
				movement.y = -1
			_:
				pass
	
	$character.move(movement, sprint)
