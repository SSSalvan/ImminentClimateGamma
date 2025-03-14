extends Node

@onready var week_counter: Label = $"Week Counter"
@onready var resource_counter: Label = $"Resource Counter"
@onready var game_manager = get_parent().get_parent()

var week: int = 1
var resource: int = 1000

func _on_end_week_pressed() -> void:

	var confirm_scene = load("res://scenes/week_end_confirmation.tscn").instantiate()
	add_child(confirm_scene)
	
	confirm_scene.move_to_front()
	
	var control_node = confirm_scene.get_node("Confirm_Week")
	
	if control_node and control_node.has_signal("confirmed"):
		print("Signal found!")  # Debugging
		control_node.confirmed.connect(self.next_week)
		control_node.confirmed.connect(self.weekly_income_resource)
	else:
		print("ERROR: Signal 'confirmed' not found!")  # Debugging
	print("Button Pressed")


func _ready():
	#print("Game Manager: ", game_manager)
	update_week_label()
	update_resource_label()
	get_tree().root.print_tree_pretty()

func next_week():
	week += 1
	update_week_label()

func weekly_income_resource():
	resource += 500
	update_resource_label()
	
func update_week_label():
	week_counter.text = "Week: " + str (week)
	print("Week Updated, Bisma Gemoy, Week: ", week)
	
func update_resource_label():
	resource_counter.text = "Resource: " + str (resource)
	print("Resource Updated, Alvan Jomoks, Current Resource: ", resource)
