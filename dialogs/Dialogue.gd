extends Node

export(String, FILE, "*.json") var d_file

var dialogue = []
var current_dialog_id = 0
var d_active = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect.visible = false
	start()

func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	
	dialogue = load_dialogue()
	current_dialog_id = -1
	next_script()
	
func load_dialogue():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, file.READ)
		return parse_json(file.get_as_text())

func _input(event):
	if not d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	if current_dialog_id + 1 < len(dialogue):
		current_dialog_id += 1
	else:
		$NinePatchRect.visible = false
		return
	d_active = false
	#$NinePatchRect.visible = false
	
	$NinePatchRect/Name.text = dialogue[current_dialog_id]["name"]
	$NinePatchRect/Text.text = dialogue[current_dialog_id]["text"]
	d_active = true
