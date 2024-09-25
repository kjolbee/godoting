extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event):
	if event.is_action_pressed("enter"):
		print("enter pressed")
		print(get_tree().paused)
		if get_tree().paused:
			restart_game()

# This function restarts the game
func restart_game():
	get_tree().paused = false  # Unpause the game
	var current_scene = get_tree().current_scene  # Get the current scene
	get_tree().reload_current_scene()  # Reload the current scene
