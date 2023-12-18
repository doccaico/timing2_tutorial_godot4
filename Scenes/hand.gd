extends Area2D

const DEFAULT_SPEED = 250

var speed = DEFAULT_SPEED
var direction = Vector2.RIGHT

func _process(delta) -> void:
	position += speed * delta * direction 
