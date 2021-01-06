extends Popup
onready var in_inventory = false

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("inventory"):
			if in_inventory == false:
				show()
				in_inventory = true
				return
			if in_inventory == true:
				hide()
				in_inventory = false
				return
