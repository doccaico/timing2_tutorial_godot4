extends Area2D

@onready var hand = $".."/Hand
@onready var info = $".."/Info

const FLASH_COUNT = 2
const FLASH_DURATION = 0.05

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("BUTTON_LEFT") and overlaps_area(hand):
		match name:
			"LeftGreen":
				all_flash($Dark, $".."/RightGreen/Dark)
			"RightGreen":
				all_flash($".."/LeftGreen/Dark, $Dark)
			"LeftYellow":
				all_flash($Dark, $".."/RightYellow/Dark)
			"RightYellow":
				all_flash($".."/LeftYellow/Dark, $Dark)
			"Red":
				flash($".."/Red/Dark)
		
		match name:
			"LeftGreen", "RightGreen":
				info.text = "MISS..."
			"LeftYellow", "RightYellow":
				info.text = "HIT"
			"Red":
				info.text = "CRITICAL"
		var tween = create_tween()
		info.show()
		tween.parallel().tween_property(info, "modulate:a", 0, 0.7)
		tween.parallel().tween_property(info, "position:y", 226, 0.7)
		await tween.finished
		info.hide()
		info.modulate.a = 1
		info.position.y = 330


func all_flash(left: Node, right: Node) -> void:
	var tree = get_tree()
	for _i in FLASH_COUNT:
		left.hide()
		right.hide()
		await tree.create_timer(FLASH_DURATION).timeout
		left.show()
		right.show()
		await tree.create_timer(FLASH_DURATION).timeout


func flash(node: Node) -> void:
	var tree = get_tree()
	for _i in FLASH_COUNT:
		node.hide()
		await tree.create_timer(FLASH_DURATION).timeout
		node.show()
		await tree.create_timer(FLASH_DURATION).timeout
