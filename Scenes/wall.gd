extends Area2D

func _on_wall_area_entered(area) -> void:
	if area.name == "Hand":
		area.direction = Vector2.LEFT if area.direction == Vector2.RIGHT else Vector2.RIGHT
