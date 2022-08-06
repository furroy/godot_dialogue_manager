extends Node2D


onready var settings = $Settings
const dialog_folder = "res://dialog/"

func _ready():
#	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, Vector2(1920, 1080))
#	OS.window_size = Vector2(1920, 1080)
#	OS.window_position = (OS.get_screen_size() - OS.window_size) * 0.5
#	OS.window_fullscreen = false
	
	DialogueManager.connect("dialogue_finished", self, "_on_dialogue_finished")
	
#	var title = settings.get_user_value("run_title")
	var full_path = settings.get_user_value("run_resource_path")
	var dialogue_resource = load(full_path)
	SaveGame.current_id = "start"
	State.set("TESTING", true)
	# grab path relative to dialog_folder
	State.switch_scene(full_path.substr(dialog_folder.length()))
#	DialogueManager.show_example_dialogue_balloon(title, dialogue_resource)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_dialogue_finished():
#	get_tree().quit()
	pass
