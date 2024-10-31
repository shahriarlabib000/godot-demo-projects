extends CanvasLayer

var player_script:= preload("res://player/player.gd")

func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		%CheckBox.button_pressed = true

func _on_performance_toggled(toggled_on: bool) -> void:
	player_script.performance_mode = toggled_on
	for child in get_tree().get_nodes_in_group("bad_performer"):
		child.visible = !toggled_on


func _on_check_box_toggled(toggled_on: bool) -> void:
	var mouse_click := InputEventMouseButton.new()
	mouse_click.button_index = MOUSE_BUTTON_LEFT

	if toggled_on:
		show()
		InputMap.action_erase_event("shoot", mouse_click)
	else:
		hide()
		InputMap.action_add_event("shoot", mouse_click)
